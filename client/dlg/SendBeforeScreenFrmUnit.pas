unit SendBeforeScreenFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit,
  cxInplaceContainer, cxControls, StdCtrls, Buttons, ComCtrls;

type
  TSendBeforeScreenForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    InfoList: TcxTreeList;
    cxID: TcxTreeListColumn;
    cxInfo: TcxTreeListColumn;
    Panel6: TPanel;
    Panel7: TPanel;
    ListView1: TListView;
    Panel8: TPanel;
    BitBtn4: TBitBtn;
    BitBtnSel: TBitBtn;
    BitBtnAdd: TBitBtn;
    BitBtnDel: TBitBtn;
    BitBtnSend: TBitBtn;
    BitBtnClose: TBitBtn;
    procedure BitBtnAddClick(Sender: TObject);
    procedure BitBtnDelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SendBeforeScreenForm: TSendBeforeScreenForm;

implementation
    uses  BeforeScreenFrmUnit;
{$R *.dfm}

procedure TSendBeforeScreenForm.BitBtnAddClick(Sender: TObject);
var
  node:TcxTreeListNode;
begin
  BeforeScreenForm:=TBeforeScreenForm.Create(nil);
  try
     BeforeScreenForm.BitBtnSelect.Enabled:=true;
     BeforeScreenForm.ShowModal;
     if BeforeScreenForm.ModalResult = mrOK then
     begin
         if BeforeScreenForm.InfoList.FocusedNode<>nil then
         begin
             node:=InfoList.Add;
             node.Values[0]:=BeforeScreenForm.InfoList.FocusedNode.Values[0];
             node.Values[1]:=BeforeScreenForm.InfoList.FocusedNode.Values[1];
         end;
     end;
  finally
     BeforeScreenForm.Free;
  end;

end;

procedure TSendBeforeScreenForm.BitBtnDelClick(Sender: TObject);
begin
   if InfoList.FocusedNode<>nil then
   begin
       InfoList.FocusedNode.Delete;
   end;
end;

end.
