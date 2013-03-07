object DevHourDisFrm: TDevHourDisFrm
  Left = 167
  Top = 114
  Width = 1024
  Height = 605
  Caption = #26597#35810#36710#36742#34892#39542#37324#31243
  Color = clBtnFace
  DragKind = dkDock
  DragMode = dmAutomatic
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel7: TPanel
    Left = 0
    Top = 0
    Width = 203
    Height = 578
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    object PageControl2: TPageControl
      Left = 0
      Top = 0
      Width = 203
      Height = 578
      ActivePage = TabSheet2
      Align = alClient
      TabOrder = 0
      object TabSheet2: TTabSheet
        Caption = #36710#36742#20998#32452
        object TreeView1: TTreeView
          Left = 0
          Top = 0
          Width = 195
          Height = 517
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
          Top = 517
          Width = 195
          Height = 33
          Align = alBottom
          BevelInner = bvLowered
          BevelOuter = bvNone
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
    Height = 578
    Cursor = crHSplit
    HotZoneClassName = 'TcxSimpleStyle'
    HotZone.SizePercent = 31
    AutoSnap = True
    MinSize = 22
    ResizeUpdate = True
    Control = Panel7
  end
  object PageControl1: TPageControl
    Left = 211
    Top = 0
    Width = 805
    Height = 578
    ActivePage = TabSheet1
    Align = alClient
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = #27599#23567#26102#37324#31243#26126#32454
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 797
        Height = 550
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object Panel3: TPanel
          Left = 1
          Top = 1
          Width = 795
          Height = 54
          Align = alTop
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object Label5: TLabel
            Left = 421
            Top = 19
            Width = 7
            Height = 13
            Caption = '-'
          end
          object Label2: TLabel
            Left = 23
            Top = 23
            Width = 104
            Height = 13
            Caption = #35831#36755#20837#36710#29260#21495#30721#65306
          end
          object SpeedButton1: TSpeedButton
            Left = 564
            Top = 15
            Width = 73
            Height = 24
            Caption = #30830#35748
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
            OnClick = SpeedButton1Click
          end
          object Label3: TLabel
            Left = 250
            Top = 21
            Width = 78
            Height = 13
            Caption = #26597#35810#26102#38388#27573#65306
          end
          object SpeedButton3: TSpeedButton
            Left = 636
            Top = 15
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
            Left = 708
            Top = 15
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
          object DateTimePicker1: TDateTimePicker
            Left = 322
            Top = 17
            Width = 97
            Height = 21
            Date = 38699.755564791670000000
            Time = 38699.755564791670000000
            TabOrder = 0
          end
          object DateTimePicker2: TDateTimePicker
            Left = 430
            Top = 17
            Width = 96
            Height = 21
            Date = 38699.755564791670000000
            Time = 38699.755564791670000000
            TabOrder = 1
          end
          object ComboBoxCarNo: TComboBox
            Left = 121
            Top = 18
            Width = 94
            Height = 21
            ItemHeight = 13
            TabOrder = 2
          end
        end
        object Panel4: TPanel
          Left = 1
          Top = 63
          Width = 795
          Height = 486
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object DBGridEh1: TDBGridEh
            Left = 0
            Top = 0
            Width = 795
            Height = 486
            Align = alClient
            Ctl3D = True
            DataSource = DataSource1
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
                FieldName = 'car_No'
                Footer.Value = #21512#35745#65306
                Footer.ValueType = fvtStaticText
                Footers = <>
                Title.Caption = #36710#29260#21495#30721
                Title.TitleButton = True
                Width = 196
              end
              item
                EditButtons = <>
                FieldName = 'devId'
                Footers = <>
                Title.Caption = #35774#22791#32534#21495
                Title.TitleButton = True
                Width = 201
              end
              item
                EditButtons = <>
                FieldName = 'hTime'
                Footer.ValueType = fvtCount
                Footers = <>
                Title.Caption = #26102#38388
                Title.TitleButton = True
                Width = 180
              end
              item
                DisplayFormat = '0.000'
                EditButtons = <>
                FieldName = 'hDis'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #34892#39542#37324#31243#65288#20844#37324#65289
                Title.TitleButton = True
                Width = 164
              end
              item
                DisplayFormat = '0.000'
                EditButtons = <>
                FieldName = 'oil'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #29702#35770#27833#32791#65288#21319#65289
                Title.TitleButton = True
                Visible = False
                Width = 118
              end>
          end
        end
        object cxSplitter2: TcxSplitter
          Left = 1
          Top = 55
          Width = 795
          Height = 8
          Cursor = crHSplit
          HotZoneClassName = 'TcxSimpleStyle'
          HotZone.SizePercent = 100
          AlignSplitter = salTop
          AutoSnap = True
          MinSize = 22
          ResizeUpdate = True
          Control = Panel3
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = #26376#34892#39542#37324#31243#32479#35745
      ImageIndex = 1
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 797
        Height = 550
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object Panel5: TPanel
          Left = 1
          Top = 1
          Width = 795
          Height = 54
          Align = alTop
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object Label4: TLabel
            Left = 30
            Top = 23
            Width = 104
            Height = 13
            Caption = #35831#36755#20837#36710#29260#21495#30721#65306
          end
          object SpeedButtonMonthTj: TSpeedButton
            Left = 554
            Top = 15
            Width = 73
            Height = 24
            Caption = #30830#35748
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
            OnClick = SpeedButtonMonthTjClick
          end
          object Label6: TLabel
            Left = 292
            Top = 21
            Width = 65
            Height = 13
            Caption = #32479#35745#26376#20221#65306
          end
          object SpeedButtonPrintMonthTj: TSpeedButton
            Left = 626
            Top = 15
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
            OnClick = SpeedButtonPrintMonthTjClick
          end
          object SpeedButton6: TSpeedButton
            Left = 698
            Top = 15
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
          object ComboBoxTjCarNo: TComboBox
            Left = 133
            Top = 18
            Width = 129
            Height = 21
            ItemHeight = 13
            TabOrder = 0
          end
          object ComboBoxTjYf: TComboBox
            Left = 361
            Top = 16
            Width = 119
            Height = 22
            Style = csOwnerDrawFixed
            ItemHeight = 16
            TabOrder = 1
          end
        end
        object Panel6: TPanel
          Left = 1
          Top = 63
          Width = 795
          Height = 486
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object DBGridEh2: TDBGridEh
            Left = 0
            Top = 0
            Width = 795
            Height = 486
            Align = alClient
            DataSource = DataSource2
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
            TitleHeight = 15
            UseMultiTitle = True
            Columns = <
              item
                EditButtons = <>
                FieldName = 'car_no'
                Footer.Value = #21512#35745#65306
                Footer.ValueType = fvtStaticText
                Footers = <>
                Title.Caption = #36710#29260#21495#30721
                Title.SortIndex = 1
                Title.SortMarker = smUpEh
                Title.TitleButton = True
                Width = 140
              end
              item
                EditButtons = <>
                FieldName = 'dev_Id'
                Footer.ValueType = fvtCount
                Footers = <>
                Title.Caption = #35774#22791'ID'#21495
                Title.TitleButton = True
                Width = 135
              end
              item
                EditButtons = <>
                FieldName = 'Disp_Label'
                Footers = <>
                Title.Caption = #35774#22791#21517#31216
                Title.TitleButton = True
                Width = 156
              end
              item
                DisplayFormat = '0.000'
                EditButtons = <>
                FieldName = 'sdis'
                Footer.FieldName = 'sdis'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #26376#34892#39542#37324#31243'('#20844#37324')'
                Title.TitleButton = True
                Width = 150
              end
              item
                EditButtons = <>
                FieldName = 'oil'
                Footers = <>
                Title.TitleButton = True
                Visible = False
              end>
          end
        end
        object cxSplitter3: TcxSplitter
          Left = 1
          Top = 55
          Width = 795
          Height = 8
          Cursor = crHSplit
          HotZoneClassName = 'TcxSimpleStyle'
          HotZone.SizePercent = 100
          AlignSplitter = salTop
          AutoSnap = True
          MinSize = 22
          ResizeUpdate = True
          Control = Panel5
        end
      end
    end
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 381
    Top = 146
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 341
    Top = 146
  end
  object PrintDBGridEh1: TPrintDBGridEh
    DBGridEh = DBGridEh1
    Options = [pghFitGridToPageWidth, pghColored, pghRowAutoStretch]
    Page.BottomMargin = 1.000000000000000000
    Page.LeftMargin = 1.000000000000000000
    Page.RightMargin = 1.000000000000000000
    Page.TopMargin = 1.000000000000000000
    PageFooter.Font.Charset = GB2312_CHARSET
    PageFooter.Font.Color = clWindowText
    PageFooter.Font.Height = -12
    PageFooter.Font.Name = #23435#20307
    PageFooter.Font.Style = []
    PageHeader.Font.Charset = GB2312_CHARSET
    PageHeader.Font.Color = clWindowText
    PageHeader.Font.Height = -21
    PageHeader.Font.Name = #23435#20307
    PageHeader.Font.Style = []
    PrintFontName = #23435#20307
    Units = MM
    Left = 265
    Top = 145
  end
  object DataSource2: TDataSource
    DataSet = ClientDataSet2
    Left = 509
    Top = 130
  end
  object ClientDataSet2: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 541
    Top = 138
  end
  object PrintDBGridEh2: TPrintDBGridEh
    DBGridEh = DBGridEh2
    Options = [pghFitGridToPageWidth, pghColored, pghRowAutoStretch]
    Page.BottomMargin = 1.000000000000000000
    Page.LeftMargin = 1.000000000000000000
    Page.RightMargin = 1.000000000000000000
    Page.TopMargin = 1.000000000000000000
    PageFooter.Font.Charset = GB2312_CHARSET
    PageFooter.Font.Color = clWindowText
    PageFooter.Font.Height = -12
    PageFooter.Font.Name = #23435#20307
    PageFooter.Font.Style = []
    PageHeader.Font.Charset = GB2312_CHARSET
    PageHeader.Font.Color = clWindowText
    PageHeader.Font.Height = -21
    PageHeader.Font.Name = #23435#20307
    PageHeader.Font.Style = []
    PrintFontName = #23435#20307
    Units = MM
    Left = 481
    Top = 129
  end
end
