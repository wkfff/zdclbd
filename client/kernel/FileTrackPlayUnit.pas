unit FileTrackPlayUnit;

interface
uses
  TrackPlayUnit, CmdStructUnit, MemMapping, SysUtils;
type
  (*TGpsFileHeader=packed record
    {文件版本－主版本}
    FileVerMaj:Byte;
    {文件版本－小版本}
    FileVerMin:Byte;
    Reserved  :array[0..11] of Byte;  //12个字节的保留
    {设备ID}
    DevID     :longword;
    RecCount  :longword;
    FirstDataSrvTime:TDateTime;
    FirstDataGpsTime:TDateTime;
    LastDataSrvTime :TDateTime;
    LastDataGpsTime :TDateTime;
  end;                                  *)
  PGpsFileHeader = ^TGpsFileHeader;    
  {存盘文件的头信息}
  TGpsFileHeader=packed record
    {文件版本－主版本}
    FileVerMaj:Byte;
    {文件版本－小版本}
    FileVerMin:Byte;
    Reserved  :array[0..11] of Byte;  //12个字节的保留
    {设备ID}
    DevId:string;//sjp //V2.0 DevID     :longword;
    RecCount  :longword;
    FirstDataSrvTime:TDateTime; // 服务器开始时间
    FirstDataGpsTime:TDateTime; // GPS设备开始时间
    LastDataSrvTime :TDateTime;
    LastDataGpsTime :TDateTime;
  end;

  {GPS数据的记录结构定义}
  TGpsDataRecord=packed record
    DevId:string;
    Stime:TDateTime;
    Gtime:TDateTime;
    GData:TQueryHistoryGpsData_V3; //TCmdSrvTermGpsData_V3;//TCmdSrvTermGpsData_V2; //TCmdSrvtermGpsdata;
  end;
  PGpsDataRecord = ^TGpsDataRecord;

  TFileTrackPlay = class(TTrackPlay)
  private
    FFile: TMemMapFile;
    FTimeFrom:TDateTime;
    FTimeTo:TDateTime;
    FStartPoint: PGpsDataRecord;
    procedure LoadFileHead;
    procedure CheckBuffer;
  protected
    function InnerNext(): Boolean;override;
    function InnerPrev(): Boolean;override;
    function InnerLast(): Boolean;override;
    function InnerFirst(): Boolean;override;
    procedure AfterScroll();override;
    function GetData: PQueryHistoryGpsData_V3{PCmdSrvTermGpsData_V3}{PCmdSrvtermGpsdata};override;
    procedure GoFirstPoint(ATimeFrom,ATimeTo:TDateTime);
  public
    constructor Create(const AFileName: string;ATimeFrom,ATimeTo:TDateTime);
    destructor Destroy();override;
  end;
implementation
uses
  math;
{ TFileTrackPlay }

procedure TFileTrackPlay.AfterScroll;
begin
  CheckBuffer;
end;

procedure TFileTrackPlay.CheckBuffer;
var
  i,j: Integer;
  p: PGpsDataRecord;
begin
  if Count <= 0 then Exit;
  if FBuf.DataTo = Count - 1 then Exit;
  if (FBuf.Count - FBuf.Pos - 1)>(FBuf.Size div 4) then Exit;
  if FBuf.DataFrom <> -1 then
  begin
    i := Min(FBuf.Pos,Count-1-FBuf.DataTo);
    Move(FBuf.Data[FBuf.Pos],FBuf.Data[0],FBuf.Size-FBuf.Pos);
    FBuf.Count := FBuf.Size-FBuf.Pos;
    FBuf.Pos := 0;
    FBuf.DataFrom := Current;
    p := PGpsDataRecord(PtrAdd(PByte(FStartPoint),
          SizeOf(TGpsDataRecord)*(FBuf.DataTo+1)));
    j := 0;
    while j < i do
    begin
      FBuf.Data[j+FBuf.Count] := p^.GData;
      Inc(j);
      Inc(p);
    end;
    FBuf.Count := FBuf.Count + i;
    FBuf.DataTo := FBuf.DataTo + i;
  end
  else
  begin
    i := Min(FBuf.Size,Count-1-FBuf.DataTo);
    FBuf.DataFrom := 0;
    //p := PGpsDataRecord(PtrAdd(FFile.Data,SizeOf(TGpsFileHeader)));
    p:= FStartPoint;
    j := 0;
    while j < i do
    begin
      FBuf.Data[j+FBuf.Count] := p^.GData;
      Inc(j);
      Inc(p);
    end;
    FBuf.Count := FBuf.Count + i;
    FBuf.DataTo := FBuf.DataTo + i;
  end;
end;

constructor TFileTrackPlay.Create(const AFileName: string;ATimeFrom,ATimeTo:TDateTime);
begin
  inherited Create;
  TimeFrom := ATimeFrom;
  TimeTo := ATimeTo;  
  FFile := TMemMapFile.Create(AFileName,fmOpenRead,0,True);
  LoadFileHead; 
  GoFirstPoint(ATimeFrom,ATimeTo);      //add   --sha    --找出开始点,并得到实际点数
  if FBuf.Size < FCount then
  begin
    FBuf.Size := FCount;
    SetLength(FBuf.Data,FBuf.Size);
  end;
  CheckBuffer;
end;

destructor TFileTrackPlay.Destroy;
begin
  FFile.Free;
  inherited;
end;

function TFileTrackPlay.GetData:PQueryHistoryGpsData_V3{PCmdSrvTermGpsData_V3}{PCmdSrvtermGpsdata};
begin
  Result := nil;
  if Eof then Exit;
  if (FBuf.Pos < 0)or(FBuf.Pos > FBuf.Count - 1) then Exit;
  Result := @FBuf.Data[FBuf.Pos];
