object EmptyFrm: TEmptyFrm
  Left = 230
  Top = 131
  Width = 1034
  Height = 735
  Caption = #31354#36710#29575#26597#35810
  Color = clBtnFace
  DragKind = dkDock
  DragMode = dmAutomatic
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1026
    Height = 708
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #31354#36710#29575
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 1018
        Height = 680
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object Panel2: TPanel
          Left = 1
          Top = 1
          Width = 1016
          Height = 80
          Align = alTop
          BiDiMode = bdLeftToRight
          ParentBiDiMode = False
          TabOrder = 0
          object SpeedButton4: TSpeedButton
            Left = 684
            Top = 31
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
          object Label2: TLabel
            Left = 450
            Top = 37
            Width = 13
            Height = 13
            Caption = #9472
          end
          object Label4: TLabel
            Left = 836
            Top = 45
            Width = 59
            Height = 13
            Caption = #30334#20998#27604#20540'%'
            Font.Charset = ANSI_CHARSET
            Font.Color = clMaroon
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object SpeedButton1: TSpeedButton
            Left = 608
            Top = 31
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
            OnClick = SpeedButton1Click
          end
          object Button1: TButton
            Left = 917
            Top = 15
            Width = 73
            Height = 24
            Caption = #26597#35810
            TabOrder = 0
            Visible = False
            OnClick = Button1Click
          end
          object DateTimePicker2: TDateTimePicker
            Left = 467
            Top = 33
            Width = 114
            Height = 21
            Date = 38699.755564791670000000
            Time = 38699.755564791670000000
            TabOrder = 1
          end
          object DateTimePicker1: TDateTimePicker
            Left = 334
            Top = 33
            Width = 113
            Height = 21
            Date = 38699.755564791670000000
            Time = 38699.755564791670000000
            TabOrder = 2
          end
          object CheckBox1: TCheckBox
            Left = 120
            Top = 35
            Width = 97
            Height = 17
            Caption = #26174#31034#20840#37096#29992#25143
            TabOrder = 3
          end
        end
        object cxSplitter2: TcxSplitter
          Left = 1
          Top = 81
          Width = 1016
          Height = 8
          Cursor = crVSplit
          HotZoneClassName = 'TcxSimpleStyle'
          AlignSplitter = salTop
          AutoSnap = True
          MinSize = 22
          ResizeUpdate = True
          Control = Panel2
        end
        object Panel5: TPanel
          Left = 1
          Top = 89
          Width = 1016
          Height = 375
          Align = alClient
          TabOrder = 2
          object AdInfoList: TcxTreeList
            Left = 1
            Top = 1
            Width = 1014
            Height = 373
            Align = alClient
            Bands = <
              item
                Caption.AlignHorz = taCenter
                Caption.Text = #22522#26412#20449#24687
                Width = 1921
              end>
            BufferedPaint = True
            OptionsData.Editing = False
            OptionsData.Deleting = False
            OptionsSelection.MultiSelect = True
            OptionsView.GridLines = tlglBoth
            OptionsView.ShowRoot = False
            TabOrder = 0
            OnClick = AdInfoListClick
            object AdInfoListcxTreeListColumn1: TcxTreeListColumn
              Caption.Text = #26085#26399
              DataBinding.ValueType = 'String'
              Position.ColIndex = 0
              Position.RowIndex = 0
              Position.BandIndex = 0
            end
            object AdInfoListcxTreeListColumn2: TcxTreeListColumn
              Caption.Text = '0'#26102
              DataBinding.ValueType = 'String'
              Width = 97
              Position.ColIndex = 1
              Position.RowIndex = 0
              Position.BandIndex = 0
            end
            object AdInfoListcxTreeListColumn3: TcxTreeListColumn
              Caption.Text = '1'#26102
              DataBinding.ValueType = 'String'
              Width = 98
              Position.ColIndex = 2
              Position.RowIndex = 0
              Position.BandIndex = 0
            end
            object AdInfoListcxTreeListColumn4: TcxTreeListColumn
              Caption.Text = '2'#26102
              DataBinding.ValueType = 'String'
              Width = 97
              Position.ColIndex = 3
              Position.RowIndex = 0
              Position.BandIndex = 0
              SortOrder = soAscending
            end
            object AdInfoListcxTreeListColumn5: TcxTreeListColumn
              Caption.Text = '3'#26102
              DataBinding.ValueType = 'String'
              Width = 98
              Position.ColIndex = 4
              Position.RowIndex = 0
              Position.BandIndex = 0
            end
            object AdInfoListcxTreeListColumn6: TcxTreeListColumn
              Caption.Text = '4'#26102
              DataBinding.ValueType = 'String'
              Width = 97
              Position.ColIndex = 5
              Position.RowIndex = 0
              Position.BandIndex = 0
            end
            object AdInfoListcxTreeListColumn7: TcxTreeListColumn
              Caption.Text = '5'#26102
              DataBinding.ValueType = 'String'
              Width = 97
              Position.ColIndex = 6
              Position.RowIndex = 0
              Position.BandIndex = 0
            end
            object AdInfoListcxTreeListColumn8: TcxTreeListColumn
              Caption.Text = '6'#26102
              DataBinding.ValueType = 'String'
              Width = 98
              Position.ColIndex = 7
              Position.RowIndex = 0
              Position.BandIndex = 0
            end
            object AdInfoListcxTreeListColumn9: TcxTreeListColumn
              Caption.Text = '7'#26102
              DataBinding.ValueType = 'String'
              Width = 97
              Position.ColIndex = 8
              Position.RowIndex = 0
              Position.BandIndex = 0
            end
            object AdInfoListcxTreeListColumn10: TcxTreeListColumn
              Caption.Text = '8'#26102
              DataBinding.ValueType = 'String'
              Width = 97
              Position.ColIndex = 9
              Position.RowIndex = 0
              Position.BandIndex = 0
            end
            object AdInfoListcxTreeListColumn11: TcxTreeListColumn
              Caption.Text = '9'#26102
              DataBinding.ValueType = 'String'
              Width = 98
              Position.ColIndex = 10
              Position.RowIndex = 0
              Position.BandIndex = 0
            end
            object AdInfoListcxTreeListColumn12: TcxTreeListColumn
              Caption.Text = '10'#26102
              DataBinding.ValueType = 'String'
              Width = 97
              Position.ColIndex = 11
              Position.RowIndex = 0
              Position.BandIndex = 0
            end
            object AdInfoListcxTreeListColumn13: TcxTreeListColumn
              Caption.Text = '11'#26102
              DataBinding.ValueType = 'String'
              Width = 98
              Position.ColIndex = 12
              Position.RowIndex = 0
              Position.BandIndex = 0
            end
            object AdInfoListcxTreeListColumn14: TcxTreeListColumn
              Caption.Text = '12'#26102
              DataBinding.ValueType = 'String'
              Width = 97
              Position.ColIndex = 13
              Position.RowIndex = 0
              Position.BandIndex = 0
            end
            object AdInfoListcxTreeListColumn15: TcxTreeListColumn
              Caption.Text = '13'#26102
              DataBinding.ValueType = 'String'
              Width = 97
              Position.ColIndex = 14
              Position.RowIndex = 0
              Position.BandIndex = 0
            end
            object AdInfoListcxTreeListColumn16: TcxTreeListColumn
              Caption.Text = '14'#26102
              DataBinding.ValueType = 'String'
              Width = 98
              Position.ColIndex = 15
              Position.RowIndex = 0
              Position.BandIndex = 0
            end
            object AdInfoListcxTreeListColumn17: TcxTreeListColumn
              Caption.Text = '15'#26102
              DataBinding.ValueType = 'String'
              Width = 97
              Position.ColIndex = 16
              Position.RowIndex = 0
              Position.BandIndex = 0
            end
            object AdInfoListcxTreeListColumn18: TcxTreeListColumn
              Caption.Text = '16'#26102
              DataBinding.ValueType = 'String'
              Width = 97
              Position.ColIndex = 17
              Position.RowIndex = 0
              Position.BandIndex = 0
            end
            object AdInfoListcxTreeListColumn19: TcxTreeListColumn
              Caption.Text = '17'#26102
              DataBinding.ValueType = 'String'
              Width = 98
              Position.ColIndex = 18
              Position.RowIndex = 0
              Position.BandIndex = 0
            end
            object AdInfoListcxTreeListColumn20: TcxTreeListColumn
              Caption.Text = '18'#26102
              DataBinding.ValueType = 'String'
              Width = 97
              Position.ColIndex = 19
              Position.RowIndex = 0
              Position.BandIndex = 0
            end
            object AdInfoListcxTreeListColumn21: TcxTreeListColumn
              Caption.Text = '19'#26102
              DataBinding.ValueType = 'String'
              Width = 98
              Position.ColIndex = 20
              Position.RowIndex = 0
              Position.BandIndex = 0
            end
            object AdInfoListcxTreeListColumn22: TcxTreeListColumn
              Caption.Text = '20'#26102
              DataBinding.ValueType = 'String'
              Width = 97
              Position.ColIndex = 21
              Position.RowIndex = 0
              Position.BandIndex = 0
            end
            object AdInfoListcxTreeListColumn23: TcxTreeListColumn
              Caption.Text = '21'#26102
              DataBinding.ValueType = 'String'
              Width = 97
              Position.ColIndex = 22
              Position.RowIndex = 0
              Position.BandIndex = 0
            end
            object AdInfoListcxTreeListColumn24: TcxTreeListColumn
              Caption.Text = '22'#26102
              DataBinding.ValueType = 'String'
              Width = 98
              Position.ColIndex = 23
              Position.RowIndex = 0
              Position.BandIndex = 0
            end
            object AdInfoListcxTreeListColumn25: TcxTreeListColumn
              Caption.Text = '23'#26102
              DataBinding.ValueType = 'String'
              Width = 97
              Position.ColIndex = 24
              Position.RowIndex = 0
              Position.BandIndex = 0
            end
            object AdInfoListcxTreeListColumn26: TcxTreeListColumn
              Caption.Text = #29992#25143
              DataBinding.ValueType = 'String'
              Position.ColIndex = 25
              Position.RowIndex = 0
              Position.BandIndex = 0
            end
          end
        end
        object Panel1: TPanel
          Left = 1
          Top = 472
          Width = 1016
          Height = 207
          Align = alBottom
          Caption = 'Panel1'
          TabOrder = 3
          object DBChart1: TDBChart
            Left = 1
            Top = 27
            Width = 1014
            Height = 179
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
              #20986#31199#36710#31354#36710#29575#26174#31034)
            BackColor = clWhite
            BottomAxis.Automatic = False
            BottomAxis.AutomaticMaximum = False
            BottomAxis.AutomaticMinimum = False
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
            LeftAxis.Maximum = 100.000000000000000000
            LeftAxis.Title.Caption = #30334#20998#27604'%'
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
            Align = alClient
            BorderStyle = bsSingle
            Color = clWhite
            TabOrder = 0
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
          object Panel4: TPanel
            Left = 1
            Top = 1
            Width = 1014
            Height = 26
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object Label3: TLabel
              Left = 86
              Top = 8
              Width = 7
              Height = 13
              Font.Charset = ANSI_CHARSET
              Font.Color = clGreen
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
            object Label1: TLabel
              Left = 16
              Top = 8
              Width = 59
              Height = 13
              Caption = #25152#36873#26085#26399':'
            end
          end
        end
        object cxSplitter1: TcxSplitter
          Left = 1
          Top = 464
          Width = 1016
          Height = 8
          Cursor = crVSplit
          HotZoneClassName = 'TcxSimpleStyle'
          AlignSplitter = salBottom
          AutoSnap = True
          MinSize = 22
          ResizeUpdate = True
          Control = Panel1
        end
      end
    end
  end
  object ADOQuery1: TADOQuery
    Parameters = <>
    Left = 648
    Top = 236
  end
end
