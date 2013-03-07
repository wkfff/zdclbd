{从服务器取数据回放
　用线程从服务器取
　调用CheckBuffer一次取50个点，直到取完}
unit RemoteTrackPlayUnit;

interface
uses
  TrackPlayUnit, CmdStructUnit, Types, SConnect, Classes,
  QExtCtrls, XMLDoc,xmldom, XMLIntf, msxmldom;
type
  TQueryCondition = packed record
//    Fact_id: Integer;
    Devid:string;// Longword;V2.0
    PageCount: Integer; // 分页后的总页数
    CurrentPage: Integer; // 当前第几页，从1开始
    DataFrom: TDateTime;
    DataTo: TDateTime;
    StartIndex: Integer;
    GetCount: Integer;
  end;

  TReadRemoteData = class;

  TRemoteTrackPlay = class(TTrackPlay)
  private
    FRead: TReadRemoteData;
    FCountPerTime: Integer;
    procedure FReadGetData(Sender: TObject);
    procedure CheckBuffer;
    procedure SetCountPerTime(const Value: Integer);
  protected
    function InnerNext(): Boolean;override;
    function InnerPrev(): Boolean;override;
    function InnerLast(): Boolean;override;
    function InnerFirst(): Boolean;override;
    procedure AfterScroll();override;
    function GetData: PQueryHistoryGpsData_V3 {PCmdSrvTermGpsData_V3}{PCmdSrvtermGpsdata};override;
  public
    constructor Create(ADevID: string; ATimeFrom,ATimeTo: TDateTime);
    destructor Destroy;override;

    procedure QueryHisData(ADevID: string; ATimeFrom,ATimeTo: TDateTime);

    procedure SetNewCount(newCount: Integer);
    procedure AddGpsData(gpsData: TQueryHistoryGpsData_V3);

    property CountPerTime: Integer read FCountPerTime write SetCountPerTime;

  end;

  TReadRemoteData=class//(TThread)
  private
    FConnection: TSocketConnection;
    FInsertCount: Integer; // 一次查询所查到的数据条数
    DataBuf: array of TQueryHistoryGpsData_V3; //TCmdSrvTermGpsData_V3;

    FBuffer: TByteDynArray;
    FUserName: string;
    FUserPass: string;
    FQueryCondition: TQueryCondition;
    FOnGetData: TNotifyEvent;
    procedure DoOnGetData();
    procedure SetOnGetData(const Value: TNotifyEvent);
    procedure GetDataFromBs;
  protected
    //procedure Execute();override;    
    property OnGetData: TNotifyEvent read FOnGetData write SetOnGetData;
  public
    constructor Create;//(CreateSuspended: Boolean);
    destructor Destroy;override;
    procedure Connect2Bs;
  end;

implementation
uses
  uGloabVar, UserUnit, math, SysUtils,Forms,BusinessServe_TLB, DateUtils, DBClient;
{ TReadRemoteData }

procedure TReadRemoteData.Connect2Bs;
var
  infoServer: IBusinessDisp;
begin
  if not FConnection.Connected then
  begin
    FConnection.Connected := True;
    try
      infoServer := IBusinessDisp(IDispatch(FConnection.AppServer));
      infoServer.Login(FUserName,FUserPass,0);
    except
      FConnection.Connected := False;
    end;
  end; 
end;

constructor TReadRemoteData.Create;//(CreateSuspended: Boolean);
begin
  FConnection := TSocketConnection.Create(nil);  
  //inherited Create(CreateSuspended);
end;

destructor TReadRemoteData.Destroy;
begin
  if FConnection<> nil then FreeAndNil(FConnection);  
  inherited;
end;

procedure TReadRemoteData.DoOnGetData;
begin
  if Assigned(FOnGetData) then
    FOnGetData(Self);
