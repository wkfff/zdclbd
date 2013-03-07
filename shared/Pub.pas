{*****************************************************************************}
{                                                                             }
{公共单元                                                                     }
{                                                                             }
{存放公共变量、函数                                                           }
{                                                                             }
{作者:杨桦                                                                    }
{                                                                             }
{时间:2008-8-2                                                                }
{                                                                             }
{*****************************************************************************}
unit Pub;

interface

uses
  Windows, SysUtils, Forms, RzListVw, DBClient, DB, ComCtrls, SysUsers, SysDev, Classes,
  Types, TLHelp32, Comobj{, DBControl};
type
   TLineInfo = packed record
    LineVer : array[0..5] of byte;  //6 线路信息版本号 BCD 使用时间标识的线路信息的版本号
    LineId : word;                  //2 线路编号 Short
    LineName:        array[0..31] of byte;   //34 线路名称 String 字符串，以'0/'表示结束  起点站/终点站的站点名称
    UpStartPlatName: array[0..31] of byte;   //34 上行起点站名称 String 字符串，以'0/'表示结束  起点站/终点站的站点名称
    UpEndPlatName:  array[0..31] of byte;   //34 上行终点站名称 String 字符串，以'0/'表示结束  起点站/终点站的站点名称
    DownStartPlatName :array[0..31] of byte; //34 下行起点站名称 String 字符串，以'0/'表示结束  起点站/终点站的站点名称
    DownEndPlatName : array[0..31] of byte;  //34 下行终点站名称 String 字符串，以'0/'表示结束  起点站/终点站的站点名称
    UpPlatCnt : Byte;               //1 上行站点数 Char
    DownPlatCnt :Byte;              //1 下行站点数 Char
    SoundFilePath : array[0..49] of byte;    //10 该线路音乐文件所在路径 String 每条线路的音乐文件所在目录，一条线路的音乐文件放在一个文件夹中。
    UpSoundFileName: array[0..31] of byte;   //12 上行语音文件名 CString 语音文件名占用12字节，不足12字节的补0处理（例如：L25001.MP3）。全0表示无语音上行进站时车外喇叭播放的语音文件文件名
    DownSoundFileName: array[0..31] of byte; //12 下行语音文件名 CString 语音文件名占用12字节，不足12字节的补0处理（例如：L25001.MP3）。全0表示无语音下行进站时车外喇叭播放的语音文件文件名
   end;
  PLineInfo = ^TLineInfo;

    TPlatRecord =  packed record//class
    Id: Byte;//1	站点编号	Char	1-255，按上行、下行站点的顺序独立编号
    PlatType:Byte;//1	站点类型	Char	0- 起始站 1- 终点站 2- 普通站点  4-转弯点
    PlatDirect:byte;//1	站点方向	Char	0- 下行  1- 上行 2-环线
    MaxSpeedSet:Byte;//1	速度限值	Char	当车速超过该限值时，播放"ALARM1.MP3"文件
    InDistance:word;//2	进站报站距离	Short	默认50米   单位：米
    OutDistance:word;//2	出站报站距离	Short	默认50米   单位：米
    InLongitude:integer;//4	进站经度	Int	经度X1000000
    InLatitude:integer;//4	进站纬度	Int	纬度X1000000
    OutLongitude:integer;//4	出站经度	Int	经度X1000000
    OutLatitude:integer;//4	出站纬度	Int	纬度X1000000
    PlatName:array[0..31] of byte;//34
    InMusicSoundName:array[0..31]of byte;     //12	进站音乐音文件名	String	语音文件的文件名，不足12字节的补0处理（例如：L25001.MP3）。全0表示无语音 当站点类型为0、1、2、4时该字段为进站时车内喇叭播放的语音文件名，
    InAdSoundName:array[0..31]of byte;        //12	进站广告音文件名	String	语音文件的文件名，不足12字节的补0处理（例如：L25001.MP3）。全0表示无语音 当站点类型为0、1、2、4时该字段为进站时车内喇叭播放的语音文件名，
    InPlayPlatSoundName1:array[0..31]of byte; //12	进站报站音1文件名	String	语音文件的文件名，不足12字节的补0处理（例如：L25001.MP3）。全0表示无语音 当站点类型为0、1、2、4时该字段为进站时车内喇叭播放的语音文件名
    InPlayPlatSoundName2:array[0..31]of byte; //12	进站报站音2文件名	String	语音文件的文件名，不足12字节的补0处理（例如：L25001.MP3）。全0表示无语音 当站点类型为0、1、2、4时该字段为进站时车内喇叭播放的语音文件名
    OutMusicSoundName:array[0..31]of byte;    //12	出站音乐音文件名	String	语音文件的文件名，不足12字节的补0处理（例如：L25001.MP3）。全0表示无语音  当站点类型为0、1、2、4时该字段为进站时车内喇叭播放的语音文件名
    OutAdSoundName:array[0..31]of byte;       //12	出站广告音文件名	String	语音文件的文件名，不足12字节的补0处理（例如：L25001.MP3）。全0表示无语音  当站点类型为0、1、2、4时该字段为进站时车内喇叭播放的语音文件名
    OutPlayPlatSoundName1:array[0..31]of byte;//12	出站报站音1文件名	String	语音文件的文件名，不足12字节的补0处理（例如：L25001.MP3）。全0表示无语音  当站点类型为0、1、2、4时该字段为进站时车内喇叭播放的语音文件名
    OutPlayPlatSoundName2:array[0..31]of byte;//12	出站报站音2文件名	String	语音文件的文件名，不足12字节的补0处理（例如：L25001.MP3）。全0表示无语音  当站点类型为0、1、2、4时该字段为进站时车内喇叭播放的语音文件名
  end;
  PPlatRecord=^TPlatRecord  ;



