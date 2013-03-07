unit QueryThreadUnit;

interface

uses
  Classes, Types, Windows, ActiveX, SysUtils, Buttons, Forms, StdCtrls, DB, DBClient,
  Controls, Variants, ComCtrls, cxTL, SyncObjs, CarUnit, DateUtils, ConstDefineUnit,
  CmdStructUnit, uGloabVar, VSMSClientUnit, Service;

type
  TSingleDev = packed record
    carno     : string;
    datetime:string;
    speed:string;
    jd:string;
    wd:string;
  end;
  pSingleDev = ^TSingleDev;

  TQueryReturnString = procedure(AInfo: string) of object;
  TQueryReturnInfo = procedure(AInfo: OleVariant) of object;
  TQueryReturnDataCount = procedure(DataCount: Integer) of object;
  TQueryReturnInfoWithDate = procedure(AInfo: OleVariant; sDate: string) of object;

  QueryThread = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  public
  end;

  TQueryDevRunStateOnTheTimeThd = class(TThread) // 查询某时间点车辆的运行状态
  private
    FQueryTime:string;
    FGroup_Id : Integer;
    FGroup_paranet: String;
    FDevIdStr: String;
    FDateSet : TClientDataSet;
    FInfo: OleVariant;
    FResultStr:String;
    FErrorTitle, FErrorInfo: string;
    FOnQueryReturn: TQueryReturnString;
    FQueryType: Integer;
    procedure ShowMessageInfo;
    procedure SetInfo;
    procedure SetOnQueryReturn(const Value: TQueryReturnString);
    procedure SetQueryType(const Value: Integer);
  protected
    procedure Execute; override;
  public

    constructor Create( QueryTime: String; Group_Id: Integer;
                 Group_paranet: String;DevIdStr: String);
    destructor Destroy(); override;
    procedure SetParams(QueryTime: String; Group_Id: Integer;
                 Group_paranet: String;DevIdStr: String);
    property OnQueryReturn:TQueryReturnString read FOnQueryReturn write SetOnQueryReturn;
    property QueryType:Integer read FQueryType write SetQueryType;//1-点 2-时间段
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

  TQuery_CmdLogList = class(TThread)         // 查询发送命令日志信息
  private
    Ffromtime: WideString; Ftotime: WideString;
    FisQueryAllUserSended: Boolean;
    Fdev_id: string; Ffact_Id: Integer;
    Fgroup_id: Integer;
    Fgroup_IdList: WideString;
    Fbitbtn: TBitBtn;

    FInfo: OleVariant;
    FQueryReturnInfo: TQueryReturnInfo;
    procedure SetInfo;
  protected
    procedure Execute; override;
  public
    constructor Create(const fromtime: WideString; const totime: WideString;
                       const isQueryAllUserSended: Boolean; const dev_id: string; const fact_Id: Integer;
                       const group_id: Integer; const group_IdList: WideString; bitbtn: TBitBtn);
    destructor Destroy(); override;
    property OnQueryReturn: TQueryReturnInfo read FQueryReturnInfo write FQueryReturnInfo;
  end;

  TQueryMessageList = class(TThread)     // 查询文本信息
  private
    Ffromtime, Ftotime: WideString;
    Fmsg_type: Integer;
    Fmsg_state: Integer;
    FisQueryAllUserSended: Boolean;
    Fdev_id:string;
    Ffact_Id, Fgroup_Id: Integer;
    Fgroup_IdList: WideString;
    Fbitbtn: TBitBtn;

    FInfo: OleVariant;
    FQueryReturnInfo: TQueryReturnInfo;
    procedure SetInfo;
  protected
    procedure Execute; override;
  public
    constructor Create(fromtime: WideString; totime: WideString; msg_type: Integer;
                       msg_state: Integer; isQueryAllUserSended: Boolean;
                       dev_id: string; fact_Id: Integer; group_Id: Integer;
                       group_IdList: WideString; bitbtn: TBitBtn);
    destructor Destroy(); override;
    property OnQueryReturn: TQueryReturnInfo read FQueryReturnInfo write FQueryReturnInfo;
  end;

  TQueryDataThread = class(TThread)//查询线程 根据不同的构造函数来实现共用
  private
    FFromTime: string;
    FToTime: string;
    FDevId: string;
    FSimNo: string;
    FGroupId: Integer;
    FSonGroupIdList: string;
    FAlarmType: Integer;
    FDealStatus: Integer;
    FPageSize: Integer;
    FCurPageNo: Integer;

    FQueryFlag: Byte;//0:count 1:data

    FQueryDate: string;

    FDataCount: Integer;
    FData: OleVariant;
    FQueryReturnDataCount: TQueryReturnDataCount;
    FQueryReturnInfo: TQueryReturnInfo;
    FQueryReturnInfoWithDate: TQueryReturnInfoWithDate;
    procedure SetDataCount;
    procedure SetData;
  protected
    procedure Execute; override;
  public
    constructor Create(fromTime, toTime: string; devId: string; groupId: Integer; sonGroupIdList: string;
                      alarmType: Integer; dealStatus: Integer); overload;
    constructor Create(fromTime, toTime: string; devId: string; groupId: Integer; sonGroupIdList: string;
                      alarmType: Integer; dealStatus: Integer; pageSize, currPageNo: Integer); overload;
    constructor Create(fromTime, toTime: string; groupId: Integer; sonGroupIdList: string); overload;
    constructor Create(fromTime, toTime: string; devId: string; groupId: Integer; sonGroupIdList: string); overload;


    destructor Destroy(); override;
    property OnQueryDataCount: TQueryReturnDataCount read FQueryReturnDataCount write FQueryReturnDataCount;
    property OnQueryReturn: TQueryReturnInfo read FQueryReturnInfo write FQueryReturnInfo;
    property OnQueryReturnInfoWithDate: TQueryReturnInfoWithDate read FQueryReturnInfoWithDate write FQueryReturnInfoWithDate;
  end;

  TQueryPhoto = class(TThread)
  private
    PhotoInfo: PPhotoInfo;
    pic: PicInfo;
    byteArr: TByteDynArray;
    FIsStop: Boolean;
    FLock: TCriticalSection;
    procedure SetInfo;
    procedure DeleteReceivePicIndex;
    procedure GetPic;
  protected
    procedure Execute; override;
  public
    constructor Create();
    destructor Destroy(); override;
    property IsStop: Boolean read FIsStop write FIsStop;
  end;

  TTj_ServeJudge = class(TThread)
  private
    Ffromtime, Ftotime: WideString;
    Ffact_Id : Integer;
    Fdev_Id :String;
    Fgroup_Id: Integer;
    Fgroup_IdList: WideString;
    Fbitbtn: TBitBtn;

    FInfo: OleVariant;
    FQueryReturnInfo: TQueryReturnInfo;
    procedure SetInfo;
  protected
    procedure Execute; override;
  public
    constructor Create(const fromtime: WideString; const totime: WideString; const dev_Id: string;
                       const fact_Id: Integer;
                       const group_Id: Integer; const group_IdList: WideString;
                       bitbtn: TBitBtn);
    destructor Destroy(); override;
    property OnQueryReturn: TQueryReturnInfo read FQueryReturnInfo write FQueryReturnInfo;
  end;

  TAddReceivePhone = class(TThread)     // 保存接收到的电话
  private
    procedure SetInfo;
  protected
    procedure Execute; override;
  public
    constructor Create(); overload;
    destructor Destroy(); override;
  end;

  TQueryAllDevUpdateRecord = class(TThread)   // 升级记录信息查询
  private
    FDevId:string; FGroup_Id: Integer;
    FGroup_IdList: WideString;
    FDevType, FDevFactId: Integer;
    FFromTime, FToTime: WideString;
    FUpdateResult: Integer;
    FHardVer, FSoftVer: WideString;

    Fbitbtn: TBitBtn;
    FInfo: OleVariant;
    FQueryReturnInfo: TQueryReturnInfo;

    procedure SetInfo;
  protected
    procedure Execute; override;
  public
    constructor Create(DevId:string; group_Id: Integer; group_IdList: WideString;
                       DevType, DevFactId: Integer; fromTime, toTime: WideString;
                       UpdateResult: Integer; HardVer, SoftVer: WideString;
                       bitbtn: TBitBtn);
    destructor Destroy(); override;
    property OnQueryReturn: TQueryReturnInfo read FQueryReturnInfo write FQueryReturnInfo;
  end;


