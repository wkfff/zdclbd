object frmMInfoType: TfrmMInfoType
  Left = 517
  Top = 267
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #20449#24687#31867#22411#32500#25252
  ClientHeight = 204
  ClientWidth = 316
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 316
    Height = 163
    Align = alClient
    Color = 16382438
    TabOrder = 0
    object Label1: TLabel
      Left = 6
      Top = 20
      Width = 78
      Height = 13
      Caption = #20449#24687#31867#22411#32534#21495'  '
    end
    object Label2: TLabel
      Left = 6
      Top = 56
      Width = 78
      Height = 13
      Caption = #20449#24687#31867#22411#21517#31216'  '
    end
    object Label3: TLabel
      Left = 6
      Top = 92
      Width = 78
      Height = 13
      Caption = #20449#24687#31867#22411#22791#27880'  '
    end
    object edtTypeNo: TEdit
      Left = 89
      Top = 16
      Width = 58
      Height = 21
      Hint = #31867#22411#32534#21495#19981#33021#22823#20110'255'#65292#19988#19981#33021#19982#20854#20182#31867#22411#32534#21495#37325#22797
      MaxLength = 3
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnKeyPress = edtTypeNoKeyPress
    end
    object edtTypeName: TEdit
      Left = 89
      Top = 52
      Width = 215
      Height = 21
      MaxLength = 50
      TabOrder = 1
    end
    object edtTypeMemo: TMemo
      Left = 89
      Top = 92
      Width = 214
      Height = 53
      ScrollBars = ssVertical
      TabOrder = 2
    end
    object edtTypeId: TEdit
      Left = 176
      Top = 16
      Width = 121
      Height = 21
      TabOrder = 3
      Visible = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 163
    Width = 316
    Height = 41
    Align = alBottom
    Color = 16382438
    TabOrder = 1
    object RzBitBtn1: TRzBitBtn
      Left = 69
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
      Left = 204
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
end
