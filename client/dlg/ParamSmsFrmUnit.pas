unit ParamSmsFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls,CarUnit,ConstDefineUnit;

type
  TParamSmsFrm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtnSet: TBitBtn;
    BitBtn2: TBitBtn;
    Timer1: TTimer;
    ProgressBar1: TProgressBar;
    EditCar: TEdit;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    Panel6: TPanel;
    Panel7: TPanel;
    ListView1: TListView;
    Panel8: TPanel;
    BitBtn4: TBitBtn;
    BitBtnSel: TBitBtn;
    GroupBox3: TGroupBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    CheckBox34: TCheckBox;
    Edit34: TEdit;
    GroupBox2: TGroupBox;
    CheckBox5: TCheckBox;
    Edit5: TEdit;
    GroupBox4: TGroupBox;
    CheckBox14: TCheckBox;
    CheckBox15: TCheckBox;
    Edit14: TEdit;
    Edit15: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit11KeyPress(Sender: TObject; var Key: Char);    
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit6Change(Sender: TObject);
    procedure Edit8Change(Sender: TObject);
    procedure Edit11Change(Sender: TObject);
    procedure Edit12Change(Sender: TObject);
    procedure Edit7Change(Sender: TObject);
    procedure Edit15Change(Sender: TObject);
    procedure BitBtnSetClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit25Change(Sender: TObject);
    procedure Edit14Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtnSelClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
  private
    //buf:array of byte;

  private


    Function  SetStrParam(ATargetID:integer;ParamID:Word;StrParam:string):boolean;
    Function  SetIPParam(ATargetID:integer;ParamID:Word;IPParam:TEdit):boolean;
    Function  SetWordParam(ATargetID:integer;ParamID:Word;WordParam:string):boolean;
    Function  SetByteParam(ATargetID:integer;ParamID:Word;ByteParam:string):boolean;
    { Private declarations }
  protected
    Function SetParam(ATargetID:integer;ParamNO:integer):boolean;
   { Function SetParam0000(ATargetID:integer):boolean; //车载终端当前积分
    Function SetParam0100(ATargetID:integer):boolean; //设置监听号码
    Function SetParam0101(ATargetID:integer):boolean; //电话复位号码
    Function SetParam0102(ATargetID:integer):boolean; //短信息服务中心号   }
    Function SetParam0103(ATargetID:integer):boolean; //报警短信中心号码
    Function SetParam0200(ATargetID:integer):boolean; //APN参数
    Function SetParam0201(ATargetID:integer):boolean; //设置主中心IP地址
    Function SetParam0202(ATargetID:integer):boolean; //设置主中心域名
    Function SetParam0203(ATargetID:integer):boolean; //设置副中心IP地址
    Function SetParam0204(ATargetID:integer):boolean; //设置副中心域名
    Function SetParam0205(ATargetID:integer):boolean; //设置中心端口号
    Function SetParam0206(ATargetID:integer):boolean; //中心下发心跳间隔
    Function SetParam0207(ATargetID:integer):boolean; //域名解析服务器的IP
    Function SetParam0300(ATargetID:integer):boolean; //设置车载终端ID号
    Function SetParam0301(ATargetID:integer):boolean; //车载终端密码
 {   Function SetParam0400(ATargetID:integer):boolean; //超速速度                                                  超速速度
    Function SetParam0500(ATargetID:integer):boolean; //是否翻牌拍照
    Function SetParam0501(ATargetID:integer):boolean; //是否关门拍照
    Function SetParam0502(ATargetID:integer):boolean; //是否存储报警照片
    Function SetParam0503(ATargetID:integer):boolean; //主照片服务器地址
    Function SetParam0504(ATargetID:integer):boolean; //设置主照片服务器域名
    Function SetParam0505(ATargetID:integer):boolean; //副照片服务器地址
    Function SetParam0506(ATargetID:integer):boolean; //设置副照片服务器域名
    Function SetParam0507(ATargetID:integer):boolean; //设置照片服务器端口号
    Function SetParam0508(ATargetID:integer):boolean; //设置存储翻牌照片的时间段



    Function SetParam0600(ATargetID:integer):boolean; //预约订单转换即时订单时间

    Function SetParam0800(ATargetID:integer):boolean; //IC卡公司主IP
    Function SetParam0801(ATargetID:integer):boolean; //IC卡公司主port
    Function SetParam0802(ATargetID:integer):boolean; //IC卡公司备用IP
    Function SetParam0803(ATargetID:integer):boolean; //IC卡公司备用port
    Function SetParam0804(ATargetID:integer):boolean; //连接IC卡公司用户名
    Function SetParam0805(ATargetID:integer):boolean; //连接IC卡公司用密码  }
    function SetParam090D(ATargetID:integer):boolean; //设置副中心端口号  



    function  CheckEmpty:boolean;
    function  CheckError:boolean;
    procedure ParamSaveToDev(Dev:TDevice);
    procedure ShowParamToEdit(Dev:TDevice);
    procedure CheckNum(Sender: TObject;MaxNum,MinNum:Int64);//检查EDIT里的数字是不是在MAX和MIN之内
    procedure CheckLength(Sender: TObject;Len:Integer); //检查EDIT里的长度
    Function  CheckIP(Edit:TEdit):LongWord;
  protected
    paramNO:integer;
    LastComp:Integer;
    
    CurrentDev:TDevice;
    ListViewPointer:integer;
    CmdIDList:array of integer;
    HaveErrorIsSet:boolean;
  public
     procedure CreateParams(Var Param:TCreateParams);override;
    { Public declarations }
  end;

var
  ParamSmsFrm: TParamSmsFrm;

implementation
    uses UGloabVar,CmdStructUnit, GatewayServerUnit,uFrmSelectDevs;
{$R *.dfm}
//---------------------------------//


Function TParamSmsFrm.SetParam0301(ATargetID:integer):boolean; //车载终端密码
var
   temp: LongWord ;
begin
   temp:=StrToInt(Edit15.Text);
   temp:=ByteOderConvert_LongWord(temp);
   Result:= DataServer.SetDevParam_Sms(ATargetID,$301,@temp,4)
end;

Function TParamSmsFrm.SetParam0300(ATargetID:integer):boolean; //设置车载终端ID号
var
  buf:array of byte;
  i:integer;
begin
  SetLength(buf,5);
  buf[0]:=StrToInt('$'+copy(edit14.Text,1,2));
  i:=StrToInt64(copy(edit14.Text,3,10));
  i:=ByteOderConvert_LongWord(i);
  copyMemory(@buf[1],@i,4);
  Result:=DataServer.SetDevParam_Sms(ATargetID,$300,@buf[0],5);

end;

Function TParamSmsFrm.SetParam0207(ATargetID:integer):boolean; //域名解析服务器的IP
begin
   Result:= SetIPParam(ATargetID,$207,Edit13);
end;

Function TParamSmsFrm.SetParam0206(ATargetID:integer):boolean; //中心下发心跳间隔
begin
   Result:= SetByteParam(ATargetID,$206,Edit12.Text)
end;

Function TParamSmsFrm.SetParam0205(ATargetID:integer):boolean; //设置中心端口号
begin
   Result:= SetWordParam(ATargetID,$205,Edit11.Text)
end;

Function TParamSmsFrm.SetParam0204(ATargetID:integer):boolean; //设置副中心域名
begin
   Result:= SetStrParam(ATargetID,$204,Edit10.Text)
end;


Function TParamSmsFrm.SetParam0203(ATargetID:integer):boolean; //设置副中心IP地址
begin
  Result:= SetIPParam(ATargetID,$203,Edit9);
end;


Function TParamSmsFrm.SetParam0202(ATargetID:integer):boolean;
begin
  Result:= SetStrParam(ATargetID,$202,Edit8.Text)
end;



Function TParamSmsFrm.SetParam0201(ATargetID:integer):boolean;
begin
  Result:= SetIPParam(ATargetID,$201,Edit7);
end;


Function TParamSmsFrm.SetParam0200(ATargetID:integer):boolean;
var
  temp:string;
  Len:integer;
begin
  Temp:=Trim(Edit6.Text);
  Len:=Length(Temp);
  Result:= DataServer.SetDevParam_Sms(ATargetID,$200,@temp[1],Len)
end;

Function TParamSmsFrm.SetParam0103(ATargetID:integer):boolean;
var
  temp:string;
  Len:integer;
begin
  Temp:=Trim(Edit5.Text);
  Len:=Length(Temp);
  Result:= DataServer.SetDevParam_Sms(ATargetID,$103,@temp[1],Len)
end;



Function  TParamSmsFrm.SetByteParam(ATargetID:integer;ParamID:Word;ByteParam:string):boolean;
var
   temp: byte ;
begin
   temp:=StrToInt(ByteParam);
   Result:= DataServer.SetDevParam_Sms(ATargetID,ParamID,@temp,1)
end;

Function  TParamSmsFrm.SetWordParam(ATargetID:integer;ParamID:Word;WordParam:string):boolean;
var
   temp: Word ;
begin
   temp:=StrToInt(WordParam);
   temp:=ByteOderConvert_Word(temp);
   Result:= DataServer.SetDevParam_Sms(ATargetID,ParamID,@temp,2)
end;


Function  TParamSmsFrm.SetIPParam(ATargetID:integer;ParamID:Word;IPParam:TEdit):boolean;
var
  temp:LongWord;
begin
//  Result:=false;
  temp:=CheckIP(IPParam);
 // if temp=0 then exit;
  temp:=ByteOderConvert_LongWord(temp);
  Result:= DataServer.SetDevParam_Sms(ATargetID,ParamID,@temp,4)
end;

Function  TParamSmsFrm.SetStrParam(ATargetID:integer;ParamID:Word;StrParam:string):boolean;
var
  temp:string;
  Len:integer;
begin
  Temp:=Trim(StrParam);
  Len:=Length(Temp);
  Result:= DataServer.SetDevParam_Sms(ATargetID,ParamID,@temp[1],Len)
end;

Function TParamSmsFrm.SetParam(ATargetID:integer;ParamNO:integer):boolean;
begin
  case ParamNO of
    {1: Result:= SetParam0000(ATargetID);
    2: Result:= SetParam0100(ATargetID);
    3: Result:= SetParam0101(ATargetID);
    4: Result:= SetParam0102(ATargetID);
    }
    5: Result:= SetParam0103(ATargetID);
    6: Result:= SetParam0200(ATargetID);
    7: Result:= SetParam0201(ATargetID);
    8: Result:= SetParam0202(ATargetID);
    9: Result:= SetParam0203(ATargetID);
    10:Result:= SetParam0204(ATargetID);
    11:Result:= SetParam0205(ATargetID);
    12:Result:= SetParam0206(ATargetID);
    13:Result:= SetParam0207(ATargetID);

    14:Result:= SetParam0300(ATargetID);
    15:Result:= SetParam0301(ATargetID);

    {16:Result:= SetParam0400(ATargetID);

    17:Result:= SetParam0500(ATargetID);
    18:Result:= SetParam0501(ATargetID);
    19:Result:= SetParam0502(ATargetID);
    20:Result:= SetParam0503(ATargetID);
    21:Result:= SetParam0504(ATargetID);
    22:Result:= SetParam0505(ATargetID);
    23:Result:= SetParam0506(ATargetID);
    24:Result:= SetParam0507(ATargetID);
    25:Result:= SetParam0508(ATargetID);

    26:Result:= SetParam0600(ATargetID);

    28:Result:= SetParam0800(ATargetID);
    29:Result:= SetParam0801(ATargetID);
    30:Result:= SetParam0802(ATargetID);
    31:Result:= SetParam0803(ATargetID);
    32:Result:= SetParam0804(ATargetID);
    33:Result:= SetParam0805(ATargetID); }

    34:Result := SetParam090D(ATargetID);
  else
    Result:=false;
  end;
end;
//==================================//

procedure TParamSmsFrm.FormCreate(Sender: TObject);
var
  i:integer;
begin
  for i:=0 to Self.ComponentCount-1 do
  begin
    if Self.Components[i] is TEdit then
    begin
      TEdit(Components[i]).Text:='';
      TEdit(Components[i]).Enabled:=false;
      TEdit(Components[i]).Color:=clBtnFace;
    end;
  end;
 { Edit17.Text:='否';
  Edit18.Text:='否';
  Edit19.Text:='否';
  Edit17.Enabled:=false;
  Edit18.Enabled:=false;
  Edit19.Enabled:=false;
  Edit17.Color:=clBtnFace;
  Edit18.Color:=clBtnFace;
  Edit19.Color:=clBtnFace;
  if UpperCase(VersionFor)='ZB' then
    GroupBox9.Enabled:=false
  else
    GroupBox9.Enabled:=true;  }
end;

procedure TParamSmsFrm.CheckBox1Click(Sender: TObject);
var
  CheckBoxName:string;
  Num:string;
  i:integer;
  tempComponent:TComponent;
begin
  Num:='';
  CheckBoxName:=TCheckBox(Sender).Name;
  for i:=1 to Length(CheckBoxName) do
    begin
      if (CheckBoxName[i]>='0') and (CheckBoxName[i]<='9') then
         Num:=Num+CheckBoxName[i];
    end;
 tempComponent:=self.FindComponent('Edit'+Num) ;
 TWinControl(tempComponent).Enabled:=TCheckBox(Sender).Checked;
 if tempComponent is TEdit then
   if TCheckBox(Sender).Checked then
        TEdit(tempComponent).Color:=clWindow
   else TEdit(tempComponent).Color:=clBtnFace
 else
   if TCheckBox(Sender).Checked then
        TComboBox(tempComponent).Color:=clWindow
   else TComboBox(tempComponent).Color:=clBtnFace;
 {if CheckBoxName='CheckBox25' then
 begin
   if TCheckBox(Sender).Checked then
   begin
      Edit252.Color:=clWindow;
      Edit252.Enabled:=true;
   end
   else
   begin
      Edit252.Color:=clBtnFace;
      Edit252.Enabled:=false;
   end;
 end;

 if CheckBoxName='CheckBox27' then
 begin
   if TCheckBox(Sender).Checked then
   begin
      DateTimePicker1.Color:=clWindow;
      DateTimePicker1.Enabled:=true;
   end
   else
   begin
      DateTimePicker1.Color:=clBtnFace;
      DateTimePicker1.Enabled:=false;
   end;
 end;       }

end;

procedure TParamSmsFrm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
   if not (Key in [#8,'0'..'9',#22]) then Key := #0;
end;

procedure TParamSmsFrm.Edit11KeyPress(Sender: TObject; var Key: Char);
begin
   if not (Key in [#8,'0'..'9','-']) then Key := #0;
end;



procedure TParamSmsFrm.Edit7KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in [#8,'0'..'9','.']) then Key := #0;
end;


procedure TParamSmsFrm.CheckNum(Sender: TObject;MaxNum,MinNum:Int64);
var
  i:integer;
begin
  if TEdit(Sender).Text ='-' then exit;
  i:=length(TEdit(Sender).Text);
  if i>0 then
     if (StrToInt64(TEdit(Sender).Text)>MaxNum)or(StrToInt64(TEdit(Sender).Text)<MinNum) then
       begin
         TEdit(Sender).text:=copy(TEdit(Sender).Text,1,i-1);
         TEdit(Sender).SelStart:=i-1;
       end;
end;

procedure TParamSmsFrm.CheckLength(Sender: TObject;Len:Integer);
var
  i:integer;
begin
  i:=length(TEdit(Sender).Text);
  if i>Len then
  begin
     TEdit(Sender).text:=copy(TEdit(Sender).Text,1,i-1);
     TEdit(Sender).SelStart:=i-1;
  end;
end;

procedure TParamSmsFrm.Edit1Change(Sender: TObject);
begin
  CheckNum(Sender,32768,-32768);
end;

procedure TParamSmsFrm.Edit2Change(Sender: TObject);
begin
   CheckLength(Sender,20);
end;

procedure TParamSmsFrm.Edit6Change(Sender: TObject);
begin
  CheckLength(Sender,32);
end;

procedure TParamSmsFrm.Edit8Change(Sender: TObject);
begin
  CheckLength(Sender,128);
end;

procedure TParamSmsFrm.Edit11Change(Sender: TObject);
begin
  CheckNum(Sender,65535,0);
end;

procedure TParamSmsFrm.Edit12Change(Sender: TObject);
begin
  CheckNum(Sender,256,0);
end;

procedure TParamSmsFrm.Edit7Change(Sender: TObject);
begin
  CheckLength(Sender,15);
end;


procedure TParamSmsFrm.Edit15Change(Sender: TObject);
begin
  CheckNum(Sender,4294967295,0);
end;


Function  TParamSmsFrm.CheckIP(Edit:TEdit):LongWord;
 procedure  IPError;
 begin
     messagebox(handle,' IP地址有误,请重新输入! ','提示',mb_ok + mb_iconinformation);
     Edit.SetFocus;
 end;
var
  S,S1,S2,S3,S4:string;//  ,temp
  i:integer;
  IP:longWord;
  tempIP:LongWord;
begin
  Result:=$FFFFFFFF;
  S:=Edit.Text;
//-----------------------------------------------------------------------------------
  i:=Pos('.',S);
  if i=0 then
  begin
    IPError;
    exit;
  end;
  S1:=copy(S,1,i-1);
  if S1='' then
  begin
    IPError;
    exit;
  end;
  S:=Copy(S,i+1,Length(S)-i);
  tempIP:=StrToInt(S1);
  if not((tempIp>=0) and (tempIp<=255)) then
  begin
     IPError;
     exit;
  end;
  IP:=tempIp;
//-----------------------------------------------------------------------------------
  i:=Pos('.',S);
  if i=0 then
  begin
    IPError;
    exit;
  end;
  S2:=copy(S,1,i-1);
  if S2='' then
  begin
    IPError;
    exit;
  end;
  S:=Copy(S,i+1,Length(S)-i);
  tempIP:=StrToInt(S2);
  if not((tempIp>=0) and (tempIp<=255)) then
  begin
     IPError;
     exit;
  end;
  IP:=IP shl 8;
  IP:=IP+tempIp;
//-----------------------------------------------------------------------------------
  i:=Pos('.',S);
  if i=0 then
  begin
    IPError;
    exit;
  end;
  S3:=copy(S,1,i-1);
  if S3='' then
  begin
    IPError;
    exit;
  end;
  S:=Copy(S,i+1,Length(S)-i);
  tempIP:=StrToInt(S3);
  if not((tempIp>=0) and (tempIp<=255)) then
  begin
     IPError;
     exit;
  end;
  IP:=IP shl 8;
  IP:=IP+tempIp;
//-----------------------------------------------------------------------------------
  i:=Pos('.',S);
  if i<>0 then
  begin
    IPError;
    exit;
  end;
  S4:=S;
  if S4='' then
  begin
    IPError;
    exit;
  end;
  tempIP:=StrToInt(S4);
  if not((tempIp>=0) and (tempIp<=255)) then
  begin
     IPError;
     exit;
  end;
  IP:=IP shl 8;
  IP:=IP+tempIp;

  if i=$FFFFFFFF then
  begin
    IPError;
  end;
//-----------------------------------------------------------------------------------
Result:=IP;
end;



procedure TParamSmsFrm.BitBtnSetClick(Sender: TObject);
var
 i,j:integer;
 s:string;
 NO:integer;
begin
  BitBtnSet.Enabled:=false;
  if not CheckEmpty then
  begin
   BitBtnSet.Enabled:=true;
   exit;
  end;
  if not CheckError then
  begin
   BitBtnSet.Enabled:=true;
   exit;
  end;  
  if ListView1.Items.Count=0 then
  begin
    messagebox(handle,'车辆里不能为空!','提示',mb_ok + mb_iconinformation);
    BitBtnSet.Enabled:=true;
    exit;
  end;
   ListViewPointer:=0;
   CurrentDev:=TDevice(ListView1.Items.Item[ListViewPointer].Data);
   ParamNO:=0;
   j:=0;
   LastComp:=0;
  for i:=0 to Self.ComponentCount-1 do
  begin
    if (Self.Components[i] is  TCheckBox) then
    begin
        if TCheckBox(Self.Components[i]).Checked then
        begin
          inc(j);
          LastComp:=i;
        end;
    end;
  end;
  if (j=1)and(ListView1.Items.Count=1) then
  begin
    ParamSaveToDev(CurrentDev);
    S:=TCheckBox(Self.Components[LastComp]).Name;
    S:=copy(S,9,Length(S)-1);
    NO:=StrToInt(S);
    SetParam(CurrentDev.Id,NO);
    Close;
  end
  else
  begin
    ProgressBar1.Max:=j*10*ListView1.Items.Count+ListView1.Items.Count*10;
    ProgressBar1.Visible:=true;
    ProgressBar1.Position:=0;
    //Self.Height:=SET_H;
    SetLength(CmdIDList,ListView1.Items.Count);
    for i:=0 to ListView1.Items.Count-1 do  //保存到数据库;
    begin
       CmdIDList[i]:=-1;
       CurrentDev:=TDevice(ListView1.Items.Item[i].Data);
       if CurrentDev=nil then continue;
       ParamSaveToDev(CurrentDev);
       ProgressBar1.StepIt;
    end;
    Timer1.Enabled:=true;
    HaveErrorIsSet:=false;
    Timer1Timer(Timer1);
  end;
end;

procedure TParamSmsFrm.Timer1Timer(Sender: TObject);
     function CheckCanSetParam:boolean;
     var
       i:integer;
       state:byte;
     begin
       if CmdIDList[0]=-1 then  //判断是否为第一次发送.
       begin
         Result:=true;
         exit;
       end;
       Result:=false;
       for i:=0 to ListView1.Items.Count-1 do
       begin
         state:=(ACmdManage.Find(CmdIDList[i]))^.State;
         if state = CMD_SNDNODO then      //如果有一个还处于发送状态,就认为没有发送完,继续等待.
         begin
           exit;
         end
         else if state= CMD_DONE then //成功
         begin
           if paramNO > LastComp then
           begin
             Timer1.Enabled := False;
             close;
             exit;
           end;
         end
         else if not(State = CMD_DONE)or(State = CMD_REPLACE) then // 如果有一个发送错误,就报错,告诉用户是否接着发送.
         begin
           if HaveErrorIsSet then continue;
           timer1.Enabled:=false;
           if messagebox(handle,Pchar('设置'+ADeviceManage.FindToCarNO(ACmdManage.Find(CmdIDList[i]).DevId)+'参数出错!是否继续设置?'),pchar('提示'),MB_YESNO)=ID_YES then
           begin
              HaveErrorIsSet:=true;
              timer1.Enabled:=true;
           end
           else
           begin
              BitBtn2Click(nil);
              exit;
           end;
         end;
       end;
       Result:=true;
     end;
var
  i,j:integer;
  s:string;
  NO:integer;
begin
  if (ParamNO >=self.ComponentCount){or (paramNO > LastComp )} then
  begin
     timer1.Enabled:=false;
     BitBtn2Click(nil);     
     close;
     exit;
  end;
  if not(Self.Components[ParamNO] is  TCheckBox) then
  begin
     inc(ParamNO);
  end
  else if not TCheckBox(Self.Components[ParamNO]).Checked then
    inc(ParamNO);
  i:=ParamNO;
  if  (CheckCanSetParam)and(i<Self.ComponentCount) then
  begin
    if (Self.Components[i] is  TCheckBox) then
    begin
       if TCheckBox(Self.Components[i]).Checked then
       begin
             S:=TCheckBox(Self.Components[i]).Name;
             S:=copy(S,9,Length(S)-1);
             NO:=StrToInt(S);
             for j:=0 to ListView1.Items.Count-1 do
             begin
                CurrentDev:=TDevice(ListView1.Items.Item[j].Data);
                if CurrentDev=nil then continue;
                SetParam(CurrentDev.Id,NO);
                CmdIDList[j]:=GSetParamCmdID_SMS;
                ProgressBar1.StepIt;
             end;
            inc(ParamNO)
       end
       else
       begin
          inc(ParamNO);
       end;
    end
    else
    begin
      inc(ParamNO);
    end;
  end;
end;

procedure TParamSmsFrm.BitBtn2Click(Sender: TObject);
begin   
  Timer1.Enabled:=false;
  Close;
end;

function  TParamSmsFrm.CheckEmpty:boolean;
var
  CheckBoxName:string;
  Num:string;
  j,Conut:integer; //     i,
  tempComponent:TComponent;
begin
  Num:='';
Result:=false;
Conut:=0;
for j:=0 to Self.ComponentCount-1 do
begin
  if not(Self.Components[j] is TCheckBox) then Continue;
  if not TCheckBox(Self.Components[j]).Checked then
     Continue
  else
     Inc(Conut);
  CheckBoxName:=TCheckBox(Self.Components[j]).Name;
  Num:=Copy(CheckBoxName,9,Length(CheckBoxName)-8);
   
 tempComponent:=self.FindComponent('Edit'+Num) ;
 if tempComponent is TEdit then
   if  TEdit(tempComponent).Text='' then
   begin
      TEdit(tempComponent).SetFocus;
      messagebox(handle,' 参数值不能为空!  ','提示',mb_ok + mb_iconinformation);
      exit;
   end
 else
   if  TComboBox(tempComponent).Text='' then
   begin
      TComboBox(tempComponent).SetFocus;
      messagebox(handle,' 参数值不能为空!  ','提示',mb_ok + mb_iconinformation);
      exit;
   end;
end;
if Conut=0 then
begin
  messagebox(handle,' 请选择一个参数!  ','提示',mb_ok + mb_iconinformation);
  exit;
end;
 Result:=true;
end;

procedure TParamSmsFrm.Edit25Change(Sender: TObject);
begin
  CheckNum(sender,24,0);
end;

procedure TParamSmsFrm.Edit14Change(Sender: TObject);
begin
  CheckLength(Sender,12);
end;

procedure TParamSmsFrm.CreateParams(Var Param:TCreateParams);
begin
   Inherited CreateParams(Param);
   Param.wndParent := GetDesktopWindow; //getforegroundwindow
end;

procedure TParamSmsFrm.FormShow(Sender: TObject);
begin
    ProgressBar1.Visible:=false;
//   Self.Height:=SHOW_H;
   BitBtnSet.Enabled:=true;
   if ListView1.Items.Count > 0 then
   begin
     Listview1.Items.Item[0].Selected:=true;
     ListView1.SetFocus;
     ListView1Click(nil);
   end;
   BitBtnSet.SetFocus;
end;

procedure TParamSmsFrm.ParamSaveToDev(Dev:TDevice);
begin
  {if CheckBox1.Checked  then
  begin
    Dev.Param.CurrentIntegral:=Edit1.Text;
    BS.SaveDevParam(Dev.IdStr,$0000,Dev.Param.CurrentIntegral);
  end;
  if CheckBox2.Checked  then
  begin
    Dev.Param.MonitorTelNum:=edit2.Text;
    BS.SaveDevParam(Dev.IdStr,$0100,Dev.Param.MonitorTelNum);
  end;

  if CheckBox3.Checked  then
  begin
    Dev.Param.RestorationTeLNum:=edit3.Text;
    Bs.SaveDevParam(Dev.IdStr,$0101,Dev.Param.RestorationTeLNum);
  end;

  if CheckBox4.Checked  then
  begin
    Dev.Param.NoteServiceCenterNum:=edit4.Text;
    Bs.SaveDevParam(Dev.IdStr,$102,Dev.Param.NoteServiceCenterNum);
  end;     }
 { if CheckBox5.Checked  then    // 暂时去掉 liu
  begin
    Dev.Param.NoteAlarmCenterNum:=edit5.Text;
    Bs.SaveDevParam(Dev.IdStr,$103,Dev.Param.NoteAlarmCenterNum);
  end;

  if CheckBox6.Checked  then
  begin
    Dev.Param.APN:=edit6.Text;
    Bs.SaveDevParam(Dev.IdStr,$200,Dev.Param.APN);
  end;
  if CheckBox7.Checked  then
  begin
    Dev.Param.IP_MainCenter:=edit7.Text;
    Bs.SaveDevParam(Dev.IdStr,$201,Dev.Param.IP_MainCenter);
  end;
  if CheckBox8.Checked  then
  begin
    Dev.Param.DomainNameOfMainCenter:=edit8.Text;
    Bs.SaveDevParam(Dev.IdStr,$202,Dev.Param.DomainNameOfMainCenter);
  end;
  if CheckBox9.Checked  then
  begin
    Dev.Param.IP_AssistantCenter:=edit9.Text;
    Bs.SaveDevParam(Dev.IdStr,$203,Dev.Param.IP_AssistantCenter);
  end;
  if CheckBox10.Checked then
  begin
    Dev.Param.DomainNameOfAssistantCenter:=edit10.Text;
    Bs.SaveDevParam(Dev.IdStr,$204,Dev.Param.DomainNameOfAssistantCenter);
  end;
  if CheckBox11.Checked then
  begin
    Dev.Param.PortOfCenter:=edit11.Text;
    Bs.SaveDevParam(Dev.IdStr,$205,Dev.Param.PortOfCenter);
  end;
  if CheckBox12.Checked then
  begin
    Dev.Param.HeartbeatInterval:=edit12.Text;
    Bs.SaveDevParam(Dev.IdStr,$206,Dev.Param.HeartbeatInterval);
  end;
  if CheckBox13.Checked then
  begin
    Dev.Param.DNS_IP:=edit13.Text;
    Bs.SaveDevParam(Dev.IdStr,$207,Dev.Param.DNS_IP);
  end;
  if CheckBox14.Checked then
  begin
    Dev.Param.DevID:=edit14.Text;
    Bs.SaveDevParam(Dev.IdStr,$300,Dev.Param.DevID);
  end;
  if CheckBox15.Checked then
  begin
    Dev.Param.Password:=edit15.Text;
    Bs.SaveDevParam(Dev.IdStr,$301,Dev.Param.Password);
  end;          }
 { if CheckBox16.Checked then
  begin
    Dev.Param.Overspeed:=edit16.Text;
    Bs.SaveDevParam(Dev.IdStr,$400,Dev.Param.Overspeed);
  end;
  if CheckBox17.Checked then
  begin
    Dev.Param.isTurnBrandPhoto:=edit17.Text;
    Bs.SaveDevParam(Dev.IdStr,$500,Dev.Param.isTurnBrandPhoto);
  end;
  if CheckBox18.Checked then
  begin
    Dev.Param.isCloseDoorPhoto:=edit18.Text;
    Bs.SaveDevParam(Dev.IdStr,$501,Dev.Param.isCloseDoorPhoto);
  end;
  if CheckBox19.Checked then
  begin
    Dev.Param.isSaveAlarmPhoto:=edit19.Text;
    Bs.SaveDevParam(Dev.IdStr,$502,Dev.Param.isSaveAlarmPhoto);
  end;
  if CheckBox20.Checked then
  begin
    Dev.Param.IP_MainPhoto:=edit20.Text;
    Bs.SaveDevParam(Dev.IdStr,$503,Dev.Param.IP_MainPhoto);
  end;
  if CheckBox21.Checked then
  begin
    Dev.Param.DomainNameOfMainPhoto:=edit21.Text;
    Bs.SaveDevParam(Dev.IdStr,$504,Dev.Param.DomainNameOfMainPhoto);
  end;
  if CheckBox22.Checked then
  begin
    Dev.Param.IP_AssistantPhoto:=edit22.Text;
    Bs.SaveDevParam(Dev.IdStr,$505,Dev.Param.IP_AssistantPhoto);
  end;
  if CheckBox23.Checked then
  begin
    Dev.Param.DomainNameOfAssistantPhoto:=edit23.Text;
    Bs.SaveDevParam(Dev.IdStr,$506,Dev.Param.DomainNameOfAssistantPhoto);
  end;
  if CheckBox24.Checked then
  begin
    Dev.Param.PortOfPhoto:=edit24.Text;
    Bs.SaveDevParam(Dev.IdStr,$507,Dev.Param.PortOfPhoto);
  end;
  if CheckBox25.Checked then
  begin
    Dev.Param.SavePhotoTimeBegin:=edit25.Text;
    Bs.SaveDevParam(Dev.IdStr,$508,Dev.Param.SavePhotoTimeBegin);
  end;
  if CheckBox25.Checked then
  begin
  Dev.Param.SavePhotoTimeEnd:=edit252.Text;
    Bs.SaveDevParam(Dev.IdStr,$2508,Dev.Param.SavePhotoTimeEnd);
  end;
  if CheckBox26.Checked then
  begin
  Dev.Param.OrderFormTurnTime :=edit26.Text;
    Bs.SaveDevParam(Dev.IdStr,$600,Dev.Param.OrderFormTurnTime);
  end;

  if CheckBox28.Checked then
  begin
  Dev.Param.ICIP :=edit28.Text;
    Bs.SaveDevParam(Dev.IdStr,$800,Dev.Param.ICIP);
  end;
  if CheckBox29.Checked then
  begin
  Dev.Param.ICPort :=edit29.Text;
    Bs.SaveDevParam(Dev.IdStr,$801,Dev.Param.ICPort);
  end;
  if CheckBox30.Checked then
  begin
  Dev.Param.ICIPBak :=edit30.Text;
    Bs.SaveDevParam(Dev.IdStr,$802,Dev.Param.ICIPBak);
  end;
  if CheckBox31.Checked then
  begin
  Dev.Param.ICPortBak :=edit31.Text;
    Bs.SaveDevParam(Dev.IdStr,$803,Dev.Param.ICPortBak);
  end;
  if CheckBox32.Checked then
  begin
  Dev.Param.ICUser :=edit32.Text;
    Bs.SaveDevParam(Dev.IdStr,$804,Dev.Param.ICUser);
  end;
  if CheckBox33.Checked then
  begin
    Dev.Param.ICPassword :=edit33.Text;
    Bs.SaveDevParam(Dev.IdStr,$805,Dev.Param.ICPassword);
  end;                         }
  //副中心端口号 sha 20081231
  {if CheckBox34.Checked then        // 暂时去掉 liu
  begin
    Dev.Param.PortOfCenter2 := Trim(Edit34.Text);
    Bs.SaveDevParam(Dev.IdStr,$090D,Dev.Param.PortOfCenter2);
  end;  }

end;

procedure TParamSmsFrm.ShowParamToEdit(Dev:TDevice);
begin
  EditCar.Text := dev.Car.No;

  { Edit1.Text :=Dev.Param.CurrentIntegral;
   edit2.Text :=Dev.Param.MonitorTelNum;
   edit3.Text:= Dev.Param.RestorationTeLNum;
   edit4.Text:= Dev.Param.NoteServiceCenterNum; }
   edit5.Text:= Dev.Param.NoteAlarmCenterNum;
   edit6.Text:= Dev.Param.APN;
   edit7.Text:= Dev.Param.IP_MainCenter;
   edit8.Text:=  Dev.Param.DomainNameOfMainCenter;
   edit9.Text:=   Dev.Param.IP_AssistantCenter;
   edit10.Text :=  Dev.Param.DomainNameOfAssistantCenter;
   edit11.Text := Dev.Param.PortOfCenter;
   Edit34.Text := Dev.Param.PortOfCenter2;//
   edit12.Text:=  Dev.Param.HeartbeatInterval;
   edit13.Text:=  Dev.Param.DNS_IP;
   edit14.Text:= Dev.Param.DevID;
   edit15.Text:= Dev.Param.Password;
 {   edit16.Text:= Dev.Param.Overspeed;
  edit17.Text:=  Dev.Param.isTurnBrandPhoto;
   edit18.Text:= Dev.Param.isCloseDoorPhoto;
   edit19.Text:=   Dev.Param.isSaveAlarmPhoto;
   edit20.Text:=  Dev.Param.IP_MainPhoto;
   edit21.Text:=   Dev.Param.DomainNameOfMainPhoto;
   edit22.Text:=   Dev.Param.IP_AssistantPhoto;
   edit23.Text:=   Dev.Param.DomainNameOfAssistantPhoto;
   edit24.Text := Dev.Param.PortOfPhoto;
   edit25.Text:=  Dev.Param.SavePhotoTimeBegin;
   edit252.Text:= Dev.Param.SavePhotoTimeEnd;
   edit26.Text:= Dev.Param.OrderFormTurnTime ;
   edit28.Text:=Dev.Param.ICIP;
   edit29.Text:=Dev.Param.ICPort;
   edit30.Text:=Dev.Param.ICIPBak;
   edit31.Text:=Dev.Param.ICPortBak;
   edit32.Text:=Dev.Param.ICUser;
   edit33.Text:=Dev.Param.ICPassword;
   try
     if Length(Dev.Param.TaxiMetaStopDateTime)=12 then
     begin
       DateTimePicker1.Date:=StrToDate(Copy(Dev.Param.TaxiMetaStopDateTime,1,10));
       Edit27.Text:=Copy(Dev.Param.TaxiMetaStopDateTime,11,2);
     end
     else
     begin
       DateTimePicker1.Date:=StrToDate('2000-01-01');
       Edit27.Text:='';
     end;
   except
      DateTimePicker1.Date:=StrToDate('2000-01-01');
      Edit27.Text:='';
   end;     }
end;


function TParamSmsFrm.CheckError: boolean;
var
  i:longword;
begin
  Result:=false;
 if CheckBox7.Checked then i:=CheckIP(edit7);
 if i=$FFFFFFFF then exit;
 if CheckBox9.Checked then i:=CheckIP(Edit9);
 if i=$FFFFFFFF then exit;
 if CheckBox13.Checked then i:=CheckIP(Edit13);
 {if i=$FFFFFFFF then exit;
 if CheckBox20.Checked then i:=CheckIP(Edit20);
 if i=$FFFFFFFF then exit;
 if CheckBox22.Checked then i:=CheckIP(Edit22); }
 if i<>$FFFFFFFF then Result:=true;
end;      

function TParamSmsFrm.SetParam090D(ATargetID: integer): boolean;
begin
   Result:= SetWordParam(ATargetID,$090D,Edit34.Text);
end;

procedure TParamSmsFrm.BitBtnSelClick(Sender: TObject);
var
  frm: TFrmSelectDevs;
  i:integer;
begin
  frm:=TFrmSelectDevs.Create(nil);
 // Self.WindowState:=wsMinimized;
  try
  if frm.ShowModal=mrOk then
  begin
    ListView1.Clear;
    for i:=0 to frm.DestList.Count-1 do
    begin
      with ListView1.Items.Add do
      begin
        Caption:=TDevice(frm.DestList.Items[i].Data).Car.No;
        Data:=frm.DestList.Items[i].Data;
      end;
    end;
  end;
  finally
   // Self.WindowState:=wsNormal;
    frm.Free;
  end;
end;

procedure TParamSmsFrm.BitBtn4Click(Sender: TObject);
begin
  if ListView1.Items.Count =1 then
  begin
     messagebox(handle,'车辆里只有一辆车,不能删除了!','提示',mb_ok + mb_iconinformation);
  end
  else
  begin
    ListView1.DeleteSelected;
  end;
end;
procedure TParamSmsFrm.ListView1Click(Sender: TObject);
begin
  if ListView1.Selected <> nil then
    ShowParamToEdit(TDevice(ListView1.Selected.Data));
end;

end.
