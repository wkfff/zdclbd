unit uSended_Cmd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, ImgList, Grids, cxControls, cxContainer,
  cxListView, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit,
  cxInplaceContainer, StdCtrls, Buttons, ConstDefineUnit;

type
  TSended_Cmd = class(TForm)
    ImageList3: TImageList;
    cxTreeList1: TcxTreeList;
    cxTreeListCol_CmdID: TcxTreeListColumn;
    cxTreeListCol_CmdDesc: TcxTreeListColumn;
    cxTreeListCol_SendTime: TcxTreeListColumn;
    cxTreeListCol_ReplyTime: TcxTreeListColumn;
    cxTreeListCol_CancelTime: TcxTreeListColumn;
    cxTreeListCol_CmdStat: TcxTreeListColumn;
    Panel1: TPanel;
    BitBtn_Clr: TBitBtn;
    BitBtn_List100: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Timer1: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn_ClrClick(Sender: TObject);
    procedure BitBtn_List100Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Refresh_SendedCmd;
  end;

var
  Sended_Cmd: TSended_Cmd;

implementation
uses
  UGloabVar, umainf, GatewayServerUnit, DateUtils;
{$R *.dfm}

procedure TSended_Cmd.Refresh_SendedCmd;
var
  i: integer;
  find_ListItem: TcxTreeListNode;
begin
  try
    if AcmdManage.count < cxTreeList1.Count then
    begin
      cxTreeList1.BeginUpdate;
      cxTreeList1.Clear;
      cxTreeList1.EndUpdate;
      exit;
    end;
    cxTreeList1.BeginUpdate;
    for i := 0 to ACmdManage.count - 1 do
    begin
      find_ListItem := FindNodeByTextIncxTreeList(IntToStr(ACmdManage.Items[i].Id), cxTreeList1, 0);
      if find_ListItem = nil then
      begin
        with cxTreeList1.Add do
        begin
          Data := ACmdManage.Items[i];
          Values[0] := ACmdManage.Items[i]^.Id;
          Values[1] := ACmdManage.Items[i]^.Desc;
          Values[2] := ACmdManage.Items[i]^.SendTime;
          Values[3] := ACmdManage.Items[i]^.Replytime;
          Values[4] := ACmdManage.Items[i]^.CancelTime;
          Values[5] := getCmdStat(ACmdManage.Items[i]^.State);
          ImageIndex := ACmdManage.Items[i]^.State;
          SelectedIndex := ACmdManage.Items[i]^.State;
        end;
      end
      else
      begin
        with find_ListItem do
        begin
          Data := ACmdManage.Items[i];
          if Values[2] <> ACmdManage.Items[i]^.SendTime then
            Values[2] := ACmdManage.Items[i]^.SendTime;

          if Values[3] <> ACmdManage.Items[i]^.Replytime then
            Values[3] := ACmdManage.Items[i]^.Replytime;

          if Values[4] <> ACmdManage.Items[i]^.CancelTime then
            Values[4] := ACmdManage.Items[i]^.CancelTime;

          if Values[5] <> getCmdStat(ACmdManage.Items[i]^.State) then
            Values[5] := getCmdStat(ACmdManage.Items[i]^.State);

          ImageIndex := ACmdManage.Items[i]^.State;
          SelectedIndex := ACmdManage.Items[i]^.State;
        end;
      end;
      //Application.ProcessMessages;
    end;
    cxTreeList1.EndUpdate;

    Label2.Caption := IntToStr(cxTreeList1.Count);

  except on E: Exception do
      uGloabVar.SystemLog.AddLog(' TSended_Cmd.Refresh_SendedCmdº¯Êý±¨´í: ', e.Message);
  end;
end;

procedure TSended_Cmd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Mainf.show_sended_command.Checked := false;
end;

procedure TSended_Cmd.BitBtn_ClrClick(Sender: TObject);
begin
  ACmdManage.ClearCmd;
end;

procedure TSended_Cmd.BitBtn_List100Click(Sender: TObject);
begin
  while ACmdManage.count > 10 do
    ACmdManage.Delete(ACmdManage.Items[0].Id);
  Refresh_SendedCmd;
end;

procedure TSended_Cmd.BitBtn1Click(Sender: TObject);
begin
  while ACmdManage.count > 1 do
    ACmdManage.Delete(ACmdManage.Items[0].Id);
  Refresh_SendedCmd;
end;

procedure TSended_Cmd.BitBtn2Click(Sender: TObject);
begin
  Refresh_SendedCmd;
end;

procedure TSended_Cmd.BitBtn3Click(Sender: TObject);
var
  i: integer;
begin
  i := 0;
  while ACmdManage.count > i do
  begin
    if ACmdManage.Items[i]^.State <> CMD_SNDNODO then
    begin
      ACmdManage.Delete(ACmdManage.Items[i]^.Id);
      Continue;
    end;
    inc(i);
  end;
end;
procedure TSended_Cmd.Timer1Timer(Sender: TObject);
var
  i: Integer;
  p: PCmdInfo;
  node: TcxTreeListNode;
begin
  for i := 0 to cxTreeList1.Count - 1 do
  begin
    node := cxTreeList1.Items[i];
    p := PCmdInfo(node.Data);
    if p^.State = 0 then
    begin
      if (Now > p^.SendTime) and (MinutesBetween(Now, p^.SendTime) >= 2) then
      begin
        p^.State := CMD_OVERTIME;
        node.ImageIndex := p^.State;
        node.SelectedIndex := p^.State;
      end;  
    end;
  end;
end;

end.

