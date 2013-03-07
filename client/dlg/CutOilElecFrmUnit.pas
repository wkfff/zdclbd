unit CutOilElecFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls;

type
  TCutOilElecForm = class(TForm)
    Panel8: TPanel;
    Panel_Devs: TPanel;
    Panel1: TPanel;
    ListView1: TListView;
    ProgressBar1: TProgressBar;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel3: TPanel;
    RadioGroup1: TRadioGroup;
    Panel4: TPanel;
    Panel5: TPanel;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CutOilElecForm: TCutOilElecForm;

implementation
  uses uGloabVar,CarUnit;
{$R *.dfm}

procedure TCutOilElecForm.BitBtn1Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex <0 then
  begin
    Messagebox(0,'请选择设置类型!','提示',mb_ok + mb_iconinformation);
    exit;
  end;    
  if messagebox(handle,PChar('您确定要对'+Listview1.Items.Item[0].Caption+RadioGroup1.Items.Strings[RadioGroup1.ItemIndex]+'设置吗?'),'提示',MB_OKCANCEL + MB_ICONQUESTION)= ID_CANCEL then
    exit;
  ModalResult := mrOk;
end;

end.
