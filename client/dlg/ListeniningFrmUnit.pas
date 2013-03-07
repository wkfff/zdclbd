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
    //�յ����绰��������֪���ڼ�������ϯ����ǰ���м�����ϯ��״̬��Ϊ���ߵڶ���������ϯ�ṩ׼��
    procedure DoRcvSTAlarmUserChannelState(ABuff: PCmdSTAlarmUserChannelState);
    //�յ����绰������Ӧ�𣺿ͻ���Ҫ���߼����Ľ���ظ�
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
    userChannelId := ABuff^.alarmUserChannelID[i];            //ͨ����
    userChannelNum := ABuff^.alarmUserID[i];           //ͨ���ֻ�����
    if ABuff^.alarmUserChannelState[i] <> CLIENT_STATE_IDLE then Continue;  //ͨ��״̬���ǿ��� ���г�
    userChannelIdStr := IntToStr(userChannelId);
    node := cxOtherStateList.FindNodeByText(userChannelIdStr,UserChannel_ID);
    if node = nil then
    begin
      node := cxOtherStateList.Add;
      FillData(node,userChannelId,userChannelNum);
      node.Values[2] := false; //Ĭ�� ûѡ���߼���
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
//    MessageBox(Handle,'������������б���ѡ��Ҫ���߼�������ϯ��','��ʾ',MB_OK + MB_ICONINFORMATION);
//    Exit;
//  end;
//  if cxOtherStateList.SelectionCount>0 then
//  begin
//    withChannelId := cxOtherStateList.Selections[0].Values[0];
//    if MessageBox(Handle,pchar('��ȷ��Ҫ���߼���'+IntToStr(withChannelId)+'��ͨ����'),'��ʾ',MB_YESNO + MB_ICONQUESTION) = idNo then exit;
//    FCallClient.AlarmMonitorWithOtherChannel(withChannelId);
//    LabelWithOtherListenin.Visible := True;
//    LabelWithOtherListenin.Caption := '���߼���ִ����...';
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
      cxOtherStateList.Items[i].Values[3] := False;   //ֻ�ܲ��߼���һ����ϯ
    end;
    cxOtherStateList.EndUpdate;
  end;                     }
end;

procedure TListeniningFrm.DoRcvRetAlarmMonitorWithOther(ARet: Byte);
begin                      //Ret: Byte; //0ʧ�� 1�ɹ�
//  LabelWithOtherListenin.Visible := True;
//  if ARet =0 then
//    LabelWithOtherListenin.Caption := '���߼���ʧ�ܣ�������ѡ����ϯ���м�����'
//  else if ARet = 1 then
//  begin
//    LabelWithOtherListenin.Caption := '���߼����ɹ���';
//    Action_ListeninWithOther.Enabled := False;
//    PanelOtherState.Visible := False;
//    self.Width := 320;
//  end;
//  PopMsg('���߼���',LabelWithOtherListenin.Caption);
end;

end.
