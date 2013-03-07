unit sendQuestionFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxCheckListBox, StdCtrls, ComCtrls,
  Buttons, ExtCtrls, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit,
  cxInplaceContainer, Menus, CarUnit, IntegerListUnit;

type
  TsendQuestionFrm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel3: TPanel;
    ListView1: TListView;
    Panel4: TPanel;
    Panel6: TPanel;
    BitBtnSel: TBitBtn;
    BitBtn3: TBitBtn;
    Panel5: TPanel;
    Panel_basic: TPanel;
    Panel8: TPanel;
    ProgressBar1: TProgressBar;
    Panel9: TPanel;
    Panel10: TPanel;
    cxDevAnswerList: TcxTreeList;
    Tel_Id: TcxTreeListColumn;
    Tel_No: TcxTreeListColumn;
    Panel11: TPanel;
    Panel7: TPanel;
    Panel12: TPanel;
    checkSign: TcxCheckListBox;
    Panel13: TPanel;
    Panel14: TPanel;
    Label2: TLabel;
    Panel15: TPanel;
    Memo1: TMemo;
    Panel16: TPanel;
    btnOK: TBitBtn;
    btnDel: TBitBtn;
    btnNew: TButton;
    Panel17: TPanel;
    Label1: TLabel;
    memAnswer: TMemo;
    Panel18: TPanel;
    Label3: TLabel;
    ComboBox1: TComboBox;
    Panel19: TPanel;
    procedure btnOKClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure cxDevAnswerListClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtnSelClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    isCancel:boolean;
    FDev:TDevice;
  public
    Cancel: Boolean;
    procedure ReLoadAnswerList(Dev:TDevice);overload;
    procedure ReLoadAnswerList;overload;

  end;

var
  BEdit: Boolean = False;
implementation
uses answerFrmUnit, uGloabvar, ConstDefineUnit, uFrmSelectDevs;
{$R *.dfm}

procedure TsendQuestionFrm.ReLoadAnswerList(Dev:TDevice);
var
  i: integer;
  pInfo: PAnswerInfo;
begin
  cxDevAnswerList.BeginUpdate;
  cxDevAnswerList.Clear;
  for i:= 0 to Dev.AnswerList.Count-1 do
  begin
    with cxDevAnswerList.Add do
    begin
      pInfo := Dev.AnswerItems[i];
      data:= pInfo;
      Values[0]:= i+1;//序号
      Values[1]:= pInfo^.Info;
    end;
  end;
  cxDevAnswerList.EndUpdate;
end;

procedure TsendQuestionFrm.ReLoadAnswerList;
var
  i: integer;
  pInfo: PAnswerInfo;
begin
  cxDevAnswerList.BeginUpdate;
  cxDevAnswerList.Clear;
  for i:= 0 to GCurSelectDev.AnswerList.Count-1 do
  begin
    with cxDevAnswerList.Add do
    begin
      pInfo := GCurSelectDev.AnswerItems[i];
      data:= pInfo;
      Values[0]:= i+1;//序号
      Values[1]:= pInfo^.info;
    end;
  end;
  cxDevAnswerList.EndUpdate;
end;

procedure TsendQuestionFrm.btnOKClick(Sender: TObject);
var
  i: Integer;
  pAnswer: PAnswerInfo;
begin
  if cxDevAnswerList.Count>=15 then
  begin
    messagebox(handle,pchar('已有15条候选答案，不能再添加！'),'提示',mb_ok + mb_iconinformation);
    exit;
  end;
  //if cxDevAnswerList.SelectionCount =0 then
  //begin
  if BEdit = False then
  begin
    pAnswer := FDev.AddAnswerInfo;
    pAnswer^.info := trim(memAnswer.text);
  end else
  begin
    pAnswer := FDev.FindAnswerInfo(PAnswerInfo(cxDevAnswerList.Selections[0].Data)^.id);
    pAnswer^.Info := trim(memAnswer.text);
  end;
  ReLoadAnswerList(FDev);
  memAnswer.Text := '';
  memAnswer.SetFocus;
  BEdit := false;
end;

procedure TsendQuestionFrm.btnDelClick(Sender: TObject);
var
  pAnswer: PAnswerInfo;
begin
  if cxDevAnswerList.FocusedNode = nil then Exit;
  
  pAnswer := PAnswerInfo(cxDevAnswerList.Selections[0].Data);
  FDev.DelAnswerInfo(pAnswer^.Id);
  ReLoadAnswerList(FDev);
  memAnswer.Text := '';
  BEdit := False;
  //cxDevAnswerList.DeleteSelection;
end;

procedure TsendQuestionFrm.cxDevAnswerListClick(Sender: TObject);
begin
  BEdit := True;
  memAnswer.Text := cxDevAnswerList.Selections[0].Values[1];
