object answerFrm: TanswerFrm
  Left = 502
  Top = 358
  Width = 345
  Height = 139
  Caption = #20505#36873#31572#26696
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
    Top = 0
    Width = 337
    Height = 105
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 19
      Width = 60
      Height = 13
      Caption = #20505#36873#31572#26696#65306
    end
    object editAnswer: TEdit
      Left = 88
      Top = 16
      Width = 201
      Height = 21
      MaxLength = 20
      TabOrder = 0
    end
    object btnOK: TBitBtn
      Left = 24
      Top = 72
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 1
      OnClick = btnOKClick
    end
    object btnNext: TBitBtn
      Left = 128
      Top = 72
      Width = 75
      Height = 25
      Caption = #32487#32493#28155#21152
      TabOrder = 2
      OnClick = btnNextClick
    end
    object btnCancel: TBitBtn
      Left = 232
      Top = 72
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 3
    end
  end
end
