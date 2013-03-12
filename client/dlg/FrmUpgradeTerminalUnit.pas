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
    procedure cbxUpgradeTypeChange(Sender: TObject);
    procedure cbxMIDChange(Sender: TObject);
  private
    { Private declarations }
  protected
    function IsConditionValid: Boolean; override;
  public
    { Public declarations }
  end;

implementation
uses
  uGloabVar, CarUnit;

{$R *.dfm}

function TfrmUpgradeTerminal.IsConditionValid: Boolean;
begin
  Result := inherited IsConditionValid;
  if Result then
  begin
    if cbxUpgradeType.Text = '' then
    begin
      Result := False;
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
  dev: TDevice;
  tuv: TTerminalUpgradeVer;
  upgradeType: Integer;
begin
  if IsConditionValid then
  begin
    case cbxUpgradeType.ItemIndex of
      0: upgradeType := 0;
      1: upgradeType := 12;
      2: upgradeType := 52;
    else
      upgradeType := -1;
    end;
    tuv := FTerminalUgpradeVerManage.Find(upgradeType, cbxMID.Text, cbxUpgradeVer.Text);
    if tuv = nil then
    begin
      MessageBox(Handle, '根据条件未找到升级信息', '提示', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;  
    ProgressBar1.Max := ListView1.Items.Count;
    ProgressBar1.Step := 1;
    ProgressBar1.StepBy(0);
    ProgressBar1.Visible := True;
    for i := 0 to ListView1.Items.Count - 1 do
    begin
      dev := TDevice(ListView1.Items[i].Data);
      if IsBeiDouDev(dev) then
      begin//该命令只发送给北斗终端
        DataServer.UpgradeTerminal(dev, tuv);
      end;
      ProgressBar1.StepIt;
    end;  
  end;
end;

procedure TfrmUpgradeTerminal.cbxUpgradeTypeChange(Sender: TObject);
var
  i: Integer;
  upgradeType: Integer;
  tuv: TTerminalUpgradeVer;
  terMName: string;
begin
  case cbxUpgradeType.ItemIndex of
    0: upgradeType := 0;
    1: upgradeType := 12;
    2: upgradeType := 52;
  else
    upgradeType := -1;
  end;

  cbxMID.Clear;
  cbxUpgradeVer.Clear;

  if upgradeType <> -1 then
  begin
    for i := 0 to FTerminalUgpradeVerManage.Count - 1 do
    begin
      tuv := FTerminalUgpradeVerManage.Items[i];
      terMName := tuv.TerFactName;
      if (tuv.UpgradeTypeId = upgradeType) and (cbxMID.IndexOf(terMName) < 0) then
      begin
        cbxMID.Add(terMName);
      end;  
    end;

    if cbxMID.Count > 0 then
    begin
      cbxMID.ItemIndex := 0;
    end;  
  end;
end;

procedure TfrmUpgradeTerminal.cbxMIDChange(Sender: TObject);
var
  i: Integer;
  upgradeType: Integer;
  tuv: TTerminalUpgradeVer;
  terMName: string;
begin
  cbxUpgradeVer.Clear;
  
  case cbxUpgradeType.ItemIndex of
    0: upgradeType := 0;
    1: upgradeType := 12;
    2: upgradeType := 52;
  else
    upgradeType := -1;
  end;

  if (cbxMID.Text <> '') and (upgradeType <> -1) then
  begin
    for i := 0 to FTerminalUgpradeVerManage.Count - 1 do
    begin
      tuv := FTerminalUgpradeVerManage.Items[i];
      terMName := tuv.TerFactName;
      if (tuv.UpgradeTypeId = upgradeType) and (cbxMID.Text = terMName) then
      begin
        cbxUpgradeVer.Add(tuv.Ver);
      end;
    end;

    if cbxUpgradeVer.Count > 0 then
    begin
      cbxUpgradeVer.ItemIndex := 0;
    end;  
  end;
end;

end.
