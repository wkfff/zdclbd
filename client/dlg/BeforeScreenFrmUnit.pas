unit BeforeScreenFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit,
  cxInplaceContainer, cxControls, StdCtrls, Buttons,DBClient;

type
  TBeforeScreenForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    InfoList: TcxTreeList;
    cxID: TcxTreeListColumn;
    cxInfo: TcxTreeListColumn;
    Memo1: TMemo;
    Panel5: TPanel;
    BitBtnAdd: TBitBtn;
    BitBtnDel: TBitBtn;
    BitBtnClose: TBitBtn;
    BitBtnSelect: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtnAddClick(Sender: TObject);
    procedure BitBtnDelClick(Sender: TObject);
    procedure BitBtnSelectClick(Sender: TObject);
    procedure InfoListDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BeforeScreenForm: TBeforeScreenForm;

implementation
     uses uGloabVar;
{$R *.dfm}

procedure TBeforeScreenForm.FormCreate(Sender: TObject);
var
  DataSet:Tclientdataset;
  i:integer;
  node:TcxTreeListNode;
begin
    Memo1.Clear;
    DataSet:=bs.QueryBeforeScreen;
    if DataSet<>nil then
    begin
        for i:=0 to DataSet.RecordCount-1 do
        begin
            node:=InfoList.Add;
            node.Values[0]:=DataSet.FieldByName('ID').AsInteger;
            node.Values[1]:=DataSet.FieldByName('bsMemo').AsString;
            DataSet.Next;
        end;


    end;
end;

procedure TBeforeScreenForm.BitBtnAddClick(Sender: TObject);
var
  id:integer;
  str:string;
  node:TcxTreeListNode;
begin
   str:=Trim(Memo1.Text);
   if str <> '' then
   begin
      id:=bs.AddNewBeforeScreen(str);
      node:=InfoList.Add;
      node.Values[0]:=ID;
      node.Values[1]:=str;
   end;
end;

procedure TBeforeScreenForm.BitBtnDelClick(Sender: TObject);
begin
  if InfoList.FocusedNode <> nil then
  begin
      bs.DeleteBeforeScreen(Integer(InfoList.FocusedNode.Values[0]));
      InfoList.FocusedNode.Delete;
  end;
end;

procedure TBeforeScreenForm.BitBtnSelectClick(Sender: TObject);
begin
  if  BitBtnSelect.Enabled then
  begin
     Close;
     Self.ModalResult:=mrOK;
  end;
end;

procedure TBeforeScreenForm.InfoListDblClick(Sender: TObject);
begin
    BitBtnSelectClick(nil);
end;

end.
