unit QueryThreadUnit;

interface

uses
  Classes, Types, Windows, ActiveX, SysUtils, Buttons, Forms, StdCtrls, DB, DBClient,
  Controls, Variants, ComCtrls, cxTL, CarUnit, DateUtils, ConstDefineUnit, CmdStructUnit,
  uGloabVar, VSMSClientUnit;

type
  TSingleDev = packed record
    carno     : string;
    datetime:string;
    speed:string;
    jd:string;
    wd:string;
  end;
  pSingleDev = ^TSingleDev;

  TQueryReturnInfo = procedure(AInfo: OleVariant) of object;
  TQueryDrundataCount = procedure(AInfo: Integer) of object;

  QueryThread = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  public
  end;

  TQueryDevPostion = class(TThread)          // 区域查车
  private
    FDevIdStr: string;
    FFromDate, FToDate: string;
    FBeginLat, FBeginLong, FEndLat, FEndLong: Integer;

    FBitBtn: TSpeedButton;

    dev:TDevice;
    dataSet:TClientDataSet;
    FInfo: OleVariant;

    FQueryReturnInfo: TQueryReturnInfo;
    procedure SetInfo;
    procedure AddPostionList;
  protected
    procedure Execute; override;
  public
    ProgressBar1: TProgressBar;
    ListViewTo: TListView;
    CheckBoxAll: TCheckBox;
    CheckBoxFirst: TCheckBox;
    CheckBoxLast: TCheckBox;
    CarList: TcxTreeList;
    isStop: Boolean;
    ASingledev: pSingleDev;
    constructor Create(DevIdStr: string; FromDate: string; ToDate: string; beginLat, beginLong, endLat,
                       endLong: Integer; BitBtn: TSpeedButton);
    destructor Destroy(); override;
    property OnQueryReturn: TQueryReturnInfo read FQueryReturnInfo write FQueryReturnInfo;
  end;

  TFindCarInArea = class(TThread)     // 失物查找
  private
    Fcartype_id: Integer;
    Fcar_Color: WideString;
    FdevIdList: WideString;
    Fgroup_Id: Integer;
    Fgroup_IdList: WideString;
    FbeginTime: WideString;
    FendTime: WideString;
    FbeginLat: Double;
    FbeginLong: Double;
    FendLat: Double;
    FendLong: Double;

    FBitBtn: TBitBtn;
    FProgressBar: TProgressBar;

    FInfo: OleVariant;

    FQueryReturnInfo: TQueryReturnInfo;
    procedure SetInfo;
  protected
    procedure Execute; override;
  public
    constructor Create(const cartype_id: Integer; const car_Color: WideString; const devIdList: WideString;
                      const group_Id: Integer; const group_IdList: WideString; const beginTime: WideString;
                      const endTime: WideString; const beginLat: Double; const beginLong: Double;
                      const endLat: Double; const endLong: Double; const BitBtn: TBitBtn; ProgressBar: TProgressBar);
    destructor Destroy(); override;
    property OnQueryReturn: TQueryReturnInfo read FQueryReturnInfo write FQueryReturnInfo;
  end;

  TQueryTaxiRunDataCount = class(TThread)  // 查询客次明细的数量
  private
    Ffromtime: WideString;
    Ftotime: WideString;
    Ffact_Id: Integer;
    Fdev_Id: Integer;
    Fgroup_id: Integer;
    Fgroup_IdList: WideString;

    FBitbtn: TSpeedButton;
    FInfo: Integer;

    FQueryReturnInfo: TQueryDrundataCount;
    procedure SetInfo;
  protected
    procedure Execute; override;
  public
    constructor Create(fromtime: WideString; totime: WideString; fact_Id: Integer;
                       dev_Id: Integer; group_id: Integer; group_IdList: WideString;
                       bitbtn: TSpeedButton);
    destructor Destroy(); override;
    property OnQueryReturn: TQueryDrundataCount read FQueryReturnInfo write FQueryReturnInfo;
  end;

  TQueryTaxiRunData = class(TThread)  // 查询客次明细的内容
  private
    Ffromtime: WideString; Ftotime: WideString;
    FPageSize: Integer; FCurrPageIndex: Integer;
    Ffact_Id: Integer; Fdev_Id: Integer; Fgroup_id: Integer;
    Fgroup_IdList: WideString;

    FQueryReturnInfo: TQueryReturnInfo;

    FBitbtn: TGroupBox;
    FInfo: OleVariant;
    procedure SetInfo;
  protected
    procedure Execute; override;
  public
    constructor Create(fromtime: WideString; totime: WideString;
                       PageSize: Integer; CurrPageIndex: Integer;
                       fact_Id: Integer; dev_Id: Integer; group_id: Integer;
                       group_IdList: WideString; bitbtn: TGroupBox);
    destructor Destroy(); override;
    property OnQueryReturn: TQueryReturnInfo read FQueryReturnInfo write FQueryReturnInfo;
  end;

  TTaxiMetaMoneryMonthTj = class(TThread)   // 营运金额按月分布
  private
    Fyf: WideString;
    Ffact_id: Integer;
    Fdev_Id: Integer;
    Fgroup_id: Integer;
    Fgroup_IdList: WideString;
    Fbitbtn: TSpeedButton;

    FQueryReturnInfo: TQueryReturnInfo;
    FInfo: OleVariant;
    procedure SetInfo;
  protected
    procedure Execute; override;
  public
    constructor Create(const yf: WideString; const fact_id: Integer;
                       const dev_Id: Integer; const group_id: Integer;
                       const group_IdList: WideString; bitbtn: TSpeedButton);
    destructor Destroy(); override;
    property OnQueryReturn: TQueryReturnInfo read FQueryReturnInfo write FQueryReturnInfo;
  end;

  TStatTaxRunDataByDay = class(TThread)   // 营运金额按天分布
  private
    Ffromtime: WideString;
    Ftotime: WideString;
    Fgroup_id: Integer;
    Fgroup_IdList: WideString;
    Fbitbtn: TSpeedButton;

    FQueryReturnInfo: TQueryReturnInfo;
    FInfo: OleVariant;
    procedure SetInfo;
  protected
    procedure Execute; override;
  public
    constructor Create(const fromtime: WideString; const totime: WideString;
                       const group_id: Integer; const group_IdList: WideString;
                       bitbtn: TSpeedButton);
    destructor Destroy(); override;
    property OnQueryReturn: TQueryReturnInfo read FQueryReturnInfo write FQueryReturnInfo;
  end;

  TTaxiRunDataTjByMonth = class(TThread)    // 营运情况调查
  private
    Ffromtime: WideString;
    Ftotime: WideString;
    Fgroup_id: Integer;
    Fgroup_IdList: WideString;
    Fbitbtn: TSpeedButton;

    FInfo: OleVariant;
    FQueryReturnInfo: TQueryReturnInfo;
    procedure SetInfo;
  protected
    procedure Execute; override;
  public
    constructor Create(const fromtime: WideString; const totime: WideString;
                       const group_id: Integer; const group_IdList: WideString;
                       bitbtn: TSpeedButton);
    destructor Destroy(); override;
    property OnQueryReturn: TQueryReturnInfo read FQueryReturnInfo write FQueryReturnInfo;
  end;

  TQueryTaxiTj = class(TThread)   // 营运数据情况
  private
    Fyf: WideString;
    Fgroup_id: Integer;
    Fgroup_IdList: WideString;
    Fbitbtn: TSpeedButton;

    FInfo: OleVariant;
    FQueryReturnInfo: TQueryReturnInfo;
    procedure SetInfo;
  protected
    procedure Execute; override;
  public
    constructor Create(const yf: WideString; const group_id: Integer;
                       const group_IdList: WideString; bitbtn: TSpeedButton);
    destructor Destroy(); override;
    property OnQueryReturn: TQueryReturnInfo read FQueryReturnInfo write FQueryReturnInfo;
  end;

  TQuery_ICCardTradeDataList2 = class(TThread)     // 一卡通刷卡交易记录
  private
    FfromTime: WideString;
    FtoTime: WideString;
    FisUpok: Integer;
    Fdev_Id: Integer;
    Ffact_Id: Integer;
    Fgroup_Id: Integer;
    Fgroup_IdList: WideString;
    Fbitbtn: TSpeedButton;

    FInfo: OleVariant;
    FQueryReturnInfo: TQueryReturnInfo;
    procedure SetInfo;
  protected
    procedure Execute; override;
  public
    constructor Create(const fromTime: WideString; const toTime: WideString;
                        const isUpok: Integer; const dev_Id: Integer; const fact_Id: Integer;
                        const group_Id: Integer; const group_IdList: WideString;
                        bitbtn: TSpeedButton);
    destructor Destroy(); override;
    property OnQueryReturn: TQueryReturnInfo read FQueryReturnInfo write FQueryReturnInfo;
  end;

  TQuery_DbRunData = class(TThread)
  private
    Ffromtime, Ftotime: WideString;
    Ffact_Id, Fdev_Id, Fgroup_Id: Integer;
    Fgroup_IdList: WideString; Fbitbtn: TSpeedButton;

    FInfo: OleVariant;
    FQueryReturnInfo: TQueryReturnInfo;
    procedure SetInfo;
  protected
    procedure Execute; override;
  public
    constructor Create(fromtime, totime: WideString; fact_Id, dev_Id, group_Id: Integer;
                       group_IdList: WideString; bitbtn: TSpeedButton);
    destructor Destroy(); override;
    property OnQueryReturn: TQueryReturnInfo read FQueryReturnInfo write FQueryReturnInfo;
  end;

  TQuery_CmdLogList = class(TThread)         // 查询发送命令日志信息
  private
    Ffromtime: WideString; Ftotime: WideString;
    FisQueryAllUserSended: Boolean;
    Fdev_id: Integer; Ffact_Id: Integer;
    Fgroup_id: Integer;
    Fgroup_IdList: WideString;
    Fbitbtn: TSpeedButton;

    FInfo: OleVariant;
    FQueryReturnInfo: TQueryReturnInfo;
    procedure SetInfo;
  protected
    procedure Execute; override;
  public
    constructor Create(const fromtime: WideString; const totime: WideString;
                       const isQueryAllUserSended: Boolean; const dev_id: Integer; const fact_Id: Integer;
                       const group_id: Integer; const group_IdList: WideString; bitbtn: TSpeedButton);
    destructor Destroy(); override;
    property OnQueryReturn: TQueryReturnInfo read FQueryReturnInfo write FQueryReturnInfo;
  end;

  TQueryMessageList = class(TThread)
  private
    Ffromtime, Ftotime: WideString;
    Fmsg_type: Integer;
    Fmsg_state: Integer;
    FisQueryAllUserSended: Boolean;
    Fdev_id, Ffact_Id, Fgroup_Id: Integer;
    Fgroup_IdList: WideString;
    Fbitbtn: TSpeedButton;

    FInfo: OleVariant;
    FQueryReturnInfo: TQueryReturnInfo;
    procedure SetInfo;
  protected
    procedure Execute; override;
  public
    constructor Create(fromtime: WideString; totime: WideString; msg_type: Integer;
                       msg_state: Integer; isQueryAllUserSended: Boolean;
                       dev_id: Integer; fact_Id: Integer; group_Id: Integer;
                       group_IdList: WideString; bitbtn: TSpeedButton);
    destructor Destroy(); override;
    property OnQueryReturn: TQueryReturnInfo read FQueryReturnInfo write FQueryReturnInfo;
  end;

  TQuery_ServeJudge = class(TThread)
  private
    Ffromtime, Ftotime: WideString;
    Ffact_Id, Fdev_Id, Fgroup_Id: Integer;
    Fgroup_IdList: WideString;
    Fbitbtn: TSpeedButton;

    FInfo: OleVariant;
    FQueryReturnInfo: TQueryReturnInfo;
    procedure SetInfo;
  protected
    procedure Execute; override;
  public
    constructor Create(fromtime: WideString; totime: WideString; fact_Id: Integer;
                       dev_Id: Integer;  group_Id: Integer; group_IdList: WideString;
                       bitbtn: TSpeedButton);
    destructor Destroy(); override;
    property OnQueryReturn: TQueryReturnInfo read FQueryReturnInfo write FQueryReturnInfo;
  end;

  TQueryPhoto = class(TThread)
  private
    PhotoInfo: PPhotoInfo;
    byteArr: TByteDynArray;
    FIsStop: Boolean;
    procedure SetInfo;
    procedure DeleteReceivePicIndex;
  protected
    procedure Execute; override;
  public
    constructor Create();
    destructor Destroy(); override;
    property IsStop: Boolean read FIsStop write FIsStop;
  end;

