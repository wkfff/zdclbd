unit sendTaxiBussUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons;

type
  TsendTaxiBuss = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtnOk: TBitBtn;
    BitBtnCancel: TBitBtn;
    Panel4: TPanel;
    Panel8: TPanel;
    BitBtn5: TBitBtn;
    BitBtnSel: TBitBtn;
    ListView1: TListView;
    Panel7: TPanel;
    Panel3: TPanel;
    Panel5: TPanel;
    Label1: TLabel;
    EditCarNO: TEdit;
    Panel6: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Memo1: TMemo;
    Label7: TLabel;
    Memo2: TMemo;
    data: TDateTimePicker;
    time: TDateTimePicker;
    procedure BitBtnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  sendTaxiBuss: TsendTaxiBuss;

implementation
uses Carunit, ConstDefineUnit, CmdStructUnit, uGloabvar;
{$R *.dfm}

procedure TsendTaxiBuss.BitBtnOkClick(Sender: TObject);
var
  i,j:integer;
  D:TDevice;
  devIDBuf: array of Byte;
  count: Integer;
  id: Integer;  // 业务类型
  buf: array of Byte;
begin
  //id := // 将数据保存到web服务中时会返回一个id值
  Setlength(buf, 4);
  count := ListView1.Items.Count;
  SetLength(devIDBuf, count * 5);
  TbitBtn(Sender).Enabled:=false;
  j := 0;
  try
    for i:=0 to ListView1.Items.Count -1 do
    begin
      D:=TDevice(ListView1.Items.Item[i].Data);
      devIDBuf[j] := FACT_ID;
      buf := LongToBcd(D.id);
      CopyMemory(@devIDBuf[j+1], @buf[0], 4);
      j := i+5;
    end;



    DataServer.SendTaxiBuss(id, FormatDateTime('yymmdd',data.Date) + FormatDateTime('hhnnss',time.Time), count, @devIDBuf[0],
                            Trim(Memo1.Text), Trim(Memo2.Text), Trim(Edit3.Text)); // 发送数据
    //TelNumSaveToDB(D);

  finally
    Panel4.Enabled:=true;
    TbitBtn(Sender).Enabled:=true;
  end;
end;

end.
