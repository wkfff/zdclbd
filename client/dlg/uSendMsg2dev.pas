unit uSendMsg2dev;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, cxControls, cxContainer,
  cxCheckListBox;

type
  TsendMsg2dev = class(TForm)
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    Panel_basic: TPanel;
    Memo1: TMemo;
    Label2: TLabel;
    Panel3: TPanel;
    ListView1: TListView;
    Panel4: TPanel;
    Panel6: TPanel;
    BitBtnSel: TBitBtn;
    BitBtn3: TBitBtn;
    ProgressBar1: TProgressBar;
    PanelControlSet: TPanel;
    CheckBoxControlSetRead: TCheckBox;
    CheckBoxControlSetShow: TCheckBox;
    CheckBoxSelectControlFunction: TCheckBox;
    Panel5: TPanel;
    checkSign: TcxCheckListBox;
    Label1: TLabel;
    ComboBox1: TComboBox;
    btnSign: TBitBtn;
    Label3: TLabel;
    Panel7: TPanel;
    CheckBox1: TCheckBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Panel_basicResize(Sender: TObject);
    procedure BitBtnSelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckBoxSelectControlFunctionClick(Sender: TObject);
    procedure btnSignClick(Sender: TObject);
  private
   // function DelInvalidStr(inStr: string): string;
    { Private declarations }
    isCancel:boolean;
  public
    { Public declarations }
    Cancel: Boolean;
  end;

var
  sendMsg2dev: TsendMsg2dev;

implementation
        uses uFrmSelectDevs,Carunit,uGloabVar,ConstDefineUnit;
{$R *.dfm}

procedure TsendMsg2dev.BitBtn1Click(Sender: TObject);
  function GetChecked(ItemIndex: Byte): Byte;
  begin
    if checkSign.Items[ItemIndex].Checked then
      Result := 1
    else
      Result := 0;
  end;
var
  MsgID:integer;
  i,k:integer;
  Dev:TDevice;
  controlCmd:Byte;
  b: array[0..7] of Byte;
  tmp: Byte;            
begin
  i := 0;
  tmp := 0;
  k := 0;
  isCancel:=false;
  if trim(memo1.Lines.Text)='' then
  begin
    ShowTips('请输入文本信息内容!', memo1);
    memo1.SetFocus;
    exit;
  end;
  Memo1.Lines.Text:=DelInvalidStr(Memo1.Lines.Text);
  //ProgressBar1.Visible:=True;
  ProgressBar1.StepBy(0);
  ProgressBar1.Max:=ListView1.Items.Count*2*10;
  //Label1.Visible:=false;
  //ComboBox1.Visible:=false;
  BitBtn1.Enabled:=false;

  b[0] := GetChecked(0);
  b[1] := GetChecked(1);
  b[2] := GetChecked(2);
  b[3] := GetChecked(3);
  b[4] := GetChecked(4);
  b[5] := GetChecked(5);
  b[6] := GetChecked(6);
  b[7] := GetChecked(7);

  while i <= 7 do
  begin
    k := i mod 8;
    if k = 0 then tmp := 0;
    tmp := tmp + b[i] shl k;
    if k = 7 then
      controlCmd := tmp;
    inc(i);
  end;

  try
    for i:=0 to ListView1.Items.Count-1 do
    begin
      if Cancel then
      begin
        if messagebox(handle, '是否确实要取消对剩余车辆的操作？', '提示', MB_YESNO + MB_ICONQUESTION) = ID_YES then
        begin
          Close;
          Exit;
        end
        else
        begin
          Cancel := False;
        end;
      end;
      Dev:=TDevice(ListView1.Items.Item[i].Data);
      if Dev=nil then
      begin
        ProgressBar1.StepIt;
        ProgressBar1.StepIt;
        Continue;
      end;
      ProgressBar1.StepIt;
      if CheckBox1.Checked then
      begin
        try
          MsgID:=Bs.AddNewMsg(Dev.fact_id,  Dev.id, 0, trim(Memo1.Text),  controlCmd, '','');
        except
          on E: Exception do
          begin
            messagebox(handle, QUERY_WARNING_INFO, '提示', mb_ok + mb_iconinformation);
            exit;
          end;
        end;
        if MsgID = -1 then
        begin
          ShowMessage('消息保存失败，停止对'+dev.Car.No+'发送消息！');
        end
        else
        begin
          DataServer.SendControlInfo_Alarm_V3(MsgID, Dev, Trim(Memo1.Text), Length(Trim(Memo1.Text)), controlCmd,true);
        end;
      end
      else
      begin
        DataServer.SendControlInfo_Alarm_V3(-1, Dev, Trim(Memo1.Text), Length(Trim(Memo1.Text)), controlCmd);
      end;
      ProgressBar1.StepIt;
      //Sleep(5);
      Application.ProcessMessages;
    end;
    LastSendMsg_NeedAnswer := memo1.Lines.Text;
  finally
    //ProgressBar1.Visible:=false;
    //Label1.Visible:=True;
    //ComboBox1.Visible:=True;
    Panel2.Enabled:=True;
    BitBtn1.Enabled:=True;
  end;
  ModalResult := mrok;
