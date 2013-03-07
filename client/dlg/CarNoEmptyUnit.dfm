object CarNoEmptyFrm: TCarNoEmptyFrm
  Left = 7
  Top = 113
  Width = 1008
  Height = 630
  Caption = #26597#35810#19981#22312#32447#36710#36742
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 85
    Width = 1000
    Height = 518
    Align = alClient
    Caption = #26174#31034#20449#24687
    TabOrder = 0
    object AdInfoList: TcxTreeList
      Left = 2
      Top = 15
      Width = 996
      Height = 201
      Align = alClient
      Bands = <
        item
          Caption.AlignHorz = taCenter
          Caption.Text = #22522#26412#20449#24687
          Width = 788
        end>
      BufferedPaint = True
      OptionsData.Editing = False
      OptionsData.Deleting = False
      OptionsSelection.MultiSelect = True
      OptionsView.GridLines = tlglBoth
      OptionsView.ShowRoot = False
      TabOrder = 0
      object AdInfoListcxTreeListColumn1: TcxTreeListColumn
        Caption.Text = '/ '#26102' '
        DataBinding.ValueType = 'String'
        Width = 113
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object AdInfoListcxTreeListColumn2: TcxTreeListColumn
        Caption.Text = #19981#22312#32447#36710#29260#21495#30721
        DataBinding.ValueType = 'String'
        Width = 678
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object AdInfoListcxTreeListColumn3: TcxTreeListColumn
        Caption.Text = #25968#30446
        DataBinding.ValueType = 'String'
        Width = 89
        Position.ColIndex = 2
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object AdInfoListcxTreeListColumn4: TcxTreeListColumn
        Caption.Text = #22312#32447#27604#20363
        DataBinding.ValueType = 'String'
        Width = 108
        Position.ColIndex = 3
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
    end
    object DBChart1: TDBChart
      Left = 2
      Top = 224
      Width = 996
      Height = 292
      AllowPanning = pmVertical
      AllowZoom = False
      BackWall.Brush.Color = clWhite
      BackWall.Brush.Style = bsClear
      BackWall.Color = clWhite
      BackWall.Pen.Visible = False
      Foot.AdjustFrame = False
      Title.Font.Charset = GB2312_CHARSET
      Title.Font.Color = clBlue
      Title.Font.Height = -19
      Title.Font.Name = #23435#20307
      Title.Font.Style = []
      Title.Text.Strings = (
        #19981#22312#32447#36710#36742#32479#35745
        '')
      BackColor = clWhite
      BottomAxis.Automatic = False
      BottomAxis.AutomaticMaximum = False
      BottomAxis.AutomaticMinimum = False
      BottomAxis.ExactDateTime = False
      BottomAxis.Increment = 0.500000000000000000
      BottomAxis.Maximum = 23.000000000000000000
      BottomAxis.Title.Caption = #26085#26399
      BottomAxis.Title.Font.Charset = GB2312_CHARSET
      BottomAxis.Title.Font.Color = clBlack
      BottomAxis.Title.Font.Height = -13
      BottomAxis.Title.Font.Name = #23435#20307
      BottomAxis.Title.Font.Style = []
      Frame.Visible = False
      LeftAxis.Automatic = False
      LeftAxis.AutomaticMaximum = False
      LeftAxis.AutomaticMinimum = False
      LeftAxis.ExactDateTime = False
      LeftAxis.Increment = 10.000000000000000000
      LeftAxis.Maximum = 80.000000000000000000
      LeftAxis.Title.Caption = #31354#36710#25968#30446
      LeftAxis.Title.Font.Charset = GB2312_CHARSET
      LeftAxis.Title.Font.Color = clRed
      LeftAxis.Title.Font.Height = -13
      LeftAxis.Title.Font.Name = #23435#20307
      LeftAxis.Title.Font.Style = []
      Legend.ColorWidth = 55
      Legend.DividingLines.Visible = True
      Legend.Inverted = True
      Legend.LegendStyle = lsLastValues
      Legend.TextStyle = ltsPlain
      Legend.TopPos = 5
      Legend.Visible = False
      View3D = False
      Align = alBottom
      BevelInner = bvLowered
      BevelWidth = 3
      BorderStyle = bsSingle
      Color = clWhite
      TabOrder = 1
      object FastLineSeries1: TLineSeries
        Marks.ArrowLength = 8
        Marks.Style = smsLegend
        Marks.Visible = False
        SeriesColor = 4227327
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        Pointer.Visible = False
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
    object cxSplitter2: TcxSplitter
      Left = 2
      Top = 216
      Width = 996
      Height = 8
      Cursor = crHSplit
      HotZoneClassName = 'TcxSimpleStyle'
      HotZone.SizePercent = 100
      AlignSplitter = salBottom
      AutoSnap = True
      MinSize = 22
      ResizeUpdate = True
      Control = DBChart1
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 1000
    Height = 46
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = #26597#35810#19981#22312#32447#36710#36742
    Color = clMoneyGreen
    Font.Charset = GB2312_CHARSET
    Font.Color = clGreen
    Font.Height = -24
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object Panel2: TPanel
    Left = 0
    Top = 46
    Width = 1000
    Height = 39
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 2
    object SpeedButton4: TSpeedButton
      Left = 884
      Top = 5
      Width = 73
      Height = 25
      Caption = #36864#20986
      Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        1000030000000002000000000000000000000000000000000000007C0000E003
        00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        AD351F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7CA101
        6002AA291F7C1F7C1F7CAD358619C001210AAD351F7C1F7C1F7C1F7C1F7C8212
        60021F7C1F7C1F7C4212C31AC31A810E6733C001AE311F7C1F7C1F7CE109C31A
        C0011F7C1F7CC309AA472733010E8709AA43A21282091F7C1F7C1F7C831E6002
        A81D1F7C1F7C1F7C1F7C1F7C1F7C1F7C2212893FA10E830D0006600660022002
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C4316E31EA10E810E810A20028609
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C70391F7C2212052FA212610EAB2D1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C831E621670391F7C2633A216A212AB2D1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7CA5260427AB2D1F7CE52EC31AA2168105E005610A
        E0011F7C1F7C1F7C1F7C1F7CC10947378209A209831AC31EC31AC316810A810A
        610AAD351F7C1F7C1F7C1F7C1F7CCA474733683767332627420EA0011F7C831A
        A10EAB2D1F7C1F7C1F7C1F7C1F7C8A3F641A020E1F7C1F7CC00185151F7CC005
        A21285151F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7CA4224737E31EA71D210A
        8006850D1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C693FCB4B263386191F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7CA522C2091F7C1F7C
        1F7C1F7C1F7C}
      OnClick = SpeedButton4Click
    end
    object Label1: TLabel
      Left = 472
      Top = 14
      Width = 48
      Height = 13
      Caption = #26597#35810#26102#38388
    end
    object Button1: TButton
      Left = 683
      Top = 5
      Width = 73
      Height = 25
      Caption = #26597#35810
      TabOrder = 0
    end
    object DateTimePicker1: TDateTimePicker
      Left = 535
      Top = 10
      Width = 126
      Height = 21
      Date = 38699.755564791670000000
      Time = 38699.755564791670000000
      TabOrder = 1
    end
    object Button2: TButton
      Left = 786
      Top = 5
      Width = 75
      Height = 25
      Caption = #23548#20986
      TabOrder = 2
      OnClick = Button2Click
    end
  end
  object ADOQuery1: TADOQuery
    Parameters = <>
    Left = 648
    Top = 236
  end
end
