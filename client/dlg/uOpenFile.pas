unit uOpenFile;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ShellCtrls, ExtCtrls,MemMapping,
  FileCtrl,DateUtils;

type
  Topenfile = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ShellTreeView1: TShellTreeView;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Panel1: TPanel;
    Memo1: TMemo;
    Panel5: TPanel;
    Panel4: TPanel;
    FileListBox1: TFileListBox;
    Panel6: TPanel;
    StatusBar1: TStatusBar;
    Panel7: TPanel;
    start_date: TDateTimePicker;
    start_time: TDateTimePicker;
    Label1: TLabel;
    end_time: TDateTimePicker;
    end_date: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ShellTreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure FileListBox1Click(Sender: TObject);
    procedure start_dateChange(Sender: TObject);
    procedure end_dateChange(Sender: TObject);
    procedure start_timeChange(Sender: TObject);
    procedure end_timeChange(Sender: TObject);
  private
    { Private declarations }
    Fmin_Date,Fmin_time:Tdatetime;
    Fmax_Date,Fmax_Time:Tdatetime;
  public
    { Public declarations }
  end;

var
  openfile: Topenfile;

implementation
    uses FileTrackPlayUnit ,PlayGlobalUnit, uGloabVar,carunit;
{$R *.dfm}

procedure Topenfile.BitBtn1Click(Sender: TObject);
var
  tt1:TDateTime;
begin
  if StatusBar1.Panels.Items[0].Text='' then
  begin
    messagebox(handle,'请先选择文件！','提示',mb_ok + mb_iconinformation);
    exit;
  end;
  if not FileExists(trim(StatusBar1.Panels.Items[0].Text)) then
  begin
    messagebox(handle,'对不起，您选择的文件不存在!','提示',mb_ok + mb_iconinformation);
    exit;
  end;

  try
    tt1:= DateOf(start_date.Date);
    if (tt1< Fmin_Date) or (tt1 > Fmax_Date) then
    begin
      messagebox(handle,pchar('对不起，开始日期应在'+FormatDateTime('yyyy-mm-dd',Fmin_Date)+'与'+FormatDateTime('yyyy-mm-dd',Fmax_Date)+'之间!'),'提示',mb_ok + mb_iconinformation);
      start_date.Date := Fmin_Date;
      exit;
    end;
  except
  end;
  
  try
    tt1:= DateOf(end_date.Date);
    if (tt1 < Fmin_Date) or (tt1> Fmax_Date) then
    begin
      messagebox(handle,pchar('对不起，结束日期应在'+FormatDateTime('yyyy-mm-dd',Fmin_Date)+'与'+FormatDateTime('yyyy-mm-dd',Fmax_Date)+'之间!'),'提示',mb_ok + mb_iconinformation);
      end_date.Date :=Fmax_Date;
      exit;
    end;
  except
  end;

  if end_date.Date < start_date.Date then
  begin
    messagebox(handle,'结束日期比开始日期小，请您重新输入日期！','提示',mb_ok + mb_iconinformation);
    end_date.SetFocus;
    exit;
  end;
  if (end_date.Date=start_date.Date) and (end_time.Time < start_time.Time) then
  begin
    messagebox(handle,'结束时间比开始时间小，请您重新输入时间！','提示',mb_ok + mb_iconinformation);
    end_time.SetFocus;
    exit;
  end;   

  ModalResult :=mrOk;
end;

procedure Topenfile.FormCreate(Sender: TObject);
begin
  memo1.lines.clear;
  ShellTreeView1.Path:= ExtractFilePath(application.ExeName);
end;

procedure Topenfile.ShellTreeView1Change(Sender: TObject; Node: TTreeNode);
begin
  try
    if DirectoryExists(ShellTreeView1.Path) then
       FileListBox1.Directory := ShellTreeView1.Path;
  except
  end;
end;

procedure Topenfile.FileListBox1Click(Sender: TObject);
var
  ph: PGpsFileHeader;
  ffile : TmemMapFile;
  s:string;
  len:integer;
  car:TCar;
begin
  StatusBar1.Panels.Items[0].Text := FileListBox1.FileName;

  //-------打开文件头
  try
    try
      ffile := TMemMapFile.Create(StatusBar1.Panels.Items[0].Text,fmOpenRead,0,True);
      ph := PGpsFileHeader(ffile.Data);
      PlayDev.id:=ph^.DevID;
