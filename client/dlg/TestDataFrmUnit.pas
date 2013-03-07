unit TestDataFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ucall_dev, ComCtrls, StdCtrls, Buttons, ExtCtrls;

type
  TReadTestDataFrm = class(Tcall_dev)
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ReadTestDataFrm: TReadTestDataFrm;

implementation

{$R *.dfm}

procedure TReadTestDataFrm.BitBtn1Click(Sender: TObject);
begin
  //inherited;

end;

end.
