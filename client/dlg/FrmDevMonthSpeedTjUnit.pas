{专为喀什做的，可查看半个月的速度曲线}
unit FrmDevMonthSpeedTjUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Series, TeEngine, TeeProcs, Chart, DbChart,
  ExtCtrls, ComCtrls, Gauges,
  TrackPlayUnit,CmdStructUnit,CarUnit,uFrmRefreshProgress, DB, ADODB,
  cxControls, cxSplitter, Grids, DBGrids, TeeFunci, PrnDbgeh, DBGridEh;

type
  TFrmDevMonthSpeedTj = class(TForm)
    Panel4: TPanel;
    DBChart1: TDBChart;
    LabelPage: TLabel;
    LabelSelectPointInfo: TLabel;
    Series1: TFastLineSeries;
    PanelControlLine: TPanel;
    BitBtnLeft: TBitBtn;
    BitBtnZoomIn: TBitBtn;
    BitBtnZoomOut: TBitBtn;
    BFirstPage: TBitBtn;
    ButtonZoomOld: TButton;
    ButtonPrevious: TBitBtn;
    ButtonNext: TBitBtn;
    BLastPage: TBitBtn;
    BitBtnRigth: TBitBtn;
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    BitBtnDrawLineFromDbFile: TBitBtn;
    BitBtnTjDay: TBitBtn;
    PanelControlDrawL: TPanel;
    Label3: TLabel;
    CheckBoxDrawStandSpeed: TCheckBox;
    EditSpeedStand: TEdit;
    Label11: TLabel;
    EditFromTime: TEdit;
    EditToTime: TEdit;
    Label5: TLabel;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ADOQueryDBGrid: TADOQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    cxSplitter1: TcxSplitter;
    GroupBox1: TGroupBox;
    RadioButtonDrawPointInAPage: TRadioButton;
    RadioButtonDrawPointInMultiPages: TRadioButton;
    EditAPageDrawCnt: TEdit;
    Series2: TFastLineSeries;
    TeeFunction1: THighTeeFunction;
    Label1: TLabel;
    EditPointCnt: TEdit;
    BitBtn4: TBitBtn;
    BitBtnOpenDbFile: TBitBtn;
    EditDbFileName: TEdit;
    Label2: TLabel;
    EditHisDisplayCarNo: TEdit;
    DataSource2: TDataSource;
    ADOQueryOverSpeedGrid: TADOQuery;
    DBGridEh1: TDBGridEh;
    BitBtn1: TBitBtn;
    BitBtnPrintChart: TBitBtn;
    BitBtn2: TBitBtn;
    PrintDBGridEh1: TPrintDBGridEh;
    BitBtnAnalyzeDataAgain: TBitBtn;
    procedure BitBtnDrawSpeedLineClick(Sender: TObject);
    procedure DBChart1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBChart1Zoom(Sender: TObject);
    procedure BFirstPageClick(Sender: TObject);
    procedure BitBtnLeftClick(Sender: TObject);
    procedure BitBtnRigthClick(Sender: TObject);
    procedure BitBtnZoomInClick(Sender: TObject);
    procedure BitBtnZoomOutClick(Sender: TObject);
    procedure BLastPageClick(Sender: TObject);
    procedure ButtonNextClick(Sender: TObject);
    procedure ButtonPreviousClick(Sender: TObject);
    procedure ButtonZoomOldClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtnAnalyzeDataAgainClick(Sender: TObject);
    procedure BitBtnDrawLineFromDbFileClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtnOpenDbFileClick(Sender: TObject);
    procedure BitBtnTjDayClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtnPrintChartClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    procedure DrawSpeedLine;

    procedure CalPage;
    procedure ScrollAxis(Axis: TChartAxis; const Percent: Double);
    function AnalyzeData: boolean;
    function AddDataToMdb: Boolean;
    function GetFirstTime: TDateTime;
    function GetLastTime: TDateTime;
    procedure UpdateDataBase(AGpsTime: TDateTime; AAddr: String;
      ASpeed: Integer; AIsGpsLocate: Boolean; AGpsCut, ADriverAlarm,
      AOverSpeedAlarm, ALade: Integer);
    function InitDataBase(AFirstTime, AEndTime: TDateTime): Boolean;
    procedure SetDrawPage;
    procedure StrReplace(var SrcStr: String; FindStr,ToStr: String);
    procedure DrawStandSpeedLine;
    procedure DrawLineFromDbFile;
    procedure TjDayOverSpeed;
   function TransCmdGpsData_Part(srvGpsData:TCmdSrvTermGpsData_V2;
     var termGpsData: TGpsData_V2):Boolean;
    procedure InsertDataBase(AGpsTime: TDateTime; ASpeed: integer);

    { Private declarations }
  public
    { Public declarations }
    PlayDev:TDevice;
    FDrawLineCnt : Integer;
    PageCurrent,Pages:Integer;
    FTrackPlay: TTrackPlay;
    FCurrentFile:string;

    FProgressDlg:TFrmRefreshProgress;
    FIsLoadAnalyzed:Boolean;
    procedure PlayFromServer(ADevID: Integer; AFact_id: Integer; ATimeFrom,  ATimeTo: TDateTime);
    function load_PlayInfo(const ATimeFrom, ATimeTo: TDateTime; const Astr: string):Boolean;
    function LoadAllGpsData(Progressdlg: TFrmRefreshProgress): boolean;

  end;

