{*******************************************************}
{                                                       }
{                       EhLib v3.5                      }
{                  TPreviewFormEh form                  }
{                                                       }
{   Copyright (c) 1998-2004 by Dmitry V. Bolshakov      }
{                                                       }
{*******************************************************}

unit PrvFrmEh;

{$I EhLib.Inc}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, ValEdit, StdCtrls, Buttons, ExtCtrls, Menus, ImgList, ComCtrls,
  ToolWin, PrViewEh,
{$IFDEF EH_LIB_6} Variants, {$ENDIF}
{$IFDEF CIL}
{$ELSE}
{$ENDIF}
    PrnDbgeh, DBGridEh;

type
  PTDBGridEh = ^TDBGridEh;

  TPreviewFormEh = class(TForm)
    PreviewEh1: TPreviewBox;
    tbrMain: TToolBar;
    tbtPrint: TToolButton;
    tbtPrinterSetupDialog: TToolButton;
    tbtScale: TToolButton;
    tbtPrevPage: TToolButton;
    tbtNextPage: TToolButton;
    tbStop: TToolButton;
    tbClose: TToolButton;
    Splitter: TSplitter;
    pmnScale: TPopupMenu;
    mni500: TMenuItem;
    mni200: TMenuItem;
    mni150: TMenuItem;
    mni100: TMenuItem;
    mni75: TMenuItem;
    mni50: TMenuItem;
    mni25: TMenuItem;
    mni10: TMenuItem;
    mniWidth: TMenuItem;
    mniFull: TMenuItem;
    imlMain: TImageList;
    stbMain: TStatusBar;
    Timer1: TTimer;
    ToolButton1: TToolButton;
    FontDialog1: TFontDialog;
    Panel2: TPanel;
    Panel1: TPanel;
    Panel3: TPanel;
    DeviceStateList: TValueListEditor;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Panel4: TPanel;
    SpeedButton4: TSpeedButton;
    Panel5: TPanel;
    SpeedButton1: TSpeedButton;
    Label5: TLabel;
    SpeedButton3: TSpeedButton;
    EditTitle: TMemo;
    Panel6: TPanel;
    SpeedButton2: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EditLeft: TEdit;
    EditRight: TEdit;
    EditTop: TEdit;
    EditBottom: TEdit;
    procedure tbtPrintClick(Sender: TObject);
    procedure tbtPrintDialogClick(Sender: TObject);
    procedure tbtPrinterSetupDialogClick(Sender: TObject);
    procedure tbtPrevPageClick(Sender: TObject);
    procedure tbtNextPageClick(Sender: TObject);
    procedure tbStopClick(Sender: TObject);
    procedure tbCloseClick(Sender: TObject);
    procedure mniScaleClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SplitterCanResize(Sender: TObject; var NewSize: Integer; var Accept: Boolean);
    procedure tbtScaleClick(Sender: TObject);
    procedure PreviewEh1PrinterPreviewChanged(Sender: TObject);
    procedure PreviewEh1OpenPreviewer(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure tbtNextPageMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tbtNextPageMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tbtPrevPageMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tbtPrevPageMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure DeviceStateListSetEditText(Sender: TObject; ACol,
      ARow: Integer; const Value: String);
  private
    { Private declarations }
    FPressedButton: TToolButton;
    FNeedClose: Boolean;
  public
    { Public declarations }
    PrintDBGridEh1: TPrintDBGridEh;
    DBGridEh: TDBGridEh;
  end;

var
  PreviewFormEh: TPreviewFormEh;
  colList: TStrings;      // 对应TDBGridEh中那些列是可见的
  colNameList: TStrings;  // 对应可见列的标题
implementation

uses EhLibConsts {$IFDEF EH_LIB_6} ,Types {$ENDIF};

{$R *.DFM}

const
  InitRepeatPause = 400; { pause before repeat timer (ms) }
  RepeatPause = 100; { pause before hint window displays (ms)}

procedure TPreviewFormEh.tbtPrintClick(Sender: TObject);
begin
//  if Assigned(PreviewEh1.Printer) then PreviewEh1.Printer.Print;
  //PreviewEh1.PrintDialog;
  PreviewEh1.Printer.Print;//sha 直接打印
end;

procedure TPreviewFormEh.tbtPrintDialogClick(Sender: TObject);
begin
  PreviewEh1.PrintDialog;
end;

procedure TPreviewFormEh.tbtPrinterSetupDialogClick(Sender: TObject);
begin
  PreviewEh1.PrinterSetupDialog;
end;

procedure TPreviewFormEh.tbtPrevPageClick(Sender: TObject);
begin
  if {(FPressedButton <> nil) and }((Timer1.Interval <> RepeatPause) or (Sender = nil)) then
    PreviewEh1.PageIndex := Pred(PreviewEh1.PageIndex);
end;

procedure TPreviewFormEh.tbtNextPageClick(Sender: TObject);
begin
  if {(FPressedButton <> nil) and}((Timer1.Interval <> RepeatPause) or (Sender = nil)) then
    PreviewEh1.PageIndex := Succ(PreviewEh1.PageIndex);
end;

procedure TPreviewFormEh.tbStopClick(Sender: TObject);
begin
  PreviewEh1.Printer.Abort;
end;

procedure TPreviewFormEh.tbCloseClick(Sender: TObject);
begin
  DeviceStateList.Strings.Clear;
  Close;
end;

procedure TPreviewFormEh.mniScaleClick(Sender: TObject);
const ViewModeArr: array [0..9] of TViewMode  =
  (vm500, vm200, vm150, vm100, vm75, vm50, vm25, vm10, vmPageWidth, vmFullPage);
begin
  with Sender as TMenuItem do
  begin
    Checked := True;
    PreviewEh1.ViewMode := ViewModeArr[Integer(Tag)];

    PreviewEh1.UpdatePageSetup;
  end;
end;

procedure TPreviewFormEh.FormCreate(Sender: TObject);
begin
  Splitter.OnCanResize := SplitterCanResize;
  Splitter.ResizeStyle := rsUpdate;
  mni500.Tag := 0;
  mni200.Tag := 1;
  mni150.Tag := 2;
  mni100.Tag := 3;
  mni75.Tag := 4;
  mni50.Tag := 5;
  mni25.Tag := 6;
  mni10.Tag := 7;
  mniWidth.Tag := 8;
  mniFull.Tag := 9;

  
  EditLeft.Text := '0';
  EditRight.Text := '0';
  EditTop.Text := '0';
  EditBottom.Text := '0';
end;

procedure TPreviewFormEh.SplitterCanResize(Sender: TObject; var NewSize: Integer; var Accept: Boolean);
begin
  if (NewSize >= 38 + 3) and (tbrMain.Images = nil) and tbrMain.ShowCaptions then
  begin
    tbrMain.ShowCaptions := False;
    tbrMain.Images := imlMain;
    tbrMain.ButtonHeight := 38;
    tbrMain.ButtonWidth := 39;
  end else
    if (NewSize >= 52 + 3) and not tbrMain.ShowCaptions and (tbrMain.Images <> nil)
      then tbrMain.ShowCaptions := True
    else if (NewSize <= 21 + 3) and not tbrMain.ShowCaptions and (tbrMain.Images <> nil) then
    begin
      tbrMain.Images := nil;
      tbrMain.ShowCaptions := True;
    end
    else if (NewSize <= 38 + 3) and tbrMain.ShowCaptions and (tbrMain.Images <> nil) then
    begin
      tbrMain.ShowCaptions := False;
      tbrMain.ButtonHeight := 38;
      tbrMain.ButtonWidth := 39;
    end
end;

procedure TPreviewFormEh.tbtScaleClick(Sender: TObject);
var p: TPoint;
begin
  p := tbtScale.ClientToScreen(Point(0, tbtScale.Height));
  tbtScale.DropdownMenu.Popup(p.x, p.y);
end;

procedure TPreviewFormEh.PreviewEh1PrinterPreviewChanged(Sender: TObject);
begin
  if not PreviewEh1.Printer.Printing and FNeedClose then
  begin
    FNeedClose := False;
    Close;
  end;
  tbStop.Enabled := PreviewEh1.Printer.Printing;
  tbClose.Enabled := not PreviewEh1.Printer.Printing;
  tbtPrint.Enabled := not PreviewEh1.Printer.Printing and
    (PreviewEh1.Printer.Printer.Printers.Count > 0);
  tbtPrinterSetupDialog.Enabled := not PreviewEh1.Printer.Printing and
    (Assigned(PreviewEh1.OnPrinterSetupDialog) or Assigned(PreviewEh1.OnPrinterSetupChanged)) and
    Assigned(PreviewEh1.PrinterSetupOwner);
  tbtPrevPage.Enabled := PreviewEh1.PageIndex > 1;
  tbtNextPage.Enabled := PreviewEh1.PageIndex < PreviewEh1.PageCount;
  //stbMain.SimpleText:='Page '+IntToStr(PreviewEh1.PageIndex)+' of '+IntToStr(PreviewEh1.PageCount);
  stbMain.SimpleText := Format(SPageOfPagesEh, [PreviewEh1.PageIndex, PreviewEh1.PageCount]);
  case PreviewEh1.ViewMode of
    vm500: mni500.Checked := True;
    vm200: mni200.Checked := True;
    vm150: mni150.Checked := True;
    vm100: mni100.Checked := True;
    vm75: mni75.Checked := True;
    vm50: mni50.Checked := True;
    vm25: mni25.Checked := True;
    vm10: mni10.Checked := True;
    vmPageWidth: mniWidth.Checked := True;
    vmFullPage: mniFull.Checked := True;
  end;
  //Caption := SPreviewEh + ' - ' + PreviewEh1.Printer.Title;
  //modify by sha 标题可由程序设置
  if Caption='' then Caption :='打印预览';
end;

procedure TPreviewFormEh.PreviewEh1OpenPreviewer(Sender: TObject);
begin
  if IsIconic(Handle) then ShowWindow(Handle, sw_Restore);
  BringWindowToTop(Handle);
  if not Visible then Show;
end;

type
  TToolButtonCracker = class(TToolButton)
    property MouseCapture;
  end;

procedure TPreviewFormEh.Timer1Timer(Sender: TObject);
begin
  Timer1.Interval := RepeatPause;
  if FPressedButton <> nil then
{$IFDEF CIL}
    if {FPressedButton.Down and}  IControl(FPressedButton).GetMouseCapture then
{$ELSE}
    if {FPressedButton.Down and}  TToolButtonCracker(FPressedButton).MouseCapture then
{$ENDIF}
    begin
      try
        FPressedButton.OnClick(nil);
      except
        Timer1.Enabled := False;
        raise;
      end;
    end;
end;

procedure TPreviewFormEh.tbtNextPageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Timer1.Interval := InitRepeatPause;
  Timer1.Enabled := True;
  FPressedButton := tbtNextPage;
end;

procedure TPreviewFormEh.tbtNextPageMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   //if Timer1.Enabled and (Timer1.Interval = InitRepeatPause) and (FPressedButton <> nil) then
   //  FPressedButton.Click;
  Timer1.Enabled := False;
  FPressedButton := nil;
end;

procedure TPreviewFormEh.tbtPrevPageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Timer1.Interval := InitRepeatPause;
  Timer1.Enabled := True;
  FPressedButton := tbtPrevPage;
end;

procedure TPreviewFormEh.tbtPrevPageMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
//   if Timer1.Enabled and (Timer1.Interval = InitRepeatPause) and (FPressedButton <> nil) then
//     FPressedButton.Click;
  Timer1.Enabled := False;
  FPressedButton := nil;
end;

procedure TPreviewFormEh.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    if PreviewEh1.Printer.Printing
      then PreviewEh1.Printer.Abort
      else Close;
end;

procedure TPreviewFormEh.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if PreviewEh1.Printer.Printing then
  begin
    PreviewEh1.Printer.Abort;
    FNeedClose := True;
    Action := caNone;
  end;
  //Dispose(PreviewFormEh.DBGridEh);
end;

procedure TPreviewFormEh.SpeedButton1Click(Sender: TObject);
begin
  PreviewEh1.Printer.OnPrinterChangePageHeader(EditTitle.Text);
  //TPrintDBGridEh(PreviewEh1.Printer.PrinterSetupOwner).PageHeader.CenterText.Clear;
  //TPrintDBGridEh(PreviewEh1.Printer.PrinterSetupOwner).PageHeader.CenterText.Add(Trim(Edit1.Text));
  //PreviewEh1.UpdatePageSetup;
end;

procedure TPreviewFormEh.SpeedButton2Click(Sender: TObject);
begin
  PreviewEh1.Printer.OnPrinterChangePostion(StrToInt(Trim(EditLeft.Text)),
                                            StrToInt(Trim(EditRight.Text)),
                                            StrToInt(Trim(EditTop.Text)),
                                            StrToInt(Trim(EditBottom.Text)));
end;

procedure TPreviewFormEh.SpeedButton3Click(Sender: TObject);
begin
  if FontDialog1.Execute then
  begin
    //EditTitle.Font := FontDialog1.Font;
    PreviewEh1.Printer.OnPrinterChangeHeadFont(FontDialog1.Font);
  end;
end;

procedure TPreviewFormEh.FormShow(Sender: TObject);
var
  i: Integer;
  ValueList: TStringList;
begin

  colList := TStringList.Create;
  colNameList := TStringList.Create;
  ValueList := TStringList.Create;
  //DeviceStateList := TValueListEditor.Create(Owner);

  colList.Clear;
  colNameList.Clear;
  DeviceStateList.Strings.Clear;
  ValueList.Clear;

  ValueList.Append('是');
  ValueList.Append('否');

  for i:=0 to DBGridEh.Columns.Count-1 do
  begin
    if DBGridEh.Columns[i].Visible then
    begin
      DeviceStateList.Strings.Add(DBGridEh.Columns[i].Title.Caption+'=');
      DeviceStateList.ItemProps[DBGridEh.Columns[i].Title.Caption].EditStyle := esPickList;
      DeviceStateList.ItemProps[DBGridEh.Columns[i].Title.Caption].PickList := ValueList;
      DeviceStateList.Values[DBGridEh.Columns[i].Title.Caption] := '是';
      colList.Append(IntToStr(i));
      colNameList.Append(DBGridEh.Columns[i].Title.Caption);
    end;
    //else
    //begin
    //  DeviceStateList.Strings.Add(DBGridEh.Columns[i].Title.Caption+'=');
    //  DeviceStateList.Values[DBGridEh.Columns[i].Title.Caption] := '否';
    //end;
  end; 

end;

procedure TPreviewFormEh.SpeedButton4Click(Sender: TObject);
var
  i, j: Integer;

begin

  for i:=1 to DeviceStateList.Strings.Count do
  begin
    for j:=0 to DBGridEh.Columns.Count-1 do
    begin
      if {DeviceStateList.Keys[i]} colNameList.Strings[i-1] = DBGridEh.Columns[j].Title.Caption then
      begin
        DBGridEh.Columns[j].Title.Caption := DeviceStateList.Keys[i];
        if DeviceStateList.Values[DeviceStateList.Keys[i]] = '是' then
        begin
          DBGridEh.Columns[j].Visible := True;
        end
        else
        begin
          DBGridEh.Columns[j].Visible := False;
        end;

      end;
    end;
  end;
  PreviewEh1.Printer.OnPrinterChangePageHeader(EditTitle.Text);

  for i:=0 to colList.Count - 1 do
  begin
    DBGridEh.Columns[StrToInt(colList.Strings[i])].Title.Caption := colNameList.Strings[i];
    DBGridEh.Columns[StrToInt(colList.Strings[i])].Visible := True;
  end;
end;

procedure TPreviewFormEh.DeviceStateListSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
begin
  {if DeviceStateList.Values[DeviceStateList.Cells[0, ARow]] = '是' then
  begin
    DeviceStateList.Values[DeviceStateList.Cells[0, ARow]] := '否';
    Exit;
  end
  else
  begin
    DeviceStateList.Values[DeviceStateList.Cells[0, ARow]] := '是';
    Exit;
  end;  }
end;

end.
