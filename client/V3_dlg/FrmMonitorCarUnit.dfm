object frmMonitorCar: TfrmMonitorCar
  Left = 344
  Top = 351
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #30417#21548#36710#36742
  ClientHeight = 129
  ClientWidth = 280
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 280
    Height = 129
    Align = alClient
    TabOrder = 0
    object Label2: TLabel
      Left = 40
      Top = 57
      Width = 60
      Height = 13
      Caption = #24179#21488#21495#30721#65306
    end
    object Label1: TLabel
      Left = 28
      Top = 22
      Width = 72
      Height = 13
      Caption = #34987#30417#21548#36710#36742#65306
    end
    object edtTel: TEdit
      Left = 100
      Top = 53
      Width = 137
      Height = 21
      TabOrder = 0
    end
    object edtCarNo: TEdit
      Left = 100
      Top = 18
      Width = 137
      Height = 21
      Color = clInfoBk
      ReadOnly = True
      TabOrder = 1
    end
    object RzButton1: TRzButton
      Left = 48
      Top = 88
      FrameColor = 7617536
      Caption = #30830#23450
      Color = 15791348
      HotTrack = True
      TabOrder = 2
      OnClick = RzButton1Click
    end
    object RzButton2: TRzButton
      Left = 160
      Top = 88
      FrameColor = 7617536
      Caption = #21462#28040
      Color = 15791348
      HotTrack = True
      TabOrder = 3
      OnClick = RzButton2Click
    end
  end
end