//      PlayDev.IdStr:='22'+FormatFloat('0000000000',LongWord(PlayDev.id));
      if ph^.Reserved[0]<>0 then
      begin
          len:=ph^.Reserved[0];
          if len>11 then len:=11;
          Setlength(s,len);
          CopyMemory(@s[1],@ph^.Reserved[1],len);
          car.No:=s;
          PlayDev.Car:=car;
      end
      else
      begin
          car.No:=PlayDev.IdStr;
          PlayDev.Car:=car;
      end;


      memo1.Lines.Clear;
      memo1.Lines.Add('文件版本:'+inttostr(ph^.FileVerMaj)+'.'+ inttostr(ph^.FileVerMin));
      memo1.Lines.Add('设备ID: '+PlayDev.Id);// V2.0
      memo1.Lines.Add('车牌号：'+PlayDev.Car.No);//+V2.0
      memo1.Lines.Add('记录点数:'+ inttostr(ph^.RecCount));
      memo1.Lines.Add('服务器开始时间:'+ FormatDateTime('yyyy-mm-dd hh:nn:ss',ph^.FirstDataSrvTime));
      memo1.Lines.Add('服务器结束时间:'+  FormatDateTime('yyyy-mm-dd hh:nn:ss',ph^.LastDataSrvTime));
      //memo1.Lines.Add('GPS设备开始时间:'+  FormatDateTime('yyyy-mm-dd hh:nn:ss',ph^.FirstDataGpsTime+1/3));
      //memo1.Lines.Add('GPS设备结束时间:'+  FormatDateTime('yyyy-mm-dd hh:nn:ss',ph^.LastDataGpsTime+1/3));

      Fmin_Date := dateof(Tdatetime(ph^.FirstDataSrvTime));
      Fmin_time := timeof(Tdatetime(ph^.FirstDataSrvTime));
      Fmax_Date := DateOf(Tdatetime(ph^.LastDataSrvTime));
      Fmax_Time := TimeOf(Tdatetime(ph^.LastDataSrvTime));

      start_date.Date := Fmin_Date;
      start_time.Time := Fmin_Time;
      end_date.Date := Fmax_Date;
      end_time.Time := Fmax_Time;
    finally
      ffile.Free;
    end;
  Except on E:Exception do
    begin
      if e.Message ='Failed to open or create file' then ShowMessage('文件已打开！');
    end;
  end;
end;

procedure Topenfile.start_dateChange(Sender: TObject);
begin
  if StatusBar1.Panels.Items[0].Text='' then
  begin
    messagebox(handle,'请先选择文件！','提示',mb_ok + mb_iconinformation);
    exit;
  end;    
end;

procedure Topenfile.end_dateChange(Sender: TObject);
begin
  if StatusBar1.Panels.Items[0].Text='' then
  begin
    messagebox(handle,'请先选择文件！','提示',mb_ok + mb_iconinformation);
    exit;
  end;
end;

procedure Topenfile.start_timeChange(Sender: TObject);
var tt1,ttime:TDatetime;
begin
  if StatusBar1.Panels.Items[0].Text='' then
  begin
    messagebox(handle,'请先选择文件！','提示',mb_ok + mb_iconinformation);
    exit;
  end;
  tt1:= dateof(start_date.Date);
  ttime:= TimeOf(start_time.Time);
  if (tt1= Fmin_Date) and (ttime < Fmin_time) then
  begin
    messagebox(handle,'开始时间太小，请您重新输入!','提示',mb_ok + mb_iconinformation);
    start_time.SetFocus;
  end;
end;

procedure Topenfile.end_timeChange(Sender: TObject);
var tt1,ttime:TDatetime;
begin
  if StatusBar1.Panels.Items[0].Text='' then
  begin
    messagebox(handle,'请先选择文件！','提示',mb_ok + mb_iconinformation);
    exit;
  end;
  tt1:= dateof(end_date.Date);
  ttime:= TimeOf(end_time.Time);
  if (tt1= Fmax_Date) and (ttime > Fmax_time) then
  begin
    messagebox(handle,'结束时间太大，请您重新输入!','提示',mb_ok + mb_iconinformation);
    end_time.SetFocus;
  end;
end;

end.
