object CancelOrderMenu2Frm: TCancelOrderMenu2Frm
  Left = 212
  Top = 203
  Width = 691
  Height = 455
  Caption = #20462#25913#21462#28040#35746#21333#30340#33756#21333
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel5: TPanel
    Left = 0
    Top = 41
    Width = 554
    Height = 353
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object Panel6: TPanel
      Left = 2
      Top = 2
      Width = 550
      Height = 349
      Align = alClient
      BevelInner = bvLowered
      TabOrder = 0
      object cxTreeListFrom: TcxTreeList
        Left = 2
        Top = 2
        Width = 248
        Height = 345
        Align = alLeft
        Bands = <
          item
            Caption.Text = 'Band1'
            Width = 126
          end>
        BufferedPaint = False
        OptionsData.Editing = False
        OptionsData.Deleting = False
        OptionsView.GridLines = tlglBoth
        OptionsView.ShowRoot = False
        TabOrder = 0
        object cxTreeListFromcxTreeListColumn1: TcxTreeListColumn
          Caption.Text = #32534#21495
          DataBinding.ValueType = 'Integer'
          Width = 36
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListFromcxTreeListColumn2: TcxTreeListColumn
          Caption.Text = #21517#31216
          DataBinding.ValueType = 'String'
          Width = 190
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
          SortOrder = soAscending
        end
      end
      object cxTreeListTo: TcxTreeList
        Left = 300
        Top = 2
        Width = 248
        Height = 345
        Align = alRight
        Bands = <
          item
            Caption.Text = 'Band1'
            Width = 126
          end>
        BufferedPaint = False
        OptionsData.Editing = False
        OptionsData.Deleting = False
        OptionsView.GridLines = tlglBoth
        OptionsView.ShowRoot = False
        TabOrder = 1
        object cxTreeListTocxTreeListColumn1: TcxTreeListColumn
          Caption.Text = #32534#21495
          DataBinding.ValueType = 'Integer'
          Width = 38
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListTocxTreeListColumn2: TcxTreeListColumn
          Caption.Text = #21517#31216
          DataBinding.ValueType = 'String'
          Width = 188
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
          SortOrder = soAscending
        end
      end
      object Panel2: TPanel
        Left = 250
        Top = 2
        Width = 50
        Height = 345
        Align = alClient
        TabOrder = 2
        object BitBtn1: TBitBtn
          Left = 1
          Top = 71
          Width = 49
          Height = 25
          Caption = '>'
          TabOrder = 0
          OnClick = BitBtn1Click
        end
        object BitBtn2: TBitBtn
          Left = 1
          Top = 112
          Width = 49
          Height = 25
          Caption = '>>'
          TabOrder = 1
          OnClick = BitBtn2Click
        end
        object BitBtn4: TBitBtn
          Left = 1
          Top = 152
          Width = 49
          Height = 25
          Caption = '<'
          TabOrder = 2
          OnClick = BitBtn4Click
        end
        object BitBtn5: TBitBtn
          Left = 1
          Top = 192
          Width = 49
          Height = 25
          Caption = '<<'
          TabOrder = 3
          OnClick = BitBtn5Click
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 683
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    Caption = #20462#25913#21462#28040#35746#21333#30340#33756#21333
    Color = clSkyBlue
    Font.Charset = GB2312_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object Panel3: TPanel
    Left = 0
    Top = 394
    Width = 683
    Height = 34
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 2
    object BitBtnOK: TBitBtn
      Left = 520
      Top = 5
      Width = 75
      Height = 25
      Caption = #21457#36865'&S'
      TabOrder = 1
      OnClick = BitBtnOKClick
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
    object BitBtnClose: TBitBtn
      Left = 594
      Top = 5
      Width = 75
      Height = 25
      Cancel = True
      Caption = #20851#38381'&C'
      TabOrder = 0
      OnClick = BitBtnCloseClick
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
    object ProgressBar1: TProgressBar
      Left = 7
      Top = 7
      Width = 498
      Height = 20
      TabOrder = 2
      Visible = False
    end
  end
  object Panel4: TPanel
    Left = 554
    Top = 41
    Width = 129
    Height = 353
    Align = alRight
    BevelInner = bvLowered
    TabOrder = 3
    object ListView1: TListView
      Left = 2
      Top = 2
      Width = 125
      Height = 321
      Align = alClient
      Columns = <
        item
          AutoSize = True
          Caption = #21457#36865#20197#19979#36710#29260#21495
        end>
      GridLines = True
      MultiSelect = True
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
      OnClick = ListView1Click
    end
    object Panel8: TPanel
      Left = 2
      Top = 323
      Width = 125
      Height = 28
      Align = alBottom
      Caption = 'Panel8'
      TabOrder = 1
      object BitBtnSel: TBitBtn
        Left = 1
        Top = 2
        Width = 62
        Height = 25
        Hint = #37325#26032#36873#25321#36710#36742
        Caption = #37325#26032#36873#25321
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = BitBtnSelClick
      end
      object BitBtn3: TBitBtn
        Left = 62
        Top = 2
        Width = 62
        Height = 25
        Caption = #31227#38500
        TabOrder = 1
        OnClick = BitBtn3Click
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333000033338833333333333333333F333333333333
          0000333911833333983333333388F333333F3333000033391118333911833333
          38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
          911118111118333338F3338F833338F3000033333911111111833333338F3338
          3333F8330000333333911111183333333338F333333F83330000333333311111
          8333333333338F3333383333000033333339111183333333333338F333833333
          00003333339111118333333333333833338F3333000033333911181118333333
          33338333338F333300003333911183911183333333383338F338F33300003333
          9118333911183333338F33838F338F33000033333913333391113333338FF833
          38F338F300003333333333333919333333388333338FFF830000333333333333
          3333333333333333333888330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
    end
  end
end