function CustormSortProc(Item1, Item2: TListItem; ParamSort: Integer): Integer; stdcall; //ListView排序
procedure FormWaitInfoShow;
procedure FormWaitInfoHide;
procedure LoadAvi;
procedure UnLoadAvi;
function CUserHaveGroup: Boolean;
function InCanUseGroup(GroupID: Integer): Boolean;
function InCanUserBusLine(BusLineID:Integer):Boolean;
procedure LvSelectState(lv: TRzListView; SelectState: Boolean);
function FindProcess(AFileName: string): boolean;
procedure ExportToExcel(Caption:String;LvData:TRzListView);overload;
procedure ExportToExcel(Caption:String;LvData1,LvData2:TRzListView);overload;
function IsIp(Str:string):Boolean;
function PopMsg(Title: string; Msg: string): boolean;
//function creatFile(lineID:integer):boolean;

var
  lUserID,lUserType: Integer;
  lUserName, lUserPwd: string;
  LvSort: Boolean; //控制ListView的升序或降序转换
  CanReConnect: Boolean;
  PriData: TClientDataSet;
  CanUseGroupID,CanUserBusLineID: TIntegerDynArray;
  IsOverTime:Boolean;
  FindStartIndex:Integer;

  UsersManage: TUsersManage;
  RoleManage: TRoleManage;
  PrivilegeManage: TPrivilegeManage;
  DevGroupManage: TDevGroupManage;
  CarCPManage: TCarCPManage;
  CarDJManage: TCarDJManage;
  ZPDJManage: TZPDJManage;
  LtggManage: TLTGGManage;
  BxxhManage: TBxxhManage;
  KtxhManage: TKtxhManage;
  CarTypeManage: TCarTypeManage;
  CarManage: TCarManage;
  DevMfManage: TDevMfManage;
  DevManage: TDevManage;
  ResManage: TResManage;
  StationNameManage: TStationNameManage;
  StationTypeManage: TStationTypeManage;
  StationManage: TStationManage;
  BusLineManage: TBusLineManage;
  LineStationsManage: TLineStationsManage;
  LineDevsManage: TLineDevsManage;
  SpeAreaTypesManage: TSpecialAreaTypeManage;
  DriverManage: TDriverManage;
  DriverTypeManage: TDriverTypeManage;
  PlanLineParamManage: TPlanLineParamManage;
  TrafficPlanManage: TTrafficPlanInfoManage;
  TrafficPlanExecuteManage: TTrafficPlanExecuteManage;
  BusDriversManage: TBusDriversManage;
  ServiceTypeManage: TServiceTypeManage;
  //dbc:TDBControl;
  aads: AADayServiceType;
  BCPlanManage: TBCPlanManage;
  DriversLeaveManage: TDriversLeaveManage;
  RunTimeModelManage: TRunTimeModelManage;
  PlanRunTimeManage: TPlanRunTimeManage;
  SysLogManage:TSysLogManage;
  ModelCarAndDriverManage:TModelCarAndDriverManage;
  ModelLineSEStationManage:TModelLineSEStationManage;
  MGroupMaxManage:TMGroupMaxManage;
  EntryRoadListManage,QEntryRoadListManage:TEntryRoadListManage;
  EntryUnTradingManage:TEntryUnTradingManage;
  BusParkManage:TBusParkManage;
  CarInBusParkManage:TCarInBusParkManage;
  RReplaceCardManage:TRestReplaceCardManage;
  AutoMobileMissionLevelManage:TAutoMobileMissionLevelManage;
  CarInLineManage:TCarInLineManage;
  RentCarsPlanManage:TRentCarsPlanManage;
  RentCarsPlanTimeManage:TRentCarsPlanTimeManage;
  MotorDriverManage:TDriverManage;//机动驾驶员
  PlanRunTimeModifyReasonManage:TPlanRunTimeModifyReasonManage;
  ExePath: string;
