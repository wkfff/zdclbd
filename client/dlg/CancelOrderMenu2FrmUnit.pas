unit CancelOrderMenu2FrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, cxGraphics, cxCustomData,
  cxStyles, cxTL, cxControls, cxInplaceContainer, cxTextEdit,carunit;

type
  TCancelOrderMenu2Frm = class(TForm)
    Panel5: TPanel;
    Panel6: TPanel;
    Panel1: TPanel;
    Panel3: TPanel;
    BitBtnOK: TBitBtn;
    BitBtnClose: TBitBtn;
    ProgressBar1: TProgressBar;
    Panel4: TPanel;
    ListView1: TListView;
    Panel8: TPanel;
    BitBtnSel: TBitBtn;
    BitBtn3: TBitBtn;
    cxTreeListFrom: TcxTreeList;
    cxTreeListTo: TcxTreeList;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    cxTreeListFromcxTreeListColumn1: TcxTreeListColumn;
    cxTreeListFromcxTreeListColumn2: TcxTreeListColumn;
    cxTreeListTocxTreeListColumn1: TcxTreeListColumn;
    cxTreeListTocxTreeListColumn2: TcxTreeListColumn;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtnSelClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtnOKClick(Sender: TObject);
    procedure BitBtnCloseClick(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
  private
    procedure AddNode(AList: TcxTreeList;AID:integer;AName:string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CancelOrderMenu2Frm: TCancelOrderMenu2Frm;

implementation
   uses uGloabVar,uFrmSelectDevs;
{$R *.dfm}

procedure TCancelOrderMenu2Frm.AddNode(AList: TcxTreeList; AID: integer;
  AName: string);
var
  node:TcxTreeListNode;
begin
 if AList.FindNodeByText(AName,AList.Columns[1]) =nil then
 begin
   node:=AList.Add;
   node.Values[0]:=AID;
   node.Values[1]:=AName;
 end;
end;

procedure TCancelOrderMenu2Frm.FormShow(Sender: TObject);
var
  i:integer;
begin
  cxTreeListFrom.Clear;
  cxTreeListTo.Clear;
  if VarIsNull(bs.CancelMenuData.Data) then exit;
  bs.CancelMenuData.First;
  for i:=0 to  bs.CancelMenuData.RecordCount-1 do
  begin
    AddNode(cxTreeListFrom,bs.CancelMenuData.FieldValues['id'],bs.CancelMenuData.FieldValues['reason']);
    bs.CancelMenuData.Next;
  end;
end;

procedure TCancelOrderMenu2Frm.BitBtn1Click(Sender: TObject);
begin
  if cxTreeListFrom.Count<=0 then exit; 
  if cxTreeListFrom.FocusedNode=nil then
     cxTreeListFrom.Items[0].Focused:=true;
  AddNode(cxTreeListTo,cxTreeListFrom.FocusedNode.Values[0],cxTreeListFrom.FocusedNode.Values[1]);
  cxTreeListFrom.FocusedNode.Delete;
end;

procedure TCancelOrderMenu2Frm.BitBtn2Click(Sender: TObject);
var
  i:integer;
begin
 for i:=0 to  cxTreeListFrom.Count-1 do
    BitBtn1Click(nil);
end;

procedure TCancelOrderMenu2Frm.BitBtn4Click(Sender: TObject);
begin
  if cxTreeListTo.Count<=0 then exit; 
  if cxTreeListTo.FocusedNode=nil then
     cxTreeListTo.Items[0].Focused:=true;
  AddNode(cxTreeListFrom,cxTreeListTo.FocusedNode.Values[0],cxTreeListTo.FocusedNode.Values[1]);
  cxTreeListTo.FocusedNode.Delete;
end;

procedure TCancelOrderMenu2Frm.BitBtn5Click(Sender: TObject);
var
  i:integer;
begin
  for i:=0 to  cxTreeListTo.Count-1 do
    BitBtn4Click(nil);
end;

procedure TCancelOrderMenu2Frm.BitBtnSelClick(Sender: TObject);
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

procedure TCancelOrderMenu2Frm.BitBtn3Click(Sender: TObject);
begin
  if ListView1.Selected =nil then exit;
  if ListView1.Items.Count =1 then
  begin
    messagebox(handle,'只有一辆车了，不能删除！','提示',mb_ok + mb_iconinformation);
    exit;
  end;
  ListView1.DeleteSelected ; 
end;

procedure TCancelOrderMenu2Frm.BitBtnOKClick(Sender: TObject);
 procedure AddToDev(Dev:TDevice);
 var
  i:integer;
  PMenu:PCancelOrderMenu;
 begin
   if cxTreeListTo.Count<=0 then exit;
   Dev.ClearCancelOrderMenuList;
   for i:=0 to cxTreeListTo.Count-1 do
   begin
    PMenu:=Dev.AddCancelOrderMenu(cxTreeListTo.Items[i].Values[0]);
    PMenu^.Name:=cxTreeListTo.Items[i].Values[1];
    bs.AddCancelOrderReason_Zb(PMenu^.ID,Dev.idStr);
   end;
 end;
 procedure SendMenu(Dev:TDevice);
 var
   i:integer;
   Len:integer;
   Cur:integer;
   buf:array of byte;
 begin
   Cur:=0;
   Len:=0;
   for i:=0 to  Dev.CancelOrderMenuCount-1 do
   begin
     Inc(Len,2);
     SetLength(buf,Len);
     buf[Cur]:=Dev.CancelOrderMenuItems[i].ID;
     inc(Cur);
     buf[Cur]:=Length(Dev.CancelOrderMenuItems[i].Name);
     Len:=Len+buf[Cur];
     SetLength(buf,Len);
     inc(Cur);
     CopyMemory(@buf[Cur],@Dev.CancelOrderMenuItems[i].Name[1],buf[Cur-1]);
     Cur:=Cur+buf[Cur-1];
   end;
   DataServer.ModifyCancelOrderMenu(Dev.Id,@buf[0],Len);
 end;
var
  i:integer;
begin
  if ListView1.Items.Count=0 then
  begin
    messagebox(handle,'请选择一辆车!','提示',mb_ok + mb_iconinformation);
    exit;
  end;
  if cxTreeListTo.Count=0 then
  begin
    messagebox(handle,'请选择一个取消菜单!','提示',mb_ok + mb_iconinformation);
    exit;
  end;
  ProgressBar1.Visible:=true;
  try
    ProgressBar1.Max:=ListView1.Items.Count*10*2;
    for i:=0 to ListView1.Items.Count -1 do
    begin
       ProgressBar1.StepIt;
       AddToDev(TDevice(ListView1.Items.Item[i].Data));
       SendMenu(TDevice(ListView1.Items.Item[i].Data));
       ProgressBar1.StepIt;
       //sleep(50);
       Application.ProcessMessages;
    end;
  finally
    ProgressBar1.Visible:=false;
  end;
  close;
end;

procedure TCancelOrderMenu2Frm.BitBtnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TCancelOrderMenu2Frm.ListView1Click(Sender: TObject);
var
  i:integer;
  s:string;
  NOde:TcxTreeListNode;
begin
  if ListView1.Selected <> nil then
  begin
    cxTreeListFrom.Clear;
    cxTreeListTo.Clear;
    if not VarIsNull(bs.CancelMenuData.Data) then
    begin
      bs.CancelMenuData.First;
      for i:=0 to  bs.CancelMenuData.RecordCount-1 do
      begin
        AddNode(cxTreeListFrom,bs.CancelMenuData.FieldValues['id'],bs.CancelMenuData.FieldValues['reason']);
        bs.CancelMenuData.Next;
      end;
    end;
    for i:=0 to TDevice(ListView1.Selected.Data).CancelOrderMenuCount-1 do
    begin
      s:=TDevice(ListView1.Selected.Data).CancelOrderMenuItems[i]^.Name;
      AddNode(cxTreeListTo,TDevice(ListView1.Selected.Data).CancelOrderMenuItems[i]^.id, s);
      NOde:=cxTreeListFrom.FindNodeByText(s,cxTreeListFrom.Columns[1]);
      if Node<>nil then
        Node.Delete;
    end;
  end;
end;

end.
