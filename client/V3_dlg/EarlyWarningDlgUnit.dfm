object EarlyWarningDlg: TEarlyWarningDlg
  Left = 372
  Top = 342
  BorderStyle = bsDialog
  Caption = #39044#35686#30830#35748#21407#22240
  ClientHeight = 211
  ClientWidth = 404
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 168
    Width = 404
    Height = 43
    Align = alBottom
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 96
      Top = 8
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      Kind = bkOK
    end
    object BitBtn2: TBitBtn
      Left = 208
      Top = 8
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 404
    Height = 168
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 32
      Top = 56
      Width = 36
      Height = 13
      Caption = #21407#22240#65306
    end
    object Label2: TLabel
      Left = 188
      Top = 24
      Width = 48
      Height = 13
      Caption = #36710#29260#21495#65306
    end
    object Label3: TLabel
      Left = 8
      Top = 24
      Width = 60
      Height = 13
      Caption = #36710#26426#32534#21495#65306
    end
    object Memo1: TMemo
      Left = 72
      Top = 56
      Width = 289
      Height = 97
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object editCarNo: TEdit
      Left = 240
      Top = 20
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
    object editDevID: TEdit
      Left = 72
      Top = 24
      Width = 113
      Height = 21
      ReadOnly = True
      TabOrder = 2
    end
  end
end