//procedure DoOnOverTimer(Sender:TObject);




implementation
uses frmMain, frmWaitInfo, BusinessUnit;

function PopMsg(Title: string; Msg: string): boolean;
begin
//  frmMain.Frm_Main.MSNPopUp1.Title := Title + '  ';
 // frmMain.Frm_Main.MSNPopUp1.Text := Msg;
 // Result := frmMain.Frm_Main.MSNPopUp1.ShowPopUp;
end;

function CustormSortProc(Item1, Item2: TListItem; ParamSort: Integer): Integer;
var
  txt1, txt2: string;
begin
  if (ParamSort <> 0) then
  begin
    txt1 := Item1.SubItems.Strings[ParamSort - 1];
    txt2 := Item2.SubItems.Strings[ParamSort - 1];
    if (LvSort) then
      Result := CompareText(txt1, txt2)
    else
      Result := -CompareText(txt1, txt2);
  end
  else
  begin
    if (LvSort) then
      Result := CompareText(Item1.Caption, Item2.Caption)
    else
      Result := -CompareText(Item1.Caption, Item2.Caption);
  end;
end;

procedure FormWaitInfoShow;
begin
  Frm_WaitInfo.Show;
  Frm_WaitInfo.Update;
  LoadAvi;
end;

procedure FormWaitInfoHide;
begin
  UnLoadAvi;
  Frm_WaitInfo.Hide;
end;

procedure LoadAvi;
begin
  if (FileExists(Trim(ExtractFilePath(Application.ExeName) + 'Res\loading.avi'))) then
  begin
    Frm_WaitInfo.Animate1.FileName := Trim(ExtractFilePath(Application.ExeName) + 'Res\loading.avi');
    Application.ProcessMessages;
    Frm_WaitInfo.Animate1.Visible := True;
    Frm_WaitInfo.Animate1.Active := True;
  end
  else
  begin
    Frm_WaitInfo.Animate1.FileName := '';
    Frm_WaitInfo.Animate1.Active := False;
    Frm_WaitInfo.Animate1.Visible := False;
  end;
end;

procedure UnLoadAvi;
begin
  Frm_WaitInfo.Animate1.FileName := '';
  Frm_WaitInfo.Animate1.Active := False;
  Frm_WaitInfo.Animate1.Visible := False;
end;

function CUserHaveGroup: Boolean;
begin
  Result := True;
  try
    {Frm_WaitInfo := TFrm_WaitInfo.Create(nil);
    Frm_WaitInfo.Show;
    LoadAvi;
    Frm_WaitInfo.Update;}       
    FormWaitInfoShow;

    Application.ProcessMessages;
    Frm_WaitInfo.lbInfo.Caption := '正在查询当前用户分组信息...';
    FBusiness.QueryUserGroupList(CanUseGroupID);

  finally
    FormWaitInfoHide;
  end;

  if (CanUseGroupID[0] = -1) then
    Result := False;
end;

function InCanUseGroup(GroupID: Integer): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := Low(CanUseGroupID) to High(CanUseGroupID) do
  begin
    if (CanUseGroupID[i] = GroupID) then
    begin
      Result := True;
      break;
    end;
  end;
end;

function InCanUserBusLine(BusLineID:Integer):Boolean;
var
  i:Integer;
