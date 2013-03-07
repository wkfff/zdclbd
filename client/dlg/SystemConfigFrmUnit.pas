unit SystemConfigFrmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Tabs;

type
  TSystemConfigFrm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    GroupBox4: TGroupBox;
    CheckBoxConstMenu: TCheckBox;
    CheckBoxAttemperInfo: TCheckBox;
    BitBtnOK: TBitBtn;
    BitBtnClose: TBitBtn;
    CheckBoxShowMasureError: TCheckBox;
    CheckBoxUseMasure: TCheckBox;
    CheckBoxUseDriverCard: TCheckBox;
    CheckBoxLoadChinaRoad: TCheckBox;
    oilAlarmCheckbox: TCheckBox;
    Label16: TLabel;
    Label17: TLabel;
    Label14: TLabel;
    ComboBoxSelectOrderVer: TComboBox;
    CheckBoxIsNoticeZtUploadCarryOffXslc: TCheckBox;
    EditDevCallNumberForListenIn: TEdit;
    Label22: TLabel;
    Label25: TLabel;
    Label24: TLabel;
    ColorDialog1: TColorDialog;
    AlarmFortifyCheckBox: TCheckBox;
    AlarmOutLineCheckBox: TCheckBox;
    AlarmDevLowerPowerCheckBox: TCheckBox;
    Label31: TLabel;
    EditStopOverTimeAlarm: TEdit;
    Label26: TLabel;
    Label27: TLabel;
    Edit_timeSZ: TEdit;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    SpeedButton2: TSpeedButton;
    TabSet1: TTabSet;
    Image5: TImage;
    Notebook1: TNotebook;
    Label33: TLabel;
    Label34: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    EditMainGPort: TEdit;
    EditMainGIP: TEdit;
    GroupBox5: TGroupBox;
    Label7: TLabel;
    Label6: TLabel;
    EditBakGIP: TEdit;
    EditBakGPort: TEdit;
    CheckBoxGatewayBak: TCheckBox;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    EditMainBPort: TEdit;
    EditMainBIP: TEdit;
    GroupBox6: TGroupBox;
    Label11: TLabel;
    Label10: TLabel;
    EditBakBIP: TEdit;
    EditBakBPort: TEdit;
    CheckBoxBSBak: TCheckBox;
    Label15: TLabel;
    CheckBoxSendSuccess: TCheckBox;
    CheckBoxSendFail: TCheckBox;
    CheckBoxOnline: TCheckBox;
    CheckBoxUnOnline: TCheckBox;
    CheckBoxisAllCarUnOnlineAlarm: TCheckBox;
    AlarmCheckBox: TCheckBox;
    eletrAlarmCheckbox: TCheckBox;
    photoAlarmCheckbox: TCheckBox;
    alarmHurryCheckbox: TCheckBox;
    AlarmInDevAreaCheckBox: TCheckBox;
    AlarmDriverFatigueCheckBox: TCheckBox;
    AlarmOutDevAreaCheckBox: TCheckBox;
    CheckBoxEarlyWariningHurry: TCheckBox;
    Label20: TLabel;
    Label12: TLabel;
    Label21: TLabel;
    CheckBoxAutoChangeMap: TCheckBox;
    ComboBox2: TComboBox;
    ComboBox1: TComboBox;
    ComboBoxFontSize: TComboBox;
    GroupBox7: TGroupBox;
    SpeedButton1: TSpeedButton;
    Shape1: TShape;
    Shape2: TShape;
    SpeedButton3: TSpeedButton;
    Shape3: TShape;
    SpeedButton4: TSpeedButton;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label40: TLabel;
    CheckBoxIsUpdate: TCheckBox;
    Label18: TLabel;
    Label13: TLabel;
    CheckBoxAreaAlarm: TCheckBox;
    CheckBoxDriverSpeet: TCheckBox;
    EditOverSpeedHintStr: TEdit;
    Label19: TLabel;
    CheckBoxAlarmFollow: TCheckBox;
    CheckBoxEmergncyAlarmAutoFirstAlarm: TCheckBox;
    CheckBoxEarlyWariningAutoFirstAlarm: TCheckBox;
    Image6: TImage;
    Image7: TImage;
    SpeedButton5: TSpeedButton;
    Image8: TImage;
    SpeedButton6: TSpeedButton;
    Label41: TLabel;
    CheckBoxCarNOAndDevName: TCheckBox;
    CheckBoxIsShowEmptyFull: TCheckBox;
    Label42: TLabel;
    editUpdateURL: TEdit;
    chkDevOtherAlarm: TCheckBox;
    chkSendTextWhenAlarm: TCheckBox;
    chkCheckUpdate: TCheckBox;
    Label1: TLabel;
    edtCallBackTel: TEdit;
    Label2: TLabel;
    edtAccOffAlarmDis: TEdit;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    Label23: TLabel;
    Label32: TLabel;
    EditMainMPort: TEdit;
    EditMainMIP: TEdit;
    chkAlarmInfoDealTip: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure CheckBoxUseTelServerClick(Sender: TObject);
    procedure BitBtnOKClick(Sender: TObject);
    procedure CheckBoxGatewayBakClick(Sender: TObject);
    procedure CheckBoxBSBakClick(Sender: TObject);
    procedure BitBtnCloseClick(Sender: TObject);
    procedure CheckBoxDriverSpeetClick(Sender: TObject);
    procedure CheckBoxUseMasureClick(Sender: TObject);
    procedure RadioButtonTelClientTypeScheduleClick(Sender: TObject);
    procedure RadioButtonTelClientTypeAlarmListeninClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure EditDevCallNumberForListenInKeyPress(Sender: TObject;
      var Key: Char);
    procedure chxDriverSucceedOrderClick(Sender: TObject);
    procedure Image3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TabSet1Change(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure edtCallBackTelKeyPress(Sender: TObject; var Key: Char);
    procedure edtAccOffAlarmDisKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SystemConfigFrm: TSystemConfigFrm;

implementation
uses uGloabVar, ParamUnit, umainf, StructDefUnit;
{$R *.dfm}

procedure TSystemConfigFrm.FormShow(Sender: TObject);
begin
  EditMainGIP.Text := GlobalParam.Gateway.Host;
  EditMainGPort.Text := IntToStr(GlobalParam.Gateway.Port);

  CheckBoxGatewayBak.Checked := GlobalParam.IsUseGatewayBak;
  CheckBoxGatewayBakClick(nil);

  EditBakGIP.Text := GlobalParam.GatewayBak.Host;
  EditBakGPort.Text := IntToStr(GlobalParam.GatewayBak.Port);

  EditMainBIP.Text := GlobalParam.Business.Host;
  EditMainBPort.Text := IntToStr(GlobalParam.Business.Port);

  CheckBoxBSBak.Checked := GlobalParam.IsUseBusinessBak;
  CheckBoxBSBakClick(nil);

  EditBakBIp.Text := GLobalParam.BusinessBak.Host;
  EditBakBPort.Text := IntToStr(GlobalParam.BusinessBak.Port);

//  CheckBoxUseTelServer.Checked := GlobalParam.IsUseTelServer;
//  CheckBoxUseTelServerClick(CheckBoxUseTelServer);

//  EditTelAddress.Text := GlobalParam.TelServer.Host;
//  EditTelPort.Text := IntToStr(GlobalParam.TelServer.Port);
//
//  EditTelChannel.Text := IntToStr(GlobalParam.TelChannel);
//  Edit_timeSZ.Text := inttostr(GlobalParam.mrDownTime);

  AlarmCheckBox.Checked := Globalparam.IsOverSpeedAlarm;
  photoAlarmCheckbox.Checked := Globalparam.IsPhotoShowhit;
  oilAlarmCheckbox.Checked := Globalparam.isOilShutDownAlarm;
  eletrAlarmCheckbox.Checked := Globalparam.isEletrShutDownAlarm;
  alarmHurryCheckbox.Checked := Globalparam.isalarmHurry;
  CheckBoxEarlyWariningHurry.checked := Globalparam.IsEarlyWariningHurry;
  AlarmOutDevAreaCheckBox.Checked  := GlobalParam.isAlarmOutDevArea;
  AlarmInDevAreaCheckBox.Checked := GlobalParam.isAlarmInDevArea;
  AlarmDriverFatigueCheckBox.Checked :=GlobalParam.isAlarmDriverFatigue;
  AlarmOutLineCheckBox.Checked := GlobalParam.isAlarmOutLine;
  AlarmFortifyCheckBox.Checked := GlobalParam.isAlarmFortify;
  AlarmDevLowerPowerCheckBox.checked := GlobalParam.isAlarmDevLowerPower;

  CheckBoxDriverSpeet.Checked := GlobalParam.IsDriverOverSpeet;
  EditOverSpeedHintStr.Text := GlobalParam.OverSpeetHintStr;
  CheckBoxDriverSpeetClick(nil);

  CheckBoxAlarmFollow.Checked := GlobalParam.IsAlarmFollow;
  CheckBoxSendSuccess.Checked := GlobalParam.IsSendSuccess;
  CheckBoxSendFail.Checked := GlobalParam.IsSendFail;
  CheckBoxConstMenu.Checked := GlobalParam.IsConstMenu;
  CheckBoxAttemperInfo.Checked := GlobalParam.IsAttemperInfo;
//  CheckBoxTelCall.Checked := GlobalParam.IsTelCall;
//  CheckBoxFirstCutTel.Checked := GlobalParam.IsFirstCutTel;
//  CheckBoxTelNotClose.Checked := GlobalParam.IsFTelNotClose;
  CheckBoxOnline.Checked := GlobalParam.isCarOnline;
  CheckBoxUnonline.Checked := GlobalParam.isCarUnOnline;
  CheckBoxIsShowEmptyFull.Checked := GlobalParam.isShowEmptyFull;
  CheckBoxAutoChangeMap.Checked := GlobalParam.isAutoChangeMap;
  CheckBoxShowMasureError.Checked := GlobalParam.isShowMasureError;
  CheckBoxUseMasure.Checked := GlobalParam.isUseMasure;

  CheckBoxUseDriverCard.Checked := GlobalParam.isUseDriverCard;
  CheckBoxAreaAlarm.Checked := GlobalParam.isAreaAlarmSendInfoToDriver;

  CheckBoxCarNOAndDevName.Checked := GlobalParam.isCarNOAndDevName;
  ComboBox1.ItemIndex := GlobalParam.ShowTheMapOption;
  ComBoBoxFontSize.Text := IntToStr(GlobalParam.FontSize);
  combobox2.ItemIndex := GlobalParam.carpicType;
  CheckBoxLoadChinaRoad.Checked := GlobalParam.isLoadChinaRoad;

  CheckBoxisAllCarUnOnlineAlarm.Checked := GlobalParam.isAllCarUnOnlineAlarm;

//  CheckBoxIsUpdate.Checked := GlobalParam.isUpdate;
  chkCheckUpdate.Checked := GlobalParam.isUpdate;
  editUpdateURL.Text := GlobalParam.UpdateURL;

  ComboBoxSelectOrderVer.ItemIndex := GlobalParam.OrderVersion;
  CheckBoxIsNoticeZtUploadCarryOffXslc.Checked := GlobalParam.IsNoticeZtUploadCarryOffXslc;

  EditStopOverTimeAlarm.Text := GlobalParam.StopOverTimeAlarm;//add by wangcl 混凝土，超时停车时间

  Shape1.Brush.Color:=GlobalParam.FDriverAlarmColor;
  shape2.Brush.Color:=GlobalParam.FTaxiEmptyColor;
  shape3.Brush.Color:= GlobalParam.FTaxiHavColor;


//  if GlobalParam.TelClientType = CLIENT_TYPE_SCHEDULE then
//    RadioButtonTelClientTypeSchedule.Checked := True
//  else if GlobalParam.TelClientType = CLIENT_TYPE_ALARMMONITOR then
//    RadioButtonTelClientTypeAlarmListenin.Checked := True;
  EditDevCallNumberForListenIn.Text := GlobalParam.DevCallNumberForListenIn;

  CheckBoxIsNoticeZtUploadCarryOffXslc.Enabled := False;

//  chxDriverSucceedOrder.Checked := GlobalParam.IsDriverSucceedOrder;
//  editSucceedOrderHintStr.Text := GlobalParam.SucceedOrderHintStr;
//  chxDriverSucceedOrderClick(nil);

//  chxOrderHaveTel.Checked := GlobalParam.IsOrderHaveTel;


{$IFDEF For_ZtCar}
  ComboBoxSelectOrderVer.Enabled := False;
  CheckBoxUseTelServer.Enabled := False;
  photoAlarmCheckbox.Enabled := False;
  CheckBoxUseDriverCard.Enabled := False;
  CheckBoxUseMasure.Enabled := False;
  // CheckBoxIsShowEmptyFull.Enabled := False;
  CheckBoxShowMasureError.Enabled := False;
  CheckBoxConstMenu.Enabled := False;
  CheckBoxAttemperInfo.Enabled := False;
  CheckBoxIsNoticeZtUploadCarryOffXslc.Enabled := True;
{$ENDIF}
  CheckBoxEmergncyAlarmAutoFirstAlarm.Checked := GlobalParam.IsEmergncyAlarmAutoFirstAlarm;
  CheckBoxEarlyWariningAutoFirstAlarm.Checked := GlobalParam.IsEarlyWarningAutoFirstAlarm;

  chkDevOtherAlarm.Checked := GlobalParam.IsDevOtherAlarm;
  chkSendTextWhenAlarm.Checked := GlobalParam.IsSendTextWhenAlarm;
  chkAlarmInfoDealTip.Checked := GlobalParam.IsAlarmInfoDealTip;

  edtCallBackTel.Text := GlobalParam.CallBackTel;
  edtAccOffAlarmDis.Text := IntToStr(GlobalParam.AccOffAlarmDis);
  EditMainMIP.Text := GlobalParam.MapServerIp;
  EditMainMPort.Text := IntToStr(GlobalParam.MapServerPort);
end;

procedure TSystemConfigFrm.CheckBoxUseTelServerClick(Sender: TObject);
begin
//  if CheckBoxUseTelServer.Checked then
//  begin
//    GroupBox1.Enabled := true;
//    EditTelAddress.Color := clWindow;
//  end
//  else
//  begin
//    GroupBox1.Enabled := false;
//    EditTelAddress.Color := clBtnFace;
//  end;
//  EditTelPort.Color := EditTelAddress.Color;
//  EditTelChannel.Color := EditTelAddress.Color;
//  CheckBoxTelCall.Enabled := GroupBox1.Enabled;
//  CheckBoxFirstCutTel.Enabled := GroupBox1.Enabled;
//  CheckBoxTelNotClose.Enabled := GroupBox1.Enabled;
end;

procedure TSystemConfigFrm.BitBtnOKClick(Sender: TObject);
var
  ad: TAddrssParam;
begin
  ad.Host := EditMainGIP.Text;
  ad.Port := StrToInt(EditMainGPort.Text);
  GlobalParam.Gateway := ad;

  GlobalParam.IsUseGatewayBak := CheckBoxGatewayBak.Checked;
  ad.Host := EditBakGIP.Text;
  ad.Port := StrToInt(EditBakGPort.Text);
  GlobalParam.GatewayBak := ad;

  ad.Host := EditMainBIP.Text;
  ad.Port := StrToInt(EditMainBPort.Text);
  GlobalParam.Business := ad;

  GlobalParam.IsUseBusinessBak := CheckBoxBSBak.Checked;
  ad.Host := EditBakBIp.Text;
  ad.Port := StrToInt(EditBakBPort.Text);
  GlobalParam.BusinessBak := ad;

//  ad.Host := EditTelAddress.Text;
//  ad.Port := StrToInt(EditTelPort.Text);
//  GlobalParam.TelServer := ad;

//  GlobalParam.IsUseTelServer := CheckBoxUseTelServer.Checked;
//  GlobalParam.TelChannel := StrToInt(EditTelChannel.Text);


  GlobalParam.IsDriverOverSpeet := CheckBoxDriverSpeet.Checked;
  GlobalParam.OverSpeetHintStr := EditOverSpeedHintStr.Text;
  
  GlobalParam.IsAlarmFollow := CheckBoxAlarmFollow.Checked;
  GlobalParam.IsSendSuccess := CheckBoxSendSuccess.Checked;
  GlobalParam.IsSendFail := CheckBoxSendFail.Checked;
  GlobalParam.IsConstMenu := CheckBoxConstMenu.Checked;
  GlobalParam.IsAttemperInfo := CheckBoxAttemperInfo.Checked;
//  GlobalParam.IsTelCall := CheckBoxTelCall.Checked;
//  GlobalParam.IsFirstCutTel := CheckBoxFirstCutTel.Checked;
//  GlobalParam.IsFTelNotClose := CheckBoxTelNotClose.Checked;
  GlobalParam.isCarNOAndDevName := CheckBoxCarNoAndDevName.Checked;
  GlobalParam.isCarOnline := CheckBoxOnline.Checked;
  GlobalParam.isCarUnOnline := CheckBoxUnonline.Checked;
  GlobalParam.isShowEmptyFull := CheckBoxIsShowEmptyFull.Checked;
  GlobalParam.isAutoChangeMap := CheckBoxAutoChangeMap.Checked;
  GlobalParam.isShowMasureError := CheckBoxShowMasureError.checked;
  GlobalParam.isUseMasure := CheckBoxUseMasure.Checked;


  Globalparam.IsOverSpeedAlarm := AlarmCheckBox.Checked;
  Globalparam.IsPhotoShowhit := photoAlarmCheckbox.Checked;
  Globalparam.isOilShutDownAlarm := oilAlarmCheckbox.Checked;
  Globalparam.isEletrShutDownAlarm := eletrAlarmCheckbox.Checked;
  Globalparam.isalarmHurry := alarmHurryCheckbox.Checked;
  Globalparam.IsEarlyWariningHurry := CheckBoxEarlyWariningHurry.checked;
  GlobalParam.isAlarmOutDevArea := AlarmOutDevAreaCheckBox.Checked;
  GlobalParam.isAlarmInDevArea := AlarmInDevAreaCheckBox.Checked;
  GlobalParam.isAlarmDriverFatigue := AlarmDriverFatigueCheckBox.Checked;
  GlobalParam.isAlarmOutLine := AlarmOutLineCheckBox.Checked;
  GlobalParam.isAlarmFortify := AlarmFortifyCheckBox.Checked;
  GlobalParam.isAlarmDevLowerPower := AlarmDevLowerPowerCheckBox.checked;

  GlobalParam.isUseDriverCard := CheckBoxUseDriverCard.Checked;
  GlobalParam.isAreaAlarmSendInfoToDriver := CheckBoxAreaAlarm.Checked;
  GlobalParam.IsNoticeZtUploadCarryOffXslc := CheckBoxIsNoticeZtUploadCarryOffXslc.Checked;

  GlobalParam.ShowTheMapOption := ComboBox1.ItemIndex;
  GlobalParam.FontSize := StrToInt(ComboboxFontSize.Text);

  GlobalParam.mrDownTime := strtoint(Edit_timeSZ.Text);
  GlobalParam.isLoadChinaRoad := CheckBoxLoadChinaRoad.Checked;
  GlobalParam.isAllCarUnOnlineAlarm := CheckBoxisAllCarUnOnlineAlarm.Checked;
  GlobalParam.isUpdate := CheckBoxIsUpdate.Checked;
  GlobalParam.UpdateURL := Trim(editUpdateURL.Text);
  GlobalParam.carpicType := ComboBox2.ItemIndex;
  GlobalParam.OrderVersion := ComboBoxSelectOrderVer.ItemIndex;
  GlobalParam.StopOverTimeAlarm := Trim(EditStopOverTimeAlarm.Text);//混凝土，停车超时时间设置
  GlobalParam.FDriverAlarmColor:=shape1.Brush.Color;
  GlobalParam.FTaxiEmptyColor:=shape2.Brush.Color;
  GlobalParam.FTaxiHavColor:=shape3.Brush.Color;

//  if RadioButtonTelClientTypeSchedule.Checked then
//    GlobalParam.TelClientType := CLIENT_TYPE_SCHEDULE
//  else if RadioButtonTelClientTypeAlarmListenin.Checked then
//    GlobalParam.TelClientType := CLIENT_TYPE_ALARMMONITOR;
  GlobalParam.DevCallNumberForListenIn := EditDevCallNumberForListenIn.Text;
  GlobalParam.IsEmergncyAlarmAutoFirstAlarm := CheckBoxEmergncyAlarmAutoFirstAlarm.Checked;
  GlobalParam.IsEarlyWarningAutoFirstAlarm := CheckBoxEarlyWariningAutoFirstAlarm.Checked;

//  GlobalParam.IsDriverSucceedOrder := chxDriverSucceedOrder.Checked;
//  GlobalParam.SucceedOrderHintStr := Trim(editSucceedOrderHintStr.Text);
//
//  GlobalParam.IsOrderHaveTel := chxOrderHaveTel.Checked;

  GlobalParam.SaveToFile(Application.ExeName + '.config');
  FMap.DrawGpsMap_ClearDraw;
  ModalResult := mrOk;
end;

procedure TSystemConfigFrm.CheckBoxGatewayBakClick(Sender: TObject);
begin
  if CheckBoxGatewayBak.Checked then
  begin
    EditBakGIP.Enabled := true;
    EditBakGIP.Color := clWindow;
  end
  else
  begin
    EditBakGIP.Enabled := false;
    EditBakGIP.Color := clBtnFace;
  end;
  EditBakGPort.Enabled := EditBakGIP.Enabled;
  EditBakGPort.Color := EditBakGIP.Color;
end;

procedure TSystemConfigFrm.CheckBoxBSBakClick(Sender: TObject);
begin
  if CheckBoxBSBak.Checked then
  begin
    EditBakBIP.Enabled := true;
    EditBakBIP.Color := clWindow;
  end
  else
  begin
    EditBakBIP.Enabled := false;
    EditBakBIP.Color := clBtnFace;
  end;
  EditBakBPort.Enabled := EditBakBIP.Enabled;
  EditBakBPort.Color := EditBakBIP.Color;
end;


procedure TSystemConfigFrm.BitBtnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TSystemConfigFrm.CheckBoxDriverSpeetClick(Sender: TObject);
begin
  EditOverSpeedHintStr.Enabled := CheckBoxDriverSpeet.Checked;
  if CheckBoxDriverSpeet.Checked then
    EditOverSpeedHintStr.Color := clWindow
  else
    EditOverSpeedHintStr.Color := clBtnFace;
end;

procedure TSystemConfigFrm.CheckBoxUseMasureClick(Sender: TObject);
begin
  CheckBoxShowMasureError.Enabled := CheckBoxUseMasure.Checked;
  if not CheckBoxUseMasure.Checked then
  begin
    CheckBoxShowMasureError.Checked := False;
  end;
end;

procedure TSystemConfigFrm.RadioButtonTelClientTypeScheduleClick(
  Sender: TObject);
begin
//  if RadioButtonTelClientTypeSchedule.Checked then
//  begin
//    RadioButtonTelClientTypeSchedule.Font.Color := clBlue;
//    RadioButtonTelClientTypeAlarmListenin.Font.Color := clWindowText;
//  end;
end;

procedure TSystemConfigFrm.RadioButtonTelClientTypeAlarmListeninClick(
  Sender: TObject);
begin
//  if RadioButtonTelClientTypeAlarmListenin.Checked then
//  begin
//    RadioButtonTelClientTypeSchedule.Font.Color := clWindowText;
//    RadioButtonTelClientTypeAlarmListenin.Font.Color := clBlue;
//  end;
end;

procedure TSystemConfigFrm.SpeedButton1Click(Sender: TObject);
begin
  if  ColorDialog1.Execute  then
  begin
    Shape1.Brush.Color:= ColorDialog1.Color;
  end;
end;

procedure TSystemConfigFrm.SpeedButton3Click(Sender: TObject);
begin
  if  ColorDialog1.Execute  then
  begin
    Shape2.Brush.Color:= ColorDialog1.Color;
  end;
end;

procedure TSystemConfigFrm.SpeedButton4Click(Sender: TObject);
begin
  if  ColorDialog1.Execute  then
  begin
    Shape3.Brush.Color:= ColorDialog1.Color;
  end;
end;

procedure TSystemConfigFrm.EditDevCallNumberForListenInKeyPress(
  Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8])then
    key := #0;