end;
    (*
procedure TReadRemoteData.Execute;
var
  info,info1: OleVariant;
  i: Integer;
  infoServer:IBusinessDisp;
begin
  while not Terminated do
  begin
    try
     { if not FConnection.Connected then
      begin
        FConnection.Connected := True;
        try
          FConnection.AppServer.Login(FUserName,FUserPass,0);
        except
          FConnection.Connected := False;
        end;
      end; }
      if not FConnection.Connected then
        Synchronize(Connect2Bs);
      if FConnection.Connected then
      begin
       { info1 := FConnection.AppServer.QueryHistory(FQueryCondition.Devid,
          FQueryCondition.DataFrom,FQueryCondition.DataTo,
          FQueryCondition.StartIndex,FQueryCondition.GetCount,info);  }

        infoServer := IBusinessDisp(IDispatch(FConnection.AppServer));
        info1 := infoServer.QueryHistory(FQueryCondition.Devid,
          FQueryCondition.DataFrom,FQueryCondition.DataTo,
          FQueryCondition.StartIndex,FQueryCondition.GetCount,info);
        i := info1;
        if i>0 then
          FBuffer := info
        else
          SetLength(FBuffer,0);
      end;
      Synchronize(DoOnGetData);
      Suspend;
    except

    end;
  end;
end;           *)

procedure TReadRemoteData.GetDataFromBs;
var
  info,info1: OleVariant;
  i: Integer;
  strXml: string;
  XMLDoc: TXMLDocument;
  t: TComponent;
  node: IXMLNode;
  dateStr: string;
  S: string;
  FTemp: TClientDataSet;
begin
  try
    FTemp := Tclientdataset.Create(nil);

    FTemp.XMLData := BS.QueryHistoryDataRetrunDelphiXml(FQueryCondition.Devid,0,
                                    FQueryCondition.DataFrom,FQueryCondition.DataTo,
                                    FQueryCondition.GetCount,FQueryCondition.CurrentPage);

    FTemp.Open;

    FInsertCount := 0;
    SetLength(DataBuf, FQueryCondition.GetCount);

    FTemp.First;
    for i := 0 to FTemp.RecordCount - 1 do
    begin

      DataBuf[FInsertCount].WarningSign :=  StringToLongWord(FTemp.FieldByName('ALARMFLAG').AsString);// StringToLongWord(Trim(node.ChildNodes['ALARMFLAG'].Text));
      DataBuf[FInsertCount].State := StringToLongWord(FTemp.FieldByName('STATE').AsString); //StringToLongWord(Trim(node.ChildNodes['STATE'].Text));

      DataBuf[FInsertCount].Latitude := FTemp.FieldByName('LATITUDE').AsFloat; //StringToFloat(Trim(node.ChildNodes['LATITUDE'].Text));
      DataBuf[FInsertCount].Longitude := FTemp.FieldByName('LONGITUDE').AsFloat; //StringToFloat(Trim(node.ChildNodes['LONGITUDE'].Text));

      DataBuf[FInsertCount].Speed := FTemp.FieldByName('SPEED').AsInteger; //StringToInteger(Trim(node.ChildNodes['SPEED'].Text));
      DataBuf[FInsertCount].Orientation := FTemp.FieldByName('ORIENTATION').AsInteger; //StringToInteger(Trim(node.ChildNodes['ORIENTATION'].Text));


      DataBuf[FInsertCount].GpsTime := FTemp.FieldByName('GPSTIME').AsDateTime; //StrToDateTime(copy(Trim(node.ChildNodes['GPSTIME'].Text),1,10) + ' '+
                                      //copy(Trim(node.ChildNodes['GPSTIME'].Text),12,8));
      DataBuf[FInsertCount].ServerTime := FTemp.FieldByName('STIME').AsDateTime;  //StrToDateTime(copy(Trim(node.ChildNodes['STIME'].Text),1,10) + ' '+
                                      //copy(Trim(node.ChildNodes['STIME'].Text),12,8));

      // 插入数据
      FInsertCount := FInsertCount + 1;

      FTemp.Next;
    end;
    DoOnGetData;
  finally
    FTemp.Close;
    FTemp.Free;
  end;
  {try
    try
      t := TComponent.Create(nil);
      strXml := '<?xml version="1.0" encoding="GB2312"?>'
              +  Bs.QueryHistoryData(FQueryCondition.Devid,FQueryCondition.Fact_id,
                                    FQueryCondition.DataFrom,FQueryCondition.DataTo,
                                    FQueryCondition.GetCount,FQueryCondition.CurrentPage);


      XMLDoc := TXMLDocument.create(t);

      XMLDoc.XML.Text := strXml;
      XMLDoc.Active := true;
      XMLDoc.Encoding := 'gb2312';

      FInsertCount := 0;
      SetLength(DataBuf, FQueryCondition.GetCount);

      node := XMLDoc.DocumentElement.ChildNodes['Table'];
      if node.ChildNodes.Count <= 0 then
        Exit;
      while (node <> nil ) do
      begin
        DataBuf[FInsertCount].WarningSign := StringToLongWord(Trim(node.ChildNodes['ALARMFLAG'].Text));
        DataBuf[FInsertCount].State := StringToLongWord(Trim(node.ChildNodes['STATE'].Text));

        DataBuf[FInsertCount].Latitude := StringToFloat(Trim(node.ChildNodes['LATITUDE'].Text));
        DataBuf[FInsertCount].Longitude := StringToFloat(Trim(node.ChildNodes['LONGITUDE'].Text));

        DataBuf[FInsertCount].Speed := StringToInteger(Trim(node.ChildNodes['SPEED'].Text));
        DataBuf[FInsertCount].Orientation := StringToInteger(Trim(node.ChildNodes['ORIENTATION'].Text));


        DataBuf[FInsertCount].GpsTime := StrToDateTime(copy(Trim(node.ChildNodes['GPSTIME'].Text),1,10) + ' '+
                                        copy(Trim(node.ChildNodes['GPSTIME'].Text),12,8));
        DataBuf[FInsertCount].ServerTime := StrToDateTime(copy(Trim(node.ChildNodes['STIME'].Text),1,10) + ' '+
                                        copy(Trim(node.ChildNodes['STIME'].Text),12,8));

        node := node.NextSibling;
        // 插入数据
        FInsertCount := FInsertCount + 1;
      end;

      DoOnGetData;
    except
      on E: exception do
      begin
        raise Exception.Create('无法连接业务服务器！ ');
      end;
    end;
  finally
    XMLDoc.Free;
    t.Free;
  end;}