end;

procedure TsendMsg2dev.BitBtn3Click(Sender: TObject);
begin
  if ListView1.Selected =nil then exit;
  if ListView1.Items.Count =1 then
  begin
    messagebox(handle,'只有一辆车了，不能删除！','提示',mb_ok + mb_iconinformation);
    exit;
  end;
  ListView1.DeleteSelected ; 
end;

procedure TsendMsg2dev.ComboBox1Change(Sender: TObject);
begin
  memo1.Lines.Clear;
  if ComboBox1.ItemIndex>0 then
  begin
    memo1.Lines.Add(ComboBox1.Items.Strings[ComboBox1.ItemIndex]);
    ComboBox1.Hint := ComboBox1.Items.Strings[ComboBox1.ItemIndex];
  end;
end;

procedure TsendMsg2dev.Panel_basicResize(Sender: TObject);
begin
  Memo1.Width:=Panel_basic.Width-24;
  ComboBox1.Width:=Panel_basic.Width-24;
end;

procedure TsendMsg2dev.BitBtnSelClick(Sender: TObject);
var
  frm: TFrmSelectDevs;
  i:integer;
begin
  frm:=TFrmSelectDevs.Create(nil);
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
    frm.Free;
  end;
end;

{function TsendMsg2dev.DelInvalidStr(inStr: string): string;
var
  i,n : integer;
  tmpByte,byte2 : byte;
begin
  i:=1;
  n:= length(inStr);
  while i<=n do
  begin
    tmpByte:= ord(inStr[i]);
    if (tmpByte<$20) or ((tmpByte>$7f) and (tmpByte<$A1)) then
    begin
      delete(inStr,i,1);
      i:= i-1;
    end
    else if tmpByte>=$A1 then
    begin
      byte2:= ord(inStr[i+1]);
      if (tmpByte> $F7) or (byte2< $A0) then
      begin
        delete(inStr,i,2);
        i:= i-1;
      end
      else
        i:= i+1;
    end;
    i:= i+1;
    n:= length(inStr);
  end;
  Result:= inStr;
end;   }


procedure TsendMsg2dev.FormCreate(Sender: TObject);
begin
  if FileExists(ExePath+'Message.txt') then
  begin
     ComboBox1.Items.LoadFromFile(ExePath+'Message.txt');
  end;
end;

procedure TsendMsg2dev.BitBtn2Click(Sender: TObject);
begin
  isCancel:=true;
  Cancel := True;
end;

procedure TsendMsg2dev.FormShow(Sender: TObject);
begin                                  //目前常熟专用 sha 20090203
  if Tag = MSGTYPE_NORMAL then
  begin
    PanelControlSet.Visible:= True;
    CheckBoxControlSetRead.Visible := False;
    CheckBoxControlSetShow.Visible := False;
  end
  else
    PanelControlSet.Visible:= False;

  checkSign.Items[2].Checked := True;
  checkSign.Items[3].Checked := True;
end;

procedure TsendMsg2dev.CheckBoxSelectControlFunctionClick(Sender: TObject);
begin
  CheckBoxControlSetRead.Visible := CheckBoxSelectControlFunction.Checked;
  CheckBoxControlSetShow.Visible := CheckBoxSelectControlFunction.Checked;
end;

procedure TsendMsg2dev.btnSignClick(Sender: TObject);
begin
  if panel5.Visible then
  begin
    Panel5.Visible := False;
  end else
  begin
    Panel5.Visible := True;
  end;
end;

end.