var
  FrmDevMonthSpeedTj: TFrmDevMonthSpeedTj;

implementation
uses RemoteTrackPlayUnit,DateUtils, StrUtils,uGloabVar,
SelectPlayGpsTimeUnit,
TeePrevi;
{$R *.dfm}

procedure TFrmDevMonthSpeedTj.DrawSpeedLine();  //画速度曲线v
var
  i,speeds,aPageCnt: Integer;
  gpsSrvTermData: TCmdSrvTermGpsData_V2;
  gpsData: TGpsData_V2;
  gpsTime :String;
begin
 { DBChart1.Series[0].Clear;
  DBChart1.Series[1].Clear;   
  for   i:=0 to FTrackPlay.Count -1 do
  begin
    Gauge1.Progress :=i;
    gpsSrvTermData := TCmdSrvTermGpsData_V2(FTrackPlay.Buf.Data[i]);
    TransCmdGpsData(gpsSrvTermData,gpsData);
    gpsTime := FormatDatetime('hh:nn:ss',gpsdata.GpsTime);
    DBChart1.Series[1].AddXY(i,gpsdata.Speed,gpsTime,clTeeColor);
    if CheckBoxDrawStandSpeed.Checked then
    begin
      try
        speeds := StrToInt(EditSpeedStand.Text);
      except
        speeds := 60;
      end;
      DBChart1.Series[0].AddXY(i,speeds,gpstime);
    end;
  end;
  FDrawLineCnt:= FTrackPlay.Count;
  try
    aPageCnt := strtoint(EditAPageDrawCnt.text);
  except
    aPageCnt := 200;
  end;
  DBChart1.BottomAxis.SetMinMax(0,aPageCnt);
  CalPage; }
end;


procedure TFrmDevMonthSpeedTj.BitBtnDrawSpeedLineClick(Sender: TObject);
var
  sp,aPageCnt : Integer;
begin
  if FTrackPlay = nil then Exit;
  if CheckBoxDrawStandSpeed.Checked then
  begin
    try
      sp := StrToInt(EditSpeedStand.Text);
    except
      MessageBox(Handle,'请您正确设置速度正常值！','提示',MB_OK + MB_ICONINFORMATION);
      EditSpeedStand.SetFocus;
      Exit;
    end;
  end;
  try
    aPageCnt := StrToInt(EditAPageDrawCnt.text);
  except
    MessageBox(Handle,'请您正确设置每页点数！','提示',MB_OK + MB_ICONINFORMATION);
    EditAPageDrawCnt.SetFocus;
    Exit;
  end;
  DrawSpeedLine;
end;


procedure TFrmDevMonthSpeedTj.BitBtnZoomInClick(Sender: TObject);
begin
  DBChart1.ZoomPercent(120);
  ButtonZoomOld.Enabled:=True;
end;

procedure TFrmDevMonthSpeedTj.BitBtnZoomOutClick(Sender: TObject);
begin
  DBChart1.ZoomPercent(80);
  ButtonZoomOld.Enabled:=True;
end;

procedure TFrmDevMonthSpeedTj.BitBtnRigthClick(Sender: TObject);
begin
  ScrollAxis(dbChart1.BottomAxis, -50);   
  CalPage; 
end;

procedure TFrmDevMonthSpeedTj.ScrollAxis(Axis: TChartAxis; const Percent: Double);
var
  Amount: Double;
begin
  with Axis do
    begin
      Amount := -((Maximum - Minimum) / (100.0 / Percent));
      SetMinMax(Minimum - Amount, Maximum - Amount);
    end;
end;

procedure TFrmDevMonthSpeedTj.BitBtnLeftClick(Sender: TObject);
begin
  ScrollAxis(dbChart1.BottomAxis, 50);
  CalPage; 
end;

procedure TFrmDevMonthSpeedTj.ButtonZoomOldClick(Sender: TObject);
begin
  DBChart1.UndoZoom;
  ButtonZoomOld.Enabled:= False;
  CalPage;