begin
  Result := False;
  for i := Low(CanUserBusLineID) to High(CanUserBusLineID) do
  begin
    if (CanUserBusLineID[i]=BusLineID) then
    begin
      Result := True;
      break;
    end;
  end;
end;

procedure LvSelectState(lv: TRzListView; SelectState: Boolean);
var
  i: Integer;
begin
  for i := 0 to lv.Items.Count - 1 do
    lv.Items[i].Checked := SelectState;
end;

function FindProcess(AFileName: string): boolean;
var
  hSnapshot: THandle;//用于获得进程列表
  lppe: TProcessEntry32;//用于查找进程
  Found: Boolean;//用于判断进程遍历是否完成
  //KillHandle: THandle;//用于杀死进程
begin
  Result :=False;
  hSnapshot := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  lppe.dwSize := SizeOf(TProcessEntry32);
  Found := Process32First(hSnapshot, lppe);
  while Found do
  begin
    if ((UpperCase(ExtractFileName(lppe.szExeFile))=UpperCase(AFileName)) or (UpperCase(lppe.szExeFile )=UpperCase(AFileName))) then
    begin
      Result :=True;
    end;
    Found := Process32Next(hSnapshot, lppe);//将进程列表的下一个进程信息读入lppe记录中
  end;
end;

procedure ExportToExcel(Caption:String;LvData:TRzListView);
var
  ExlApp:Variant;
  i,j:Integer;
begin
  try
    ExlApp := CreateOleObject('Excel.Application');
    ExlApp.Workbooks.Add;
    ExlApp.Visible := True;
    ExlApp.Caption := Caption;
    ExlApp.Workbooks[1].WorkSheets[1].Rows[1].Font.Bold := True;
  except
    On E:Exception do
    begin
      Application.MessageBox(PChar('初始化Microsoft Excel失败:' + E.Message),'提示',MB_OK+MB_ICONERROR);
      ExlApp.Quit;
      Exit;
    end;
  end;

  Application.Restore;
  Application.BringToFront;

  for i := 0 to LvData.Columns.Count - 1 do
  ExlApp.Cells(1,i + 1) := LvData.Columns[i].Caption;


  for i := 0 to LvData.Items.Count - 1 do
  begin
    ExlApp.Cells[i + 2,1] := LvData.Items[i].Caption;
    for j := 1 to LvData.Columns.Count - 1 do
    ExlApp.Cells[i + 2,j + 1] := LvData.Items[i].SubItems.Strings[j - 1];
  end;
end;

procedure ExportToExcel(Caption:String;LvData1,LvData2:TRzListView);
var
  ExlApp:Variant;
  i,j:Integer;
begin
  try
    ExlApp := CreateOleObject('Excel.Application');
    ExlApp.Workbooks.Add;
    ExlApp.Visible := True;
    ExlApp.Caption := Caption;
    ExlApp.Workbooks[1].WorkSheets[1].Rows[1].Font.Bold := True;
  except
    On E:Exception do
    begin
      Application.MessageBox(PChar('初始化Microsoft Excel失败:' + E.Message),'提示',MB_OK+MB_ICONERROR);
      ExlApp.Quit;
      Exit;
    end;
  end;

  Application.Restore;
  Application.BringToFront;

  for i := 0 to LvData1.Columns.Count - 1 do
  ExlApp.Cells(1,i + 1) := LvData1.Columns[i].Caption;


  for i := 0 to LvData1.Items.Count - 1 do
  begin
    ExlApp.Cells[i + 2,1] := LvData1.Items[i].Caption;
    for j := 1 to LvData1.Columns.Count - 1 do
    ExlApp.Cells[i + 2,j + 1] := LvData1.Items[i].SubItems.Strings[j - 1];
  end;

  for i := 0 to LvData2.Columns.Count - 1 do
  ExlApp.Cells(LvData1.Items.Count + 3,i + 1) := LvData2.Columns[i].Caption;

  for i := 0 to LvData2.Items.Count - 1 do
  begin
    ExlApp.Cells[i + LvData1.Items.Count + 4,1] := LvData2.Items[i].Caption;
    for j := 1 to LvData2.Columns.Count - 1 do
    ExlApp.Cells[i + LvData1.Items.Count + 4,j + 1] := LvData2.Items[i].SubItems.Strings[j - 1];
  end;
end;

