object frmQueryAlarmInfo: TfrmQueryAlarmInfo
  Left = 225
  Top = 198
  Width = 928
  Height = 480
  Caption = #26597#35810#25253#35686#20449#24687
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
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel7: TPanel
    Left = 0
    Top = 0
    Width = 203
    Height = 446
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    object PageControl2: TPageControl
      Left = 0
      Top = 0
      Width = 203
      Height = 413
      ActivePage = TabSheet2
      Align = alClient
      TabOrder = 0
      object TabSheet2: TTabSheet
        Caption = #36710#36742
        object TreeView1: TTreeView
          Left = 0
          Top = 0
          Width = 195
          Height = 385
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
      Top = 413
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
    Width = 709
    Height = 446
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 1
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 707
      Height = 444
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
        Caption = #26597#35810#20869#23481
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 699
          Height = 416
          Align = alClient
          BevelOuter = bvLowered
          Color = 16382438
          TabOrder = 0
          object Panel3: TPanel
            Left = 1
            Top = 1
            Width = 697
            Height = 90
            Align = alTop
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = []
            ParentColor = True
            ParentFont = False
            TabOrder = 0
            object btnQuery: TSpeedButton
              Left = 453
              Top = 19
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
              Transparent = False
              OnClick = btnQueryClick
            end
            object Label2: TLabel
              Left = 8
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
            object Label5: TLabel
              Left = 239
              Top = 57
              Width = 7
              Height = 13
              Caption = '-'
            end
            object Label3: TLabel
              Left = 21
              Top = 57
              Width = 39
              Height = 13
              Caption = #26102#38388#65306
            end
            object Label1: TLabel
              Left = 146
              Top = 25
              Width = 65
              Height = 13
              Caption = #25253#35686#31867#22411#65306
            end
            object Label4: TLabel
              Left = 319
              Top = 25
              Width = 39
              Height = 13
              Caption = #29366#24577#65306
            end
            object Label7: TLabel
              Left = 536
              Top = 24
              Width = 12
              Height = 13
              AutoSize = False
              Color = clRed
              ParentColor = False
            end
            object Label10: TLabel
              Left = 600
              Top = 24
              Width = 12
              Height = 13
              AutoSize = False
              Color = clTeal
              ParentColor = False
            end
            object Label11: TLabel
              Left = 552
              Top = 24
              Width = 39
              Height = 13
              Caption = #26410#22788#29702
            end
            object Label12: TLabel
              Left = 616
              Top = 24
              Width = 39
              Height = 13
              Caption = #24050#22788#29702
            end
            object BitBtnToExcel: TBitBtn
              Left = 453
              Top = 51
              Width = 73
              Height = 24
              Caption = 'Excel'
              TabOrder = 0
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
            object BitBtn2: TBitBtn
              Left = 533
              Top = 51
              Width = 73
              Height = 24
              Caption = #36864#20986
              TabOrder = 1
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
            object cbxCarNo: TComboBox
              Left = 55
              Top = 21
              Width = 83
              Height = 21
              ItemHeight = 13
              TabOrder = 2
            end
            object DateTimePicker1: TDateTimePicker
              Left = 54
              Top = 53
              Width = 97
              Height = 21
              Date = 38699.755564791670000000
              Time = 38699.755564791670000000
              TabOrder = 3
            end
            object DateTimePicker3: TDateTimePicker
              Left = 253
              Top = 53
              Width = 96
              Height = 21
              Date = 38699.755564791670000000
              Time = 38699.755564791670000000
              TabOrder = 4
            end
            object DateTimePicker2: TDateTimePicker
              Left = 152
              Top = 53
              Width = 80
              Height = 21
              Date = 40061.000000000000000000
              Time = 40061.000000000000000000
              Kind = dtkTime
              TabOrder = 5
            end
            object DateTimePicker4: TDateTimePicker
              Left = 351
              Top = 53
              Width = 80
              Height = 21
              Date = 40061.999988425930000000
              Time = 40061.999988425930000000
              Kind = dtkTime
              TabOrder = 6
            end
            object cbxAlarmType: TComboBox
              Left = 206
              Top = 21
              Width = 105
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              ItemIndex = 0
              TabOrder = 7
              Text = #25152#26377#25253#35686
              OnKeyPress = cbxAlarmTypeKeyPress
              Items.Strings = (
                #25152#26377#25253#35686
                #32039#24613#25253#35686
                #36229#36895#25253#35686
                #30130#21171#39550#39542
                #39044#35686
                'GNSS'#27169#22359#21457#29983#25925#38556
                'GNSS'#22825#32447#26410#25509#25110#34987#21098#26029
                'GNSS'#22825#32447#30701#36335
                #32456#31471#20027#30005#28304#27424#21387
                #32456#31471#20027#30005#28304#25481#30005
                #32456#31471'LCD'#25110#26174#31034#22120#25925#38556
                'TTS'#27169#22359#25925#38556
                #25668#20687#22836#25925#38556
                #24403#22825#32047#35745#39550#39542#36229#26102
                #36229#26102#20572#36710
                #36827#20986#21306#22495
                #36827#20986#36335#32447
                #36335#27573#34892#39542#26102#38388#19981#36275'/'#36807#38271
                #36335#32447#20559#31163#25253#35686
                #36710#36742'VSS'#25925#38556
                #36710#36742#27833#37327#24322#24120
                #36710#36742#34987#30423#25253#35686
                #36710#36742#38750#27861#28857#28779
                #36710#36742#38750#27861#20301#31227
                #30896#25758#20391#32763#25253#35686
                #22320#29702#26629#26639#38450#30423#25253#35686)
            end
            object cbxAlarmDealStatus: TComboBox
              Left = 352
              Top = 21
              Width = 79
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              ItemIndex = 0
              TabOrder = 8
              Text = #25152#26377
              OnKeyPress = cbxAlarmTypeKeyPress
              Items.Strings = (
                #25152#26377
                #26410#22788#29702
                #24050#22788#29702)
            end
          end
          object Panel4: TPanel
            Left = 1
            Top = 99
            Width = 697
            Height = 316
            Align = alClient
            BevelOuter = bvNone
            ParentColor = True
            TabOrder = 1
            object Panel5: TPanel
              Left = 0
              Top = 281
              Width = 697
              Height = 35
              Align = alBottom
              BevelInner = bvRaised
              BevelOuter = bvLowered
              ParentColor = True
              TabOrder = 0
              object lblAlarmDataCountTip: TLabel
                Left = 636
                Top = 2
                Width = 59
                Height = 31
                Align = alRight
                Alignment = taRightJustify
                Caption = #20849'0'#26465#35760#24405
                Font.Charset = GB2312_CHARSET
                Font.Color = clRed
                Font.Height = -13
                Font.Name = #23435#20307
                Font.Style = []
                ParentFont = False
                Layout = tlCenter
              end
              object Label6: TLabel
                Left = 161
                Top = 11
                Width = 13
                Height = 13
                Caption = #31532
              end
              object Label8: TLabel
                Left = 211
                Top = 11
                Width = 39
                Height = 13
                Caption = #39029#65292#20849
              end
              object Label9: TLabel
                Left = 288
                Top = 11
                Width = 13
                Height = 13
                Caption = #39029
              end
              object cbxPageSize: TComboBox
                Left = 15
                Top = 7
                Width = 44
                Height = 21
                Style = csDropDownList
                ItemHeight = 13
                ItemIndex = 0
                TabOrder = 0
                Text = '20'
                OnChange = cbxPageSizeChange
                Items.Strings = (
                  '20'
                  '30'
                  '40'
                  '50')
              end
              object btnPageFirst: TRzButton
                Left = 59
                Top = 5
                Width = 51
                Caption = #31532#19968#39029
                Color = clSkyBlue
                HotTrack = True
                TabOrder = 1
                OnClick = btnPageFirstClick
              end
              object btnPagePrevious: TRzButton
                Left = 110
                Top = 5
                Width = 51
                Caption = #21069#19968#39029
                Color = clSkyBlue
                HotTrack = True
                TabOrder = 2
                OnClick = btnPagePreviousClick
              end
              object btnPageNext: TRzButton
                Left = 301
                Top = 5
                Width = 51
                Caption = #19979#19968#39029
                Color = clSkyBlue
                HotTrack = True
                TabOrder = 3
                OnClick = btnPageNextClick
              end
              object btnPageLast: TRzButton
                Left = 352
                Top = 5
                Width = 63
                FrameColor = 7617536
                Caption = #26368#21518#19968#39029
                Color = clSkyBlue
                HotTrack = True
                TabOrder = 4
                OnClick = btnPageLastClick
              end
              object edtCurrPageNo: TRzEdit
                Left = 174
                Top = 7
                Width = 37
                Height = 21
                Hint = #25353#22238#36710#38190#36339#36716#21040#25351#23450#39029
                Text = '0'
                Alignment = taRightJustify
                ParentShowHint = False
                ShowHint = True
                TabOrder = 5
                OnKeyPress = edtCurrPageNoKeyPress
                OnKeyUp = edtCurrPageNoKeyUp
              end
              object edtTotalPageCount: TRzEdit
                Left = 251
                Top = 7
                Width = 37
                Height = 21
                Text = '0'
                Alignment = taRightJustify
                Color = clInfoBk
                ReadOnly = True
                TabOrder = 6
              end
            end
            object cxTreeList1: TcxTreeList
              Left = 0
              Top = 0
              Width = 697
              Height = 281
              Align = alClient
              Bands = <
                item
                  Caption.AlignHorz = taCenter
                  Caption.Text = #36710#36742#20449#24687
                  Options.Moving = False
                end
                item
                  Caption.AlignHorz = taCenter
                  Caption.Text = #25253#35686#22522#26412#20449#24687
                  Options.Moving = False
                end
                item
                  Caption.AlignHorz = taCenter
                  Caption.Text = #36229#36895#25253#35686#38468#21152#20449#24687
                  Options.Moving = False
                end
                item
                  Caption.AlignHorz = taCenter
                  Caption.Text = #36827#20986#21306#22495'/'#36335#32447#25253#35686#38468#21152#20449#24687
                end
                item
                  Caption.AlignHorz = taCenter
                  Caption.Text = #36335#32447#34892#39542#26102#38388#19981#36275'/'#36807#38271#25253#35686#38468#21152#20449#24687
                end
                item
                  Caption.AlignHorz = taCenter
                  Caption.Text = #25253#35686#22788#29702
                  Options.Moving = False
                end>
              BufferedPaint = False
              OptionsCustomizing.BandVertSizing = False
              OptionsCustomizing.ColumnVertSizing = False
              OptionsData.Editing = False
              OptionsData.Deleting = False
              OptionsView.Bands = True
              OptionsView.GridLines = tlglBoth
              OptionsView.ShowRoot = False
              PopupMenu = PopupMenu1
              Styles.Selection = cxStyle1
              TabOrder = 1
              OnCustomDrawCell = cxTreeList1CustomDrawCell
              OnDblClick = cxTreeList1DblClick
              object cxTreeList1cxTreeListColumn1: TcxTreeListColumn
                Caption.AlignHorz = taCenter
                Caption.AlignVert = vaCenter
                Caption.Text = #36710#29260#21495
                DataBinding.ValueType = 'String'
                Position.ColIndex = 0
                Position.RowIndex = 0
                Position.BandIndex = 0
                SummaryFooter.AlignHorz = taCenter
              end
              object cxTreeList1cxTreeListColumn2: TcxTreeListColumn
                Caption.AlignHorz = taCenter
                Caption.AlignVert = vaCenter
                Caption.Text = #35774#22791#21495
                DataBinding.ValueType = 'String'
                Position.ColIndex = 1
                Position.RowIndex = 0
                Position.BandIndex = 0
              end
              object cxTreeList1cxTreeListColumn3: TcxTreeListColumn
                Caption.AlignHorz = taCenter
                Caption.AlignVert = vaCenter
                Caption.Text = #25152#23646#36710#36742#32452
                DataBinding.ValueType = 'String'
                Position.ColIndex = 2
                Position.RowIndex = 0
                Position.BandIndex = 0
              end
              object cxTreeList1cxTreeListColumn4: TcxTreeListColumn
                Caption.AlignHorz = taCenter
                Caption.AlignVert = vaCenter
                Caption.Text = #25253#35686#31867#22411
                DataBinding.ValueType = 'String'
                Width = 120
                Position.ColIndex = 3
                Position.RowIndex = 0
                Position.BandIndex = 1
              end
              object cxTreeList1cxTreeListColumn5: TcxTreeListColumn
                Caption.AlignHorz = taCenter
                Caption.AlignVert = vaCenter
                Caption.Text = 'GPS'#26102#38388
                DataBinding.ValueType = 'String'
                Width = 148
                Position.ColIndex = 4
                Position.RowIndex = 0
                Position.BandIndex = 1
              end
              object cxTreeList1cxTreeListColumn6: TcxTreeListColumn
                Caption.AlignHorz = taCenter
                Caption.AlignVert = vaCenter
                Caption.Text = #32463#24230
                DataBinding.ValueType = 'String'
                Position.ColIndex = 5
                Position.RowIndex = 0
                Position.BandIndex = 1
              end
              object cxTreeList1cxTreeListColumn7: TcxTreeListColumn
                Caption.AlignHorz = taCenter
                Caption.AlignVert = vaCenter
                Caption.Text = #32428#24230
                DataBinding.ValueType = 'String'
                Position.ColIndex = 6
                Position.RowIndex = 0
                Position.BandIndex = 1
              end
              object cxTreeList1cxTreeListColumn8: TcxTreeListColumn
                Caption.AlignHorz = taCenter
                Caption.AlignVert = vaCenter
                Caption.Text = #36895#24230
                DataBinding.ValueType = 'String'
                Width = 59
                Position.ColIndex = 7
                Position.RowIndex = 0
                Position.BandIndex = 1
              end
              object cxTreeList1cxTreeListColumn9: TcxTreeListColumn
                Caption.AlignHorz = taCenter
                Caption.AlignVert = vaCenter
                Caption.Text = #36229#36895#21306#22495#31867#22411
                DataBinding.ValueType = 'String'
                Position.ColIndex = 3
                Position.RowIndex = 0
                Position.BandIndex = 2
              end
              object cxTreeList1cxTreeListColumn10: TcxTreeListColumn
                Caption.AlignHorz = taCenter
                Caption.AlignVert = vaCenter
                Caption.Text = #36229#36895#21306#22495
                DataBinding.ValueType = 'String'
                Position.ColIndex = 4
                Position.RowIndex = 0
                Position.BandIndex = 2
              end
              object cxTreeList1cxTreeListColumn11: TcxTreeListColumn
                Caption.AlignHorz = taCenter
                Caption.AlignVert = vaCenter
                Caption.Text = #36827#20986#21306#22495#31867#22411
                DataBinding.ValueType = 'String'
                Position.ColIndex = 5
                Position.RowIndex = 0
                Position.BandIndex = 3
              end
              object cxTreeList1cxTreeListColumn12: TcxTreeListColumn
                Caption.AlignHorz = taCenter
                Caption.AlignVert = vaCenter
                Caption.Text = #36827#20986#21306#22495
                DataBinding.ValueType = 'String'
                Position.ColIndex = 6
                Position.RowIndex = 0
                Position.BandIndex = 3
              end
              object cxTreeList1cxTreeListColumn13: TcxTreeListColumn
                Caption.AlignHorz = taCenter
                Caption.AlignVert = vaCenter
                Caption.Text = #36827#20986#26041#21521
                DataBinding.ValueType = 'String'
                Width = 61
                Position.ColIndex = 8
                Position.RowIndex = 0
                Position.BandIndex = 3
              end
              object cxTreeList1cxTreeListColumn14: TcxTreeListColumn
                Caption.AlignHorz = taCenter
                Caption.AlignVert = vaCenter
                Caption.Text = #34892#39542#36335#27573
                DataBinding.ValueType = 'String'
                Width = 122
                Position.ColIndex = 10
                Position.RowIndex = 0
                Position.BandIndex = 4
              end
              object cxTreeList1cxTreeListColumn15: TcxTreeListColumn
                Caption.AlignHorz = taCenter
                Caption.AlignVert = vaCenter
                Caption.Text = #36335#27573#34892#39542#26102#38388'('#31186')'
                DataBinding.ValueType = 'String'
                Width = 112
                Position.ColIndex = 11
                Position.RowIndex = 0
                Position.BandIndex = 4
              end
              object cxTreeList1cxTreeListColumn16: TcxTreeListColumn
                Caption.AlignHorz = taCenter
                Caption.AlignVert = vaCenter
                Caption.Text = #19981#36275'/'#36807#38271
                DataBinding.ValueType = 'String'
                Width = 81
                Position.ColIndex = 13
                Position.RowIndex = 0
                Position.BandIndex = 4
              end
              object cxTreeList1cxTreeListColumn17: TcxTreeListColumn
                Caption.AlignHorz = taCenter
                Caption.AlignVert = vaCenter
                Caption.Text = #26159#21542#22788#29702
                DataBinding.ValueType = 'String'
                Width = 81
                Position.ColIndex = 33
                Position.RowIndex = 0
                Position.BandIndex = 5
              end
              object cxTreeList1cxTreeListColumn18: TcxTreeListColumn
                Visible = False
                DataBinding.ValueType = 'String'
                Position.ColIndex = 3
                Position.RowIndex = 0
                Position.BandIndex = 0
              end
            end
          end
          object cxSplitter2: TcxSplitter
            Left = 1
            Top = 91
            Width = 697
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
  object cxSplitter3: TcxSplitter
    Left = 203
    Top = 0
    Width = 8
    Height = 446
    Cursor = crVSplit
    HotZoneClassName = 'TcxSimpleStyle'
    HotZone.SizePercent = 31
    AutoSnap = True
    MinSize = 22
    ResizeUpdate = True
    Control = Panel7
  end
  object PopupMenu1: TPopupMenu
    Left = 505
    Top = 244
    object N1: TMenuItem
      Caption = #26597#30475#22788#29702#24773#20917
      OnClick = N1Click
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = clBtnFace
    end
  end
end
