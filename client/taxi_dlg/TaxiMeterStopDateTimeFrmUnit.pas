unit TaxiMeterStopDateTimeFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ucall_dev, ComCtrls, StdCtrls, Buttons, ExtCtrls,CarUnit;

type
  TTaxiMeterStopDateTimeFrm = class(Tcall_dev)
    GroupBox1: TGroupBox;
    DateTimePicker1: TDateTimePicker;
    UpDown1: TUpDown;
    Edit1: TEdit;
    Label1: TLabel;
    ProgressBar1: TProgressBar;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  protected
    function SendStopTime(Dev:TDevice):boolean;

  public
    { Public declarations }
  end;

var
  TaxiMeterStopDateTimeFrm: TTaxiMeterStopDateTimeFrm;

implementation
      uses uGloabVar,GateWayServerUnit,DateUtils,CmdStructUnit;
{$R *.dfm}

function TTaxiMeterStopDateTimeFrm.SendStopTime(Dev:TDevice):boolean;
var
  tempWord: Word ;
  temp:array[0..4] of byte;
  S:String;
begin
  tempWord:=YearOf(DateTimePicker1.Date);
  S:=IntToStr(tempWord);
  temp[0]:=StrToInt('$'+copy(S,1,2));
  temp[1]:=StrToInt('$'+Copy(S,3,2));
  temp[2]:=StrToInt('$'+IntToStr(MonthOf(DateTimePicker1.Date)));
  temp[3]:=StrToInt('$'+IntToStr(DayOf(DateTimePicker1.Date)));
  temp[4]:=StrToInt('$'+Edit1.Text);//HourOf(DateTimePicker1.Date);
  S:=FormatDatetime('YYYY-MM-DD',DateTimePicker1.Date);
  S:=S+edit1.Text;
  Dev.Param.TaxiMetaStopDateTime:=s;
  //BS.SaveDevParam(Dev.IdStr,$0700,S);
  Result:= DataServer.SetDevParam_V2(Dev.ID,$0700,@temp[0],5)
end;


procedure TTaxiMeterStopDateTimeFrm.BitBtn1Click(Sender: TObject);
var
  i:integer;
  s1,s2:string;
begin
  TBitBtn(Sender).Enabled:=false;
  ProgressBar1.Visible:=true;
  try
    if ListView1.Items.Count= 0 then
    begin
      messagebox(handle,'请选择一辆车','提示',mb_ok + mb_iconinformation);
      Self.ModalResult:=mrNone;
      exit;
    end;
    s1:= formatDatetime('YY-MM-DD',DateTimePicker1.Date);
    s2:= FormatDatetime('YY-MM-DD',Now);

    if (s1<s2)or((S1=S2)and(StrToInt(Edit1.Text)<=StrToInt(formatdatetime('h',now)))) then
    begin
      messagebox(handle,'输入的时间必须大于现在时间!','提示',mb_ok + mb_iconinformation);
      Self.ModalResult:=mrNone;
      exit;
    end;
    ProgressBar1.Max:=ListView1.Items.Count*10*2;
    For i:=0 to ListView1.Items.Count -1 do
    begin
      ProgressBar1.StepIt;
      SendStoptime(TDevice(ListView1.Items.Item[i].Data));
      ProgressBar1.StepIt;
      sleep(50);
      Application.ProcessMessages;
    end;
  finally
   TBitBtn(Sender).Enabled:=true;
   ProgressBar1.Visible:=false;
  end;
  Close;
end;

procedure TTaxiMeterStopDateTimeFrm.FormShow(Sender: TObject);
var
  S:string;
begin
 if ListView1.Items.Count =0 then
 begin
   DateTimePicker1.Date:=StrToDate('2000-01-01');
   edit1.Text:='0';
   exit;
 end;
  s:=TDevice(ListView1.Items.Item[0].Data).Param.TaxiMetaStopDateTime;
 if Length(s)<10 then
 begin
   DateTimePicker1.Date:=StrToDate('2000-01-01');
   edit1.Text:='0';
   exit;
 end;
 try
   DateTimePicker1.Date:=StrToDate(Copy(s,1,10));
   Edit1.Text:=Copy(s,11,2);
 except
   DateTimePicker1.Date:=StrToDate('2000-01-01');
   edit1.Text:='0';
 end;

end;

procedure TTaxiMeterStopDateTimeFrm.ListView1Click(Sender: TObject);
var
  s:string;
begin
 if ListView1.Selected =nil then exit;
 s:=TDevice(ListView1.Selected.Data).Param.TaxiMetaStopDateTime;
 if Length(s)<10 then
 begin
   DateTimePicker1.Date:=StrToDate('2000-01-01');
   edit1.Text:='0';
   exit;
 end;
 try
   DateTimePicker1.Date:=StrToDate(Copy(s,1,10));
   Edit1.Text:=Copy(s,11,2);
 except
   DateTimePicker1.Date:=StrToDate('2000-01-01');
   edit1.Text:='0';
 end;

end;

procedure TTaxiMeterStopDateTimeFrm.Edit1KeyPress(Sender: TObject;
  var Key: Char);
begin
   if not (Key in [#8,'0'..'9']) then
    Key := #0
   else
   begin
     if Key =#8 then exit;
     if StrToInt(edit1.Text+Key)>23 then
     begin
        Key:=#0;
     end;
   end;
end;

end.
