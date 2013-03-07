unit ucall_dev;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, ActnList;

type
  Tcall_dev = class(TForm)
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel_Devs: TPanel;
    Panel4: TPanel;
    Panel1: TPanel;
    ListView1: TListView;
    Panel5: TPanel;
    BitBtnSel: TBitBtn;
    BitBtn3: TBitBtn;
    Panel6: TPanel;
    Panel8: TPanel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtnSelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  call_dev: Tcall_dev;

implementation
     uses uFrmSelectDevs,CarUnit;
{$R *.dfm}

procedure Tcall_dev.BitBtn1Click(Sender: TObject);
begin
  ModalResult := mrok;
end;

procedure Tcall_dev.BitBtn3Click(Sender: TObject);
begin
  if ListView1.Selected =nil then exit;
  if ListView1.Items.Count =1 then 
  begin
    messagebox(handle,'只有一辆车了，不能删除！','提示',mb_ok + mb_iconinformation);
    exit;
  end;
  ListView1.DeleteSelected ; 
end;

procedure Tcall_dev.BitBtnSelClick(Sender: TObject);
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

procedure Tcall_dev.FormShow(Sender: TObject);
begin
  ListView1.Columns.Items[0].MaxWidth :=ListView1.Width-20;
end;

end.
