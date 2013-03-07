unit RcvDevUploadPicTimesInfoFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit,
  cxInplaceContainer, cxControls, StdCtrls, Buttons, ComCtrls,
  CarUnit, cxSplitter;

type
  TRcvDevUploadPicTimesInfoFrm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxTreeListRcvDevUploadPicTimesInfo: TcxTreeList;
    cxTreeList1cxTreeListColumn1: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn2: TcxTreeListColumn;
    GroupBox1: TGroupBox;
    DateTimePickerToDate: TDateTimePicker;
    DateTimePickerToTime: TDateTimePicker;
    Label2: TLabel;
    ComboBoxReadType: TComboBox;
    BitBtnReadThePic: TBitBtn;
    BitBtn2: TBitBtn;
    Label4: TLabel;
    Panel3: TPanel;
    Label1: TLabel;
    RadioButtonAllPic: TRadioButton;
    RadioButtonOnePic: TRadioButton;
    Panel4: TPanel;
    Label3: TLabel;
    EditCarNo: TEdit;
    LabelNoPic: TLabel;
    cxSplitter1: TcxSplitter;
    procedure FormCreate(Sender: TObject);
    procedure BitBtnReadThePicClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    procedure AddALineToCxTreeList(Value0, Value1: String);
    { Private declarations }
  private
    FReadDev:TDevice;
    FNoPicBj:Boolean;                  //无照片 =True
    FFirstDateTime:String;
    FLastDateTime:String;
    FPicCount_UnKnowType:Byte;         //属性不明的照片张数
    FPicCount_OpenFrontDoor:Byte;      //开前门
    FPicCount_CloseFrontDoor:Byte;     //关前门
    FPicCount_OpenBackDoor:Byte;       //开后门
    FPicCount_CloseBackDoor:Byte;      //关后门
    FPicCount_SrvAsk:Byte;             //中心主动要求
    FPicCount_ChangeToEmpty:Byte;      // 变空车
    FPicCount_ChangeToFull:Byte;       //变重车
    FPicCount_EmergentAlarm:Byte;     //紧急报警照片张数
    FPicCount_CutAntennaAlarm:Byte;   // 天线切断报警
    FPicCount_OverSpeed:Byte; //超速照片张数
    FPicCount_Fatigue:Byte;   //疲劳照片张数

    procedure ShowPicInfo;
  public
    procedure SetReadInfo(ADev: TDevice; ANoPicBj: Boolean;
      AFirstDateTime, ALastDateTime: String; ABuf: PByte;ABufCount: Integer);
  end;

var
  RcvDevUploadPicTimesInfoFrm: TRcvDevUploadPicTimesInfoFrm;

implementation
uses uGloabVar;
{$R *.dfm}

{ TRcvDevUploadPicTimesInfoFrm }

procedure TRcvDevUploadPicTimesInfoFrm.ShowPicInfo;
begin
  cxTreeListRcvDevUploadPicTimesInfo.BeginUpdate;
  try
    cxTreeListRcvDevUploadPicTimesInfo.Clear;
    if FNoPicBj then       //无照片
    begin
      LabelNoPic.Visible := True;
      BitBtnReadThePic.Enabled := False;
      exit;
    end;
    try
      DateTimePickerToDate.Date := StrToDateTime(FLastDateTime);
    except
      DateTimePickerToDate.Date := Date;
    end;
    try
      DateTimePickerToTime.Time := StrToDateTime(FLastDateTime);
    except
      DateTimePickerToTime.Time := Time;
    end;

    cxTreeListRcvDevUploadPicTimesInfo.Clear;
    AddALineToCxTreeList('照片开始时间：',FFirstDateTime);
    AddALineToCxTreeList('照片结束时间：',FLastDateTime);
    AddALineToCxTreeList('属性不明的照片：',IntToStr(FPicCount_UnKnowType)+'张');
    AddALineToCxTreeList('开前门：',IntToStr(FPicCount_OpenFrontDoor)+'张');
    AddALineToCxTreeList('关前门：',IntToStr(FPicCount_CloseFrontDoor)+'张');
    AddALineToCxTreeList('开后门：',IntToStr(FPicCount_OpenBackDoor)+'张');
    AddALineToCxTreeList('关后门：',IntToStr(FPicCount_CloseBackDoor)+'张');
    AddALineToCxTreeList('中心主动要求：',IntToStr(FPicCount_SrvAsk)+'张');
    AddALineToCxTreeList('变空车：',IntToStr(FPicCount_ChangeToEmpty)+'张');
    AddALineToCxTreeList('变重车：',IntToStr(FPicCount_ChangeToFull)+'张');
    AddALineToCxTreeList('紧急报警：',IntToStr(FPicCount_EmergentAlarm)+'张');
    AddALineToCxTreeList('天线切断报警：',IntToStr(FPicCount_CutAntennaAlarm)+'张');
    AddALineToCxTreeList('超速：',IntToStr(FPicCount_OverSpeed)+'张');
    AddALineToCxTreeList('疲劳：',IntToStr(FPicCount_Fatigue)+'张');
  finally
    cxTreeListRcvDevUploadPicTimesInfo.EndUpdate;
  end;
