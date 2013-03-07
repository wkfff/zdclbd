unit SendAdInfoFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit,
  cxCalendar, cxInplaceContainer, cxControls, StdCtrls, Buttons, ComCtrls,AdInfoFrmUnit;

type
  TSendAdInfoForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    AdInfoList: TcxTreeList;
    cxID: TcxTreeListColumn;
    cxadMemo: TcxTreeListColumn;
    cxbeginTime: TcxTreeListColumn;
    cxendTime: TcxTreeListColumn;
    cxcustomerName: TcxTreeListColumn;
    cxlinkName: TcxTreeListColumn;
    cxTel: TcxTreeListColumn;
    cxMemo: TcxTreeListColumn;
    BitBtnAdd: TBitBtn;
    BitBtnDel: TBitBtn;
    BitBtnSend: TBitBtn;
    BitBtnClose: TBitBtn;
    Timer1: TTimer;
    BitBtnCancel: TBitBtn;
    ProgressBar1: TProgressBar;
    CheckBox1: TCheckBox;
    Panel4: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    ListView1: TListView;
    Panel8: TPanel;
    BitBtn4: TBitBtn;
    BitBtnSel: TBitBtn;
    procedure BitBtnAddClick(Sender: TObject);
    procedure BitBtnDelClick(Sender: TObject);
    procedure BitBtnSendClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtnCancelClick(Sender: TObject);
    procedure BitBtnSelClick(Sender: TObject);
  private
     CmdIDList:array of integer;
     SendP:integer;
     HaveErrorIsSet:boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SendAdInfoForm: TSendAdInfoForm;

implementation
      uses uGloabVar,CarUnit,ConstDefineUnit,uFrmSelectDevs;
{$R *.dfm}

procedure TSendAdInfoForm.BitBtnAddClick(Sender: TObject);
var
  node,fnode:TcxTreeListNode;
begin
   AdInfoForm:=TAdInfoForm.Create(Self);
   try
      AdInfoForm.BitBtnSelect.Enabled:=true;
      AdInfoForm.ShowModal;
      if AdInfoForm.ModalResult = mrOK then
      begin
          if AdInfoForm.AdInfoList.FocusedNode =nil then exit;
          fnode:=AdInfoForm.AdInfoList.FocusedNode;
          node:=AdInfoList.Add;
          node.Values[0]:=fnode.Values[0];
          node.Values[1]:=fnode.Values[1];
          node.Values[2]:=fnode.Values[2];
          node.Values[3]:=fnode.Values[3];
          node.Values[4]:=fnode.Values[4];
          node.Values[5]:=fnode.Values[5];
          node.Values[6]:=fnode.Values[6];
          node.Values[7]:=fnode.Values[7];
      end;

   finally
      AdInfoForm.Free;
   end;
end;

procedure TSendAdInfoForm.BitBtnDelClick(Sender: TObject);
begin
   if AdInfoList.FocusedNode <>nil then
   begin
      AdInfoList.FocusedNode.Delete;
   end;
end;

procedure TSendAdInfoForm.BitBtnSendClick(Sender: TObject);
var
  i:integer;
begin
   if AdInfoList.Count<=0 then exit;
   if ListView1.Items.Count <=0 then exit;
   ProgressBar1.Position:=0;
   ProgressBar1.Max:=ADInfoList.Count*10+10;
   ProgressBar1.StepIt;
   bs.ConnectServer;
   Application.ProcessMessages;
   SetLength(CmdIDList,ListView1.Items.Count);
   if CheckBox1.Checked then
   begin
       SendP:=-1;
       for i:=0 to ListView1.Items.Count-1 do
       begin
           DataServer.DelAllAdInfo(TDevice(ListView1.Items.Item[i].Data));
           CmdIDList[i]:=GSetParamCmdID;
       end;
       ProgressBar1.StepIt;
       Application.ProcessMessages;
   end
   else
   begin
       SendP:=0;
       for i:=0 to ListView1.Items.Count-1 do
       begin
           DataServer.SendAdInfo(TDevice(ListView1.Items.Item[i].Data),
                                 AdInfoList.Nodes.Items[Sendp].Values[0],
                                 AdInfoList.Nodes.Items[Sendp].Values[1]);
           CmdIDList[i]:=GSetParamCmdID;
       end;
       ProgressBar1.StepIt;
       Application.ProcessMessages;
   end;
   Timer1.Enabled:=true;
   BitBtnSend.Enabled:=false;

   BitBtnAdd.Enabled:=false;
   BitBtnDel.Enabled:=false;
   BitBtnClose.Enabled:=false;
   BitBtnCancel.Enabled:=true;

end;

procedure TSendAdInfoForm.Timer1Timer(Sender: TObject);
     function CheckCanSend:boolean;
     var
       i:integer;
       state:byte;
     begin
       {if CmdIDList[0]=-1 then  //判断是否为第一次发送.
       begin
         Result:=true;
         exit;
       end;        }
       Result:=false;
       for i:=0 to ListView1.Items.Count-1 do
       begin
         state:=(ACmdManage.Find(CmdIDList[i]))^.State;
         if state = CMD_SNDNODO then      //如果有一个还处于发送状态,就认为没有发送完,继续等待.
         begin
           exit;
         end
         else if not(State = CMD_DONE)or(State = CMD_REPLACE) then // 如果有一个发送错误,就报错,告诉用户是否接着发送.
         begin
           if HaveErrorIsSet then continue;
           timer1.Enabled:=false;
           if messagebox(handle,Pchar('发送'+ADeviceManage.FindToCarNO(ACmdManage.Find(CmdIDList[i]).DevId)+'出错!是否继续发送?'),pchar('提示'),MB_YESNO)=ID_YES then
           begin
              HaveErrorIsSet:=true;
              timer1.Enabled:=true;

           end
           else
           begin
              BitBtnCancelClick(nil);
              exit;
           end;
         end;
       end;
       Result:=true;
     end;
var
  i:integer;
begin

  if  CheckCanSend then
  begin
      Inc(SendP);
      if SendP>= AdInfoList.Count then
      begin
        BitBtnCancelClick(nil);
        exit;
      end;
      for i:=0 to ListView1.Items.Count-1 do
      begin
         DataServer.SendAdInfo(TDevice(ListView1.Items.Item[i].Data),
                               AdInfoList.Nodes.Items[Sendp].Values[0],
                               AdInfoList.Nodes.Items[Sendp].Values[1]);
         CmdIDList[i]:=GSetParamCmdID;
      end;
      ProgressBar1.StepIt;
      Application.ProcessMessages;
  end;

end;

procedure TSendAdInfoForm.BitBtnCancelClick(Sender: TObject);
begin
   timer1.Enabled:=false;

   BitBtnAdd.Enabled:=true;
   BitBtnDel.Enabled:=true;
   BitBtnSend.Enabled:=true;
   BitBtnClose.Enabled:=true;
   
   BitBtnCancel.Enabled:=false;
   ProgressBar1.Position:=0;
end;






procedure TSendAdInfoForm.BitBtnSelClick(Sender: TObject);
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

end.
