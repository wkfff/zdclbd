object frmRecord: TfrmRecord
  Left = 491
  Top = 296
  Width = 366
  Height = 281
  BorderIcons = [biSystemMenu]
  Caption = #24405#38899#24320#22987'/'#32467#26463
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 216
    Width = 358
    Height = 31
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvNone
    Color = 16382438
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 87
      Top = 4
      Width = 78
      Height = 25
      Caption = #21457#36865' &S'
      Default = True
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDD0000000DDDDDDDDDDDD0DDDD0000000DDDDDDD00DDDD0DDD0000000DDDD
        DD080DDDDD0DD0000000DDDDD0880DD0DDD0D0000000DD0008870DDD0DD0D000
        0000D08888770D0DD0DD00000000D07B7B7B0DD0D0DD00000000D0B7B7B70DD0
        D0DD00000000D0BBBBBB0DD0D0DD00000000D07777BB0D0DD0DD00000000DD00
        08770DDD0DD0D0000000DDDDD0870DD0DDD0D0000000DDDDDD080DDDDD0DD000
        0000DDDDDDD00DDDD0DDD0000000DDDDDDDDDDDD0DDDD0000000DDDDDDDDDDDD
        DDDDD0000000}
    end
    object BitBtn2: TBitBtn
      Left = 215
      Top = 4
      Width = 78
      Height = 25
      Cancel = True
      Caption = #21462#28040' &C'
      ModalResult = 2
      TabOrder = 1
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      NumGlyphs = 2
    end
  end
  object Panel1: TPanel
    Left = 235
    Top = 0
    Width = 123
    Height = 216
    Align = alRight
    Caption = 'Panel1'
    Color = 16382438
    TabOrder = 1
    object ListView1: TListView
      Left = 1
      Top = 1
      Width = 121
      Height = 184
      Align = alClient
      Columns = <
        item
          Caption = #36710#29260#21495
          Width = 105
        end>
      GridLines = True
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
    end
    object Panel5: TPanel
      Left = 1
      Top = 185
      Width = 121
      Height = 30
      Align = alBottom
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 1
      object BitBtnSel: TBitBtn
        Left = 2
        Top = 3
        Width = 61
        Height = 25
        Caption = #37325#26032#36873#25321
        TabOrder = 0
        OnClick = BitBtnSelClick
      end
      object BitBtn3: TBitBtn
        Left = 63
        Top = 3
        Width = 53
        Height = 25
        Caption = #31227#38500
        TabOrder = 1
        OnClick = BitBtn3Click
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 235
    Height = 216
    Align = alClient
    BevelOuter = bvLowered
    Color = 16382438
    TabOrder = 2
    object Label1: TLabel
      Left = 21
      Top = 34
      Width = 60
      Height = 13
      Caption = #24405#38899#21629#20196#65306
    end
    object Label2: TLabel
      Left = 21
      Top = 79
      Width = 60
      Height = 13
      Caption = #24405#38899#26102#38388#65306
    end
    object Label3: TLabel
      Left = 21
      Top = 125
      Width = 60
      Height = 13
      Caption = #20445#23384#26631#24535#65306
    end
    object Label4: TLabel
      Left = 9
      Top = 170
      Width = 72
      Height = 13
      Caption = #38899#39057#37319#26679#29575#65306
    end
    object ComboBox1: TComboBox
      Left = 87
      Top = 30
      Width = 119
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 0
      Text = #20572#27490#24405#38899
      OnKeyPress = ComboBox1KeyPress
      Items.Strings = (
        #20572#27490#24405#38899
        #24320#22987#24405#38899)
    end
    object Edit1: TEdit
      Left = 87
      Top = 75
      Width = 119
      Height = 21
      TabOrder = 1
      Text = '0'
      OnChange = Edit1Change
      OnKeyPress = Edit1KeyPress
    end
    object ComboBox2: TComboBox
      Left = 87
      Top = 121
      Width = 119
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 1
      TabOrder = 2
      Text = #20445#23384
      OnKeyPress = ComboBox1KeyPress
      Items.Strings = (
        #23454#26102#19978#20256
        #20445#23384)
    end
    object ComboBox3: TComboBox
      Left = 87
      Top = 166
      Width = 119
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 3
      Text = '8K'
      OnKeyPress = ComboBox1KeyPress
      Items.Strings = (
        '8K'
        '11K'
        '23K'
        '32K')
    end
  end
end
