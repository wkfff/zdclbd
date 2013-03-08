unit FrmUpgradeTerminalUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FrmBaseUnit, ComCtrls, RzButton, ExtCtrls, RzPanel, StdCtrls,
  RzCmboBx;

type
  TfrmUpgradeTerminal = class(TfrmBase)
    RzGroupBox1: TRzGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cbxUpgradeType: TRzComboBox;
    cbxMID: TRzComboBox;
    cbxUpgradeVer: TRzComboBox;
    Label1: TLabel;
    ProgressBar1: TProgressBar;
    procedure RzBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  protected
    function IsConditionValid: Boolean; override;
  public
    { Public declarations }
  end;

implementation
uses
  uGloabVar;
  
{$R *.dfm}

function TfrmUpgradeTerminal.IsConditionValid: Boolean;
begin
  Result := inherited IsConditionValid;
  if Result then
  begin
    if cbxUpgradeType.Text = '' then
    begin
      Result := False
      FGlobalTip.ShowHint('请选择升级类型', cbxUpgradeType);
      Exit;
    end;

    if cbxMID.Text = '' then
    begin
      Result := False;
      FGlobalTip.ShowHint('请选择制造商ID', cbxMID);
      Exit;
    end;

    if cbxUpgradeVer.Text = '' then
    begin
      Result := False;
      FGlobalTip.ShowHint('请选择升级版本', cbxUpgradeVer);
      Exit;
    end;
  end;  
end;

procedure TfrmUpgradeTerminal.RzBitBtn1Click(Sender: TObject);
var
  i: Integer;
begin
  if IsConditionValid then
  begin
    ProgressBar1.Max := ListView1.Items.Count;
    ProgressBar1.Step := 1;
    ProgressBar1.Visible := True;
  end;
end;

end.
