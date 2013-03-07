object FrmUserReg: TFrmUserReg
  Left = 335
  Top = 362
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #29992#25143#27880#20876
  ClientHeight = 188
  ClientWidth = 327
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 327
    Height = 147
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 31
      Top = 88
      Width = 130
      Height = 13
      Caption = #35831#24744#36755#20837#24744#30340#27880#20876#21495#65306
    end
    object Label2: TLabel
      Left = 19
      Top = 122
      Width = 273
      Height = 13
      Caption = #35831#35760#20303#24744#30340#27880#20876#21495#65292#25805#20316#31995#32479#37325#35013#21518#20173#21487#20351#29992#12290
      Font.Charset = GB2312_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 31
      Top = 65
      Width = 91
      Height = 13
      Caption = #24744#30340#21453#39304#21495#26159#65306
    end
    object Label5: TLabel
      Left = 31
      Top = 13
      Width = 286
      Height = 13
      Caption = #20026#20445#25252#25105#21333#20301#30340#21512#27861#26435#30410#65292#35831#24744#23545#36719#20214#36827#34892#27880#20876#12290
      Font.Charset = GB2312_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 15
      Top = 32
      Width = 286
      Height = 13
      Caption = #35831#23558#24744#30340#21453#39304#21495#32473#25105#20204#65292#30001#25105#20204#32473#24744#19968#20010#27880#20876#21495#12290
      Font.Charset = GB2312_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object EditZc: TEdit
      Left = 152
      Top = 82
      Width = 154
      Height = 21
      MaxLength = 16
      TabOrder = 0
    end
    object EditBack: TEdit
      Left = 152
      Top = 58
      Width = 154
      Height = 21
      MaxLength = 16
      ReadOnly = True
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 147
    Width = 327
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 45
      Top = 8
      Width = 78
      Height = 25
      Caption = #27880#20876
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 122
      Top = 8
      Width = 78
      Height = 25
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
    object BitBtn3: TBitBtn
      Left = 199
      Top = 8
      Width = 78
      Height = 25
      Caption = #20851#20110#26412#36719#20214
      TabOrder = 2
      OnClick = BitBtn3Click
    end
  end
end
