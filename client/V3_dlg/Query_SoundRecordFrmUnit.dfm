object Query_SoundRecordFrm: TQuery_SoundRecordFrm
  Left = 154
  Top = 118
  Width = 1033
  Height = 533
  Caption = #24405#38899#20449#24687
  Color = clBtnFace
  DragKind = dkDock
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
    Height = 506
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    object PageControl2: TPageControl
      Left = 0
      Top = 0
      Width = 203
      Height = 473
      ActivePage = TabSheet2
      Align = alClient
      TabOrder = 0
      object TabSheet2: TTabSheet
        Caption = #36710#36742
        object TreeView1: TTreeView
          Left = 0
          Top = 0
          Width = 195
          Height = 445
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
      Top = 473
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
    Width = 814
    Height = 506
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 1
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 812
      Height = 504
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
        Caption = #26597#35810#24405#38899#20449#24687
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 804
          Height = 476
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object Panel3: TPanel
            Left = 1
            Top = 1
            Width = 802
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
              Left = 479
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
              Left = 35
              Top = 57
              Width = 39
              Height = 13
              Caption = #26102#38388#65306
            end
            object SpeedButton3: TSpeedButton
              Left = 553
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
            object Label1: TLabel
              Left = 267
              Top = 25
              Width = 65
              Height = 13
              Caption = #24405#38899#21407#22240#65306
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
            object BitBtnToExcel: TBitBtn
              Left = 806
              Top = 42
              Width = 73
              Height = 24
              Caption = 'Excel'
              TabOrder = 3
              Visible = False
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
              TabOrder = 4
            end
            object toTime: TDateTimePicker
              Left = 366
              Top = 53
              Width = 80
              Height = 21
              Date = 40061.999988425930000000
              Time = 40061.999988425930000000
              Kind = dtkTime
              TabOrder = 5
            end
            object BitBtn2: TBitBtn
              Left = 627
              Top = 33
              Width = 73
              Height = 24
              Caption = #36864#20986
              TabOrder = 6
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
              Left = 331
              Top = 21
              Width = 114
              Height = 21
              ItemHeight = 13
              ItemIndex = 0
              TabOrder = 7
              Text = #25152#26377
              Items.Strings = (
                #25152#26377
                #27491#24120#24405#38899
                #25237#35785#24405#38899
                #25253#35686#24405#38899)
            end
          end
          object Panel4: TPanel
            Left = 1
            Top = 99
            Width = 802
            Height = 376
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object DBGridEh1: TDBGridEh
              Left = 0
              Top = 0
              Width = 802
              Height = 376
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
              Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
              OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDialogFind]
              ParentCtl3D = False
              PopupMenu = PopupMenu1
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
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'Record_Id'
                  Footers = <>
                  Title.Caption = #24405#38899#32534#21495
                  Title.TitleButton = True
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
                  FieldName = 'RecordBeginTime'
                  Footers = <>
                  Title.Caption = #24320#22987#26102#38388
                  Title.TitleButton = True
                  Width = 149
                end
                item
                  EditButtons = <>
                  FieldName = 'RecordEndTime'
                  Footers = <>
                  Title.Caption = #32467#26463#26102#38388
                  Title.TitleButton = True
                  Width = 149
                end
                item
                  DisplayFormat = '0.000'
                  EditButtons = <>
                  FieldName = 'BeginLatitude'
                  Footers = <>
                  Title.Caption = #24320#22987#28857#32428#24230
                  Title.TitleButton = True
                  Width = 80
                end
                item
                  DisplayFormat = '0.000'
                  EditButtons = <>
                  FieldName = 'BeginLongitude'
                  Footers = <>
                  Title.Caption = #24320#22987#28857#32463#24230
                  Title.TitleButton = True
                  Width = 80
                end
                item
                  DisplayFormat = '0.000'
                  EditButtons = <>
                  FieldName = 'EndLatitude'
                  Footers = <>
                  Title.Caption = #32467#26463#28857#32428#24230
                  Title.TitleButton = True
                  Width = 80
                end
                item
                  DisplayFormat = '0.000'
                  EditButtons = <>
                  FieldName = 'EndLongitude'
                  Footers = <>
                  Title.Caption = #32467#26463#28857#32463#24230
                  Title.TitleButton = True
                  Width = 80
                end
                item
                  EditButtons = <>
                  FieldName = 'RecordReasonId'
                  Footers = <>
                  Title.Caption = #24405#38899#21407#22240
                  Title.TitleButton = True
                  Width = 120
                  OnUpdateData = DBGridEh1Columns10UpdateData
                end
                item
                  EditButtons = <>
                  FieldName = 'RecordFileIdInMCU'
                  Footers = <>
                  Title.TitleButton = True
                  Visible = False
                end>
            end
          end
          object cxSplitter2: TcxSplitter
            Left = 1
            Top = 91
            Width = 802
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
    Height = 506
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
  object PopupMenu1: TPopupMenu
    Left = 545
    Top = 188
    object N1: TMenuItem
      Caption = #25171#24320#24405#38899
      OnClick = N1Click
    end
  end
end