end;

procedure TFrmDevMonthSpeedTj.BFirstPageClick(Sender: TObject);
var
  dif :double;  //当前图中的　这一段的值
begin
  dif := dbchart1.BottomAxis.Maximum - DBChart1.BottomAxis.Minimum;
  DBChart1.BottomAxis.SetMinMax(0,dif);
  CalPage;
end;

procedure TFrmDevMonthSpeedTj.ButtonPreviousClick(Sender: TObject);
var
  dif :double;  //当前图中的　这一段的值
begin
  dif := dbchart1.BottomAxis.Maximum - DBChart1.BottomAxis.Minimum;
  DBChart1.BottomAxis.SetMinMax(DBChart1.BottomAxis.Minimum-dif,DBChart1.BottomAxis.Maximum -dif);
  CalPage;
end;

procedure TFrmDevMonthSpeedTj.ButtonNextClick(Sender: TObject);
var
  dif :double;  //当前图中的　这一段的值
begin
  dif := dbchart1.BottomAxis.Maximum - DBChart1.BottomAxis.Minimum;
  DBChart1.BottomAxis.SetMinMax(DBChart1.BottomAxis.Minimum+dif,DBChart1.BottomAxis.Maximum +dif);
  CalPage;
end;

procedure TFrmDevMonthSpeedTj.BLastPageClick(Sender: TObject);
var
  dif :double;  //当前图中的　这一段的值
begin             
  dif := dbchart1.BottomAxis.Maximum - DBChart1.BottomAxis.Minimum;
  DBChart1.BottomAxis.SetMinMax((Pages-1) *dif, Pages*dif);
  //DBChart1.BottomAxis.SetMinMax(FDrawLineCnt - dif,FDrawLineCnt);
  CalPage;
end;

procedure TFrmDevMonthSpeedTj.CalPage;
var
  dif :double;  //当前图中的　这一段的值
begin
  dif := dbchart1.BottomAxis.Maximum - DBChart1.BottomAxis.Minimum;
  if round(dif)= 0 then exit;
  //pages := round( FDrawLineCnt /dif);
  if (FDrawLineCnt mod round(dif)) <>0 then
    pages := FDrawLineCnt div round(dif) +1
  else
    pages := FDrawLineCnt div round(dif);
  if DBChart1.BottomAxis.Minimum =0 then
    pageCurrent:= 1
  else if dbchart1.BottomAxis.Maximum >= FDrawLineCnt then
    pageCurrent := pages
  else
  begin
    pageCurrent := round( dbchart1.BottomAxis.Maximum /dif);
  end;
  LabelPage.Caption := IntToStr(pageCurrent)+'/'+IntToStr(pages);

  ButtonPrevious.Enabled := True;
  ButtonNext.Enabled := True;
  if pageCurrent >= pages then
    ButtonNext.Enabled := False;
  if PageCurrent <=1 then
    ButtonPrevious.Enabled := False;
end;

procedure TFrmDevMonthSpeedTj.DBChart1Zoom(Sender: TObject);
begin
  if DBChart1.LeftAxis.Maximum>180 then DBChart1.LeftAxis.Maximum := 180;
  DBChart1.LeftAxis.Minimum := 0;
  CalPage;
end;

procedure TFrmDevMonthSpeedTj.DBChart1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
   tmp:integer;
begin
 { With Series1 do
  begin
    tmp:=Clicked(x,y);
    if tmp<> -1 then
    begin
      LabelSelectPointInfo.top:= y - 30;
      LabelSelectPointInfo.left:= x+10 ;
      LabelSelectPointInfo.caption:='时间:'+trim(ValueMarkText[tmp])+#13#10+'速度:'+formatfloat('#.#',GetMarkValue(tmp));
    end
    else
      LabelSelectPointInfo.Top:=-50;
  end; }
end;      

procedure TFrmDevMonthSpeedTj.PlayFromServer(ADevID: Integer; AFact_id: Integer; ATimeFrom,
  ATimeTo: TDateTime);
begin
  FreeAndNil(FTrackPlay);
  FTrackPlay := TRemoteTrackPlay.Create(ADevID,AFact_id,ATimeFrom,ATimeTo);
end;

function TFrmDevMonthSpeedTj.load_PlayInfo(const ATimeFrom,ATimeTo:TDateTime;const Astr:string):boolean;  //导入playDev的相关信息
begin
  Result := True;
  if FTrackPlay.Count<>0 then
  begin    
    EditHisDisplayCarNo.Text := PlayDev.Car.No;
    EditFromTime.Text:=FormatDatetime('yyyy-mm-dd hh:nn:ss',FTrackPlay.TimeFrom);
    EditToTime.Text:=FormatDatetime('yyyy-mm-dd hh:nn:ss',FTrackPlay.TimeTo);
  end
  else
  begin
    messagebox(handle,pchar('在时间段【'+FormatDateTime('yyyy-mm-dd hh:nn:ss',ATimeFrom)+
      '】到【'+FormatDateTime('yyyy-mm-dd hh:nn:ss',ATimeTo)+'】内，'+
      playDev.Car.No+'没有数据点!'),'提示',mb_ok + mb_iconinformation);
    Result := False;
  end;
