unit SelectPlayGpsTimeUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, DateUtils;

type
  TSelectPlayGpsTimeForm = class(TForm)
    Panel4: TPanel;
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Panel5: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    start_date: TDateTimePicker;
    start_time: TDateTimePicker;
    end_date: TDateTimePicker;
    end_time: TDateTimePicker;
    Panel8: TPanel;
    BitBtnReSelect: TBitBtn;
    procedure start_dateChange(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtnReSelectClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SelectPlayGpsTimeForm: TSelectPlayGpsTimeForm;

implementation
   uses uSelect_dev,carunit,ugloabvar;
{$R *.dfm}

procedure TSelectPlayGpsTimeForm.start_dateChange(Sender: TObject);
begin
  if end_date.date<start_date.date then
    end_date.Date:= start_date.Date;
end;

procedure TSelectPlayGpsTimeForm.BitBtn3Click(Sender: TObject);
begin
  if (start_date.date> end_date.date)  or
    ((start_date.date = end_date.date) and (start_time.Time>end_time.Time))then
  begin
    messagebox(handle,'请重新输入 回放时间段!','提示',mb_ok + mb_iconinformation);
    exit;
  end
  else if DaysBetween(end_date.date, start_date.date) > 31 then
  begin
    messagebox(handle,'请将查询时间范围缩短至31天内!','提示',mb_ok + mb_iconinformation);
    exit;
  end
  else
    ModalResult := mrOk;           
end;

procedure TSelectPlayGpsTimeForm.FormCreate(Sender: TObject);
begin
  edit1.Text:='';
  edit2.Text:='';
  edit3.Text:='';
  edit4.Text:='';
  edit5.Text:='';
  edit6.Text:='';
end;

procedure TSelectPlayGpsTimeForm.BitBtnReSelectClick(Sender: TObject);
var
  dev:TDevice;
begin
  select_dev:= Tselect_dev.Create(Self);
  try
    select_dev.Panel5.Visible:=false;
    select_dev.ShowModal;
    if select_dev.ModalResult = mrOk then
    begin
       dev := TDevice(select_dev.ListView1.Selected.Data);
       if dev=nil then exit;
       GCurSelectDev:=dev;
       edit1.Text:=select_dev.Edit1.Text;
       edit2.Text:=select_dev.Edit2.Text;
       edit3.Text:=select_dev.Edit3.Text;
       edit4.Text:=select_dev.Edit4.Text;
       edit5.Text:=select_dev.Edit5.Text;
       edit6.Text:=select_dev.Edit6.Text;
    end;
  finally
    select_dev.Free;
  end;


end;

end.
