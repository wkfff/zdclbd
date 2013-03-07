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
        messagebox(handle,'IP��ַ������Χ','��ʾ',mb_ok + mb_iconinformation);
      i:=Pos('.',s);
      if i>0 then
      begin
        s1:=Copy(s,1,i-1);
        s:=Copy(s,i+1,Length(s)-i);
      end;
      j:=StrToInt(s1);
      if (j<0) or (j>255) then
        messagebox(handle,'IP��ַ������Χ','��ʾ',mb_ok + mb_iconinformation);
      i := Pos('.',s);
      if i>0 then
      begin
        s1 := Copy(s,1,i-1);
        s := Copy(s,i+1,Length(s)-i);
      end;
      j := StrToInt(s1);
      if (j<0) or (j>255) then
        messagebox(handle,'IP��ַ������Χ','��ʾ',mb_ok + mb_iconinformation);
      j := StrToInt(s);
      if (j<0) or (j>255) then
        messagebox(handle,'IP��ַ������Χ','��ʾ',mb_ok + mb_iconinformation);
  except
    messagebox(handle,'�������IP��ַ����ȷ������������!','��ʾ',mb_ok + mb_iconinformation);
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
    messagebox(handle,'���������ֻ�'',''���ڵ绰����֮����'',''����!','��ʾ',mb_ok + mb_iconinformation);
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
  {..��������}
  if RB_Basic.Checked then
  begin
    choice:=(checkbox3.Checked) or (CheckBox4.Checked) or (CheckBox5.Checked) or
      (checkbox6.Checked) or (checkbox7.Checked) or
      (checkbox8.Checked) or (CheckBox9.Checked) or (CheckBox10.Checked) or
      (checkbox11.Checked) or (CheckBox12.Checked) or (CheckBox13.Checked) or
      (checkbox14.Checked) or (CheckBox15.Checked) or (CheckBox16.Checked);
    if not choice then
    begin
      messagebox(handle,'��ѡ��Ҫ���õ�һ���������!','��ʾ',mb_ok + mb_iconinformation);
      exit;
    end;
    {if (CheckBox3.Checked) and (trim(edit3.Text)='') then
    begin
      messagebox(handle,'������������!','��ʾ',mb_ok + mb_iconinformation);
      edit3.SetFocus;
      exit;
    end;
    if (CheckBox4.Checked) and (trim(edit4.Text)='') then
    begin
      messagebox(handle,'��������IP��ַ!','��ʾ',mb_ok + mb_iconinformation);
      edit4.SetFocus;
      exit;
    end;}
    if (CheckBox3.Checked) and ((trim(edit3.Text)<>'') or (Trim(EditDns.Text)<>''))then
    begin
      str1:= trim(edit3.Text);
      if (str1='') then
      begin
        messagebox(handle,'������������!','��ʾ',mb_ok + mb_iconinformation);
        if edit3.Enabled then edit3.SetFocus;
        exit;
      end;
      //ǰ��Ϊ','
      n:= length(str1);
      if (str1[1]=',') or (str1[n]=',') then
      begin
        messagebox(handle,'��һλ�����һλ��'','',�밴��ȷ��ʽ��д!','��ʾ',mb_ok + mb_iconinformation);
        if edit3.Enabled then edit3.SetFocus;
        exit;
      end;
      //ȷ�� �м�û������','д��һ��
      for i:= 2 to n-2 do
      begin
        if (str1[i]=',') and (str1[i+1]=',') then
        begin
          messagebox(handle,'������'',''д��һ���밴��ȷ��ʽ��д!','��ʾ',mb_ok + mb_iconinformation);
          if edit3.Enabled then edit3.SetFocus;
          exit;
        end;
      end;
      //��� �Ƿ���������������һ��','
      i:= pos(',',str1);
      if i=0 then
      begin
        messagebox(handle,'����������������������֮����'',''����!','��ʾ',mb_ok + mb_iconinformation);
        if edit3.Enabled then edit3.SetFocus;
        exit;
      end;
      //ȷ�� ���������Ƿ�һ��
      stra := copy(str1,1,i-1);
      strb := copy(str1,i+1,n-1);
      if stra = strb then
      begin
        messagebox(handle,'���������������һ��! ����������!','��ʾ',mb_ok + mb_iconinformation);
        if edit3.Enabled then edit3.SetFocus;
        exit;
      end;
      //��� �Ƿ��ж����������� ����һ��',', ������û
      i:= pos(',',strb);
      if i>0 then
      begin
        messagebox(handle,'�����������в�ֹһ��'',''! ����������������������֮����'',''����!','��ʾ',mb_ok + mb_iconinformation);
        if edit3.Enabled then edit3.SetFocus;
        exit;
      end;
      //��� ��һ�����Ƿ�д����ȷ��������'.'
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
        messagebox(handle,'����������ĵ�һ�������Ƿ���ȷ!','��ʾ',mb_ok + mb_iconinformation);
        if edit3.Enabled then edit3.SetFocus;
        exit;
      end;
      //��� �ڶ������Ƿ�д����ȷ��������'.'
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
        messagebox(handle,'����������ĵڶ��������Ƿ���ȷ!','��ʾ',mb_ok + mb_iconinformation);
        if edit3.Enabled then edit3.SetFocus;
        exit;
      end;
      //-----------DNS----------------------------
      str1:= Trim(EditDns.Text);
      if str1='' then
      begin
        messagebox(handle,'��������DNS!','��ʾ',mb_ok + mb_iconinformation);
        if EditDns.Enabled then EditDns.SetFocus;
        exit;
      end;

      //ǰ��Ϊ','
      n:= length(str1);
      if (str1[1]=',') or (str1[n]=',') then
      begin
        messagebox(handle,'��һλ�����һλ��'','',�밴��ȷ��ʽ��д!','��ʾ',mb_ok + mb_iconinformation);
        if EditDns.Enabled then EditDns.SetFocus;
        exit;
      end;
      //ȷ�� �м�û������','д��һ��
      for i:= 2 to n-2 do
      begin
        if (str1[i]=',') and (str1[i+1]=',') then
        begin
          messagebox(handle,'������'',''д��һ���밴��ȷ��ʽ��д!','��ʾ',mb_ok + mb_iconinformation);
          if EditDns.Enabled then EditDns.SetFocus;
          exit;
        end;
      end;
      //��� �Ƿ�������IP����һ��','
      i:= pos(',',str1);
      if i=0 then
      begin
        messagebox(handle,'������������DNS��DNS֮����'',''����!','��ʾ',mb_ok + mb_iconinformation);
        if EditDns.Enabled then EditDns.SetFocus;
        exit;
      end;
      //ȷ�� ����IP�Ƿ�һ��
      stra := copy(str1,1,i-1);
      strb := copy(str1,i+1,n-1);
      if stra = strb then
      begin
        messagebox(handle,'�����������DNSһ��! ����������!','��ʾ',mb_ok + mb_iconinformation);
        if EditDns.Enabled then EditDns.SetFocus;
        exit;
      end;
      //��� �Ƿ��ж�������IP������һ��',', ������û
      i:= pos(',',strb);
      if i>0 then
      begin
        messagebox(handle,'�����������в�ֹһ��'',''! ������������DNS��DNS֮����'',''����!','��ʾ',mb_ok + mb_iconinformation);
        if EditDns.Enabled then EditDns.SetFocus;
        exit;
      end;
      //��� DNS1---IP��ַ �Ƿ�д����ȷ����3��'.'
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
            messagebox(handle,'�������DNS�ĵ�һ��IP��ַ����ȷ�����������룡','��ʾ',mb_ok + mb_iconinformation);
            if EditDns.Enabled then EditDns.SetFocus;
            exit;
          end;
          stra:= copy(stra,i+1,length(stra)-i);
          //n:= length(stra);
          cnt:= cnt + 1;
        end
        else if (stra='') or (strToint(stra)>255) then
        begin
          messagebox(handle,'�������DNS�ĵ�һ��IP��ַ����ȷ�����������룡','��ʾ',mb_ok + mb_iconinformation);
            if EditDns.Enabled then EditDns.SetFocus;
            exit;
        end
        else
          break;
      end;
      if cnt<>3 then
      begin
        messagebox(handle,'�����������DNS�ĵ�һ��IP��ַ�Ƿ���ȷ!','��ʾ',mb_ok + mb_iconinformation);
        if EditDns.Enabled then EditDns.SetFocus;
        exit;
      end;
      //��� DNS2---IP��ַ �Ƿ�д����ȷ����3��'.'
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
            messagebox(handle,'�������DNS�ĵڶ���IP��ַ����ȷ�����������룡','��ʾ',mb_ok + mb_iconinformation);
            if EditDns.Enabled then EditDns.SetFocus;
            exit;
          end;
          strb:= copy(strb,i+1,length(strb)-i);
          //n:= length(strb);
          cnt:= cnt + 1;
        end
        else if (strb='') or (strToint(strb)>255) then
        begin
          messagebox(handle,'�������DNS�ĵڶ���IP��ַ����ȷ�����������룡','��ʾ',mb_ok + mb_iconinformation);
            if EditDns.Enabled then EditDns.SetFocus;
            exit;
        end
        else
          break;
      end;
      if cnt<>3 then
      begin
        messagebox(handle,'�����������DNS�ĵڶ���IP��ַ�Ƿ���ȷ!','��ʾ',mb_ok + mb_iconinformation);
        if EditDns.Enabled then EditDns.SetFocus;
        exit;
      end;          

    end;
    if (CheckBox4.Checked) then
    begin
      str1:= trim(edit4.Text);
      if str1='' then
      begin
        messagebox(handle,'��������IP��ַ!','��ʾ',mb_ok + mb_iconinformation);
        if edit4.Enabled then edit4.SetFocus;
        exit;
      end;
      //��� IP��ַ�Ƿ�д����ȷ����3��'.'
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
            messagebox(handle,'�������IP��ַ������Χ�����������룡','��ʾ',mb_ok + mb_iconinformation);
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
        messagebox(handle,'�����������IP��ַ�Ƿ���ȷ!','��ʾ',mb_ok + mb_iconinformation);
        if edit4.Enabled then edit4.SetFocus;
        exit;
      end;
    end;
    if (CheckBox5.Checked) then
    begin
      if (trim(edit5.Text)='') then
      begin
        messagebox(handle,'��������˿�!','��ʾ',mb_ok + mb_iconinformation);
        if edit5.Enabled then edit5.SetFocus;
        exit;
      end;
      if StrToInt(trim(edit5.Text))=0 then
      begin
        messagebox(handle,'�˿ڲ���Ϊ0������������!','��ʾ',mb_ok + mb_iconinformation);
        if edit5.Enabled then edit5.SetFocus;
        exit;
      end;
    end;
    if (CheckBox6.Checked) then
    begin
      if (trim(edit6.Text)='') then
      begin
        messagebox(handle,'��������SMS���ĺ�!','��ʾ',mb_ok + mb_iconinformation);
        if edit6.Enabled then edit6.SetFocus;
        exit;
      end;
     if copy(trim(edit6.Text),1,2)<>'86' then
      begin
        if length(trim(edit6.Text))>13 then
        begin
          messagebox(handle,'������ȷ����SMS���ĺ�','��ʾ',mb_ok + mb_iconinformation);
          if edit6.Enabled then edit6.SetFocus;
          exit;
        end
        else
          edit6.Text := '86'+ trim(edit6.Text);
      end;
    end;             
    if (CheckBox7.Checked) and (trim(edit7.Text)='') then
    begin
      messagebox(handle,'��������SMS���շ�����SIM����!','��ʾ',mb_ok + mb_iconinformation);
      if edit7.Enabled then edit7.SetFocus;
      exit;
    end;
    if (CheckBox8.Checked) then
    begin
      if (trim(edit8.Text)='') then
      begin
        messagebox(handle,'�������������ر�ʱ����!','��ʾ',mb_ok + mb_iconinformation);
        if edit8.Enabled then edit8.SetFocus;
        exit;
      end;
      if StrToInt(trim(edit8.Text))=0 then
      begin
        messagebox(handle,'�����ر�ʱ��������Ϊ0������������!','��ʾ',mb_ok + mb_iconinformation);
        if edit8.Enabled then edit8.SetFocus;
        exit;
      end;
    end;
    if (CheckBox9.Checked) then
    begin
      if (trim(edit9.Text)='') then
      begin
        messagebox(handle,'��������ر���Ϣ����!','��ʾ',mb_ok + mb_iconinformation);
        if edit9.Enabled then edit9.SetFocus;
        exit;
      end;
      if StrToInt(trim(edit9.Text))=0 then
      begin
        messagebox(handle,'�ر���Ϣ��������Ϊ0������������!','��ʾ',mb_ok + mb_iconinformation);
        if edit9.Enabled then edit9.SetFocus;
        exit;
      end;
      if StrToInt(trim(edit9.Text))>255 then
      begin
        messagebox(handle,'�ر���Ϣ�������ܴ���255������������!','��ʾ',mb_ok + mb_iconinformation);
        if edit9.Enabled then edit9.SetFocus;
        exit;
      end;
    end;
    if (CheckBox10.Checked)then
    begin
      if (trim(edit10.Text)='') then
      begin
        messagebox(handle,'�������뱨���ر�ʱ����!','��ʾ',mb_ok + mb_iconinformation);
        if edit10.Enabled then edit10.SetFocus;
        exit;
      end;
      if StrToInt(trim(edit10.Text))=0 then
      begin
        messagebox(handle,'�����ر�ʱ��������Ϊ0������������!','��ʾ',mb_ok + mb_iconinformation);
        if edit10.Enabled then edit10.SetFocus;
        exit;
      end;
      if StrToInt(trim(edit10.Text))>255 then
      begin
        messagebox(handle,'�����ر�ʱ�������ܴ���255������������!','��ʾ',mb_ok + mb_iconinformation);
        if edit10.Enabled then edit10.SetFocus;
        exit;
      end;
    end;
    if (CheckBox11.Checked) then
    begin
      if (trim(edit11.Text)='') then
      begin
        messagebox(handle,'�������뱨���ر��ط�����!','��ʾ',mb_ok + mb_iconinformation);
        if edit11.Enabled then edit11.SetFocus;
        exit;
      end;
      if StrToInt(trim(edit11.Text))=0 then
      begin
        messagebox(handle,'�����ر��ط���������Ϊ0������������!','��ʾ',mb_ok + mb_iconinformation);
        if edit11.Enabled then edit11.SetFocus;
        exit;
      end;
    end;
    if (CheckBox12.Checked) and (trim(ComboBox1.Text)='') then
    begin
      messagebox(handle,'����ѡ�� �ⲿ���ڲ�����!','��ʾ',mb_ok + mb_iconinformation);
      if ComboBox1.Enabled then ComboBox1.SetFocus;
      exit;
    end;
    if CheckBox13.Checked then
    begin
      if trim(edit13.Text)='' then
      begin
        messagebox(handle,'��������IO��ʼ״̬!','��ʾ',mb_ok + mb_iconinformation);
        if edit13.Enabled then edit13.SetFocus;
        exit;
      end;
      if StrToInt(trim(edit13.Text))>255 then
      begin
        messagebox(handle,'IO��ʼ״ֻ̬������0-255����������������!','��ʾ',mb_ok + mb_iconinformation);
        if edit13.Enabled then edit13.SetFocus;
        exit;
      end;
    end;
    {if (CheckBox14.Checked) and (trim(ComboBox2.Text)='') then
    begin
      messagebox(handle,'����ѡ�� �ⲿ�豸��ʹ ��!','��ʾ',mb_ok + mb_iconinformation);
      if ComboBox2.Enabled then ComboBox2.SetFocus;
      exit;
    end; }
    if CheckBox14.Checked then
    begin
      if trim(Edit14.Text)='' then
      begin
        messagebox(handle,'�������� ����ʱ��!','��ʾ',mb_ok + mb_iconinformation);
        if Edit14.Enabled then Edit14.SetFocus;
        exit;
      end;
      n:=StrToInt(trim(Edit14.Text));
      if (n>255)or (n<10) then
      begin
        messagebox(handle,'����ʱ��ֻ����[10-255]֮�����������������!','��ʾ',mb_ok + mb_iconinformation);
        if edit14.Enabled then Edit14.SetFocus;
        exit;
      end;
    end;
    if (CheckBox15.Checked) and (trim(edit15.Text)='') then
    begin
      messagebox(handle,'��������APN�����!','��ʾ',mb_ok + mb_iconinformation);
      if edit15.Enabled then edit15.SetFocus;
      exit;
    end;
    if (CheckBox16.Checked) and (trim(edit16.Text)='') then
    begin
      messagebox(handle,'��������SMS���ͷ�����SIM����!','��ʾ',mb_ok + mb_iconinformation);
      if edit16.Enabled then edit16.SetFocus;
      exit;
    end;
  end
  {..������ҵ��绰}
  else if RB_else.Checked then
  begin
    choice:=(CB_ListenTel.Checked) or (CB_WorkTel.Checked);
    if not choice then
    begin
      messagebox(handle,'��ѡ��Ҫ���ĵ�һ��绰!','��ʾ',mb_ok + mb_iconinformation);
      exit;
    end;
    {....�����绰}
    if CB_ListenTel.Checked then
    begin
      str1:=trim(Edit_ListenTel.Text);
      if str1='' then
      begin
        messagebox(handle,'������������绰!','��ʾ',mb_ok + mb_iconinformation);
        if Edit_ListenTel.Enabled then Edit_ListenTel.SetFocus;
        exit;
      end;
      // ȷ�� ǰ��Ϊ','
      if (copy(str1,1,1)=',')or (copy(str1,length(str1),1)=',') then
      begin
        messagebox(handle,'��һλ�����һλ��'','' �밴��ȷ��ʽ��д�绰!','��ʾ',mb_ok + mb_iconinformation);
        if Edit_ListenTel.Enabled then Edit_ListenTel.SetFocus;
        exit;
      end;
      // ȷ�� �м�û������','д��һ��
      for i:= 2 to length(str1)-2 do
      begin
        if (str1[i]=',') and (str1[i+1]=',') then
        begin
          messagebox(handle,'������'',''д��һ���밴��ȷ��ʽ��д�绰!','��ʾ',mb_ok + mb_iconinformation);
          if Edit_ListenTel.Enabled then Edit_ListenTel.SetFocus;
          exit;
        end;
      end;
      //ȷ�� ����ʽ��д���̶��绰ǰ��������ţ��ֻ���ֱ��д
      n := length(str1);
      while n >0 do
      begin
        if (str1[1]<>'0') and (str1[1]<>'1') then
        begin
          messagebox(handle,'�밴��ʽ��д���̶��绰ǰ������ţ��ֻ���ֱ��д!','��ʾ',mb_ok + mb_iconinformation);
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
          messagebox(handle,'�����绰ֻ���������ֻ�'',''����ȥ����Ч�ַ�!','��ʾ',mb_ok + mb_iconinformation);
          if Edit_ListenTel.Enabled then Edit_ListenTel.SetFocus;
          break;
        end;
      end;
      if i<> n+1 then exit;
    end;
    {....ҵ��绰}
    if CB_WorkTel.Checked then
    begin
      str1:=trim(Edit_WorkTel.Text);
      if str1='' then
      begin
        messagebox(handle,'��������ҵ��绰!','��ʾ',mb_ok + mb_iconinformation);
        if Edit_WorkTel.Enabled then Edit_WorkTel.SetFocus;
        exit;
      end;
      // ȷ�� ǰ��Ϊ','
      if (copy(str1,1,1)=',')or (copy(str1,length(str1),1)=',') then
      begin
        messagebox(handle,'��һλ�����һλ��'','' �밴��ȷ��ʽ��д�绰!','��ʾ',mb_ok + mb_iconinformation);
        if Edit_WorkTel.Enabled then Edit_WorkTel.SetFocus;
        exit;
      end;
      // ȷ�� �м�û������','д��һ��
      for i:= 2 to length(str1)-2 do
      begin
        if (str1[i]=',') and (str1[i+1]=',') then
        begin
          messagebox(handle,'������'',''д��һ���밴��ȷ��ʽ��д�绰!','��ʾ',mb_ok + mb_iconinformation);
          if Edit_WorkTel.Enabled then Edit_WorkTel.SetFocus;
          exit;
        end;
      end;
      //ȷ�������������绰���� ��һ����Ϊ��λ�绰       
      i:= pos(',',str1);
      if i=0 then
      begin
        messagebox(handle,'��Ϊ��һ���绰���붨Ϊ��λ�绰���������������������绰����!','��ʾ',mb_ok + mb_iconinformation);
        if Edit_WorkTel.Enabled then Edit_WorkTel.SetFocus;
        exit;
      end;
      //ȷ�� ����ʽ��д���̶��绰ǰ��������ţ��ֻ���ֱ��д
      n := length(str1);
      while n >0 do
      begin
        if (str1[1]<>'0') and (str1[1]<>'1') then
        begin
          messagebox(handle,'�밴��ʽ��д���̶��绰ǰ������ţ��ֻ���ֱ��д!','��ʾ',mb_ok + mb_iconinformation);
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
          messagebox(handle,'ҵ��绰ֻ���������ֻ�'',''����ȥ����Ч�ַ�!','��ʾ',mb_ok + mb_iconinformation);
          if Edit_WorkTel.Enabled then Edit_WorkTel.SetFocus;
          break;
        end;
      end;
      if i<> n+1 then exit;
    end;
  end
  {..�����绰}
  else if RB_KeyPressTelNum.Checked then
  begin
    choice:=(CB_num1.Checked) or (CB_num2.Checked) or (CB_num3.Checked) or (CB_num4.Checked);
    if not choice then
    begin
      messagebox(handle,'��ѡ��Ҫ���ĵ�һ����绰!','��ʾ',mb_ok + mb_iconinformation);
      exit;
    end;
    if (CB_num1.Checked)then
    begin
      if (trim(Edit_num1.Text)='') then
      begin
        messagebox(handle,'��������1�Ű����绰!','��ʾ',mb_ok + mb_iconinformation);
        if Edit_num1.Enabled then Edit_num1.SetFocus;
        exit;
      end;
      str1:= trim(Edit_num1.Text);
      if (str1[1]<>'0') and (str1[1]<>'1') then
      begin
        messagebox(handle,'�밴��ʽ��д���̶��绰ǰ������ţ��ֻ���ֱ��д!','��ʾ',mb_ok + mb_iconinformation);
        if Edit_num1.Enabled then Edit_num1.SetFocus;
        exit;
      end;
      str1:= Trim(Edit_num1.Text);
      n:= length(str1);
      for i:= 1 to n do
      begin
        if not (str1[i] in['0'..'9']) then
        begin
          messagebox(handle,'�����绰ֻ���������֣���ȥ����Ч�ַ�!','��ʾ',mb_ok + mb_iconinformation);
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
        messagebox(handle,'��������2�Ű����绰!','��ʾ',mb_ok + mb_iconinformation);
        if Edit_num2.Enabled then Edit_num2.SetFocus;
        exit;
      end;
      str1:= trim(Edit_num2.Text);
      if (str1[1]<>'0') and (str1[1]<>'1') then
      begin
        messagebox(handle,'�밴��ʽ��д���̶��绰ǰ������ţ��ֻ���ֱ��д!','��ʾ',mb_ok + mb_iconinformation);
        if Edit_num2.Enabled then Edit_num2.SetFocus;
        exit;
      end;

      n:= length(str1);
      for i:= 1 to n do
      begin
        if not (str1[i] in['0'..'9']) then
        begin
          messagebox(handle,'�����绰ֻ���������֣���ȥ����Ч�ַ�!','��ʾ',mb_ok + mb_iconinformation);
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
        messagebox(handle,'��������3�Ű����绰!','��ʾ',mb_ok + mb_iconinformation);
        if Edit_num3.Enabled then Edit_num3.SetFocus;
        exit;
      end;
      str1:= trim(Edit_num3.Text);
      if (str1[1]<>'0') and (str1[1]<>'1') then
      begin
        messagebox(handle,'�밴��ʽ��д���̶��绰ǰ������ţ��ֻ���ֱ��д!','��ʾ',mb_ok + mb_iconinformation);
        if Edit_num3.Enabled then Edit_num3.SetFocus;
        exit;
      end;
      n:= length(str1);
      for i:= 1 to n do
      begin
        if not (str1[i] in['0'..'9']) then
        begin
          messagebox(handle,'�����绰ֻ���������֣���ȥ����Ч�ַ�!','��ʾ',mb_ok + mb_iconinformation);
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
        messagebox(handle,'��������4�Ű����绰!','��ʾ',mb_ok + mb_iconinformation);
        if Edit_num4.Enabled then Edit_num4.SetFocus;
        exit;
      end;
      str1:= trim(Edit_num4.Text);
      if (str1[1]<>'0') and (str1[1]<>'1') then
      begin
        messagebox(handle,'�밴��ʽ��д���̶��绰ǰ������ţ��ֻ���ֱ��д!','��ʾ',mb_ok + mb_iconinformation);
        if Edit_num4.Enabled then Edit_num4.SetFocus;
        exit;
      end;
      n:= length(str1);
      for i:= 1 to n do
      begin
        if not (str1[i] in['0'..'9']) then
        begin
          messagebox(handle,'�����绰ֻ���������֣���ȥ����Ч�ַ�!','��ʾ',mb_ok + mb_iconinformation);
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
    messagebox(handle,'����������!','��ʾ',mb_ok + mb_iconinformation);
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
    messagebox(handle,'����������!','��ʾ',mb_ok + mb_iconinformation);
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
      messagebox(handle,'ֻ���������ֻ�'',''����ȥ����Ч�ַ�!','��ʾ',mb_ok + mb_iconinformation);
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
      messagebox(handle,'�����绰ֻ���������֣���ȥ����Ч�ַ�!','��ʾ',mb_ok + mb_iconinformation);
      (Sender as TEdit).SetFocus;
      break;
    end;
  end;

end;

procedure Tset_DevParam.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8])then
  begin
    messagebox(handle,'����������!','��ʾ',mb_ok + mb_iconinformation);
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
    messagebox(handle,'���������ֻ�"."��"," !','��ʾ',mb_ok + mb_iconinformation);
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
    messagebox(handle,'���������ֻ�"." !','��ʾ',mb_ok + mb_iconinformation);
    key:=#0;
    if (Sender as TEdit).Enabled then
      (Sender as TEdit).SetFocus;
    exit;
  end;
end;

end.
