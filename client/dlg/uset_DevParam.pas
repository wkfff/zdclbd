unit uset_DevParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Mask;

type
  Tset_DevParam = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    PanelTop: TPanel;
    BitBtn3: TBitBtn;
    Label17: TLabel;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit13: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Edit4: TEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    CheckBox14: TCheckBox;
    CheckBox15: TCheckBox;
    CheckBox16: TCheckBox;
    Edit8: TEdit;
    RB_Basic: TRadioButton;
    GroupBox2: TGroupBox;
    Edit_ListenTel: TEdit;
    Edit_WorkTel: TEdit;
    CB_ListenTel: TCheckBox;
    CB_WorkTel: TCheckBox;
    RB_else: TRadioButton;
    GroupBox3: TGroupBox;
    CB_num1: TCheckBox;
    CB_num2: TCheckBox;
    CB_num3: TCheckBox;
    CB_num4: TCheckBox;
    RB_KeyPressTelNum: TRadioButton;
    Edit_num1: TEdit;
    Edit_num2: TEdit;
    Edit_num3: TEdit;
    Edit_num4: TEdit;
    Label3: TLabel;
    Label6: TLabel;
    Edit14: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    RadioButton_AllClear: TRadioButton;
    RadioButton_AllSelect: TRadioButton;
    Label9: TLabel;
    EditDns: TEdit;
    procedure Edit3Change(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure CheckBox7Click(Sender: TObject);
    procedure CheckBox8Click(Sender: TObject);
    procedure CheckBox9Click(Sender: TObject);
    procedure CheckBox10Click(Sender: TObject);
    procedure CheckBox11Click(Sender: TObject);
    procedure CheckBox12Click(Sender: TObject);
    procedure CheckBox13Click(Sender: TObject);
    procedure CheckBox14Click(Sender: TObject);
    procedure CheckBox15Click(Sender: TObject);
    procedure RB_BasicClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit_ListenTelKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure RB_elseClick(Sender: TObject);
    procedure CB_ListenTelClick(Sender: TObject);
    procedure CB_WorkTelClick(Sender: TObject);
    procedure CB_num1Click(Sender: TObject);
    procedure CB_num2Click(Sender: TObject);
    procedure CB_num3Click(Sender: TObject);
    procedure CB_num4Click(Sender: TObject);
    procedure RB_KeyPressTelNumClick(Sender: TObject);
    procedure CheckBox16Click(Sender: TObject);
    procedure Edit_num1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit_ListenTelChange(Sender: TObject);
    procedure Edit_num1Change(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure RadioButton_AllSelectClick(Sender: TObject);
    procedure RadioButton_AllClearClick(Sender: TObject);
    procedure EditDnsKeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  set_DevParam: Tset_DevParam;

implementation

{$R *.dfm}

procedure Tset_DevParam.Edit3Change(Sender: TObject);
begin
  BitBtn1.Enabled :=true;
end;

procedure Tset_DevParam.Edit4Exit(Sender: TObject);
var i: Integer;
    s1,s: string;
    j: Integer;
begin

  s:=trim(edit4.text);
  if s='' then exit;
  try
      i:=Pos('.',s);
      if i>0 then
      begin
        s1:=Copy(s,1,i-1);
        s:=Copy(s,i+1,Length(s)-i);
      end;
      j:=StrToInt(s1);
      if (j<0) or (j>255) then
        messagebox(handle,'IP地址超出范围','提示',mb_ok + mb_iconinformation);
      i:=Pos('.',s);
      if i>0 then
      begin
        s1:=Copy(s,1,i-1);
        s:=Copy(s,i+1,Length(s)-i);
      end;
      j:=StrToInt(s1);
      if (j<0) or (j>255) then
        messagebox(handle,'IP地址超出范围','提示',mb_ok + mb_iconinformation);
      i := Pos('.',s);
      if i>0 then
      begin
        s1 := Copy(s,1,i-1);
        s := Copy(s,i+1,Length(s)-i);
      end;
      j := StrToInt(s1);
      if (j<0) or (j>255) then
        messagebox(handle,'IP地址超出范围','提示',mb_ok + mb_iconinformation);
      j := StrToInt(s);
      if (j<0) or (j>255) then
        messagebox(handle,'IP地址超出范围','提示',mb_ok + mb_iconinformation);
  except
    messagebox(handle,'您输入的IP地址不正确，请重新输入!','提示',mb_ok + mb_iconinformation);
    edit4.SetFocus;
  end;
end;

procedure Tset_DevParam.CheckBox3Click(Sender: TObject);
begin
  if not CheckBox3.Enabled then exit;
  edit3.Enabled := CheckBox3.Checked ;
  EditDns.Enabled := CheckBox3.Checked;//add 2005-5-18
  if Edit3.Enabled then Edit3.SetFocus;
end;

procedure Tset_DevParam.CheckBox4Click(Sender: TObject);
begin
  if not CheckBox4.Enabled then exit;
  edit4.Enabled := CheckBox4.Checked ;
  if Edit4.Enabled then Edit4.SetFocus;
end;

procedure Tset_DevParam.CheckBox5Click(Sender: TObject);
begin
  if not (Sender as TCheckBox).Enabled then exit;
  edit5.Enabled := CheckBox5.Checked ;
  if Edit5.Enabled then Edit5.SetFocus;
end;

procedure Tset_DevParam.CheckBox6Click(Sender: TObject);
begin
  if not (Sender as TCheckBox).Enabled then exit;
  edit6.Enabled := CheckBox6.Checked ;
  if Edit6.Enabled then Edit6.SetFocus;
end;

procedure Tset_DevParam.CheckBox7Click(Sender: TObject);
begin
//  edit7.Enabled := CheckBox7.Checked ;
end;

procedure Tset_DevParam.CheckBox8Click(Sender: TObject);
begin
  if not (Sender as TCheckBox).Enabled then exit;
  edit8.Enabled := CheckBox8.Checked ;
  if Edit8.Enabled then Edit8.SetFocus;
end;

procedure Tset_DevParam.CheckBox9Click(Sender: TObject);
begin
  if not (Sender as TCheckBox).Enabled then exit;
  edit9.Enabled := CheckBox9.Checked ;
  if Edit9.Enabled then Edit9.SetFocus;
end;

procedure Tset_DevParam.CheckBox10Click(Sender: TObject);
begin
  if not (Sender as TCheckBox).Enabled then exit;
  edit10.Enabled := CheckBox10.Checked ;
  if Edit10.Enabled then Edit10.SetFocus;
end;

procedure Tset_DevParam.CheckBox11Click(Sender: TObject);
begin
  if not (Sender as TCheckBox).Enabled then exit;
  edit11.Enabled := CheckBox11.Checked ;
  if Edit11.Enabled then Edit11.SetFocus;
end;

procedure Tset_DevParam.CheckBox12Click(Sender: TObject);
begin
  if not (Sender as TCheckBox).Enabled then exit;
  combobox1.Enabled := CheckBox12.Checked ;
  if ComboBox1.Enabled then ComboBox1.SetFocus;
end;

procedure Tset_DevParam.CheckBox13Click(Sender: TObject);
begin
  if not (Sender as TCheckBox).Enabled then exit;
  edit13.Enabled := CheckBox13.Checked ;
  if Edit13.Enabled then Edit13.SetFocus;
end;

procedure Tset_DevParam.CheckBox14Click(Sender: TObject);
begin
  if not (Sender as TCheckBox).Enabled then exit;
  //combobox2.Enabled := CheckBox14.Checked ;
  edit14.Enabled := CheckBox14.Checked;
  if Edit14.Enabled then Edit14.SetFocus;
end;

procedure Tset_DevParam.CheckBox15Click(Sender: TObject);
begin
  if not (Sender as TCheckBox).Enabled then exit;
  edit15.Enabled := CheckBox15.Checked ;
  if Edit15.Enabled then Edit15.SetFocus;
end;

procedure Tset_DevParam.RB_BasicClick(Sender: TObject);
begin
  if RB_Basic.Checked then
  begin
    checkbox3.Enabled :=true;
    checkbox4.Enabled :=true;
    checkbox5.Enabled :=true;
    checkbox6.Enabled :=true;
    checkbox7.Enabled :=true;
    checkbox8.Enabled :=true;
    checkbox9.Enabled :=true;
    checkbox10.Enabled :=true;
    checkbox11.Enabled :=true;
    checkbox12.Enabled :=true;
    checkbox13.Enabled :=true;
    checkbox14.Enabled :=true;
    checkbox15.Enabled :=true;
    checkbox16.Enabled :=true;
    CB_ListenTel.Enabled := false;
    CB_WorkTel.Enabled := false;
    CB_num1.Enabled := false;
    CB_num2.Enabled := false;
    CB_num3.Enabled := False;
    CB_num4.Enabled := false;
    {RB_Basic.font.Color := clred;
    RB_KeyPressTelNum.font.Color := clHighlight;
    RB_else.font.Color := clHighlight; }
  end;
end;

procedure Tset_DevParam.BitBtn3Click(Sender: TObject);
begin
  RB_else.Enabled := true;
  RB_KeyPressTelNum.Enabled := true;
  RB_Basic.Enabled := true;
    checkbox3.Enabled :=true;
    checkbox4.Enabled :=true;
    checkbox5.Enabled :=true;
    checkbox6.Enabled :=true;
    checkbox7.Enabled :=true;
    checkbox8.Enabled :=true;
    checkbox9.Enabled :=true;
    checkbox10.Enabled :=true;
    checkbox11.Enabled :=true;
    checkbox12.Enabled :=true;
    checkbox13.Enabled :=true;
    checkbox14.Enabled :=true;
    checkbox15.Enabled :=true;
    checkbox16.Enabled :=true;
end;

procedure Tset_DevParam.Edit_ListenTelKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in['0'..'9',#8,',',#3,#22]) then
  begin
    messagebox(handle,'请输入数字或'',''，在电话号码之间用'',''隔开!','提示',mb_ok + mb_iconinformation);
    key := #0;
  end;
end;

procedure Tset_DevParam.BitBtn1Click(Sender: TObject);
var
  choice: Boolean;
  str1: string;
  i,n,cnt: Integer;
  stra,strb,strTmp: string;
begin
  {..基本参数}
  if RB_Basic.Checked then
  begin
    choice:=(checkbox3.Checked) or (CheckBox4.Checked) or (CheckBox5.Checked) or
      (checkbox6.Checked) or (checkbox7.Checked) or
      (checkbox8.Checked) or (CheckBox9.Checked) or (CheckBox10.Checked) or
      (checkbox11.Checked) or (CheckBox12.Checked) or (CheckBox13.Checked) or
      (checkbox14.Checked) or (CheckBox15.Checked) or (CheckBox16.Checked);
    if not choice then
    begin
      messagebox(handle,'请选择要设置的一项基本参数!','提示',mb_ok + mb_iconinformation);
      exit;
    end;
    {if (CheckBox3.Checked) and (trim(edit3.Text)='') then
    begin
      messagebox(handle,'请您输入域名!','提示',mb_ok + mb_iconinformation);
      edit3.SetFocus;
      exit;
    end;
    if (CheckBox4.Checked) and (trim(edit4.Text)='') then
    begin
      messagebox(handle,'请您输入IP地址!','提示',mb_ok + mb_iconinformation);
      edit4.SetFocus;
      exit;
    end;}
    if (CheckBox3.Checked) and ((trim(edit3.Text)<>'') or (Trim(EditDns.Text)<>''))then
    begin
      str1:= trim(edit3.Text);
      if (str1='') then
      begin
        messagebox(handle,'请您输入域名!','提示',mb_ok + mb_iconinformation);
        if edit3.Enabled then edit3.SetFocus;
        exit;
      end;
      //前后不为','
      n:= length(str1);
      if (str1[1]=',') or (str1[n]=',') then
      begin
        messagebox(handle,'第一位或最后一位是'','',请按正确格式填写!','提示',mb_ok + mb_iconinformation);
        if edit3.Enabled then edit3.SetFocus;
        exit;
      end;
      //确保 中间没有两个','写在一起
      for i:= 2 to n-2 do
      begin
        if (str1[i]=',') and (str1[i+1]=',') then
        begin
          messagebox(handle,'有两个'',''写在一起，请按正确格式填写!','提示',mb_ok + mb_iconinformation);
          if edit3.Enabled then edit3.SetFocus;
          exit;
        end;
      end;
      //检查 是否有两个域名：有一个','
      i:= pos(',',str1);
      if i=0 then
      begin
        messagebox(handle,'请您输入两个域名，域名之间以'',''隔开!','提示',mb_ok + mb_iconinformation);
        if edit3.Enabled then edit3.SetFocus;
        exit;
      end;
      //确定 两个域名是否一致
      stra := copy(str1,1,i-1);
      strb := copy(str1,i+1,n-1);
      if stra = strb then
      begin
        messagebox(handle,'您输入的两个域名一致! 请重新输入!','提示',mb_ok + mb_iconinformation);
        if edit3.Enabled then edit3.SetFocus;
        exit;
      end;
      //检查 是否有多于两个域名 已有一个',', 看还有没
      i:= pos(',',strb);
      if i>0 then
      begin
        messagebox(handle,'您的输入中有不止一个'',''! 请您输入两个域名，域名之间以'',''隔开!','提示',mb_ok + mb_iconinformation);
        if edit3.Enabled then edit3.SetFocus;
        exit;
      end;
      //检查 第一域名是否写的正确：有两个'.'
      cnt:= 0;
      while n >0 do
      begin
        i:= pos('.',stra);
        if i>0 then 
        begin
          stra:= copy(stra,i+1,length(stra)-i);
          cnt:= cnt + 1;
        end
        else
          break;
      end;
      if (cnt<>2) then
      begin
        messagebox(handle,'请检查您输入的第一个域名是否正确!','提示',mb_ok + mb_iconinformation);
        if edit3.Enabled then edit3.SetFocus;
        exit;
      end;
      //检查 第二域名是否写的正确：有两个'.'
      cnt:= 0;
      while n >0 do
      begin
        i:= pos('.',strb);
        if i>0 then 
        begin
          strb:= copy(strb,i+1,length(strb)-i);
          cnt:= cnt + 1;
        end
        else
          break;
      end;
      if (cnt<>2) then
      begin
        messagebox(handle,'请检查您输入的第二个域名是否正确!','提示',mb_ok + mb_iconinformation);
        if edit3.Enabled then edit3.SetFocus;
        exit;
      end;
      //-----------DNS----------------------------
      str1:= Trim(EditDns.Text);
      if str1='' then
      begin
        messagebox(handle,'请您输入DNS!','提示',mb_ok + mb_iconinformation);
        if EditDns.Enabled then EditDns.SetFocus;
        exit;
      end;

      //前后不为','
      n:= length(str1);
      if (str1[1]=',') or (str1[n]=',') then
      begin
        messagebox(handle,'第一位或最后一位是'','',请按正确格式填写!','提示',mb_ok + mb_iconinformation);
        if EditDns.Enabled then EditDns.SetFocus;
        exit;
      end;
      //确保 中间没有两个','写在一起
      for i:= 2 to n-2 do
      begin
        if (str1[i]=',') and (str1[i+1]=',') then
        begin
          messagebox(handle,'有两个'',''写在一起，请按正确格式填写!','提示',mb_ok + mb_iconinformation);
          if EditDns.Enabled then EditDns.SetFocus;
          exit;
        end;
      end;
      //检查 是否有两个IP：有一个','
      i:= pos(',',str1);
      if i=0 then
      begin
        messagebox(handle,'请您输入两个DNS，DNS之间以'',''隔开!','提示',mb_ok + mb_iconinformation);
        if EditDns.Enabled then EditDns.SetFocus;
        exit;
      end;
      //确定 两个IP是否一致
      stra := copy(str1,1,i-1);
      strb := copy(str1,i+1,n-1);
      if stra = strb then
      begin
        messagebox(handle,'您输入的两个DNS一致! 请重新输入!','提示',mb_ok + mb_iconinformation);
        if EditDns.Enabled then EditDns.SetFocus;
        exit;
      end;
      //检查 是否有多于两个IP，已有一个',', 看还有没
      i:= pos(',',strb);
      if i>0 then
      begin
        messagebox(handle,'您的输入中有不止一个'',''! 请您输入两个DNS，DNS之间以'',''隔开!','提示',mb_ok + mb_iconinformation);
        if EditDns.Enabled then EditDns.SetFocus;
        exit;
      end;
      //检查 DNS1---IP地址 是否写的正确：有3个'.'
      n:= length(stra);
      cnt:= 0;  
      while n >0 do
      begin
        i:= pos('.',stra);
        if i>0 then
        begin
          strTmp:= copy(stra,1,i-1);
          if (strTmp='') or (StrToInt(strTmp)>255) then
          begin
            messagebox(handle,'您输入的DNS的第一个IP地址不正确，请重新输入！','提示',mb_ok + mb_iconinformation);
            if EditDns.Enabled then EditDns.SetFocus;
            exit;
          end;
          stra:= copy(stra,i+1,length(stra)-i);
          //n:= length(stra);
          cnt:= cnt + 1;
        end
        else if (stra='') or (strToint(stra)>255) then
        begin
          messagebox(handle,'您输入的DNS的第一个IP地址不正确，请重新输入！','提示',mb_ok + mb_iconinformation);
            if EditDns.Enabled then EditDns.SetFocus;
            exit;
        end
        else
          break;
      end;
      if cnt<>3 then
      begin
        messagebox(handle,'请检查您输入的DNS的第一个IP地址是否正确!','提示',mb_ok + mb_iconinformation);
        if EditDns.Enabled then EditDns.SetFocus;
        exit;
      end;
      //检查 DNS2---IP地址 是否写的正确：有3个'.'
      n:= length(strb);
      cnt:= 0;  
      while n >0 do
      begin
        i:= pos('.',strb);
        if i>0 then
        begin
          strTmp:= copy(strb,1,i-1);
          if (strTmp='') or (StrToInt(strTmp)>255) then
          begin
            messagebox(handle,'您输入的DNS的第二个IP地址不正确，请重新输入！','提示',mb_ok + mb_iconinformation);
            if EditDns.Enabled then EditDns.SetFocus;
            exit;
          end;
          strb:= copy(strb,i+1,length(strb)-i);
          //n:= length(strb);
          cnt:= cnt + 1;
        end
        else if (strb='') or (strToint(strb)>255) then
        begin
          messagebox(handle,'您输入的DNS的第二个IP地址不正确，请重新输入！','提示',mb_ok + mb_iconinformation);
            if EditDns.Enabled then EditDns.SetFocus;
            exit;
        end
        else
          break;
      end;
      if cnt<>3 then
      begin
        messagebox(handle,'请检查您输入的DNS的第二个IP地址是否正确!','提示',mb_ok + mb_iconinformation);
        if EditDns.Enabled then EditDns.SetFocus;
        exit;
      end;          

    end;
    if (CheckBox4.Checked) then
    begin
      str1:= trim(edit4.Text);
      if str1='' then
      begin
        messagebox(handle,'请您输入IP地址!','提示',mb_ok + mb_iconinformation);
        if edit4.Enabled then edit4.SetFocus;
        exit;
      end;
      //检查 IP地址是否写的正确：有3个'.'
      n:= length(str1);
      cnt:= 0;  
      while n >0 do
      begin
        i:= pos('.',str1);
        if i>0 then
        begin
          stra:= copy(str1,1,i-1);
          if StrToInt(stra)>255 then
          begin
            messagebox(handle,'您输入的IP地址超出范围，请重新输入！','提示',mb_ok + mb_iconinformation);
            if edit4.Enabled then edit4.SetFocus;
            exit;
          end;
          str1:= copy(str1,i+1,length(str1)-i);
          //n:= length(str1);
          cnt:= cnt + 1;
        end
        else
          break;
      end;
      if cnt<>3 then
      begin
        messagebox(handle,'请检查您输入的IP地址是否正确!','提示',mb_ok + mb_iconinformation);
        if edit4.Enabled then edit4.SetFocus;
        exit;
      end;
    end;
    if (CheckBox5.Checked) then
    begin
      if (trim(edit5.Text)='') then
      begin
        messagebox(handle,'请您输入端口!','提示',mb_ok + mb_iconinformation);
        if edit5.Enabled then edit5.SetFocus;
        exit;
      end;
      if StrToInt(trim(edit5.Text))=0 then
      begin
        messagebox(handle,'端口不能为0，请重新输入!','提示',mb_ok + mb_iconinformation);
        if edit5.Enabled then edit5.SetFocus;
        exit;
      end;
    end;
    if (CheckBox6.Checked) then
    begin
      if (trim(edit6.Text)='') then
      begin
        messagebox(handle,'请您输入SMS中心号!','提示',mb_ok + mb_iconinformation);
        if edit6.Enabled then edit6.SetFocus;
        exit;
      end;
     if copy(trim(edit6.Text),1,2)<>'86' then
      begin
        if length(trim(edit6.Text))>13 then
        begin
          messagebox(handle,'请您正确输入SMS中心号','提示',mb_ok + mb_iconinformation);
          if edit6.Enabled then edit6.SetFocus;
          exit;
        end
        else
          edit6.Text := '86'+ trim(edit6.Text);
      end;
    end;             
    if (CheckBox7.Checked) and (trim(edit7.Text)='') then
    begin
      messagebox(handle,'请您输入SMS接收服务器SIM卡号!','提示',mb_ok + mb_iconinformation);
      if edit7.Enabled then edit7.SetFocus;
      exit;
    end;
    if (CheckBox8.Checked) then
    begin
      if (trim(edit8.Text)='') then
      begin
        messagebox(handle,'请您输入主动回报时间间隔!','提示',mb_ok + mb_iconinformation);
        if edit8.Enabled then edit8.SetFocus;
        exit;
      end;
      if StrToInt(trim(edit8.Text))=0 then
      begin
        messagebox(handle,'主动回报时间间隔不能为0，请重新输入!','提示',mb_ok + mb_iconinformation);
        if edit8.Enabled then edit8.SetFocus;
        exit;
      end;
    end;
    if (CheckBox9.Checked) then
    begin
      if (trim(edit9.Text)='') then
      begin
        messagebox(handle,'请您输入回报信息条数!','提示',mb_ok + mb_iconinformation);
        if edit9.Enabled then edit9.SetFocus;
        exit;
      end;
      if StrToInt(trim(edit9.Text))=0 then
      begin
        messagebox(handle,'回报信息条数不能为0，请重新输入!','提示',mb_ok + mb_iconinformation);
        if edit9.Enabled then edit9.SetFocus;
        exit;
      end;
      if StrToInt(trim(edit9.Text))>255 then
      begin
        messagebox(handle,'回报信息条数不能大于255，请重新输入!','提示',mb_ok + mb_iconinformation);
        if edit9.Enabled then edit9.SetFocus;
        exit;
      end;
    end;
    if (CheckBox10.Checked)then
    begin
      if (trim(edit10.Text)='') then
      begin
        messagebox(handle,'请您输入报警回报时间间隔!','提示',mb_ok + mb_iconinformation);
        if edit10.Enabled then edit10.SetFocus;
        exit;
      end;
      if StrToInt(trim(edit10.Text))=0 then
      begin
        messagebox(handle,'报警回报时间间隔不能为0，请重新输入!','提示',mb_ok + mb_iconinformation);
        if edit10.Enabled then edit10.SetFocus;
        exit;
      end;
      if StrToInt(trim(edit10.Text))>255 then
      begin
        messagebox(handle,'报警回报时间间隔不能大于255，请重新输入!','提示',mb_ok + mb_iconinformation);
        if edit10.Enabled then edit10.SetFocus;
        exit;
      end;
    end;
    if (CheckBox11.Checked) then
    begin
      if (trim(edit11.Text)='') then
      begin
        messagebox(handle,'请您输入报警回报重发次数!','提示',mb_ok + mb_iconinformation);
        if edit11.Enabled then edit11.SetFocus;
        exit;
      end;
      if StrToInt(trim(edit11.Text))=0 then
      begin
        messagebox(handle,'报警回报重发次数不能为0，请重新输入!','提示',mb_ok + mb_iconinformation);
        if edit11.Enabled then edit11.SetFocus;
        exit;
      end;
    end;
    if (CheckBox12.Checked) and (trim(ComboBox1.Text)='') then
    begin
      messagebox(handle,'请您选择 外部串口波特率!','提示',mb_ok + mb_iconinformation);
      if ComboBox1.Enabled then ComboBox1.SetFocus;
      exit;
    end;
    if CheckBox13.Checked then
    begin
      if trim(edit13.Text)='' then
      begin
        messagebox(handle,'请您输入IO初始状态!','提示',mb_ok + mb_iconinformation);
        if edit13.Enabled then edit13.SetFocus;
        exit;
      end;
      if StrToInt(trim(edit13.Text))>255 then
      begin
        messagebox(handle,'IO初始状态只可能是0-255的数，请重新输入!','提示',mb_ok + mb_iconinformation);
        if edit13.Enabled then edit13.SetFocus;
        exit;
      end;
    end;
    {if (CheckBox14.Checked) and (trim(ComboBox2.Text)='') then
    begin
      messagebox(handle,'请您选择 外部设备能使 项!','提示',mb_ok + mb_iconinformation);
      if ComboBox2.Enabled then ComboBox2.SetFocus;
      exit;
    end; }
    if CheckBox14.Checked then
    begin
      if trim(Edit14.Text)='' then
      begin
        messagebox(handle,'请您输入 心跳时间!','提示',mb_ok + mb_iconinformation);
        if Edit14.Enabled then Edit14.SetFocus;
        exit;
      end;
      n:=StrToInt(trim(Edit14.Text));
      if (n>255)or (n<10) then
      begin
        messagebox(handle,'心跳时间只能是[10-255]之间的数，请重新输入!','提示',mb_ok + mb_iconinformation);
        if edit14.Enabled then Edit14.SetFocus;
        exit;
      end;
    end;
    if (CheckBox15.Checked) and (trim(edit15.Text)='') then
    begin
      messagebox(handle,'请您输入APN接入点!','提示',mb_ok + mb_iconinformation);
      if edit15.Enabled then edit15.SetFocus;
      exit;
    end;
    if (CheckBox16.Checked) and (trim(edit16.Text)='') then
    begin
      messagebox(handle,'请您输入SMS发送服务器SIM卡号!','提示',mb_ok + mb_iconinformation);
      if edit16.Enabled then edit16.SetFocus;
      exit;
    end;
  end
  {..监听及业务电话}
  else if RB_else.Checked then
  begin
    choice:=(CB_ListenTel.Checked) or (CB_WorkTel.Checked);
    if not choice then
    begin
      messagebox(handle,'请选择要更改的一项电话!','提示',mb_ok + mb_iconinformation);
      exit;
    end;
    {....监听电话}
    if CB_ListenTel.Checked then
    begin
      str1:=trim(Edit_ListenTel.Text);
      if str1='' then
      begin
        messagebox(handle,'请您输入监听电话!','提示',mb_ok + mb_iconinformation);
        if Edit_ListenTel.Enabled then Edit_ListenTel.SetFocus;
        exit;
      end;
      // 确保 前后不为','
      if (copy(str1,1,1)=',')or (copy(str1,length(str1),1)=',') then
      begin
        messagebox(handle,'第一位或最后一位是'','' 请按正确格式填写电话!','提示',mb_ok + mb_iconinformation);
        if Edit_ListenTel.Enabled then Edit_ListenTel.SetFocus;
        exit;
      end;
      // 确保 中间没有两个','写在一起
      for i:= 2 to length(str1)-2 do
      begin
        if (str1[i]=',') and (str1[i+1]=',') then
        begin
          messagebox(handle,'有两个'',''写在一起，请按正确格式填写电话!','提示',mb_ok + mb_iconinformation);
          if Edit_ListenTel.Enabled then Edit_ListenTel.SetFocus;
          exit;
        end;
      end;
      //确保 按格式填写：固定电话前请加上区号，手机号直接写
      n := length(str1);
      while n >0 do
      begin
        if (str1[1]<>'0') and (str1[1]<>'1') then
        begin
          messagebox(handle,'请按格式填写：固定电话前请加区号，手机号直接写!','提示',mb_ok + mb_iconinformation);
          if Edit_ListenTel.Enabled then Edit_ListenTel.SetFocus;
          exit;
        end;
        i:= pos(',',str1);
        if i= 0 then break;
        str1 := copy(str1,i+1,n-i);
        n:= length(str1);
      end;
      str1:= Trim(Edit_ListenTel.Text);
      n:= length(str1);
      for i:= 1 to n do
      begin
        if not (str1[i] in ['0'..'9',',']) then
        begin
          messagebox(handle,'监听电话只能输入数字或'',''，请去掉无效字符!','提示',mb_ok + mb_iconinformation);
          if Edit_ListenTel.Enabled then Edit_ListenTel.SetFocus;
          break;
        end;
      end;
      if i<> n+1 then exit;
    end;
    {....业务电话}
    if CB_WorkTel.Checked then
    begin
      str1:=trim(Edit_WorkTel.Text);
      if str1='' then
      begin
        messagebox(handle,'请您输入业务电话!','提示',mb_ok + mb_iconinformation);
        if Edit_WorkTel.Enabled then Edit_WorkTel.SetFocus;
        exit;
      end;
      // 确保 前后不为','
      if (copy(str1,1,1)=',')or (copy(str1,length(str1),1)=',') then
      begin
        messagebox(handle,'第一位或最后一位是'','' 请按正确格式填写电话!','提示',mb_ok + mb_iconinformation);
        if Edit_WorkTel.Enabled then Edit_WorkTel.SetFocus;
        exit;
      end;
      // 确保 中间没有两个','写在一起
      for i:= 2 to length(str1)-2 do
      begin
        if (str1[i]=',') and (str1[i+1]=',') then
        begin
          messagebox(handle,'有两个'',''写在一起，请按正确格式填写电话!','提示',mb_ok + mb_iconinformation);
          if Edit_WorkTel.Enabled then Edit_WorkTel.SetFocus;
          exit;
        end;
      end;
      //确保至少有两个电话，因 第一个定为复位电话       
      i:= pos(',',str1);
      if i=0 then
      begin
        messagebox(handle,'因为第一个电话号码定为复位电话，所以请至少输入两个电话号码!','提示',mb_ok + mb_iconinformation);
        if Edit_WorkTel.Enabled then Edit_WorkTel.SetFocus;
        exit;
      end;
      //确保 按格式填写：固定电话前请加上区号，手机号直接写
      n := length(str1);
      while n >0 do
      begin
        if (str1[1]<>'0') and (str1[1]<>'1') then
        begin
          messagebox(handle,'请按格式填写：固定电话前请加区号，手机号直接写!','提示',mb_ok + mb_iconinformation);
          if Edit_WorkTel.Enabled then  Edit_WorkTel.SetFocus;
          exit;
        end;
        i:= pos(',',str1);
        if i= 0 then break;
        str1 := copy(str1,i+1,n-i);
        n:= length(str1);
      end;
      str1:= Trim(Edit_WorkTel.Text);
      n:= length(str1);
      for i:= 1 to n do
      begin
        if not (str1[i] in ['0'..'9',',']) then
        begin
          messagebox(handle,'业务电话只能输入数字或'',''，请去掉无效字符!','提示',mb_ok + mb_iconinformation);
          if Edit_WorkTel.Enabled then Edit_WorkTel.SetFocus;
          break;
        end;
      end;
      if i<> n+1 then exit;
    end;
  end
  {..按键电话}
  else if RB_KeyPressTelNum.Checked then
  begin
    choice:=(CB_num1.Checked) or (CB_num2.Checked) or (CB_num3.Checked) or (CB_num4.Checked);
    if not choice then
    begin
      messagebox(handle,'请选择要更改的一项按键电话!','提示',mb_ok + mb_iconinformation);
      exit;
    end;
    if (CB_num1.Checked)then
    begin
      if (trim(Edit_num1.Text)='') then
      begin
        messagebox(handle,'请您输入1号按键电话!','提示',mb_ok + mb_iconinformation);
        if Edit_num1.Enabled then Edit_num1.SetFocus;
        exit;
      end;
      str1:= trim(Edit_num1.Text);
      if (str1[1]<>'0') and (str1[1]<>'1') then
      begin
        messagebox(handle,'请按格式填写：固定电话前请加区号，手机号直接写!','提示',mb_ok + mb_iconinformation);
        if Edit_num1.Enabled then Edit_num1.SetFocus;
        exit;
      end;
      str1:= Trim(Edit_num1.Text);
      n:= length(str1);
      for i:= 1 to n do
      begin
        if not (str1[i] in['0'..'9']) then
        begin
          messagebox(handle,'按键电话只能输入数字，请去掉无效字符!','提示',mb_ok + mb_iconinformation);
          if Edit_num1.Enabled then Edit_num1.SetFocus;
          break;
        end;
      end;
      if i<> n+1 then exit;
    end;
    if (CB_num2.Checked)then
    begin
      if trim(Edit_num2.Text)='' then
      begin
        messagebox(handle,'请您输入2号按键电话!','提示',mb_ok + mb_iconinformation);
        if Edit_num2.Enabled then Edit_num2.SetFocus;
        exit;
      end;
      str1:= trim(Edit_num2.Text);
      if (str1[1]<>'0') and (str1[1]<>'1') then
      begin
        messagebox(handle,'请按格式填写：固定电话前请加区号，手机号直接写!','提示',mb_ok + mb_iconinformation);
        if Edit_num2.Enabled then Edit_num2.SetFocus;
        exit;
      end;

      n:= length(str1);
      for i:= 1 to n do
      begin
        if not (str1[i] in['0'..'9']) then
        begin
          messagebox(handle,'按键电话只能输入数字，请去掉无效字符!','提示',mb_ok + mb_iconinformation);
          if Edit_num2.Enabled then Edit_num2.SetFocus;
          break;
        end;
      end;
      if i<> n+1 then exit;
    end;
    if (CB_num3.Checked)then
    begin
      if (trim(Edit_num3.Text)='') then
      begin
        messagebox(handle,'请您输入3号按键电话!','提示',mb_ok + mb_iconinformation);
        if Edit_num3.Enabled then Edit_num3.SetFocus;
        exit;
      end;
      str1:= trim(Edit_num3.Text);
      if (str1[1]<>'0') and (str1[1]<>'1') then
      begin
        messagebox(handle,'请按格式填写：固定电话前请加区号，手机号直接写!','提示',mb_ok + mb_iconinformation);
        if Edit_num3.Enabled then Edit_num3.SetFocus;
        exit;
      end;
      n:= length(str1);
      for i:= 1 to n do
      begin
        if not (str1[i] in['0'..'9']) then
        begin
          messagebox(handle,'按键电话只能输入数字，请去掉无效字符!','提示',mb_ok + mb_iconinformation);
          if Edit_num3.Enabled then Edit_num3.SetFocus;
          break;
        end;
      end;
      if i<> n+1 then exit;
    end;
    if (CB_num4.Checked)then
    begin
      if (trim(Edit_num4.Text)='') then
      begin
        messagebox(handle,'请您输入4号按键电话!','提示',mb_ok + mb_iconinformation);
        if Edit_num4.Enabled then Edit_num4.SetFocus;
        exit;
      end;
      str1:= trim(Edit_num4.Text);
      if (str1[1]<>'0') and (str1[1]<>'1') then
      begin
        messagebox(handle,'请按格式填写：固定电话前请加区号，手机号直接写!','提示',mb_ok + mb_iconinformation);
        if Edit_num4.Enabled then Edit_num4.SetFocus;
        exit;
      end;
      n:= length(str1);
      for i:= 1 to n do
      begin
        if not (str1[i] in['0'..'9']) then
        begin
          messagebox(handle,'按键电话只能输入数字，请去掉无效字符!','提示',mb_ok + mb_iconinformation);
          if Edit_num4.Enabled then Edit_num4.SetFocus;
          break;
        end;
      end;
      if i<> n+1 then exit;
    end;
  end;
  ModalResult := mrOk;
end;

procedure Tset_DevParam.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8])then
  begin
    messagebox(handle,'请输入数字!','提示',mb_ok + mb_iconinformation);
    key:=#0;
    if (Sender as TEdit).Enabled then (Sender as TEdit).SetFocus;
    exit;
  end;
end;

procedure Tset_DevParam.FormCreate(Sender: TObject);
begin
  RB_Basic.Enabled := false;
  RB_else.Enabled := false;
  RB_KeyPressTelNum.Enabled := false;
  checkbox3.Enabled :=false;
  checkbox4.Enabled :=false;
  checkbox5.Enabled :=false;
  checkbox6.Enabled :=false;
  checkbox7.Enabled :=false;
  checkbox8.Enabled :=false;
  checkbox9.Enabled :=false;
  checkbox10.Enabled :=false;
  checkbox11.Enabled :=false;
  checkbox12.Enabled :=false;
  checkbox13.Enabled :=false;
  checkbox14.Enabled :=false;
  checkbox15.Enabled :=false;
  checkbox16.Enabled := false;
  CB_ListenTel.Enabled := false;
  CB_WorkTel.Enabled := false;
  CB_num1.Enabled := false;
  CB_num2.Enabled := false;
  CB_num3.Enabled := False;
  CB_num4.Enabled := false;
end;

procedure Tset_DevParam.RB_elseClick(Sender: TObject);
begin
  if RB_else.Checked then
  begin
    checkbox3.Enabled :=false;
    checkbox4.Enabled :=false;
    checkbox5.Enabled :=false;
    checkbox6.Enabled :=false;
    checkbox7.Enabled :=false;
    checkbox8.Enabled :=false;
    checkbox9.Enabled :=false;
    checkbox10.Enabled :=false;
    checkbox11.Enabled :=false;
    checkbox12.Enabled :=false;
    checkbox13.Enabled :=false;
    checkbox14.Enabled :=false;
    checkbox15.Enabled :=false;
    checkbox16.Enabled :=false;
    CB_ListenTel.Enabled := true;
    CB_WorkTel.Enabled := true;
    CB_num1.Enabled := false;
    CB_num2.Enabled := false;
    CB_num3.Enabled := False;
    CB_num4.Enabled := false;
    {RB_else.font.Color := clred;
    RB_Basic.font.Color := clHighlight;
    RB_KeyPressTelNum.font.Color := clHighlight; }
  end;
end;

procedure Tset_DevParam.CB_ListenTelClick(Sender: TObject);
begin
  if not CB_ListenTel.Enabled then exit;
  Edit_ListenTel.Enabled := CB_ListenTel.Checked;
  if Edit_ListenTel.Enabled then Edit_ListenTel.SetFocus;
end;

procedure Tset_DevParam.CB_WorkTelClick(Sender: TObject);
begin
  if not CB_WorkTel.Enabled then exit;
  Edit_WorkTel.Enabled := CB_WorkTel.Checked;
  if Edit_WorkTel.Enabled then Edit_WorkTel.SetFocus;
end;

procedure Tset_DevParam.CB_num1Click(Sender: TObject);
begin
  if not CB_num1.Enabled then exit;
  Edit_num1.Enabled := CB_num1.Checked ;
  if Edit_num1.Enabled then Edit_num1.SetFocus;
end;

procedure Tset_DevParam.CB_num2Click(Sender: TObject);
begin
  if not CB_num2.Enabled then exit;
  Edit_num2.Enabled := CB_num2.Checked ;
  if Edit_num2.Enabled then Edit_num2.SetFocus;
end;

procedure Tset_DevParam.CB_num3Click(Sender: TObject);
begin
  if not CB_num3.Enabled then exit;
  Edit_num3.Enabled := CB_num3.Checked ;
  if Edit_num3.Enabled then Edit_num3.SetFocus;
end;

procedure Tset_DevParam.CB_num4Click(Sender: TObject);
begin
  if not CB_num4.Enabled then exit;
  Edit_num4.Enabled := CB_num4.Checked ;
  if Edit_num4.Enabled then Edit_num4.SetFocus;
end;

procedure Tset_DevParam.RB_KeyPressTelNumClick(Sender: TObject);
begin
  if RB_KeyPressTelNum.Checked then
  begin
    checkbox3.Enabled :=false;
    checkbox4.Enabled :=false;
    checkbox5.Enabled :=false;
    checkbox6.Enabled :=false;
    checkbox7.Enabled :=false;
    checkbox8.Enabled :=false;
    checkbox9.Enabled :=false;
    checkbox10.Enabled :=false;
    checkbox11.Enabled :=false;
    checkbox12.Enabled :=false;
    checkbox13.Enabled :=false;
    checkbox14.Enabled :=false;
    checkbox15.Enabled :=false;
    checkbox16.Enabled :=false;
    CB_ListenTel.Enabled := false;
    CB_WorkTel.Enabled := false;
    CB_num1.Enabled := true;
    CB_num2.Enabled := true;
    CB_num3.Enabled := true;
    CB_num4.Enabled := true;
    {RB_KeyPressTelNum.font.Color := clred;
    RB_Basic.font.Color := clHighlight;
    RB_else.font.Color := clHighlight; }
  end;
end;

procedure Tset_DevParam.CheckBox16Click(Sender: TObject);
begin
 // Edit16.Enabled := CheckBox16.Checked;
end;

procedure Tset_DevParam.Edit_num1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8,#3,#22])then
  begin
    messagebox(handle,'请输入数字!','提示',mb_ok + mb_iconinformation);
    key:=#0;
    if (Sender as TEdit).Enabled then (Sender as TEdit).SetFocus;
    exit;
  end;
end;

procedure Tset_DevParam.Edit_ListenTelChange(Sender: TObject);
var
  i,n : integer;
  str1: string;
begin
  str1:= Trim((Sender as TEdit).Text);
  n:= length(str1);
  for i:= 1 to n do
  begin
    if not (str1[i] in ['0'..'9',',']) then
    begin
      messagebox(handle,'只能输入数字或'',''，请去掉无效字符!','提示',mb_ok + mb_iconinformation);
      (Sender as TEdit).SetFocus;
      break;
    end;
  end;
end;

procedure Tset_DevParam.Edit_num1Change(Sender: TObject);
var
  i,n : integer;
  str1: string;
begin
  str1:= Trim((Sender as TEdit).Text);
  n:= length(str1);
  for i:= 1 to n do
  begin
    if not (str1[i] in['0'..'9']) then
    begin
      messagebox(handle,'按键电话只能输入数字，请去掉无效字符!','提示',mb_ok + mb_iconinformation);
      (Sender as TEdit).SetFocus;
      break;
    end;
  end;

end;

procedure Tset_DevParam.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8])then
  begin
    messagebox(handle,'请输入数字!','提示',mb_ok + mb_iconinformation);
    key:=#0;
    if (Sender as TComboBox).Enabled then (Sender as TComboBox).SetFocus;
    exit;
  end;