implementation
uses ShowMessageInfo;
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
    note.Values[3]:=FormatFloat('##0.000000',(dataSet.FindField('Longitude').AsFloat / 1000000));
    note.Values[4]:=FormatFloat('##0.000000',(dataSet.FindField('Latitude').AsFloat / 1000000));
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
        try
          if isStop then break;
          dev:=TDevice(ListViewTo.Items.Item[i].Data);
          Application.ProcessMessages;
          ProgressBar1.StepIt;
          try
            dataSet := bs.QueryDevPostion(dev.fact_id, dev.Id, FFromDate, FToDate, FBeginLat, FBeginLong, FEndLat, FEndLong);
          except
            Continue;
          end;

          Synchronize(AddPostionList);
          Application.ProcessMessages;
        except
          Continue;
          {on e: Exception do
          begin
            messagebox(handle, QUERY_WARNING_INFO, '提示', mb_ok + mb_iconinformation);
            ProgressBar1.Position:=0;
            exit;
          end;}
        end;
      end;  
      Synchronize(SetInfo);
    except
      on E: Exception do
      begin
        messageErrorBox('区域查车出现错误！', e.Message);
        ProgressBar1.Position:=0;
      end;
    end;
  finally
    Fbitbtn.Enabled := True;
    ProgressBar1.Position:=0;
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
var
  i: Integer;
  s: string;
begin
  try
    coinitialize(nil);
    try
      Fbitbtn.Enabled := False;

      FInfo := Bs.FindCarInArea(Fcartype_id, Fcar_Color, FdevIdList, Fgroup_Id, Fgroup_IdList,
                       FbeginTime, FendTime, FbeginLat, FbeginLong, FendLat, FendLong);
      
      Synchronize(SetInfo);
    except
      on E: Exception do
      begin
        messageErrorBox('失物查询结果处理不正确！', e.Message);
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