//function creatFile(lineID:integer):boolean;
//function ByteOderConvert_Word(AValue: Word): Word;
//type
//  TLongByte = packed record
//    a, b: Byte;
//  end;
//var
//  P: ^TLongByte;
//  t: Byte;
//begin
//  P := @AValue;
//  t := P^.a;
//  P^.a := P^.b;
//  P^.b := t;
//
//  Result := AValue;
//end;
//var
//  linestation:TLineStations;
//  BusLine:TBusLine;
//  i:integer;
//  buf:array[0..102400]  of byte;
//  fs:TFileStream;
//  AplatRecord:TPlatRecord;
//
//  s,s1:String;
//  banben:string;
//  check:integer;
//  Alength:integer;
//  LineInfo:TLineInfo;
//  Aname:string;
//
//begin
  //====

//   BusLine:=BusLineManage.Find(lineID);
//   if BusLine=nil then
//   begin
//     result:=false;
//     exit;
//   end;
//   FBusiness.QueryLineStations(lineID);   
//
//   ZeroMemory(@LineInfo,SizeOf(LineInfo));
//   if length(trim(BusLine.LINEBANBEN))>0 then
//   begin
//     for i:=0 to 5 do
//     begin
//        LineInfo.LineVer[i]:=strtoint('$'+copy(BusLine.LINEBANBEN,i*2+1,2));
//     end;
//   end;
//   LineInfo.LineId:=ByteOderConvert_Word(BusLine.BusLineID);
//   s1:=BusLine.BusLineName;
//   copymemory(@LineInfo.LineName[0],@s1[1],length(trim(s1)));
//
//   if BusLine.UpStationList.Count>0 then
//   begin
//     linestation:=BusLine.UpStationList.items[0];
//     s1:=linestation.StationName;//
//     copymemory(@LineInfo.UpStartPlatName[0],@s1[1],length(trim(s1)));
//     linestation:=BusLine.UpStationList.Items[ BusLine.UpStationList.Count-1];
//     s1:=linestation.StationName;//
//     copymemory(@LineInfo.UpEndPlatName[0],@s1[1],length(trim(s1)));
//   end;
//
//   if BusLine.DownStationList.Count>0 then
//   begin
//     linestation:=BusLine.DownStationList.Items[BusLine.DownStationList.Count-1];
//     s1:=linestation.StationName;//
//     copymemory(@LineInfo.DownStartPlatName[0],@s1[1],length(trim(s1)));
//
//     linestation:=BusLine.DownStationList.Items[ BusLine.DownStationList.Count-1];
//     s1:=linestation.StationName;//
//     copymemory(@LineInfo.DownEndPlatName[0],@s1[1],length(trim(s1)));
//   end;
//
//
//   LineInfo.UpPlatCnt:=BusLine.UpStationList.Count;
//   LineInfo.DownPlatCnt:=BusLine.DownStationList.Count;
//
//   if (LineInfo.UpPlatCnt=0) and (LineInfo.DownPlatCnt=0) then
//   begin
//     result:=false;
//     exit;
//   end;
//
//   s1:=BusLine.MUSICFILEDIR ;
//   copymemory(@LineInfo.SoundFilePath[0],@s1[1],length(trim(s1)));
//   s1:=BusLine.ONFILENAME;
//
//   copymemory(@LineInfo.UpSoundFileName[0],@s1[1],length(trim(s1)));
//   s1:=BusLine.DOWNFILENAME ;
//
//   copymemory(@LineInfo.DownSoundFileName[0],@s1[1],length(trim(s1)));
//   copymemory(@buf[0],@LineInfo,sizeof(LineInfo));
//
//   if BusLine<>nil then
//   begin
//       for i:=0 to BusLine.UpStationList.Count-1 do
//       begin
//         linestation:=BusLine.UpStationList.Items[i];
//         ZeroMemory(@AplatRecord,SizeOf(AplatRecord));
//         AplatRecord.Id:=i;
//         AplatRecord.PlatType:=2;
//         if i=0 then
//         begin
//          AplatRecord.PlatType:=0;
//         end;
//         if i=BusLine.UpStationList.Count-1 then
//         begin
//           AplatRecord.PlatType:=1;
//         end;
//         if  (BusLine.UpStationList.Count=0) or (BusLine.DownStationList.Count=0) then
//          begin
//            AplatRecord.PlatDirect:= 2 ;
//          end;
//
//
//         AplatRecord.MaxSpeedSet:=linestation.limitspeed;
//        //  linestation.limitspeed
//        //  Trunc(StrToFloat(Trim(RzEdit3.Text)) * 1000000)
//         AplatRecord.InDistance:=linestation.in_dis; //byteorderconver_word(linestation.);
//         AplatRecord.OutDistance:=linestation.out_dis; //byteorderconver_word(strtoint(Alistview.SubItems.Strings[16]));
//         AplatRecord.InLongitude:=linestation.longitude; //;ByteOderConvert_LongWord(strtoint(Alistview.SubItems.Strings[4])) ;
//         AplatRecord.InLatitude:=linestation.latitude; //ByteOderConvert_LongWord(strtoint(Alistview.SubItems.Strings[3]));
//         AplatRecord.OutLongitude:=linestation.outlongtude;//ByteOderConvert_LongWord(strtoint(Alistview.SubItems.Strings[6]));
//         AplatRecord.OutLatitude:=linestation.outlongtude;//ByteOderConvert_LongWord(strtoint(Alistview.SubItems.Strings[5]));
//         s1:=linestation.StationName;
//         copymemory(@AplatRecord.PlatName[0],@s1[1],length(trim(s1)));
//         S1:= linestation.FInMusicFile;
//         copymemory(@AplatRecord.InMusicSoundName[0],@s1[1],length(trim(s1)));
//
//          S1:=linestation.FInLedFile;
//          copymemory(@AplatRecord.InAdSoundName[0],@s1[1],length(trim(s1)));
//
//
//          S1:= linestation.FInStation1File;
//          copymemory(@AplatRecord.InPlayPlatSoundName1[0],@s1[1],length(trim(s1)));
//
//
//
//          S1:= linestation.FInStation2File;
//          copymemory(@AplatRecord.InPlayPlatSoundName2[0],@s1[1],length(trim(s1)));
//          S1:= linestation.FOutMusicFile;
//          copymemory(@AplatRecord.OutMusicSoundName[0],@s1[1],length(trim(s1)));
//
//          S1:= linestation.FOutLedFile;
//          copymemory(@AplatRecord.OutAdSoundName[0],@s1[1],length(trim(s1)));
//          S1:= linestation.FOutStation1File;
//          copymemory(@AplatRecord.OutPlayPlatSoundName1[0],@s1[1],length(trim(s1)));
//          S1:= linestation.FOutStation2File;
//          copymemory(@AplatRecord.OutPlayPlatSoundName2[0],@s1[1],length(trim(s1)));
//          copymemory(@buf[sizeof(LineInfo)+  i*sizeof(AplatRecord)],@AplatRecord,sizeof(AplatRecord));
//          Alength:=Alength+sizeof(AplatRecord);
//
//       end;
//
//       for i:=0 to BusLine.DownStationList.Count-1 do
//       begin
//         linestation:=BusLine.DownStationList.Items[i];
//         ZeroMemory(@AplatRecord,SizeOf(AplatRecord));
//         AplatRecord.Id:=i;
//         AplatRecord.PlatType:=2;
//         if i=0 then
//         begin
//          AplatRecord.PlatType:=0;
//         end;
//         if i=BusLine.UpStationList.Count-1 then
//         begin
//           AplatRecord.PlatType:=1;
//         end;
//         AplatRecord.PlatDirect:= 0 ;
//
//         AplatRecord.MaxSpeedSet:=linestation.limitspeed;
//
//         AplatRecord.InDistance:=0;//byteorderconver_word(linestation.);
//         AplatRecord.OutDistance:=0;//byteorderconver_word(strtoint(Alistview.SubItems.Strings[16]));
//         AplatRecord.InLongitude:=0;//;ByteOderConvert_LongWord(strtoint(Alistview.SubItems.Strings[4])) ;
//         AplatRecord.InLatitude:=0;//ByteOderConvert_LongWord(strtoint(Alistview.SubItems.Strings[3]));
//         AplatRecord.OutLongitude:=0;//ByteOderConvert_LongWord(strtoint(Alistview.SubItems.Strings[6]));
//         AplatRecord.OutLatitude:=0;//ByteOderConvert_LongWord(strtoint(Alistview.SubItems.Strings[5]));
//         s1:=linestation.StationName;
//         copymemory(@AplatRecord.PlatName[0],@s1[1],length(trim(s1)));
//         S1:= linestation.FInMusicFile;
//         copymemory(@AplatRecord.InMusicSoundName[0],@s1[1],length(trim(s1)));
//          S1:=linestation.FInLedFile;
//          copymemory(@AplatRecord.InAdSoundName[0],@s1[1],length(trim(s1)));
//          S1:= linestation.FInStation1File;
//          copymemory(@AplatRecord.InPlayPlatSoundName1[0],@s1[1],length(trim(s1)));
//          S1:= linestation.FInStation2File;
//          copymemory(@AplatRecord.InPlayPlatSoundName2[0],@s1[1],length(trim(s1)));
//          S1:= linestation.FOutMusicFile;
//          copymemory(@AplatRecord.OutMusicSoundName[0],@s1[1],length(trim(s1)));
//
//          S1:= linestation.FOutLedFile;
//          copymemory(@AplatRecord.OutAdSoundName[0],@s1[1],length(trim(s1)));
//          S1:= linestation.FOutStation1File;
//          copymemory(@AplatRecord.OutPlayPlatSoundName1[0],@s1[1],length(trim(s1)));
//          S1:= linestation.FOutStation2File;
//          copymemory(@AplatRecord.OutPlayPlatSoundName2[0],@s1[1],length(trim(s1)));
//          copymemory(@buf[sizeof(LineInfo)+(BusLine.UpStationList.Count + i)*sizeof(AplatRecord)],@AplatRecord,sizeof(AplatRecord));
//          Alength:=Alength+sizeof(AplatRecord);
//       end;
//       //生成=======文件
//           //===求校验i
//    Alength:=sizeof(LineInfo)+Alength;
//
//    check:=0;
//{    for i:=0 to  Alength-1 do
//    begin
//      check:=check+buf[i];
//    end;
//
//    buf[Alength]:=strtoint('$'+copy(inttohex(check,8),1,2));
//    buf[Alength+1]:=strtoint('$'+copy(inttohex(check,8),3,2));
//    buf[Alength+2]:=strtoint('$'+copy(inttohex(check,8),5,2));
//    buf[Alength+3]:=strtoint('$'+copy(inttohex(check,8),7,2));
//
//    Aname:=BusLine.BusLineName+'_'+BusLine.LINEBANBEN;
//   try
//      if not DirectoryExists( 'ftp文件\')then
//        CreateDir( 'ftp文件\');
//
//      if not DirectoryExists( 'ftp文件\' + BusLine.BusLineName)then
//        CreateDir( 'ftp文件\' + BusLine.BusLineName);
//
//      fs := TFileStream.Create( 'ftp文件\' + BusLine.BusLineName + '\' +Aname+'.LIP',fmCreate or fmOpenWrite);
//       //Messagebox(0, '数据生成成功！', '提示', mb_ok + mb_iconinformation);
//     try
//         fs.WriteBuffer(buf,Alength+4);
//      finally
//        fs.Free;
//      end;
//    except
//    end;   }
//    result:=true;;
//   end;
//end;