end;

procedure TReadRemoteData.SetOnGetData(const Value: TNotifyEvent);
begin
  FOnGetData := Value;
end;
{ TRemoteTrackPlay }

procedure TRemoteTrackPlay.AddGpsData(gpsData: TQueryHistoryGpsData_V3);
begin
  with FBuf.Data[FBuf.insertPos] do
  begin
    WarningSign := gpsData.WarningSign;
    State := gpsData.State;
    Latitude := gpsData.Latitude;
    Longitude := gpsData.Longitude;
    Speed := gpsData.Speed;
    Orientation := gpsData.Orientation;
    GpsTime := gpsData.GpsTime;
    ServerTime := gpsData.ServerTime;
  end;

  FBuf.insertPos := FBuf.insertPos + 1;
  FBuf.Count := FBuf.Count + 1;
  FBuf.DataTo := FBuf.DataTo + 1;
end;

procedure TRemoteTrackPlay.AfterScroll;
begin
  CheckBuffer;
end;

procedure TRemoteTrackPlay.CheckBuffer;
var
  i,j: Integer;
begin
  if Count <= 0 then Exit;
  if FBuf.DataTo >= Count-1 then //FBuf.Count then
    Exit;
  {if FBuf.DataTo = Count - 1 then
  begin
   // if FRead.FConnection.Connected then
   //   FRead.FConnection.Connected := False;
    Exit;
  end;
  if (FBuf.Count = FBuf.Size)and((FBuf.Size - FBuf.Pos - 1)>(FBuf.Size div 4)) then
  begin
   // if FRead.FConnection.Connected then
   //   FRead.FConnection.Connected := False;
    Exit;
  end;
  if FBuf.DataFrom <> - 1 then
    i := FBuf.Size - FBuf.Count + FBuf.Pos
  else
    i := FBuf.Size;
  i := Min(i,Count-1-FBuf.DataTo);
  i := Min(i,CountPerTime);
  FRead.FQueryCondition.StartIndex := FBuf.DataTo+1;
  FRead.FQueryCondition.GetCount := i;          }
  //FRead.Resume; // 调用CheckBuffer一次取50个点，直到取完

  

  FRead.FQueryCondition.CurrentPage := Min(FRead.FQueryCondition.CurrentPage + 1, FRead.FQueryCondition.PageCount);
  FRead.FQueryCondition.GetCount := CountPerTime;

  FRead.GetDataFromBs;
