object taxiRunDataFrm: TtaxiRunDataFrm
  Left = 40
  Top = 75
  Width = 1226
  Height = 661
  Caption = #23458#27425#26126#32454
  Color = clBtnFace
  DragKind = dkDock
  DragMode = dmAutomatic
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 211
    Top = 0
    Width = 1007
    Height = 634
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 1005
      Height = 632
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
        Caption = #21333#23458#27425#20449#24687
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 997
          Height = 604
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object Panel3: TPanel
            Left = 1
            Top = 1
            Width = 995
            Height = 131
            Align = alTop
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object Label5: TLabel
              Left = 277
              Top = 57
              Width = 7
              Height = 13
              Caption = '-'
            end
            object Label2: TLabel
              Left = 45
              Top = 29
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
              Left = 732
              Top = 37
              Width = 90
              Height = 24
              Caption = #19968#27425#26597#35810
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
              Visible = False
              OnClick = SpeedButtonOneTimeClick
            end
            object Label3: TLabel
              Left = 32
              Top = 57
              Width = 65
              Height = 13
              Caption = #19978#36710#26102#38388#65306
            end
            object SpeedButton3: TSpeedButton
              Left = 551
              Top = 27
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
              Left = 699
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
              OnClick = SpeedButton4Click
            end
            object Label6: TLabel
              Left = 501
              Top = 59
              Width = 91
              Height = 13
              Caption = #26159#21542#25171#21360#21457#31080#65306
              Visible = False
            end
            object Label7: TLabel
              Left = 767
              Top = 60
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
            object SpeedButtonPage: TSpeedButton
              Left = 797
              Top = 3
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
              Visible = False
            end
            object DateTimePicker1: TDateTimePicker
              Left = 92
              Top = 53
              Width = 97
              Height = 21
              Date = 38699.755564791670000000
              Time = 38699.755564791670000000
              TabOrder = 0
            end
            object DateTimePicker2: TDateTimePicker
              Left = 290
              Top = 53
              Width = 96
              Height = 21
              Date = 38699.755564791670000000
              Time = 38699.755564791670000000
              TabOrder = 1
            end
            object GroupBox1: TGroupBox
              Left = 32
              Top = 75
              Width = 739
              Height = 47
              TabOrder = 2
              object Label4: TLabel
                Left = 638
                Top = 21
                Width = 33
                Height = 13
                Caption = #39029#30721':'
              end
              object Label11: TLabel
                Left = 507
                Top = 20
                Width = 7
                Height = 13
                Font.Charset = GB2312_CHARSET
                Font.Color = clRed
                Font.Height = -13
                Font.Name = #23435#20307
                Font.Style = []
                ParentFont = False
              end
              object Label1: TLabel
                Left = 300
                Top = 20
                Width = 42
                Height = 13
                Caption = 'Label1'
                Font.Charset = GB2312_CHARSET
                Font.Color = clRed
                Font.Height = -13
                Font.Name = #23435#20307
                Font.Style = []
                ParentFont = False
              end
              object BitBtn1: TBitBtn
                Left = 9
                Top = 14
                Width = 66
                Height = 25
                Caption = #31532#19968#39029
                Enabled = False
                TabOrder = 0
                OnClick = BitBtn1Click
              end
              object BitBtn2: TBitBtn
                Left = 77
                Top = 14
                Width = 66
                Height = 25
                Caption = #19978#19968#39029
                Enabled = False
                TabOrder = 1
                OnClick = BitBtn2Click
              end
              object BitBtn3: TBitBtn
                Left = 145
                Top = 14
                Width = 66
                Height = 25
                Caption = #19979#19968#39029
                Enabled = False
                TabOrder = 2
                OnClick = BitBtn3Click
              end
              object BitBtn4: TBitBtn
                Left = 214
                Top = 14
                Width = 65
                Height = 25
                Caption = #26368#21518#39029
                Enabled = False
                TabOrder = 3
                OnClick = BitBtn4Click
              end
              object ComboBox1: TComboBox
                Left = 673
                Top = 16
                Width = 55
                Height = 21
                Font.Charset = GB2312_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = #23435#20307
                Font.Style = []
                ItemHeight = 13
                ParentFont = False
                TabOrder = 4
                OnChange = ComboBox1Change
                OnKeyPress = ComboBox1KeyPress
              end
            end
            object ComboBox2: TComboBox
              Left = 93
              Top = 25
              Width = 129
              Height = 21
              ItemHeight = 13
              TabOrder = 3
            end
            object ComboBoxIsPrint: TComboBox
              Left = 604
              Top = 54
              Width = 162
              Height = 21
              Hint = '('#20026#31354#26102#34920#31034#25152#26377#31867#22411')'
              ItemHeight = 13
              ItemIndex = 1
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
              Text = 'IC'#21345#20132#26131
              Visible = False
              Items.Strings = (
                #29616#37329#20132#26131
                'IC'#21345#20132#26131
                #29616#37329#20132#26131#25171#21360#21457#31080
                'IC'#21345#20132#26131#24182#25171#21360#21457#31080)
            end
            object BitBtnToExcel: TBitBtn
              Left = 625
              Top = 27
              Width = 73
              Height = 24
              Caption = 'Excel'
              TabOrder = 5
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
              Left = 189
              Top = 53
              Width = 80
              Height = 21
              Date = 40061.000000000000000000
              Time = 40061.000000000000000000
              Kind = dtkTime
              TabOrder = 6
            end
            object toTime: TDateTimePicker
              Left = 387
              Top = 53
              Width = 80
              Height = 21
              Date = 40061.999988425930000000
              Time = 40061.999988425930000000
              Kind = dtkTime
              TabOrder = 7
            end
            object BitBtn5: TBitBtn
              Left = 475
              Top = 27
              Width = 75
              Height = 24
              Caption = #30830#23450
              TabOrder = 8
              OnClick = BitBtn5Click
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
          end
          object Panel4: TPanel
            Left = 1
            Top = 140
            Width = 995
            Height = 463
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object DBGridEh1: TDBGridEh
              Left = 0
              Top = 0
              Width = 995
              Height = 463
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
              ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
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
              OnCellClick = DBGridEh1CellClick
              OnDblClick = DBGridEh1DblClick
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'FACT_ID'
                  Footer.Value = #21512#35745#65306
                  Footer.ValueType = fvtStaticText
                  Footers = <>
                  Title.Caption = #21378#23478#32534#21495
                  Width = 60
                end
                item
                  EditButtons = <>
                  FieldName = 'DEV_ID'
                  Footer.ValueType = fvtCount
                  Footers = <>
                  Title.Caption = #36710#26426#32534#21495
                end
                item
                  EditButtons = <>
                  FieldName = 'DATATYPE'
                  Footers = <>
                  Title.Caption = #25968#25454#31867#22411
                  Width = 60
                end
                item
                  EditButtons = <>
                  FieldName = 'CAR_NO'
                  Footers = <>
                  Title.Caption = #36710#29260#21495
                  Width = 60
                end
                item
                  EditButtons = <>
                  FieldName = 'ONTIME'
                  Footers = <>
                  Title.Caption = #19978#36710#26102#38388
                  Width = 149
                end
                item
                  EditButtons = <>
                  FieldName = 'OFFTIME'
                  Footers = <>
                  Title.Caption = #19979#36710#26102#38388
                  Width = 60
                end
                item
                  EditButtons = <>
                  FieldName = 'DJ'
                  Footers = <>
                  Title.Caption = #21333#20215
                  Width = 60
                end
                item
                  DisplayFormat = '0.00'
                  EditButtons = <>
                  FieldName = 'YYLC'
                  Footer.ValueType = fvtSum
                  Footers = <>
                  Title.Caption = #33829#36816#37324#31243
                end
                item
                  DisplayFormat = '0.00'
                  EditButtons = <>
                  FieldName = 'YYJE'
                  Footer.ValueType = fvtSum
                  Footers = <>
                  Title.Caption = #33829#36816#37329#39069
                end
                item
                  DisplayFormat = '0.00'
                  EditButtons = <>
                  FieldName = 'KSLC'
                  Footer.ValueType = fvtSum
                  Footers = <>
                  Title.Caption = #31354#39542#37324#31243
                end
                item
                  EditButtons = <>
                  FieldName = 'WAITTIME'
                  Footers = <>
                  Title.Caption = #31561#24453#26102#38388
                  Width = 60
                end
                item
                  EditButtons = <>
                  FieldName = 'ICCARDINNO'
                  Footers = <>
                  Title.Caption = #19968#21345#36890#21495
                  Width = 60
                end
                item
                  EditButtons = <>
                  FieldName = 'ICCARDMENEY_BEFORETRADE'
                  Footers = <>
                  Title.Caption = #21345#21407#39069
                  Width = 60
                end
                item
                  DisplayFormat = '0.00'
                  EditButtons = <>
                  FieldName = 'ICCARDMENEY_AFTERTRADE'
                  Footers = <>
                  Title.Caption = #21345#20313#39069
                  Visible = False
                  Width = 60
                end
                item
                  EditButtons = <>
                  FieldName = 'CARDTYPE'
                  Footers = <>
                  Title.Caption = #21345#31867#22411
                  Width = 60
                end
                item
                  EditButtons = <>
                  FieldName = 'POSNUMBER'
                  Footers = <>
                  Title.Caption = 'POS'#27969#27700#21495
                  Width = 70
                end
                item
                  EditButtons = <>
                  FieldName = 'ICCARDTRADENUMBER'
                  Footers = <>
                  Title.Caption = #20132#26131#35745#25968#22120
                  Width = 70
                end
                item
                  EditButtons = <>
                  FieldName = 'TRADETYPE'
                  Footers = <>
                  Title.Caption = #20132#26131#31867#22411
                  Visible = False
                  Width = 60
                end
                item
                  EditButtons = <>
                  FieldName = 'CITYCODE'
                  Footers = <>
                  Title.Caption = #22478#24066#20195#30721
                  Width = 60
                end
                item
                  EditButtons = <>
                  FieldName = 'TAC'
                  Footers = <>
                  Title.Caption = 'Tac'#30721
                  Width = 60
                end
                item
                  DisplayFormat = '0.000000'
                  EditButtons = <>
                  FieldName = 'ONLONGITUDE'
                  Footers = <>
                  Title.Caption = #19978#36710#32463#24230
                  Width = 75
                end
                item
                  DisplayFormat = '0.000000'
                  EditButtons = <>
                  FieldName = 'ONLATITUDE'
                  Footers = <>
                  Title.Caption = #19978#36710#32428#24230
                  Width = 75
                end
                item
                  DisplayFormat = '0.000000'
                  EditButtons = <>
                  FieldName = 'LONGITUDE'
                  Footers = <>
                  Title.Caption = #19979#36710#32463#24230
                  Width = 75
                end
                item
                  DisplayFormat = '0.000000'
                  EditButtons = <>
                  FieldName = 'LATITUDE'
                  Footers = <>
                  Title.Caption = #19979#36710#32428#24230
                  Width = 75
                end
                item
                  EditButtons = <>
                  FieldName = 'GPSTIME'
                  Footers = <>
                  Title.Caption = 'GPS'#26102#38388
                  Width = 149
                end
                item
                  EditButtons = <>
                  FieldName = 'ICCARDFACENO'
                  Footers = <>
                  Visible = False
                end
                item
                  EditButtons = <>
                  FieldName = 'DRIVERNO'
                  Footers = <>
                  Visible = False
                end
                item
                  EditButtons = <>
                  FieldName = 'PSAMCARDNO'
                  Footers = <>
                  Title.Caption = 'PSAM'#21345#21495
                  Width = 90
                end
                item
                  EditButtons = <>
                  FieldName = 'TAXIRUNID'
                  Footers = <>
                  Title.Caption = #33829#36816'ID'
                end
                item
                  EditButtons = <>
                  FieldName = 'DRUNDATA_ID'
                  Footers = <>
                  Title.Caption = #33829#36816'ID'
                  Visible = False
                  Width = 60
                end
                item
                  EditButtons = <>
                  FieldName = 'POSMACHINENO'
                  Footers = <>
                  Visible = False
                end
                item
                  EditButtons = <>
                  FieldName = 'USER_ID'
                  Footers = <>
                  Visible = False
                end
                item
                  EditButtons = <>
                  FieldName = 'GROUP_ID'
                  Footers = <>
                  Visible = False
                end
                item
                  EditButtons = <>
                  FieldName = 'CARNO'
                  Footers = <>
                  Title.Caption = #36710#29260#21495
                  Visible = False
                  Width = 60
                end>
            end
          end
          object cxSplitter2: TcxSplitter
            Left = 1
            Top = 132
            Width = 995
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
  object Panel7: TPanel
    Left = 0
    Top = 0
    Width = 203
    Height = 634
    Align = alLeft
    BevelOuter = bvLowered
    TabOrder = 1
    object PageControl2: TPageControl
      Left = 1
      Top = 1
      Width = 201
      Height = 632
      ActivePage = TabSheet2
      Align = alClient
      TabOrder = 0
      object TabSheet2: TTabSheet
        Caption = #36710#36742
        object TreeView1: TTreeView
          Left = 0
          Top = 0
          Width = 193
          Height = 571
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
        object PanelSelectGroupName: TPanel
          Left = 0
          Top = 571
          Width = 193
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
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 203
    Top = 0
    Width = 8
    Height = 634
    Cursor = crHSplit
    HotZoneClassName = 'TcxSimpleStyle'
    HotZone.SizePercent = 31
    AutoSnap = True
    MinSize = 22
    ResizeUpdate = True
    Control = Panel7
  end
  object ImageList1: TImageList
    Left = 312
    Top = 592
    Bitmap = {
      494C01010E001300040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000005000000001002000000000000050
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C6008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFF
      0000FFFF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C600000000008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000FFFF0000FFFF
      0000FFFF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C6000000
      0000C6C6C6008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000FFFF0000FFFF
      0000FFFF00000000000084848400848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000FFFF0000FFFF
      0000FFFF00000000000084848400848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000FFFF0000FFFF
      0000FFFF00000000000084848400848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000FFFF0000FFFF
      0000FFFF00000000000084848400848484008484840000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000FFFF0000FFFF
      0000FFFF00000000000084848400848484008484840000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000FFFF0000FFFF
      0000FFFF00000000000084848400848484008484840000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000FFFF0000FFFF
      0000FFFF00000000000084848400848484008484840000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000FFFF0000FFFF
      0000FFFF00000000000084848400848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000FFFF0000FFFF
      0000FFFF00000000000084848400848484008484840000000000000000000000
      000000000000000000000000000000000000000000000000FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000FFFF0000FFFF
      0000000000008484840084848400848484008484840000000000000000000000
      0000000000000000000000000000000000000000FF0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000FFFF00000000
      0000848484008484840084848400848484008484840000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      000000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000D6AD8C00C663
      0000C6630000DEA5730000000000000000000000000000000000DEAD8C00C65A
      0000BD5A0000D69C730000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      FF00000000000000000000000000000000000000000000000000C6C6C600C6C6
      C60000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00848484000000000000000000A5290800E78C00008C00
      0000B54A4A00CE630000940000000000000000000000A5290800DE9400008C00
      0000B5524A00C663000094080000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF008484
      840000000000000000000000000000000000000000000000000000008400C6C6
      C60000000000FFFFFF00840000008400000084000000FFFFFF00FFFFFF008400
      000084000000FFFFFF00848484000000000000000000BD520800BD4A00000000
      00000000000000000000A51800000000000000000000B5520800A53100000000
      000000000000C67B5A00B5390000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      FF00000000000000000000000000000000000000000000000000C6C6C600C6C6
      C60000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00848484000000000000000000C68C6300CE5A0000A510
      0000FFFFFF0000000000B5420000BD636300F7E7EF00CE6B0000A53100000000
      0000B5422100B5520000C6846300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF00848484000000FF000000FF008484
      84000000FF00848484000000000000000000000000000000000000008400C6C6
      C60000000000FFFFFF00840000008400000084000000FFFFFF00FFFFFF008400
      000084000000FFFFFF008484840000000000000000000000000000000000AD21
      0000C6630000B55A0000DE7B0000C6846300F7E7EF00DE7B0000BD5A0000BD5A
      0000B5390000EFC6B50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF00848484000000FF000000FF008484
      84000000FF00848484000000000000000000000000000000000000008400C6C6
      C60000000000FFFFFF00840000008400000084000000FFFFFF00FFFFFF008400
      000084000000FFFFFF0084848400000000000000000000000000000000000000
      0000C67B4200CE8C5200CE5A00009452290094522900C65A0000CE8C6300C67B
      4A00FFEFEF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000848484000000FF00000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      FF00000000000000000000000000000000000000000000000000C6C6C600C6C6
      C60000000000FFFFFF00000000000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000042291800DEC6CE00EFD6DE006B524A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      00000000000000000000000000000000000000000000000000000000FF008484
      840000000000000000000000000000000000000000000000000000008400C6C6
      C60000000000FFFFFF0000000000000000000000000000000000C6C6C6008400
      000084000000C6C6C60084848400000000000000000000000000000000000000
      00000000000073634A00E7DEDE00E7D6DE00AD9C8C00D6C6C60073524200846B
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00848484000000000000000000000000000000000000000000848484000000
      FF00000000000000000000000000000000000000000000000000C6C6C600C6C6
      C60000000000FFFFFF00848484000000000000000000C6C6C600000000008484
      8400C6C6C600C6C6C60084848400000000000000000000000000000000000000
      00007B635200ADA59C0000000000AD9C940084736300DECECE00DEBDBD006B52
      4A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF0000848400008484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C60000000000FFFFFF00FFFFFF008484840000000000FFFFFF00FFFFFF00C6C6
      C600000000000000000084848400000000000000000000000000000000000000
      0000A59C9400EFE7E700E7DED60073524200CEBDBD00CEC6BD00FFDEDE00C6B5
      A500EFEFEF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000FFFF00008484000084840000848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600FFFFFF00C6C6
      C600000000000084840000000000848484000000000000000000000000000000
      0000EFE7E700000000004A1810000000000000000000735A4A00FFE7EF00EFDE
      DE00F7EFEF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000008484000084840000FFFF0000848400008484008484
      8400000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF00008484840000000000C6C6C6000000
      000000FFFF008400000000000000000000000000000000000000000000002100
      0000DED6CE00422121000000000000000000000000000000000000000000BDAD
      AD00847B6B00DED6CE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000084840000848400008484000084
      8400848484008484840000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000FFFF0000FFFF000084840000000000000000000000000000000000735A
      5200CEC6C600EFEFEF000000000000000000000000000000000000000000D6CE
      C6008C7B7300DED6D60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF00FFFFFF0000FFFF00840000000000000000000000000000007B6B
      5A00EFEFE7000000000000000000000000000000000000000000000000000000
      000084635200DED6CE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF00FFFFFF0000FFFF0000FFFF00000000000000000000000000C6BD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000DED6D600F7EFEF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000500000000100010000000000800200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFF00000000FFFFC00700000000
      D7EFBFEB00000000D7CF000500000000D78F7E3100000000D70F7E3500000000
      D60F000600000000D40F7FEA00000000D00F801400000000D40FC00A00000000
      D60FE00100000000D70FE00700000000D78FF00700000000D7CFF00300000000
      D7EFF80300000000FFFFFFFF00000000FFFFFFFFFFFFFFFF8001FFFFFFFFFFFF
      7FFEEFF7F7EBEFF77FFEE7F7F3EBEFE77FBEE3F7F1EBEFC77F3EE1F7F0EBEF87
      7C3EE0F7F06BEF077C3EE077F02BEE077C3EE037F00BEC077E3EE077F02BEE07
      7FBEE0F7F06BEF077FFEE1F7F0EBEF877FFEE3F7F1EBEFC77FFEE7F7F3EBEFE7
      FFFFEFF7F7EBEFF7FFFFFFFFFFFFFFFFF3FFFF07FFFFFFFFE3FFFF03FFFF8001
      C3FFFF81EFF77FFE0000FF81E7F77FFE803FE3C3E3F77DEE803FE3C7E1F77DCE
      803FE38BE0F7718E803FE383E077610E803BE307E037718E8033C00FE07779CE
      8020C03FE0F77DEE8033C07FE1F77FFE803B00FFE3F77FFE803F01FFE7F77FFE
      803F01FFEFF7FFFF803F83FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC001C3C3FFFF
      FFC78001818107C1FFC780019D9947D1FE018001841147D1FE018001E0030101
      FE018001F00720413FC78001FC3F224187C78001F80F2241C1C78001F20F8003
      E03F8001F007D147F00F8000F587C107F8038000E3C3E38FFC018000E3E3EBAF
      FFFFFFC0E7F3E38FFFFFFFE0EFF3FFFF00000000000000000000000000000000
      000000000000}
  end
  object DataSource1: TDataSource
    Left = 318
    Top = 210
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
  object PopupMenu1: TPopupMenu
    Left = 529
    Top = 317
    object N1: TMenuItem
      Caption = #35780#20215#20449#24687
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #29031#29255#20449#24687
      OnClick = N2Click
    end
    object N5: TMenuItem
      Caption = #26597#30475#34892#39542#36712#36857
      OnClick = N5Click
    end
    object N3: TMenuItem
      Caption = #19978#36710#22320#28857
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #19979#36710#22320#28857
      OnClick = N4Click
    end
  end
end
