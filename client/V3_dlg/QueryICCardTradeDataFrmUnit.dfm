object QueryICCardTradeDataFrm: TQueryICCardTradeDataFrm
  Left = -43
  Top = 100
  Width = 1243
  Height = 629
  Caption = #26597#35810#21047#21345#35760#24405
  Color = clBtnFace
  DragKind = dkDock
  DragMode = dmAutomatic
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel7: TPanel
    Left = 0
    Top = 0
    Width = 203
    Height = 595
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    object PageControl2: TPageControl
      Left = 0
      Top = 0
      Width = 203
      Height = 562
      ActivePage = TabSheet2
      Align = alClient
      TabOrder = 0
      object TabSheet2: TTabSheet
        Caption = #36710#36742
        object TreeView1: TTreeView
          Left = 0
          Top = 0
          Width = 195
          Height = 534
          Align = alClient
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Indent = 19
          ParentFont = False
          ReadOnly = True
          SortType = stText
          TabOrder = 0
          OnClick = TreeView1Click
        end
      end
    end
    object PanelSelectGroupName: TPanel
      Left = 0
      Top = 562
      Width = 203
      Height = 33
      Align = alBottom
      BevelInner = bvLowered
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
  object Panel1: TPanel
    Left = 211
    Top = 0
    Width = 1024
    Height = 595
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 1
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 1022
      Height = 593
      ActivePage = TabSheet1
      Align = alClient
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = #26597#35810#19968#21345#36890#21047#21345#20132#26131#35760#24405
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 1014
          Height = 565
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object Panel3: TPanel
            Left = 1
            Top = 1
            Width = 1012
            Height = 90
            Align = alTop
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object Label5: TLabel
              Left = 256
              Top = 57
              Width = 7
              Height = 13
              Caption = '-'
            end
            object Label2: TLabel
              Left = 22
              Top = 25
              Width = 52
              Height = 13
              Caption = #36710#29260#21495#65306
              Font.Charset = GB2312_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object SpeedButtonOneTime: TSpeedButton
              Left = 509
              Top = 33
              Width = 73
              Height = 24
              Caption = #26597#35810
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
              OnClick = SpeedButtonOneTimeClick
            end
            object Label3: TLabel
              Left = 12
              Top = 57
              Width = 65
              Height = 13
              Caption = #20132#26131#26102#38388#65306
            end
            object SpeedButton3: TSpeedButton
              Left = 583
              Top = 33
              Width = 73
              Height = 24
              Caption = #25171#21360
              Glyph.Data = {
                66010000424D6601000000000000760000002800000014000000140000000100
                040000000000F000000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                DDDDDDDD0000DDDDDDDDDDDDDDDDDDDD0000DDDDD7777777777DDDDD0000DDDD
                000000000007DDDD0000DDD07878787870707DDD0000DD0000000000000707DD
                0000DD0F8F8F8AAA8F0007DD0000DD08F8F8F999F80707DD0000DD0000000000
                0008707D0000DD08F8F8F8F8F080807D0000DDD0000000000F08007D0000DDDD
                0BFFFBFFF0F080DD0000DDDDD0F00000F0000DDD0000DDDDD0FBFFFBFF0DDDDD
                0000DDDDDD0F00000F0DDDDD0000DDDDDD0FFBFFFBF0DDDD0000DDDDDDD00000
                0000DDDD0000DDDDDDDDDDDDDDDDDDDD0000DDDDDDDDDDDDDDDDDDDD0000DDDD
                DDDDDDDDDDDDDDDD0000}
              OnClick = SpeedButton3Click
            end
            object SpeedButton4: TSpeedButton
              Left = 842
              Top = 27
              Width = 73
              Height = 24
              Caption = #36864#20986
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777700777777
                77777770E07777777777770EE0777777777700EEE0000000000070EEE0888077
                777770EEE0888077777770EEE0888077777770EEE0888077777770EEE0888077
                707770EEE0888077007770EEE0888070000070EEE0888077007770EEE0888077
                707770EE08888077777770E08888807777777000000000777777}
              Visible = False
            end
            object Label6: TLabel
              Left = 504
              Top = 75
              Width = 91
              Height = 13
              Caption = #26159#21542#25171#21360#21457#31080#65306
              Visible = False
            end
            object Label7: TLabel
              Left = 751
              Top = 68
              Width = 131
              Height = 13
              Caption = '('#20026#31354#26102#34920#31034#25152#26377#31867#22411')'
              Font.Charset = GB2312_CHARSET
              Font.Color = clMaroon
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
              Visible = False
            end
            object Label1: TLabel
              Left = 268
              Top = 25
              Width = 65
              Height = 13
              Caption = #32467#31639#26041#24335#65306
            end
            object DateTimePicker1: TDateTimePicker
              Left = 71
              Top = 53
              Width = 97
              Height = 21
              Date = 38699.755564791670000000
              Time = 38699.755564791670000000
              TabOrder = 0
            end
            object DateTimePicker2: TDateTimePicker
              Left = 269
              Top = 53
              Width = 96
              Height = 21
              Date = 38699.755564791670000000
              Time = 38699.755564791670000000
              TabOrder = 1
            end
            object ComboBox2: TComboBox
              Left = 72
              Top = 21
              Width = 129
              Height = 21
              ItemHeight = 13
              TabOrder = 2
            end
            object ComboBoxIsPrint: TComboBox
              Left = 607
              Top = 70
              Width = 162
              Height = 21
              Hint = '('#20026#31354#26102#34920#31034#25152#26377#31867#22411')'
              ItemHeight = 13
              ItemIndex = 1
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
              Text = 'IC'#21345#20132#26131
              Visible = False
              Items.Strings = (
                #29616#37329#20132#26131
                'IC'#21345#20132#26131
                #29616#37329#20132#26131#25171#21360#21457#31080
                'IC'#21345#20132#26131#24182#25171#21360#21457#31080)
            end
            object BitBtnToExcel: TBitBtn
              Left = 657
              Top = 33
              Width = 73
              Height = 24
              Caption = 'Excel'
              TabOrder = 4
              OnClick = BitBtnToExcelClick
              Glyph.Data = {
                A6020000424DA60200000000000036000000280000000F0000000D0000000100
                18000000000070020000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4E2E3A1CCAAA7CEACA7CD
                ACA5CEADCCE9D5000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFDEC8DA0043000AA634079E2F0BA634008508778772000000FFFFFF001200
                002F00002A00002D00003000002F00002A00004C0023BB4F22AD4B24B04F07A4
                2F1C441DFFFFFF000000FFFFFF1F4724008A13098D2507932C0D952E149D3300
                7F1631C35E2FC05C22B65314AE401A6326FFFFFFFFFFFF000000FFFFFFFFFFFF
                1F682A00841912932D11963400791838BA6546D57836C86D36C561002E00FFFF
                FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF288C3908982E028A1F2EAE505B
                F1994FDB844DE489037A19008515DDE5DCFFFFFFFFFFFF000000FFFFFFFFFFFF
                FFFFFFDEC8DA005100219F4280FFC061ECA065FCA80A87221DB7501EBD4F006B
                00D6DAD5FFFFFF000000FFFFFFFFFFFFFFFFFFDFD2DA00720EA8FFDF89F8B78F
                FFC91D993E007B0F003000002C00002D0008400FFFFFFF000000FFFFFFFFFFFF
                D2BFCF004500C5FFE8B6FFD5BCFFE14DB26425B35034CD67367F3FFFFFFFFFFF
                FFFFFFFFFFFFFF000000FFFFFFFFFFFF167B24A8FFD5D5FFE8F8FFFF96DCAA00
                8F2352E68F54DF8B27C157164A14FFFFFFFFFFFFFFFFFF000000FFFFFF0E5810
                74F2A6B9FFD8E9FFF7E1F2E813631A2D6F344EE6895DF39F4DE58C08A4357B8B
                79FFFFFFFFFFFF000000456E4519BF516BEA9B7CE9A39BE4B5167B1EFFFFFFFF
                FFFF00230036D47328C05B1BB94E006700C4CEC4FFFFFF000000C0E1C7A1C7A5
                9DC1A19AC19F91C399DAD1DBFFFFFFFFFFFFE3DEE39CC8A0A4CAA7A5CCAAA6CE
                ADCFE6D4FFFFFF000000}
            end
            object fromTime: TDateTimePicker
              Left = 168
              Top = 53
              Width = 80
              Height = 21
              Date = 40061.000000000000000000
              Time = 40061.000000000000000000
              Kind = dtkTime
              TabOrder = 5
            end
            object toTime: TDateTimePicker
              Left = 366
              Top = 53
              Width = 80
              Height = 21
              Date = 40061.999988425930000000
              Time = 40061.999988425930000000
              Kind = dtkTime
              TabOrder = 6
            end
            object BitBtn2: TBitBtn
              Left = 731
              Top = 33
              Width = 73
              Height = 24
              Caption = #36864#20986
              TabOrder = 7
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
            object ComboBox1: TComboBox
              Left = 340
              Top = 21
              Width = 105
              Height = 21
              ItemHeight = 13
              ItemIndex = 0
              TabOrder = 8
              Text = #25152#26377
              Items.Strings = (
                #25152#26377
                #26410#32467#31639
                #25104#21151#32467#31639)
            end
          end
          object Panel4: TPanel
            Left = 1
            Top = 99
            Width = 1012
            Height = 465
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object DBGridEh1: TDBGridEh
              Left = 0
              Top = 0
              Width = 1012
              Height = 465
              Align = alClient
              Ctl3D = True
              Flat = True
              FooterColor = clWindow
              FooterFont.Charset = GB2312_CHARSET
              FooterFont.Color = clWindowText
              FooterFont.Height = -13
              FooterFont.Name = #23435#20307
              FooterFont.Style = []
              FooterRowCount = 1
              Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDialogFind]
              ParentCtl3D = False
              ReadOnly = True
              RowHeight = 4
              RowLines = 1
              SortLocal = True
              SumList.Active = True
              TabOrder = 0
              TitleFont.Charset = GB2312_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -13
              TitleFont.Name = #23435#20307
              TitleFont.Style = []
              UseMultiTitle = True
              OnCellClick = DBGridEh1CellClick
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'Data_Id'
                  Footers = <>
                  Title.TitleButton = True
                  Visible = False
                end
                item
                  EditButtons = <>
                  FieldName = 'Fact_Id'
                  Footer.Value = #21512#35745#65306
                  Footer.ValueType = fvtStaticText
                  Footers = <>
                  Title.Caption = #21378#23478#32534#21495
                  Title.TitleButton = True
                  Width = 63
                end
                item
                  EditButtons = <>
                  FieldName = 'Dev_Id'
                  Footer.ValueType = fvtCount
                  Footers = <>
                  Title.Caption = #36710#26426#32534#21495
                  Title.TitleButton = True
                  Width = 67
                end
                item
                  EditButtons = <>
                  FieldName = 'CAR_NO'
                  Footers = <>
                  Title.Caption = #36710#29260#21495
                  Title.TitleButton = True
                  Width = 87
                end
                item
                  EditButtons = <>
                  FieldName = 'ICCardNo'
                  Footers = <>
                  Title.Caption = #20132#26131#21345#21495
                  Title.TitleButton = True
                  Width = 87
                end
                item
                  EditButtons = <>
                  FieldName = 'POSMachineNo'
                  Footers = <>
                  Title.Caption = 'POS '#26426#32534#21495
                  Title.TitleButton = True
                  Width = 94
                end
                item
                  DisplayFormat = '0.00'
                  EditButtons = <>
                  FieldName = 'CardVer'
                  Footers = <>
                  Title.Caption = #21345#20869#29256#26412#21495
                  Title.TitleButton = True
                  Visible = False
                  Width = 60
                end
                item
                  EditButtons = <>
                  FieldName = 'TradeType'
                  Footers = <>
                  Title.Caption = #20132#26131#31867#22411'(1'#27491#24120#65292'0'#38145#21345')'
                  Title.TitleButton = True
                  Visible = False
                  Width = 150
                end
                item
                  EditButtons = <>
                  FieldName = 'TRADETYPESTR'
                  Footers = <>
                  Title.Caption = #20132#26131#31867#22411
                  Width = 80
                end
                item
                  EditButtons = <>
                  FieldName = 'PSamCardNo'
                  Footers = <>
                  Title.Caption = 'PSAM'#21345#21345#21495
                  Title.TitleButton = True
                  Width = 80
                end
                item
                  EditButtons = <>
                  FieldName = 'TradeSerieNumber'
                  Footers = <>
                  Title.Caption = #32456#31471#20132#26131#27969#27700#21495
                  Title.TitleButton = True
                  Width = 100
                end
                item
                  EditButtons = <>
                  FieldName = 'CityCode'
                  Footers = <>
                  Title.Caption = #22478#24066#20195#30721
                  Title.TitleButton = True
                  Width = 80
                end
                item
                  EditButtons = <>
                  FieldName = 'CardIssueSerieNumber'
                  Footers = <>
                  Title.Caption = #21345#21457#34892#27969#27700#21495
                  Title.TitleButton = True
                  Width = 89
                end
                item
                  EditButtons = <>
                  FieldName = 'CardType'
                  Footers = <>
                  Title.Caption = #21345#31867#22411
                  Title.TitleButton = True
                  Visible = False
                  Width = 62
                end
                item
                  EditButtons = <>
                  FieldName = 'CARDTYPESTR'
                  Footers = <>
                  Title.Caption = #21345#31867#22411
                  Width = 80
                end
                item
                  DisplayFormat = '0.00'
                  EditButtons = <>
                  FieldName = 'ICCardMoney_Beforetrade'
                  Footers = <>
                  Title.Caption = #20132#26131#21069#20313#39069
                  Title.TitleButton = True
                  Width = 90
                end
                item
                  DisplayFormat = '0.00'
                  EditButtons = <>
                  FieldName = 'TradeMoney'
                  Footer.ValueType = fvtSum
                  Footers = <>
                  Title.Caption = #20132#26131#37329#39069
                  Title.TitleButton = True
                  Width = 69
                end
                item
                  EditButtons = <>
                  FieldName = 'TradeTime'
                  Footers = <>
                  Title.Caption = #20132#26131#26102#38388
                  Title.TitleButton = True
                  Width = 149
                end
                item
                  EditButtons = <>
                  FieldName = 'TradeNumber'
                  Footers = <>
                  Title.Caption = #21345#20132#26131#35745#25968#22120
                  Title.TitleButton = True
                  Width = 85
                end
                item
                  EditButtons = <>
                  FieldName = 'Tac'
                  Footers = <>
                  Title.Caption = #20132#26131#35748#35777#30721
                  Title.TitleButton = True
                  Width = 89
                end
                item
                  EditButtons = <>
                  FieldName = 'isupokStr'
                  Footer.ValueType = fvtCount
                  Footers = <>
                  Title.Caption = #26159#21542#32467#31639
                  Title.TitleButton = True
                  Width = 70
                end
                item
                  EditButtons = <>
                  FieldName = 'upoktime'
                  Footers = <>
                  Title.Caption = #32467#31639#26102#38388
                  Title.TitleButton = True
                  Width = 149
                end>
            end
          end
          object cxSplitter2: TcxSplitter
            Left = 1
            Top = 91
            Width = 1012
            Height = 8
            Cursor = crVSplit
            HotZoneClassName = 'TcxSimpleStyle'
            HotZone.SizePercent = 31
            AlignSplitter = salTop
            AutoSnap = True
            MinSize = 22
            ResizeUpdate = True
            Control = Panel3
          end
        end
      end
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 203
    Top = 0
    Width = 8
    Height = 595
    HotZoneClassName = 'TcxSimpleStyle'
    Control = Panel7
  end
  object PrintDBGridEh1: TPrintDBGridEh
    DBGridEh = DBGridEh1
    Options = [pghFitGridToPageWidth, pghColored]
    Page.BottomMargin = 1.000000000000000000
    Page.LeftMargin = 1.000000000000000000
    Page.RightMargin = 1.000000000000000000
    Page.TopMargin = 1.000000000000000000
    PageFooter.CenterText.Strings = (
      '')
    PageFooter.Font.Charset = GB2312_CHARSET
    PageFooter.Font.Color = clWindowText
    PageFooter.Font.Height = -13
    PageFooter.Font.Name = #23435#20307
    PageFooter.Font.Style = []
    PageHeader.CenterText.Strings = (
      '')
    PageHeader.Font.Charset = GB2312_CHARSET
    PageHeader.Font.Color = clWindowText
    PageHeader.Font.Height = -24
    PageHeader.Font.Name = #40657#20307
    PageHeader.Font.Style = []
    PrintFontName = #23435#20307
    Units = MM
    Left = 278
    Top = 207
  end
  object DataSource1: TDataSource
    Left = 318
    Top = 210
  end
end
