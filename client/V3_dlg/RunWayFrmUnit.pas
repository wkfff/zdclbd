unit RunWayFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, RzButton;

type
  TRunWayFrm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label14: TLabel;
    areaID: TEdit;
    Edit_RoadName: TEdit;
    Edit4: TEdit;
    ComboBox1: TComboBox;
    GroupBox2: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Edit_NO: TEdit;
    beginDate: TDateTimePicker;
    beginTime: TDateTimePicker;
    endDate: TDateTimePicker;
    endTime: TDateTimePicker;
    Edit_MaxSpeed: TEdit;
    Edit_time: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn5: TRzBitBtn;
    Label4: TLabel;
    Edit_Width: TEdit;
    Label5: TLabel;
    Label7: TLabel;
    Edit_MinTime: TEdit;
    Edit_MaxTime: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    SpeedButton1: TSpeedButton;
    Edit_AreaColor: TEdit;
    ColorDialog1: TColorDialog;
    procedure RzBitBtn1Click(Sender: TObject);
    procedure Edit_NOKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RunWayFrm: TRunWayFrm;

implementation

{$R *.dfm}

procedure TRunWayFrm.RzBitBtn1Click(Sender: TObject);
begin
  if length(Trim(Edit_NO.Text))=0 then
  begin
    messagebox(handle,'请输入区域编号','提示',mb_ok + mb_iconinformation);
    Edit_NO.SetFocus ;
    exit;
  end;
  if length(Trim(Edit_RoadName.Text))=0 then
  begin
    messagebox(handle,'请您输入路段的名称！','提示',mb_ok + mb_iconinformation);
    Edit_RoadName.SetFocus;
    exit;
  end;

  if length(Trim(Edit_Width.Text))=0 then
  begin
    messagebox(handle,'请输入路段宽度','提示',mb_ok + mb_iconinformation);
    Edit_Width.SetFocus ;
    exit;
  end;

  if length(Trim(Edit_MinTime.Text))=0 then
  begin
    messagebox(handle,'请输入最短行驶时间','提示',mb_ok + mb_iconinformation);
    Edit_MinTime.SetFocus ;
    exit;
  end;

  if length(Trim(Edit_MaxTime.Text))=0 then
  begin
    messagebox(handle,'请输入最长行驶时间','提示',mb_ok + mb_iconinformation);
    Edit_MaxTime.SetFocus ;
    exit;
  end;

  if length(Trim(Edit_MaxSpeed.Text))=0 then
  begin
    messagebox(handle,'请输入最高速度','提示',mb_ok + mb_iconinformation);
    Edit_NO.SetFocus ;
    exit;
  end;

  if length(Trim(Edit_time.Text))=0 then
  begin
    messagebox(handle,'请输入持续时间','提示',mb_ok + mb_iconinformation);
    Edit_time.SetFocus ;
    exit;
  end;
  
  ModalResult := mrok;
end;

procedure TRunWayFrm.Edit_NOKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in [#8, '0'..'9', #22]) then Key := #0;
end;

procedure TRunWayFrm.SpeedButton1Click(Sender: TObject);
begin
  if ColorDialog1.Execute then
    Edit_AreaColor.Color :=  ColorDialog1.Color;
end;

end.