end;

function TFrmDevMonthSpeedTj.LoadAllGpsData(Progressdlg :TFrmRefreshProgress) :boolean;
var
  i,n: Integer;
begin
  Result := False;
  if FTrackPlay = nil then Exit;
  if FTrackPlay.Buf.Count<>FTrackPlay.Count then
  begin
      Progressdlg.Show;

      if FTrackPlay.Count mod 50 =0 then
        n := FTrackPlay.Count div 50
      else
        n := FTrackPlay.Count div 50 +1;

      Progressdlg.Gauge1.MaxValue :=n+8;
      Application.ProcessMessages;
      for i:= 0 to n-1 do
      begin
        if not Progressdlg.Showing then  exit;
        FTrackPlay.Next;
        Progressdlg.Gauge1.AddProgress(1);
        Application.ProcessMessages;
      end;
  end;
  FTrackPlay.First;

  Result := True;
end;

function TFrmDevMonthSpeedTj.AnalyzeData:boolean;
var
  oldCurrent: integer;
  oldIsPlayStart : Boolean;
begin
  Result := False;
  if (FTrackPlay = nil)then
    exit;
  if FTrackPlay.Count=0 then
  begin
    MessageBox(Handle,'对不起，该时间段车辆没有数据！','提示',MB_OK + MB_ICONINFORMATION);
    Exit;
  end;
  try
    if not FIsLoadAnalyzed then   //载入数据后没分析过
    begin
      FreeAndNil(FProgressDlg);
      FProgressDlg := TFrmRefreshProgress.Create(self);
      FProgressDlg.Caption := '正在分析数据...';
      FProgressDlg.Label1.Caption := '正在分析数据，请稍候...';
      FProgressDlg.Gauge1.MaxValue := FTrackPlay.Count;
      FProgressDlg.Gauge1.Progress := 0;
      FProgressDlg.Show;

      try
        if not AddDataToMdb then exit;
        FIsLoadAnalyzed := True;
      finally
        FProgressDlg.Free;
      end;
    end;
    Result := True;
  finally
  
  end;
end;

procedure TFrmDevMonthSpeedTj.StrReplace(var SrcStr:String;FindStr,ToStr:String);
var
  i: integer;
  ss,lStr,rStr,destStr:string;
begin
  if Length(SrcStr)=0 then exit;
  destStr:= '';
  for i:= 1 to  Length(SrcStr)do
  begin
    ss := MidStr(SrcStr,i,1);
    if ss = FindStr then
      destStr := destStr+ToStr
    else
      destStr := destStr + ss;
  end;
  SrcStr := destStr;
end;

function TFrmDevMonthSpeedTj.TransCmdGpsData_Part(srvGpsData:TCmdSrvTermGpsData_V2;
    var termGpsData: TGpsData_V2):Boolean;
  function GetGpsTime(AOrg: array of Byte): TDateTime;
  var
    year, mon, day, hour, min, sec: Word;
  begin
    if (AOrg[1] = 0) and (AOrg[2] = 0) and (AOrg[3] = 0) and (AOrg[4] = 0) and (AOrg[5] = 0) then
    begin
      Result := 0;//EncodeDate(2000, 1, 1) + EncodeTime(0, 0, 0, 0);
      exit;
    end;
    year := 2000 + AOrg[0];
    mon := AOrg[1];
    day := AOrg[2];
    hour := AOrg[3];
    min := AOrg[4];
    sec := AOrg[5];
    try
      Result := EncodeDate(year, mon, day) + EncodeTime(hour, min, sec, 0)+1/3;  //这里加了8小时
    except
      Result := 0;
    end;
  end;
begin
  Result := True;
  try
    termGpsData.GpsTime := GetGpsTime(srvGpsData.GpsTime);
    termGpsData.Speed := srvGpsData.Speed;
  except
    Result := False;
  end;
end;

function TFrmDevMonthSpeedTj.AddDataToMdb:Boolean;
var
  i: integer;
  srvGpsData:TCmdSrvTermGpsData_V2;
  termGpsData: TGpsData_V2;
  dev: TDevice;
  isGpsLocate : Boolean;
  isGpsCut,isOverSpeedAlarm,isDriverAlarm,isLade:byte;
  tempLongWord : LongWord;

  firstTime,endTime:TDateTime; //时间段
  addr: string;                //位置地址
  time1,time2: String;
  dbName,hisName:String;