implementation
uses Service;
{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure QueryThread.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ QueryThread }

procedure QueryThread.Execute;
begin
  { Place thread code here }
end;

{ TQueryDevPostion }

procedure TQueryDevPostion.AddPostionList;
var
  note:TcxTreeListNode;

  procedure addList;
  begin // ProgressBar2.StepIt;
    note:=CarList.Add;
    note.Values[0]:=dev.Car.No;
    note.Values[1]:=dataSet.FindField('stime').AsString;
    note.Values[2]:=FormatFloat('##0.0', dataSet.FindField('speed').AsInteger/10);
    note.Values[3]:=FormatFloat('##0.000000',(dataSet.FindField('Longitude').AsFloat));
    note.Values[4]:=FormatFloat('##0.000000',(dataSet.FindField('Latitude').AsFloat));
    //==============存车辆信息===============================//
    new(ASingledev);
    ASingledev.carno:=note.Values[0];
    ASingledev.datetime:=note.Values[1];
    ASingledev.speed:=note.Values[2];
    ASingledev.jd:=note.Values[3];
    ASingledev.wd:=note.Values[4];
    carlist1.Add(ASingledev);
  end;
begin
  if (dataSet <> nil) and (dataSet.RecordCount > 0) then
  begin
    Application.ProcessMessages;
    if CheckBoxAll.Checked then //显示所有数据
    begin
      dataSet.First;
      while(not dataSet.Eof) do
      begin
         AddList;
         dataSet.Next;
      end;
    end
    else
    begin
      if CheckBoxFirst.Checked then //只显示最早时间
      begin
          dataSet.First;
          AddList;
      end;
      if dataSet.RecordCount<>1 then
      begin
        if CheckBoxLast.Checked then  //只显示最晚时间
        begin
            dataSet.Last;
            AddList;
        end;
      end;
    end;
  end;
