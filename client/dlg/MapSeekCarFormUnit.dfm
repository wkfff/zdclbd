object MapSeekCarForm: TMapSeekCarForm
  Left = 354
  Top = 2
  Width = 758
  Height = 599
  Caption = #23450#26102#23450#20301#36710#36742#26597#35810
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 750
    Height = 524
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel3'
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 595
      Top = 0
      Height = 524
      Align = alRight
      Beveled = True
    end
    object Panel8: TPanel
      Left = 598
      Top = 0
      Width = 152
      Height = 524
      Align = alRight
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'Panel8'
      TabOrder = 0
      object ListViewTo: TListView
        Left = 1
        Top = 20
        Width = 150
        Height = 475
        Align = alClient
        Columns = <
          item
            Caption = #36710#29260#21495
            Width = 140
          end>
        GridLines = True
        MultiSelect = True
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
      end
      object Panel7: TPanel
        Left = 1
        Top = 1
        Width = 150
        Height = 19
        Align = alTop
        Caption = #26597#35810#20197#19979#36710#36742#65306
        Color = 15265488
        TabOrder = 1
      end
      object Panel1: TPanel
        Left = 1
        Top = 495
        Width = 150
        Height = 28
        Align = alBottom
        TabOrder = 2
        object BitBtn1: TBitBtn
          Left = 1
          Top = 2
          Width = 78
          Height = 25
          Caption = #37325#26032#36873#25321
          TabOrder = 0
          OnClick = BitBtn1Click
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00000000000C0C0C000C0C0C00373737000C0C0C000C0C
            0C0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0000000000D4F0FF00D4F0FF0000000000D4F0FF00D4F0
            FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF000000000049FF790000631F00008A2C000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00000000000000000000EC3E0000CE3300008A2C000000
            000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0000000000D4F0FF0000541A0084FFA40052FF7E0000C03E000054
            1A00D4F0FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF000000000084FFA40084FFA40084FFA40052FF7E0000C03E0000C0
            3E0000C03E0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF000000000084FFA40084FFA40052FF7E0000C03E0000C0
            3E0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF000C0C0C0084FFA40084FFA40000C03E000C0C
            0C00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF000F0F0F000F0F0F000F0F0F00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF000F0F0F008DB5FF008DB5FF008DB5FF000F0F
            0F00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF000F0F0F00D4E3FF00D4E3FF008DB5FF000F0F
            0F00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF000F0F0F00D4E3FF00D4E3FF008DB5FF000F0F
            0F00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF000F0F0F000F0F0F000F0F0F00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        end
        object BitBtn2: TBitBtn
          Left = 79
          Top = 2
          Width = 70
          Height = 25
          Caption = #31227#38500
          TabOrder = 1
          OnClick = BitBtn2Click
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00000000000000CC0000000000FF00FF00FF00FF00FF00FF000000
            00000000CC0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000008282FF005050FF000000CC0000000000FF00FF00000000000000
            CC001D1DFF000000AD0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00000000008282FF005050FF000000CC00000000000000F1001D1D
            FF006E6EFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00000000008282FF005050FF000000F1001D1DFF006E6E
            FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00000000008282FF005050FF001D1DFF000000
            0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00000000008282FF005050FF005050FF005050FF000000
            F10000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00000000008282FF005050FF008282FF00000000008282FF005050
            FF000000F10000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000008282FF005050FF008282FF0000000000FF00FF00000000008282
            FF005050FF000000CC0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0000000000BBBBFF0000000000FF00FF00FF00FF00FF00FF000000
            00008282FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        end
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 595
      Height = 524
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel2'
      TabOrder = 1
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 595
        Height = 54
        Align = alTop
        BevelInner = bvLowered
        BevelOuter = bvNone
        TabOrder = 0
        object Label1: TLabel
          Left = 5
          Top = 12
          Width = 65
          Height = 13
          Caption = #36215#22987#26102#38388#65306
          Font.Charset = GB2312_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 252
          Top = 12
          Width = 65
          Height = 13
          Caption = #32467#26463#26102#38388#65306
          Font.Charset = GB2312_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 3
          Top = 32
          Width = 59
          Height = 13
          Caption = #26174#31034#36873#25321':'
        end
        object start_date: TDateTimePicker
          Left = 67
          Top = 8
          Width = 93
          Height = 21
          Date = 38141.000000000000000000
          Format = 'yyyy-MM-dd'
          Time = 38141.000000000000000000
          TabOrder = 0
        end
        object start_time: TDateTimePicker
          Left = 160
          Top = 8
          Width = 84
          Height = 21
          Date = 38141.683325694440000000
          Format = 'HH:mm:ss'
          Time = 38141.683325694440000000
          Kind = dtkTime
          TabOrder = 1
        end
        object end_date: TDateTimePicker
          Left = 314
          Top = 8
          Width = 93
          Height = 21
          Date = 38141.000000000000000000
          Format = 'yyyy-MM-dd'
          Time = 38141.000000000000000000
          TabOrder = 2
        end
        object end_time: TDateTimePicker
          Left = 407
          Top = 8
          Width = 84
          Height = 21
          Date = 38141.683497129630000000
          Format = 'HH:mm:ss'
          Time = 38141.683497129630000000
          Kind = dtkTime
          TabOrder = 3
        end
        object CheckBoxFirst: TCheckBox
          Left = 67
          Top = 32
          Width = 102
          Height = 17
          Caption = #26174#31034#26368#26089#26102#38388
          Checked = True
          State = cbChecked
          TabOrder = 4
          OnClick = CheckBoxFirstClick
        end
        object CheckBoxLast: TCheckBox
          Left = 191
          Top = 32
          Width = 96
          Height = 17
          Caption = #26174#31034#26368#26202#26102#38388
          Checked = True
          State = cbChecked
          TabOrder = 5
          OnClick = CheckBoxFirstClick
        end
        object CheckBoxAll: TCheckBox
          Left = 315
          Top = 32
          Width = 75
          Height = 17
          Caption = #26174#31034#20840#37096
          TabOrder = 6
          OnClick = CheckBoxFirstClick
        end
        object CheckBox1: TCheckBox
          Left = 545
          Top = 9
          Width = 61
          Height = 17
          Caption = #32467#26463
          TabOrder = 7
          OnClick = CheckBox1Click
        end
        object CheckBox2: TCheckBox
          Left = 493
          Top = 9
          Width = 50
          Height = 17
          Caption = #24320#22987
          Checked = True
          State = cbChecked
          TabOrder = 8
          OnClick = CheckBox2Click
        end
      end
      object CarList: TcxTreeList
        Left = 0
        Top = 54
        Width = 595
        Height = 278
        Hint = #24050#21457#31616#30701#28040#24687#26597#35810
        Align = alClient
        Bands = <
          item
            Caption.Text = 'Band1'
            Width = 565
          end>
        BufferedPaint = True
        OptionsData.Editing = False
        OptionsData.Deleting = False
        OptionsView.GridLines = tlglBoth
        OptionsView.ShowRoot = False
        TabOrder = 1
        OnDblClick = CarListDblClick
        object CarNo: TcxTreeListColumn
          Caption.Text = #36710#29260#21495
          DataBinding.ValueType = 'String'
          Width = 98
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object HisDateTime: TcxTreeListColumn
          Caption.Text = #26102#38388
          DataBinding.ValueType = 'String'
          Width = 154
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
          SortOrder = soDescending
        end
        object HisSpeet: TcxTreeListColumn
          Caption.Text = #36895#24230
          DataBinding.ValueType = 'String'
          Width = 69
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object HisLa: TcxTreeListColumn
          Caption.Text = #32463#24230
          DataBinding.ValueType = 'String'
          Width = 115
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object HisLo: TcxTreeListColumn
          Caption.Text = #32428#24230
          DataBinding.ValueType = 'String'
          Width = 129
          Position.ColIndex = 4
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 340
        Width = 595
        Height = 184
        Align = alBottom
        TabOrder = 2
        object cxTreeList1: TcxTreeList
          Left = 1
          Top = 24
          Width = 593
          Height = 159
          Hint = #24050#21457#31616#30701#28040#24687#26597#35810
          Align = alClient
          Bands = <
            item
              Caption.Text = 'Band1'
              Width = 565
            end>
          BufferedPaint = True
          OptionsData.Editing = False
          OptionsData.Deleting = False
          OptionsView.GridLines = tlglBoth
          OptionsView.ShowRoot = False
          TabOrder = 0
          OnDblClick = CarListDblClick
          object cxTreeListColumn1: TcxTreeListColumn
            Caption.Text = #36710#29260#21495
            DataBinding.ValueType = 'String'
            Width = 98
            Position.ColIndex = 0
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
          object cxTreeListColumn2: TcxTreeListColumn
            Caption.Text = #26102#38388
            DataBinding.ValueType = 'String'
            Width = 154
            Position.ColIndex = 1
            Position.RowIndex = 0
            Position.BandIndex = 0
            SortOrder = soDescending
          end
          object cxTreeListColumn3: TcxTreeListColumn
            Caption.Text = #36895#24230
            DataBinding.ValueType = 'String'
            Width = 69
            Position.ColIndex = 2
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
          object cxTreeListColumn4: TcxTreeListColumn
            Caption.Text = #32463#24230
            DataBinding.ValueType = 'String'
            Width = 115
            Position.ColIndex = 3
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
          object cxTreeListColumn5: TcxTreeListColumn
            Caption.Text = #32428#24230
            DataBinding.ValueType = 'String'
            Width = 129
            Position.ColIndex = 4
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
        end
        object Panel9: TPanel
          Left = 1
          Top = 1
          Width = 593
          Height = 23
          Align = alTop
          TabOrder = 1
          object Label4: TLabel
            Left = 8
            Top = 4
            Width = 143
            Height = 13
            Caption = #26597#35810#32467#26524#21516#26102#20986#29616#30340#36710#36742
          end
          object Label5: TLabel
            Left = 456
            Top = 6
            Width = 78
            Height = 13
            Caption = #26412#27425#26597#35810#27425#25968
          end
          object Label6: TLabel
            Left = 544
            Top = 6
            Width = 42
            Height = 13
            Caption = 'label6'
            Font.Charset = ANSI_CHARSET
            Font.Color = clGreen
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
        end
      end
      object cxSplitter2: TcxSplitter
        Left = 0
        Top = 332
        Width = 595
        Height = 8
        HotZoneClassName = 'TcxSimpleStyle'
        AlignSplitter = salBottom
        Control = Panel6
        Color = clBtnFace
        ShowHint = False
        ParentColor = False
        ParentShowHint = False
      end
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 524
    Width = 750
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Panel10: TPanel
      Left = 420
      Top = 1
      Width = 329
      Height = 39
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object SB_Query: TSpeedButton
        Left = 5
        Top = 7
        Width = 68
        Height = 26
        Caption = #26597#35810
        Glyph.Data = {
          42010000424D4201000000000000760000002800000011000000110000000100
          040000000000CC00000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          77777000000070000000007777777000000070FFFFFFF07777700000000070F7
          7777F07777000000000070F77777F07770007000000070F77780008700077000
          000070F7700FFF0000777000000070F708FFFF0807777000000070F80E000F07
          08777000000070F0EFEFEF0770777000000070F0F0000F077077700000007000
          EFEFFF0770777000000077780000000708777000000077770077777807777000
          0000777770077700777770000000777777800087777770000000777777777777
          777770000000}
        OnClick = SB_QueryClick
      end
      object BitBtn3: TBitBtn
        Left = 74
        Top = 7
        Width = 89
        Height = 26
        Caption = #23548#20986#26412#27425#36710#36742
        TabOrder = 0
        OnClick = BitBtn3Click
        NumGlyphs = 2
      end
      object BitBtnStop: TBitBtn
        Left = 166
        Top = 7
        Width = 68
        Height = 26
        Caption = #20572#27490
        TabOrder = 1
        OnClick = BitBtnStopClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333FFFFF333333000033333388888833333333333F888888FFF333
          000033338811111188333333338833FFF388FF33000033381119999111833333
          38F338888F338FF30000339119933331111833338F388333383338F300003391
          13333381111833338F8F3333833F38F3000039118333381119118338F38F3338
          33F8F38F000039183333811193918338F8F333833F838F8F0000391833381119
          33918338F8F33833F8338F8F000039183381119333918338F8F3833F83338F8F
          000039183811193333918338F8F833F83333838F000039118111933339118338
          F3833F83333833830000339111193333391833338F33F8333FF838F300003391
          11833338111833338F338FFFF883F83300003339111888811183333338FF3888
          83FF83330000333399111111993333333388FFFFFF8833330000333333999999
          3333333333338888883333330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
      object BitBtn4: TBitBtn
        Left = 235
        Top = 6
        Width = 85
        Height = 26
        Caption = #23548#20986#30456#21516#36710#36742
        TabOrder = 2
        OnClick = BitBtn4Click
      end
    end
    object ProgressBar1: TProgressBar
      Left = 8
      Top = 12
      Width = 409
      Height = 19
      TabOrder = 1
    end
  end
  object TimerShow: TTimer
    Enabled = False
    Interval = 1
    OnTimer = TimerShowTimer
    Left = 149
    Top = 81
  end
  object TimerClose: TTimer
    Enabled = False
    Interval = 1
    OnTimer = TimerCloseTimer
    Left = 141
    Top = 41
  end
end
