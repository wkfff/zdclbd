object frmReplyAlarmSupervise: TfrmReplyAlarmSupervise
  Left = 565
  Top = 273
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #27719#25253#30563#21150#25253#35686#22788#29702#32467#26524
  ClientHeight = 250
  ClientWidth = 273
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
    Width = 273
    Height = 250
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = 16382438
    TabOrder = 0
    object Label1: TLabel
      Left = 47
      Top = 180
      Width = 60
      Height = 13
      Caption = #22788#29702#32467#26524#65306
    end
    object cbxResult: TComboBox
      Left = 112
      Top = 176
      Width = 90
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 1
      TabOrder = 0
      Text = #24050#22788#29702#23436#27605
      Items.Strings = (
        #22788#29702#20013
        #24050#22788#29702#23436#27605
        #19981#20316#22788#29702
        #23558#26469#22788#29702)
    end
    object GroupBox1: TGroupBox
      Left = 2
      Top = 2
      Width = 269
      Height = 169
      Align = alTop
      Caption = #30563#21150#25253#35686#20449#24687
      TabOrder = 1
      object Label2: TLabel
        Left = 28
        Top = 24
        Width = 60
        Height = 13
        Caption = #25253#35686#26469#28304#65306
      end
      object Label3: TLabel
        Left = 28
        Top = 47
        Width = 60
        Height = 13
        Caption = #25253#35686#31867#22411#65306
      end
      object Label4: TLabel
        Left = 28
        Top = 70
        Width = 60
        Height = 13
        Caption = #30563#21150#32423#21035#65306
      end
      object Label5: TLabel
        Left = 40
        Top = 93
        Width = 48
        Height = 13
        Caption = #30563#21150#20154#65306
      end
      object Label6: TLabel
        Left = 16
        Top = 116
        Width = 72
        Height = 13
        Caption = #30563#21150#20154#30005#35805#65306
      end
      object Label7: TLabel
        Left = 15
        Top = 139
        Width = 73
        Height = 13
        Caption = #30563#21150#20154'Email'#65306
      end
      object edtSrc: TEdit
        Left = 90
        Top = 20
        Width = 162
        Height = 21
        Color = 13565951
        ReadOnly = True
        TabOrder = 0
      end
      object edtType: TEdit
        Left = 90
        Top = 43
        Width = 162
        Height = 21
        Color = 13565951
        ReadOnly = True
        TabOrder = 1
      end
      object edtLevel: TEdit
        Left = 90
        Top = 66
        Width = 162
        Height = 21
        Color = 13565951
        ReadOnly = True
        TabOrder = 2
      end
      object edtSupervisor: TEdit
        Left = 90
        Top = 89
        Width = 162
        Height = 21
        Color = 13565951
        ReadOnly = True
        TabOrder = 3
      end
      object edtTel: TEdit
        Left = 90
        Top = 112
        Width = 162
        Height = 21
        Color = 13565951
        ReadOnly = True
        TabOrder = 4
      end
      object edtEmail: TEdit
        Left = 90
        Top = 135
        Width = 162
        Height = 21
        Color = 13565951
        ReadOnly = True
        TabOrder = 5
      end
    end
    object RzBitBtn1: TRzBitBtn
      Left = 40
      Top = 211
      Caption = #27719#25253
      Color = 15987661
      HotTrack = True
      TabOrder = 2
      OnClick = RzBitBtn1Click
    end
    object RzBitBtn2: TRzBitBtn
      Left = 160
      Top = 211
      ModalResult = 2
      Caption = #21462#28040
      Color = 15987661
      HotTrack = True
      TabOrder = 3
    end
  end
end
