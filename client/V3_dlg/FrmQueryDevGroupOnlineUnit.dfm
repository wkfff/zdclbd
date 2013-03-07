object frmQueryDevGroupOnline: TfrmQueryDevGroupOnline
  Left = 400
  Top = 136
  Width = 928
  Height = 480
  Caption = #36710#36742#32452#22312#32447#29575#32479#35745
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
      Height = 446
      ActivePage = TabSheet2
      Align = alClient
      TabOrder = 0
      object TabSheet2: TTabSheet
        Caption = #36710#36742
        object TreeView1: TTreeView
          Left = 0
          Top = 0
          Width = 195
          Height = 418
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
  object Panel1: TPanel
    Left = 211
    Top = 0
    Width = 709
    Height = 446
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 2
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
              Left = 207
              Top = 51
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
              Left = 12
              Top = 56
              Width = 52
              Height = 13
              Caption = #36710#36742#32452#65306
              Font.Charset = GB2312_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object Label5: TLabel
              Left = 243
              Top = 20
              Width = 7
              Height = 13
              Caption = '-'
            end
            object Label3: TLabel
              Left = 25
              Top = 20
              Width = 39
              Height = 13
              Caption = #26102#38388#65306
            end
            object BitBtnToExcel: TBitBtn
              Left = 284
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
              Left = 361
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
            object DateTimePicker1: TDateTimePicker
              Left = 58
              Top = 16
              Width = 97
              Height = 21
              Date = 38699.755564791670000000
              Time = 38699.755564791670000000
              TabOrder = 2
            end
            object DateTimePicker3: TDateTimePicker
              Left = 257
              Top = 16
              Width = 96
              Height = 21
              Date = 38699.755564791670000000
              Time = 38699.755564791670000000
              TabOrder = 3
            end
            object DateTimePicker2: TDateTimePicker
              Left = 156
              Top = 16
              Width = 80
              Height = 21
              Date = 40061.000000000000000000
              Time = 40061.000000000000000000
              Kind = dtkTime
              TabOrder = 4
            end
            object DateTimePicker4: TDateTimePicker
              Left = 355
              Top = 16
              Width = 80
              Height = 21
              Date = 40061.999988425930000000
              Time = 40061.999988425930000000
              Kind = dtkTime
              TabOrder = 5
            end
            object edtDevGroupName: TEdit
              Left = 64
              Top = 52
              Width = 106
              Height = 21
              Color = clInfoBk
              ReadOnly = True
              TabOrder = 6
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
              Visible = False
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
              end
              object btnPagePrevious: TRzButton
                Left = 110
                Top = 5
                Width = 51
                Caption = #21069#19968#39029
                Color = clSkyBlue
                HotTrack = True
                TabOrder = 2
              end
              object btnPageNext: TRzButton
                Left = 301
                Top = 5
                Width = 51
                Caption = #19979#19968#39029
                Color = clSkyBlue
                HotTrack = True
                TabOrder = 3
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
                end>
              BufferedPaint = False
              OptionsCustomizing.BandVertSizing = False
              OptionsCustomizing.ColumnVertSizing = False
              OptionsData.Editing = False
              OptionsData.Deleting = False
              OptionsView.GridLines = tlglBoth
              OptionsView.ShowRoot = False
              TabOrder = 1
              object cxTreeList1cxTreeListColumn1: TcxTreeListColumn
                Caption.Text = #36710#36742#25152#22312#32452
                DataBinding.ValueType = 'String'
                Width = 129
                Position.ColIndex = 0
                Position.RowIndex = 0
                Position.BandIndex = 0
              end
              object cxTreeList1cxTreeListColumn2: TcxTreeListColumn
                Caption.Text = #26102#38388
                DataBinding.ValueType = 'String'
                Width = 166
                Position.ColIndex = 1
                Position.RowIndex = 0
                Position.BandIndex = 0
              end
              object cxTreeList1cxTreeListColumn3: TcxTreeListColumn
                Caption.Text = #22312#32447#36710#25968
                DataBinding.ValueType = 'String'
                Position.ColIndex = 2
                Position.RowIndex = 0
                Position.BandIndex = 0
              end
              object cxTreeList1cxTreeListColumn4: TcxTreeListColumn
                Caption.Text = #24635#36710#25968
                DataBinding.ValueType = 'String'
                Position.ColIndex = 3
                Position.RowIndex = 0
                Position.BandIndex = 0
              end
              object cxTreeList1cxTreeListColumn5: TcxTreeListColumn
                Caption.Text = #22312#32447#29575
                DataBinding.ValueType = 'String'
                Position.ColIndex = 4
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
end