//{ TQueryTaxiRunDataCount }
//
//constructor TQueryTaxiRunDataCount.Create(fromtime, totime: WideString;
//  fact_Id, dev_Id, group_id: Integer; group_IdList: WideString;
//  bitbtn: TBitBtn);
//begin
//  inherited Create(False);
//  FreeOnTerminate := True;
//
//  Ffromtime := fromtime;
//  Ftotime := totime;
//  Ffact_Id := fact_Id;
//  Fdev_Id := dev_Id;
//  Fgroup_id := group_id;
//  Fgroup_IdList := group_IdList;
//  FBitbtn := bitbtn;
//end;
//
//destructor TQueryTaxiRunDataCount.Destroy;
//begin
//  inherited;
//end;
//
//procedure TQueryTaxiRunDataCount.Execute;
//begin
//  try
//    coinitialize(nil);
//    try
//      FBitbtn.Enabled := False;
//
//      FInfo := bs.QueryRunDataCount_Cs(Ffromtime, Ftotime, Ffact_id, Fdev_id, Fgroup_id,
//                                        Fgroup_IdList);
//      Synchronize(SetInfo);
//
//    except
//      on E: Exception do
//      begin
//        messageErrorBox('查询客次明细出现错误！', e.Message);
//      end;
//    end;
//  finally
//    FBitbtn.Enabled := True;
//    CoUninitialize;
//  end;
//end;
//
//procedure TQueryTaxiRunDataCount.SetInfo;
//begin
//  if Assigned(FQueryReturnInfo) then
//  begin
//    FQueryReturnInfo(FInfo);
//  end;
//end;
//
//{ TQueryTaxiRunData }
//
//constructor TQueryTaxiRunData.Create(fromtime, totime: WideString;
//  PageSize, CurrPageIndex, fact_Id, dev_Id, group_id: Integer;
//  group_IdList: WideString; bitbtn: TGroupBox);
//begin
//  inherited Create(False);
//  FreeOnTerminate := True;
//
//  Ffromtime := fromtime;
//  Ftotime := totime;
//  FPageSize := PageSize;
//  FCurrPageIndex := CurrPageIndex;
//  Ffact_Id := fact_Id;
//  Fdev_Id := dev_Id;
//  Fgroup_id := group_id;
//  Fgroup_IdList := group_IdList;
//  FBitbtn := bitbtn; 
//end;
//
//destructor TQueryTaxiRunData.Destroy;
//begin
//
//  inherited;
//end;
//
//procedure TQueryTaxiRunData.Execute;
//var
//  Count: Integer;
//
//begin
//  try
//    coinitialize(nil);
//    try
//      FBitbtn.Caption := '正在查询中...';
//      FBitbtn.Enabled := False;
//
//      FInfo := bs.QueryRunData_Cs(Ffromtime, Ftotime, FPageSize, FCurrPageIndex,
//                         Ffact_Id, Fdev_Id, Fgroup_id, Fgroup_IdList);
//      Synchronize(SetInfo);
//
//    except
//      on E: Exception do
//      begin
//        messageErrorBox('查询客次明细出现错误！', e.Message);
//        //messagebox(handle, '查询客次明细出现错误！', '提示', mb_ok + mb_iconinformation);
//      end;
//    end;
//  finally
//
//    FBitbtn.Enabled := True;
//    FBitbtn.Caption := '';
//    CoUninitialize;
//  end;
//end;
//
//procedure TQueryTaxiRunData.SetInfo;
//begin
//  if Assigned(FQueryReturnInfo) then
//  begin
//    FQueryReturnInfo(FInfo);
//  end;
//end;
//
//{ TTaxiMetaMoneryMonthTj }
//
//constructor TTaxiMetaMoneryMonthTj.Create(const yf: WideString;
//  const fact_id, dev_Id, group_id: Integer; const group_IdList: WideString;
//  bitbtn: TBitBtn);
//begin
//  inherited Create(False);
//  FreeOnTerminate := True;
//
//  Fyf := yf;
//  Ffact_id := fact_id;
//  Fdev_Id := dev_Id;
//  Fgroup_id := group_id;
//  Fgroup_IdList := group_IdList;
//  Fbitbtn := bitbtn;
//end;
//
//destructor TTaxiMetaMoneryMonthTj.Destroy;
//begin
//
//  inherited;
//end;
//
//procedure TTaxiMetaMoneryMonthTj.Execute;
//begin
//  try
//    coinitialize(nil);
//    try
//      FBitbtn.Enabled := False;
//
//      FInfo := bs.Tj_CarMoneyMonth(Fyf, Ffact_id, Fdev_Id, Fgroup_id, Fgroup_IdList);
//      Synchronize(SetInfo);
//
//    except
//      on E: Exception do
//      begin
//        messageErrorBox('查询营运金额按月分布出现错误！', e.Message);
//        //messagebox(handle, '查询营运金额按月分布出现错误！', '提示', mb_ok + mb_iconinformation);
//      end;
//    end;
//  finally
//    FBitbtn.Enabled := True;
//    CoUninitialize;
//  end;
//end;
//
//procedure TTaxiMetaMoneryMonthTj.SetInfo;
//begin
//  if Assigned(FQueryReturnInfo) then
//  begin
//    FQueryReturnInfo(FInfo);
//  end;
//end;
//
//{ TStatTaxRunDataByDay }
//
//constructor TStatTaxRunDataByDay.Create(const fromtime, totime: WideString;
//  const group_id: Integer; const group_IdList: WideString;
//  bitbtn: TBitBtn);
//begin
//  inherited Create(False);
//  FreeOnTerminate := True;
//
//  Ffromtime := fromtime;
//  Ftotime := totime;
//  Fgroup_id := group_id;
//  Fgroup_IdList := Fgroup_IdList;
//  Fbitbtn := bitbtn;
//end;
//
//destructor TStatTaxRunDataByDay.Destroy;
//begin
//  inherited;
//end;
//
//procedure TStatTaxRunDataByDay.Execute;
//begin
//  try
//    coinitialize(nil);
//    try
//      FBitbtn.Enabled := False;
//
//      FInfo := Bs.Tj_CarMoneyDay(Ffromtime, Ftotime, Fgroup_id, Fgroup_IdList);
//      Synchronize(SetInfo);
//
//    except
//      on E: Exception do
//      begin
//        messageErrorBox('查询营运金额按天分布出现错误！', e.Message);
//        //messagebox(handle, '查询营运金额按天分布出现错误！', '提示', mb_ok + mb_iconinformation);
//      end;
//    end;
//  finally
//    FBitbtn.Enabled := True;
//    CoUninitialize;
//  end;
//end;
//
//procedure TStatTaxRunDataByDay.SetInfo;
//begin
//  if Assigned(FQueryReturnInfo) then
//  begin
//    FQueryReturnInfo(FInfo);
//  end;
//end;
//
//{ TTaxiRunDataTjByMonth }
//
//constructor TTaxiRunDataTjByMonth.Create(const fromtime,
//  totime: WideString; const group_id: Integer;
//  const group_IdList: WideString; bitbtn: TBitBtn);
//begin
//  inherited Create(False);
//  FreeOnTerminate := True;
//
//  Ffromtime := fromtime;
//  Ftotime := totime;
//  Fgroup_id := group_id;
//  Fgroup_IdList := group_IdList;
//  Fbitbtn := bitbtn;
//end;
//
//destructor TTaxiRunDataTjByMonth.Destroy;
//begin
//
//  inherited;
//end;
//
//procedure TTaxiRunDataTjByMonth.Execute;
//begin
//  try
//    coinitialize(nil);
//    try
//      FBitbtn.Enabled := False;
//
//      FInfo := Bs.Tj_CarRunDataByTimes(Ffromtime, Ftotime, Fgroup_id, Fgroup_IdList);
//      Synchronize(SetInfo);
//
//    except
//      on E: Exception do
//      begin
//        messageErrorBox('查询营运情况调查出现错误！', e.Message);
//        //messagebox(handle, '查询营运情况调查出现错误！', '提示', mb_ok + mb_iconinformation);
//      end;
//    end;
//  finally
//    FBitbtn.Enabled := True;
//    CoUninitialize;
//  end;
//end;
//
//procedure TTaxiRunDataTjByMonth.SetInfo;
//begin
//  if Assigned(FQueryReturnInfo) then
//  begin
//    FQueryReturnInfo(FInfo);
//  end;
//end;
//
//{ TQueryTaxiTj }
//
//constructor TQueryTaxiTj.Create(const yf: WideString;
//  const group_id: Integer; const group_IdList: WideString;
//  bitbtn: TBitBtn);
//begin
//  inherited Create(False);
//  FreeOnTerminate := True;
//
//  Fyf := yf;
//  Fgroup_id := group_id;
//  Fgroup_IdList := group_IdList;
//  Fbitbtn := bitbtn;   
//end;
//
//destructor TQueryTaxiTj.Destroy;
//begin
//  inherited;
//end;
//
//procedure TQueryTaxiTj.Execute;
//begin
//  try
//    coinitialize(nil);
//    try
//      FBitbtn.Enabled := False;
//
//      FInfo := Bs.Tj_AllCarADayRunData(Fyf, Fgroup_id, Fgroup_IdList);
//      Synchronize(SetInfo);
//
//    except
//      on E: Exception do
//      begin
//        messageErrorBox('查询营运数据情况出现错误！', e.Message);
//        //messagebox(handle, '查询营运数据情况出现错误！', '提示', mb_ok + mb_iconinformation);
//      end;
//    end;
//  finally
//    FBitbtn.Enabled := True;
//    CoUninitialize;
//  end;
//end;
//
//procedure TQueryTaxiTj.SetInfo;
//begin
//  if Assigned(FQueryReturnInfo) then
//  begin
//    FQueryReturnInfo(FInfo);
//  end;
//end;
//
//{ TQuery_ICCardTradeDataList2 }
//
//constructor TQuery_ICCardTradeDataList2.Create(const fromTime,
//  toTime: WideString; const isUpok, dev_Id, fact_Id, group_Id: Integer;
//  const group_IdList: WideString; bitbtn: TSpeedButton);
//begin
//  inherited Create(False);
//  FreeOnTerminate := True;
//  FfromTime := fromTime;
//  FtoTime := toTime;
//  FisUpok := isUpok;
//  Fdev_Id := dev_Id;
//  Fgroup_Id := group_Id;
//  Fgroup_IdList := group_IdList;
//  Fbitbtn := bitbtn;
//end;
//
//destructor TQuery_ICCardTradeDataList2.Destroy;
//begin
//  inherited;
//end;
//
//procedure TQuery_ICCardTradeDataList2.Execute;
//begin
//  try
//    coinitialize(nil);
//    try
//      FBitbtn.Enabled := False;
//
//      FInfo := Bs.Query_ICCardTradeDataList2(FfromTime, FtoTime, FisUpok, Fdev_Id,
//                                             Ffact_Id, Fgroup_Id, Fgroup_IdList);
//      Synchronize(SetInfo);
//
//    except
//      on E: Exception do
//      begin
//        messageErrorBox('查询一卡通刷卡交易记录出现错误！', e.Message);
//        //messagebox(handle, '查询一卡通刷卡交易记录出现错误！', '提示', mb_ok + mb_iconinformation);
//      end;
//    end;
//  finally
//    FBitbtn.Enabled := True;
//    CoUninitialize;
//  end;
//end;
//
//procedure TQuery_ICCardTradeDataList2.SetInfo;
//begin
//  if Assigned(FQueryReturnInfo) then
//  begin
//    FQueryReturnInfo(FInfo);
//  end;
//end;
//
//{ TQuery_DbRunData }
//
//constructor TQuery_DbRunData.Create(fromtime, totime: WideString; fact_Id,
//  dev_Id, group_Id: Integer; group_IdList: WideString;
//  bitbtn: TSpeedButton);
//begin
//  inherited Create(False);
//  FreeOnTerminate := True;
//
//  Ffromtime := fromtime;
//  Ftotime := totime;
//  Ffact_Id := fact_Id;
//  Fdev_Id := dev_Id;
//  Fgroup_Id := group_Id;
//  Fgroup_IdList := group_IdList;
//  Fbitbtn := bitbtn;
//end;
//
//destructor TQuery_DbRunData.Destroy;
//begin
//
//  inherited;
//end;
//
//procedure TQuery_DbRunData.Execute;
//begin
//  try
//    coinitialize(nil);
//    try
//      FBitbtn.Enabled := False;
//
//      FInfo := BS.Query_DbRunData(Ffromtime, Ftotime, Ffact_Id, Fdev_Id, Fgroup_id,
//                                 Fgroup_IdList);
//      Synchronize(SetInfo);
//
//    except
//      on E: Exception do
//      begin
//        messageErrorBox('查询计价器当班数据出现错误！', e.Message);
//        //messagebox(handle, '查询计价器当班数据出现错误！', '提示', mb_ok + mb_iconinformation);
//      end;
//    end;
//  finally
//    FBitbtn.Enabled := True;
//    CoUninitialize;
//  end;
//end;
//
//procedure TQuery_DbRunData.SetInfo;
//begin
//  if Assigned(FQueryReturnInfo) then
//  begin
//    FQueryReturnInfo(FInfo);
//  end;
//end;

