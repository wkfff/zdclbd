object queryordertjfrm: Tqueryordertjfrm
  Left = 285
  Top = 150
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #35746#21333#26597#35810#26465#20214
  ClientHeight = 334
  ClientWidth = 474
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 22
    Top = 15
    Width = 429
    Height = 273
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #35746#21333#26597#35810
      object GroupBox1: TGroupBox
        Left = 13
        Top = 8
        Width = 394
        Height = 222
        TabOrder = 0
        object Label1: TLabel
          Left = 10
          Top = 19
          Width = 65
          Height = 13
          Caption = #35746#21333#31867#22411#65306
        end
        object Label2: TLabel
          Left = 10
          Top = 55
          Width = 7
          Height = 13
        end
        object Label5: TLabel
          Left = 10
          Top = 115
          Width = 65
          Height = 13
          Caption = #23458#25143#30005#35805#65306
        end
        object Label3: TLabel
          Left = 256
          Top = 49
          Width = 13
          Height = 13
          Caption = #26085
        end
        object Label6: TLabel
          Left = 257
          Top = 83
          Width = 13
          Height = 13
          Caption = #26085
        end
        object Label7: TLabel
          Left = 10
          Top = 184
          Width = 65
          Height = 13
          Caption = #25805#20316#20154#21592#65306
        end
        object Label8: TLabel
          Left = 12
          Top = 147
          Width = 52
          Height = 13
          Caption = #36710#29260#21495#65306
        end
        object ComboBox1: TComboBox
          Left = 96
          Top = 15
          Width = 145
          Height = 21
          ItemHeight = 13
          TabOrder = 0
          Items.Strings = (
            #21363#26102#23450#21333
            #39044#32422#23450#21333)
        end
        object DateTimePicker1: TDateTimePicker
          Left = 96
          Top = 46
          Width = 146
          Height = 21
          Date = 38609.365810185180000000
          Format = 'yyyy-MM-dd'
          Time = 38609.365810185180000000
          TabOrder = 1
        end
        object DateTimePicker2: TDateTimePicker
          Left = 283
          Top = 46
          Width = 84
          Height = 21
          Date = 38609.966099537040000000
          Format = 'HH:mm:ss'
          Time = 38609.966099537040000000
          DateFormat = dfLong
          Kind = dtkTime
          TabOrder = 2
        end
        object Edit1: TEdit
          Left = 96
          Top = 112
          Width = 147
          Height = 21
          TabOrder = 3
        end
        object DateTimePicker3: TDateTimePicker
          Left = 97
          Top = 80
          Width = 146
          Height = 21
          Date = 38609.365810185180000000
          Format = 'yyyy-MM-dd'
          Time = 38609.365810185180000000
          TabOrder = 4
        end
        object DateTimePicker4: TDateTimePicker
          Left = 284
          Top = 80
          Width = 84
          Height = 21
          Date = 38609.616064814820000000
          Format = 'HH:mm:ss'
          Time = 38609.616064814820000000
          DateFormat = dfLong
          Kind = dtkTime
          TabOrder = 5
        end
        object CheckBox1: TCheckBox
          Left = 10
          Top = 51
          Width = 78
          Height = 17
          Caption = #21457#36865#26085#26399#65306
          Checked = True
          State = cbChecked
          TabOrder = 6
        end
        object GroupBox2: TGroupBox
          Left = 93
          Top = 170
          Width = 277
          Height = 44
          TabOrder = 7
          object RadioButton1: TRadioButton
            Left = 16
            Top = 16
            Width = 113
            Height = 17
            Caption = #24403#21069#29992#25143
            Checked = True
            TabOrder = 0
            TabStop = True
          end
          object RadioButton2: TRadioButton
            Left = 144
            Top = 16
            Width = 113
            Height = 17
            Caption = #25152#26377#29992#25143
            TabOrder = 1
          end
        end
        object ComboBoxCarNO: TComboBox
          Left = 96
          Top = 143
          Width = 272
          Height = 21
          ItemHeight = 13
          Sorted = True
          TabOrder = 8
        end
      end
    end
  end
  object BitBtn1: TBitBtn
    Left = 279
    Top = 296
    Width = 75
    Height = 25
    Caption = #30830#35748
    ModalResult = 1
    TabOrder = 1
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 375
    Top = 296
    Width = 75
    Height = 25
    Cancel = True
    Caption = #21462#28040
    TabOrder = 2
    OnClick = BitBtn2Click
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777700777777
      77777770E07777777777770EE0777777777700EEE0000000000070EEE0888077
      777770EEE0888077777770EEE0888077777770EEE0888077777770EEE0888077
      707770EEE0888077007770EEE0888070000070EEE0888077007770EEE0888077
      707770EE08888077777770E08888807777777000000000777777}
  end
  object CheckBox2: TCheckBox
    Left = 40
    Top = 301
    Width = 89
    Height = 22
    Caption = #24555#36895#26597#35810
    TabOrder = 3
  end
end