end;

procedure TSystemConfigFrm.chxDriverSucceedOrderClick(Sender: TObject);
begin
//  editSucceedOrderHintStr.Enabled := chxDriverSucceedOrder.Checked;
//  if chxDriverSucceedOrder.Checked then
//    editSucceedOrderHintStr.Color := clWindow
//  else
//    editSucceedOrderHintStr.Color := clBtnFace;
end;

procedure TSystemConfigFrm.Image3MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  SendMessage(Handle, WM_SYSCOMMAND, SC_MOVE + HTCAPTION, 0);
end;

procedure TSystemConfigFrm.SpeedButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TSystemConfigFrm.FormCreate(Sender: TObject);
begin
  SetWindowLong(Handle, GWL_STYLE,
    GetWindowLong(Handle, GWL_STYLE) and (not WS_CAPTION));
  Notebook1.PageIndex := 0;
end;

procedure TSystemConfigFrm.TabSet1Change(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
begin
  Notebook1.PageIndex := NewTab;
end;

procedure TSystemConfigFrm.SpeedButton5Click(Sender: TObject);
var
  ad: TAddrssParam;
begin
  ad.Host := EditMainGIP.Text;
  ad.Port := StrToInt(EditMainGPort.Text);
  GlobalParam.Gateway := ad;

  GlobalParam.IsUseGatewayBak := CheckBoxGatewayBak.Checked;
  ad.Host := EditBakGIP.Text;
  ad.Port := StrToInt(EditBakGPort.Text);
  GlobalParam.GatewayBak := ad;

  ad.Host := EditMainBIP.Text;
  ad.Port := StrToInt(EditMainBPort.Text);
  GlobalParam.Business := ad;

  GlobalParam.IsUseBusinessBak := CheckBoxBSBak.Checked;
  ad.Host := EditBakBIp.Text;
  ad.Port := StrToInt(EditBakBPort.Text);
  GlobalParam.BusinessBak := ad;

//  ad.Host := EditTelAddress.Text;
//  ad.Port := StrToInt(EditTelPort.Text);
//  GlobalParam.TelServer := ad;
//
//  GlobalParam.IsUseTelServer := CheckBoxUseTelServer.Checked;
//  GlobalParam.TelChannel := StrToInt(EditTelChannel.Text);


  GlobalParam.IsDriverOverSpeet := CheckBoxDriverSpeet.Checked;
  GlobalParam.OverSpeetHintStr := EditOverSpeedHintStr.Text;
  
  GlobalParam.IsAlarmFollow := CheckBoxAlarmFollow.Checked;
  GlobalParam.IsSendSuccess := CheckBoxSendSuccess.Checked;
  GlobalParam.IsSendFail := CheckBoxSendFail.Checked;
  GlobalParam.IsConstMenu := CheckBoxConstMenu.Checked;
  GlobalParam.IsAttemperInfo := CheckBoxAttemperInfo.Checked;
//  GlobalParam.IsTelCall := CheckBoxTelCall.Checked;
//  GlobalParam.IsFirstCutTel := CheckBoxFirstCutTel.Checked;
//  GlobalParam.IsFTelNotClose := CheckBoxTelNotClose.Checked;
  GlobalParam.isCarNOAndDevName := CheckBoxCarNoAndDevName.Checked;
  GlobalParam.isCarOnline := CheckBoxOnline.Checked;
  GlobalParam.isCarUnOnline := CheckBoxUnonline.Checked;
  GlobalParam.isShowEmptyFull := CheckBoxIsShowEmptyFull.Checked;
  GlobalParam.isAutoChangeMap := CheckBoxAutoChangeMap.Checked;
  GlobalParam.isShowMasureError := CheckBoxShowMasureError.checked;
  GlobalParam.isUseMasure := CheckBoxUseMasure.Checked;


  Globalparam.IsOverSpeedAlarm := AlarmCheckBox.Checked;
  Globalparam.IsPhotoShowhit := photoAlarmCheckbox.Checked;
  Globalparam.isOilShutDownAlarm := oilAlarmCheckbox.Checked;
  Globalparam.isEletrShutDownAlarm := eletrAlarmCheckbox.Checked;
  Globalparam.isalarmHurry := alarmHurryCheckbox.Checked;
  Globalparam.IsEarlyWariningHurry := CheckBoxEarlyWariningHurry.checked;
  GlobalParam.isAlarmOutDevArea := AlarmOutDevAreaCheckBox.Checked;
  GlobalParam.isAlarmInDevArea := AlarmInDevAreaCheckBox.Checked;
  GlobalParam.isAlarmDriverFatigue := AlarmDriverFatigueCheckBox.Checked;
  GlobalParam.isAlarmOutLine := AlarmOutLineCheckBox.Checked;
  GlobalParam.isAlarmFortify := AlarmFortifyCheckBox.Checked;
  GlobalParam.isAlarmDevLowerPower := AlarmDevLowerPowerCheckBox.checked;

  GlobalParam.isUseDriverCard := CheckBoxUseDriverCard.Checked;
  GlobalParam.isAreaAlarmSendInfoToDriver := CheckBoxAreaAlarm.Checked;
  GlobalParam.IsNoticeZtUploadCarryOffXslc := CheckBoxIsNoticeZtUploadCarryOffXslc.Checked;

  GlobalParam.ShowTheMapOption := ComboBox1.ItemIndex;
  GlobalParam.FontSize := StrToInt(ComboboxFontSize.Text);

  GlobalParam.mrDownTime := strtoint(Edit_timeSZ.Text);
  GlobalParam.isLoadChinaRoad := CheckBoxLoadChinaRoad.Checked;
  GlobalParam.isAllCarUnOnlineAlarm := CheckBoxisAllCarUnOnlineAlarm.Checked;
  GlobalParam.isUpdate := chkCheckUpdate.Checked;// CheckBoxIsUpdate.Checked;
  GlobalParam.UpdateURL := Trim(editUpdateURL.Text);
  GlobalParam.carpicType := ComboBox2.ItemIndex;
  GlobalParam.OrderVersion := ComboBoxSelectOrderVer.ItemIndex;
  GlobalParam.StopOverTimeAlarm := Trim(EditStopOverTimeAlarm.Text);//混凝土，停车超时时间设置
  GlobalParam.FDriverAlarmColor:=shape1.Brush.Color;
  GlobalParam.FTaxiEmptyColor:=shape2.Brush.Color;
  GlobalParam.FTaxiHavColor:=shape3.Brush.Color;

//  if RadioButtonTelClientTypeSchedule.Checked then
//    GlobalParam.TelClientType := CLIENT_TYPE_SCHEDULE
//  else if RadioButtonTelClientTypeAlarmListenin.Checked then
//    GlobalParam.TelClientType := CLIENT_TYPE_ALARMMONITOR;
  GlobalParam.DevCallNumberForListenIn := EditDevCallNumberForListenIn.Text;
  GlobalParam.IsEmergncyAlarmAutoFirstAlarm := CheckBoxEmergncyAlarmAutoFirstAlarm.Checked;
  GlobalParam.IsEarlyWarningAutoFirstAlarm := CheckBoxEarlyWariningAutoFirstAlarm.Checked;

  GlobalParam.IsDevOtherAlarm := chkDevOtherAlarm.Checked;
  GlobalParam.IsSendTextWhenAlarm := chkSendTextWhenAlarm.Checked;
  GlobalParam.IsAlarmInfoDealTip := chkAlarmInfoDealTip.Checked;

  GlobalParam.CallBackTel := Trim(edtCallBackTel.Text);
  GlobalParam.AccOffAlarmDis := StrToInt(Trim(edtAccOffAlarmDis.Text));

  GlobalParam.MapServerIp := Trim(EditMainMIP.Text);
  if Trim(EditMainMPort.Text) <> '' then
    GlobalParam.MapServerPort := StrToInt(Trim(EditMainMPort.Text))
  else
    GlobalParam.MapServerPort := 0;

//  GlobalParam.IsDriverSucceedOrder := chxDriverSucceedOrder.Checked;
//  GlobalParam.SucceedOrderHintStr := Trim(editSucceedOrderHintStr.Text);
//
//  GlobalParam.IsOrderHaveTel := chxOrderHaveTel.Checked;

  GlobalParam.SaveToFile(Application.ExeName + '.config');
  //FMap.DrawGpsMap_ClearDraw;
  ModalResult := mrOk;
end;

procedure TSystemConfigFrm.SpeedButton6Click(Sender: TObject);
begin
  Close;
end;

procedure TSystemConfigFrm.edtCallBackTelKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', #8]) then Key := #0;
end;

procedure TSystemConfigFrm.edtAccOffAlarmDisKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8]) then
    Key := #0;
end;

end.