end;

constructor TQueryDevPostion.Create(DevIdStr, FromDate, ToDate: string;
  beginLat, beginLong, endLat, endLong: Integer; BitBtn: TSpeedButton);
begin
  inherited Create(False);
  FreeOnTerminate := True;

  FDevIdStr := DevIdStr;
  FFromDate := FromDate;
  FToDate := ToDate;
  FBeginLat := beginLat;
  FBeginLong := beginLong;
  FEndLat := endLat;
  FEndLong := endLong;
  FBitBtn := bitBtn;

  dataSet := TClientDataSet.Create(nil);
end;

destructor TQueryDevPostion.Destroy;
begin

  inherited;
end;

procedure TQueryDevPostion.Execute;
var
  i,j,k:integer;
  devIdListStr: string;
begin
  try
    coinitialize(nil);
    try
      Fbitbtn.Enabled := False;

      {for i:=0 to ListViewTo.Items.Count-1 do
      begin
        if i = 0 then
        begin
          dev:=TDevice(ListViewTo.Items.Item[i].Data);
          devIdListStr := FormatCurr('00' ,dev.fact_id) +  FormatCurr('00000000' ,dev.Id);
        end
        else
        begin
          dev:=TDevice(ListViewTo.Items.Item[i].Data);
          devIdListStr := devIdListStr + ',' + FormatCurr('00' ,dev.fact_id) +  FormatCurr('00000000' ,dev.Id);
        end;
      end;
      ProgressBar1.Position:=20;
      try
        dataSet := bs.QueryDevPostion_quickly(devIdListStr, FFromDate, FToDate, FBeginLat, FBeginLong, FEndLat, FEndLong);
      except
        on e: Exception do
        begin
          messagebox(handle, QUERY_WARNING_INFO, '提示', mb_ok + mb_iconinformation);
          ProgressBar1.Position:=0;
          exit;
        end;
      end;
      Synchronize(AddPostionList);   }
      
      for i := 0 to ListViewTo.Items.Count-1 do
      begin
        if isStop then break;
        dev:=TDevice(ListViewTo.Items.Item[i].Data);
        Application.ProcessMessages;
        ProgressBar1.StepIt;
        try
          dataSet := bs.QueryDevPostion(dev.fact_id, dev.Id, FFromDate, FToDate, FBeginLat, FBeginLong, FEndLat, FEndLong);
        except
          on e: Exception do
          begin
            messagebox(handle, QUERY_WARNING_INFO, '提示', mb_ok + mb_iconinformation);
            ProgressBar1.Position:=0;
            exit;
          end;
        end;

        Synchronize(AddPostionList);
        Application.ProcessMessages;
      end;  
      Synchronize(SetInfo);
    except
      on E: Exception do
      begin
        messagebox(0, pchar(E.message), '提示', mb_ok + MB_ICONWARNING);
        ProgressBar1.Position:=0;
      end;
    end;
  finally
    Fbitbtn.Enabled := True;
    CoUninitialize;
  end;