end;

procedure Tset_DevParam.RadioButton_AllSelectClick(Sender: TObject);
begin
  if RadioButton_AllSelect.Checked then
  begin
    //CheckBox1.Checked := true;
    //CheckBox2.Checked := true;
    CheckBox3.Checked := true;
    CheckBox4.Checked := true;
    CheckBox5.Checked := true;
    CheckBox6.Checked := true;
    CheckBox7.Checked := true;
    CheckBox8.Checked := true;
    CheckBox9.Checked := true;
    CheckBox10.Checked := true;
    CheckBox11.Checked := true;
    CheckBox12.Checked := true;
    CheckBox13.Checked := true;
    CheckBox14.Checked := true;
    CheckBox15.Checked := true;
    CheckBox16.Checked := true;
    CB_ListenTel.Checked := true;
    CB_WorkTel.Checked := true;
    CB_num1.Checked := true;
    CB_num2.Checked := true;
    CB_num3.Checked := true;
    CB_num4.Checked := true;
  end;
end;

procedure Tset_DevParam.RadioButton_AllClearClick(Sender: TObject);
begin
  if RadioButton_AllClear.Checked then
  begin
    //CheckBox1.Checked := false;
    //CheckBox2.Checked := false;
    CheckBox3.Checked := false;
    CheckBox4.Checked := false;
    CheckBox5.Checked := false;
    CheckBox6.Checked := false;
    CheckBox7.Checked := false;
    CheckBox8.Checked := false;
    CheckBox9.Checked := false;
    CheckBox10.Checked := false;
    CheckBox11.Checked := false;
    CheckBox12.Checked := false;
    CheckBox13.Checked := false;
    CheckBox14.Checked := false;
    CheckBox15.Checked := false;
    CheckBox16.Checked := false;
    CB_ListenTel.Checked := false;
    CB_WorkTel.Checked := false;
    CB_num1.Checked := false;
    CB_num2.Checked := false;
    CB_num3.Checked := false;
    CB_num4.Checked := false;
  end;
end;

procedure Tset_DevParam.EditDnsKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8,'.',','])then
  begin
    messagebox(handle,'请输入数字或"."或"," !','提示',mb_ok + mb_iconinformation);
    key:=#0;
    if (Sender as TEdit).Enabled then
      (Sender as TEdit).SetFocus;
    exit;
  end;
end;

procedure Tset_DevParam.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8,'.'])then
  begin
    messagebox(handle,'请输入数字或"." !','提示',mb_ok + mb_iconinformation);
    key:=#0;
    if (Sender as TEdit).Enabled then
      (Sender as TEdit).SetFocus;
    exit;
  end;
end;

end.