end;

constructor TRemoteTrackPlay.Create(ADevID: string;ATimeFrom,ATimeTo: TDateTime);
begin
  inherited Create;
  FCountPerTime := 200;  // 每次用线程　从服务器取的个数
  FRead := TReadRemoteData.Create;//(True);
  //FRead.FConnection.Host := GlobalParam.Business.Host;
  //FRead.FConnection.Port := GlobalParam.Business.Port;
  //FRead.FConnection.ServerGUID := GlobalParam.BizGuid;
  //FRead.FConnection.InterceptGUID := GlobalParam.InterceptGUID;
  DevID := ADevID;
//  Fact_id := AFact_id;
  TimeFrom := ATimeFrom;
  TimeTo := ATimeTo;

  try
    FCount := Bs.QueryHistoryCount(ADevID, 0, ATimeFrom, ATimeTo);
  except
    on E: Exception do
        raise Exception.Create('无法连接业务服务器！ '); //messagebox(0, pchar(E.message), '提示', mb_ok + mb_iconinformation);
  end;
  //FBuf.Count := FCount;
  FBuf.Pos := 0;
  if FBuf.Size < FCount then
  begin
    FBuf.Size := FCount;
    SetLength(FBuf.Data,FBuf.Size);
  end;
  FBuf.insertPos := 0;
  FRead.FUserName := current_user.UserName;
  FRead.FUserPass := current_user.Password;
//  FRead.FQueryCondition.Fact_id := AFact_id;
  FRead.FQueryCondition.Devid := ADevID;

  if (FCount mod FCountPerTime) = 0 then
    FRead.FQueryCondition.PageCount := FCount div FCountPerTime
  else
    FRead.FQueryCondition.PageCount := (FCount div FCountPerTime) + 1;

  FRead.FQueryCondition.CurrentPage := 0; // 从1开始取数据
  FRead.FQueryCondition.DataFrom := ATimeFrom;
  FRead.FQueryCondition.DataTo := ATimeTo;
  FRead.OnGetData := FReadGetData;
  FCountPerTime := FCount;
  //FRead.FreeOnTerminate := True;//

  CheckBuffer;
end;

destructor TRemoteTrackPlay.Destroy;
begin
  //FRead.Terminate; //
  if FRead<>nil then FreeAndNil(FRead);  //sha 20050415
  inherited;
end;

procedure TRemoteTrackPlay.FReadGetData(Sender: TObject);
var
  buflen: Integer;
  i: Integer;