begin
  Result := false;
  if PlayDev = nil then exit;
  ADOConnection1.Connected := False;
  try
    dbName := EditHisDisplayCarNo.Text +'_'+EditFromTime.Text +'_'+EditToTime.Text;
    StrReplace(dbName,'-','');
    StrReplace(dbName,':','');
    dbName := dbName + '.mdb';
    SetCurrentDir(ExtractFilePath(Application.ExeName));
    dbName := ExpandFileName(dbName);
    hisName := ExpandFileName('History_tj.mdb');
    EditDbFileName.Text := dbName;
    while not FileExists(dbName) do
    begin
      CopyFile(pchar(hisName),pChar(dbName),False);
      Application.ProcessMessages;
    end;
    
    //设置数据库
    ADOConnection1.Connected := False;
    ADOConnection1.ConnectionString:= 'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;'+
      'Data Source='+dbName+';Persist Security Info=False';
    ADOConnection1.Connected := True;
    ADOQuery1.Connection := ADOConnection1;
    ADOQuery1.Close;
    ADOQuery1.SQL.Text:= 'delete from tab_tj';
    ADOQuery1.ExecSQL ;

     {//求出第一点和最后一点，以分钟初始化数据库＝＞每分钟放一条空的数据
   firstTime := GetFirstTime;
    FProgressDlg.GaugeProcessInc(1);
    endTime := GetLastTime;
    FProgressDlg.GaugeProcessInc(1);
    if not InitDataBase(firstTime,endTime) then exit; 
    //已有的数据（按分钟）插入数据库                  }
    //所有有效数据全插入数据库（如果一分钟有两条，则插入一条）
    time2 := '';
    FProgressDlg.Gauge1.MaxValue := FTrackPlay.Count;
    FProgressDlg.Gauge1.Progress:= 0;
    for i:= 0 to FTrackPlay.Count -1 do
    begin
      FProgressDlg.GaugeProcessInc(1);
      //srvGpsData := TCmdSrvTermGpsData_V2(FTrackPlay.Buf.Data[i]); //暂时去掉
      TransCmdGpsData_Part(srvGpsData,termGpsData);
      if termGpsData.GpsTime=0 then Continue;
      time1 := FormatDateTime('yyyy-mm-dd hh:nn',termGpsData.GpsTime);
      if time1= time2 then Continue;
      time2 := time1;

      (*tempLongWord := termGpsData.State;
      isGpsLocate := (tempLongWord and $1)=$1;

      if tempLongWord and $02000000 =$02000000 then// if PlayDev.Switch[25] then
        isGpsCut := 1         //Gps天线剪断
      else
        isGpsCut := 0;
      if tempLongWord and $00010000 = $00010000 then //if PlayDev.Switch[16] then
        isDriverAlarm := 1    //紧急报警
      else
        isDriverAlarm := 0;
      if tempLongWord and $00020000 = $00020000 then//if PlayDev.Switch[17] then
        isOverSpeedAlarm := 1  //超速报警
      else
        isOverSpeedAlarm := 0;
      //插入数据库
      UpdateDataBase(termGpsData.GpsTime,addr,termGpsData.Speed,isGpsLocate,
        isGpsCut,isDriverAlarm,isOverSpeedAlarm,isLade);   *)
      InsertDataBase(termGpsData.GpsTime,termGpsData.Speed);
    end;
    Result := True;
  except on E: Exception do
    begin
      Exception.Create(E.Message);
      ADOConnection1.Close;
    end;
  end;
end;

procedure TFrmDevMonthSpeedTj.InsertDataBase(AGpsTime:TDateTime;ASpeed:integer);
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Text := 'insert into tab_tj (gpstime,rq,speed) values'+
     '('''+FormatDateTime('yyyy-mm-dd hh:nn:ss',AGpsTime)+''','+
     ''''+FormatDateTime('yyyy-mm-dd',AGpsTime)+''','+IntToStr(ASpeed)+')';
  ADOQuery1.ExecSQL;
end;

function TFrmDevMonthSpeedTj.InitDataBase(AFirstTime, AEndTime: TDateTime):Boolean;
var
  i,n: Integer;
  dt : TDateTime;
