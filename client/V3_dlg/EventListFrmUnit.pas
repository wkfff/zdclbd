unit EventListFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit,
  cxInplaceContainer, cxControls, uGloabVar, ComCtrls, CarUnit, StdCtrls,
  Buttons;

type
  TEventListFrm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    EventListView: TListView;
    BitBtn_List100: TBitBtn;
    BitBtn_Clr: TBitBtn;
    procedure BitBtn_ClrClick(Sender: TObject);
    procedure BitBtn_List100Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure OnEventListUpload(ADev: TObject; EventInfo: string; dateTime: TDateTime);
  end;

var
  EventListFrm: TEventListFrm;

implementation
uses umainf;
{$R *.dfm}

procedure TEventListFrm.OnEventListUpload(ADev: TObject; EventInfo: string; dateTime: TDateTime);
var
  node: TListItem ;
begin
  if EventListView.Items.Count =0 then
  begin
    with EventListView.Items.Add  do
    begin
      Caption:=TDevice(ADev).IdStr;
      //SubItems.Add(IntToStr(index));
      SubItems.Add(TDevice(ADev).Car.No);
      SubItems.Add(EventInfo);
      SubItems.Add(DateTimeToStr(dateTime));
      Data:=ADev;
    end;
  end
  else
  begin
    node := EventListView.Items.Insert(0);
    node.Caption:=TDevice(ADev).IdStr;
    //node.SubItems.Add(IntToStr(node.Index));
    node.SubItems.Add(TDevice(ADev).Car.No);
    node.SubItems.Add(EventInfo);
    node.SubItems.Add(DateTimeToStr(dateTime));
    node.Data:=ADev;
  end;
end;

procedure TEventListFrm.BitBtn_ClrClick(Sender: TObject);
begin
  EventListView.Clear;
end;

procedure TEventListFrm.BitBtn_List100Click(Sender: TObject);
var
  i: Integer;
begin
  while EventListView.Items.Count > 10 do
  begin
    EventListView.Items.Delete(EventListView.Items.Count-1);
  end;
end;

procedure TEventListFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Mainf.Show_EventList.Checked := false;
end;

end.
