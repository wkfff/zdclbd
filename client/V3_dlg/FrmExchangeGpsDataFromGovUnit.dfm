object frmExchangeGpsDataFromGov: TfrmExchangeGpsDataFromGov
  Left = 459
  Top = 328
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #19982#25919#24220#24179#21488#20132#25442#25351#23450#36710#36742#23450#20301#20449#24687
  ClientHeight = 216
  ClientWidth = 308
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
    Width = 308
    Height = 216
    Align = alClient
    Color = 16773091
    TabOrder = 0
    object RzBitBtn1: TRzBitBtn
      Left = 56
      Top = 176
      Caption = #21457#36865
      Color = 15191501
      HotTrack = True
      TabOrder = 0
      OnClick = RzBitBtn1Click
    end
    object RzBitBtn2: TRzBitBtn
      Left = 168
      Top = 176
      Cancel = True
      ModalResult = 2
      Caption = #21462#28040
      Color = 15191501
      HotTrack = True
      TabOrder = 1
      NumGlyphs = 2
    end
    object GroupBox1: TGroupBox
      Left = 21
      Top = 8
      Width = 265
      Height = 154
      Caption = #36710#36742#20449#24687
      TabOrder = 2
      object Label1: TLabel
        Left = 34
        Top = 29
        Width = 51
        Height = 13
        Caption = #36710#29260#21495#65306' '
      end
      object Label2: TLabel
        Left = 22
        Top = 61
        Width = 66
        Height = 13
        Caption = #36710#29260#39068#33394#65306'  '
      end
      object Label3: TLabel
        Left = 22
        Top = 94
        Width = 66
        Height = 13
        Caption = #24320#22987#26102#38388#65306'  '
      end
      object Label4: TLabel
        Left = 22
        Top = 126
        Width = 66
        Height = 13
        Caption = #32467#26463#26102#38388#65306'  '
      end
      object edtCarNo: TEdit
        Left = 90
        Top = 25
        Width = 95
        Height = 21
        MaxLength = 21
        TabOrder = 0
      end
      object cbxCarCpColor: TComboBox
        Left = 90
        Top = 56
        Width = 95
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 1
        Text = #34013#29260
        OnKeyPress = cbxCarCpColorKeyPress
        Items.Strings = (
          #34013#29260
          #40644#29260
          #40657#29260
          #30333#29260
          #20854#23427)
      end
      object sDate: TDateTimePicker
        Left = 90
        Top = 87
        Width = 80
        Height = 21
        Date = 40785.665959201390000000
        Format = 'yyyy-MM-dd'
        Time = 40785.665959201390000000
        TabOrder = 2
      end
      object sTime: TDateTimePicker
        Left = 170
        Top = 87
        Width = 71
        Height = 21
        Date = 40785.665999340280000000
        Time = 40785.665999340280000000
        Kind = dtkTime
        TabOrder = 3
      end
      object eDate: TDateTimePicker
        Left = 90
        Top = 118
        Width = 80
        Height = 21
        Date = 40785.666023032400000000
        Format = 'yyyy-MM-dd'
        Time = 40785.666023032400000000
        TabOrder = 4
      end
      object eTime: TDateTimePicker
        Left = 170
        Top = 118
        Width = 71
        Height = 21
        Date = 40785.666045092590000000
        Time = 40785.666045092590000000
        Kind = dtkTime
        TabOrder = 5
      end
    end
  end
end
