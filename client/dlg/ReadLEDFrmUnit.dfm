object ReadLEDFrm: TReadLEDFrm
  Left = 310
  Top = 237
  BorderStyle = bsDialog
  Caption = #26174#31034#23631#20449#24687
  ClientHeight = 180
  ClientWidth = 292
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 3
    Width = 281
    Height = 145
    Caption = #26174#31034#23631#20449#24687
    TabOrder = 0
    object Label1: TLabel
      Left = 40
      Top = 40
      Width = 52
      Height = 13
      Caption = #36710#29260#21495#30721
    end
    object Label2: TLabel
      Left = 40
      Top = 66
      Width = 52
      Height = 13
      Caption = #23631#30340#32534#21495
    end
    object Label3: TLabel
      Left = 40
      Top = 93
      Width = 52
      Height = 13
      Caption = #23631#30340#34892#25968
    end
    object Label4: TLabel
      Left = 53
      Top = 120
      Width = 39
      Height = 13
      Caption = #23631#21015#25968
    end
    object Edit1: TEdit
      Left = 119
      Top = 33
      Width = 127
      Height = 21
      ReadOnly = True
      TabOrder = 0
      Text = 'Edit1'
    end
    object Edit2: TEdit
      Left = 119
      Top = 59
      Width = 127
      Height = 21
      ReadOnly = True
      TabOrder = 1
      Text = 'Edit2'
    end
    object Edit3: TEdit
      Left = 119
      Top = 86
      Width = 127
      Height = 21
      ReadOnly = True
      TabOrder = 2
      Text = 'Edit3'
    end
    object Edit4: TEdit
      Left = 119
      Top = 113
      Width = 127
      Height = 21
      ReadOnly = True
      TabOrder = 3
      Text = 'Edit4'
    end
  end
  object BitBtn2: TBitBtn
    Left = 229
    Top = 152
    Width = 59
    Height = 25
    Caption = #36864#20986
    TabOrder = 1
    OnClick = BitBtn2Click
  end
end