function IsIp(Str:string):Boolean;
var
  I, K, DotCnt: Integer;
  Num: string;
  Arr: array[1..4] of string;
begin
  Result := False;
  DotCnt := 0;
  For I := 1 to Length(Str) do
  begin
    if Not (Str[I] in ['0'..'9', '.']) then
      Exit
    else
    if Str[I] = '.' then
      inc(DotCnt);
  end;

  if DotCnt <> 3 then Exit;

  For K := 1 to 3 do
  begin
    I := Pos('.', Str);
    Num := Copy(Str, 1, I - 1);
    Delete(Str, 1, I);
    Arr[K] := Num;
  end;
  Arr[4] := Str;

  try
    DotCnt := 0;
    For I := 1 to 4 do
    begin
      K := StrToInt(Arr[I]);
      if ((K >= 0) and (K <= 255))   then
        Inc(DotCnt);
    end;
    if(DotCnt = 4)   then
    Result := True;
  except
  end;
end;

initialization
  //dbc := TDBControl.Create;
  UsersManage := TUsersManage.Create;
  RoleManage := TRoleManage.Create;
  PrivilegeManage := TPrivilegeManage.Create;

  DevGroupManage := TDevGroupManage.Create;
  CarCPManage := TCarCPManage.Create;
  CarDJManage := TCarDJManage.Create;
  ZPDJManage := TZPDJManage.Create;
  LtggManage := TLTGGManage.Create;
  BxxhManage := TBXXHManage.Create;
  KtxhManage := TKtxhManage.Create;
  CarTypeManage := TCarTypeManage.Create;
  CarManage := TCarManage.Create;
  DevMfManage := TDevMfManage.Create;
  DevManage := TDevManage.Create;
  ResManage := TResManage.Create;
  StationNameManage := TStationNameManage.Create;
  StationTypeManage := TStationTypeManage.Create;
  StationManage := TStationManage.Create;
  BusLineManage := TBusLineManage.Create;
  LineStationsManage := TLineStationsManage.Create;
  LineDevsManage := TLineDevsManage.Create;
  SpeAreaTypesManage := TSpecialAreaTypeManage.Create;
  DriverManage := TDriverManage.Create;
  DriverTypeManage := TDriverTypeManage.Create;
  PlanLineParamManage := TPlanLineParamManage.Create;
  TrafficPlanManage := TTrafficPlanInfoManage.Create;
  TrafficPlanExecuteManage := TTrafficPlanExecuteManage.Create;
  BusDriversManage := TBusDriversManage.Create;
  ServiceTypeManage := TServiceTypeManage.Create;
  BCPlanManage := TBCPlanManage.Create;
  DriversLeaveManage := TDriversLeaveManage.Create;
  RunTimeModelManage := TRunTimeModelManage.Create;
  PlanRunTimeManage := TPlanRunTimeManage.Create;
  SysLogManage := TSysLogManage.Create;
  ModelCarAndDriverManage := TModelCarAndDriverManage.Create;
  ModelLineSEStationManage := TModelLineSEStationManage.Create;
  MGroupMaxManage := TMGroupMaxManage.Create;
  EntryRoadListManage := TEntryRoadListManage.Create;
  QEntryRoadListManage := TEntryRoadListManage.Create;
  EntryUnTradingManage := TEntryUnTradingManage.Create;
  BusParkManage := TBusParkManage.Create;
  CarInBusParkManage := TCarInBusParkManage.Create;
  RReplaceCardManage := TRestReplaceCardManage.Create;
  AutoMobileMissionLevelManage := TAutoMobileMissionLevelManage.Create;
  CarInLineManage := TCarInLineManage.Create;
  RentCarsPlanManage := TRentCarsPlanManage.Create;
  RentCarsPlanTimeManage := TRentCarsPlanTimeManage.Create;
  MotorDriverManage := TDriverManage.Create;
  PlanRunTimeModifyReasonManage := TPlanRunTimeModifyReasonManage.Create;