end;

procedure TsendQuestionFrm.BitBtn1Click(Sender: TObject);
  function GetChecked(ItemIndex: Byte): Byte;
  begin
    if checkSign.Items[ItemIndex].Checked then
      Result := 1
    else
      Result := 0;
  end;
var
  i,j:integer;
  D:TDevice;
  AnswerInfo:PAnswerInfo;
  controlCmd:Byte;
  b: array[0..7] of Byte;
  k,tmp: Byte;
  MsgID:integer;
  info: string;
  AnswerList: TIntegerList;
begin
  if Trim(Memo1.Text) = '' then
  begin
    ShowTips('请输入问题!', Memo1);
    Memo1.SetFocus;
    exit;
  end;
  if cxDevAnswerList.Count = 0 then
  begin
    ShowTips('请输入候选答案!', memAnswer);
    memAnswer.SetFocus;
    exit;
  end;
  i := 0;
  tmp := 0;
  k := 0;
  isCancel:=false;
  Panel4.Enabled:=false;
  Panel8.Visible:=true;
  ProgressBar1.Max:=ListView1.Items.Count*5*10;
  TbitBtn(Sender).Enabled:=false;

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
    for i:=0 to ListView1.Items.Count -1 do
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
      D:=TDevice(ListView1.Items.Item[i].Data);
      if FDev = nil then
      begin
        ProgressBar1.StepIt;
        ProgressBar1.StepIt;
        Continue;
      end;
      D.ClrAnswerList;
      ProgressBar1.StepIt;
      for j:=0 to FDev.AnswerList.Count-1 do //当=0时,,是删除事件列表里的内容.
      begin
        AnswerInfo:= D.AddAnswerInfo;
        //AnswerInfo^.id := Dev.AnswerItems[j].id;
        AnswerInfo^.Info:= FDev.AnswerItems[j].Info;
        if j = 0 then
          info := AnswerInfo^.Info
        else
          info := info +','+ AnswerInfo^.Info;
      end;
      D.Qustion := trim(Memo1.Text);

      AnswerList := FDev.AnswerList;

      ProgressBar1.StepIt;
//      try
//        MsgID:=Bs.AddNewMsg(D.fact_id,  D.id, 1, trim(Memo1.Text),  controlCmd, '', info);
//      except
//        on E: Exception do
//        begin
//          messagebox(handle, QUERY_WARNING_INFO, '提示', mb_ok + mb_iconinformation);
//          exit;
//        end;
//      end;

//      if MsgID = -1 then
//      begin
//        messagebox(handle,PAnsiChar('提问保存失败，停止对'+dev.Car.No+'发送提问信息！'),'提示',mb_ok + mb_iconinformation);
//      end
//      else
      begin
        DataServer.SetAnswerList(D, Trim(Memo1.Text), AnswerList, MsgID ,controlCmd); // 发送数据
        D.MsgID := MsgID;
      end;
      ProgressBar1.StepIt;
      //TelNumSaveToDB(D);
      ProgressBar1.StepIt;
      //Sleep(50);
      //Application.ProcessMessages;
    end;

  finally
    Panel4.Enabled:=true;
    Panel8.Visible:=false;
    TbitBtn(Sender).Enabled:=true;
  end;
 Close;
end;

procedure TsendQuestionFrm.FormCreate(Sender: TObject);
begin
  FDev := TDevice.Create;
end;

procedure TsendQuestionFrm.btnNewClick(Sender: TObject);
begin
 BEdit := False;
 memAnswer.Text := '';
end;

procedure TsendQuestionFrm.BitBtn2Click(Sender: TObject);
begin
  cancel := True;
end;

procedure TsendQuestionFrm.FormShow(Sender: TObject);
begin
  checkSign.Items[3].Checked := True;
end;

procedure TsendQuestionFrm.BitBtnSelClick(Sender: TObject);
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

procedure TsendQuestionFrm.BitBtn3Click(Sender: TObject);
begin
  if ListView1.Selected =nil then exit;
  if ListView1.Items.Count =1 then
  begin
    messagebox(handle,'只有一辆车了，不能删除！','提示',mb_ok + mb_iconinformation);
    exit;
  end;
  ListView1.DeleteSelected ; 
end;

procedure TsendQuestionFrm.ComboBox1Change(Sender: TObject);
begin
  memAnswer.Lines.Clear;
  if ComboBox1.ItemIndex>0 then
  begin
    memAnswer.Lines.Add(ComboBox1.Items.Strings[ComboBox1.ItemIndex]);
  end;
end;

procedure TsendQuestionFrm.FormDestroy(Sender: TObject);
begin
  FDev.Free;
end;

end.