end;


procedure TRcvDevUploadPicTimesInfoFrm.AddALineToCxTreeList(Value0,Value1:String);
begin
  with cxTreeListRcvDevUploadPicTimesInfo.Add do
    begin
      Values[0] := Value0;
      Values[1] := Value1;
    end;
end;

procedure TRcvDevUploadPicTimesInfoFrm.FormCreate(Sender: TObject);
begin
  LabelNoPic.Visible :=False;
  DateTimePickerToDate.Date := Date;
  DateTimePickerToTime.Time := Time;
  ComboBoxReadType.ItemIndex := -1;
  ComboBoxReadType.Text := '';
end;

procedure TRcvDevUploadPicTimesInfoFrm.SetReadInfo(ADev: TDevice;
  ANoPicBj: Boolean; AFirstDateTime, ALastDateTime: String; ABuf: PByte;
  ABufCount: Integer);
var
  buf:array of byte;
begin
  FReadDev:= ADev;
  EditCarNo.Text := ADev.Car.No;
  FNoPicBj := ANoPicBj;
  try
    FFirstDateTime := AFirstDateTime;
  except
  end;
  try
    FLastDateTime := ALastDateTime;
  except
  end;
  SetLength(buf,ABufCount);
  CopyMemory(@buf[0],Abuf,ABufCount);
  if ABufCount>=12 then
  begin
    FPicCount_UnKnowType:= buf[0];         //属性不明的照片张数
    FPicCount_OpenFrontDoor:= buf[1];      //开前门
    FPicCount_CloseFrontDoor:= buf[2];     //关前门
    FPicCount_OpenBackDoor:= buf[3];       //开后门
    FPicCount_CloseBackDoor:= buf[4];      //关后门
    FPicCount_SrvAsk:= buf[5];             //中心主动要求
    FPicCount_ChangeToEmpty:= buf[6];      // 变空车
    FPicCount_ChangeToFull:= buf[7];       //变重车
    FPicCount_EmergentAlarm:= buf[8];     //紧急报警照片张数
    FPicCount_CutAntennaAlarm:= buf[9];   // 天线切断报警
    FPicCount_OverSpeed:= buf[10];        //超速照片张数
    FPicCount_Fatigue:= buf[11];         //疲劳照片张数
  end;

  ShowPicInfo;
end;

procedure TRcvDevUploadPicTimesInfoFrm.BitBtnReadThePicClick(
  Sender: TObject);
begin
  if ComboBoxReadType.Text ='' then
  begin
    MessageBox(Handle,'请您选择要读取的照片类型！','提示',MB_OK + MB_ICONINFORMATION);
    Exit;
  end;
  ModalResult := mrok;
end;

procedure TRcvDevUploadPicTimesInfoFrm.BitBtn2Click(Sender: TObject);
begin
  close;
end;

end.