begin
  Result := False;
  n:= MinutesBetween(AFirstTime,AEndTime)+1;
  dt := AFirstTime;
  FProgressDlg.Gauge1.MaxValue := n;
  for i:= 0 to n-1 do
  begin
    ADOQuery1.Close;
    ADOQuery1.SQL.Text := 'insert into tab_tj (gpstime,rq) values('''+
      FormatDateTime('yyyy-mm-dd hh:nn',dt)+''','''+FormatDateTime('yyyy-mm-dd',dt)+''')';
    ADOQuery1.ExecSQL;
    dt := IncMinute(dt,1);
    FProgressDlg.GaugeProcessInc(1);
  end;
  Result := True;
end;

function TFrmDevMonthSpeedTj.GetFirstTime: TDateTime;
{var
  i: integer;
  srvGpsData:TCmdSrvTermGpsData_V2;
  termGpsData: TGpsData_V2;
  isGpsLocate : boolean;   }
begin
  {if FTrackPlay = nil then Exit;
  FTrackPlay.First;
  while FTrackPlay.Next do
  begin
    srvGpsData := (FTrackPlay.Data)^;
    TransCmdGpsData(srvGpsData,termGpsData);
    isGpsLocate :=termGpsData.State and $1 = $1;
    if isGpsLocate then break;
  end;
  Result := termGpsData.GpsTime;}
  Result := StrToDateTime(EditFromTime.Text);
end;

function TFrmDevMonthSpeedTj.GetLastTime: TDateTime;
begin

  Result := StrToDateTime(EditToTime.Text);
end;

procedure TFrmDevMonthSpeedTj.UpdateDataBase(AGpsTime: TDateTime; AAddr: String;ASpeed: Integer;
  AIsGpsLocate: Boolean;AGpsCut,ADriverAlarm,AOverSpeedAlarm,ALade:Integer);
var
  locateValue: Integer;
  ret: Integer;
begin
  // 定位值　定位写入１50、在线写入200。
  if AIsGpsLocate then
    locateValue := 150
  else
    locateValue := 0;
  ADOQuery1.Close;
  ADOQuery1.SQL.Text := 'update tab_tj set addr = '''+AAddr+''','+
    'speed='+IntToStr(ASpeed)+',IsLocate='+IntToStr(locateValue)+',IsOnline=200,'+
    'IsGpsCut='+IntToStr(AGpsCut)+',IsDriverAlarm='+IntToStr(ADriverAlarm)+','+
    'IsOverSpeedAlarm='+IntToStr(AOverSpeedAlarm)+',IsLade ='+IntToStr(ALade*150)+
    ' where GpsTime = '''+ FormatDateTime('yyyy-mm-dd hh:nn',AGpsTime)+'''';
  ret := ADOQuery1.ExecSQL;
  //MessageBox(handle,pchar('ret='+IntToStr(ret)),'提示',MB_OK + MB_ICONINFORMATION); 
end;

procedure TFrmDevMonthSpeedTj.FormCreate(Sender: TObject);
begin
  ADOConnection1.Connected := False;
  PlayDev := TDevice.Create;
  RadioButtonDrawPointInAPage.Checked := True;
  PageControl1.ActivePageIndex :=0;
  LabelPage.Caption := '';
  LabelSelectPointInfo.top := -50;    
  EditAPageDrawCnt.Text := '500';
  EditSpeedStand.Text := '70';
  EditFromTime.Clear;
  EditToTime.Clear;
  EditPointCnt.Clear;
  EditDbFileName.Clear;
  EditHisDisplayCarNo.Clear;
end;

procedure TFrmDevMonthSpeedTj.FormDestroy(Sender: TObject);
begin
  PlayDev.Free;
  FTrackPlay.Free;
end;

procedure TFrmDevMonthSpeedTj.BitBtnAnalyzeDataAgainClick(Sender: TObject);
begin
  FIsLoadAnalyzed := False;
  AnalyzeData;
  TjDayOverSpeed;
  DrawLineFromDbFile;
  //BitBtnAnalyzeDataAgain.Enabled := False;
end;

procedure TFrmDevMonthSpeedTj.BitBtnDrawLineFromDbFileClick(Sender: TObject);
begin
  BitBtnDrawLineFromDbFile.Enabled := False;
  DrawLineFromDbFile;
end;

procedure TFrmDevMonthSpeedTj.DrawLineFromDbFile;
var
  aPageCnt:Integer;
begin
  try
    SetCurrentDir(ExtractFilePath(Application.ExeName));
    if not ADOConnection1.Connected then
    begin
      ADOConnection1.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;'+
        'Data Source='+EditDbFileName.Text +';Persist Security Info=False';
      ADOConnection1.LoginPrompt := False;
      ADOConnection1.Open;
    end;
    ADOQuery1.Connection := ADOConnection1;
    ADOQuery1.Close;
    ADOQuery1.SQL.Text := 'select * from tab_tj order by gpsTime';
    ADOQuery1.Open;
    ADOQueryDBGrid.Close;
    ADOQueryDBGrid.Connection := ADOConnection1;
    {//sql server数据库用：
    ADOQueryDBGrid.SQL.Text := 'select ''onlineStr'' = '+
      'case when isOnline =0 then ''否'' else ''在线'' end,'+
      '''locateStr''=case when isLocate=0 then ''否'' else ''定位'' end,* from tab_tj';
    //以下为Access数据库用：  }
    ADOQueryDBGrid.SQL.Text := 'select iif(isOnline=0,''否'',''在线'') as onlineStr,'+
      'iif(isLocate=0,''否'',''定位'') as locatestr,* from tab_tj order by gpsTime';
    ADOQueryDBGrid.Open;
    FDrawLineCnt := ADOQuery1.RecordCount;//FTrackPlay.Count;
    DrawStandSpeedLine;
    
    EditPointCnt.Text := IntToStr(FDrawLineCnt);
    SetDrawPage;
  finally
    //BitBtnDrawLineFromDbFile.Enabled := True;
  end;