end;

procedure TQueryDevPostion.SetInfo;
begin
  if Assigned(FQueryReturnInfo) then
  begin
    FQueryReturnInfo(FInfo);
  end;
end;

{ TFindCarInArea }

constructor TFindCarInArea.Create(const cartype_id: Integer;
                                  const car_Color, devIdList: WideString; const group_Id: Integer;
                                  const group_IdList, beginTime, endTime: WideString; const beginLat,
                                  beginLong, endLat, endLong: Double; const BitBtn: TBitBtn;
                                  ProgressBar: TProgressBar);
begin
  inherited Create(False);
  FreeOnTerminate := True;

  Fcartype_id := cartype_id;
  Fcar_Color := car_Color;
  FdevIdList := devIdList;
  Fgroup_Id := group_Id;
  Fgroup_IdList := group_IdList;
  FbeginTime := beginTime;
  FendTime := endTime;
  FbeginLat := beginLat;
  FbeginLong := beginLong;
  FendLat := endLat;
  FendLong := endLong;
  FBitBtn := bitBtn;
  FProgressBar := ProgressBar;

end;

destructor TFindCarInArea.Destroy;
begin

  inherited;
end;

procedure TFindCarInArea.Execute;
begin
  try
    coinitialize(nil);
    try
      Fbitbtn.Enabled := False;

      try
        FInfo := Bs.FindCarInArea(Fcartype_id, Fcar_Color, FdevIdList, Fgroup_Id, Fgroup_IdList,
                                  FbeginTime, FendTime, FbeginLat, FbeginLong, FendLat, FendLong)
      except
        on e: Exception do
        begin
          messagebox(handle, QUERY_WARNING_INFO, '提示', mb_ok + mb_iconinformation);
          FProgressBar.Position:=0;
          exit;
        end;
      end;

      Synchronize(SetInfo);
    except
      on E: Exception do
      begin
        messagebox(0, pchar(E.message), '提示', mb_ok + MB_ICONWARNING);
      end;
    end;
  finally
    Fbitbtn.Enabled := True;
    CoUninitialize;
  end;
end;

procedure TFindCarInArea.SetInfo;
begin
  if Assigned(FQueryReturnInfo) then
  begin
    FQueryReturnInfo(FInfo);
  end;
end;

{ TQueryTaxiRunDataCount }