finalization
  //dbc.Free;
  UsersManage.Free;
  RoleManage.Free;
  PrivilegeManage.Free;

  DevGroupManage.Free;
  DevManage.Free;
  CarCPManage.Free;
  CarDJManage.Free;
  ZPDJManage.Free;
  LtggManage.Free;
  BxxhManage.Free;
  KtxhManage.Free;
  CarTypeManage.Free;
  CarManage.Free;
  DevMfManage.Free;
  ResManage.Free;
  StationNameManage.Free;
  StationTypeManage.Free;
  StationManage.Free;
  BusLineManage.Free;
  LineStationsManage.Free;
  LineDevsManage.Free;
  SpeAreaTypesManage.Free;
  DriverManage.Free;
  DriverTypeManage.Free;
  PlanLineParamManage.Free;
  TrafficPlanManage.Free;
  TrafficPlanExecuteManage.Free;
  BusDriversManage.Free;
  ServiceTypeManage.Free;
  BCPlanManage.Free;
  DriversLeaveManage.Free;
  RunTimeModelManage.Free;
  PlanRunTimeManage.Free;
  SysLogManage.Free;
  ModelCarAndDriverManage.Free;
  ModelLineSEStationManage.Free;
  MGroupMaxManage.Free;
  EntryRoadListManage.Free;
  QEntryRoadListManage.Free;
  EntryUnTradingManage.Free;
  BusParkManage.Free;
  CarInBusParkManage.Free;
  RReplaceCardManage.Free;
  AutoMobileMissionLevelManage.Free;
  CarInLineManage.Free;
  RentCarsPlanManage.Free;
  RentCarsPlanTimeManage.Free;
  MotorDriverManage.Free;
  PlanRunTimeModifyReasonManage.Free;
end.
