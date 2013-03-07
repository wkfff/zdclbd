object CutOilElecForm: TCutOilElecForm
  Left = 322
  Top = 324
  BorderStyle = bsSingle
  Caption = #35774#32622#26029#27833#26029#30005
  ClientHeight = 235
  ClientWidth = 329
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel8: TPanel
    Left = 0
    Top = 0
    Width = 329
    Height = 34
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    Caption = #35774#32622#26029#27833#26029#30005
    Color = 15265488
    Font.Charset = GB2312_CHARSET
    Font.Color = 16512
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Panel_Devs: TPanel
    Left = 0
    Top = 34
    Width = 329
    Height = 170
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 1
    object Panel1: TPanel
      Left = 196
      Top = 1
      Width = 132
      Height = 146
      Align = alRight
      Caption = 'Panel1'
      TabOrder = 0
      object ListView1: TListView
        Left = 1
        Top = 1
        Width = 130
        Height = 144
        Align = alClient
        Columns = <
          item
            AutoSize = True
            Caption = #36710#29260#21495
          end>
        GridLines = True
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
    object ProgressBar1: TProgressBar
      Left = 1
      Top = 147
      Width = 327
      Height = 22
      Align = alBottom
      TabOrder = 1
      Visible = False
    end
    object Panel3: TPanel
      Left = 17
      Top = 1
      Width = 179
      Height = 146
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel3'
      TabOrder = 2
      object RadioGroup1: TRadioGroup
        Left = 0
        Top = 19
        Width = 179
        Height = 127
        Align = alClient
        Caption = #35774#32622#31867#22411
        Items.Strings = (
          '  '#26029'  '#27833
          '  '#26029'  '#30005
          '  '#20379'  '#27833
          '  '#20379'  '#30005)
        TabOrder = 0
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 179
        Height = 19
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = #35774#32622#20197#19979#36710#36742#65306
        TabOrder = 1
      end
    end
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 16
      Height = 146
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 3
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 204
    Width = 329
    Height = 31
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 75
      Top = 4
      Width = 89
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
      Left = 163
      Top = 4
      Width = 89
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
end