constructor TQueryTaxiRunDataCount.Create(fromtime, totime: WideString;
  fact_Id, dev_Id, group_id: Integer; group_IdList: WideString;
  bitbtn: TSpeedButton);
begin
  inherited Create(False);
  FreeOnTerminate := True;

  Ffromtime := fromtime;
  Ftotime := totime;
  Ffact_Id := fact_Id;
  Fdev_Id := dev_Id;
  Fgroup_id := group_id;
  Fgroup_IdList := group_IdList;
  FBitbtn := bitbtn;
end;

destructor TQueryTaxiRunDataCount.Destroy;
begin
  inherited;
end;

procedure TQueryTaxiRunDataCount.Execute;
begin
  try
    coinitialize(nil);
    try
      FBitbtn.Enabled := False;

      FInfo := bs.QueryRunDataCount_Cs(Ffromtime, Ftotime, Ffact_id, Fdev_id, Fgroup_id,
                                        Fgroup_IdList);
      Synchronize(SetInfo);

    except
      on E: Exception do
      begin
        //messageErrorBox('查询客次明细出现错误！', e.Message);
        messagebox(handle, '查询客次明细出现错误！', '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    FBitbtn.Enabled := True;
    CoUninitialize;
  end;
end;

procedure TQueryTaxiRunDataCount.SetInfo;
begin
  if Assigned(FQueryReturnInfo) then
  begin
    FQueryReturnInfo(FInfo);
  end;
end;

{ TQueryTaxiRunData }

constructor TQueryTaxiRunData.Create(fromtime, totime: WideString;
  PageSize, CurrPageIndex, fact_Id, dev_Id, group_id: Integer;
  group_IdList: WideString; bitbtn: TGroupBox);
begin
  inherited Create(False);
  FreeOnTerminate := True;

  Ffromtime := fromtime;
  Ftotime := totime;
  FPageSize := PageSize;
  FCurrPageIndex := CurrPageIndex;
  Ffact_Id := fact_Id;
  Fdev_Id := dev_Id;
  Fgroup_id := group_id;
  Fgroup_IdList := group_IdList;
  FBitbtn := bitbtn; 
end;

destructor TQueryTaxiRunData.Destroy;
begin

  inherited;
end;

procedure TQueryTaxiRunData.Execute;
var
  Count: Integer;

begin
  try
    coinitialize(nil);
    try
      FBitbtn.Caption := '正在查询中...';
      FBitbtn.Enabled := False;

      FInfo := bs.QueryRunData_Cs(Ffromtime, Ftotime, FPageSize, FCurrPageIndex,
                         Ffact_Id, Fdev_Id, Fgroup_id, Fgroup_IdList);
      Synchronize(SetInfo);

    except
      on E: Exception do
      begin
         //messageErrorBox('查询客次明细出现错误！', e.Message);
        messagebox(handle, '查询客次明细出现错误！', '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally

    FBitbtn.Enabled := True;
    FBitbtn.Caption := '';
    CoUninitialize;
  end;
end;

procedure TQueryTaxiRunData.SetInfo;
begin
  if Assigned(FQueryReturnInfo) then
  begin
    FQueryReturnInfo(FInfo);
  end;
end;

{ TTaxiMetaMoneryMonthTj }

constructor TTaxiMetaMoneryMonthTj.Create(const yf: WideString;
  const fact_id, dev_Id, group_id: Integer; const group_IdList: WideString;
  bitbtn: TSpeedButton);
begin
  inherited Create(False);
  FreeOnTerminate := True;

  Fyf := yf;
  Ffact_id := fact_id;
  Fdev_Id := dev_Id;
  Fgroup_id := group_id;
  Fgroup_IdList := group_IdList;
  Fbitbtn := bitbtn;
end;

destructor TTaxiMetaMoneryMonthTj.Destroy;
begin

  inherited;
end;

procedure TTaxiMetaMoneryMonthTj.Execute;
begin
  try
    coinitialize(nil);
    try
      FBitbtn.Enabled := False;

      FInfo := bs.Tj_CarMoneyMonth(Fyf, Ffact_id, Fdev_Id, Fgroup_id, Fgroup_IdList);
      Synchronize(SetInfo);

    except
      on E: Exception do
      begin
        //messageErrorBox('查询客次明细出现错误！', e.Message);
        messagebox(handle, '查询营运金额按月分布出现错误！', '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    FBitbtn.Enabled := True;
    CoUninitialize;
  end;
end;

procedure TTaxiMetaMoneryMonthTj.SetInfo;
begin
  if Assigned(FQueryReturnInfo) then
  begin
    FQueryReturnInfo(FInfo);
  end;
end;

{ TStatTaxRunDataByDay }

constructor TStatTaxRunDataByDay.Create(const fromtime, totime: WideString;
  const group_id: Integer; const group_IdList: WideString;
  bitbtn: TSpeedButton);
begin
  inherited Create(False);
  FreeOnTerminate := True;

  Ffromtime := fromtime;
  Ftotime := totime;
  Fgroup_id := group_id;
  Fgroup_IdList := Fgroup_IdList;
  Fbitbtn := bitbtn;
end;

destructor TStatTaxRunDataByDay.Destroy;
begin
  inherited;
end;

procedure TStatTaxRunDataByDay.Execute;
begin
  try
    coinitialize(nil);
    try
      FBitbtn.Enabled := False;

      FInfo := Bs.Tj_CarMoneyDay(Ffromtime, Ftotime, Fgroup_id, Fgroup_IdList);
      Synchronize(SetInfo);

    except
      on E: Exception do
      begin
        //messageErrorBox('查询客次明细出现错误！', e.Message);
        messagebox(handle, '查询营运金额按天分布出现错误！', '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    FBitbtn.Enabled := True;
    CoUninitialize;
  end;
end;

procedure TStatTaxRunDataByDay.SetInfo;
begin
  if Assigned(FQueryReturnInfo) then
  begin
    FQueryReturnInfo(FInfo);
  end;
end;

{ TTaxiRunDataTjByMonth }

constructor TTaxiRunDataTjByMonth.Create(const fromtime,
  totime: WideString; const group_id: Integer;
  const group_IdList: WideString; bitbtn: TSpeedButton);
begin
  inherited Create(False);
  FreeOnTerminate := True;

  Ffromtime := fromtime;
  Ftotime := totime;
  Fgroup_id := group_id;
  Fgroup_IdList := group_IdList;
  Fbitbtn := bitbtn;
end;

destructor TTaxiRunDataTjByMonth.Destroy;
begin

  inherited;
end;

procedure TTaxiRunDataTjByMonth.Execute;
begin
  try
    coinitialize(nil);
    try
      FBitbtn.Enabled := False;

      FInfo := Bs.Tj_CarRunDataByTimes(Ffromtime, Ftotime, Fgroup_id, Fgroup_IdList);
      Synchronize(SetInfo);

    except
      on E: Exception do
      begin
        //messageErrorBox('查询客次明细出现错误！', e.Message);
        messagebox(handle, '查询营运情况调查出现错误！', '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    FBitbtn.Enabled := True;
    CoUninitialize;
  end;
end;

procedure TTaxiRunDataTjByMonth.SetInfo;
begin
  if Assigned(FQueryReturnInfo) then
  begin
    FQueryReturnInfo(FInfo);
  end;
end;

{ TQueryTaxiTj }

constructor TQueryTaxiTj.Create(const yf: WideString;
  const group_id: Integer; const group_IdList: WideString;
  bitbtn: TSpeedButton);
begin
  inherited Create(False);
  FreeOnTerminate := True;

  Fyf := yf;
  Fgroup_id := group_id;
  Fgroup_IdList := group_IdList;
  Fbitbtn := bitbtn;   
end;

destructor TQueryTaxiTj.Destroy;
begin
  inherited;
end;

procedure TQueryTaxiTj.Execute;
begin
  try
    coinitialize(nil);
    try
      FBitbtn.Enabled := False;

      FInfo := Bs.Tj_AllCarADayRunData(Fyf, Fgroup_id, Fgroup_IdList);
      Synchronize(SetInfo);

    except
      on E: Exception do
      begin
        //messageErrorBox('查询客次明细出现错误！', e.Message);
        messagebox(handle, '查询营运数据情况出现错误！', '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    FBitbtn.Enabled := True;
    CoUninitialize;
  end;
end;

procedure TQueryTaxiTj.SetInfo;
begin
  if Assigned(FQueryReturnInfo) then
  begin
    FQueryReturnInfo(FInfo);
  end;
end;

{ TQuery_ICCardTradeDataList2 }

constructor TQuery_ICCardTradeDataList2.Create(const fromTime,
  toTime: WideString; const isUpok, dev_Id, fact_Id, group_Id: Integer;
  const group_IdList: WideString; bitbtn: TSpeedButton);
begin
  inherited Create(False);
  FreeOnTerminate := True;
  FfromTime := fromTime;
  FtoTime := toTime;
  FisUpok := isUpok;
  Fdev_Id := dev_Id;
  Fgroup_Id := group_Id;
  Fgroup_IdList := group_IdList;
  Fbitbtn := bitbtn;
end;

destructor TQuery_ICCardTradeDataList2.Destroy;
begin
  inherited;
end;

procedure TQuery_ICCardTradeDataList2.Execute;
begin
  try
    coinitialize(nil);
    try
      FBitbtn.Enabled := False;

      FInfo := Bs.Query_ICCardTradeDataList2(FfromTime, FtoTime, FisUpok, Fdev_Id,
                                             Ffact_Id, Fgroup_Id, Fgroup_IdList);
      Synchronize(SetInfo);

    except
      on E: Exception do
      begin
        //messageErrorBox('查询客次明细出现错误！', e.Message);
        messagebox(handle, '查询一卡通刷卡交易记录出现错误！', '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    FBitbtn.Enabled := True;
    CoUninitialize;
  end;
end;

procedure TQuery_ICCardTradeDataList2.SetInfo;
begin
  if Assigned(FQueryReturnInfo) then
  begin
    FQueryReturnInfo(FInfo);
  end;
end;

{ TQuery_DbRunData }

constructor TQuery_DbRunData.Create(fromtime, totime: WideString; fact_Id,
  dev_Id, group_Id: Integer; group_IdList: WideString;
  bitbtn: TSpeedButton);
begin
  inherited Create(False);
  FreeOnTerminate := True;

  Ffromtime := fromtime;
  Ftotime := totime;
  Ffact_Id := fact_Id;
  Fdev_Id := dev_Id;
  Fgroup_Id := group_Id;
  Fgroup_IdList := group_IdList;
  Fbitbtn := bitbtn;
end;

destructor TQuery_DbRunData.Destroy;
begin

  inherited;
end;

procedure TQuery_DbRunData.Execute;
begin
  try
    coinitialize(nil);
    try
      FBitbtn.Enabled := False;

      FInfo := BS.Query_DbRunData(Ffromtime, Ftotime, Ffact_Id, Fdev_Id, Fgroup_id,
                                 Fgroup_IdList);
      Synchronize(SetInfo);

    except
      on E: Exception do
      begin
        //messageErrorBox('查询客次明细出现错误！', e.Message);
        messagebox(handle, '查询计价器当班数据出现错误！', '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    FBitbtn.Enabled := True;
    CoUninitialize;
  end;
end;

procedure TQuery_DbRunData.SetInfo;
begin
  if Assigned(FQueryReturnInfo) then
  begin
    FQueryReturnInfo(FInfo);
  end;
end;

{ TQuery_CmdLogList }

constructor TQuery_CmdLogList.Create(const fromtime, totime: WideString;
  const isQueryAllUserSended: Boolean; const dev_id, fact_Id,
  group_id: Integer; const group_IdList: WideString; bitbtn: TSpeedButton);
begin
  inherited Create(False);
  FreeOnTerminate := True;
  Ffromtime := fromtime;
  Ftotime := totime;
  FisQueryAllUserSended := isQueryAllUserSended;
  Fdev_id := dev_id;
  Fgroup_id := group_id;
  Fgroup_IdList := group_IdList;
  Fbitbtn := bitbtn;
end;

destructor TQuery_CmdLogList.Destroy;
begin

  inherited;
end;

procedure TQuery_CmdLogList.Execute;
begin
  try
    coinitialize(nil);
    try
      FBitbtn.Enabled := False;

      FInfo := BS.Query_CmdLogList(Ffromtime, Ftotime, FisQueryAllUserSended,
                                   Fdev_id, Ffact_Id, Fgroup_Id, Fgroup_IdList);
      Synchronize(SetInfo);
    except
      on E: Exception do
      begin
        //messageErrorBox('查询客次明细出现错误！', e.Message);
        messagebox(handle, '查询发送命令出现错误！', '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    FBitbtn.Enabled := True;
    CoUninitialize;
  end;
end;

procedure TQuery_CmdLogList.SetInfo;
begin
  if Assigned(FQueryReturnInfo) then
    FQueryReturnInfo(FInfo);
end;

{ TQueryMessageList }

constructor TQueryMessageList.Create(fromtime, totime: WideString;
  msg_type, msg_state: Integer; isQueryAllUserSended: Boolean; dev_id,
  fact_Id, group_Id: Integer; group_IdList: WideString;
  bitbtn: TSpeedButton);
begin
  inherited Create(False);
  FreeOnTerminate := True;

  Ffromtime := fromtime;
  Ftotime := totime;
  Fmsg_type := msg_type;
  Fmsg_state := msg_state;
  FisQueryAllUserSended := isQueryAllUserSended;
  Fdev_id := dev_id;
  Ffact_Id := fact_Id;
  Fgroup_Id := group_Id;
  Fgroup_IdList := group_IdList;
  Fbitbtn := bitbtn;
end;

destructor TQueryMessageList.Destroy;
begin

  inherited;
end;

procedure TQueryMessageList.Execute;
begin
  try
    coinitialize(nil);
    try
      FBitbtn.Enabled := False;

      FInfo := BS.QueryMessageList(Ffromtime, Ftotime, Fmsg_type, Fmsg_state, FisQueryAllUserSended,
                                   Fdev_id, Ffact_Id, Fgroup_Id, Fgroup_IdList);
      Synchronize(SetInfo);
    except
      on E: Exception do
      begin
        //messageErrorBox('查询客次明细出现错误！', e.Message);
        messagebox(handle, '查询发送文本信息出现错误！', '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    FBitbtn.Enabled := True;
    CoUninitialize;
  end;
end;

procedure TQueryMessageList.SetInfo;
begin
  if Assigned(FQueryReturnInfo) then
    FQueryReturnInfo(FInfo);
end;

{ TQuery_ServeJudge }

constructor TQuery_ServeJudge.Create(fromtime, totime: WideString; fact_Id,
  dev_Id, group_Id: Integer; group_IdList: WideString;
  bitbtn: TSpeedButton);
begin
  inherited Create(False);
  FreeOnTerminate := True;
  
  Ffromtime := fromtime;
  Ftotime := totime;
  Ffact_Id := fact_Id;
  Fdev_Id := dev_Id;
  Fgroup_Id := group_Id;
  Fgroup_IdList := group_IdList;
  Fbitbtn := bitbtn;
end;

destructor TQuery_ServeJudge.Destroy;
begin
  inherited;
end;

procedure TQuery_ServeJudge.Execute;
begin
  try
    coinitialize(nil);
    try
      FBitbtn.Enabled := False;

      FInfo := BS.Query_ServeJudge(Ffromtime, Ftotime, Ffact_Id, Fdev_Id, Fgroup_id,
                                   Fgroup_IdList);
      Synchronize(SetInfo);
    except
      on E: Exception do
      begin
        //messageErrorBox('查询客次明细出现错误！', e.Message);
        messagebox(handle, '查询服务评价信息出现错误！', '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    FBitbtn.Enabled := True;
    CoUninitialize;
  end;
end;

procedure TQuery_ServeJudge.SetInfo;
begin
  if Assigned(FQueryReturnInfo) then
  begin
    FQueryReturnInfo(FInfo);
  end;
end;

{ TQueryPhoto }

constructor TQueryPhoto.Create;
begin
  inherited Create(False);
  FreeOnTerminate := True;
end;

procedure TQueryPhoto.DeleteReceivePicIndex;
begin
  PhotoInfoList.Delete(0);
end;

destructor TQueryPhoto.Destroy;
begin
  inherited;
end;

procedure TQueryPhoto.Execute;
begin
  try
    coinitialize(nil);
    while not terminated do
    begin
      Sleep(1000);
      if not IsStop then
      begin
        Synchronize(SetInfo);
        //SetInfo;
      end;
    end;
  finally
    CoUninitialize;
  end;
end;

procedure TQueryPhoto.SetInfo;
var
  pic: PicInfo;
  i: Integer;
begin
  while PhotoInfoList.Count > 0 do
  begin
    try
      try
        byteArr := nil;
        PhotoInfo := nil;

        PhotoInfo := PPhotoInfo(PhotoInfoList.Datas[0]);

        try
          pic := bs.QueryPhoteByPicIndex(PhotoInfo^.PicIndex);
        except
          PopMsg('错误提示', '获取' + PhotoInfo.Dev.Car.No + '的照片错误！');
        end;

        if pic <> nil then
        begin
          if pic.PhotoReasonID <> 2 then
          begin
            try
              if PhotoInfo^.Dev <> nil then     
              begin
                if PhotoInfo^.Dev.LastPictureID <> PhotoInfo^.PicIndex then
                begin
                  if Globalparam.IsPhotoShowhit then
                    if (PhotoInfo^.pInfo <> nil) and (PhotoInfo^.pInfo^.ClientUpPic)
                        and (PhotoInfo^.pInfo^.MCUPicIndex = PhotoInfo^.MCUPicIndex) then
                      PopMsg('来照片',  '对' + PhotoInfo^.Dev.Car.No +'请求的' + #13#10
                            +'编号:'+ IntToStr(PhotoInfo^.MCUPicIndex) + ' 时间:' + #13#10
                            + GetDateTimeByPicID(PhotoInfo^.MCUPicIndex) + #13#10
                            +'的照片上传成功！')
                    else
                      PopMsg('来照片', PhotoInfo^.dev.Car.No + #13 + #10 + '来照片了');
                  PhotoInfo^.dev.LastPictureID := PhotoInfo^.PicIndex;
                  if FDlg_PictureFrm <> nil then
                    FDlg_PictureFrm.OnPicUpload(PhotoInfo^.dev, PhotoInfo^.PicIndex, 100, pic);
                  //if Assigned(FPicUpload) then FPicUpload(PhotoInfo^.dev, PhotoInfo^.PicIndex, 100, pic);
                end;
              end;
            except
            end;
          end
          else if pic.PhotoReasonID = 2 then // 车机主动发过来的数据，在这里就判断为车机预警后发过来的
          begin
            i := EarlyWarningCarList.IndexOf(PhotoInfo^.dev.id);
            if i>=0 then
            begin
              try                             
                if PhotoInfo^.dev <> nil then
                begin
                  TEarlyWarningCar(EarlyWarningCarList.Datas[i]).FPicInfoList.AddData(PhotoInfo^.PicIndex, pic);
                  PopMsg('预警照片', PhotoInfo^.dev.Car.No + #13 + #10 + '来预警照片了');
                  FDlg_EarlyWarning.RefreshEarlyWarningList;
                  //if Assigned(FPicUpload) then FPicUpload(dev, PhotoInfo^.PicIndex, 4, pic);
                end;
              except
              end;
            end;
          end;
        end;
      finally
         DeleteReceivePicIndex;
      end;
    except
    end;
  end;
end;

end.
