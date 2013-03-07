unit ListeniningFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, cxGraphics, cxCustomData, cxStyles, cxTL,
  cxTextEdit, cxInplaceContainer, cxControls, ExtCtrls, Buttons, ActnList,
  StructDefUnit, cxCheckBox, Menus;

type
  TListeniningFrm = class(TForm)
    Animate1: TAnimate;
    Label1: TLabel;
    PanelOtherState: TPanel;
    cxOtherStateList: TcxTreeList;
    UserChannel_ID: TcxTreeListColumn;
    UserChannel_Number: TcxTreeListColumn;
    UserChannel_State: TcxTreeListColumn;
    Panel2: TPanel;
    EditDevCarNo: TEdit;
    Label2: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    ActionList1: TActionList;
    Action_SeeTheDev: TAction;
    Action_ListeninWithOther: TAction;
    Action_Close: TAction;
    Label3: TLabel;
    EditAlarmCallin: TEdit;
    LabelWithOtherListenin: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure Action_CloseExecute(Sender: TObject);
    procedure Action_ListeninWithOtherExecute(Sender: TObject);
    procedure cxOtherStateListEditing(Sender: TObject;
      AColumn: TcxTreeListColumn; var Allow: Boolean);
  private

    { Private declarations }
  public
    { Public declarations }
    //收到　电话服务器告知正在监听的座席：当前所有监听座席的状态，为并线第二个监听座席提供准备
    procedure DoRcvSTAlarmUserChannelState(ABuff: PCmdSTAlarmUserChannelState);
    //收到　电话服务器应答：客户端要求并线监听的结果回复
    procedure DoRcvRetAlarmMonitorWithOther(ARet:Byte);
  end;

var
  ListeniningFrm: TListeniningFrm;

implementation
uses uGloabVar,umainf;
{$R *.dfm}

procedure TListeniningFrm.FormCreate(Sender: TObject);
begin
  Animate1.Active := False;
  Animate1.FileName:= ExePath+'toCOMP.avi';
  Animate1.Active := True;
  LabelWithOtherListenin.Visible := False;
end;

procedure TListeniningFrm.Action_CloseExecute(Sender: TObject);
begin
  close;
end;

procedure TListeniningFrm.DoRcvSTAlarmUserChannelState(ABuff:PCmdSTAlarmUserChannelState);
  procedure FillData(ANode: TcxTreeListNode;ChannelId,ChannelNum:Integer);
  begin
    with ANode do
    begin
      Values[0] := IntToStr(ChannelId);
      Values[1] := IntToStr(ChannelNum);
    end;
  end;
var
  i,alarmChannelCnt:Integer;
  userChannelId:Integer;
  userChannelNum:Integer;
  node: TcxTreeListNode;
  userChannelIdStr:String;
begin
  if not PanelOtherState.Visible then exit;
  cxOtherStateList.Clear;
  cxOtherStateList.BeginUpdate;
  alarmChannelCnt := ABuff^.alarmUserChannelNum;
  for i:= 0 to alarmChannelCnt -1 do
  begin
    userChannelId := ABuff^.alarmUserChannelID[i];            //通道号
    userChannelNum := ABuff^.alarmUserID[i];           //通道分机号码
    if ABuff^.alarmUserChannelState[i] <> CLIENT_STATE_IDLE then Continue;  //通道状态，非空闲 不列出
    userChannelIdStr := IntToStr(userChannelId);
    node := cxOtherStateList.FindNodeByText(userChannelIdStr,UserChannel_ID);
    if node = nil then
    begin
      node := cxOtherStateList.Add;
      FillData(node,userChannelId,userChannelNum);
      node.Values[2] := false; //默认 没选择并线监听
    end
    else
      FillData(node,userChannelId,userChannelNum);
  end;
  cxOtherStateList.EndUpdate;
end;

procedure TListeniningFrm.Action_ListeninWithOtherExecute(Sender: TObject);
//var
//  withChannelId : Integer;
begin
//  if cxOtherStateList.SelectionCount=0 then
//  begin
//    MessageBox(Handle,'请先在下面的列表中选择要并线监听的座席！','提示',MB_OK + MB_ICONINFORMATION);
//    Exit;
//  end;
//  if cxOtherStateList.SelectionCount>0 then
//  begin
//    withChannelId := cxOtherStateList.Selections[0].Values[0];
//    if MessageBox(Handle,pchar('您确定要并线监听'+IntToStr(withChannelId)+'号通道？'),'提示',MB_YESNO + MB_ICONQUESTION) = idNo then exit;
//    FCallClient.AlarmMonitorWithOtherChannel(withChannelId);
//    LabelWithOtherListenin.Visible := True;
//    LabelWithOtherListenin.Caption := '并线监听执行中...';
//  end;
end;

procedure TListeniningFrm.cxOtherStateListEditing(Sender: TObject;
  AColumn: TcxTreeListColumn; var Allow: Boolean);
var
  i: integer;
begin
  {if cxOtherStateList.FocusedNode = nil then exit;
  if (AColumn = UserChannel_WithListenin) then
  begin
    cxOtherStateList.BeginUpdate;
    Allow := True;
    for i:= 0 to cxOtherStateList.Items.Count -1 do
    begin
      if cxOtherStateList.Items[i] =cxOtherStateList.FocusedNode then Continue;
      cxOtherStateList.Items[i].Values[3] := False;   //只能并线监听一个座席
    end;
    cxOtherStateList.EndUpdate;
  end;                     }
end;

procedure TListeniningFrm.DoRcvRetAlarmMonitorWithOther(ARet: Byte);
begin                      //Ret: Byte; //0失败 1成功
//  LabelWithOtherListenin.Visible := True;
//  if ARet =0 then
//    LabelWithOtherListenin.Caption := '并线监听失败，请重新选择座席并行监听！'
//  else if ARet = 1 then
//  begin
//    LabelWithOtherListenin.Caption := '并线监听成功！';
//    Action_ListeninWithOther.Enabled := False;
//    PanelOtherState.Visible := False;
//    self.Width := 320;
//  end;
//  PopMsg('并线监听',LabelWithOtherListenin.Caption);
end;

end.