{ TQuery_CmdLogList }

constructor TQuery_CmdLogList.Create(const fromtime, totime: WideString;
  const isQueryAllUserSended: Boolean; const dev_id:string;const fact_Id,
  group_id: Integer; const group_IdList: WideString; bitbtn: TBitBtn);
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
        messageErrorBox('查询发送命令出现错误！', e.Message);
        //messagebox(handle, '查询发送命令出现错误！', '提示', mb_ok + mb_iconinformation);
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
  msg_type, msg_state: Integer; isQueryAllUserSended: Boolean; dev_id:string;
  fact_Id, group_Id: Integer; group_IdList: WideString;
  bitbtn: TBitBtn);
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
        messageErrorBox('查询发送文本信息出现错误！', e.Message);
        //messagebox(handle, '查询发送文本信息出现错误！', '提示', mb_ok + mb_iconinformation);
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


{ TQueryPhoto }

constructor TQueryPhoto.Create;
begin
  inherited Create(False);
  FreeOnTerminate := True;

  FLock := TCriticalSection.Create;
end;

procedure TQueryPhoto.DeleteReceivePicIndex;
begin
  PhotoInfoList.Delete(0);
end;

destructor TQueryPhoto.Destroy;
begin
  FLock.Free;
  //inherited;
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
        //Synchronize(SetInfo);
        SetInfo;
      end;
    end;
  finally
    CoUninitialize;
  end;