end;

procedure TFileTrackPlay.GoFirstPoint(ATimeFrom, ATimeTo: TDateTime);
  //
  function Get_dichotomy(var P: PGpsDataRecord; ATimeForm,ATimeTo: TDateTime): Integer;
  var
    p1,p2,ptemp: PGpsDataRecord;
    low,high,k:integer;
  begin
    low := 1;
    high := FCount-1;
    ptemp :=P; //文件中第一个记录
    while True do
    begin
      k := (low + high) div 2;
      if low > high then
      begin
        Break;
      end;
      p1 := PGpsDataRecord(PtrAdd(PByte(ptemp),k*SizeOf(TGpsDataRecord)));
      p2 := p1;
      Dec(p2);
      if (p1^.Stime >= ATimeFrom) and (p2^.Stime < ATimeFrom) then
      begin
        p := p1;      //按输入开始时间的第一个记录的位置
        Break;
      end
      else if (p1^.Stime < ATimeFrom) then
        low := k + 1
      else
        high := k - 1;
    end;
    low := k;
    high := FCount - 2;
    //high := FCount - 2*k;
    while True do
    begin
      k := (low + high) div 2;
      p1 := PGpsDataRecord(PtrAdd(PByte(ptemp),k*SizeOf(TGpsDataRecord)));
      p2 := p1;
      Inc(p2);
      if low > high then
      begin
        if Integer(p2) = Integer(p) then Result := 0; //没有数据点时
        Result := (Integer(p2)-Integer(p)) div SizeOf(TGpsDataRecord)+1;
        Break;
      end;    
      if (p1^.Stime <= ATimeTo) and (p2^.Stime > ATimeTo) then
      begin
        Result := (Integer(p1)-Integer(p)) div SizeOf(TGpsDataRecord)+1;
        Break;
      end
      else if (p1^.Stime > ATimeTo) then
        high := k - 1
      else
        low := k + 1;
    end;
  end;
  { function Get_dichotomy(AarrTime:array of TdateTime;ATime:TDateTime;Alen:integer):integer;
   var low,high,k:integer;
   begin
     result:= -1;
     low:=0;
     high:= Alen -1 ;
     while true  do
     begin
       k := (low + high) div 2 ;
       if AarrTime[k] = ATime then
       begin
         result := k;
         break;
       end
       else if (AarrTime[k] > ATime) then
       begin
         high := k-1;
         if AarrTime[high]<Atime then
         begin
           result:=high;
           break;
         end;
       end
       else
       begin
         low := k+1 ;
         if AarrTime[low]> Atime then
         begin
           result := low;
           break;
         end;
       end;
     end;     
   end;    } {
var p:PGpsDataRecord;
    tempDateTime : array of TDateTime;
    i            : integer;
    gpsdata      : TGpsData;
    endPoint     : integer;   }
begin
  try
    FTimeFrom:= ATimeFrom;
    FTimeTo := ATimeTo;
    FStartPoint := PGpsDataRecord(PtrAdd(FFile.Data,SizeOf(TGpsFileHeader)));
    FCount := Get_dichotomy(FStartPoint,FTimeFrom,FTimeTo);
  except
  end;
  (*
  setlength(tempDateTime,Fcount);
  p := PGpsDataRecord(PtrAdd(FFile.Data,SizeOf(TGpsFileHeader)));
  for i:=0 to FCount -1 do
  begin
    TransCmdGpsData(p^.GData,gpsdata);
    tempDateTime[i] := Tdatetime(gpsdata.GpsTime)+ 1/3;//转换
    Inc(p);
  end;
  if ATimeFrom < tempDateTime[0] then       //开始点
    FStartPoint:=0
  else
  begin
    FStartPoint:= Get_dichotomy(tempDateTime,ATimeFrom,FCount);
    if ATimeFrom > tempDateTime[FStartPoint] then FStartPoint:=FStartPoint+1;
  end;
  if ATimeTo > tempDateTime[FCount-1] then  // 结束点
    endPoint:= Fcount -1
  else
  begin
    endPoint   := Get_dichotomy(tempDateTime,ATimeTo,FCount);
    if ATimeFrom < tempDateTime[endPoint] then endPoint:=endPoint - 1;
  end;
  FCount := endPoint- FStartPoint + 1;
  *)
end;

function TFileTrackPlay.InnerFirst: Boolean;
begin
  FBuf.Pos := -1;
  FBuf.DataFrom := -1;
  //如果没有全部读完就停止，则重来
  //if FBuf.Count <> FCount then FBuf.Count := 0;
  //if FBuf.DataTo <> FCount -1 then FBuf.DataTo := -1;
  FCurrent := -1;
  Result := True;
end;

function TFileTrackPlay.InnerLast: Boolean;
begin
 //等同于到 InnerFirst
end;

function TFileTrackPlay.InnerNext: Boolean;
begin
  Result := False;
  if Count <= 0 then Exit;     
  Result := FBuf.Pos < FBuf.Count - 1;
  FCurrent := FCurrent + 1;
  FBuf.Pos := FBuf.Pos + 1;
end;

function TFileTrackPlay.InnerPrev: Boolean;
begin
  Result := False;
  if Count <= 0 then Exit;
  Result := FBuf.Pos > 0;
  if not Result then Exit;
  FBuf.Pos := FBuf.Pos - 1;
  FCurrent := FCurrent - 1;
end;

procedure TFileTrackPlay.LoadFileHead;
var
  ph: PGpsFileHeader;
begin
  ph := PGpsFileHeader(FFile.Data);
  DevID := ph^.DevID;
  FCount := ph^.RecCount;
end;

end.
