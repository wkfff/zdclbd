object call_dev: Tcall_dev
  Left = 297
  Top = 340
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #26597#35810#20301#32622
  ClientHeight = 283
  ClientWidth = 308
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 252
    Width = 308
    Height = 31
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvNone
    Color = 16382438
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 69
      Top = 4
      Width = 89
      Height = 25
      Caption = #21628#21483' &S'
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
      Left = 157
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
  object Panel_Devs: TPanel
    Left = 0
    Top = 0
    Width = 308
    Height = 252
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 1
    object Panel6: TPanel
      Left = 1
      Top = 1
      Width = 146
      Height = 250
      Align = alClient
      Color = 16382438
      TabOrder = 2
      object Panel8: TPanel
        Left = 1
        Top = 1
        Width = 144
        Height = 30
        Align = alTop
        BevelInner = bvLowered
        BevelOuter = bvNone
        Caption = #20301#32622#26597#35810
        Color = 15265488
        Font.Charset = GB2312_CHARSET
        Font.Color = 16512
        Font.Height = -16
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object Panel4: TPanel
      Left = 17
      Top = 59
      Width = 88
      Height = 19
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = #26597#35810#20197#19979#36710#36742#65306
      ParentColor = True
      TabOrder = 0
      Visible = False
    end
    object Panel1: TPanel
      Left = 147
      Top = 1
      Width = 160
      Height = 250
      Align = alRight
      Caption = 'Panel1'
      Color = 16382438
      TabOrder = 1
      object ListView1: TListView
        Left = 1
        Top = 1
        Width = 158
        Height = 207
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
      object Panel5: TPanel
        Left = 1
        Top = 208
        Width = 158
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 1
        object BitBtnSel: TBitBtn
          Left = 4
          Top = 8
          Width = 75
          Height = 25
          Caption = #37325#26032#36873#25321
          TabOrder = 0
          OnClick = BitBtnSelClick
        end
        object BitBtn3: TBitBtn
          Left = 80
          Top = 8
          Width = 75
          Height = 25
          Caption = #31227#38500
          TabOrder = 1
          OnClick = BitBtn3Click
        end
      end
    end
  end
end