end;

procedure TFrmDevMonthSpeedTj.DrawStandSpeedLine;
var
  i:integer;
begin
  for i:= 0 to FDrawLineCnt -1 do
  begin
    DBChart1.Series[1].AddY(70);
  end;
end;

procedure TFrmDevMonthSpeedTj.SetDrawPage;
var
  aPageCnt:Integer;
begin
  if RadioButtonDrawPointInAPage.Checked then
    DBChart1.BottomAxis.SetMinMax(0,FDrawLineCnt)
  else if RadioButtonDrawPointInMultiPages.Checked then
  begin
    try
    aPageCnt := strtoint(EditAPageDrawCnt.text);
    except
      aPageCnt := 500;
      EditAPageDrawCnt.text := '500';
    end;
    DBChart1.BottomAxis.SetMinMax(0,aPageCnt);
  end;
  CalPage;
end;

procedure TFrmDevMonthSpeedTj.BitBtn4Click(Sender: TObject);
var
  aPageCnt : Integer;
begin
  if RadioButtonDrawPointInMultiPages.Checked then
  begin
    try
      aPageCnt := StrToInt(EditAPageDrawCnt.text);
    except
      MessageBox(Handle,'请您正确设置每页点数！','提示',MB_OK + MB_ICONINFORMATION);
      EditAPageDrawCnt.SetFocus;
      Exit;
    end;
  end;
  SetDrawPage;
end;

procedure TFrmDevMonthSpeedTj.BitBtnOpenDbFileClick(Sender: TObject);
var
  dlg :TOpenDialog;
  car1: TCar;
  s,fileNameStr: string;
begin
  dlg:= TOpenDialog.Create(self);
  dlg.Filter := '*.mdb|*.mdb';
  if dlg.Execute then
  begin
    EditDbFileName.Text := dlg.FileName;
    fileNameStr:= ExtractFileName(dlg.FileName);
    car1.No := copy(fileNameStr,1,8);
    EditHisDisplayCarNo.text := car1.No;
    PlayDev.Car := car1;
    try
      s := copy(fileNameStr,10,15);
      EditFromTime.Text :=copy(s,1,4)+'-'+copy(s,5,2)+'-'+copy(s,7,2)+' '
        +copy(s,10,2)+':'+ copy(s,12,2)+':' + copy(s,14,2);
    except
      EditFromTime.Text := '';
    end;
    try
      s := copy(fileNameStr,26,15);
      EditToTime.Text := copy(s,1,4)+'-'+copy(s,5,2)+'-'+copy(s,7,2)+' '
        +copy(s,10,2)+':'+ copy(s,12,2)+':' + copy(s,14,2);
    except
      EditToTime.Text := '';
    end;
    BitBtnTjDay.Enabled := True;
    BitBtnDrawLineFromDbFile.Enabled :=True;
    ADOConnection1.Connected := False;
    TjDayOverSpeed;
    DrawLineFromDbFile;
  end;
end;

procedure TFrmDevMonthSpeedTj.BitBtnTjDayClick(Sender: TObject);
begin            
  BitBtnTjDay.Enabled := False;
  PageControl1.ActivePageIndex :=1;
  TjDayOverSpeed;
end;

procedure TFrmDevMonthSpeedTj.TjDayOverSpeed;
begin
  try
    if not ADOConnection1.Connected then
    begin
      ADOConnection1.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;'+
        'Data Source='+EditDbFileName.Text +';Persist Security Info=False';
      ADOConnection1.LoginPrompt := False;
      ADOConnection1.Open;
    end;
    ADOQueryOverSpeedGrid.Connection := ADOConnection1;
    ADOQueryOverSpeedGrid.Close;
    ADOQueryOverSpeedGrid.SQL.Text := 'select rq,count(*) as cnt from tab_tj where speed>70 group by rq';
    ADOQueryOverSpeedGrid.Open;
  except
  end;       
