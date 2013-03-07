object frmMInfo: TfrmMInfo
  Left = 412
  Top = 270
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #28857#25773#20449#24687#32500#25252
  ClientHeight = 228
  ClientWidth = 354
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 187
    Width = 354
    Height = 41
    Align = alBottom
    Color = 16382438
    TabOrder = 0
    object RzBitBtn1: TRzBitBtn
      Left = 93
      Top = 8
      Width = 62
      Caption = #30830#23450
      HotTrack = True
      TabOrder = 0
      OnClick = RzBitBtn1Click
      ImageIndex = 15
      Images = Mainf.ImageList1
    end
    object RzBitBtn2: TRzBitBtn
      Left = 228
      Top = 8
      Width = 62
      Caption = #21462#28040
      HotTrack = True
      TabOrder = 1
      OnClick = RzBitBtn2Click
      ImageIndex = 16
      Images = Mainf.ImageList1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 354
    Height = 187
    Align = alClient
    Color = 16382438
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 20
      Width = 54
      Height = 13
      Caption = #20449#24687#31867#22411'  '
    end
    object Label2: TLabel
      Left = 16
      Top = 80
      Width = 54
      Height = 13
      Caption = #20449#24687#20869#23481'  '
    end
    object Label3: TLabel
      Left = 16
      Top = 132
      Width = 54
      Height = 13
      Caption = #20449#24687#22791#27880'  '
    end
    object Label4: TLabel
      Left = 16
      Top = 51
      Width = 54
      Height = 13
      Caption = #21457#36865#26102#38388'  '
    end
    object edtMemo: TMemo
      Left = 84
      Top = 131
      Width = 255
      Height = 37
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object edtInfoId: TEdit
      Left = 297
      Top = 8
      Width = 72
      Height = 21
      TabOrder = 1
      Visible = False
    end
    object cbxInfoType: TComboBox
      Left = 84
      Top = 16
      Width = 148
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
    end
    object edtContent: TMemo
      Left = 84
      Top = 80
      Width = 255
      Height = 45
      ScrollBars = ssVertical
      TabOrder = 3
    end
    object DateTimePicker1: TDateTimePicker
      Left = 252
      Top = 47
      Width = 80
      Height = 21
      Date = 40766.744300844900000000
      Time = 40766.744300844900000000
      TabOrder = 4
      Visible = False
    end
    object DateTimePicker2: TDateTimePicker
      Left = 84
      Top = 47
      Width = 52
      Height = 21
      Date = 40766.744325625000000000
      Time = 40766.744325625000000000
      Kind = dtkTime
      TabOrder = 5
    end
  end
end