end;

procedure TQueryPhoto.GetPic;
  function getPicTitle(reasonId: Integer): string;
  begin
    Result := '来照片了';
    case reasonId of
      1: Result := '定时拍照';
      2: Result := '紧急报警拍照';
      3: Result := '碰撞侧翻报警拍照';
      4: Result := '疲劳报警拍照';
    end;
  end;
var
  i: Integer;
begin
  try
    if pic <> nil then
    begin
//      if pic.PhotoReasonID <> 2 then
//      begin
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
                        + GetDateTimeByID(PhotoInfo^.MCUPicIndex) + #13#10
                        +'的照片上传成功！')
                else
                  PopMsg(getPicTitle(pic.PhotoReasonID), PhotoInfo^.dev.Car.No + #13 + #10 + '来照片了');
              PhotoInfo^.dev.LastPictureID := PhotoInfo^.PicIndex;
              if (pic.PhotoReasonID = 4) then
                PhotoInfo^.Dev.setLastFatigueAlarmPicData(pic);
              if FDlg_PictureFrm <> nil then
              begin
                FDlg_PictureFrm.OnPicUpload(PhotoInfo^.dev, PhotoInfo^.PicIndex, 100, pic);
                PhotoInfo^.Dev.setLastFatigueAlarmPicData(pic);
              end;
              //if Assigned(FPicUpload) then FPicUpload(PhotoInfo^.dev, PhotoInfo^.PicIndex, 100, pic);
            end;
          end;
        except
        end;
//      end
//      else if pic.PhotoReasonID = 2 then // 车机主动发过来的数据，在这里就判断为车机预警后发过来的
//      begin
//        i := EarlyWarningCarList.IndexOf(PhotoInfo^.dev.id);
//        if i>=0 then
//        begin
//          try
//            if PhotoInfo^.dev <> nil then
//            begin
//              TEarlyWarningCar(EarlyWarningCarList.Objects[i]).FPicInfoList.AddData(PhotoInfo^.PicIndex, pic);
//              PopMsg('预警照片', PhotoInfo^.dev.Car.No + #13 + #10 + '来预警照片了');
////              FDlg_EarlyWarning.RefreshEarlyWarningList;
//              //if Assigned(FPicUpload) then FPicUpload(dev, PhotoInfo^.PicIndex, 4, pic);
//            end;
//          except
//          end;
//        end;
//      end;
    end;
  except
    PopMsg('错误提示', '获取' + PhotoInfo.Dev.Car.No + '的照片错误！');
  end;
end;

procedure TQueryPhoto.SetInfo;
begin
  while PhotoInfoList.Count > 0 do
  begin
    try
      try
        Application.ProcessMessages;
        byteArr := nil;
        PhotoInfo := nil;

        try
          FLock.Enter;
          PhotoInfo := PPhotoInfo(PhotoInfoList.Datas[0]);
          DeleteReceivePicIndex;
        finally
          FLock.Leave;
        end;

        try
          pic := bs.QueryPhoteByPicIndex(PhotoInfo^.PicIndex);
        except
          //PopMsg('错误提示', '获取' + PhotoInfo.Dev.Car.No + '的照片错误！');
        end;

        Synchronize(GetPic);

        if PhotoInfo <> nil then
          Dispose(PhotoInfo);
      except
        Continue
        //DeleteReceivePicIndex;
      end;
    finally
    end;
  end;
end;

{ TTj_ServeJudge }

constructor TTj_ServeJudge.Create(const fromtime, totime: WideString;   const dev_Id:String;
  const fact_Id,  group_Id: Integer; const group_IdList: WideString;
  bitbtn: TBitBtn);
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

destructor TTj_ServeJudge.Destroy;
begin
  inherited;
end;

procedure TTj_ServeJudge.Execute;
begin
  try
    coinitialize(nil);
    try
      FBitbtn.Enabled := False;

      FInfo := BS.Tj_ServeJudge(Ffromtime, Ftotime, Ffact_Id, Fdev_id,  Fgroup_Id,
                                Fgroup_IdList);
      Synchronize(SetInfo);
    except
      on E: Exception do
      begin
        messageErrorBox('查询服务评价统计出现错误！', e.Message);
        //messagebox(handle, '查询服务评价统计出现错误！', '提示', mb_ok + mb_iconinformation);
      end;
    end;
  finally
    FBitbtn.Enabled := True;
    CoUninitialize;
  end;
end;

procedure TTj_ServeJudge.SetInfo;
begin
  if Assigned(FQueryReturnInfo) then
  begin
    FQueryReturnInfo(FInfo);
  end;
end;

{ TAddReceivePhone }

constructor TAddReceivePhone.Create;
begin
  inherited Create(False);
  FreeOnTerminate := True;
end;

destructor TAddReceivePhone.Destroy;
begin

  inherited;
end;

procedure TAddReceivePhone.Execute;
begin
  inherited;

end;

procedure TAddReceivePhone.SetInfo;
begin

end;

{ TQueryAllDevUpdateRecord }

constructor TQueryAllDevUpdateRecord.Create(DevId:string; group_Id: Integer;
  group_IdList: WideString; DevType, DevFactId: Integer; fromTime,
  toTime: WideString; UpdateResult: Integer; HardVer, SoftVer: WideString;
  bitbtn: TBitBtn);
begin
  inherited Create(False);
  FreeOnTerminate := True;

  FDevId := DevId;
  FGroup_Id := group_Id;
  FGroup_IdList := group_IdList;
  FDevType := DevType;
  FDevFactId := DevFactId;
  FFromTime := fromTime;
  FToTime := toTime;
  FUpdateResult := UpdateResult;
  FHardVer := HardVer;
  FSoftVer := SoftVer;
  Fbitbtn := bitbtn;
end;

destructor TQueryAllDevUpdateRecord.Destroy;
begin
  inherited;
end;

procedure TQueryAllDevUpdateRecord.Execute;
begin
  try
    coinitialize(nil);
    try
      FBitbtn.Enabled := False;

      FInfo := BS.DevUpdate_QueryAllDevUpdateRecord(FDevId, FGroup_Id, FGroup_IdList, FDevType,
                                                    FDevFactId, FFromTime, FToTime, FUpdateResult,
                                                    FHardVer, FSoftVer);
      Synchronize(SetInfo);
    except
      on E: Exception do
      begin
        messageErrorBox('查询升级记录信息出现错误！', e.Message);
      end;
    end;
  finally
    FBitbtn.Enabled := True;
    CoUninitialize;
  end;
end;

procedure TQueryAllDevUpdateRecord.SetInfo;
begin
  if Assigned(FQueryReturnInfo) then
  begin
    FQueryReturnInfo(FInfo);
  end;
end;

{ TQueryDataThread }

constructor TQueryDataThread.Create(fromTime, toTime, devId: string;
  groupId: Integer; sonGroupIdList: string; alarmType, dealStatus: Integer);
begin
  inherited Create(False);
  FreeOnTerminate := True;

  FQueryFlag := 0;
  FFromTime := fromTime;
  FToTime := toTime;
  FDevId := devId;
  FGroupId := groupId;
  FSonGroupIdList := sonGroupIdList;
  FAlarmType := alarmType;
  FDealStatus := dealStatus;
end;

constructor TQueryDataThread.Create(fromTime, toTime, devId: string;
  groupId: Integer; sonGroupIdList: string; alarmType, dealStatus: Integer;
  pageSize, currPageNo: Integer);
begin
  inherited Create(False);
  FreeOnTerminate := True;

  FQueryFlag := 1;
  FFromTime := fromTime;
  FToTime := toTime;
  FDevId := devId;
  FGroupId := groupId;
  FSonGroupIdList := sonGroupIdList;
  FAlarmType := alarmType;
  FDealStatus := dealStatus;
  FPageSize := pageSize;
  FCurPageNo := currPageNo;
end;

constructor TQueryDataThread.Create(fromTime, toTime: string;
  groupId: Integer; sonGroupIdList: string);
begin
  inherited Create(False);
  FreeOnTerminate := True;

  FQueryFlag := 2;
  FFromTime := fromTime;
  FToTime := toTime;
  FGroupId := groupId;
  FSonGroupIdList := sonGroupIdList;
end;

constructor TQueryDataThread.Create(fromTime, toTime, devId: string;
  groupId: Integer; sonGroupIdList: string);
begin
  inherited Create(False);
  FreeOnTerminate := True;

  FQueryFlag := 3;
  FFromTime := fromTime;
  FToTime := toTime;
  FDevId := devId;
  FGroupId := groupId;
  FSonGroupIdList := sonGroupIdList;
end;

destructor TQueryDataThread.Destroy;
begin

  inherited;
end;

procedure TQueryDataThread.Execute;
var
  sTime, tTime: TDateTime;
  querySTime, queryETime: TDateTime;
  lTime: TDateTime;
  i, j: Integer;
begin
  CoInitialize(nil);
  try
    if FQueryFlag = 0 then
    begin
      try
        FDataCount := Bs.QueryAlarmCount(FFromTime, FToTime, FDevId, FGroupId, FSonGroupIdList, FDealStatus, FAlarmType, FSimNo);
        Synchronize(SetDataCount);
      except
        on E: Exception do
        begin
          MessageBox(Handle, PChar('查询报警信息记录总数异常:' + E.Message), '提示', MB_OK + MB_ICONINFORMATION);
        end;
      end;
    end
    else if FQueryFlag = 1 then
    begin
      try
        FData := Bs.QueryAlarmData(FFromTime, FToTime, FDevId, FGroupId, FSonGroupIdList, FDealStatus, FAlarmType, FPageSize, FCurPageNo, FSimNo);
        Synchronize(SetData);
      except
        on E: Exception do
        begin
          MessageBox(Handle, PChar('查询报警信息记录数据异常:' + E.Message), '提示', MB_OK + MB_ICONINFORMATION);
        end;
      end;
    end
    else if FQueryFlag = 2 then
    begin
      try
        FData := Bs.QueryDevGroupOnline(FFromTime, FToTime, FGroupId, FSonGroupIdList);
        Synchronize(SetData);
      except
        on E: Exception do
        begin
          MessageBox(Handle, PChar('查询车组在线记录数据异常:' + E.Message), '提示', MB_OK + MB_ICONINFORMATION);
        end;
      end;
    end
    else if FQueryFlag = 3 then
    begin
      sTime := StrToDateTime(FFromTime);
      tTime := StrToDateTime(FToTime);

      j := DayOfTheYear(tTime) - DayOfTheYear(sTime);
      if j = 0 then
      begin
        FQueryDate := FormatDateTime('yyyy-MM-dd', sTime);
        FData := Bs.QueryDevMileage(FFromTime, FToTime, FDevId, FGroupId, FSonGroupIdList);
        Synchronize(SetData);
      end
      else
      begin
        lTime := StrToTime('23:59:59');
        for i:= 0 to j do
        begin
          if i = 0 then
          begin
            querySTime := sTime;
            queryETime := sTime;
            ReplaceTime(queryETime, lTime);
            FQueryDate := FormatDateTime('yyyy-MM-dd', querySTime);
            FData := Bs.QueryDevMileage(FFromTime, FormatDateTime('yyyy-MM-dd hh:nn:ss', queryETime), FDevId, FGroupId, FSonGroupIdList);
            Synchronize(SetData);
          end
          else if i = j then
          begin
            querySTime := queryETime + 1/(24 * 3600);
            FQueryDate := FormatDateTime('yyyy-MM-dd', querySTime);
            FData := Bs.QueryDevMileage(FormatDateTime('yyyy-MM-dd hh:nn:ss', querySTime), FToTime, FDevId, FGroupId, FSonGroupIdList);
            Synchronize(SetData);
          end
          else
          begin
            querySTime := queryETime + 1/(24 * 3600);
            queryETime := queryETime + 1;
            FQueryDate := FormatDateTime('yyyy-MM-dd', querySTime);
            FData := Bs.QueryDevMileage(FormatDateTime('yyyy-MM-dd hh:nn:ss', querySTime), FormatDateTime('yyyy-MM-dd hh:nn:ss', queryETime), FDevId, FGroupId, FSonGroupIdList);
            Synchronize(SetData);
          end;  
        end;
      end;
    end;
  finally
    CoUninitialize;
  end;
end;

procedure TQueryDataThread.SetData;
begin
  if FQueryFlag = 3 then
  begin
    if Assigned(FQueryReturnInfoWithDate) then
      FQueryReturnInfoWithDate(FData, FQueryDate);
  end
  else
  begin
    if Assigned(FQueryReturnInfo) then
      FQueryReturnInfo(FData);
  end;
end;

procedure TQueryDataThread.SetDataCount;
begin
  if Assigned(FQueryReturnDataCount) then
    FQueryReturnDataCount(FDataCount);
end;

{ TQueryDevRunStateOnTheTimeThd }

constructor TQueryDevRunStateOnTheTimeThd.Create(QueryTime: String;
  Group_Id: Integer; Group_paranet, DevIdStr: String);
begin
  FQueryTime := QueryTime;
  FGroup_Id := Group_Id;
  FGroup_paranet := Group_paranet;
  FDevIdStr := DevIdStr;
  inherited Create(false);  //不挂起的
end;

destructor TQueryDevRunStateOnTheTimeThd.Destroy;
begin
  inherited;
end;

procedure TQueryDevRunStateOnTheTimeThd.Execute;
begin
  coinitialize(nil);
  try
    while (not self.Terminated) do
    begin
      try
        FResultStr := Bs.QueryDevRunStateInfoOnTheTime(FQueryTime,FGroup_Id,FGroup_paranet,FDevIdStr);
        //FInfo := bss.QueryDevRunStateInfoOnTheTime(FQueryTime,FGroup_Id,FGroup_paranet,FDevIdStr);
        // Synchronize(SetInfo);
        SetInfo;
      except
        on E: Exception do
        begin
          FErrorTitle := '执行错误！';
          FErrorInfo := e.Message;
          Synchronize(ShowMessageInfo);
        end;
      end;
    end;
  finally
    CoUninitialize;
  end;
end;

procedure TQueryDevRunStateOnTheTimeThd.SetInfo;
begin
  if Assigned(FOnQueryReturn) then
  begin
    FOnQueryReturn(FResultStr);
  end;
end;

procedure TQueryDevRunStateOnTheTimeThd.SetOnQueryReturn(
  const Value: TQueryReturnString);
begin
  FOnQueryReturn := Value;
end;

procedure TQueryDevRunStateOnTheTimeThd.SetParams(QueryTime: String;
  Group_Id: Integer; Group_paranet, DevIdStr: String);
begin
  FQueryTime := QueryTime;
  FGroup_Id := Group_Id;
  FGroup_paranet := Group_paranet;
  FDevIdStr := DevIdStr;
end;                  

procedure TQueryDevRunStateOnTheTimeThd.SetQueryType(const Value: Integer);
begin
  FQueryType := Value;
end;

procedure TQueryDevRunStateOnTheTimeThd.ShowMessageInfo;
begin
  try
    messageErrorBox(FErrorTitle, FErrorInfo);
  except
  end;
end;

end.
