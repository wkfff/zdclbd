object FindThingFrm: TFindThingFrm
  Left = 69
  Top = 427
  Width = 1062
  Height = 291
  Caption = #22833#29289#26597#25214
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1054
    Height = 264
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 637
      Height = 264
      Align = alLeft
      TabOrder = 0
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 218
        Height = 262
        Align = alLeft
        TabOrder = 0
        object TreeView1: TTreeView
          Left = 1
          Top = 1
          Width = 216
          Height = 260
          Hint = #32452#21629#20196#35831#21491#20987
          Align = alClient
          Color = 15792327
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          HideSelection = False
          Indent = 19
          ParentFont = False
          ParentShowHint = False
          PopupMenu = Mainf.PopupMenu_DevGroup
          ReadOnly = True
          RightClickSelect = True
          ShowHint = True
          TabOrder = 0
          OnClick = TreeView1Click
        end
      end
      object cxSplitter2: TcxSplitter
        Left = 219
        Top = 1
        Width = 8
        Height = 262
        Cursor = crHSplit
        HotZoneClassName = 'TcxSimpleStyle'
        HotZone.SizePercent = 31
        AutoSnap = True
        MinSize = 22
        ResizeUpdate = True
        Control = Panel4
      end
      object Panel5: TPanel
        Left = 227
        Top = 1
        Width = 409
        Height = 262
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object Panel6: TPanel
          Left = 1
          Top = 232
          Width = 407
          Height = 29
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 0
          object Label8: TLabel
            Left = 22
            Top = 1
            Width = 3
            Height = 13
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label9: TLabel
            Left = 22
            Top = 17
            Width = 3
            Height = 13
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object BtnQuery: TBitBtn
            Left = 312
            Top = 2
            Width = 75
            Height = 25
            Caption = #26597#35810
            TabOrder = 0
            OnClick = BtnQueryClick
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
        object Panel7: TPanel
          Left = 1
          Top = 1
          Width = 407
          Height = 104
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object Label1: TLabel
            Left = 11
            Top = 52
            Width = 48
            Height = 13
            Caption = #36710#29260#21495#65306
          end
          object Label2: TLabel
            Left = 22
            Top = 83
            Width = 36
            Height = 13
            Caption = #39068#33394#65306
          end
          object Label3: TLabel
            Left = 23
            Top = 20
            Width = 36
            Height = 13
            Caption = #26102#38388#65306
          end
          object Label5: TLabel
            Left = 305
            Top = 20
            Width = 3
            Height = 13
            Caption = '-'
          end
          object Label6: TLabel
            Left = 218
            Top = 16
            Width = 10
            Height = 20
            Caption = '--'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label4: TLabel
            Left = 219
            Top = 52
            Width = 60
            Height = 13
            Caption = #36710#36742#31867#22411#65306
          end
          object ComboBoxCarNo: TComboBox
            Left = 64
            Top = 48
            Width = 115
            Height = 21
            ItemHeight = 13
            TabOrder = 0
          end
          object EditColor: TEdit
            Left = 63
            Top = 79
            Width = 115
            Height = 21
            TabOrder = 1
          end
          object BeginDate: TDateTimePicker
            Left = 63
            Top = 16
            Width = 86
            Height = 21
            Date = 40170.000000000000000000
            Time = 40170.000000000000000000
            TabOrder = 2
          end
          object BeginTime: TDateTimePicker
            Left = 150
            Top = 16
            Width = 69
            Height = 21
            Date = 40170.000000000000000000
            Time = 40170.000000000000000000
            Kind = dtkTime
            TabOrder = 3
          end
          object EndDate: TDateTimePicker
            Left = 231
            Top = 16
            Width = 86
            Height = 21
            Date = 38699.000000000000000000
            Time = 38699.000000000000000000
            TabOrder = 4
          end
          object EndTime: TDateTimePicker
            Left = 318
            Top = 16
            Width = 69
            Height = 21
            Date = 40061.999641203710000000
            Time = 40061.999641203710000000
            Kind = dtkTime
            TabOrder = 5
          end
          object ComboBoxCarType: TComboBox
            Left = 291
            Top = 48
            Width = 97
            Height = 21
            ItemHeight = 13
            TabOrder = 6
          end
        end
        object Panel8: TPanel
          Left = 1
          Top = 105
          Width = 407
          Height = 127
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 2
          object Panel9: TPanel
            Left = 222
            Top = 0
            Width = 185
            Height = 127
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 0
            object ListView1: TListView
              Left = 0
              Top = 0
              Width = 185
              Height = 127
              Align = alClient
              Columns = <
                item
                  AutoSize = True
                  Caption = #36710#29260#21495
                end>
              GridLines = True
              MultiSelect = True
              ReadOnly = True
              RowSelect = True
              TabOrder = 0
              ViewStyle = vsReport
            end
          end
          object Panel10: TPanel
            Left = 0
            Top = 0
            Width = 222
            Height = 127
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object Label7: TLabel
              Left = 9
              Top = 42
              Width = 48
              Height = 13
              Caption = #36710#29260#21495#65306
            end
            object CheckBox1: TCheckBox
              Left = 3
              Top = 3
              Width = 104
              Height = 17
              Caption = #27169#31946#26597#35810#36710#26426
              TabOrder = 0
              OnClick = CheckBox1Click
            end
            object EditCarNo: TEdit
              Left = 60
              Top = 38
              Width = 121
              Height = 21
              Color = clBtnFace
              Enabled = False
              TabOrder = 1
              OnKeyUp = EditCarNoKeyUp
            end
            object ProgressBar1: TProgressBar
              Left = 0
              Top = 106
              Width = 222
              Height = 21
              Align = alBottom
              TabOrder = 2
              Visible = False
            end
          end
        end
      end
    end
    object cxSplitter1: TcxSplitter
      Left = 637
      Top = 0
      Width = 8
      Height = 264
      Cursor = crHSplit
      HotZoneClassName = 'TcxSimpleStyle'
      HotZone.SizePercent = 31
      AutoSnap = True
      MinSize = 22
      ResizeUpdate = True
      Control = Panel2
    end
    object Panel3: TPanel
      Left = 645
      Top = 0
      Width = 409
      Height = 264
      Align = alClient
      TabOrder = 2
      object cxDeviceList: TcxTreeList
        Left = 1
        Top = 1
        Width = 407
        Height = 262
        Align = alClient
        Bands = <
          item
            Caption.AlignHorz = taCenter
            Caption.Text = #22522#26412#20449#24687
          end
          item
            Caption.AlignHorz = taCenter
            Caption.Text = 'GPS'#23450#20301#20449#24687
          end
          item
            Caption.Text = #30417#25511#20449#24687
          end
          item
            Caption.Text = #35774#22791#20449#24687
            Visible = False
          end>
        BufferedPaint = True
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        OptionsData.Deleting = False
        OptionsView.GridLines = tlglBoth
        OptionsView.ShowRoot = False
        ParentFont = False
        PopupMenu = PopupMenu1
        StateImages = Mainf.ImageList1
        TabOrder = 0
        OnClick = cxDeviceListClick
        OnDblClick = cxDeviceListDblClick
        object dev_Id: TcxTreeListColumn
          Caption.Text = #35774#22791'ID'
          DataBinding.ValueType = 'String'
          MinWidth = 50
          Options.Editing = False
          Width = 118
          Position.ColIndex = 6
          Position.RowIndex = 0
          Position.BandIndex = 2
        end
        object dev_carNo: TcxTreeListColumn
          Caption.Text = #36710#29260#21495
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
          SortOrder = soAscending
        end
        object dev_long: TcxTreeListColumn
          Caption.Text = #32463#24230
          DataBinding.ValueType = 'String'
          MinWidth = 70
          Options.Editing = False
          Width = 70
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 2
        end
        object dev_lat: TcxTreeListColumn
          Caption.Text = #32428#24230
          DataBinding.ValueType = 'String'
          MinWidth = 70
          Options.Editing = False
          Width = 70
          Position.ColIndex = 4
          Position.RowIndex = 0
          Position.BandIndex = 2
        end
        object dev_speed: TcxTreeListColumn
          Caption.Text = #36895#24230
          DataBinding.ValueType = 'String'
          MinWidth = 50
          Options.Editing = False
          Width = 50
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 1
        end
        object dev_Gpstime: TcxTreeListColumn
          Visible = False
          Caption.Text = 'GPS'#26102#38388
          DataBinding.ValueType = 'String'
          MinWidth = 120
          Options.Editing = False
          Width = 126
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 1
        end
        object dev_Altitude: TcxTreeListColumn
          Visible = False
          Caption.Text = #28023#25300#39640#24230
          DataBinding.ValueType = 'Float'
          MinWidth = 50
          Options.Editing = False
          Width = 80
          Position.ColIndex = 6
          Position.RowIndex = 0
          Position.BandIndex = 1
        end
        object dev_angle: TcxTreeListColumn
          Visible = False
          Caption.Text = #26041#21521
          DataBinding.ValueType = 'String'
          MinWidth = 50
          Options.Editing = False
          Width = 80
          Position.ColIndex = 7
          Position.RowIndex = 0
          Position.BandIndex = 1
        end
        object switch_8: TcxTreeListColumn
          Caption.Text = 'GPS'#29366#24577
          DataBinding.ValueType = 'String'
          MinWidth = 60
          Options.Editing = False
          Width = 64
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 1
        end
        object switch_9: TcxTreeListColumn
          Caption.Text = #29366#24577
          DataBinding.ValueType = 'String'
          MinWidth = 60
          Options.Editing = False
          Width = 60
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 1
        end
        object dev_Track: TcxTreeListColumn
          Visible = False
          Caption.Text = #36319#36394
          DataBinding.ValueType = 'Boolean'
          MinWidth = 50
          Width = 50
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 2
        end
        object dev_DrawTrack: TcxTreeListColumn
          Visible = False
          Caption.Text = #26174#31034#36712#36857
          DataBinding.ValueType = 'Boolean'
          MinWidth = 60
          Width = 60
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 2
        end
        object dev_Hide: TcxTreeListColumn
          Visible = False
          Caption.Text = #38544#34255
          DataBinding.ValueType = 'Boolean'
          Width = 53
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 2
        end
        object dev_Name: TcxTreeListColumn
          Visible = False
          Caption.Text = #36710#36742#33258#32534#21495
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Width = 118
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object dev_SIMNO: TcxTreeListColumn
          Visible = False
          Caption.Text = 'SIM'#21345#21495
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Width = 127
          Position.ColIndex = 5
          Position.RowIndex = 0
          Position.BandIndex = 2
        end
        object dev_trun: TcxTreeListColumn
          Visible = False
          Caption.Text = #36716#21160#29366#24577
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Width = 62
          Position.ColIndex = 8
          Position.RowIndex = 0
          Position.BandIndex = 1
        end
        object dev_login_driver: TcxTreeListColumn
          Visible = False
          Caption.Text = #21496#26426
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
      end
    end
  end
  object Timer1: TTimer
    Interval = 50
    OnTimer = Timer1Timer
    Left = 292
    Top = 194
  end
  object PopupMenu1: TPopupMenu
    Left = 733
    Top = 88
    object N1: TMenuItem
      Caption = #26597#30475#23458#27425#26126#32454
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #26597#30475#34892#39542#36712#36857
      OnClick = N2Click
    end
  end
end
