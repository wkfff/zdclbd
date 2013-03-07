inherited Tj_ServeJudgeFrm: TTj_ServeJudgeFrm
  Left = 153
  Top = 133
  Width = 1080
  Height = 597
  Caption = #26381#21153#35780#20215#32479#35745
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel7: TPanel
    Height = 563
    inherited PageControl2: TPageControl
      Height = 530
      inherited TabSheet2: TTabSheet
        inherited TreeView1: TTreeView
          Height = 502
        end
      end
    end
    inherited PanelSelectGroupName: TPanel
      Top = 530
    end
  end
  inherited Panel1: TPanel
    Left = 211
    Width = 861
    Height = 563
    inherited PageControl1: TPageControl
      Width = 859
      Height = 561
      inherited TabSheet1: TTabSheet
        Caption = #26381#21153#35780#20215#32479#35745
        inherited Panel2: TPanel
          Width = 851
          Height = 533
          Caption = 'object PageControl3: TPageControl'
          inherited Panel3: TPanel
            Width = 849
            inherited SpeedButtonOneTime: TSpeedButton
              Left = 755
            end
          end
          inherited Panel4: TPanel
            Top = 91
            Width = 849
            Height = 222
            inherited DBGridEh1: TDBGridEh
              Width = 849
              Height = 222
              SumList.Active = True
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'fact_id'
                  Footer.Value = #21512#35745#65306
                  Footer.ValueType = fvtStaticText
                  Footers = <>
                  Title.Caption = #21378#23478#32534#21495
                  Title.TitleButton = True
                  Width = 70
                end
                item
                  EditButtons = <>
                  FieldName = 'dev_id'
                  Footer.ValueType = fvtCount
                  Footers = <>
                  Title.Caption = #36710#26426#32534#21495
                  Title.TitleButton = True
                  Width = 70
                end
                item
                  EditButtons = <>
                  FieldName = 'CAR_NO'
                  Footers = <>
                  Title.Caption = #36710#29260#21495
                  Title.TitleButton = True
                  Width = 80
                end
                item
                  EditButtons = <>
                  FieldName = 'judge_Result'
                  Footers = <>
                  Title.Caption = #35780#20215#24847#35265
                  Title.TitleButton = True
                  Width = 150
                end
                item
                  EditButtons = <>
                  FieldName = 'cnt_judgeResult'
                  Footer.ValueType = fvtSum
                  Footers = <>
                  Title.Caption = #27425#25968
                  Title.TitleButton = True
                  Width = 60
                end>
            end
          end
          inherited cxSplitter2: TcxSplitter
            Top = 313
            Width = 849
            AlignSplitter = salBottom
            Control = PageControl3
          end
          object PageControl3: TPageControl
            Left = 1
            Top = 321
            Width = 849
            Height = 211
            ActivePage = TabSheet6
            Align = alBottom
            TabOrder = 3
            object TabSheet6: TTabSheet
              Caption = #32447#24418#22270
              object DBChart1: TDBChart
                Left = 0
                Top = 26
                Width = 841
                Height = 157
                AllowZoom = False
                BackWall.Brush.Color = clWhite
                BackWall.Brush.Style = bsClear
                BackWall.Color = clWhite
                BackWall.Pen.Visible = False
                Title.Font.Charset = GB2312_CHARSET
                Title.Font.Color = clBlue
                Title.Font.Height = -19
                Title.Font.Name = #23435#20307
                Title.Font.Style = []
                Title.Text.Strings = (
                  '')
                BackColor = clWhite
                BottomAxis.Title.Caption = #36710#36742
                BottomAxis.Title.Font.Charset = GB2312_CHARSET
                BottomAxis.Title.Font.Color = clBlack
                BottomAxis.Title.Font.Height = -13
                BottomAxis.Title.Font.Name = #23435#20307
                BottomAxis.Title.Font.Style = []
                Frame.Visible = False
                LeftAxis.Title.Caption = #27425#25968
                LeftAxis.Title.Font.Charset = GB2312_CHARSET
                LeftAxis.Title.Font.Color = clBlack
                LeftAxis.Title.Font.Height = -13
                LeftAxis.Title.Font.Name = #23435#20307
                LeftAxis.Title.Font.Style = []
                View3D = False
                Align = alClient
                BorderStyle = bsSingle
                Color = clWhite
                TabOrder = 0
                OnMouseMove = DBChart1MouseMove
                object LabelSelectPointInfo: TLabel
                  Left = 144
                  Top = 174
                  Width = 140
                  Height = 13
                  Caption = 'LabelSelectPointInfo'
                  Color = clYellow
                  ParentColor = False
                end
              end
              object Panel10: TPanel
                Left = 0
                Top = 0
                Width = 841
                Height = 26
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 1
                Visible = False
                object BFirstPage: TBitBtn
                  Left = 139
                  Top = 1
                  Width = 62
                  Height = 24
                  Caption = #39318#39029
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  Glyph.Data = {
                    36010000424D3601000000000000760000002800000011000000100000000100
                    040000000000C0000000C40E0000C40E00001000000000000000000000000000
                    800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                    3333300000003333333333333333300000003033333333333333300000009033
                    3333003333333000000090333330090333333000000090333009990333333000
                    0000903009999900000000000000900999999999999900000000903009999900
                    0000000000009033300999033333300000009033333009033333300000000033
                    3333300333333000000003333333333333333000000033333333333333333000
                    0000333333333333333330000000333333333333333330000000}
                end
                object BitBtnLeft: TBitBtn
                  Left = 390
                  Top = 3
                  Width = 41
                  Height = 22
                  Caption = #24038#31227
                  TabOrder = 2
                  OnClick = BitBtnLeftClick
                end
                object BitBtnRigth: TBitBtn
                  Left = 433
                  Top = 3
                  Width = 41
                  Height = 22
                  Caption = #21491#31227
                  TabOrder = 3
                  OnClick = BitBtnRigthClick
                end
                object BitBtnZoomIn: TBitBtn
                  Left = 1
                  Top = 1
                  Width = 45
                  Height = 24
                  Caption = #25918#22823
                  TabOrder = 4
                  OnClick = BitBtnZoomInClick
                end
                object ButtonPrevious: TBitBtn
                  Left = 200
                  Top = 1
                  Width = 62
                  Height = 24
                  Caption = #19978#19968#39029
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 7
                  Glyph.Data = {
                    76010000424D7601000000000000760000002800000020000000100000000100
                    0400000000000001000000000000000000001000000010000000000000000000
                    800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                    3333333333333333333333333333333333333333333333333333333333333333
                    3333333333333FF3333333333333003333333333333F77F33333333333009033
                    333333333F7737F333333333009990333333333F773337FFFFFF330099999000
                    00003F773333377777770099999999999990773FF33333FFFFF7330099999000
                    000033773FF33777777733330099903333333333773FF7F33333333333009033
                    33333333337737F3333333333333003333333333333377333333333333333333
                    3333333333333333333333333333333333333333333333333333333333333333
                    3333333333333333333333333333333333333333333333333333}
                  NumGlyphs = 2
                end
                object ButtonNext: TBitBtn
                  Left = 261
                  Top = 1
                  Width = 62
                  Height = 24
                  Caption = #19979#19968#39029
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 6
                  Glyph.Data = {
                    76010000424D7601000000000000760000002800000020000000100000000100
                    0400000000000001000000000000000000001000000010000000000000000000
                    800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                    3333333333333333333333333333333333333333333333333333333333333333
                    3333333333333333333333333333333333333333333FF3333333333333003333
                    3333333333773FF3333333333309003333333333337F773FF333333333099900
                    33333FFFFF7F33773FF30000000999990033777777733333773F099999999999
                    99007FFFFFFF33333F7700000009999900337777777F333F7733333333099900
                    33333333337F3F77333333333309003333333333337F77333333333333003333
                    3333333333773333333333333333333333333333333333333333333333333333
                    3333333333333333333333333333333333333333333333333333}
                  Layout = blGlyphRight
                  NumGlyphs = 2
                end
                object BLastPage: TBitBtn
                  Left = 322
                  Top = 1
                  Width = 63
                  Height = 24
                  Caption = #23614#39029
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 5
                  Glyph.Data = {
                    36010000424D3601000000000000760000002800000011000000100000000100
                    040000000000C0000000C40E0000C40E00001000000000000000000000000000
                    800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                    3333300000003333333333333333300000003333333333333333300000003333
                    3333333333330000000033333300333333300000000033333309003333309000
                    0000333333099900333090000000000000099999003090000000099999999999
                    9900900000000000000999990030900000003333330999003330900000003333
                    3309003333309000000033333330033333309000000033333333333333303000
                    0000333333333333333330000000333333333333333330000000}
                  Layout = blGlyphRight
                end
                object BitBtnZoomOut: TBitBtn
                  Left = 45
                  Top = 1
                  Width = 45
                  Height = 24
                  Caption = #32553#23567
                  TabOrder = 8
                  OnClick = BitBtnZoomOutClick
                end
                object ButtonZoomOld: TButton
                  Left = 89
                  Top = 1
                  Width = 45
                  Height = 24
                  Caption = #24674#22797
                  TabOrder = 0
                  OnClick = ButtonZoomOldClick
                end
              end
            end
            object TabSheet7: TTabSheet
              Caption = #26609#29366#22270
              ImageIndex = 1
              object DBChart3: TDBChart
                Left = 0
                Top = 0
                Width = 841
                Height = 183
                AllowZoom = False
                BackWall.Brush.Color = clWhite
                BackWall.Brush.Style = bsClear
                BackWall.Color = clWhite
                BackWall.Pen.Visible = False
                Title.Font.Charset = GB2312_CHARSET
                Title.Font.Color = clBlue
                Title.Font.Height = -19
                Title.Font.Name = #23435#20307
                Title.Font.Style = []
                Title.Text.Strings = (
                  '')
                BackColor = clWhite
                BottomAxis.Title.Caption = #36710#36742
                BottomAxis.Title.Font.Charset = GB2312_CHARSET
                BottomAxis.Title.Font.Color = clBlack
                BottomAxis.Title.Font.Height = -13
                BottomAxis.Title.Font.Name = #23435#20307
                BottomAxis.Title.Font.Style = []
                Frame.Visible = False
                LeftAxis.Title.Caption = #27425#25968
                LeftAxis.Title.Font.Charset = GB2312_CHARSET
                LeftAxis.Title.Font.Color = clBlack
                LeftAxis.Title.Font.Height = -13
                LeftAxis.Title.Font.Name = #23435#20307
                LeftAxis.Title.Font.Style = []
                View3D = False
                Align = alClient
                BorderStyle = bsSingle
                Color = clWhite
                TabOrder = 0
                OnMouseMove = DBChart3MouseMove
                object LabelSelectPointInfoT: TLabel
                  Left = 136
                  Top = 166
                  Width = 140
                  Height = 13
                  Caption = 'LabelSelectPointInfo'
                  Color = clYellow
                  ParentColor = False
                end
              end
            end
          end
        end
      end
      object TabSheet3: TTabSheet
        Caption = #19981#28385#24847#39033#32479#35745
        ImageIndex = 1
        TabVisible = False
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 851
          Height = 533
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object Panel6: TPanel
            Left = 1
            Top = 1
            Width = 849
            Height = 90
            Align = alTop
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object SpeedButton1: TSpeedButton
              Left = 539
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
            object SpeedButton2: TSpeedButton
              Left = 613
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
              OnClick = SpeedButton2Click
            end
            object SpeedButton5: TSpeedButton
              Left = 858
              Top = 43
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
            object Label4: TLabel
              Left = 256
              Top = 57
              Width = 7
              Height = 13
              Caption = '-'
            end
            object Label6: TLabel
              Left = 35
              Top = 57
              Width = 39
              Height = 13
              Caption = #26102#38388#65306
            end
            object BitBtn1: TBitBtn
              Left = 790
              Top = 42
              Width = 73
              Height = 24
              Caption = 'Excel'
              TabOrder = 0
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
            object BitBtn3: TBitBtn
              Left = 687
              Top = 33
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
            object ComboBox1: TComboBox
              Left = 72
              Top = 21
              Width = 129
              Height = 21
              ItemHeight = 0
              TabOrder = 2
            end
            object DateTimePicker3: TDateTimePicker
              Left = 71
              Top = 53
              Width = 97
              Height = 21
              Date = 38699.755564791670000000
              Time = 38699.755564791670000000
              TabOrder = 3
            end
            object DateTimePicker4: TDateTimePicker
              Left = 269
              Top = 53
              Width = 96
              Height = 21
              Date = 38699.755564791670000000
              Time = 38699.755564791670000000
              TabOrder = 4
            end
            object DateTimePicker5: TDateTimePicker
              Left = 168
              Top = 53
              Width = 80
              Height = 21
              Date = 40061.000000000000000000
              Time = 40061.000000000000000000
              Kind = dtkTime
              TabOrder = 5
            end
            object DateTimePicker6: TDateTimePicker
              Left = 366
              Top = 53
              Width = 80
              Height = 21
              Date = 40061.999988425930000000
              Time = 40061.999988425930000000
              Kind = dtkTime
              TabOrder = 6
            end
          end
          object Panel8: TPanel
            Left = 1
            Top = 91
            Width = 849
            Height = 173
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object DBGridEh2: TDBGridEh
              Left = 0
              Top = 0
              Width = 849
              Height = 173
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
                  FieldName = 'fact_id'
                  Footers = <>
                  Title.Caption = #21378#23478#32534#21495
                  Width = 70
                end
                item
                  EditButtons = <>
                  FieldName = 'dev_id'
                  Footers = <>
                  Title.Caption = #36710#26426#32534#21495
                  Width = 70
                end
                item
                  EditButtons = <>
                  FieldName = 'CAR_NO'
                  Footers = <>
                  Title.Caption = #36710#29260#21495
                  Width = 80
                end
                item
                  EditButtons = <>
                  FieldName = 'notOk_Desc'
                  Footers = <>
                  Title.Caption = #19981#28385#24847#20869#23481
                  Width = 150
                end
                item
                  EditButtons = <>
                  FieldName = 'cnt_NotOk'
                  Footers = <>
                  Title.Caption = #27425#25968
                  Width = 60
                end>
            end
          end
          object cxSplitter1: TcxSplitter
            Left = 1
            Top = 264
            Width = 849
            Height = 8
            Cursor = crVSplit
            HotZoneClassName = 'TcxSimpleStyle'
            HotZone.SizePercent = 31
            AlignSplitter = salBottom
            AutoSnap = True
            MinSize = 22
            ResizeUpdate = True
            Control = PageControl4
          end
          object PageControl4: TPageControl
            Left = 1
            Top = 272
            Width = 849
            Height = 260
            ActivePage = TabSheet4
            Align = alBottom
            TabOrder = 3
            object TabSheet4: TTabSheet
              Caption = #32447#24418#22270
              object DBChart2: TDBChart
                Left = 0
                Top = 0
                Width = 841
                Height = 232
                AllowZoom = False
                BackWall.Brush.Color = clWhite
                BackWall.Brush.Style = bsClear
                BackWall.Color = clWhite
                BackWall.Pen.Visible = False
                Title.Font.Charset = GB2312_CHARSET
                Title.Font.Color = clBlue
                Title.Font.Height = -19
                Title.Font.Name = #23435#20307
                Title.Font.Style = []
                Title.Text.Strings = (
                  '')
                BackColor = clWhite
                BottomAxis.Title.Caption = #36710#36742
                BottomAxis.Title.Font.Charset = GB2312_CHARSET
                BottomAxis.Title.Font.Color = clBlack
                BottomAxis.Title.Font.Height = -13
                BottomAxis.Title.Font.Name = #23435#20307
                BottomAxis.Title.Font.Style = []
                Frame.Visible = False
                LeftAxis.Title.Caption = #27425#25968
                LeftAxis.Title.Font.Charset = GB2312_CHARSET
                LeftAxis.Title.Font.Color = clBlack
                LeftAxis.Title.Font.Height = -13
                LeftAxis.Title.Font.Name = #23435#20307
                LeftAxis.Title.Font.Style = []
                View3D = False
                Align = alClient
                BorderStyle = bsSingle
                Color = clWhite
                TabOrder = 0
                object FastLineSeries1: TFastLineSeries
                  Marks.ArrowLength = 8
                  Marks.Visible = False
                  SeriesColor = clRed
                  LinePen.Color = clRed
                  LinePen.Width = 2
                  XValues.DateTime = False
                  XValues.Name = 'X'
                  XValues.Multiplier = 1.000000000000000000
                  XValues.Order = loAscending
                  YValues.DateTime = False
                  YValues.Name = 'Y'
                  YValues.Multiplier = 1.000000000000000000
                  YValues.Order = loNone
                end
              end
            end
            object TabSheet5: TTabSheet
              Caption = #26609#29366#22270
              ImageIndex = 1
              object DBChart4: TDBChart
                Left = 0
                Top = 0
                Width = 841
                Height = 232
                AllowZoom = False
                BackWall.Brush.Color = clWhite
                BackWall.Brush.Style = bsClear
                BackWall.Color = clWhite
                BackWall.Pen.Visible = False
                Title.Font.Charset = GB2312_CHARSET
                Title.Font.Color = clBlue
                Title.Font.Height = -19
                Title.Font.Name = #23435#20307
                Title.Font.Style = []
                Title.Text.Strings = (
                  '')
                BackColor = clWhite
                BottomAxis.Title.Caption = #36710#36742
                BottomAxis.Title.Font.Charset = GB2312_CHARSET
                BottomAxis.Title.Font.Color = clBlack
                BottomAxis.Title.Font.Height = -13
                BottomAxis.Title.Font.Name = #23435#20307
                BottomAxis.Title.Font.Style = []
                Frame.Visible = False
                LeftAxis.Title.Caption = #27425#25968
                LeftAxis.Title.Font.Charset = GB2312_CHARSET
                LeftAxis.Title.Font.Color = clBlack
                LeftAxis.Title.Font.Height = -13
                LeftAxis.Title.Font.Name = #23435#20307
                LeftAxis.Title.Font.Style = []
                View3D = False
                Align = alClient
                BorderStyle = bsSingle
                Color = clWhite
                TabOrder = 0
                object BarSeries1: TBarSeries
                  Marks.ArrowLength = 8
                  Marks.Style = smsValue
                  Marks.Visible = True
                  SeriesColor = clRed
                  XValues.DateTime = False
                  XValues.Name = 'X'
                  XValues.Multiplier = 1.000000000000000000
                  XValues.Order = loAscending
                  YValues.DateTime = False
                  YValues.Name = 'Bar'
                  YValues.Multiplier = 1.000000000000000000
                  YValues.Order = loNone
                end
              end
            end
          end
        end
      end
    end
  end
  object cxSplitter3: TcxSplitter [2]
    Left = 203
    Top = 0
    Width = 8
    Height = 563
    HotZoneClassName = 'TcxSimpleStyle'
    Control = Panel7
  end
  object DataSource2: TDataSource
    Left = 393
    Top = 212
  end
end