begin
  try
   { buflen := Length(FRead.FBuffer) div sizeOf(TCmdSrvtermGpsdata_V3);//V3.0//sizeOf(TCmdSrvtermGpsdata_V2);//V2.0 SizeOf(TCmdSrvtermGpsdata);
    if buflen = 0 then Exit;
    if FBuf.DataFrom = -1 then FBuf.DataFrom := 0;
    if (FBuf.Size - FBuf.Count) < buflen then
    begin //move fbuffer
      Move(FBuf.Data[FBuf.Pos],FBuf.Data[0],FBuf.Count-FBuf.Pos);
      FBuf.DataFrom := FBuf.DataFrom + FBuf.Count-FBuf.Pos;
      FBuf.Count := FBuf.Count-FBuf.Pos;
      FBuf.Pos := 0;
    end;
    Move(FRead.FBuffer[0],FBuf.Data[FBuf.Count],buflen*sizeOf(TCmdSrvtermGpsdata_V3));//V3.0//sizeOf(TCmdSrvtermGpsdata_V2));//V2.0 SizeOf(TCmdSrvtermGpsdata);//SizeOf(TCmdSrvtermGpsdata));
    FBuf.Count := FBuf.Count + buflen;
    FBuf.DataTo := FRead.FQueryCondition.StartIndex+buflen-1;  }

    for i:=0 to FRead.FInsertCount-1 do
    begin
      FBuf.Data[FBuf.insertPos] := FRead.DataBuf[i];
      FBuf.insertPos := FBuf.insertPos + 1;
    end;
    FBuf.Count := FBuf.Count + FRead.FInsertCount;
    FBuf.DataTo := FBuf.DataTo + FRead.FInsertCount; 
  except
  end;
end;

function TRemoteTrackPlay.GetData: PQueryHistoryGpsData_V3 {PCmdSrvTermGpsData_V3}{PCmdSrvtermGpsdata};
begin
  Result := nil;
  if Eof then Exit;
  if (FBuf.Pos < 0)or(FBuf.Pos >= FBuf.Count) then Exit;
  Result := @FBuf.Data[FBuf.Pos];
end;

function TRemoteTrackPlay.InnerFirst: Boolean;
begin
  FBuf.Pos := -1;
  FBuf.DataFrom := -1;
  //如果没有全部读完就停止，则重来
  //if FBuf.Count <> FCount then FBuf.Count := 0;
  //if FBuf.DataTo <> FCount -1 then FBuf.DataTo := -1;
  FCurrent := -1;
  Result := True;
end;

function TRemoteTrackPlay.InnerLast: Boolean;
begin
  //等同于到 InnerFirst
  {FBuf.pos:= -1;
  FBuf.DataFrom:= -1;
  //如果没有全部读完就停止，则重来
  //if FBuf.Count <> FCount then FBuf.Count := 0;
  //if FBuf.DataTo <> FCount -1 then FBuf.DataTo := -1;
  FCurrent:= -1;
  Result:= true;   }
end;

function TRemoteTrackPlay.InnerNext: Boolean;
begin
  Result := False;
  if Count <= 0 then Exit;
  Result := FBuf.Pos < FBuf.Count - 1;
  FBuf.Pos := FBuf.Pos + 1;
  FCurrent := FCurrent + 1;
end;

function TRemoteTrackPlay.InnerPrev: Boolean;
begin
  Result := False;
  if Count <= 0 then Exit;
  Result := FBuf.Pos > 0;
  if not Result then Exit;
  FBuf.Pos := FBuf.Pos - 1;
  FCurrent := FCurrent - 1;
end;

procedure TRemoteTrackPlay.QueryHisData(ADevID: string; ATimeFrom,
  ATimeTo: TDateTime);
var
  currCount: Integer;
begin
  currCount := Bs.QueryHistoryCount(ADevID, 0, ATimeFrom, ATimeTo);
  if currCount <= 0 then
    Exit;

  FCount := FCount + currCount;
  if FBuf.Size < FCount then
  begin
    FBuf.Size := FCount;
    SetLength(FBuf.Data,FBuf.Size);
  end;
  FCountPerTime := currCount;
  FRead.FQueryCondition.PageCount := 1;
  FRead.FQueryCondition.CurrentPage := 0; // 从1开始取数据
  FRead.FQueryCondition.DataFrom := ATimeFrom;
  FRead.FQueryCondition.DataTo := ATimeTo;
  CheckBuffer;
end;

procedure TRemoteTrackPlay.SetCountPerTime(const Value: Integer);
begin
  FCountPerTime := Value;
end;

procedure TRemoteTrackPlay.SetNewCount(newCount: Integer);
begin
  FCount := newCount;
  FBuf.Size := FCount;
  SetLength(FBuf.Data,FBuf.Size);
end;

end.
