unit AnswerListFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, CarUnit, uGloabVar;

type
  TAnswerListFrm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn_List100: TBitBtn;
    BitBtn_Clr: TBitBtn;
    Panel3: TPanel;
    EventListView: TListView;
    procedure BitBtn_ClrClick(Sender: TObject);
    procedure BitBtn_List100Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure OnAnswerListUpload(ADev: TObject; Question: string; Answer: string; dateTime: TDateTime);
  end;

var
  AnswerListFrm: TAnswerListFrm;

implementation
uses umainf;
{$R *.dfm}

procedure TAnswerListFrm.OnAnswerListUpload(ADev: TObject;  Question: string; Answer: string;  dateTime: TDateTime);
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
      SubItems.Add(Question);
      SubItems.Add(Answer);
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
    node.SubItems.Add(Question);
    node.SubItems.Add(Answer);
    node.SubItems.Add(DateTimeToStr(dateTime));
    node.Data:=ADev;
 end;
end;

procedure TAnswerListFrm.BitBtn_ClrClick(Sender: TObject);
begin
EventListView.Clear;
end;

procedure TAnswerListFrm.BitBtn_List100Click(Sender: TObject);
var
  i: Integer;
begin
  while EventListView.Items.Count > 10 do
  begin
    EventListView.Items.Delete(EventListView.Items.Count-1);
  end;
end;

procedure TAnswerListFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Mainf.Show_AnswerList.Checked := false;
end;

end.
