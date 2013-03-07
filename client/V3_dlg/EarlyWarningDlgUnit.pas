unit EarlyWarningDlgUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TEarlyWarningDlg = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Memo1: TMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    editCarNo: TEdit;
    Label3: TLabel;
    editDevID: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EarlyWarningDlg: TEarlyWarningDlg;

implementation

{$R *.dfm}

end.