end;

procedure TFrmDevMonthSpeedTj.BitBtn1Click(Sender: TObject);
var
  startDateTime, endDateTime: Tdatetime;
  dev: TDevice;
  car: TCar;
  selectPlayFrm :TSelectPlayGpsTimeForm;
  dlg: TFrmRefreshProgress;
  i: integer;
begin
  if GCurSelectDev= nil then
  begin
    MessageBox(Handle,'请您先选择车辆！','提示',MB_OK + MB_ICONINFORMATION);
    exit;
  end;
  selectPlayFrm := TSelectPlayGpsTimeForm.Create(Self);
  try
    selectPlayFrm.Edit1.Text := GCurSelectDev.Car.No;
    selectPlayFrm.Edit2.Text := GCurSelectDev.DispLabel;
    selectPlayFrm.Edit3.Text := GCurSelectDev.SimNo;
    selectPlayFrm.Edit4.Text := GCurSelectDev.IdStr;
    selectPlayFrm.Edit5.Text := ADevGroupManage.find(GCurSelectDev.GroupID).Name;
    selectPlayFrm.Edit6.Text := GCurSelectDev.Car.Memo;
    selectPlayFrm.start_date.Date := EncodeDate(yearof(date),monthOf(date),1);
    selectPlayFrm.end_date.Date := Date;
    selectPlayFrm.ShowModal;
    if selectPlayFrm.ModalResult = mrOk then
    begin
      startDateTime := selectPlayFrm.start_date.DateTime;
      ReplaceTime(startDateTime, selectPlayFrm.start_time.Time);
      endDateTime := selectPlayFrm.end_date.DateTime;
      ReplaceTime(endDateTime, selectPlayFrm.end_time.Time);
      if DaysBetween(startDateTime,endDateTime)>15 then
      begin
        MessageBox(Handle,'对不起，最多只能为您载入15天的数据','提示',MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      EditDbFileName.Text := '';
      EditPointCnt.Text := '';
      EditFromTime.Text := FormatDatetime('yyyy-mm-dd hh:nn:ss', startDatetime);
      EditToTime.Text := FormatDatetime('yyyy-mm-dd hh:nn:ss', endDateTime);
      EditHisDisplayCarNo.Text := GCurSelectDev.Car.No;
      DBChart1.Series[0].Clear;
        //载入数据
      dlg := TFrmRefreshProgress.Create(Self);
      try
        dlg.Caption :='正在载入GPS历史数据...';
        dlg.Label1.Caption := '正在载入GPS历史数据，请稍候...';
        dlg.Show;
        dev := GCurSelectDev;
        PlayDev.Id := dev.Id;
        PlayDev.IdStr := dev.IdStr;
        PlayDev.GroupID := dev.GroupID;
        PlayDev.DispLabel := dev.DispLabel;
        PlayDev.SimNo := dev.SimNo;
        PlayDev.DriverNameTeL := dev.DriverNameTeL;

        car.Id := dev.Car.Id;
        car.No := dev.Car.No;
        car.ResId := dev.Car.ResId;
        Car.ResIndex := dev.Car.ResIndex;
        Car.stat := dev.Car.stat;
        Car.Memo := dev.Car.Memo; 
        PlayDev.Car:=car;
        PlayFromServer(playDev.Id, PlayDev.fact_id ,startDateTime, endDateTime);
        if not load_PlayInfo(startDateTime, endDateTime, '服务器数据') then
          Exit;
        LoadAllGpsData(dlg);
        EditPointCnt.Text := IntToStr(FTrackPlay.Count);
        FIsLoadAnalyzed := False;

        BitBtnAnalyzeDataAgain.Enabled := True;
        BitBtnTjDay.Enabled := True;
        BitBtnDrawLineFromDbFile.Enabled :=True;
        ADOConnection1.Connected := False;
      finally
        dlg.Free;
      end;
    end;
  finally
    selectPlayFrm.Free;
  end;
  {AnalyzeData;
  TjDayOverSpeed;
  DrawLineFromDbFile; }
end;

procedure TFrmDevMonthSpeedTj.BitBtnPrintChartClick(Sender: TObject);
begin
  chartpreview(self,DBChart1);
end;

procedure TFrmDevMonthSpeedTj.BitBtn2Click(Sender: TObject);
begin
  PrintDBGridEh1.DBGridEh := DBGridEh1;
  PrintDBGridEh1.PageHeader.CenterText.Clear;
  PrintDBGridEh1.PageHeader.CenterText.Add('车辆每日超速次数统计');
  PrintDBGridEh1.Preview;
end;

end.
