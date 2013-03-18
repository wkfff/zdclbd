object Mainf: TMainf
  Left = 187
  Top = 37
  AutoScroll = False
  Caption = #36947#36335#36816#36755#36710#36742#21355#26143#23450#20301#31995#32479'--'#26234#33021#30417#25511#23458#25143#31471
  ClientHeight = 647
  ClientWidth = 1024
  Color = 15002086
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  Menu = MainMenu2
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 1024
    Height = 40
    AutoSize = True
    Bands = <
      item
        Control = ToolBar2
        ImageIndex = -1
        MinHeight = 36
        Width = 1020
      end>
    Color = 15132390
    ParentColor = False
    object ToolBar2: TToolBar
      Left = 9
      Top = 0
      Width = 1007
      Height = 36
      AutoSize = True
      ButtonHeight = 36
      ButtonWidth = 85
      Caption = 'ToolBar2'
      Color = 15527913
      EdgeBorders = []
      Flat = True
      Images = ImageList2
      ParentColor = False
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 0
      Transparent = False
      object ToolButton30: TToolButton
        Left = 0
        Top = 0
        Action = fun_Locate_Car
        AutoSize = True
      end
      object ToolButton18: TToolButton
        Left = 63
        Top = 0
        Action = fun_zdgz
        AutoSize = True
      end
      object ToolButton6: TToolButton
        Left = 126
        Top = 0
        Action = fun_ShowACarTrack
        AutoSize = True
        Visible = False
      end
      object ToolButton40: TToolButton
        Left = 189
        Top = 0
        Action = fun_History
        AutoSize = True
      end
      object ToolButton3: TToolButton
        Left = 252
        Top = 0
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 99
        Style = tbsSeparator
      end
      object ToolButton12: TToolButton
        Left = 260
        Top = 0
        Action = fun_SendControlInfo
        AutoSize = True
      end
      object ToolButton7: TToolButton
        Left = 349
        Top = 0
        Action = fun_sendQuestion
        AutoSize = True
      end
      object ToolButton5: TToolButton
        Left = 412
        Top = 0
        Action = fun_setDevEventList
        AutoSize = True
      end
      object ToolButton8: TToolButton
        Left = 475
        Top = 0
        Width = 8
        Caption = 'ToolButton8'
        ImageIndex = 95
        Style = tbsSeparator
      end
      object ToolButton11: TToolButton
        Left = 483
        Top = 0
        Action = fun_Set_DevParam
        AutoSize = True
        ParentShowHint = False
        ShowHint = False
      end
      object ToolButton13: TToolButton
        Left = 546
        Top = 0
        Action = fun_view_DevParam
        AutoSize = True
      end
      object ToolButton15: TToolButton
        Left = 609
        Top = 0
        Width = 8
        Caption = 'ToolButton15'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object ToolButton1: TToolButton
        Left = 617
        Top = 0
        Action = fun_GetAPicture
        AutoSize = True
      end
      object ToolButton2: TToolButton
        Left = 654
        Top = 0
        Action = fun_Record
        AutoSize = True
      end
      object ToolButton10: TToolButton
        Left = 691
        Top = 0
        Width = 8
        Caption = 'ToolButton10'
        ImageIndex = 48
        Style = tbsSeparator
      end
      object ToolButton9: TToolButton
        Left = 699
        Top = 0
        AutoSize = True
        Caption = #36864#20986
        ImageIndex = 6
        OnClick = ToolButton9Click
      end
      object ToolButton16: TToolButton
        Left = 736
        Top = 0
        Width = 8
        Caption = 'ToolButton16'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object Panel6: TPanel
        Left = 744
        Top = 0
        Width = 185
        Height = 36
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 0
        object RzLabel1: TRzLabel
          Left = 48
          Top = 8
          Width = 120
          Height = 21
          Caption = #25253#35686#25552#31034#21306#22495
          Font.Charset = GB2312_CHARSET
          Font.Color = clRed
          Font.Height = -19
          Font.Name = #21326#25991#26999#20307
          Font.Style = [fsBold]
          ParentFont = False
          Rotation = roFlat
        end
      end
    end
  end
  object Panel10: TPanel
    Left = 202
    Top = 40
    Width = 822
    Height = 585
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel10'
    TabOrder = 1
    object Panel_Clxx: TPanel
      Left = 653
      Top = 0
      Width = 169
      Height = 585
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      OnResize = Panel_ClxxResize
      object Splitter1: TSplitter
        Left = 0
        Top = 0
        Width = 169
        Height = 3
        Cursor = crVSplit
        Align = alTop
      end
      object Splitter2: TSplitter
        Left = 0
        Top = 230
        Width = 169
        Height = 4
        Cursor = crVSplit
        Align = alTop
        Visible = False
      end
      object Panel_clxx_else: TPanel
        Left = 0
        Top = 234
        Width = 169
        Height = 214
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object PageControl1: TPageControl
          Left = 0
          Top = 0
          Width = 169
          Height = 214
          ActivePage = TabSheet1
          Align = alClient
          TabOrder = 0
          object TabSheet1: TTabSheet
            Caption = #29366#24577
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
            object DeviceStateList: TValueListEditor
              Left = 0
              Top = 0
              Width = 161
              Height = 186
              Align = alClient
              DefaultRowHeight = 17
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect, goThumbTracking]
              Strings.Strings = (
                #23450#20301#29366#24577'='
                #35199#32463#19996#32463'='
                #21335#32428#21271#32428'='
                'ACC'#29366#24577'='
                #36816#33829#29366#24577'='
                #32463#32428#24230#29366#24577'='
                #36710#36742#27833#36335'='
                #36710#36742#30005#36335'='
                #36710#38376#29366#24577'='
                'GPS'#27169#22359'='
                'GPS'#22825#32447'='
                'GPS'#22825#32447#30701#36335'='
                #32039#24613#25253#35686'='
                #36229#36895#25253#35686'='
                #30130#21171#39550#39542#25253#35686'='
                #21361#38505#39044#35686'='
                #32456#31471#20027#30005#28304#27424#21387#25253#35686'='
                #32456#31471#20027#30005#28304#25481#30005#25253#35686'='
                #32456#31471'LCD'#25110#26174#31034#22120'='
                'TTS'#27169#22359'='
                #25668#20687#22836'='
                #24403#22825#32047#35745#39550#39542#36229#26102#25253#35686'='
                #36229#26102#20572#36710#25253#35686'='
                #36827#20986#21306#22495#25253#35686'='
                #36827#20986#36335#32447#25253#35686'='
                #36335#27573#34892#39542#26102#38388'='
                #36335#32447#20559#31163#25253#35686'='
                #36710#36742'VSS='
                #36710#36742#27833#37327'='
                #36710#36742#34987#30423#25253#35686'='
                #36710#36742#38750#27861#28857#28779#25253#35686'='
                #36710#36742#38750#27861#20301#31227#25253#35686'='
                #30896#25758#20391#32763#25253#35686#25253#35686'='
                #27833#37327'='
                #37324#31243'='
                #34892#39542#35760#24405#20202#36895#24230'='
                'SIM'#21345'='
                'GPS'#26085#26399'='
                'GPS'#26102#38388'='
                #31354#37325#29366#24577'='
                #21069#38376#24320#20851'='
                #20013#38376#24320#20851'='
                #21518#38376#24320#20851'='
                #39550#39542#24109#38376'='
                #20351#29992'GPS'#23450#20301'='
                #20351#29992#21271#26007#23450#20301'='
                #20351#29992'GLONASS'#23450#20301'='
                #20351#29992'Galileo'#23450#20301'='
                #36947#36335#36816#36755#35777'IC'#21345#27169#22359'='
                #36229#36895#39044#35686'='
                #30130#21171#39550#39542#39044#35686'='
                #20391#32763#39044#35686'='
                #38750#27861#24320#38376#25253#35686'='
                #26080#32447#20449#21495#24378#24230'='
                'GNSS'#23450#20301#21355#26143#25968'=')
              TabOrder = 0
              TitleCaptions.Strings = (
                #29366#24577#21517#31216
                #29366#24577)
              OnDrawCell = DeviceStateListDrawCell
              ColWidths = (
                104
                34)
            end
          end
          object TabSheet2: TTabSheet
            Caption = #36873#20013#36710
            ImageIndex = 1
            object ToolBar1: TToolBar
              Left = 0
              Top = 163
              Width = 161
              Height = 23
              Align = alBottom
              ButtonHeight = 19
              ButtonWidth = 38
              Caption = 'ToolBar3'
              List = True
              ShowCaptions = True
              TabOrder = 0
              object ToolButton34: TToolButton
                Left = 0
                Top = 2
                Caption = #21629#20196
                DropdownMenu = PopupMenuSelected
                ImageIndex = 0
              end
              object ToolButton29: TToolButton
                Left = 38
                Top = 2
                Action = Sel_Dev_Empty
                AutoSize = True
              end
              object ToolButton28: TToolButton
                Left = 75
                Top = 2
                Action = Sel_Dev_Online
                AutoSize = True
              end
              object ToolButton37: TToolButton
                Left = 112
                Top = 2
                Action = Sel_Dev_Postion
                AutoSize = True
              end
            end
            object ListSelectDev: TcxTreeList
              Left = 0
              Top = 0
              Width = 161
              Height = 163
              Align = alClient
              Bands = <
                item
                  Caption.AlignHorz = taCenter
                  Caption.AlignVert = vaCenter
                  Caption.Text = #24403#21069#22320#22270#19978#36873#20013#30340#36710#36742
                end>
              BufferedPaint = True
              Font.Charset = GB2312_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              OptionsCustomizing.DynamicSizing = True
              OptionsData.Deleting = False
              OptionsSelection.CellSelect = False
              OptionsView.GridLines = tlglBoth
              OptionsView.ShowRoot = False
              ParentFont = False
              PopupMenu = PopupMenuSelected
              StateImages = ImageList1
              TabOrder = 1
              OnFocusedNodeChanged = ListSelectDevFocusedNodeChanged
              object ListSelectDev_DevId: TcxTreeListColumn
                Visible = False
                Caption.Text = #35774#22791'ID'
                DataBinding.ValueType = 'String'
                Options.Editing = False
                Width = 90
                Position.ColIndex = 0
                Position.RowIndex = 0
                Position.BandIndex = 0
              end
              object ListSelectDev_CarNo: TcxTreeListColumn
                Caption.Text = #36710#29260#21495
                DataBinding.ValueType = 'String'
                Options.Editing = False
                Width = 90
                Position.ColIndex = 0
                Position.RowIndex = 0
                Position.BandIndex = 0
                SortOrder = soAscending
              end
              object ListSelectDevcxTreeListColumn1: TcxTreeListColumn
                Visible = False
                Caption.Text = #21333#20301#21517#31216
                DataBinding.ValueType = 'String'
                Width = 124
                Position.ColIndex = 2
                Position.RowIndex = 0
                Position.BandIndex = 0
              end
              object ListSelectDevcxTreeListColumn2: TcxTreeListColumn
                Caption.Text = 'SIM'#21345#21495
                DataBinding.ValueType = 'String'
                Width = 60
                Position.ColIndex = 3
                Position.RowIndex = 0
                Position.BandIndex = 0
              end
              object ListSelectDevcxTreeListColumn3: TcxTreeListColumn
                Caption.Text = #32463#24230
                DataBinding.ValueType = 'String'
                Width = 60
                Position.ColIndex = 4
                Position.RowIndex = 0
                Position.BandIndex = 0
              end
              object ListSelectDevcxTreeListColumn4: TcxTreeListColumn
                Caption.Text = #32428#24230
                DataBinding.ValueType = 'String'
                Width = 60
                Position.ColIndex = 5
                Position.RowIndex = 0
                Position.BandIndex = 0
              end
              object ListSelectDevcxTreeListColumn5: TcxTreeListColumn
                Caption.Text = #36895#24230
                DataBinding.ValueType = 'String'
                Width = 50
                Position.ColIndex = 6
                Position.RowIndex = 0
                Position.BandIndex = 0
              end
              object ListSelectDevcxTreeListColumn6: TcxTreeListColumn
                Caption.Text = 'GPS'#26102#38388
                DataBinding.ValueType = 'String'
                Position.ColIndex = 6
                Position.RowIndex = 0
                Position.BandIndex = 0
              end
            end
          end
          object TabSheet5: TTabSheet
            Caption = #26631#31614
            ImageIndex = 2
            object cxDeviceListText: TcxTreeList
              Left = 0
              Top = 0
              Width = 161
              Height = 163
              Align = alClient
              Bands = <
                item
                  Caption.AlignHorz = taCenter
                  Caption.Text = #22522#26412#20449#24687
                  Width = 135
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
              PopupMenu = PopupMenuText
              StateImages = ImageList1
              TabOrder = 0
              OnDblClick = cxDeviceListTextDblClick
              object text_Id: TcxTreeListColumn
                Visible = False
                Caption.Text = #35774#22791'ID'
                DataBinding.ValueType = 'Integer'
                MinWidth = 50
                Options.Editing = False
                Width = 63
                Position.ColIndex = 2
                Position.RowIndex = 0
                Position.BandIndex = 0
              end
              object Text_Name: TcxTreeListColumn
                Caption.Text = #26631#31614#21517#31216
                DataBinding.ValueType = 'String'
                Options.Editing = False
                Width = 135
                Position.ColIndex = 0
                Position.RowIndex = 0
                Position.BandIndex = 0
                SortOrder = soAscending
              end
            end
            object ToolBar4: TToolBar
              Left = 0
              Top = 163
              Width = 161
              Height = 23
              Align = alBottom
              ButtonHeight = 19
              ButtonWidth = 9
              Caption = 'ToolBar4'
              TabOrder = 1
              object BitBtnEditText: TBitBtn
                Left = 0
                Top = 2
                Width = 37
                Height = 19
                Caption = #20462#25913
                TabOrder = 0
                OnClick = BitBtnEditTextClick
              end
              object BitBtnDelText: TBitBtn
                Left = 37
                Top = 2
                Width = 37
                Height = 19
                Caption = #21024#38500
                TabOrder = 1
                OnClick = BitBtnEditTextClick
              end
            end
          end
        end
      end
      object PanelShowMessage: TPanel
        Left = 0
        Top = 448
        Width = 169
        Height = 137
        Align = alBottom
        TabOrder = 1
        object MemoGateWay: TMemo
          Left = 1
          Top = 117
          Width = 167
          Height = 19
          Align = alBottom
          ImeName = #20013#25991' ('#31616#20307') - '#19975#33021#20116#31508#20869#32622#36755#20837#27861
          Lines.Strings = (
            'MemoGateWay')
          ReadOnly = True
          ScrollBars = ssHorizontal
          TabOrder = 0
        end
        object MemoBs: TMemo
          Left = 1
          Top = 98
          Width = 167
          Height = 19
          Align = alBottom
          ImeName = #20013#25991' ('#31616#20307') - '#19975#33021#20116#31508#20869#32622#36755#20837#27861
          Lines.Strings = (
            'MemoBs')
          ReadOnly = True
          ScrollBars = ssHorizontal
          TabOrder = 1
        end
        object ValueListEditorOnline: TValueListEditor
          Left = 1
          Top = 1
          Width = 167
          Height = 96
          Align = alTop
          DefaultRowHeight = 17
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect, goThumbTracking]
          ParentFont = False
          Strings.Strings = (
            #24635#36710'='
            #22312#32447'='
            #19981#22312#32447'='
            #22312#32447#29575'=')
          TabOrder = 2
          TitleCaptions.Strings = (
            #21517#31216
            #23646#24615)
          ColWidths = (
            58
            103)
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 234
        Width = 169
        Height = 0
        Align = alTop
        Caption = 'Panel1'
        TabOrder = 2
        object PageControl2: TPageControl
          Left = 1
          Top = 1
          Width = 167
          Height = 0
          Align = alClient
          DockSite = True
          TabOrder = 0
        end
        object TreeView1: TTreeView
          Left = 1
          Top = 1
          Width = 167
          Height = 0
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
          PopupMenu = PopupMenu_DevGroup
          ReadOnly = True
          RightClickSelect = True
          ShowHint = True
          SortType = stText
          TabOrder = 1
          OnChange = TreeView1Change
          OnClick = TreeView1Click
          OnContextPopup = TreeView1ContextPopup
          OnDblClick = TreeView1DblClick
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 3
        Width = 169
        Height = 227
        Align = alTop
        Caption = 'Panel2'
        TabOrder = 3
        object Splitter_DevSwitch: TSplitter
          Left = 1
          Top = 46
          Width = 167
          Height = 5
          Cursor = crVSplit
          Align = alTop
          Beveled = True
          Color = 15792327
          ParentColor = False
          Visible = False
        end
        object Panel3: TPanel
          Left = 1
          Top = 1
          Width = 167
          Height = 20
          Align = alTop
          BevelOuter = bvLowered
          Caption = #36710#36742#20449#24687' '
          Color = 15265488
          TabOrder = 0
          object Panel4: TPanel
            Left = 148
            Top = 1
            Width = 18
            Height = 18
            Hint = #20851#38381#36710#36742#20449#24687
            Align = alRight
            Caption = 'X'
            Color = 10154466
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'System'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnClick = Panel4Click
          end
          object Edit2: TEdit
            Left = 105
            Top = -1
            Width = 41
            Height = 21
            ImeName = #20013#25991' ('#31616#20307') - '#19975#33021#20116#31508#20869#32622#36755#20837#27861
            ReadOnly = True
            TabOrder = 1
            Text = 'Edit2'
            Visible = False
          end
        end
        object Panel8: TPanel
          Left = 1
          Top = 21
          Width = 167
          Height = 25
          Align = alTop
          BevelInner = bvLowered
          BevelOuter = bvNone
          Font.Charset = GB2312_CHARSET
          Font.Color = 12615680
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object ToolBar3: TToolBar
            Left = 1
            Top = 1
            Width = 165
            Height = 23
            Align = alClient
            ButtonHeight = 19
            ButtonWidth = 38
            Caption = 'ToolBar3'
            List = True
            ShowCaptions = True
            TabOrder = 0
            object Label1: TLabel
              Left = 0
              Top = 2
              Width = 47
              Height = 19
              Align = alTop
              AutoSize = False
              Caption = #24403#21069#36710#65306
              Font.Charset = GB2312_CHARSET
              Font.Color = 10485760
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
              Layout = tlCenter
            end
            object Edit1: TEdit
              Left = 47
              Top = 2
              Width = 80
              Height = 19
              Font.Charset = GB2312_CHARSET
              Font.Color = clNavy
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              ImeName = #20013#25991' ('#31616#20307') - '#19975#33021#20116#31508#20869#32622#36755#20837#27861
              MaxLength = 16
              ParentFont = False
              TabOrder = 0
              Text = 'edit1'
              OnChange = Edit1Change
              OnKeyPress = Edit1KeyPress
            end
            object ToolButton36: TToolButton
              Left = 127
              Top = 2
              Caption = #21629#20196
              DropdownMenu = PopupMenu_funDev
              ImageIndex = 0
            end
          end
        end
        object ListDevice: TValueListEditor
          Left = 1
          Top = 51
          Width = 167
          Height = 175
          Align = alClient
          DefaultRowHeight = 17
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect, goThumbTracking]
          ParentFont = False
          Strings.Strings = (
            '')
          TabOrder = 2
          TitleCaptions.Strings = (
            #21517#31216
            #23646#24615)
          ColWidths = (
            78
            83)
        end
        object ComboBoxCarNO: TComboBox
          Left = 45
          Top = 25
          Width = 84
          Height = 21
          AutoDropDown = True
          AutoCloseUp = True
          CharCase = ecUpperCase
          DropDownCount = 15
          ImeName = #20013#25991' ('#31616#20307') - '#19975#33021#20116#31508#20869#32622#36755#20837#27861
          ItemHeight = 13
          ParentShowHint = False
          ShowHint = True
          Sorted = True
          TabOrder = 3
          Text = ' '
          OnChange = ComboBoxCarNOChange
          OnClick = ComboBoxCarNOClick
          OnDblClick = ComboBoxCarNODblClick
          OnKeyPress = ComboBoxCarNOKeyPress
          OnKeyUp = ComboBoxCarNOKeyUp
          OnSelect = ComboBoxCarNOSelect
        end
      end
    end
    object SplitterRight: TcxSplitter
      Left = 645
      Top = 0
      Width = 8
      Height = 585
      HotZoneClassName = 'TcxSimpleStyle'
      HotZone.SizePercent = 10
      AlignSplitter = salRight
      Control = Panel_Clxx
      OnAfterOpen = SplitterRightAfterOpen
      OnAfterClose = SplitterRightAfterOpen
    end
    object Panel_center: TPanel
      Left = 0
      Top = 0
      Width = 645
      Height = 585
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel_center'
      Color = 15002086
      TabOrder = 2
      object SplitterBottom: TcxSplitter
        Left = 0
        Top = 389
        Width = 645
        Height = 8
        HotZoneClassName = 'TcxSimpleStyle'
        HotZone.SizePercent = 10
        AlignSplitter = salBottom
        Control = PageControlBottom
      end
      object PageControlBottom: TRzPageControl
        Left = 0
        Top = 397
        Width = 645
        Height = 188
        Align = alBottom
        DockSite = True
        ShowMenuButton = True
        ShowShadow = False
        TabColors.HighlightBar = 4227072
        TabColors.Shadow = clSilver
        TabColors.Unselected = 15724512
        TabOrder = 1
        TabStyle = tsCutCorner
        OnChange = PageControlBottomChange
        OnDockDrop = PageControlBottomDockDrop
        OnUnDock = PageControlBottomUnDock
        FixedDimension = 0
      end
      object PageControl_Center: TRzPageControl
        Left = 0
        Top = 0
        Width = 645
        Height = 389
        Align = alClient
        DockSite = True
        ShowShadow = False
        TabColors.HighlightBar = 4227072
        TabColors.Shadow = clSilver
        TabColors.Unselected = 15790305
        TabOrder = 2
        TabStyle = tsCutCorner
        OnChange = PageControl_CenterChange
        OnDockDrop = PageControl_CenterDockDrop
        OnUnDock = PageControl_CenterUnDock
        FixedDimension = 0
      end
    end
  end
  object BitBtnFullScreen: TBitBtn
    Left = 592
    Top = 192
    Width = 41
    Height = 19
    Action = show_fullScreen
    Cancel = True
    Caption = #20840#23631#26174#31034
    TabOrder = 2
    Visible = False
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A5A5A500FF00FF00FF00FF00FF00FF000000
      00009C9C9C007373730084848400848484008484840094949400949494008484
      84006B6B6B005A5A5A004242420000000000A5A5A500FF00FF00FF00FF000000
      0000B5B5B5000000000000000000000000000000000000000000000000000000
      000000000000000000005A5A5A0000000000A5A5A500FF00FF00FF00FF000000
      0000B5B5B50000000000DE8C0000DE8C0000DE8C00000000000000EFEF0000EF
      EF0000EFEF00000000005A5A5A0000000000A5A5A500FF00FF00FF00FF000000
      0000B5B5B50000000000FFB52100FFA50000DE8C000000000000B5FFFF004AFF
      FF0000EFEF00000000005A5A5A0000000000A5A5A500FF00FF00FF00FF000000
      0000B5B5B50000000000FFB52100FFA50000DE8C000000000000B5FFFF004AFF
      FF0000EFEF00000000005A5A5A0000000000A5A5A500FF00FF00FF00FF000000
      0000B5B5B50000000000FFC65200FFB52100DE8C000000000000F7FFFF00B5FF
      FF0000EFEF00000000005A5A5A0000000000A5A5A500FF00FF00FF00FF000000
      0000B5B5B5000000000000000000000000000000000000000000000000000000
      000000000000000000005A5A5A0000000000A5A5A500FF00FF00FF00FF000000
      0000B5B5B50000000000184AFF00184AFF00184AFF000000000039DE000039DE
      000039DE0000000000005A5A5A0000000000A5A5A500FF00FF00FF00FF000000
      0000B5B5B500000000007B9CFF004A73FF00184AFF000000000084FF52004AFF
      000039DE0000000000005A5A5A0000000000A5A5A500FF00FF00FF00FF000000
      0000B5B5B500000000007B9CFF004A73FF00184AFF000000000084FF52004AFF
      000039DE0000000000005A5A5A0000000000A5A5A500FF00FF00FF00FF000000
      0000B5B5B500000000007B9CFF007B9CFF00184AFF0000000000D6FFBD0084FF
      520039DE0000000000005A5A5A0000000000A5A5A500FF00FF00FF00FF000000
      0000B5B5B5000000000000000000000000000000000000000000000000000000
      000000000000000000005A5A5A0000000000A5A5A500FF00FF00FF00FF000000
      0000D6D6D600C6C6C600BDBDBD00B5B5B500C6C6C600D6D6D600D6D6D600C6C6
      C600B5B5B500A5A5A5006B6B6B0000000000FF00FF00FF00FF00FF00FF00FF00
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF00FF00FF00FF00FF00FF00}
  end
  object ToolBarMenu: TToolBar
    Left = 105
    Top = 124
    Width = 506
    Height = 21
    Align = alNone
    ButtonHeight = 21
    ButtonWidth = 87
    Caption = 'ToolBarMenu'
    EdgeBorders = [ebLeft, ebRight, ebBottom]
    EdgeInner = esLowered
    EdgeOuter = esRaised
    Flat = True
    Menu = MainMenu2
    ShowCaptions = True
    TabOrder = 3
    Visible = False
  end
  object Panel5: TPanel
    Left = 0
    Top = 40
    Width = 194
    Height = 585
    Align = alLeft
    BevelOuter = bvNone
    Caption = 'Panel5'
    TabOrder = 5
    object TreeView2: TTreeView
      Left = 0
      Top = 0
      Width = 194
      Height = 412
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = 15134180
      Font.Charset = GB2312_CHARSET
      Font.Color = 4227072
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      Indent = 19
      ParentFont = False
      ParentShowHint = False
      PopupMenu = PopupMenu_DevGroup
      ReadOnly = True
      RightClickSelect = True
      ShowHint = True
      SortType = stText
      TabOrder = 0
      OnChange = TreeView2Change
      OnClick = TreeView2Click
      OnContextPopup = TreeView2ContextPopup
    end
    object ValueListEditorOnlineByGroup: TValueListEditor
      Left = 0
      Top = 473
      Width = 194
      Height = 112
      Align = alBottom
      BorderStyle = bsNone
      DefaultRowHeight = 17
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect, goThumbTracking]
      ParentFont = False
      Strings.Strings = (
        ' '#24403#21069#32452#21517#31216'='
        ' '#24403#21069#32452#24635#36710'='
        ' '#24403#21069#32452#22312#32447'='
        ' '#24403#21069#32452#19981#22312#32447'='
        ' '#24403#21069#32452#22312#32447#29575'=')
      TabOrder = 1
      TitleCaptions.Strings = (
        ' '#21517#31216
        #23646#24615)
      ColWidths = (
        98
        94)
    end
    object Panel7: TPanel
      Left = 0
      Top = 412
      Width = 194
      Height = 61
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15134180
      TabOrder = 2
      object cbxSearchType: TComboBox
        Left = 8
        Top = 8
        Width = 88
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 0
        Text = #36710#29260#21495
        OnChange = cbxSearchTypeChange
        Items.Strings = (
          #36710#29260#21495
          #36710#36742#33258#32534#21495
          #35774#22791#21495
          'SIM'#21345#21495
          #39550#39542#21592
          #36710#36742#32452)
      end
      object edtCondition: TEdit
        Left = 8
        Top = 32
        Width = 109
        Height = 21
        BevelInner = bvNone
        BevelOuter = bvNone
        TabOrder = 1
        OnKeyUp = edtConditionKeyUp
      end
      object btnSearch: TRzBitBtn
        Left = 123
        Top = 30
        Width = 61
        Hint = #25353#36710#29260#21495#26597#25214#36710#36742
        FrameColor = 7617536
        Caption = #26597#25214
        Color = 15791348
        HotTrack = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btnSearchClick
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          20000000000000040000232E0000232E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF083674FF043C81FF414B66FF8C615DFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF093572FF023F86FF1389E0FF55AFE4FF748DA9FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF093570FF023F86FF1088E1FF83E6FEFF6FDBFDFF0F84DDFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0433
          74FF023F87FF1087E1FF82E4FEFF76DCF8FF1087DEFF087ADAFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF003A
          82FF1389E1FF83E6FEFF76DCF8FF0F86DEFF0979D7FFFFFFFFFFFFFFFFFFFFFF
          FFFF674242FF6B4748FF745051FF7A5959FF826061FF876667FF805E5CFF474E
          68FF50A3D8FF6FDBFBFF1087DEFF0979D7FFFFFFFFFFFFFFFFFFFFFFFFFF653F
          40FF6B494AFF937469FFC0ACA0FFD1C2BEFFBFACA4FFA18783FF907374FFB18B
          84FF5B7492FF097FDDFF097BDAFFFFFFFFFFFFFFFFFFFFFFFFFF643F40FF6B48
          48FFB88364FFF9E2AAFFFEFEE4FFFEFEFCFFFEFEE8FFF3DDAFFFB9998BFFAF93
          93FF8F8996FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF654347FFA062
          48FFFEA960FFFED192FFFEEEBBFFFEF9CCFFFEF1BFFFFED898FFF5AB6FFFB798
          8FFFAC9291FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF724E4DFFD568
          2DFFFE8C3CFFFEA964FFFEC282FFFECE90FFFEC586FFFEAC68FFFE9042FFD697
          74FFB0A0A3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF875C54FFE852
          09FFF97223FFFC9A54FFFEB06CFFFEAC69FFFDA35EFFFDA661FFFEAB64FFE9A8
          79FFB8A7A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF855D58FFE876
          32FFFEAE67FFFECC8FFFFEDAA0FFFEDDA4FFFEDBA1FFFED89EFFFECB89FFE6B2
          8DFFBEACAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F5E60FFCC96
          70FFFED390FFFEE0A6FFFEEBB8FFFEF0C2FFFEF0C2FFFEECB6FFFEDB9FFFD7BB
          AAFFBEAEB0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7C5E60FF9C7A
          74FFEDC393FFFEF2BBFFFEF5CCFFFEF7D7FFFEF8D7FFFEF5C9FFE8D2B6FFC6B3
          B5FFBDAAAAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8C6E
          70FFA98E87FFDDC9ACFFF9EDD0FFFBF6E3FFF7F0E0FFE0CFC0FFC6B5B5FFBEAB
          ABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF95787AFFA48D8EFFB9A4A2FFC9B5B1FFC2AFB0FFBCA7A9FFBCA9A9FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        ImageIndex = 74
        Images = ImageList2
      end
      object rbFuzzy: TRadioButton
        Left = 96
        Top = 10
        Width = 47
        Height = 17
        Caption = #27169#31946
        Checked = True
        TabOrder = 3
        TabStop = True
      end
      object rbPrecise: TRadioButton
        Left = 143
        Top = 10
        Width = 47
        Height = 17
        Caption = #31934#30830
        TabOrder = 4
      end
    end
  end
  object SplitterLeft: TcxSplitter
    Left = 194
    Top = 40
    Width = 8
    Height = 585
    HotZoneClassName = 'TcxSimpleStyle'
    HotZone.SizePercent = 10
    Control = Panel5
  end
  object StatusBar1: TSeSkinStatusBar
    Left = 0
    Top = 625
    Width = 1024
    Height = 22
    Performance = kspNoBuffer
    Transparent = False
    Align = alBottom
    BevelSides = [kbsLeft, kbsTop, kbsRight, kbsBottom]
    BevelInner = kbvSpace
    BevelOuter = kbvRaised
    BevelKind = kbkNone
    BevelWidth = 0
    BorderWidth = 2
    Color = clBtnFace
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    Images = ImageList1
    Panels = <
      item
        ImageIndex = 2
        Text = #21335#20140#36890#29992#30005#22120#26377#38480#20844#21496#30740#21046
        Width = 340
      end
      item
        ImageIndex = -1
        Spacing = 1
        Width = 320
      end
      item
        ImageIndex = -1
        Spacing = 1
        Width = 250
      end
      item
        ImageIndex = -1
        StretchPriority = 1
        Width = 200
      end
      item
        ImageIndex = 4
        Spacing = 0
        Text = #19994#21153
        Width = 0
      end
      item
        ImageIndex = 4
        Spacing = 0
        Text = #32593#20851
        Width = 52
      end
      item
        ImageIndex = 4
        Spacing = 0
        Text = #30005#35805
        Width = 0
      end
      item
        ImageIndex = -1
        Style = psOwnerDraw
        Width = 5
      end>
    ParentFont = False
    SkinObject = 'StatusBar'
  end
  object ImageList2: TImageList
    Left = 56
    Top = 234
    Bitmap = {
      494C010188008B00040010001000FFFFFFFFFF00FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003002000001002000000000000030
      0200000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000092BAC80092BAC80092BA
      C80092BAC80092BAC80092BAC80073737300FFFFFF007373730092BAC8001FAC
      B90035E4EF001FACB90092BAC800000000000000000000000000000000000000
      000000000000000000000000000000000000C2EED00094E3AC0094E3AC0064D7
      880064D78800C2EED00000000000000000000000000000000000000000000000
      0000D3E8D20072B36D002F91290013820C0013820C002F91290072B46F00D3E8
      D2000000000000000000000000000000000000000000A6DAA60043BD43002AB7
      2A003AB63A008CCF8C0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000092BAC800D1E2E800D1E2E800D1E2
      E800D1E2E800D1E2E800D1E2E800C4C4C400FFFFFF00C4C4C400D1E2E80087DC
      E200A7F4F80087DCE200D1E2E80092BAC800000000000000000000000000BEE8
      CF0095DEAE0065D1850045C15C0048C0580046BE550041BC510039BD4A0031BA
      410037B9430043BE5200C2EED000000000000000000000000000000000006DB1
      68000E850600269F1E0032A42A0037A430003BA5340035A42E002A9F22000F85
      07006DB168000000000000000000000000007AC97A0000AD000000BC000000BD
      000000B2000000A7000012701200211D21001E1F1E001C1C1C00191919001515
      150011111100131313000A0A0A004040400092BAC800D1E2E800B9D3DC00B9D3
      DC00B9D3DC00B9D3DC00B9D3DC00A5A5A500FFFFFF00A5A5A5001899C40046CA
      D20078EEF50046CAD2008ECADE000B60A30000000000000000002AB94A000CAE
      2B000DB332001ABF400030C34B0033C54F0035C7530038C9570039CB5A003BCC
      5C0047CB620027C957000DA22D00000000000000000000000000489E43001597
      0C002AAD220052D14A0077E9700093F58C0097F6920081EB7A005AD253002FAE
      270018971000489E4300000000000000000037B4370000B8000002C5020000C5
      000000B6000000AD0000028B0200151A150014131400111111000D0D0D000909
      0900040404000000000000000000313131000B60A30069BDD9001899C4001899
      C4001899C4001899C4001899C4001899C4001899C4001899C40032C3F30046CA
      D20078EEF50046CAD2007AD8F70016A1EC00000000004FCB660019C64B00C4F0
      D00021C84B0047CB620047CB620047CB620047CB62003CCD5E003CCD5E003CCD
      5E0047CB620029CB5A0000A2270000000000000000006DB168000F95060028C0
      1E004DE7430064EF5B0076F26E0083F57C0008980000FFFFFF006EF1660059EA
      500030C22600129709006DB1680000000000C6E6C60023B9230000CD000000D6
      000000C00000019D0100048004001A201A001918190015161500111111000C0C
      0C000707070002020200000000003232320044B5E4007FDAF80032C3F30032C3
      F30032C3F30032C3F30032C3F30032C3F30032C3F30032C3F30032C3F30046CA
      D20078EEF50046CAD2007AD8F70016A1EC00000000003ABF54003FC15A00D5F3
      DE00EBF8EF0031C95E0083D7920099DEA5008DDA9B0055C7670050C965004DCA
      640047CB62002CCB5C00009F250000000000D6EAD6000984010012B1070099EC
      9300FFFFFF00FFFFFF00FFFFFF0070F1680008980000FFFFFF005EEE55004EEA
      44003BE630001AB90F0009840100D6EAD6000000000000000000416C41001353
      1300184718001E301E00087508001F271F001E1C1E0019191900141414000F0F
      0F000A0A0A000303030000000000313131005ABEE700A5E5FA0046C9F40032C3
      F30032C3F30032C3F30032C3F30032C3F30032C3F30032C3F30032C3F30046CA
      D20078EEF50046CAD2007AD8F70016A1EC000000000036BC4E0008BA3E004BBD
      5E00FDFCFD00F7F9F800FDFAFD00FDFAFD00FDF9FD00FAFCFA009AD59A0044C0
      59004ECA63002CCD5D0000A327000000000073B46E000A9C00000BA901000898
      00000898000008980000FFFFFF006CEF6400C5E7C300FFFFFF004CEA42003EE7
      33002CDE200017CA0B000A9E000073B570000000000000000000564F56002218
      2200281D2800262D260009760900232A2300212021001C1B1C00161516001111
      11000B0B0B000505050000000000313131004284B800AAD9E9006DBFDA0046AD
      D000209DC6001899C4001899C4001899C4001899C4001899C40032C3F30046CA
      D200FFFFFF00919191007AD8F70016A1EC000000000034BB4C000AB73500E2F5
      E900F8F8F900F7F8F700FAFAFA00FAFAFA00FAFBFA00F9FAF900F6F8F600CCEB
      D30032C6510020CC540000A32800000000002F9129000BA4000014B908002DD2
      220042E3370008980000FFFFFF00CAECC800F9FDF90083F27C003FE834002CE3
      20001CD60E000CC400000BAC00002F9129000000000000000000545654002225
      22002A2A2A002B342B000A740A00262E2600242024001A271A00151E15001311
      13000D0E0D00060606000101010031313100ABCAD500E6EFF300D6E5EA00D4E4
      EA00C1C1C100B1B1B100A6A6A600A5A5A500FFFFFF00A5A5A5001899C40046CA
      D200FFFFFF00919191008ECADE000B60A300000000002EB9440087E2A400FBFA
      FA00F7F8F700F7F9F700FBFAFB00FAF9F900F9F9FA00FAF9F900F6F8F700F6F4
      F80084DE95001BCB510000A228000000000012810B002CB9220048D43E0051DE
      480059E64F0008980000FFFFFF00FFFFFF009DE9980054ED4B0049EB3E0034E6
      270010D203000CC2000013B2080012810B000000000000000000575757002122
      210024222400293129000C720C00232C2300211921000D580D00142A1400110C
      110005060500040404000202020032323200ACCBD500E6EFF300D7E6EB00C9C9
      C900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A5A5A500B9D3DC0046CA
      D200D9D9D9007B7B7B00D1E2E80092BAC800000000002EB74300AAE9C200FDFD
      FD00F6FAF800F9F9F900FCFBFC00F9FAF900FBFBFB00F9F9F900F6FAF700FAF6
      FA007EDB91001FCB540000A327000000000012810B0077DD700079E3710077E8
      6F0080EF79002AA62300A5D9A200FFFFFF00F8FEF800FFFFFF00F7FEF600EFFD
      EE007AEA730011C4050031BE270012810B000000000000000000515151002627
      26003D3C3D002C342C00016501002E2F2E0029452900007B00000B180B001916
      19002B2B2B000F0F0F00000000003D3D3D0096969600E0E0E000CDCDCD00CBCB
      CB00FFFFFF00C7C7C700C6C6C600C4C4C400FFFFFF00B2B2B200BCD5DE0047CA
      D2009D9D9D0059595900D1E2E80092BAC800000000002DB742008CE2AD00FDFC
      FD00F8FAFA00FAF9FA00FAF9FA00FAFAFA00FAFAF900FBFDFC00FDFBFD00F7FC
      F90025C13E0030CF600000A22700000000002F912900A6E9A20094EC8E008FED
      8800C4F4C100F2FAF1002BA72400CFEBCD00FFFFFF00FFFFFF00089800000898
      000070ED68003BDA300063CE5C002F9129000000000000000000383838004E4E
      4E00DEDCDE00414A41000D6C0D00C5CEC500319B310000650000393C3900E7E6
      E700A7A7A7000505050051515100DBDBDB00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C9C9C900D4E4E900C5C5C500FFFFFF00C2C2C200CCDFE5006AD4
      DB003636710029296800D1E2E80092BAC800000000002CB9430025B43500D9F0
      DD00FCF8FA00F7F8F800F9FAF900F7F9F800FAF9FA00FDFBFD00F8FCF9003DCD
      5F002AC6430036CF650000A225000000000073B57000AFE7AB00B1F5AD00AAF5
      A40057C65000E3FAE100FFFFFF00FFFFFF00FFFFFF00D8FCD50097F6900094F5
      8D0091F48A0085EE7F008FDA8A0073B570000000000000000000A7A7A700E2E2
      E200D5D3D50051585100127812003EA33E00007C0000287D2800DED7DE00D8DB
      D8003232320041414100DEDEDE00DFDFDF0098989800E3E3E300D0D0D000CECE
      CE00FFFFFF00CBCBCB00C9C9C900C7C7C700FFFFFF00C3C3C300CFE1E7007D7D
      E6007777E5006262B5008A8AB30099BFCC000000000030BB470011B62C002BB4
      3900A5E0B000DCEFDF00FDFBFD00F9F8FA00F0F5F300B4F0C60038CD5A002BD1
      540073FC9D0032CD6400009F230000000000D6EAD600359B2F00E6FCE400C0FA
      BD00BEFBBA003EB53700089800000898000027A91F00FFFFFF00FFFFFF00ADF9
      A800ABF8A600DCFBD9002A982400D6EAD600000000000000000000000000E1E1
      E100575657001318130009770900037A030003840300678D6700DDDBDD000000
      000000000000000000000000000000000000B0CDD700EAF1F500DCE9ED00DAE8
      ED00CECECE00FFFFFF00FFFFFF00FFFFFF00C7C7C700D2E3E800D1E2E8007F7F
      E6007B7BE5007777E5009696BB00A0C3CF00000000003CC357001EBE3A0026CB
      520029C046003ABE4C0046BF55003BBD4C0034C44E002BD1510051EF84006BFA
      99007DFDA60039CE680000A2240000000000000000006DB16800A2DE9E00F1FE
      F000D5FDD300D0FCCD00CEFCCB00CCFCC800119D0900FFFFFF00FFFFFF00C6FB
      C300EAFDE90092D88E0071B36C00000000000000000000000000000000000000
      000000000000DDE2DD001D8A1D000084000005590500151115004D4F4D00E2E2
      E200FAFAFA00000000000000000000000000B0CDD700EAF2F500DDEAEE00DCE9
      ED00DAE8ED00CECECE00FFFFFF00CBCBCB00D5E5EA00D4E4E900D2E3E80084DC
      E1007F7FE6007B7BE500DEEAEF00A1C3CF000000000034C254001CC139003AE4
      6F002AE5640024E75F0025EB5F002DEE650042F3730053F6820050F1860047E9
      820041D87D0013B442001BAF4200000000000000000000000000489E4300ABE1
      A700FCFFFB00F0FEEF00E6FEE500E1FEDF0072C96C003DAF3600B3E2B000FAFF
      F90099DB9500489E430000000000000000000000000000000000000000000000
      00000000000000000000148714003B9F3B00B8B9B800A5A4A500EFEFEF00C9C9
      C9005A5A5A001313130085858500F1F1F100B3CFD900EAF2F500EAF2F500EAF1
      F500E9F1F400E2E2E200FFFFFF00DFDFDF00E6EFF300E4EEF200E4EDF100B3EA
      ED00C6F8FA00AEE8EB00E0EBEF00A3C5D1000000000052C66D0008C8370000C7
      2E0008CB38000BC538000AC038000CBD39000EB63B000FB33C000DB03C0010B0
      3E0018AE400043BB5E00D8F3E400000000000000000000000000000000006DB1
      680043A33C00DCF6DA00FAFEFA00FEFFFE00FEFFFE00F9FEF800D6F5D3003A9F
      34006FB26A000000000000000000000000000000000000000000000000000000
      0000000000000000000090C7900000000000000000000000000000000000A6A6
      A600434343007A7A7A00DBDBDB00E9E9E90000000000B2CED800B0CDD700B0CD
      D700AFCCD70097979700FFFFFF0094949400ABCAD500AAC9D400A9C8D3004BBC
      C7005BE9F20046BAC500A4C6D1000000000000000000000000001BC7470001B2
      220006AE2B0009A92E000DA5310025AD560042B6680066C183007DC9920088D2
      9C0091D8A300CBEACD0000000000000000000000000000000000000000000000
      0000D3E8D20072B46F002F91290013820C0013820C002F91290072B46F00D4E9
      D400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FDFDFD00E1E1E100000000000000000000000000E8E8E800E8E8
      E800E8E8E800E8E8E800E9E9E900E9E9E900E9E8E800E9E8E700E6E6E500EAEA
      EA00E7E7E700EBEBEB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D6D6D600C7C7C7005069390026381600263816004F683900C3C3C300CDCD
      CD00DCDCDC00000000000000000000000000000000000000000000000000B4D1
      E00086BBD6006AABCD005DA3C800559EC400559EC3005EA4C8006BABCC0087BA
      D500B6D2E10000000000000000000000000000000000F0F0F000F0F0F000EFEF
      EF00EBEBEB00EFEFEF00ECECEC00F0F0F000EEEEEE00EEEDEC00ECEAE900E7E6
      E600F2F2F200DDDDDD0000000000000000000000000000000000000000000000
      00000000000000000000EEE3D900F0E8DE00C0936600AB703400AB703400AB70
      3400AB703400AB703400C0936600000000000000000000000000A1BC87005172
      3500AFC99B0000000000384F23002B5606002B540700384E230000000000B9CF
      A70051723500A1BC8700000000000000000000000000A8CBDD000D7BB300007A
      B900007EBF00007FC000007FC000007FC000007FC000007FC000007FC000007F
      C000007CBC000F7EB700AFD2E4000000000000000000F1F1F100EDEDED00EFEF
      EF00E6E6E600F0F0F000E8E8E800F1F1F100ECECEC00EEEEEE00F2F1F100E6E5
      E400EFEEEE00EEEEEE0000000000000000000000000000000000000000000000
      0000E5D2BD00EBD7B700F4DDB200FCECC600AE723500FDBC2800FCB81D00FCB8
      1D00FDC03300AE723500D9BEA4000000000000000000A1BD8A00324E1A003258
      1000324E1A005D7D4100324E1A003167020031670200324E1A0062824700324E
      1A0032581000324E1A00A1BD8A000000000000000000B0D2E4000079B700007C
      BC000080C2000080C3000080C3000080C3000080C3000080C3000080C3000080
      C300007EBF00007CBD00B2D6E9000000000000000000F1F1F100E9E9E900E6E6
      E600E0E0E000E6E6E600E2E2E200E7E7E700E4E4E400E6E6E600E8E8E800E3E2
      E200E8E5E500E8E8E800F2F2F200000000000000000000000000F1E7DD00DEC3
      A400FAE0A600F9DB9C00FADC9F00FBEAC800B3783900F8B62A00F6AC1400F8BA
      3500B3783900CCA57E000000000000000000000000005A7C3C00547736003B75
      0900346A0500375C160035640C00397306003470000035660B00375C1600346A
      05003B750900547736005A7C3C00000000000000000000000000127EB700007D
      BD000081C5000081C5000081C5000081C5000081C5000081C5000081C5000081
      C500007FC0000F83C000000000000000000000000000F2F2F200E9E9E900E8E8
      E800E2E2E200E9E9E900E3E3E300E9E9E900E6E6E600E8E8E800EBEBEB00E5E5
      E500EDECEB00ECEAEA00F3F3F300000000000000000000000000D6B48E00F6D5
      9300F4CE8600EFCC8C00DFBE9500ECDDCD00B77C3D00F1B33900F3B94300EEA8
      2400F1B33900C0874A00000000000000000000000000BED3AB0046652C005385
      28003777000045801200729F4B0080A3610080A56000729F4B00458012003777
      00005385280046652C00B4CD9F000000000000000000000000009FC7DD00057A
      B700007FC1000081C4000081C5000082C6000082C6000082C6000082C6000081
      C4000481C0009ACCE400000000000000000000000000F2F2F200E7E7E700E5E5
      E500DFDFDF00E6E6E600E0E0E000E6E6E600E3E3E300E5E5E500E8E8E800E2E2
      E200EAEAEA00EDECEC00F3F3F3000000000000000000E5CEB700DCB17900EDC0
      7400EAC07B00D2AA8100EDDECF0000000000BD814100F0BD5C00BD814100ECB1
      4800E8A83B00CF984900DBBB9A0000000000000000000000000070925300436D
      1F00478610007CA558006B88520051703600517036006B8852007CA558004786
      1000436D1F006B8D4B0000000000000000000000000000000000000000000000
      00007DB9D9001C88C100238EC6005BA0C800519AC4001488C4001A8CC8007ABC
      DE000000000000000000000000000000000000000000F3F3F300E5E5E500E2E2
      E200DCDCDC00E2E2E200DDDDDD00E2E2E200DFDFDF00E1E1E100E4E4E400DFDF
      DF00E6E6E600EBEBEB00F3F3F3000000000000000000D5AC8000E3B67000E6B4
      6800D6A56900E8D2BA000000000000000000C3884500C3884500D3A77900CE95
      4E00E3A84E00DFA95600CD9E680000000000799C590056763900496C2A00477F
      160069A03900708E550072995200000000000000000072995200708E550069A0
      3900477F1600496C2A0056763900799C59000000000000000000000000000000
      00000000000000000000C4DBEC00B5C7D800ADC0D300BBD4E600000000000000
      00000000000000000000000000000000000000000000F3F3F300E6E6E600E6E6
      E600DEDEDE00E7E7E700DFDFDF00E7E7E700E3E3E300E5E5E500E9E9E900E1E1
      E100ECECEC00ECECEC00F4F4F4000000000000000000CC935300E6B66D00E4B2
      6800CC935300000000000000000000000000D5A87600E5CAAC0000000000C98D
      4A00E5B06100E7B46600C98D4A00000000004F742E005B93290057971F005799
      1D007EAD55005F804100000000000000000000000000000000005D7F3F007EAB
      560057991D0057971F005B9329004F742E000000000000000000000000000000
      00000000000000000000C8D7E500ADC8E100A9C5DE00C7D5E100000000000000
      0000000000000000000000000000000000000000000000000000E3E3E300DFDF
      DF00DADADA00DFDFDF00DADADA00DFDFDF00DDDDDD00DEDEDE00E1E1E100DCDC
      DC00E3E3E300EAEAEA00000000000000000000000000CF945000E9B86F00E6B4
      6C00CF94500000000000E8CDB000DBAE7B00000000000000000000000000D198
      5800E5B67200E8BA7500D198580000000000557C330081AF580087B65E0075AE
      430088B462005F834000000000000000000000000000000000006185420088B6
      610075AE430087B65E0081AF5800557C33000000000000000000000000000000
      00000000000000000000BAD5EF00C0DBF400C3DDF400BFD6EB00000000000000
      0000000000000000000000000000000000000000000000000000E4E4E400E4E4
      E400DCDCDC00E4E4E400DDDDDD00E4E4E400E0E0E000E2E2E200E6E6E600DFDF
      DF00E9E9E900EAEAEA00000000000000000000000000DCAC7200E7B77000E8B5
      7000DDA75F00E0B48100D5995400D59954000000000000000000EFD9BF00E2B4
      7700E9BF8500EAC28600E2B888000000000081A56100658846006085400089B2
      660092C06B007D9D60007CA35A0000000000000000007CA35A007D9D600092C0
      6B0089B26600608540006588460081A561000000000000000000000000000000
      000000000000DFECF700C3DDF400D1E5F700D3E6F700CBE1F500EEF4FA000000
      0000000000000000000000000000000000000000000000000000E1E1E100DEDE
      DE00D8D8D800DDDDDD00D8D8D800DDDDDD00DADADA00DCDCDC00DEDEDE00DADA
      DA00E1E1E100E7E7E700000000000000000000000000EBCBA500E5B16900EDBC
      7600F1C67E00DB9F5800F7D38A00DB9F580000000000F5E6D500E6BE9000F1D1
      9D00F0CE9C00EBC59100F0D9BE0000000000000000000000000081A46200789D
      580094C16D00A3C6840083A26800668A4700678A480084A36900A3C6840094C1
      6D00779C570081A4620000000000000000000000000000000000000000000000
      000000000000B8D3EA00CEE2F500DAE9F700DCEBF800D7E8F700CDE0F0000000
      0000000000000000000000000000000000000000000000000000E2E2E200E2E2
      E200DADADA00E2E2E200DBDBDB00E2E2E200DEDEDE00E0E0E000E4E4E400DDDD
      DD00E6E6E600E8E8E80000000000000000000000000000000000E4AD6900F7CE
      8400F2C27A00F9D48A00F7CE8400E0A45C00F6E7D400F0D3AB00F6DDB100F7DC
      B400F9E4BA00EDCBA000000000000000000000000000C6D9B300698D4A009BC1
      7A00A0C77D00AFD09200B3D39800AFCD9400B0CD9700B3D39800AFD09200A0C7
      7D009AC17900698D4A00C6D9B300000000000000000000000000000000000000
      00000000000088A2C400D0E3F500DBEAF700E1EDF800DAE9F7009BB1CE000000
      0000000000000000000000000000000000000000000000000000DFDFDF00DBDB
      DB00D6D6D600DBDBDB00D6D6D600DADADA00D8D8D800D9D9D900DCDCDC00D8D8
      D800DEDEDE00E6E6E60000000000000000000000000000000000EDC69700E5A9
      6000FDD88E00F9CC8200FCD58A00E5A96000FCF2DF00FBE9CA00FBE8C800FCEC
      CD00F3D9B700F9EFE300000000000000000000000000779E5500A6C09000B8D6
      9E00BAD4A30095B27C00B2CC9B00AFD09200AFD09200B2CC9B0095B27C00BAD4
      A300B8D69E00A6C08F00779E5500000000000000000000000000000000000000
      0000000000005F79A100CCE1F400D4E3F200CDDCEE00C0D2E90062769D000000
      0000000000000000000000000000000000000000000000000000E1E1E100DFDF
      DF00D9D9D900DFDFDF00D9D9D900DFDFDF00DCDCDC00DDDDDD00E0E0E000DBDB
      DB00E2E2E200E7E7E700000000000000000000000000F4D9B700E8AC6200FFE0
      9400FED98D00FED98D00FFDD9100E8AC6200FDF4E100FBECD200F8E7CC00F7E4
      CC000000000000000000000000000000000000000000B1CC980073965500AFC6
      9A007698590086A866006D914E00BDD8A600BDD8A6006D914E007EA45E007698
      5900AFC69A0073965500B1CC9800000000000000000000000000000000000000
      0000000000005E6F9400556D96002E4778002B4883002C4A85008392B1000000
      00000000000000000000000000000000000000000000000000005E73CD003350
      C9003350C9003350C9003350C9003350C9003350C9003350C9004963CD006D81
      D300919FDA00C1C7E100000000000000000000000000F0C38A00EBAF6500EBAF
      6500EBAF6500EBAF6500EBAF6500F0C38A00FAF1E600FAEFE100000000000000
      0000000000000000000000000000000000000000000000000000B1CC980079A1
      5800C6DAB3000000000071945200BED3AC00BED3AC007194520000000000BCD4
      A70079A15800B1CC980000000000000000000000000000000000000000000000
      000000000000D8DBE400374E7B00284379002F4E8D004E689E00000000000000
      0000000000000000000000000000000000000000000000000000EDEDED00EDED
      ED00ECECED00ECECEC00EBEBEC00EBEBEB00EAEBEB00EAEAEB00EAEAEA00EAEA
      EA00EAEAEA00EAEAEA0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000089AD6A00668D4400668D440089AD6A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B9C0D100BFC7D90000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FDFEFF00EBF5FB00B7D7EE0093C1E30098C4
      E300EFF6FA000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BFCBE200BFCBE20000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000607020000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFFFF00EFF6FB00BDDAEB0087BBD9008CBBD9007CAED00093C6EA0082BC
      E300ABD0EB00F3F9FC0000000000000000000000000000000000000000000000
      00000000000000000000000000002F54B2002F54B20000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B362210000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000028620000358300003583000035
      83000134800001348000013480000134800002327A0003317600033176000331
      7600033176000331760003317600000000000000000000000000F7FBFD00DFEF
      F900B9DBF00094C5E6008BBAD800B1CDDB00CBD8DF0070A9CF0084BCE30087BF
      E50096C6E700ABD2EC00F3F9FC00000000000000000000000000000000000000
      00000000000000000000AFBDDB00002AC800002AC800AFBDDB00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000077491600D262220036270A004B2E0C0030190B0000000000000000000000
      0000000000000000000000000000000000000078FF00006BFF00006BFF000169
      F8000169F8000169F8000169F8000164F7000168EF000362F0000564E6000663
      E0000663E0000663E0000663E0000443A200F5FAFC00B1D1E4008ABDDF0094C4
      E300B8D4E400D3DEE400E6E7E600E9E4E100DDDCDD0071ADD70081B9E2006FAF
      DC0083B9DF0079B3DC0090C0E100F8FBFD000000000000000000000000000000
      000000000000000000001B45A7000030D0000030D0001B45A700000000000000
      0000000000000000000000000000000000000000000000000000000000001C18
      0600D66E2200C9662000C9642000CC632100CC612000CE642500473326000000
      000000000000000000000000000000000000006BFF00006BFF00006BFF000066
      FF000066FF000066FF000164F7000164F7000362F0000362F000055EE600055E
      E600065CDE00065CDE00065CDE000443A200DFEDF6007DABC800B8CAD500E0E5
      E800EAE8E600E5DDD900D7C0B500D0A89200CBB4A70078B2DD0087BDE60074B2
      E00083BAE20099C8E7007DB8DF00EAF4FA000000000000000000000000000000
      0000000000009FB0D400002FC8000031D2000031D200002FC8009FB0D4000000
      000000000000000000000000000000000000000000000000000000000000CE84
      1E00D5812000D47D2000D57C2100C77B2A00C57D3600E18E4600E89956005041
      3300000000000000000000000000000000000073FF000073FF00006BFF00006B
      FF00006BFF00006BFF000066FF000066FF000164F7000164F7000362F000055E
      E600055EE600065CDE00065CDE000443A200E5F1F9008BBDDF00D2D1D300D9C2
      B800D8B8A800DDBBA500DFC1AC00DFC5AF00D4CCC4006FA7D00082BAE4006BAC
      DE006FAEDC0090C1E50091C4E700ECF5FB000000000000000000000000000000
      0000000000001B45A8000031E8000032D6000032D6000031E8001B45A8000000
      0000000000000000000000000000000000000000000000000000000000002D27
      1D00C8963E00E1991F00DE97210000000000000000000000000028211B00DEA9
      660000000000000000000000000000000000056EE8000078FF000073FF00026A
      E1000073FF00006BFF00006BFF00006BFF000066FF000164F7000164F7000362
      F000055EE600055EE600065CDE000443A200E4F1F90086BBDE00C4AC9D00D1A6
      8800DCC2AD00E4D9CF00E5E5E400E2E8EC00CAD7DF0080A9C6006AA4D0005197
      CA005BA2D2007AB4DB0075B0DB00E6F1F8000000000000000000000000000000
      00009FB0D400002FC8000031E800002DD800002DD8000031E800002FC8009FB0
      D400000000000000000000000000000000000000000000000000000000000000
      0000000000001C191300BE973F001E1708000000000000000000000000000000
      00002B2217000000000000000000000000001250AC00044FB0000544A400396C
      B30005429E000073FF00006BFF00006BFF00006BFF000066FF000164F7000164
      F7000362F0000564E600065CDE000443A200E3F0F90078B1D900C4C4C100D3D0
      CC00BFCFD900A1C1D9007EAED0006AA2C8005C9AC0005295BC00619FC8005094
      BF00458EBC006BAAD2006AABD000E2EFF6000000000000000000000000000000
      00000E399C00002FE2000031E800002EDA00002EDA000031E800002FE2000E39
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DAE8EA0097B5D600DAE8EA00D6E5
      E7005381BE000450B4000073FF000073FF00006BFF00006BFF000073FF000164
      F7000362F000055EE600055EE6000443A200E7F3FB0086B5D4008EAEC4006BA1
      C6004B8FBE003883B4003785B2005097C10073B1D6008AC1E6008DC3EB0082BC
      E500599EC9004D92BC0074AED100E6F1F7000000000000000000000000005F7C
      B900002DC200002CD300002EC600002CBE00002CBE00002EC600002CD300002D
      C2005F7CB9000000000000000000000000000000000000000000030201000000
      00000000000000000000000000000505040052390E0000000000000000000000
      000000000000000000000000000000000000DEEAED00DEEAED00DAE8EA00DAE8
      EA00DAE8EA001F5AAF000261D6000073FF000073FF00044FB000053D94000168
      EF000164F7000362F000055EE6000443A200D9E8F1005092BB003B86B4002F81
      B3004491C10061A5D20071AFDC0071AEDC0080B4DC0090B8D7006796B9006BAA
      D90076B4E3005DA3D100579AC200DEEBF300000000000000000000000000234C
      9F00002FE200002EC6003F62D400C2CDEB00C2CDEB003F62D400002EC600002F
      E200234C9F00000000000000000000000000000000000000000000000000B188
      490001010100000000000000000000000000DBA33200DC9E2200644310000100
      000000000000000000000000000000000000E0EDEF00E0EDEF00DEEAED00DEEA
      ED00DAE8EA00DAE8EA000548A8000361CC0005429E0091AECC00CDDDDF00053B
      8D000164F7000362F000055EE6000344A800D4E6EF006AA8CC007AB5DC008DC2
      E80093C5EB0077AED700729EC000B6CADA00DBE2E600EEEDE9007F9DB30073A5
      CA00A3CEED00A8D1EE00A1CBE600DDECF4000000000000000000000000000030
      92000031E800002EC600EDEFFA00E4E9F500E4E9F500EDEFFA00002EC6000031
      E800003092000000000000000000000000000000000000000000000000006759
      4300E3A35E009D683800542E13004A270E00B9752C00D0882400D18B2300D48F
      23001B140A00000000000000000000000000E4EFF100E4EFF100E4EFF100E0ED
      EF00DEEAED00DAE8EA00DAE8EA00608BC300D0E0E300D0E0E300D0E0E300698D
      B8000447A2000164F7000362F000023E8900FCFDFE00E7F2FA00C1DFF40098C7
      EA008EC0E70074ADD5008AB3CE00F4F3EF00F4EDE200F4EDDF00C2D0D9008BAD
      CC00C4DAED00E7F2F900F8FBFD00000000000000000000000000000000000030
      9200002FDE00002EC600EDEFFA00ECF0F900ECF0F900EDEFFA00002EC600002F
      DE00003092000000000000000000000000000000000000000000000000000000
      00008C6F5900D0713100C0672700C16A2600C06C2600BF6D2500C5722500AF75
      3A0000000000000000000000000000000000EAF4F600E6F1F300E6F1F300E4EF
      F100E0EDEF00DEEAED00DAE8EA00DAE8EA00D6E5E700D6E5E700D0E0E300CDDD
      DF00114593000165E700043A8C001A3965000000000000000000FAFCFE00D6E8
      F600A4CEED0086BFE8008FC2E800E6EDF100F5EFE700EFE8DA00F5F3EF00F7F9
      FB00000000000000000000000000000000000000000000000000000000003F62
      AB00002FC800002EC6003F62D400D1DAF400D1DAF4003F62D400002EC600002F
      C8003F62AB000000000000000000000000000000000000000000000000000000
      0000000000001F18140094583600B15E2D00AA592B00B95F2900C96B32000503
      020000000000000000000000000000000000EEF7F800EAF4F600E6F1F300E6F1
      F300E4EFF100E0EDEF00DEEAED00DAE8EA00D6E5E700D0E0E300D0E0E300D0E0
      E300CBDADD00043A8C007D99B7008E9799000000000000000000000000000000
      0000F9FCFE00DAEAF700D7E8F500F6F6F600F6F2EB00ECE3D100F6F1E700FDFC
      FB0000000000000000000000000000000000000000000000000000000000BECA
      E200002E9800002FC800002EC600002EC600002EC600002EC600002FC800002E
      9800BECAE2000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B36B4100452E21000000
      000000000000000000000000000000000000EEF7F800EEF7F800EAF4F600E6F1
      F300E4EFF100E0EDEF00DEEAED00DAE8EA00D6E5E700D6E5E700D0E0E300D0E0
      E300CDDDDF00CBDADD00C6D4D6008E9799000000000000000000000000000000
      0000000000000000000000000000FDFCFA00F6F1E900F2ECE100F7F2EC00FCFA
      F700000000000000000000000000000000000000000000000000000000000000
      00007E96C600002E9800002FC8000031E8000031E800002FC800002E98007E96
      C600000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003F312900000000000000
      000000000000000000000000000000000000F3FBFC00EEF7F800EAF4F600EAF4
      F600E6F1F300E4EFF100DEEAED00DAE8EA00D6E5E700D6E5E700D0E0E300D0E0
      E300CDDDDF00CBDADD00C6D4D600676E6F000000000000000000000000000000
      0000000000000000000000000000FDFCFB00FAF8F400FCFBF900FEFDFB00FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      000000000000BECAE2003E62AB0000309200003092003E62AB00BECAE2000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF001A1AAD001B1BAD001B1BAC001C1CAC001C1CAB001D1DAB001D1DAA001D1D
      AA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FAFAFA00D2D2D500AAAAB8009595AA009393A900A7A7B500CFCFD300F7F7
      F70000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF001A1A
      AE001717AB000F0FAC000F0FB6001212BF001818C6001D1DC7001E1EC0001E1E
      AE001E1EA900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CDA68900E1B7
      9700E1B79700E1B79700E1B79700E1B79700E1B79700E1B79700E1B79700E1B7
      9700E1B79700E1B79700CDA68900FFFFFF00000000000000000000000000F8F8
      F800DEDEDE00D5D5D500F9F9F900000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C3C3
      C90059599D001C1CC0000E0EE0001A1AEA001B1BEA000F0FDF001A1AC1005252
      9D00BBBBC400000000000000000000000000FFFFFF00FFFFFF001919AE001616
      AC000707B2001717C1005050D2005F5FD3006666D6006363DF003F3FE0002D2D
      E2002424BD001F1FA800FFFFFF00FFFFFF00FFFFFF00FFFFFF00E2B99900FBEA
      CF00F9E5C500F9E5C500F9E5C500F9E5C500F9E5C500F9E5C500F9E5C500F9E5
      C500F9E5C500FBEACF00E2B99900FFFFFF00FCFCFC00DDDDDD00AFAFAF009090
      9000888888007474740096969600F7F7F7000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009292AA001616
      BE003232F4007171FF009D9DFF00B6B6FF00C0C0FF00B5B5FF008A8AFF004343
      F3001313C1008585A4000000000000000000FFFFFF001919AF003A3ABF001212
      B8002222BF004B4BC3003636B6001C1CAC001C1CAB003838B4006767D8004040
      EC003B3BF2002424BD001E1EA900FFFFFF00FFFFFF00FFFFFF00E3BB9B00FBEA
      D000A4A3A100A4A3A100A4A3A100A4A3A100A4A3A100A4A3A100A4A3A100A4A3
      A100A4A3A100FBEAD000E3BB9B00FFFFFF009C9C9C00838383008A8A8A008585
      85007272720078787800474747009E9E9E00C3C3C300B9B9B900E8E8E8000000
      000000000000000000000000000000000000000000009C9CAF001010CC004B4B
      FC007979FF008787FF009696FF00A9A9FF00B4B4FF00B4B4FF00ABABFF009E9E
      FF006969FC001515D0008C8CA700FEFEFE001818B0002626B6003030C2000909
      B4002323B2001B1BAD00FFFFFF00FFFFFF00FFFFFF002323D7002A2ADE003131
      E6004B4BED002E2EE3001E1EAD001E1EAA00FFFFFF00FFFFFF00E4BD9E00FBEB
      D000F9E6C600F9E6C600F9E6C600F9E6C600F9E6C600F9E6C600F9E6C600F9E6
      C600F9E6C600FBEBD000E4BD9E00FFFFFF00646464006A6A6A005A5A5A005050
      500044434400606061004B4B4B0047474700666666007A7A7A006A6A6A009E9E
      9E00E4E4E400000000000000000000000000E0E0E1002929AF003636FD004E4E
      FF005353FF007272FF008B8BFF009797FF009595FF008C8CFF008282FF006C6C
      FF006A6AFF005555FD002323B500D2D2D5001818B0004949C6000C0CB5001414
      B0001A1AAE00FFFFFF00FFFFFF00FFFFFF001919CC001F1FD2002424D8002A2A
      DE007070DC004242E1001E1EBD001D1DAA00FFFFFF00FFFFFF00E5C0A100FBEB
      D000156BC300F9E6C700F9E6C700F9E6C700156BC300F9E6C700A4A3A100A4A3
      A100A4A3A100FBEBD000E5C0A100FFFFFF005D5D5D0045454500373737002B2B
      2A0024242A005F616F004F4F4E00686868006F6F6F009696970079797D006161
      61005E5E5E00ABABAB00FCFCFC00000000009898AF001717ED002D2DFF003131
      FF007171FF00CBCBFF00C5C5FF00C4C4FF00C9C9FF008585FF007373FF009999
      FF007575FF004545FF002D2DF3008585A7001818B0006060CF001111B5001919
      AE00FFFFFF00FFFFFF00FFFFFF001111C3001515C8001A1ACD001F1FD2002323
      D7003838B4006767E0001D1DC5001D1DAB00FFFFFF00FFFFFF00E7C3A500FBEB
      D100156BC300156BC300CDCDCD00156BC300156BC300F9E6C800F9E6C800F9E6
      C800F9E6C800FBEBD100E7C3A500FFFFFF005D5D5D0044444400393939003B3B
      3A005C5B60008E8D940066666600A2A2A20098989800A8A8A80077777A007F7F
      80007A7A7A0061616100D6D6D600F4F4F4006F6FAA001212FF001C1CFF000F0F
      FF008383FF007E7EFF005050FF007D7DFF00CECEFF00E0E0FF00E4E4FF000000
      00009393FF002727FF002727FF006363AC001818B0006E6ED5003737BF004848
      BF00FFFFFF00FFFFFF000B0BBC000E0EBF001111C3001515C8001919CC00FFFF
      FF002424AF007C7CDE001717C4001C1CAB00FFFFFF00FFFFFF00E8C6A800FBEB
      D200176EC60053D0EF00176EC60053D0EF00176EC600F9E7C900A4A3A100A4A3
      A100A4A3A100FBEBD200E8C6A800FFFFFF00606060007A7A7A00898989008686
      86007F7F7F00767675007B7B7B00B7B7B700B1B1B100D9D9D900A9AAAA009595
      95008989890060606000AFAFAF00EEEEEE006A6AB1000101FF001A1AFF006565
      FF009F9FFF00CCCCFF00D5D5FF00F2F2FF000000000000000000000000000000
      00008989FF001717FF001515FF005E5EB6001818B0007171D6004040C2004646
      BF00FFFFFF000606B6000808B9000B0BBC000E0EBF001111C300FFFFFF00FFFF
      FF002424AF006F6FD9001212BD001C1CAC00FFFFFF00FFFFFF00EAC9AC00FBEB
      D3001A72CB004DCFED0014BFE7004DCFED001A72CB00F9E7CB00F9E7CB00F9E7
      CB00F9E7CB00FBEBD300EAC9AC00FFFFFF00A4A4A40083838300767676007A7A
      7A0079797900575757006262620074747400A0A1A200AFAFB000B5B3AF00ADAB
      A2009C9C9B007B7B7B00BFBFBF00000000006B6BB4002020FF005353FF00F9F9
      FF00000000000000000000000000000000000000000000000000000000000000
      0000A3A3FF004848FF003131FF005D5DBA001717B1006969D2004444C6001E1E
      B1001E1EBC002F2FC2002323C0001313BC000A0ABC00FFFFFF00FFFFFF00FFFF
      FF003636B6005050D1001010B4001B1BAC00FFFFFF00FFFFFF00EBCCAF00FBEC
      D4001D76CF0056D4EC0021C5E60056D4EC001D76CF00F9E8CC00A4A3A100A4A3
      A100A4A3A100FBECD400EBCCAF00FFFFFF0000000000FCFCFC00BBBBBB005A5A
      5A004D4D4D003E3E3E002A2B2B005E5D5D00978D7200AA975C00BAA35400C0AB
      60008380770077787800EBEBEB00000000007D7DB4005757FF007676FE00CACA
      F400D0D0F600ECECF900FFFFFE00000000000000000000000000000000000000
      0000ABABFF006969FF006262FF007070B7001717B1005C5CCE004E4EC9003232
      BE003838C4003939C4003232C3001C1CBD00FFFFFF00FFFFFF00FFFFFF001B1B
      AD005E5EC9003535C9001D1DB0001B1BAD00FFFFFF00FFFFFF00EDCFB300FBEC
      D500207BD40062D8EC0030CBE60062D8EC00207BD400F9E8CD00F9E8CD00F9E8
      CD00F9E8CD00FBECD500EDCFB300FFFFFF0000000000000000008B8B8B003E3E
      3E004B4B4B004A4A4A0057575700A9A9A900B3A17400B18F3200B18F2A00B797
      34008F86680067676800E0E0E00000000000B7B7C7004B4BF7008989FF007878
      F8007878FA008686F7009C9CF100C5C5F400E5E5F800F7F7FB00FFFFFD000000
      0000B7B7FF008181FF005555FF00A5A5BF001717B1002828B8007070D5004444
      C7004040C6003838C4001E1EBC00FFFFFF00FFFFFF00FFFFFF001A1AAE003B3B
      BB004747CA002727BC001A1AAC001A1AAD00FFFFFF00FFFFFF00EED2B600FBEC
      D600227FDA006DDDEC003FD2E6006DDDEC00227FDA00F9E8CE00A4A3A100A4A3
      A100A4A3A100FBECD600EED2B600FFFFFF000000000000000000D6D6D6007474
      740050505000414141004E4E4E008383840098918200AD986700AD9A6D00B2A4
      7E00ADA89B00555556007E7E7E0000000000F4F4F4006060BB008787FF009E9E
      FF009292FF009191FF008F8FFF008C8CFC009090F600A1A1F300BABAF200DADA
      F300BFBFFB008989FF005454BF00EEEEEF00FFFFFF001717B1004747C5006A6A
      D3004444C7003737BF001E1EB1001F1FB2002121B3001E1EB0002D2DB8003737
      C3003939C4001F1FB0001A1AAE00FFFFFF00FFFFFF00FFFFFF00EFD4B900FCF0
      DB002583DE0077E2EC004DD8E50077E2EC002583DE00FBEDD600FBEDD600FBED
      D600FBEDD600FCF0DB00EFD4B900FFFFFF00000000000000000000000000FBFB
      FB00EDEDED00DFDFDF00D7D7D700C7C7C70080807F007C7B7800808081008787
      89008687870057575700909090000000000000000000DDDDE0005555C8009D9D
      FF00BCBCFF00B3B3FF00B0B0FF00B1B1FF00B0B0FF00ACACFF00A9A9FE00B1B1
      FD009F9FFF005555CD00D4D4D90000000000FFFFFF00FFFFFF001717B1004747
      C5007878D9004F4FC9004444C6003D3DC1003B3BC0003E3EC4003D3DC5005F5F
      D2003B3BBF001919AE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F0D6BB00FEF5
      E7002887E3009DECF00080E6EC009DECF0002887E300FDF4E500FDF4E500FDF4
      E500FDF4E500FEF5E700F0D6BB00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000EFEFEF00EBEBEB00EDEDED00C5C5
      C5009F9F9F00AEAEAE00EEEEEE00000000000000000000000000EDEDEE007070
      BF007878E300B6B6FF00CBCBFF00CECEFF00CFCFFF00CBCBFF00BABAFF007D7D
      E5006868C300E3E3E6000000000000000000FFFFFF00FFFFFF00FFFFFF001717
      B1002828B8006464D2007373D6007373D7007070D7006A6AD4006060CF002929
      B7001919AF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F1D8BD00F1D8
      BD002A8AE600DAF9FA00D0F7F800DAF9FA002A8AE600F1D8BD00F1D8BD00F1D8
      BD00F1D8BD00F1D8BD00F1D8BD00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C7C7D8008B8BBD008181BD008181C6008181C7008181BE008787BC00C1C1
      D60000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF001717B1001717B1001717B1001818B0001818B0001818B0001818B0001818
      AF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF002B8CE9002B8CE9002B8CE9002B8CE9002B8CE900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FAFAFB00D9D9E000B6B6C800A2A2C500A1A1C500B4B4C600D5D5DE00F8F8
      FA0000000000000000000000000000000000FFFFFF00FFFFFF00595049005851
      4B0057514B0057504B0057504B0057504B0057504B00544E4A002A2623000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00626262005555
      5500565656005555550055555500545454005353530053535300525252005252
      52004F4F4F005C5C5C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF002A2AD6002525CE001F1FC5001A1ABD001515B500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00746960009E989400CBCB
      CB00CDCDCD00D3D3D300DADADA00E1E1E100E8E8E800EAEAEA0099949000A29F
      9C000D0C0B0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00363636001111
      1100171717001414140011111100111111000F0F0F000E0E0E000C0C0C000909
      090000000000272727005B5B5B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF003232E3002D2DDB002828D2002222C9001D1DC100FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0010992000D26C1000D26C1000D26C1000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0074696000C4C4C300CCCC
      CC00CECECE00D8D8D800E2E2E200EBEBEB00F5F5F500F4F4F40096949200F7F7
      F700BCBAB800211E1C0000000000FFFFFF00FFFFFF00FFFFFF00383838001818
      18001D1D1D001B1B1B0017171700181818001717170016161600141414001313
      1300090909002B2B2B005A5A5A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF003A3AEF003535E7003030DF002A2AD6002525CE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF001099200010992000A3D6A700A3D6A700E3B79400E3B79400D26C1000D26C
      1000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0074696000C9C9C800CCCC
      CC00CECECE00D7D7D700D6D6D600D6D6D600DEDEDE00DFDFDF009E9C9A00FEFE
      FE00F7F7F700B8B6B4000C0B0A00FFFFFF00FFFFFF00FFFFFF00393939001818
      18001A1A1A001717170005050500000000001111110014141400141414001313
      1300090909002A2A2A0059595900FFFFFF00FFFFFF00FFFFFF00EF775100EF73
      5000FFFFFF004040F8003C3CF2003737EB003232E3002D2DDB00FFFFFF00EF56
      4700EF534600EF504500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF001099
      2000B1E7BC00B1E7BC00109920004AB25A00D26C1000C55E0A00E3B79400E3B7
      9400D26C1000FFFFFF00FFFFFF00FFFFFF00FFFFFF0074696000CCCCCB00CCCC
      CC00CCCCCC00C9C9C9004B4B4B004C4C4C004040400079797900E7E7E700E1DE
      DD00FEFEFE00F3F3F3009E9A970000000000FFFFFF00FFFFFF00373737001616
      16000F0F0F0047474700CECECE004949490000000000000000000E0E0E000E0E
      0E00070707002929290059595900FFFFFF00FFFFFF00EF7E5300FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EF59
      4800EF564700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF001099
      2000BCEDD3005CCC8B004AB25A004AB25A00D26C1000C55E0A00C55E0A00E3B7
      9400D26C1000FFFFFF00FFFFFF00FFFFFF00FFFFFF0074696000C2C2C1009595
      95008E8E8E00959595008F8F8F000D0D0D0031313100E2E2E200F7F7F700F3F2
      F200D5D2D000D4D1CF00ACA6A2002E2A2700FFFFFF00FFFFFF00363636001414
      1400050505004C4C4C00FEFEFE00FEFEFE00A7A7A70022222200000000000909
      0900000000002727270059595900FFFFFF00EF845500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EF5D
      4900FFFFFF00EF564700FFFFFF00FFFFFF00FFFFFF00FFFFFF0010992000BCED
      D3008CD49B004AB25A00E9A04100E9A04100E9A04100D26C1000D26C10001099
      2000A3D6A700D26C1000FFFFFF00FFFFFF00FFFFFF00746960009C543200AD5A
      1700AF5E190094411600D3CBC9001717170041414100E6E6E600F3F3F300F6F6
      F600F6F6F600F6F6F600EEEEEE00625C5700FFFFFF00FFFFFF00353535001313
      13000303030047474700FEFEFE00FEFEFE00FEFEFE00FEFEFE00787878000000
      0000000000002727270059595900FFFFFF00EF875600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EF564700FFFFFF00FFFFFF00FFFFFF00D26C1000FAEB
      D000E9A04100E3B79400E9A04100E9A04100E9A041004AB25A004AB25A004AB2
      5A00A3D6A70010992000FFFFFF00FFFFFF00FFFFFF0074696000E5E5E400BC75
      3C00BD6E2200C2C1C000EBEBEB001818180042424200E2E2E200EBEBEB00EEEE
      EE00F0F0F000F0F0F000E7E7E700655E5900FFFFFF00FFFFFF00343434001111
      11000000000047474700FEFEFE00FEFEFE00FEFEFE00E4E4E4005A5A5A000000
      0000000000002626260059595900FFFFFF00EF8A5700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EF594800FFFFFF00FFFFFF00FFFFFF00D26C1000FAEB
      D000E9A041008CD49B00E9A04100E9A04100E9A041005CCC8B005CCC8B004AB2
      5A00A3D6A70010992000FFFFFF00FFFFFF00FFFFFF0074696000E9E9E800BA74
      3D00BA6E2600C7C7C700EFEFEF001818180041414100E2E2E200E8E8E800E7E7
      E700E6E6E600E6E6E600DEDEDE00655E5900FFFFFF00FFFFFF00343434000E0E
      0E00000000004A4A4A00FEFEFE00F2F2F2007878780000000000000000000505
      0500000000002525250059595900FFFFFF00EF8D5800FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EF5C4900FFFFFF00FFFFFF00FFFFFF00D26C1000FAEB
      D000BCEDD300BCEDD3008CD49B00FAEBD000FAEBD0004AB25A005CCC8B005CCC
      8B00B1E7BC0010992000FFFFFF00FFFFFF00FFFFFF0074696000EAEAEA00BA74
      3E00BA6E2700CACACA00F4F4F4001818180042424200E1E1E100E6E6E600E3E3
      E300E1E1E100DCDCDC00D7D7D700655E5900FFFFFF00FFFFFF00323232000C0C
      0C000707070037373700A2A2A2001B1B1B000000000000000000050505000505
      0500000000002222220059595900FFFFFF00EF905900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EF5F4A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D26C
      1000E6F7EC00BCEDD300E6F7EC00458F6300458F6300E6F7EC004AB25A00B1E7
      BC0010992000FFFFFF00FFFFFF00FFFFFF00FFFFFF0074696000ECEBEB00BF7C
      4800A5683100B5B5B500F7F7F7001919190043434300E4E4E400E4E4E400B0B0
      B000DDDDDD00D8D8D800D0D0D000655E5900FFFFFF00FFFFFF00313131000909
      0900000000000000000000000000000000000000000000000000000000000000
      0000000000002121210058585800FFFFFF00FFFFFF00EF905900FFFFFF00EF8A
      5700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EF624B00FFFFFF00FFFFFF00FFFFFF00FFFFFF001099
      2000E6F7EC00FFFFFF00458F63005CCC8B004AB25A00458F6300E6F7EC00B1E7
      BC0010992000FFFFFF00FFFFFF00FFFFFF00FFFFFF003C363100ECECEB00C386
      5500281C100091919100CECECE00151515003E3E3E00C6C6C6007D7D7D004B4B
      4B00E0E0E000D8D8D800D1D1D100655E5900FFFFFF00FFFFFF00272727000303
      0300353535002727270000000000000000003232320022222200000000000000
      00002A2A2A003232320055555500FFFFFF00FFFFFF00FFFFFF00EF905900EF8D
      5800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EF694D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00458F63005CCC8B005CCC8B005CCC8B005CCC8B00458F6300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008C2C0000361F1800D2D2D200C58C
      5F0032251A001B1B1B002B2B2B000B0806001A1A1A002C2C2C00151515007474
      7400E5E5E500E0E0E000D7D7D700655E5900FFFFFF00FFFFFF00646464000000
      000078787800FEFEFE00AEAEAE00000000007C7C7C00FEFEFE00A4A4A4000000
      000097979700BDBDBD0051515100FFFFFF00FFFFFF00EF945A00EF925A00EF8F
      5900FFFFFF002A2AD6002525CE001F1FC5001A1ABD001515B500FFFFFF00EF74
      5000EF714F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00458F6300458F6300458F63005CCC8B005CCC8B00458F6300458F6300458F
      6300FFFFFF00FFFFFF00FFFFFF00FFFFFF009F450D008E441800A4918B00C38D
      6300CEA78300A0908B00967160009C582700CCCCCC00DFDFDF00DEDEDE00ECEC
      EC00EBEBEB00E6E6E600D9D9D900655E5800FFFFFF00FFFFFF00BABABA00BFBF
      BF000000000079797900FEFEFE00BFBFBF00000000007F7F7F00FEFEFE00B0B0
      B00000000000515151005C5C5C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF003232E3002D2DDB002828D2002222C9001D1DC100FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00458F63005CCC8B005CCC8B00458F6300FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00973C0C00C88A5400B2642A00BF7A
      4300C7895600B3652B00C6865100BE835B00EDECEC00EBEBEA00E9E9E800E7E7
      E700E4E4E300DCDCDC00AEAAA70060574F00FFFFFF00FFFFFF008D8D8D001D1D
      1D0069696900E4E4E400EDEDED00151515006B6B6B00F5F5F500EEEEEE001818
      18005B5B5B00ADADAD0055555500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF003A3AEF003535E7003030DF002A2AD6002525CE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00458F63005CCC8B004AB25A00458F6300FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00746960007469
      6000746960007469600074696000746960007469600074696000746960007469
      6000746960007469600074696000FFFFFF00FFFFFF00FFFFFF001D1D1D000000
      00006A6A6A0088888800262626000000000074747400909090001E1E1E000000
      00008484840071717100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF004040F8003C3CF2003737EB003232E3002D2DDB00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000E5A3E000E5A
      3E000E5A3E000E5A3E000E5A3E000E5A3E000E5A3E000E5A3E000E5A3E000E5A
      3E000E5A3E000E5A3E00FFFFFF00FFFFFF00000000000000760000009C000000
      9C0000009C0000009C0000009C0000009C0000009C0000009C0000009C000000
      9C0000009C000000760000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000A0A
      0A003B3C3B00494A4B005A5B5C005C5E5F005D5F60005C5E5F005C5E5F004D4D
      4E001819190000000000FFFFFF00FFFFFF00FFFFFF0015614400237554002F8F
      6700309168003091680030916800309168003091680030916800309168003091
      68002F8F66002375540015614400FFFFFF00000000000000A8006363FB005F5F
      F7005F5FF7005F5FF7005F5FF7005F5FF7005F5FF7005F5FF7005F5FF7005F5F
      F7006363FB000000A80000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00303337005455
      5700575C6000535A600062686C006A707600757A7F0085898F00969A9D00A0A1
      A300A1A3A500484A4B00FFFFFF00FFFFFF00FFFFFF001E6A4C003E9872003E9A
      74003E9A74003E9A74003E9A74003E9A74003E9A74003E9A74003E9A74003E9A
      74003E9A74003F9773001E6A4C00FFFFFF00FFFFFF000000B6006161F8005858
      F0005858F0005858F0005858F0005858F0005858F0005858F0005858F0005858
      F0006161F8000000B600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005B5D60006062
      620071797F0050565E00454C4F00454A4E0042474A0044484C0050565B007073
      7800767A7F007C828400FFFFFF00FFFFFF00FFFFFF00277455005FAE8F004DA5
      83004DA583004DA583004DA583004DA583004DA583004DA583004DA583004DA5
      83004DA5830061AE910027745500FFFFFF00FFFFFF000101BF006363F8005A5A
      F1005A5AF1005A5AF1005A5AF1005A5AF1005A5AF1005A5AF1005A5AF1005A5A
      F1006363F8000101BF00FFFFFF00FFFFFF00EFAF8200F3C5A100F3C29C00F2BF
      9700F1BC9100F0B98C00EFB78700EEB48100EDB17D00ECAE7700EBAB7200EAA8
      6D00EAA56700E9A26200E79E5C00D9813C00FFFFFF00FFFFFF005C5F61005358
      55008C8D81009C9D8900A4A68F00AAAA9100A6A89100A8A89300949682005C60
      4D001F251A00212D2F00FFFFFF00FFFFFF00FFFFFF00317F5E008AC1AC005FB0
      92005FB092005FB092005FB092005FB092005FB092005FB092005FB092005FB0
      92005FB092008BBFAB00317F5E00FFFFFF00FFFFFF0059333300E5D4D400D1C0
      C000D2C1C100D4C3C300D5C4C400D7C6C600D9C8C800DBCACA00DDCCCC00DFCE
      CE00E3D2D20059333300FFFFFF00FFFFFF00F5CAAA00F8F1E700FDF3E500FFF3
      E100FFF0DA00FFEED400FFEBCD00FFE9C600FFE6C000FFE3BA00FFE1B400FFDE
      AD00FFDBA600FCD69E00F6CE9400E79F5C00FFFFFF00FFFFFF003D424200535A
      52009597A6008788C3007C80D2007273D2007374CF007777D2007D7FCE008689
      BF009598AF0050575600FFFFFF00FFFFFF00FFFFFF003B8A670062A488009BD0
      BD0070BBA10070BBA10070BBA10070BBA10070BBA10070BBA10070BBA10070BB
      A1009FD1C0005B9F81003B8A6700FFFFFF00FFFFFF005D373700E8D7D700D2C1
      C100D8C7C700E5D4D400E7D6D600DDCCCC00DCCBCB00E9D8D800EBDADA00E2D1
      D100E5D4D4005D373700FFFFFF00FFFFFF00F6CDB000FEFAF300EFE9DF00FAF1
      E300FFF3E000FFF0DA00FFEED300FFEBCD00FFE9C600FFE6C000FFE3BA00FFE1
      B300F8D8A800EECD9B00FED89F00E8A26100FFFFFF00FFFFFF00FFFFFF003A42
      4B002B2BF2001717F8000F0DEC000809DD000000CF000000C8000101C6001010
      C1002626CC0055576B00FFFFFF00FFFFFF00FFFFFF00FFFFFF004494700082BB
      A300B2DDCF0092CEBC007FC6B0007FC6B0007FC6B00080C6B10093CFBC00B2DD
      D0007CB79E0044947000FFFFFF00FFFFFF00FFFFFF00613B3B00EAD9D900D4C3
      C300A493930097868600AE9D9D00DFCECE00BCABAB00A7969600CBBABA00EEDD
      DD00E7D6D600613B3B00FFFFFF00FFFFFF00F7D0B400FFFDFB00FDF9F200E7E1
      D700F8EFE100FFF3E000FFF0DA00FFEED300FFEBCC00FFE9C600FFE6C000F1D7
      B000E8CDA300FDDCAB00FFDBA600E9A56600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF001726E3005867E5003B4DCC004B5DCB001522B7000014B100001DB800001D
      BE000000D700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004D9D78004D9D
      780074B59800ADD6C700CEEAE200CEEAE200CEEAE200CCE9E100ABD5C50073B4
      97004D9D78004D9D7800FFFFFF00FFFFFF00FFFFFF00663F3F00EDDCDC00D5C4
      C400D7C6C60093828200E7D6D600DDCCCC009F8E8E00F4E3E300A7969600EFDE
      DE00EAD9D900663F3F00FFFFFF00FFFFFF00F8D1B600FFFFFF00FFFDFA00FDF8
      F100DFD9CF00F0E7D900F4D6B800F2C39C00EEBD9300EEC9A300DFC7A600E4CE
      AB00FFE3B900FFE1B300FFDEAC00EAA76B00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF002534DB0094A6EF005C78D7006A85DC00414FD0000018C600002ACF000027
      D2000008E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0054A47E00489773002E7C5B0017634600166245002B78580043926F0054A4
      7E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006A424200F1E0E000D7C6
      C600D9C8C8008F7E7E00E7D6D600DFCECE009B8A8A009F8E8E00BFAEAE00E7D6
      D600ECDBDB006A424200FFFFFF00FFFFFF00F9D3B800FFFFFF00FFFFFF00F7F5
      F300E3C2A800DC9B6C00F4C8A300F8D8B800F8D6B400F4C79F00DE9C6A00DFA7
      7800ECD5B100FFE3B900FFE1B300EBAA7000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00232BCF00B7C0ED00838ED500828CD900646DD6000003BD000012C900000F
      CB000002E800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00196548001B674A00287F5C00318F68003190690029815E001C684A001965
      4800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006E464600F3E2E200D9C8
      C800DFCECE008C7B7B00E7D6D600E1D0D0009B8A8A00DFCECE00EEDDDD00E9D8
      D800EEDDDD006E464600FFFFFF00FFFFFF00F9D4B900F9F9F900E1CEC000E5A9
      7F00F8D5B900FFF6E800FFF4E300FFF2DE00FFF0DA00FFEED500FFEDD100F5CB
      A200DC925B00D6AA8000F1D7AF00EBAC7500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF002527C200EDF0F900AFB1E5008C8EDB009FA1E3000706C7000002D5000009
      E6000001EB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00257253003D8E6D0048A17E0048A17E0048A17E0048A17E003C8F6F002572
      5300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0071494900EBD8D800DDCC
      CC009D8C8C008A797900E4D3D300E3D2D200C9B8B8009B8A8A00BDACAC00EAD9
      D900E8D5D50071494900FFFFFF00FFFFFF00CEA78A00E3AB8200F8D1B400FEF6
      ED00FFFAF200FFF9F100FFF8EE00FFF7EB00FFF6E700FFF4E400FFF3DF00FFEF
      D700FFEBCE00EEB58500D18B5600C1825000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF001F1EAC00E4E9F800CDD0F600858BE3007678E0000A08D0000000D5000002
      F9000000EF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00317F5E0063AF93005FB092005FB092005FB092005FB0920060B09200317F
      5E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00754C4C00CFB8B800E7D6
      D600DFCECE00E1D0D000E3D2D200E5D4D400E6D5D500E8D7D700E9D8D800EBDA
      DA00D0B9B900754C4C00FFFFFF00FFFFFF00F8C29B00FEF4EE00FFFFFF00FFFE
      FD00FFFEFC00FFFDFB00FFFDFA00FFFCF800FFFCF700FFFBF600FFFBF400FFFA
      F300FFFAF200FFF7EC00FDECD800E49B6700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000513D100616AFA00EEF2FD00ABAEF2001F25D700181FCB00191EBD000508
      C8000000AF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF003D8C690091CAB60075BFA60075BFA60075BFA60075BFA60092CCB8003D8C
      6900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00784F4F0094717100F1DF
      DF00E3D2D200E3D2D200E5D4D400E6D5D500E8D7D700E9D8D800EBDADA00EDDB
      DB0097737300784F4F00FFFFFF00FFFFFF00FCD8BF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFE00FFFFFE00FFFEFD00FFFEFC00FFFEFC00FFFEFC00FFFE
      FB00FFFDFB00FFFDFA00FFFDFA00EEBE9D00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF001E31C000312FCA005961CF00444FD700060FCA000B1DCD000D1DC700050E
      B900090FA700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00499974008EC3AD00A8D9CB0091CFBD0090CFBC00A5D8C90095C7B3004999
      7400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007B525200B091
      9100F0DEDE00E8D7D700E6D5D500E8D7D700E9D8D800EBDADA00EEDCDC00B293
      93007B525200FFFFFF00FFFFFF00FFFFFF00FBC6A000FBD8BE00FBD6BC00FAD5
      BA00F9D3B800F8D1B600F7D0B400F6CEB200F5CDB000F4CBAE00F3C9AC00F3C8
      AA00F2C6A800F1C5A600F0C3A400E7A27300FFFFFF00FFFFFF00FFFFFF00FFFF
      FF001C2377000606740000008F000005980000149700051398000A0F9600160F
      7A00B5B4DC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0052A37D0055A57F0097CBB600C3E4DA00C4E5DB009CCEBA0057A6810052A3
      7D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007D5353007E54
      54009A767600D6BEBE00EDDBDB00F3E2E200EDDADA00D6BEBE009B7777007E54
      54007D535300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0059AA830059AA830059AA830059AA830059AA830059AA8300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF007F55550080565600805656008056560080565600805656007F555500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFCFB00FDF4EF00FDF4F000FEFDFC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0027299800555DC4002226
      A100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000004F2D0B00955413009C58
      14009C5814009C5814009C5814009C5814009C5814009C5814009C5814009C58
      14009C581400955413004F2D0B00000000000000000000000000000000000000
      00000000000000000000FDF1EA00FCD1B900FAD1BA00FCF1EB00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000005067D005258B8007280E0002D35
      B100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A35F1B00E0C5AB00F0E0
      D000EFDECE00D9C5B000D9C5B000D9C5B000EFDECE00EFDECE00EFDECE00D9C5
      B000DBC7B400D2B59800A35F1B00FFFFFF000000000000000000FEFBF900FDE9
      DC00FDF1E900FEF9F500FDE1D000FDCCAE00FCC9AB00FBE0D100FEF8F600FDED
      E500FCE8DD00FEFBFA0000000000000000000000000089898900B9B9B900B7B7
      B700CBCBCB00EFEFEF00F0F0F000F0F0F000BCBEC8009FA9D60094A0D400939F
      D3009BA5D300B6B9C30000000000000000003033A700757FE4005A70F800263C
      D900040A9200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000407A4000408AF00FFFFFF00FFFFFF00FFFFFF00A9652100EFE0CF00E9D4
      BD00E9D4BD00CCB19500CCB19600CCB19600E9D4BD00E9D4BD00E9D4BD00CCB1
      9600CCB19500DAC6B200A9652100FFFFFF000000000000000000FCE7D800FDD0
      B300FCD2B500FDD9C100FDD0B300F8CAAB00F8C9AB00FCCEB100FDD6BF00FDCC
      B000FCC9AE00FBE7DB000000000000000000000000008F8F8F00CBCBCB00CBCB
      CB00D5D5D500FAFAFA00FAFAFA00FAFAFA00A0ABD8008497EC007E93EC007D92
      EC007B8FEB0098A2D0000000000000000000272BAB004B53DB002536E8000D22
      DA00060A9000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000303
      82000710BF00050AB200FFFFFF00FFFFFF00FFFFFF00AC682400EFDECD00E9D3
      BD00E9D3BD00CBAF9400CBAF9300CBAF9300E9D3BD00E9D3BC00E9D3BC00CBAF
      9400CBAF9300D8C2AD00AC682400FFFFFF000000000000000000FCEEE300FCD3
      B400FBD1B000EAC2A400D5B09200DAB49500DAB39400DEB69800F1C3A500FCCB
      AC00FAC9AD00FAE9E00000000000000000000000000087878700C0C0C000C0C0
      C000D1D1D100ECECEC00ECECEC00ECECEC0095A1D5007D92EC00F6F7FD00F4F6
      FD007E93EC008894C80000000000000000000A0B92001316C200050DD7000511
      D80004099C0004047C00FFFFFF00FFFFFF00FFFFFF00FFFFFF0003058E000814
      BE000915C70002038800FFFFFF00FFFFFF00FFFFFF00AE6A2600DBC9B600C9AD
      9100C8AC9000E9D2BC00E9D2BC00E9D2BC00C8AC9000C8AC9000C8AC9000E9D2
      BC00E9D2BC00EEDDCC00AE6A2600FFFFFF000000000000000000FDF7F200FCDB
      BF00E6C2A200C0A28800D1B19400E0BC9D00DEBA9900DEB99900DFB69800F1C4
      A500FAD3BB00FDF7F40000000000000000000000000087878700C1C1C100C1C1
      C100D1D1D100ECECEC00ECECEC00ECECEC0096A2D6007F94EC00F6F7FD00F5F6
      FD007D92EC008894C9000000000000000000020382000204A2000003CF000209
      D500040BC20004079600FFFFFF00FFFFFF00FFFFFF00FFFFFF000712AF000B1F
      DB00050A9E0001028100FFFFFF00FFFFFF00FFFFFF00B06C2800E1D1C200D0B8
      A000C8AB8E00E9D2BB00E9D2BB00E9D2BB00C8AA8D00C8AA8D00C8AA8D00E9D2
      BB00E9D2BB00EFDDCC00B06C2800FFFFFF00FEFCFB00FDF5ED00FCE8D500FBD8
      B600C7A98D00CCB0930081CED6008ECDCF0093A9A100BCA99200E0BA9B00DFB8
      9900FBCEB000FCE3D300FDF2ED00FEFDFC00000000008F8F8F00CCCCCC00CCCC
      CC00D6D6D600FAFAFA00FAFAFA00FAFAFA00A1ABD9008497EC007F94EC007D92
      EC007B8FEB0099A3D1000000000000000000FFFFFF0004067F000102B0000001
      CB000105D0000206B40003068600FFFFFF0004027900060E9B000C26DF00081A
      C200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B26E2A00E3D4C500DAC7
      B400D2BCA600E9D4BE00E9D2BC00E9D3BC00C5A88C00C5A98C00C5A88C00E9D2
      BC00E9D2BC00EFDDCD00B26E2A00FFFFFF00FDF5ED00FBDCBF00FCD9B600F2D1
      AF00C7AC8E00E6C8A5009FEAEF004ED9FA002DB5E00063A7B500E0BD9D00DFBA
      9A00F7CAAB00FDCCAE00FAD2BA00FCF3EE00000000008F8F8F00CCCCCC00CCCC
      CC00D6D6D600FAFAFA00FAFAFA00FAFAFA00D0D3DD00B4BFEC00ABB7EB00ABB7
      EB00B4BFEC00C8CBD5000000000000000000FFFFFF00FFFFFF00030498000101
      B6000000CE000102CB000305A00004068500050B9E00081BD2000B26DF000610
      A100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B36F2B00F6EBE100F3E5
      D800F3E5D800D9C6B300CDB59B00C5A98C00E9D3BD00E9D3BD00E9D2BC00C4A7
      8A00C4A78A00D2BDA700B36F2B00FFFFFF00FDF5ED00FADCBC00FCDCB700F1D4
      B000CAB19200ECD0AC00AEDECF0029D8F60003C0FD0012AEE1006BB2BE00D0BC
      A200F7CBAC00FCCDAD00F9CFB500FCF2EC0000000000142C94004964DA004964
      DA004B66DC00546FE500546FE500546FE5004D68DE00526DE300526DE300526D
      E300526DE3002F50E0000000000000000000FFFFFF00FFFFFF00FFFFFF000405
      8C000102B6000000CC000001C4000203AB00030AC6000512DA00050A9C000401
      7500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5712D00F6EDE300F3E7
      DB00F3E7DB00DECEBF00DECEBF00DBC9B700EFDFCF00EDDAC700EBD7C200C4A9
      8C00C4A98C00D5C1AC00B5712D00FFFFFF00FEFCFA00FCF3EA00FAE8D200F9DE
      BA00C9B39300EDD4AF00D3DBBE004BE4EA0022D6F60003C2FD001EAEDC0069B0
      BD00F9D0B100F9DDCA00FBEFE700FEFCFA0000000000142C94009FA8D0009FA8
      D000A6AFD700C1CBF300C1CBF300C1CBF300ADB6DE00BBC5ED00BBC5ED00BBC5
      ED00BBC5ED00526DE3000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0003049A000202AF000001CB000001C8000003CC000307B20004037D00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B7732F00F7EFE700F4EA
      E000F4EAE000E0D1C400E0D1C400E0D1C400F4EAE000F4EAE000F4EAE000E0D1
      C400E0D1C400E7DCD200B7732F00FFFFFF000000000000000000FDF9F300FCE6
      C600E0CAA800DCC7A400F4DDB700E3DBBA004EE2E8002BDBF60003C3FD0015B1
      E30073BED100EAF3F400000000000000000000000000142C94009FA8D0009FA8
      D000A6AFD700C1CBF300C1CBF300C1CBF300ADB6DE00BBC5ED00BBC5ED00BBC5
      ED00BBC5ED00526DE3000000000000000000FFFFFF00FFFFFF00FFFFFF000001
      8B000309AA00030AB5000207D0000003CE000001C6000203A70001038800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B8743000E8DFD400E2D5
      C800E2D5C800F5EBE200F5EBE200F5EBE200E2D5C800E2D5C800E2D5C800F5EB
      E200F5EBE200F7F0E900B8743000FFFFFF000000000000000000FDF4E800FCE5
      C000F8E3BB00E3D0AC00DECCA800F0D9B300CAD7BC0052E1E5002BD8F70004C4
      FC001FB1DE0075CAE500FDFEFF000000000000000000142C94004964DA004964
      DA004B66DC00546FE500546FE500546FE5004D68DE00526DE300526DE300526D
      E300526DE3002F50E0000000000000000000FFFFFF00FFFFFF00040694000A12
      AF000B1BD6000616DE00040FD9000207BE000204C2000506C9000608A3000204
      8900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B9753100EBE1D800E4D7
      CA00E4D7CA00F6EDE400F6EDE400F6EDE400E4D7CA00E4D7CA00E4D7CA00F6ED
      E400F6EDE400F9F2EB00B9753100FFFFFF000000000000000000FBEFDC00FBE4
      BE00FAE5BE00FBE9C700F6E0BA00EBD3AF00EBD0AD00EAD6B7005FE7ED0039DE
      F70005C5FB0014B3E5007FD1EC00F1FAFD00000000008F8F8F00CCCCCC00CCCC
      CC00D6D6D600FAFAFA00FAFAFA00FAFAFA00DEDEDE00F2F2F200F2F2F200F2F2
      F200F2F2F200D6D6D60000000000000000003334A5004A4FBE004956D8003F59
      F5001C3AF6000D26EB000410C30003069A000305A000080BBD002123CE002627
      BB000A0B90000A0B9000FFFFFF00FFFFFF00FFFFFF00BA763200E2CDBB00ECE2
      DA00EBE1D800F9F2EB00F9F2EB00F9F2EB00EBE1D800EBE1D800EBE1D800F9F2
      EB00F9F3EC00EEDDCD00BA763200FFFFFF000000000000000000FEFCF900FAEE
      DA00FBF3E400FDF9F200FBECD400FCE1BB00FBDCB700F9E6D100DDF6F60069EE
      F90035DDFB0030D1FD006EB6CB00D9F1F900000000008F8F8F00CCCCCC00CCCC
      CC00D6D6D600FAFAFA00FAFAFA00FAFAFA00DEDEDE00F2F2F200F2F2F200F2F2
      F200F2F2F200D6D6D60000000000000000008C90D8009AA3EE008493FD00657A
      FD003550F4001022CC0003049500FFFFFF0002049800020491001B1DB7003C3D
      CD004B4DCA002526A600FFFFFF00FFFFFF00FFFFFF00BB773300BB773300BB77
      3300BB773300BB773300BB773300BB773300BB773300BB773300BB773300BB77
      3300BB773300BB773300BB773300FFFFFF000000000000000000000000000000
      00000000000000000000FDF6EC00FAE1C100F9DFC000FCF4EC0000000000F9FE
      FF0073F2FF0078CED9009FBDC200F0FBFD00000000005F5F5F008F8F8F008F8F
      8F0092929200AAAAAA00AAAAAA00AAAAAA009A9A9A00AAAAAA00AAAAAA00AAAA
      AA00AAAAAA00929292000000000000000000898BD100AFB4EE009CA4F7006E79
      E500272CB200090D9D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000304
      8F004445C1005F60CC004546B60012139800FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000FEFDFB00FCF6EF00FCF6EF00FEFDFB00000000000000
      0000EEFDFF00D8F7FB00F1FCFD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002F309C007576C8008A8EDF003A3C
      AD000A098A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00050592002123A3004E50BF0017189E00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF005555550055555500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF004D4D4D007A7A7A006363630054545400FFFFFF00FFFF
      FF0000F0AF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007C7C7C007B7C7C0046464600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006D6A
      69007A7776005E595900FFFFFF00FFFFFF00FFFFFF00614D5300008D470000C6
      8300007C410000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF004B4B4B004D4D4D00CACACA00868686005B5B5B00FFFFFF00FFFF
      FF0000EEA90000E3830000DA5F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00007B7C7C007E7B7800928E8C007A7B7B00FFFFFF00FFFFFF00000000000000
      00000000000000000000FFFFFF00000000000000000000000000FFFFFF000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006D69
      6800A5A2A1007C747500000000000000000000000000956F7D00008A450000E4
      A50000BE8000007C410000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF004E4E4E007A7A7A008D8D8D00DCDCDC009191910063636300FFFFFF00FFFF
      FF00FFFFFF0000DF730000D55100FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00000000007B7C
      7C007E7A78008E8B8800E2E0DF0079797900FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF0000000000FFFFFF00000000000000000000000000FFFFFF000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006F6B
      690074707000AEA1A500227F5400008B460000894600008944000084410000D9
      A10000D8A00000BC8000007C410000000000FFFFFF00FFFFFF00FFFFFF005555
      550089898900BEBEBE0079797900EBEBEB009B9B9B006C6C6C00FFFFFF0000ED
      A40000E17900FFFFFF0000D1410000CA2900FFFFFF00FFFFFF00878787000000
      00007F7F7F00000000007F7F7E00000000008B8B8A00000000007B7B7B007E7A
      78008E8A8800E0DEDD0076767600FFFFFF00FFFFFF00FFFFFF00000000000000
      00000000000000000000FFFFFF00000000000000000000000000FFFFFF000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000FFFFFF00FFFF
      FF0076706F008E7D8200008C42003FE9C10000D7A00000D7A00000D59F0000D0
      9C0000D09C0000D39F0000B98100007E43004B64670048686D00516A6E009191
      9100B1B1B100ABABAB006E6E6E00E7E7E7009D9D9D0073737300FFFFFF00FFFF
      FF0000D95F0000CD340000CE370000C72000FFFFFF0000000000FFFFFF00FDFC
      FC00FDFBFB00FEFCFA00FFFFFF00FFFFFF00FFFFFF00757575007C7977008E8A
      8800E0DEDD0075757500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00266BB0002A7DD000FFFFFF00FFFF
      FF00FFFFFF0088747900008A40006DE9CF0000C8990000C8990000C8990000C7
      970000C8980000CA9A0063E6CD00008A47004585900000D2FB001ECBEC00A2A2
      A200A1A1A1009B9B9B0064646400D3D3D300949494007B7B7B0000E68B0000D0
      3E0000D44B0000C92800FFFFFF0000C51800FFFFFF008B8B8B00FFFFFF00FFFF
      FF00FEF7F200F7ECE200A5D6FF005CBAFF00736F6B007B7673008D898700DEDC
      DB0073737400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF003086DC002F84DB00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00008B410094F0E2004DE9D40050E8D4004DE6D10094E8
      D80000C397005FE0C50000B37D00008B460056899D0000ABEB0025AEE200AFAF
      AF00909090008B8B8B005A5A5A00C3C3C3008C8C8C008383830000DB650000CB
      2D00FFFFFF0000C72000FFFFFF0000C31300FFFFFF0000000000FFFFFF00FCF4
      ED002F9EFF005AEFFF001FACFF00849CAD007B716A008C878300DDD9D8006E6E
      6E0093939300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF003087DE003087DE00000000000000
      0000FFFFFF00FFFFFF002B885B0000893F0000873F000086400000823B0082E4
      D60059DAC30000AE770011868200000000006496AD005EC3EF0079C9ED00D7D7
      D700A0A0A0009B9B9B0064646400CACACA008B8B8B008383830000DB650000CB
      2D00FFFFFF0000C72000FFFFFF0000C31300FFFFFF008C8B8B00FFFFFF00F1E4
      DA005AEFFF0000A3FF008FB6D40090BCD8009FCBE500DDD5CF006D686500FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF003087DE00000000003087DE002E87
      E00000000000FFFFFF0096878800AE9CA000A0858C00FFFFFF000089410079E4
      D60000AB7900008A33003684F0003586EC00619FBD00EAFBFE00EEFBFE00F3F3
      F300D6D6D600CCCCCC0083838300E0E0E000939393007B7B7B0000E68B0000D0
      3E0000D44B0000C92800FFFFFF0000C51800FFFFFF0000000000FFFFFF0083C7
      FF0012A2FF0092B6D20092B9D4009FC4DC00E8F1F70085A0A90059B7FF00FFFF
      FF008D8C8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      00000000000000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF003087DE0012325200FFFFFF002F87
      DF001D5FA200FFFFFF00978E8900978F8D00A18E8E00FFFFFF00008D3B0000AC
      7A00008B3700000000003287E400FFFFFF001C82B700248DC3003E92BD00C6C6
      C600FDFDFD00F5F5F500A3A3A300F1F1F1009B9B9B0074747400FFFFFF00FFFF
      FF0000D95F0000CD340000CE370000C72000FFFFFF008C8C8B00FFFFFF005DB4
      FF0017AAFF0095B8D200A4C5DA00E9EFF30092BED20051D6FF00A2D3FF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      00000000000000000000FFFFFF0000000000FFFFFF0000000000000000000000
      0000FFFFFF0000000000FFFFFF00FFFFFF003087DE002364A400FFFFFF003087
      DE002B82D9000000000000000000FFFFFF000000000000000000327FE2003684
      EF00FFFFFF002560A7003187E000FFFFFF00FFFFFF00FFFFFF00FFFFFF005A5A
      5A00ABABAB00FDFDFD00D8D8D800FAFAFA00A0A0A0006C6C6C00FFFFFF0000ED
      A40000E17900FFFFFF0000D1410000CA2900FFFFFF0000000000FFFFFF00E3D4
      CA005AEFFF0027CFFF0097BDD10097BFD10027CFFF005AEFFF00DBCEC600FFFF
      FF008C8B8B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF003087DE003087DE00000000003087
      DE002F87DF002C83DB001A599600000000001B5897002D85DF003087E1003287
      E300000000003187E2003087DF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00525252008C8C8C00E2E2E200FDFDFD009E9E9E0063636300FFFFFF00FFFF
      FF00FFFFFF0000DF730000D55100FFFFFF00FFFFFF008B8B8B00FFFFFF00ECE4
      DF00309FFF005AEFFF004FD1FF0030C4FF005AEFFF002F9EFF00EBE4DF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003087DE002972BC000000
      00003087DE003087DE002F87DF002E87DF002F87DF003087DE003087DE000000
      00002972BD003087DE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF004F4F4F0053535300F7F7F700929292005B5B5B00FFFFFF00FFFF
      FF0000EEA90000E3830000DA5F00FFFFFF00FFFFFF0000000000FFFFFF00FFFE
      FC00E7DFD900CEC3B900A2D2FF0047A9FF00DACDC300E7DFD900FFFEFC00FFFF
      FF008B8B8B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003087DE003087DE002972
      BC00000000000000000000000000FFFFFF000000000000000000000000002972
      BC003087DE003087DE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00545454008B8B8B006464640054545400FFFFFF00FFFF
      FF0000F0AF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B8B00FFFFFF00FEFE
      FD00FEFDFC00FFFFFE00FFFFFF00FFFFFF00FFFEFB00FEFDFC00FEFEFD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003087DE003087
      DE003087DE002364A4000919290000000000091929002364A4003087DE003087
      DE003087DE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF005555550055555500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008C8C8C00FFFFFF007F7F
      7F00FFFFFF00858585008A89880086858400FFFFFF007F7F7F00FFFFFF008787
      8700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF003087DE003087DE003087DE003087DE003087DE003087DE003087DE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0053535300909090007D7D7D0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000006B96000076A200472E0000AE832E00B1872F00A97B
      1300A5740000A8770000AB7B0000AF7E0000B2820000B4850000B7890000BB8D
      0000BE910000C0950000C49800008A6C0000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00121212004E4E4E0083838300B9B9B900C0C0C0008C8C8C00505050001010
      1000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007B502E007E522E007242
      1F00673210009A9795008888880087878700808080002D1707006B3512006631
      1000140902000076A00008BEE80004B8E5004B300000D1A44E00D5A95000CF9B
      2E00C98A0000CC8F0000D0930000D4980000D89C0000DBA10000DFA50000E3AA
      0000E7AE0000EBB30000EEB700009E7B0000FFFFFF00FFFFFF00FFFFFF008D8D
      8D00CBCBCB00DDDDDD00DCDCDC00D8D8D800D9D9D900DEDEDE00DDDDDD00CACA
      CA008E8E8E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003919080037271A00221810001E13
      0C001F140C0020150D0088868400787878006D6D6D006965620020140C002014
      0C00056A910014C5EC0011BBDE000080B700452B00009F752900A27A2A00A075
      1E0096650000986900009B6C00009F700000A2730000A4770000A77A0000AA7E
      0000AD820000B0850000B288000082640000FFFFFF00FFFFFF00FFFFFF007979
      7900BEBEBE00C0C0C000C8C8C800B9B9B900B1B1B100B8B8B800BDBDBD00C0C0
      C00092929200FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000200F050019689A002D4C5F00000A
      1000000A1100000A1200000B12003A454D006F707100616161001F232600003E
      590000BFE3001ABADE00006184000D060200FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00664600009266000095690000976C00009A7000009D73
      0000A0760000A3790000A57D000083640000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000092929200A6A6A600A2A2A2008484840000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000CACACA00C6C6
      C600D1D1D100ADADAD0001010100D9D9D900DADADA00DCDCDC00DDDDDD00DFDF
      DF00E0E0E000E2E2E200ADADAD0000000000FFFFFF0000558E00005B97000350
      8500054E81000551850005558B000A5C9400356F98006C6E700053595C0051BF
      D9000C9FD00002749500034B7300FFFFFF00FFFFFF00868A8800A5ACAA005151
      5100FFFFFF00FFFFFF0076500000C8890000CC8E0000D0920000D3970000D79B
      0000DBA00000DFA50000E2A90000A27A0000A1A1A100CDCDCD00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00D1D1D100A5A5A500FFFFFF0000000000FFFFFF00E2E2
      E200E3E3E300CFCFCF0045454500AAAAAA00EEEEEE00F0F0F000F1F1F100F3F3
      F300F5F5F500F6F6F600E2E2E20000000000FFFFFF000062A3000066AA000068
      AC000362A300075D9900065B9600075B96000759940038668700B5B5B4006D75
      780030697F0004456C00043C6500FFFFFF00FFFFFF00989F9D00E4EBE800CAD2
      CF008B908D00FFFFFF0067450000A26D0000A5710000A8750000AB780000AE7D
      0000B1800000B5840000B787000089660000C4C4C4006A6A6A00474747005151
      51005A5A5A00626262006A6A6A0071717100737373006D6D6D00666666005E5E
      5E00565656004C4C4C006C6C6C00CCCCCC00FFFFFF0000000000FFFFFF00E0E0
      E000DCDCDC00FFFFFF006767670075757500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F5F5F500E1E1E10000000000FFFFFF000066AA00006BB200006C
      B400006DB600016CB4000767AA001368A4001E689C00A8B6C0005A829D009096
      9900888A8B00556874002D546F00100E0C00FFFFFF00979A9900DFE5E200DCE5
      E100E1EAE600B4BBB800767B7600FFFFFF00000000005E400000664700006849
      00006A4B00006C4E00006E50000060470000CFCFCF003C3C3C002C96DF002591
      DC00218FDC002291DE002592DF002994DF002D96E0003198E000359AE1003B9D
      E2003F9FE20044A2E30040404000D6D6D600FFFFFF0000000000FFFFFF00DFDF
      DF00C9C9C900E2E2E200BDBDBD000B0B0B00EBEBEB00ECECEC00EEEEEE00F0F0
      F000FFFFFF00F3F3F300DFDFDF0000000000FFFFFF00006BB1000070BA000071
      BC000073BE000074C1000075C300206C9F00ADBBC600457AA000316D9700356B
      9000ADAEAD00A0A1A000AAACAB0098999800FFFFFF0096989600DEE3E100D4DB
      D800D7DFDB00DEE6E300D6DFDB00A3AAA8002C333300AB730000C7890000CB8D
      0000CF920000D3960000D79B00008F680000CFCFCF004040400045A3E30043A1
      E3003A9DE2002E97E0002F98E0003299E000359BE100399DE1003E9FE20041A0
      E30045A3E3004AA5E40044444400D6D6D600FFFFFF0000000000FFFFFF00DDDD
      DD00CBCBCB00E1E1E100CDCDCD0047474700A8A8A800EBEBEB00EDEDED00EEEE
      EE00FFFFFF00F2F2F200DEDEDE0000000000FFFFFF000072BC000185C600007D
      D000007FD200007ED1002D78AA00A8BCC900478BB8002D76A90006568F000748
      7600BCBFC100CDD2D5001C547B008E8E8E00FFFFFF0092959400E0E3E200DEE1
      E000CED6D200D1D9D600C9D2CE009CA3A0002C332C00A76F0000C3840000C788
      0000CB8D0000CF910000D39600008C650000CFCFCF00454545005CAEE7005AAD
      E60058ACE60053A9E50042A1E3003F9FE20041A1E30044A2E30047A3E3004AA5
      E4004DA6E40051A8E50049494900D6D6D600FFFFFF0000000000FFFFFF00DCDC
      DC00C9C9C900DFDFDF00E1E1E1004F4F4F0067676700E9E9E900EBEBEB00EDED
      ED00FFFFFF00F0F0F000DDDDDD0000000000FFFFFF000383D10080AECB00007C
      CF00007CCE002B87C500D2D7DA00157FC5002486C700007ACA00026EB600055B
      950091A5B300DCDDDE00456276001B120E00FFFFFF0092959400E3E5E400E2E5
      E400DBDFDC00999F9D0064696400FFFFFF000000000058390000604000006242
      00006444000066470000684900005B410000D0D0D0005656560072B9EA006FB7
      E9006EB7E9006CB6E9006AB5E90058ACE6004DA6E4004FA8E50052A9E50054AA
      E60057ABE6005AADE60053535300D7D7D700FFFFFF0000000000FFFFFF00DADA
      DA00C8C8C800DDDDDD00DFDFDF00BEBEBE003D3D3D00A8A8A800EAEAEA00EBEB
      EB00FFFFFF00EFEFEF00DBDBDB0000000000FFFFFF000E87D700379BDC00008D
      EA00008DEB00018DE9001693E500008AE6000087E1000084DB00007FD4000175
      C3000C5E9800628094007A93A40036211600FFFFFF0092959400E3E5E400C9CC
      CB0083858500FFFFFF00FFFFFF006C4A1400B0874200B1873E00A6781F009F6A
      0200A16C0000A4700000A87400007D580000D1D1D1004E4E4E0085C2ED0083C1
      EC0081C0EC0080C0EC007EBFEC007DBEEC0070B8EA005CAEE7005DAEE7005FAF
      E70061B0E80064B2E80052525200D7D7D700FFFFFF0000000000FFFFFF00D8D8
      D800C7C7C700DCDCDC00DEDEDE00CDCDCD002F2F2F0082828200E8E8E800EAEA
      EA00FFFFFF00EDEDED00DADADA0000000000FFFFFF00258FD50080AECB00008C
      E900008CE900008CE900008BE700008AE5000087E1000085DD000081D700007E
      D200017ACB0004568E0005467400FFFFFF00FFFFFF007B7C7C00A0A4A2003636
      3600FFFFFF00FFFFFF00FFFFFF007D582000D0A76700D1A76100D1A65B00D0A2
      4D00C9922600C4860600C78800008E620000D2D2D2005050500097CBEF0095CA
      EF0094C9EF0092C9EF0091C8EE0090C7EE008FC7EE0088C4ED006FB7E9006BB5
      E9006DB6E9006FB7E90053535300D7D7D700FFFFFF0000000000FFFFFF00D7D7
      D700C2C2C200C3C3C300C8C8C800CDCDCD00AAAAAA0025252500D2D2D200D5D5
      D500F0F0F000ECECEC00D8D8D80000000000FFFFFF000D8FE3000090EF000091
      F1000092F2000192F2000392F1000491EF000390EC00038CE7000189E3000084
      DC00007ED2000079C9000B629C00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF005E3C0B009067280091672600936A2500946B
      2200956C2000956B1A008C5E00006F4C0000D2D2D20053535300A8D4F200A6D3
      F100A5D2F100A3D1F100A2D1F100A1D0F100A0CFF0009FCFF0009DCEF00086C3
      ED0079BCEB007BBDEB0056565600D7D7D700FFFFFF0000000000FFFFFF00D5D5
      D500D7D7D700D9D9D900DBDBDB00E0E0E000CCCCCC0038383800A5A5A500E7E7
      E700E8E8E800EAEAEA00D7D7D70000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003417000092674100976E4600976E
      4300986F410099703F0099713C009A713A009B7237009C7234009E7432009E75
      3000A0762D00A2772A00A379280073520D00D2D2D20055555500B8DBF400B6DB
      F400B5DAF400B4D9F300B2D8F300B1D8F300B0D7F300AED6F200ADD6F200ABD5
      F2009BCDF00082C0EC0059595900D7D7D700FFFFFF0000000000C1C1C100F4F4
      F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00565656008D8D8D00FFFF
      FF00FFFFFF00FFFFFF00B8B8B80000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0036170000CCAB9000D1B49900D1B2
      9400D0AF8E00D0AE8800CFAC8300CEAA7D00CFA97700CFA97200CFA76C00CFA7
      6700D0A66000D1A65B00D2A656008D671E00C7C7C70078787800656565006E6E
      6E00757575007B7B7B00808080008383830083838300818181007D7D7D007878
      780071717100696969007A7A7A00CCCCCC00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0031140000A0785B00A57F6000A57F
      5D00A67F5A00A67F5700A77F5400A67F5000A77F4D00A87F4900A9804600A980
      4300A9804000AB823C00AC82390074521300B5B5B500C8C8C800D4D4D400D4D4
      D400D6D6D600D7D7D700D8D8D800D8D8D800D8D8D800D7D7D700D7D7D700D6D6
      D600D5D5D500D3D3D300CBCBCB00B5B5B500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF00000000000000FF00000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      00000000000000000000080100001E0500000E02000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000F33404000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      000000000000000000001E060000FF4C03002107000000000000000000000000
      000000000000000000000000000000000000C5A98E00C6AB8F00C7AC9100C9AE
      93008C7966001E1A1600000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      000000000000ED4C0200000000000000000000000000F64B0100000000000000
      000000000000000000000000000000000000C2A68B00C4A88C00C5A98E005B4F
      42000D0B090000000000000000000000000015414F000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000EF7C400000000000FF820000FF940F00FF87010000000000FD5702000000
      000000000000000000000000000000000000C0A38800C1A58A00C3A68B001512
      0F0000000000FFFFFF00FFFFFF00FFFFFF000000000074AED700305965000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      00000000FF000000000000000000000000000000000000000000000000000000
      00005D2F1400D76D0000FFB23B00FEB53B00FFB33D00F9820000421600000000
      000000000000000000000000000000000000BDA18500BFA28700C0A488000D0B
      090000000000FFFFFF00FFFFFF00FFFFFF000000000036D2F6004DB4EF002B4F
      5C0000000000FFFFFF00FFFFFF00FFFFFF003984FF003984FF00639CFF00639C
      FF00528CFF00639CFF00639CFF00639CFF00528CFF0000000000000000000000
      0000000000000000000000000000000000003984FF003984FF00639CFF00639C
      FF00528CFF00639CFF00639CFF00639CFF00528CFF0000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      00004A250C00FAB55300FFBD4500FFBF4B00FFC04F00FF9E0000371300000000
      000000000000000000000000000000000000BB9E8200BC9F8400BEA185002F28
      210000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000039DFF90044B2
      F4002D505B000000000000000000FFFFFF003984FF0094BDFF00B5CEFF00BDD6
      FF00A5C6FF00185A7B0018526B0010425A0010395A0000000000000000000000
      0000000000000000000000000000000000003984FF0094BDFF00B5CEFF00BDD6
      FF00A5C6FF00185A7B0018526B0010425A0010395A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004B260B00F5AE4200FFDFA000FFCC6000FFCD6100FFA10000371500000000
      000000000000000000000000000000000000B89B7F00BA9D8100BB9E83007765
      53003C332A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000003BE9
      FC0045B5F700345F6C00000000000000000084ADFF00BDD6FF00D6E7FF00D6E7
      FF00D6E7FF00A5C6FF00A5C6FF00A5C6FF008CB5FF008CB5FF00000000000000
      00000000000000000000000000000000000084ADFF00BDD6FF00D6E7FF00D6E7
      FF00D6E7FF00A5C6FF00A5C6FF00A5C6FF008CB5FF008CB5FF00000000000000
      000000000000000000000000000000000000000000000000000000000000BB4B
      160044210700F5A63D00FFEAAB00FFEAAE00FFEAA600FF9C030038130000DF4D
      020000000000000000000000000000000000B6987C00B79A7E00B99B8000A087
      6F00251F1A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00003DEBFC0044B5F7002E546100000000008CB5FF00BDD6FF00D6E7FF00D6E7
      FF00D6E7FF00185A8400185A8400185A8400184A6B00104A6300000000000000
      0000000000000000000000000000000000008CB5FF00BDD6FF00D6E7FF00D6E7
      FF00D6E7FF00185A8400185A8400185A8400184A6B00104A6300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F6963900FFF4BE00FFF3BC00FFF3BF00FFB15400000000000000
      000000000000000000000000000000000000B4957A00B5977B00B6987D00B89A
      7E0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000003BE7FB004DB6F20000000000CEDEFF008CB5FF00D6E7FF00D6E7
      FF00A5C6FF00A5C6FF00A5C6FF00D6E7FF00D6E7FF0000000000000000000000
      000000000000000000000000000000000000CEDEFF008CB5FF00D6E7FF00D6E7
      FF00A5C6FF00A5C6FF00A5C6FF00D6E7FF00D6E7FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F0813300FEFBCE00FEF8CC00FEFACF00FF9B4C00000000000000
      000000000000000000000000000000000000B1937700B2947800B4967A008C75
      5F0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000000000008CB5FF00E7E7
      E700D6E7FF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008CB5FF00E7E7
      E700D6E7FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EC6A2F00FEFFDA00FFFDDA00FEFFDC00FF844800000000000000
      000000000000000000000000000000000000AF907400B09175009B8168000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000528C
      FF00F7F7F7000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000528C
      FF00F7F7F7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DD492500FFFFE300FFFFE300FFFFE400F3613B00000000000000
      000000000000000000000000000000000000987D650000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000186BFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000186BFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000009000000FF754900FFC89600FF85580009010000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000160100000100000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
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
      0000000000000000000000000000000000000000FF00000000000000FF000000
      00000000FF00000000000000FF00000000000000000000000000000000000000
      00000000000000000000FFFFFF006BA5AD00C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000CEFF00639CFF00639C
      FF00639CFF00639CFF00639CFF00639CFF00639CFF00639CFF00639CFF00639C
      FF00639CFF00639CFF00639CFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EFEFEF0018BDEF00088CBD00087B9C009C9C9C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000009CFF00000000000000
      000000000000000000000000000000000000000000009CCEFF0000CEFF000000
      0000000000000000000000000000000000000000000000CEFF0000CEFF0000CE
      FF0000CEFF0000CEFF00639CFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      0000D6D6D600109CC60010BDF70010B5EF0010BDF700004252006B7B8400FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000009CFF00009CFF00009CFF00000000003163
      9C00000000009C9C9C009C9C9C0000000000000000009CCEFF0000000000CE31
      0000EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF000000000000CEFF000000
      00000000000000000000639CFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000ADAD
      B500005A730018CEFF0010BDF70010BDF70010BDF70018D6FF0000293100397B
      9400F7F7F7000000000000000000000000000000000000000000000000000000
      000000000000009CFF00009CFF00009CFF00009CFF00009CFF00000000000000
      0000000000009C9C9C000000000000000000000000009CCEFF0000000000FF63
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEFEF000000000000CEFF000000
      0000009C310000000000639CFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF00000000000000FF000000
      00000000FF00000000000000FF000000000000000000000000008CA5AD000031
      390018CEFF0008637B0018C6EF0018CEFF0018D6FF000000000018CEFF000852
      6300219CBD00EFEFEF00000000000000000000000000000000000000000000CE
      FF00009CFF00009CFF00009CFF00009CFF00009CFF00009CFF0000000000CECE
      CE0000000000000000000000000000000000000000009CCEFF0000000000FF63
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEFEF000000000000CEFF000000
      0000009C310000000000639CFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0063B5C60008424A0021D6
      FF0021D6FF0021DEFF000000000021DEFF00084A5200108C9C0021D6FF0021D6
      FF0018A5BD0021BDD600DEDEDE000000000000000000000000000000000000CE
      FF00009CFF00009CFF00009CFF00009CFF00009CFF00009CFF0000000000CECE
      CE0000000000000000000000000000000000000000009CCEFF0000000000FF63
      0000FFFFFF00000000000000000000000000EFEFEF000000000000CEFF000000
      0000009C310000000000639CFF00000000003984FF003984FF00639CFF00639C
      FF00528CFF00639CFF00639CFF00639CFF00528CFF0000000000000000000000
      0000000000000000000000000000000000004AC6E70039949C004AE7FF0031DE
      FF0031DEFF0031DEFF0029A5BD00000000000008080031E7FF0031DEFF0031DE
      FF0031DEFF0031DEFF0031C6D600F7F7F70000000000000000000000000000CE
      FF00009CFF00009CFF00009CFF00009CFF00009CFF00009CFF0000000000CECE
      CE00FFFFFF00000000000000000000000000000000009CCEFF0000000000FF63
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEFEF000000000000CEFF000000
      00000000000000000000639CFF00000000003984FF0094BDFF00B5CEFF00BDD6
      FF00A5C6FF00185A7B0018526B0010425A0010395A0000000000000000000000
      000000000000000000000000000000000000C6D6DE004A737B007BEFFF0084EF
      FF004AE7FF001842420039ADBD0021525A001018180021525A004AE7FF004AE7
      FF004AE7FF0042C6D60073CEDE000000000000000000000000000000000000CE
      FF00009CFF00009CFF00009CFF00009CFF000000000000000000DEDEDE00DEDE
      DE00FFFFFF00000000000000000000000000000000009CCEFF0000000000FF63
      0000FFFFFF00000000000000000000000000EFEFEF000000000000CEFF000000
      00009CCEFF0000000000639CFF000000000084ADFF00BDD6FF00D6E7FF00D6E7
      FF00D6E7FF00A5C6FF00A5C6FF00A5C6FF008CB5FF008CB5FF00000000000000
      00000000000000000000000000000000000000000000FFFFFF006B848400ADF7
      FF00ADF7FF00ADF7FF00526B730029393900182929002131390063F7FF0073EF
      FF005A8C9400C6D6D600000000000000000000000000000000000000000000CE
      FF00009CFF00009CFF000000000000000000DEDEDE00DEDEDE00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000009CCEFF0000000000FF63
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEFEF000000000000CEFF0000CE
      FF000000000000CEFF00639CFF00000000008CB5FF00BDD6FF00D6E7FF00D6E7
      FF00D6E7FF00185A8400185A8400185A8400184A6B00104A6300000000000000
      000000000000000000000000000000000000000000000000000000000000A5CE
      CE00D6FFFF00CEF7FF00ADCED60073848C00B5DEDE00CEFFFF00CEFFFF008C9C
      9C00FFFFFF0000000000000000000000000000000000000000000000000000CE
      FF000000000000000000DEDEDE00DEDEDE00FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000000000009CCEFF0000CEFF000000
      0000000000000000000000000000000000000000000000CEFF0000CEFF0000CE
      FF0000CEFF0000CEFF00639CFF0000000000CEDEFF008CB5FF00D6E7FF00D6E7
      FF00A5C6FF00A5C6FF00A5C6FF00D6E7FF00D6E7FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000ADCED600DEEFEF00EFFFFF00CEDEDE00EFFFFF00EFFFFF00BDD6D6000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003163CE003163CE0000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000000000009CCEFF009CCEFF009CCE
      FF009CCEFF009CCEFF009CCEFF009CCEFF009CCEFF009CCEFF009CCEFF009CCE
      FF009CCEFF009CCEFF0000CEFF000000000000000000000000008CB5FF00E7E7
      E700D6E7FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6CED600C6D6D600FFFFFF00EFF7F700ADC6CE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000528C
      FF00F7F7F7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00CED6D600BDC6CE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000186BFF000000000000000000000000000000000000000000000000000000
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
      000000CE080008A5290008A5290008A5290008A5290008A5290008A5290008A5
      290008A52900089C290000A5210000D600000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000008AD290052A5BD007BB5D6006BB5D6006BB5D60063B5D60063B5D60063B5
      D60073B5D6006BADCE00318C940000B518000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000BD10005AAD9C00B5E7F7009CE7FF0084E7F7007BCEEF007BCEEF008CE7
      F700ADEFFF0094C6DE00299C630000CE080000F7000000C6000000A5000000BD
      000000BD000000A5000000CE000000F70000000000000000000000F7000000C6
      000000A5000000CE000000F70000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000F7000000C6000000A5000000BD
      000000BD000000A5000000CE000000F70000000000000000000000F7000000C6
      000000A5000000CE000000F700000000000000F7000000C6000000A5000000BD
      000000A50800318C630084C6DE0084E7F70063DEF70052C6EF0052C6EF006BDE
      F70094DEF70052A5A50000AD210000F7000000BD000021632100395A3900215A
      2100215A2100395A39001873180000C60000000000000000000000BD00002163
      2100395239001873180000C60000000000000000000000000000000000003984
      FF003984FF00639CFF00639CFF00528CFF00639CFF00639CFF00639CFF00528C
      FF000000000000000000000000000000000000BD000021632100395A3900215A
      2100215A2100395A39001873180000C60000000000000000000000BD00002163
      2100395239001873180000C600000000000000BD000021632100395A3900215A
      2100215A2100426B63006BA5BD0094DEF70073E7F70052C6EF005ACEEF0084E7
      F70084C6E7003984730000B5080000000000186B2900394A4A004A5A6300394A
      4A00394A4A004A525A00294A4200106B2100088C1000088C0800216310004A42
      31005A4A420042422900089C0000000000000000000000000000000000003984
      FF0094BDFF00B5CEFF00BDD6FF00A5C6FF00185A7B0018526B0010425A001039
      5A000000000000000000000000000000000010632100314A4A004A525A003942
      4A0039424A0042525A00294A4200106B1800088C1000088C0800216310004A42
      31005A4A420042422900089C00000000000010632100314A4A004A525A003942
      4A0039424A00425263004A7B940084C6DE008CE7F70052B5DE0063BDDE008CD6
      EF00639CB500395A5200089C08000000000063849C00738CA500738CA5006B8C
      9C0063849C005A7B9400527B9400527394004A739400636363008C6B52009C84
      73009C8473008C634A00189408000000000000000000000000000000000084AD
      FF00BDD6FF00D6E7FF00D6E7FF00D6E7FF00A5C6FF00A5C6FF00A5C6FF008CB5
      FF008CB5FF000000000000000000000000004A73940063849C005A7B94005A7B
      9400527B9400527B9400527394004A7394004A73940063635A008C6B52009C84
      73009C8473008C634A0018940800000000004A73940063849C005A7B94005A7B
      9400527B9400527B9400528CAD006BADCE008CD6EF007BD6EF008CCEEF008CC6
      E7007B9CAD00846B5A0018940800000000006BA5BD008CB5DE0084B5DE007BAD
      D60073A5CE006B9CCE005A94C6005294BD00528CBD007B7B7300CEA57B00EFCE
      BD00EFCEB500C694730021940800000000000000000000000000000000008CB5
      FF00BDD6FF00D6E7FF00D6E7FF00D6E7FF00185A8400185A8400185A8400184A
      6B00104A630000000000000000000000000073A5CE008CBDDE0084B5DE007BB5
      D6007BADD60073ADD6006BA5D6006BA5D60073A5D600948C8400CEA57B00EFCE
      BD00EFCEB500C6947300219408000000000073A5CE008CBDDE0084B5DE007BB5
      D6007BADD60073ADD6006BA5D6005AADD60084C6E700B5EFF7009CDEEF0094BD
      CE00C6C6BD00C6947300219408000000000010AD210018A5310018A5310010A5
      310010A52900109C2900089C2900089C2900089C29004A7B3100D6A58400EFCE
      B500EFD6BD00CEA57B002994080000000000000000000000000000000000CEDE
      FF008CB5FF00D6E7FF00D6E7FF00A5C6FF00A5C6FF00A5C6FF00D6E7FF00D6E7
      FF00000000000000000000000000000000007BADD6008CBDDE007BB5D60073AD
      D60073ADD6006BA5D60063A5CE005A9CCE006BA5D6009C948400D6A58400EFD6
      BD00EFDEC600CEA5840029940800000000007BADD6008CBDDE007BB5D60073AD
      D60073ADD6006BA5D60063A5CE005AA5CE006BB5DE00A5DEEF00A5D6E700ADC6
      C600E7DECE00CEA5840029940800000000000000000000000000000000000000
      00000000000000000000000000000000000000000000299C0800D6A58400F7D6
      C600FFE7CE00D6AD8C00299C0800000000000000000000000000000000000000
      0000000000008CB5FF00E7E7E700D6E7FF000000000000000000000000000000
      0000000000000000000000000000000000008CA5BD00B5B5A500A5A59400A5A5
      94009C9C94009C948C0094948C00948C84009C949400AD8C6B00D6A58400F7DE
      CE00FFEFE700D6AD9400299C0800000000008CA5BD00B5B5A500A5A59400A5A5
      94009C9C94009C948C0094948C00948C8C008C9C9C008CBDC600A5CECE00DEDE
      D600FFEFE700D6AD9400299C0800000000000000000000000000000000000000
      00000000000000000000000000000000000000000000299C1000D6AD8400F7DE
      C600F7DEC600CE9C7B00299C0800000000000000000000000000000000000000
      00000000000000000000528CFF00F7F7F7000000000000000000000000000000
      000000000000000000000000000000000000A5B5C600EFD6B500E7CEAD00E7CE
      A500E7C6A500E7C6A500E7BDA500E7BDA500E7C6AD00D6A57B00D6AD8400F7DE
      CE00F7E7CE00CEA57B00299C080000000000A5B5C600EFD6B500E7CEAD00E7CE
      A500E7C6A500E7C6A500E7BDA500E7BDA500DEC6B500B5B5A500C6B5A500F7DE
      CE00F7E7CE00CEA57B00299C0800000000000000000000000000000000000000
      00000000000000000000000000000000000000000000319C1000CE946300D6AD
      8400D6A57B00848C390010B50000000000000000000000000000000000000000
      0000000000000000000000000000186BFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000009CC6E700D6E7F700CEE7F700CEE7
      EF00C6DEEF00C6DEEF00C6DEEF00BDDEEF00C6DEEF00C6B59C00CE946300D6AD
      8400D6A57B00848C390010B50000000000009CC6E700D6E7F700CEE7F700CEE7
      EF00C6DEEF00C6DEEF00C6DEEF00BDDEEF00C6DEEF00C6B59C00CE946300D6AD
      8400D6A57B00848C390010B50000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000008C60000319C1000299C
      1000299C080010B5000000E70000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094BDDE00ADD6EF00A5CEE700A5CE
      E7009CC6E7009CC6E70094C6DE008CBDDE0094BDDE008C9CAD0052843900299C
      1000299C080010B5000000E700000000000094BDDE00ADD6EF00A5CEE700A5CE
      E7009CC6E7009CC6E70094C6DE008CBDDE0094BDDE008C9CAD0052843900299C
      1000299C080010B5000000E70000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007BADCE0094BDDE008CB5DE008CB5
      DE0084B5DE0084ADD6007BADD60073A5D60073A5CE004A8CA50008A521000000
      0000000000000000000000000000000000007BADCE0094BDDE008CB5DE008CB5
      DE0084B5DE0084ADD6007BADD60073A5D60073A5CE004A8CA50008A521000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000018AD290018A5310018A5310018A5
      310018A5310010A5310010A5310010A52900109C290008AD210000D600000000
      00000000000000000000000000000000000018AD290018A5310018A5310018A5
      310018A5310010A5310010A5310010A52900109C290008AD210000D600000000
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
      000000000000CE290000CE290000CE290000CE290000CE290000CE2900000000
      0000000000000000000000000000000000000000000000000000000000008C29
      0000FFC6A500FFC6A500FF7B3900FF7B3900F7520000F7520000D6420000B539
      00008C2900000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000080808000808
      0800313131000808080008080800000000000000000008080800080808000808
      0800080808000808080000000000000000000000000000000000000000000000
      0000FF6B0000FF6B0000B54A0000C6420000C6420000C6420000F7630000D639
      0000000000000000000000000000000000000000000000000000000000008C29
      0000FFFFF7000000000000000000000000000000000000000000000000000000
      00008C2900000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D6D6FF0084FF
      A5000000000000C63900D6D6FF000000000000000000D6D6FF00FFAD2900FF9C
      0000DE8C0000D6D6FF000000000000000000000000000000000000000000FF9C
      1000FF8C0000FF8C0000BD630000FFFFFF00FFFFFF00E7520000FF8C0000FF6B
      0000D6390000000000008C001000000000000000000000000000000000008C29
      0000FFFFF700E78C5A000000000000000000000000000000000000000000C652
      2100A542100000000000000000000000000000000000000000005A5A5A005A5A
      5A008C8C8C0000000000000000000000000000000000424242006B6B6B004A4A
      4A004A4A4A0031313100212121000000000000000000000000000000000084FF
      A5000063180000C6390000000000000000000000000000000000FFAD2900FF9C
      0000DE8C00000000000000000000000000000000000000000000FF9C1000FF8C
      0000FF8C0000FF8C0000BD630000FFFFFF00FFFFFF00E7520000FF8C0000FF8C
      0000FF6B0000D639000000000000000000000000000000000000000000008C29
      0000FFFFF700FFFFA500E78C5A00000000000000000000000000E7845200C652
      2100AD522100000000000000000000000000000000006B6B6B0084848400A5A5
      A50000000000FFBD4A00FFAD1800BD7300000000000000000000424242006B6B
      6B004A4A4A004A4A4A00313131000000000000000000000000000000000084FF
      A50052FF7B0000C6390000000000000000000000000000000000FFAD2900FF9C
      0000DE8C000000000000000000000000000000000000FFE79C00FF9C1000FF8C
      0000FF8C0000FF8C0000BD630000FFFFFF00FFFFFF00E7520000FF8C0000FF8C
      0000FF8C0000F7630000CE290000000000000000000000000000000000008C29
      0000FFFFF700FFFFA500FFFF9400E78C5A0000000000E7845200FFAD7B00DE5A
      10009C3908000000000000000000000000000000000084848400BDBDBD000000
      0000FFD68400FFFFFF00FFBD5200FFAD1800BD73000000000000000000003131
      31009C9C9C0042424200424242000000000000000000D6D6FF000808080084FF
      A50052FF7B0000C639000808080000000000D6D6FF0008080800FFAD2900FF9C
      0000DE8C000008080800D6D6FF000000000000000000FFE79C00FF9C1000FF8C
      0000FF8C0000FF8C0000BD630000FFFFFF00FFFFFF00E7520000FF8C0000FF8C
      0000FF8C0000FF6B0000D6390000000000000000000000000000000000000000
      00008C290000FFFFF700FFFF9400FFDE7B00FFC69400FFC69400FFA57300C652
      21008C2900000000000000000000000000000000000094949400BDBDBD000000
      0000FFD68400FFFFFF00FFBD5200FFBD5200CE7B000000000000000000004242
      4200000000004A4A4A0042424200000000000000000084FFA50084FFA50084FF
      A50052FF7B0000C6390000C6390000000000FFAD2900FFAD2900FFAD2900FF9C
      0000DE8C0000DE8C0000DE8C00000000000000000000FFE79C00FF9C1000FF8C
      0000FF8C0000FF8C0000BD630000FFFFFF00FFFFFF00E7520000FF8C0000FF8C
      0000FF8C0000FF6B0000D6390000000000000000000000000000000000000000
      0000000000008C290000FFFFF700FFDEAD00FFC69400FFAD7B00E7845A008C29
      00000000000000000000000000000000000000000000ADADAD008C8C8C00C6C6
      C60000000000FFE7BD00FFFFFF00F79400000000000000000000000000004242
      42009C9C9C005A5A5A004242420000000000000000000000000084FFA50084FF
      A50052FF7B0000C6390000C639000000000000000000FFAD2900FFAD2900FF9C
      0000DE8C0000DE8C0000000000000000000000000000FFE79C00FF9C1000FF8C
      0000FF8C0000FF8C0000BD630000FFFFFF00FFFFFF00E7520000FF8C0000FF8C
      0000FF8C0000FF6B0000D6390000000000000000000000000000000000000000
      0000000000008C290000FFFFF700FFFF940000000000FFB584008C2900000000
      00000000000000000000000000000000000000000000C6C6C600949494009C9C
      9C00D6D6D6000000000000000000000000000000000000000000393939007373
      7300000000005A5A5A00424242000000000000000000000000000808080084FF
      A50084FFA50000C6390008080800000000000000000008080800FFAD2900FFAD
      2900DE8C000008080800000000000000000000000000FFE79C00FF9C1000FF8C
      0000FF8C0000FF8C0000D6730000D6730000D6730000D6730000FF8C0000FF8C
      0000FF8C0000FF6B0000D6390000000000000000000000000000000000000000
      00008C290000FFFFF700FFFF9400000000000000000000000000DE7B4A008C29
      00000000000000000000000000000000000000000000C6C6C600ADADAD00ADAD
      AD00ADADAD00ADADAD0094949400ADADAD009494940084848400848484008484
      84006B6B6B004A4A4A0042424200000000000000000000000000000000000808
      0800080808000808080000000000000000000000000000000000080808000808
      08000808080000000000000000000000000000000000FFFFFF00FFB52100FF8C
      0000FF8C0000FF8C0000D6730000D6730000D6730000D6730000FF8C0000FF8C
      0000FF8C0000FF6B0000D6390000000000000000000000000000000000008C29
      0000FFFFF700FFFF94000000000000000000000000000000000000000000944A
      29008C2900000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000080808006B6B
      6B005A5A5A004A4A4A00080808000000000000000000080808006B6B6B005A5A
      5A004A4A4A000808080000000000000000000000000000000000FFFFFF00FF9C
      1000FF8C0000FF8C0000BD630000FFFFFF00FFFFFF00E7520000FF8C0000FF8C
      0000FF8C0000FF6B000000000000000000000000000000000000000000008C29
      0000FFFFF700FFFF9400FFE7B500FFD6A500FFBD8C00F79C6B00DE7B52009C4A
      2100943908000000000000000000000000000000000000000000C6C6C600ADAD
      AD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADAD
      AD00A5A5A5007B7B7B007B7B7B0000000000000000000000000008080800B5B5
      B5008C8C8C005A5A5A0008080800000000000000000008080800B5B5B5008C8C
      8C005A5A5A00080808000000000000000000000000000000000000000000FFFF
      FF00FF9C1000FF8C0000BD630000FFFFFF00FFFFFF00E7520000FF8C0000FF8C
      0000FF6B00000000000000000000000000000000000000000000000000008C29
      0000FFFFF700FFFF9400FFE7B500FFCE9C00FFB58400EF8C5A00E78C5A008C42
      2100943908000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000008080800EFEF
      EF00B5B5B5006B6B6B0008080800000000000000000008080800EFEFEF00B5B5
      B5006B6B6B000808080000000000000000000000000000000000000000000000
      0000FFFFFF00FF9C1000BD630000BD630000BD630000BD630000FF8C0000FF6B
      0000000000000000000000000000000000000000000000000000000000008C29
      0000FFFFF700FFFF9400FFF7CE00FFE7B500FFB58400FFAD7B00E78452008C4A
      29009C3908000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000808
      0800080808000808080000000000000000000000000000000000080808000808
      0800080808000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFE79C00FFE79C00FFE79C00FFE79C00FF6B00000000
      0000000000000000000000000000000000000000000000000000000000008C29
      0000FFC6A500FFC6A500FF7B3900FF7B3900F7520000F7520000D6420000B539
      00008C2900000000000000000000000000000000000000000000000000000000
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
      00009C948C00736B63006B635A0063635A0063635A006B635A00736B63009C94
      8C00000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00F7F7F700E7E7E700DEDEDE00DEDEDE00E7E7E700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6BDAD00736B
      63006B639C006363EF006363FF006363FF006363FF006363FF006363EF006B63
      9C00736B6300C6BDAD00000000000000000000000000FFFFFF00FFFFFF00EFE7
      E700AD847B00BD8C7B00CE9C8C00CE9C9400C6948C00B5847300948C8400CECE
      CE00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000084000000840000008400000084000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000073737300C6C6C600D6D6D6007B7B7B0063636300292929000000
      00000000000000000000000000000000000000000000C6BDAD006B6B5A006363
      D6006363FF009494FF00BDBDFF00DEDEFF00DEDEFF00BDBDFF009494FF006363
      FF006363D6006B6B5A00C6BDAD0000000000FFFFFF00FFFFFF00BD9C8C00BD84
      7300CE9C9400D6A59C00D6AD9C00D6AD9C00D6A59400CE948C00BD7B6B009C5A
      4A00A5A5A500F7F7F700FFFFFF00000000000000000000000000000000000000
      0000840000008400000084000000840000008400000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000003131
      3100D6D6D600E7E7E700EFF7EF00EFEFE7008C8C840084848400737373006363
      63000000000000000000000000000000000000000000736B63006363D6006363
      FF006363F700C6C6FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDBD
      FF00948CFF006363D600736B630000000000FFFFFF00AD7B7300B5736300C684
      7300CE8C7B00E7C6B500DEBDAD00DEB5A500FFF7F700FFFFFF00F7EFEF00E7C6
      BD00A55A4A00A5A5A500FFFFFF00FFFFFF00000000000000000000000000FF00
      0000FF000000FF00000000840000FF0000008400000084000000840000008400
      000084000000000000000000000000000000000000000000000042424200C6C6
      C600E7E7E700F7F7F700F7EFE7000842E7001039C6008C8C8400848484007373
      7300636363000000000000000000000000009C948C006B639C006363FF006363
      F7006363F7006363F700CEC6FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00BDBDFF006363FF006B639C009C948C00DECEC600A55239009C5A4200CE94
      7B00FFF7EF00C68C7B00B57B6300B57B6300C67B6B00EFD6CE00FFFFFF00DEB5
      AD00AD634A008C4A3900CECECE00FFFFFF000000000000000000FFFF0000FF00
      0000FF0000000084000000840000FF000000FF00000084000000840000008400
      0000008400000084000000000000000000000000000000000000BDBDBD00D6D6
      D600EFEFEF00DEDECE000042F700007BFF00007BFF000842DE00847B73007B7B
      7B006B6B6B00525252000000000000000000736B63006363EF009C9CFF00BDB5
      FF006363F7006363F7006363F700CEC6FF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF009C9CFF006363EF00736B63009C4A310084423100C67B6300F7E7
      E700DEB5AD00AD634A00AD735A008C524200D6948400CE847300DEAD9C00B563
      4A00C67B6300A55A4200847B7B00FFFFFF0000000000FF000000FF000000FF00
      00000084000000FF0000FFFF0000FF000000FF000000FF000000840000008400
      000084000000008400000000000000000000000000005A5A5A00B5B5B500DEDE
      DE00C6BDAD000052FF000084FF000084FF000084FF000084FF00004AF700736B
      5A00737373005A5A5A0000000000000000006B635A006363FF00C6BDFF00FFFF
      FF00BDB5FF005252F7004A4AF7004A4AF700C6C6FF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6BDFF006363FF006B635A007B392900734229009C5A4200CE84
      7300CE8C73006B392900AD634A009C5A4200945A4200844A310094523900C673
      5A00BD735A00B56B5A0084423100E7E7E70000000000FF000000FFFF0000FF00
      0000FFFF0000008400000084000000840000FF000000FFFF0000FFFF0000FFFF
      000084000000008400000084000000000000000000009C9C9C00B5B5B5009C9C
      9C003184FF0031A5FF001094FF00008CFF00008CFF00008CFF00008CFF00005A
      FF00635A520063636300212121000000000063635A006363FF00E7DEFF00FFFF
      FF00FFFFFF00AD9CFF001818F7001818F7001818F700BDB5FF00FFFFFF00FFFF
      FF00FFFFFF00E7DEFF006363FF0063635A007B4229007B4231007B4231007B42
      29007B42310084423100734229009C523900AD5A4200BD6B4A00C67B6300BD73
      5200C6846B00BD846B009C4A3900D6D6D60000000000FFFF0000FFFF00000084
      0000FF000000FF000000FF000000FF000000FF000000FFFF0000FFFF0000FF00
      00008400000084000000840000000000000000000000737373008C8484004A63
      AD00526B9C008CCEFF008CD6FF0084CEFF0031ADFF000094FF00007BFF00395A
      9C00314AA500635A5A00313131000000000063635A005A5AFF00E7DEFF00FFFF
      FF00FFFFFF00FFFFFF00A594F7000000F7000000F7000000F700BDADFF00FFFF
      FF00FFFFFF00E7DEFF005A5AFF0063635A00A55A3900B5634200A5523900A552
      3900AD634200BD634A00C6735A00C67B5A00C6735A00C6846B00C6846B00CE8C
      7B00D69C8C00C68C7300A55A4200D6D6D60000000000FFFF0000FF0000000084
      000000840000FF000000FF00000000FF0000FFFF0000FF000000FF000000FFFF
      00008400000084000000840000000000000000000000525252005A5A5A006363
      630063636300B5E7FF00BDE7FF00ADE7FF009CDEFF007BCEFF00429CFF00BDBD
      B500ADADAD00949494004A4A4A00000000006B635A003939FF00BDB5FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00AD9CFF000000F7000000F7000000F700BDB5
      FF00FFFFFF00BDB5FF003939FF006B635A00AD5A4200BD6B4A00BD6B4A00BD6B
      5200BD735200C67B6300C67B6300CE8C7300CE847300D69C8400CE947B00D69C
      8C00D6A58C00BD7B6B0094423100DEDEDE0000000000FFFF0000FF0000000084
      00000084000000840000FFFF0000FFFF0000FF000000FFFF0000FF000000FFFF
      000084000000840000008400000000000000000000004A4A4A00525252006B6B
      6B007B7B7300C6E7FF00C6E7FF00BDEFFF00ADE7FF008CD6FF0063ADFF00BDBD
      B5009C9C9C008C8C8C003131310000000000736B63002121EF00736BF700FFF7
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5A5FF000000F7000000F7000000
      F700C6B5FF00736BF7002121EF00736B6300AD5A4200BD6B5200C6735A00C684
      6B00CE8C7300CE947B00CE947B00CE947B00D69C8C00D6A58C00D6A59400D69C
      8400C67B6300AD52390084312100F7F7F70000000000FF000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FF000000FF000000FFFF0000FFFF0000FF00
      00008400000084000000000000000000000000000000181818004A4A4A009494
      940094949400D6EFFF00D6EFFF00CEEFFF00C6EFFF00ADE7FF008CC6FF00C6C6
      BD00949494008484840000000000000000009C948C004A429C000000FF00C6B5
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDADFF000000F7000000
      F7000000F7000000FF004A429C009C948C00A5523900BD6B5A00C6846B00CE94
      7B00D69C8400D6A59400D6A59400D6A59400D6A59400D6A59400CE947B00BD73
      5A00B5634A009C4A3100947B7300FFFFFF0000000000FF000000FF000000FFFF
      0000FFFF0000FFFF00000084000000840000FF000000FF000000FF000000FF00
      00000084000000840000000000000000000000000000000000004A4A4A00A5A5
      A500BDBDBD00E7F7FF00E7EFFF00DEF7FF00D6EFFF00CEEFFF00BDDEFF00DEDE
      D600848484004A4A4A00000000000000000000000000736B63001818D6005A52
      FF00CEC6FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDB5FF000000
      F7000000FF001818D600736B630000000000BD847B00AD634A00CE8C7B00DEB5
      A500E7BDB500E7CEBD00E7CEBD00EFCEC600E7BDAD00D69C8400CE8C7300C684
      6B00AD5A390094392900EFEFEF00000000000000000000000000FF000000FF00
      00000084000000840000008400000084000000840000FF000000FF000000FFFF
      0000840000000000000000000000000000000000000000000000080808004242
      4200EFEFEF00DEDEDE00E7DEDE00E7DEDE00EFEFEF00EFEFEF00EFEFEF00CECE
      CE007373730000000000000000000000000000000000C6BDAD006B6B5A001818
      D6000000FF007B73FF00D6CEFF00EFE7FF00EFE7FF00D6CEFF007B73FF000000
      FF001818D6006B6B5A00C6BDAD000000000000000000944A3100B56B5A00E7C6
      BD00EFD6CE00EFCEC600EFCEC600DEB5A500DEB5A500DEB5A500DEB5A500D6AD
      9C00AD6B5200CEBDBD0000000000000000000000000000000000000000000084
      000000840000FF000000FF000000FF000000FFFF0000FF000000840000008400
      0000000000000000000000000000000000000000000000000000000000001010
      100031313100B5B5B500FFFFFF00FFFFFF00FFFFFF00EFEFEF00A5A5A5005252
      5200000000000000000000000000000000000000000000000000C6BDAD00736B
      630042429C000808EF000000FF000000FF000000FF000000FF000808EF004242
      9C00736B6300C6BDAD00000000000000000000000000000000008C392900E7CE
      C600EFD6CE00EFD6C600E7CEC600EFD6CE00EFD6CE00EFDEDE00F7E7E700C68C
      8400CEBDB5000000000000000000000000000000000000000000000000000000
      0000FF000000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000002121210029212900212121004A4A4A0039313900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009C948C00736B63006B635A0063635A0063635A006B635A00736B63009C94
      8C0000000000000000000000000000000000000000000000000000000000BD8C
      8400D6B5AD00FFFFFF00FFFFFF00FFF7F700FFFFFF00FFF7F700BD8C7B00F7F7
      F700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000737373000000000000000000D6D6D600E7E7E700E7E7E700E7E7
      E700D6D6D600D6D6D600DEDEDE00DEDEDE00DEDEDE00DEDEDE00D6D6D600CECE
      CE00E7E7E700E7E7E700D6D6D600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600FFFFFF00848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A5A5
      A50000002100313131004242420000000000F7F7F700F7F7F700D6D6D600F7F7
      F700F7F7F700F7F7F700F7F7F700FFFFFF00FFFFFF00F7F7F700F7F7F700F7F7
      F700EFEFEF00C6C6C600E7E7E700D6D6D6000808080008080800393939007B7B
      7B00636363004A4A4A0039393900313131003939390039393900525252006B6B
      6B00848484000808080008080800313131000000000000000000000000000000
      00000000000000000000C6C6C600FFFFFF00C6C6C600C6C6C600848484000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A5A5A5000000
      21003131310000002100CE000000CECECE00F7F7F7008484840073737300FFFF
      FF00EFEFEF00F7F7F700FFFFFF00F7F7F700FFFFFF00FFFFFF00F7F7F700F7F7
      F7009C9C9C006B6B6B00E7E7E700DEDEDE006B000000AD000000D6000000D600
      0000D6000000BD000000BD000000BD000000BD000000BD000000D6000000D600
      0000D6000000BD0000007B000000080808000000000000000000000000000000
      000084848400FFFFFF00C6C6C600C6C6C6008484840000000000C6C6C600FFFF
      FF00848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000424242003131
      310000002100000021006363630042424200F7F7F700FFFFFF00DEDEDE00F7F7
      F700F7F7F700F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700F7F7
      F700EFEFEF00CECECE00E7E7E700DEDEDE00AD000000AD000000FF000000FF29
      0000FFFFFF00FF000000FF000000FF000000FF000000FF000000FF522100FF52
      2100FF290000D6000000BD0000007B0000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C600C6C6C600FFFFFF00FFFF
      FF00848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000313131003131
      310000002100000021000000210000002100F7F7F70094949400848C8C008C8C
      9400848484008484840084848400848484008484840084848400848484007B84
      84007B7B84007B7B8400DEDEDE00DEDEDE00BD00000000ADFF00FF390800FF39
      0800FF390800FF390800FF000000FF000000FF000000FF000000FF390800FF39
      0800FF3908006BC6FF006B6B6B00AD0000000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C600FFFFFF008484840000000000FFFF
      FF00848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      2100CECE9C00636363003131310000002100F7F7F7009C734A00CE9C6300DEAD
      6B00E7BD7300EFC67B00F7D68400FFDE8C00FFDE8400F7CE8400EFC67B00DEB5
      7300D6A56B00CE946300A5ADAD00DEDEDE00D6000000FF522100FF522100FF52
      2100FF522100FF522100FF522100FF522100FF522100FF522100FF522100FF52
      2100FF522100FF522100EF000000BD0000000000000000000000000000008484
      8400C6C6C600C6C6C600FFFFFF0084848400000000000000000000000000FFFF
      FF00848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      210063636300CE000000CE00000052525200FFFFFF009C6B4200CE945A00D6A5
      6300DEAD6B00E7BD7300EFC67B00F7CE7B00F7CE7B00EFC67300E7B57300DEAD
      6B00D69C6300C68C5A00A5ADAD00DEDEDE00EF00000063636300DEDEDE00FF84
      5200FF734200FF000000FF000000FF000000FF000000FF000000FF390800FF73
      42004A4A4A00848484004A4A4A00D60000000000000000000000000000008484
      8400FFFFFF00848484000000000000000000000000000000000000000000FFFF
      FF00848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000021004242
      4200CE000000CE0000006363630052525200F7F7F70094633100C68C5200CE94
      5A00D6A55A00DEAD6300E7B56B00E7B56B00E7B56B00E7B56B00DEA56300D69C
      5A00CE8C5200BD845200A5ADAD00DEDEDE00FF8452009494940039393900FF73
      4200FF522100FF522100FF522100EF000000AD000000FF522100FF522100FF00
      00004A4A4A00F7FFFF0039393900940000000000000000000000000000008484
      840000000000000000000000000000000000000000000000000000000000FFFF
      FF00848484000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000210000002100CE00
      0000CE000000424242000000000000000000F7F7F70084522900B57B4200BD84
      4A00CE8C4A00D6945200D69C5A00DEA55A00DEA55A00D69C5A00CE945200C68C
      4A00BD844A00B5734200A5ADAD00DEDEDE00FF522100FF845200FF522100FF84
      5200FF845200FF845200FF522100FF522100FF522100FF522100FF522100FF52
      2100FF000000FF522100FF5221007B0000000000000000000000000000008484
      840000000000000000000000000000000000000000000000000000000000FFFF
      FF00848484000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000021000000210000002100CE00
      000042424200000000000000000052525200F7F7F7007B422100AD6B3900B573
      3900BD7B4200BD844200C6844A00C68C4A00C68C4A00C6844A00BD7B4200B573
      4200AD6B3900AD633900A5A5AD00DEDEDE000000000094000000FF522100FF52
      2100FF522100FF522100FF522100FF522100FF522100FF522100FF522100FF52
      2100FF522100FF0000007B000000000000000000000000000000000000008484
      840000000000848484000000000000000000000000000000000000000000FFFF
      FF00848484000000000000000000000000000000000000000000CECECE000000
      2100000000000000000000000000000021000000210000002100CE0000004242
      420000000000000000000000000000000000FFFFFF00945A2900C6844A00C68C
      5200CE945A00CE9C6B00D6A57300D6A57300D6A57300CE9C6B00CE946300CE94
      5A00C68C4A00C68442009CA5A500DEDEDE00FF52210008080800FF0000004A4A
      4A00313131001818180063636300848484008484840008080800313131003131
      310018181800FF522100FF522100940000000000000000000000000000008484
      840000000000C6C6C600848484000000000000000000C6C6C600C6C6C600FFFF
      FF008484840000000000000000000000000000000000A5A5A500000021003131
      31004242420000000000000021000000210000002100CE000000424242000000
      000000000000000000000000000052525200FFFFFF00A56B3100DE9C5A00DEA5
      6B00E7B57B00E7BD8C00E7C69C00EFC69C00EFC69C00E7BD9400E7B58C00DEAD
      7B00DEA56300D6945200A5A5A500DEDEDE000000000000000000FF5221005252
      52003131310031313100949494009C9C9C009C9C9C0052525200080808000808
      0800080808004A4A4A0000000000000000000000000000000000000000008484
      840000000000C6C6C60000000000C6C6C600C6C6C600FFFFFF00C6C6C600C6C6
      C60084848400000000000000000000000000CECECE0042424200313131000000
      210000002100000021000000210000002100CE00000042424200000000000000
      000000000000000000000000000000000000FFFFFF00AD7B4200EFAD7300EFBD
      8C00F7C69C00F7D6B500F7DEC600F7E7CE00F7DEC600F7DEBD00F7CEAD00F7C6
      9400EFB57B00EFAD6B00A5A5A500DEDEDE0000000000000000004A4A4A007B7B
      7B00848484006B6B6B0063636300080808000808080031313100313131000808
      0800FF5221000000000000000000000000000000000000000000000000008484
      840000000000C6C6C600C6C6C600FFFFFF00C6C6C600C6C6C600848484000000
      0000000000000000000000000000000000000000210031313100000021000000
      2100000021000000210042424200CE0000004242420000000000000000000000
      000000000000000000000000000052525200F7F7F700B5844A00FFBD8400FFCE
      9C00FFD6B500FFE7CE00FFEFE700FFF7EF00FFF7EF00FFEFDE00FFDEC600FFD6
      AD00FFC69400F7B57300A5A5AD00DEDEDE000000000000000000000000004A4A
      4A00FF290000FF290000FF522100FF522100FF522100FF522100FF522100FF00
      0000000000000000000000000000000000000000000000000000000000008484
      8400C6C6C600FFFFFF00C6C6C600C6C6C6008484840000000000000000000000
      0000000000000000000000000000000000004242420000002100CE9C00004242
      4200000021004242420000002100424242000000000000000000000000000000
      000000000000000000000000000000000000F7F7F70084736B008C847300847B
      730084847B00848484008C8484008C8C8C008C8C8C008C8C840084848400847B
      73007B736B007B736300D6D6D600D6D6D6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000073737300000021006363
      6300313131000000210073737300000000000000000000000000000000000000
      000000000000000000000000000052525200FFFFFF00F7F7F700F7F7F700F7F7
      F700FFFFFF00FFFFFF00FFFFFF00E7E7E700FFFFFF00FFFFFF00F7F7F700F7F7
      F700EFEFEF00E7E7E700E7E7E700C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000630000006300000063000000630000006300000063000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      6300000063001010FF000000D6000000D6000000D6000000D6000000D6000000
      6300000063000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005A39000039210000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000002929290000000000000000000000000000000000000063004A4A
      FF005252FF000000D6000000D6000000D60000009C000000840000009C000000
      9C000000D6000000630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005A390000B57300005A390000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009C5A
      3100FFFFD600EFA57B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005A5A5A005A5A5A00000000000000000000000000000063007B7BFF005252
      FF000000D6000000000000000000000000000000000000000000000000000000
      9C0000009C000000D60000006300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006B4A
      0000B5730000FFCE6B0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C5A3100FFFF
      F700FFB58C009C5A310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000808
      0800736B6B0052525200000000000000000000000000000063007B7BFF005252
      FF000000000000009C0000009C0000009C0000009C0000009C0000005A000000
      000000009C0000009C0000006300000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084520000F79C
      0000FFDEA5000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AD6B4200FFFFF700FFC6
      9C009C5A31000000000000000000000000000000000000000000000000000000
      00009C9C9C00BDB5AD0000000000000000000000000000000000000000006B6B
      6B0073737300000000000000000000000000000063007B7BFF005252FF000000
      0000BDBDFF007373FF000000F7000000D6000000D6000000D60000009C000000
      84000000000000009C000000D600000063000000000000000000000000004A4A
      4A00000000000000000000000000000000005A5A5A0000000000FFBD3900FFF7
      E700000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFF700FFD6AD009C5A
      3100000000000000000000000000000000000000000000000000000000002929
      2900E7EFEF00E7D6C600D6C6B500B5A59C00000000000000000018181800948C
      8C005A5A5A00000000000000000000000000000063007B7BFF005252FF000000
      0000BDBDFF008484FF005252FF002121FF002121FF000000F7000000D6000000
      9C000000000000009C000000D600000063000000000000000000000000008484
      8400E78C0000E78C0000E78C0000E78C00004242420008080800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF944200FFEF9C00FFFFB500FFD6840000000000000000009C5A31000000
      000000000000000000000000000000000000000000000000000000000000EFEF
      EF00C6B5AD00C6BDAD00CEBDAD00C6B5A500B5A59400AD9C94006B6363008484
      840000000000000000000000000000000000000063007B7BFF005252FF000000
      0000BDBDFF008484FF005252FF002121FF002121FF002121FF000000D6000000
      9C000000000000009C000000D60000006300000000004A4A4A0084848400FFB5
      3900FFCE7B00FFCE7B00FFB53900FFB53900E78C0000424242004A4A4A000000
      000000000000000000000000000000000000000000000000000000000000FF73
      2100FFFFB500FFFFB500FFE79400FFFFAD00FFD6840000000000000000000000
      000000000000000000000000000000000000000000000000000008080800D6D6
      D600EFDED600EFDED600EFD6C600EFDEC600B5A59400BDAD9400B5B5B500847B
      730000000000000000000000000000000000000063007B7BFF005252FF000000
      0000BDBDFF008484FF005252FF002121FF002121FF002121FF000000D6000000
      9C00000000000000D6000000D600000063000000000000000000FFE7B500FFE7
      B500FFE7B500FFCE7B00FFCE7B00FFB53900FFB53900E78C0000000000000000
      000000000000000000000000000000000000000000000000000000000000FFE7
      9400FFFFD600FFFFD600FFFFC600FFE79400FFFFAD00FFBD6300000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00F7E7
      E700F7E7DE00EFDED6007B7B7B00CECECE00EFDED600EFE7D600DEDEDE00C6B5
      A500DEC6AD00AD9C84000000000000000000000063007B7BFF005252FF000000
      0000BDBDFF00BDBDFF005252FF005252FF005252FF005252FF000000D6000000
      B500000000000000D6000000D600000063000000000000000000FFE7B500FFFF
      FF00FFE7B500FFCE7B00FFCE7B00FFCE7B00FFB53900E78C0000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      BD00FFFFFF00FFFFC600FFFFC600FFFFC600FFE79400FFC67300000000000000
      0000000000000000000000000000000000000000000039393900C6C6C600F7EF
      EF00F7E7E700A59C9C00EFE7D600DEC6AD00E7C6B500E7C6AD00DEC6AD00EFDE
      CE00DEBDA500DEB573000000000000000000000063007B7BFF005252FF000000
      0000BDBDFF00BDBDFF00B5B5FF007B7BFF007B7BFF007B7BFF006B6BFF000000
      AD00000000000000D6001010FF00000063000000000000000000FFE7B500FFFF
      FF00FFE7B500FFCE7B00FFCE7B00FFCE7B00FFB53900E78C0000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      BD00FFFFFF00FFFFD600FFFFC600FFFFD600FFE79400FFEF9C00000000000000
      00000000000000000000000000000000000000000000F7F7F700F7F7EF00FFF7
      EF0084848400F7EFE700F7E7DE00DEC6AD00DEC6AD00DEC6AD00DEC6A500CEAD
      9400D6D6DE00EFD6C600000000000000000000000000000063007B7BFF005252
      FF0000000000BDBDFF00BDBDFF00BDBDFF00BDBDFF00BDBDFF00BDBDFF000000
      00000000D6005252FF0000006300000000000000000000000000FFFFF700FFFF
      FF00FFFFFF00FFE7B500FFCE7B00FFCE7B00FFB53900E78C0000000000000000
      000000000000000000000000000000000000000000000000000000000000FFE7
      9400FFFFE700FFFFE700FFFFE700FFFFE700FFFFD600FFAD5A00000000000000
      0000000000000000000000000000000000000000000000000000EFE7E700FFFF
      F700EFEFEF00F7F7EF00F7E7DE00E7CEBD00DEBDA500DEBDA500C6AD9400B594
      8400F7F7F70000000000000000000000000000000000000063007B7BFF008484
      FF005252FF000000000000000000000000000000000000000000000000005252
      FF005252FF004A4AFF000000630000000000000000004A4A4A0084848400FFFF
      F700FFFFFF00FFFFFF00FFE7B500FFE7B500FFB53900848484004A4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFE79400FFFFE700FFFFE700FFFFAD00FFC6730000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E7DE
      D600FFF7F700F7F7F700F7EFE700EFDED600C6AD9400B59C8400B5947B00BD9C
      8400EFEFEF000000000000000000000000000000000000000000000063007B7B
      FF007B7BFF005252FF005252FF005252FF005252FF005252FF005252FF007B7B
      FF007B7BFF000000630000000000000000000000000000000000000000008484
      8400FFFFF700FFE7B500FFE7B500FFE7B5008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFF7F700EFEFE700E7DED600D6C6BD00CEB59C00C6A58C00F7EF
      E700D6CECE000000000000000000000000000000000000000000000000000000
      6300000063007B7BFF007B7BFF007B7BFF007B7BFF007B7BFF007B7BFF000000
      6300000063000000000000000000000000000000000000000000000000004A4A
      4A00000000000000000000000000000000004A4A4A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BDB5B500FFFFFF00FFF7F700F7EFE700EFDECE00E7CEB500EFE7E700EFEF
      EF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000630000006300000063000000630000006300000063000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CEC6C600DEDEDE00DED6D600BDB5B500FFF7F700D6CECE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000808C6001818DE001818DE001818
      D6001818D6001818D6001818CE001818CE001818CE0000006300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000CE001818FF001010FF001010
      FF001818FF001818FF001818FF001818FF001010E7005A215A00AD4A1800A542
      1800A53910009C31100094291000841008000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400ADADAD00949494009494
      9400949494009494940094949400949494009494940094949400949494009494
      94007B7B7B000808080000000000000000000000000000000000000000000084
      8400008484000084840000848400008484000084840000848400008484000084
      840000848400005A5A0000000000000000000000C6001818F7003131FF003131
      FF003131FF000808FF000000FF000000FF000000D600BD6B3900FF941800FF9C
      2100FF9C2100FF9C2100FF9C2100A53910000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600BDBDBD000000000084848400FFFFFF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00FFFFFF00FFFFFF00D6D6D600D6D6D600D6D6D600D6D6
      D6009494940000000000000000000000000000000000000000000000000000F7
      F70000D6D60000B5B50000B5B500BDFFFF0000B5B500BDFFFF0000B5B500BDFF
      FF00009C9C000084840000000000000000000000C6002121E7006363FF006363
      FF006363FF006363FF005252FF004A4AF70021109C00FF8C1000FF8C1000FF8C
      0800FF8C0000FF8C0000FF8C0000841800000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00E7E7E700E7E7
      E700E7E7E700E7E7E700BDBDBD000000000084848400FFFFFF00EFEFEF00EFEF
      EF00EFEFEF00FFFFFF006B6B6B0008080800EFEFEF00D6D6D600CECECE00CECE
      CE0094949400000000000000000000000000000000000000000000000000BDFF
      FF0000FFFF0000DEDE000000000000DEDE000000000000DEDE000000000000DE
      DE0000CECE00008484000000000000000000000000000000C6005A5AF7009C9C
      FF009C9CFF009C9CFF009C9CFF002929CE00AD6B6300FFA54A00FFA54A00FFA5
      4A00FFA53900FF9C2900E77318006308000000000000ADADAD00ADADAD00ADAD
      AD00ADADAD00ADADAD00ADADAD00ADADAD0000000000FFFFFF00CECECE00CECE
      CE00CECECE00CECECE00BDBDBD000000000084848400FFFFFF00EFEFEF00EFEF
      EF00FFFFFF006B6B6B00D6D6D6008C8C8C0008080800EFEFEF00CECECE00CECE
      CE0094949400000000000000000000000000000000000000000000000000BDFF
      FF0018FFFF0000FFFF0000DEDE00BDFFFF0000DEDE00BDFFFF0000DEDE00BDFF
      FF0000CECE00008484000000000000000000000000000000A5000000C6005252
      E7009494F7008484EF002929CE0031186B00D6843900FFCE8C00FFCE8C00FFCE
      8C00FFCE8C00FFBD8400A53918002100000000000000FFFFFF00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00EFEFEF00FFFF
      FF006B6B6B00D6D6D600D6D6D600D6D6D6008C8C8C0008080800EFEFEF00CECE
      CE0094949400080808000000000000000000000000000000000000000000BDFF
      FF00BDFFFF0000FFFF000000000000FFFF000000000000FFFF000000000000DE
      DE0000B5B500008484000000000000000000000000000000000000294A000039
      A5000029BD000029AD0000297300000000007B421800D68C5200FFDEC600FFF7
      DE00EFBD9400AD5231004A1008000000000000000000FFFFFF00E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E7000000000021B5000021B5000021B5
      000021B5000021940000188400000000000084848400FFFFFF00FFFFFF006B6B
      6B00EFEFEF00E7E7E700E7E7E700D6D6D600D6D6D6008C8C8C0008080800CECE
      CE00949494000000000000000000000000000000000000000000000000000000
      0000BDFFFF0000FFFF0000FFFF00BDFFFF0000FFFF00BDFFFF0000DEDE00BDFF
      FF00008484000000000000000000000000000000000000529C00298CD6008CC6
      F7009CD6FF0094CEFF00529CDE0008529400000000004A3931006B5A5A008452
      42005A424A0010080000000000000000000000000000FFFFFF00E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E70000000000FFFFFF00CEFFBD009CFF
      84007BFF52007BFF5200219400000000000084848400FFFFFF006B6B6B00EFEF
      EF00EFEFEF00EFEFEF00E7E7E700D6D6D600D6D6D600D6D6D6008C8C8C000808
      0800CECECE000000000000000000000000000000000000000000000000000000
      000000000000BDFFFF000000000000FFFF000000000000FFFF000000000000DE
      DE0000000000000000000000000000000000004A8400298CDE0084CEFF0084CE
      FF0084CEFF0084CEFF0084CEFF005AA5E7000052A500398CD6007BB5EF007BB5
      EF0063A5DE001063AD008C9CA5000000000000000000FFFFFF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF000000000000000000000000000000
      0000000000000000000000000000000000008484840094949400FFFFFF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00E7E7E700D6D6D60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BDFFFF0000FFFF0000FFFF0000FFFF0000DEDE0000DEDE00006B
      6B0000000000000000000000000000000000006BCE001884DE003184DE00529C
      E70084C6FF006BBDFF006BB5FF006BB5FF003184CE008CCEFF008CCEFF008CCE
      FF008CCEFF0084C6FF001063AD009CA5A50000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484000000000000000000000000006B6B6B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000D6D600009C
      9C00006B6B00000000000073730000A5A50000A5A500007B7B00006B6B000000
      0000006B6B0000848400009494000000000000A5E70008E7FF0008DEFF0008AD
      EF001873CE007BB5EF008CC6FF0073B5FF002973C6005A94CE0084C6FF0073BD
      FF0073BDFF0073BDFF004294DE000029520000000000FFFFFF00F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F70084848400000000000000000000000000000000006B6B6B006B6B6B006B6B
      6B006B6B6B006B6B6B006B6B6B006B6B6B00000000000000000021FFFF000000
      0000000000000000000021FFFF00000000000000000000000000BDFFFF0000F7
      F70000B5B500008484000000000000000000000000000000000000000000009C
      9C0000B5B50000FFFF0010FFFF0000000000108CDE004AE7FF004AE7FF004AE7
      FF004ADEFF00299CDE003984D60073A5E700005AA500084A840010397300638C
      BD008CC6FF006BB5FF004A9CEF0000397B0000000000DEDEDE00D6D6D600D6D6
      D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600848484000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000021FF
      FF000000000021FFFF0000000000000000000000000000000000FFFFFF00FFFF
      FF00BDFFFF0073FFFF0039FFFF00B5FFFF00B5FFFF00B5FFFF00B5FFFF0042FF
      FF0000EFEF0000ADAD0039FFFF00000000000063D6007BDEFF0094EFFF0094EF
      FF0094EFFF0094EFFF0094EFFF003194DE001063B5004284B5004284B5002952
      8400315284007B94BD005A9CDE00002142000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000021FFFF000000000000000000000000000000000000000000000000000000
      000000BDBD00B5FFFF00B5FFFF00B5FFFF00B5FFFF0039FFFF0042FFFF0000C6
      C600006363000000000000000000000000000063CE002984DE00BDE7FF00D6FF
      FF00D6FFFF00D6FFFF008CCEF700106BCE007BADCE0084B5CE0084B5CE0084B5
      CE0084B5CE006384AD0000215A00000821000000000021B5000021B5000021B5
      000021B5000021B5000021B5000021B5000021B5000021B5000021B500002194
      0000188400000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000021FF
      FF000000000021FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000063CE000063CE004A94
      DE00398CDE00397BD6000052B50000396B0094B5C600CEDEEF00CEDEEF00CEDE
      EF00CEDEEF006384AD00001852000000000000000000FFFFFF00CEFFBD009CFF
      84007BFF52007BFF520052FF210052FF210052FF210052FF210052FF210052FF
      2100219400000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000021FFFF000000
      0000000000000000000021FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000003163006384A5007B94AD007B94
      AD00425A840000184A0000082900000000000000000000000000000000000000
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
      0000000000000000000000000000000000000808080008080800393939008484
      84006B6B6B00525252003939390018181800181818004A4A4A00636363007B7B
      7B00949494000808080008080800313131000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000393939000094940000BDBD0000DE
      DE0000BDBD0000BDBD0000BDBD0000BDBD0000BDBD0000BDBD0000BDBD0000BD
      BD0000CECE00009494004A4A4A00080808000000000000000000ADADAD00ADAD
      AD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADAD
      AD00ADADAD00ADADAD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A003939390000000000000000000073730000BDBD0000DEDE0000FF
      FF00FFFFFF0000EFEF0000EFEF0000EFEF0000EFEF0000EFEF006BFFFF006BFF
      FF0000FFFF0000BDBD0000949400005252000000000000000000FFFFFF00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE008484840000000000000000000000000084848400ADADAD009494
      9400949494009494940094949400949494009494940094949400949494009494
      9400949494007B7B7B0008080800000000007B7B7B009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C006B6B6B0039393900000000000094940000ADFF0000DEDE0000EF
      EF0000EFEF0000EFEF0000DEDE0000DEDE0000DEDE0000DEDE0000EFEF0000EF
      EF0000EFEF0000ADFF006B6B6B00005252000000000000000000FFFFFF00E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700E7E7E7008484840000000000000000000000000084848400FFFFFF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00FFFFFF00FFFFFF00D6D6D600D6D6D600D6D6
      D600D6D6D6009494940000000000000000007B7B7B00D6D6D600BDBDBD00FFFF
      FF00BDBDBD00FFFFFF00BDBDBD00FFFFFF00BDBDBD00FFFFFF00BDBDBD00BDBD
      BD009C9C9C007B7B7B004A4A4A000000000000CECE0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000DEDE00007373000000000000000000FFFFFF00E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700E7E7E7008484840000000000000000000000000084848400FFFFFF00EFEF
      EF00EFEFEF00EFEFEF00FFFFFF006B6B6B0008080800EFEFEF00D6D6D600CECE
      CE00CECECE009494940000000000000000007B7B7B00CECECE0000000000DEDE
      DE0000000000DEDEDE0000000000DEDEDE0000000000DEDEDE00D6D6D600D6D6
      D600B5B5B5007B7B7B005A5A5A000000000000DEDE0063636300DEDEDE00F7FF
      FF00B5FFFF0000DEDE0000DEDE0000DEDE0000DEDE0000DEDE0000EFEF00F7FF
      FF004A4A4A00848484004A4A4A0000BDBD000000000000000000FFFFFF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF008484840000000000000000000000000084848400FFFFFF00EFEF
      EF00EFEFEF00FFFFFF006B6B6B00D6D6D6008C8C8C0008080800EFEFEF00CECE
      CE00CECECE009494940000000000000000007B7B7B00CECECE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00B5B5B5007B7B7B005A5A5A0000000000F7FFFF009494940039393900F7FF
      FF006BFFFF0000FFFF0000FFFF0000BDBD0000BDBD0000FFFF0000FFFF0000DE
      DE004A4A4A00F7FFFF0052525200007373000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008484840000000000000000000000000084848400FFFFFF00EFEF
      EF00FFFFFF006B6B6B00D6D6D600D6D6D600D6D6D6008C8C8C0008080800EFEF
      EF00CECECE009494940008080800000000007B7B7B00FFFFFF00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE000084
      0000BDBDBD007B7B7B005A5A5A000000000000DEDE00F7FFFF0000FFFF00F7FF
      FF00F7FFFF00F7FFFF00B5FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000DEDE0000FFFF0000FFFF00005252000000000000000000FFFFFF00F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F7008484840000000000000000000000000084848400FFFFFF00FFFF
      FF006B6B6B00EFEFEF00E7E7E700E7E7E700D6D6D600D6D6D6008C8C8C000808
      0800CECECE009494940000000000000000007B7B7B00FFFFFF00FFFFFF00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE007B7B7B005A5A5A0000000000000000000073730000DEDE0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000DEDE0000525200000000000000000000000000DEDEDE00D6D6
      D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600D6D6D6008484840000000000000000000000000084848400FFFFFF006B6B
      6B00EFEFEF00EFEFEF00EFEFEF00E7E7E700D6D6D600D6D6D600D6D6D6008C8C
      8C0008080800CECECE000000000000000000000000007B7B7B00BDBDBD00A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A5005A5A5A000000000000FFFF000808080000BDBD004A4A
      4A00313131001818180063636300848484008484840008080800313131003131
      31001818180000FFFF0000FFFF00009494000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840094949400FFFF
      FF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00E7E7E700D6D6D600D6D6D600D6D6
      D6008C8C8C0008080800080808000000000000000000000000007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B000000000000000000000000000000000000FFFF005252
      52003131310031313100949494009C9C9C009C9C9C0052525200080808000808
      0800080808004A4A4A000000000000000000000000000000000021B5000021B5
      000021B5000021B5000021B5000021B5000021B5000021B5000021B5000021B5
      000021940000188400000000000000000000000000006B6B6B00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEFEF00EFEF
      EF00CECECE009C9C9C0010101000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004A4A4A007B7B
      7B00848484006B6B6B0063636300080808000808080031313100313131000808
      080000FFFF000000000000000000000000000000000000000000FFFFFF00CEFF
      BD009CFF84007BFF52007BFF520052FF210052FF210052FF210052FF210052FF
      210052FF210021940000000000000000000000000000000000006B6B6B006B6B
      6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B
      6B006B6B6B006B6B6B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004A4A
      4A0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000DEDE0000DE
      DE00000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000001010
      1000101010001010100010101000101010001010100010101000101010001010
      1000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B5ADAD00B5AD
      AD00848484007373730073737300737373006363630063636300636363004A42
      4200313131000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400848484000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010101000F7F7F700D6D6
      D600BDBDBD00A5A5A500A5A5A500A5A5A500A5A5A500A5A5A5008C8484007373
      73004A4242001010100000000000000000000000000000000000C6C6C600C6C6
      C60000000000000000000000000000000000C6C6C60000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000008080800106B8C00005A
      7300004A5A00084A5A0000394A0000394A0000394A0000394A00003139000000
      0000000000001010100000000000000000000000000000FF0000000000000000
      000000840000008400000084000000FF00000000000000FF0000008400000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010101000F7F7F700D6D6
      D600BDBDBD00BDBDBD00A5A5A500A5A5A500A5A5A500A5A5A500A5A5A5007373
      7300636363001010100000000000000000000000000000000000000000000000
      0000008400000084000000840000008400000084000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000084
      84000084840000FFFF000084840000FFFF000084840000FFFF000084840000FF
      FF0000FFFF000084840000000000000000000000000008080800106B8C00005A
      6B00005A730008526B00084A5A00004252000039420000394200000000000000
      0000000000001010100000000000000000000000000000000000008400000084
      0000FFFF000084848400FFFF0000FFFF0000FFFF00000000000000FF000000FF
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF00000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF000084840000FFFF000084840000FFFF000084840000FFFF000084
      84000084840000FFFF0000000000000000000000000010101000F7F7F700D6D6
      D600BDBDBD00BDBDBD00A5A5A500A5A5A500A5A5A500A5A5A5008C8484007373
      7300636363001010100000000000000000000000000000000000000000000000
      00000000000000FF000000FF000000FF0000000000000000000000000000C6C6
      C600000000000000000084848400000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF000084840000FFFF000000000000FFFF000084840000FFFF000000
      00000084840000FFFF0000000000000000000000000000000000101010000000
      0000000000000000000018181800181818001818180000000000000000000000
      0000181818000000000000000000000000000000000000000000000000000000
      FF000000FF0000000000000000000000840000008400000084000000FF000000
      00000000FF000000840000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF00000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF000000000000FFFF000000000000FFFF000000000000FFFF000000
      00000000000000FFFF0000000000000000000000000000000000000000002121
      2100BDBDBD0039393900000000000000000000000000393939004A4A4A002121
      2100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000084000000840000008400000084000000
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002121
      2100DEDEDE0039393900000000000000000000000000393939004A4A4A002121
      2100000000000000000000000000000000000000000000000000000000000000
      0000000000000000840000008400FFFF000084848400FFFF0000FFFF0000FFFF
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002121
      2100EFEFEF005A5A5A003939390039393900393939005A5A5A00525252002121
      2100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002121
      2100FFFFFF00C6C6C600B5B5B5009C9C9C008C8C8C007B7B7B00636363002121
      2100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000212121002121210021212100212121002121210021212100212121000000
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
      00000000000000000000A56B39000000FF000000FF00A56B3900C6C6C6000000
      000000000000000000000000000000000000CEFFD6008CFFAD008CFFAD008CFF
      AD008CFFAD008CFFAD006B6B6B008CFFAD00848484008CFFAD008CFFAD008CFF
      AD008CFFAD008CFFAD0000F7390000AD29000000000000000000000000000000
      0000000000000000000000000000000000000808080008080800080808000808
      0800080808000808080008080800000000000000000000000000000000000000
      00000000000000000000C6C6C600000000000000000000000000000000000000
      00000000000000000000C6C6C600000000000000000000000000000000000000
      0000848484000000FF0084848400C6C6C600C6C6C600008484000000FF00A56B
      390000000000000000000000000000000000CEFFD6008CFFAD008CFFAD008CFF
      AD008CFFAD008CFFAD008CFFAD004A4A4A008CFFAD008CFFAD008CFFAD008CFF
      AD008CFFAD008CFFAD0000F7390000AD29000000000000000000000000000000
      000000000000000000000000000000000000080808005252FF005252FF005252
      FF005252FF005252FF0008080800000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      FF0084848400F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00A56B39000000
      FF000000FF00000000000000000000000000CEFFD6008CFFAD008CFFAD008CFF
      AD008CFFAD00000000008CFFAD00000000008CFFAD006B6B6B008CFFAD008CFF
      AD008CFFAD0052FF7B0000F7390000AD29000000000000000000000000000000
      00000000000000000000000000000000000008080800B5B5FF00212121002121
      2100212121005252FF0008080800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600F7FFFF00F7FFFF00C6DEC600A56B3900F7FFFF00C6C6C6000000FF00F7FF
      FF00A56B3900000000000000000000000000CEFFD600CEFFD600CEFFD6008CFF
      AD008CFFAD008CFFAD000000000000000000000000008CFFAD008CFFAD008CFF
      AD0052FF7B0000F7390000AD2900000000000000000000000000000000000000
      00002121210021212100212121002121210008080800B5B5FF00A5A5FF008C8C
      FF008C8CFF005252FF0008080800000000000000000084000000840000008400
      00008400000000000000C6C6C60000000000000000000000000000000000C6C6
      C6000000000000000000000000000000000000000000C6C6C6000000FF00F7FF
      FF00C6DEC600A56B390084848400FFFFFF000000FF000000FF00008484000000
      84008484840084848400000000000000000000000000FFFFFF00CEFFD600CEFF
      D6008CFFAD008CFFAD008CFFAD00000000008CFFAD008CFFAD008CFFAD0052FF
      7B0000F7390000AD290000000000000000000000000000000000000000000000
      00002121210031CE000031CE000031CE000008080800B5B5FF00212121002121
      2100212121005252FF0008080800000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF0000000000C6C6C60000000000000000000000000000000000C6C6
      C60000000000000000000000000000000000000000000000FF00A56B39008400
      8400000084000000840000008400848400000084840000848400000084000084
      8400008484000000FF00A56B3900000000000000000000000000FFFFFF00FFFF
      FF00CEFFD6008CFFAD000000000000000000000000008CFFAD0052FF7B0000F7
      390000AD29000000000000000000000000000000000000000000000000000000
      000021212100D6FFCE00212121002121210008080800B5B5FF00A5A5FF008C8C
      FF008C8CFF005252FF0008080800000000000000000084000000FFFFFF008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      8400008484000084840000848400008484000000840000008400000084000084
      840000008400000084008484840000000000000000000000000000000000F7FF
      F700F7FFF700F7FFF7004AFF73004AFF73004AFF73004AFF730000EF310000AD
      2100000000000000000000000000000000003939390039393900393939003939
      390021212100D6FFCE00CEFFB500ADFF8C0008080800B5B5FF00212121002121
      2100212121005252FF0008080800000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000C6C6C6000000
      0000000000000000000000000000000000000000000084848400000084000000
      FF000000FF00000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF0084848400A56B3900000000000000000000000000000000000000
      00000021420000315A0008396300084263000839630000294A00002139000000
      00000000000000000000000000000000000039393900FFCE7B00EF8C0000EF8C
      000021212100D6FFCE00212121002121210008080800FFFFFF00CECEFF00CECE
      FF00CECEFF005252FF0008080800000000000000000084000000FFFFFF008484
      840084848400FFFFFF008484840000000000000000008484840084848400FFFF
      FF0000000000000000000000000000000000000000008484840000008400A56B
      3900A56B3900A56B390084840000A56B39008484840084848400848484000000
      FF00A56B3900C6C6C6000000FF0000000000000000000000000000000000DEDE
      DE0000000000C6C6C60000000000ADADAD0000000000ADADAD0000000000ADAD
      AD000000000000000000000000000000000039393900FFCE7B00212121002121
      210021212100D6FFCE00CEFFB500ADFF8C000808080008080800080808000808
      0800080808000808080008080800000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000FF00A56B39008484
      0000CED6D60084000000FFFFFF00CED6D600CED6D600A56B3900A56B3900C6DE
      C600F7FFFF0084848400A56B3900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000039393900FFCE7B00FFC66B00FFBD
      4A0021212100D6FFCE0021212100212121002121210031CE0000212121000000
      0000000000000000000000000000000000000000000084000000FFFFFF008484
      840084848400FFFFFF008484840000000000000000008484840084848400FFFF
      FF000000000000000000000000000000000000000000C6C6C6000000FF0000FF
      FF0000848400C6DEC600000084000084840084848400C6DEC600F7FFFF00F7FF
      FF00F7FFFF000000FF00C6C6C600000000000000000000000000106BCE00106B
      CE001094EF0042A5F7006BB5F7006BB5F7006BB5F70042A5F7001094EF00086B
      BD00084A8C0000000000000000000000000039393900FFCE7B00212121002121
      210021212100FFFFFF00D6FFCE00D6FFCE00D6FFCE0031CE0000212121000000
      0000000000000000000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008400000000000000000000000000000000000000000000000000FF0000FF
      FF0000FFFF0000FFFF000000FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00C6DE
      C600F7FFFF00A56B3900C6DEC6000000000000000000086BCE00086BCE00086B
      CE00086BCE00086BCE00086BCE00086BCE00086BBD000863AD0008528C000039
      6B0000214A0000214200000000000000000039393900FFCE7B00FFC66B00FFBD
      4A00212121002121210021212100212121002121210021212100212121000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      FF000000FF00A56B3900F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00A56B
      39000000FF00F7FFFF00000000000000000000000000F7FFFF00D6EFFF00F7FF
      FF00D6EFFF00F7FFFF00D6EFFF00FFFFFF00D6EFFF00FFFFFF0084C6F700ADDE
      FF000873C600085AA500000000000000000039393900FFCE7B00212121002121
      210021212100EF8C000039393900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000C6C6C6008400
      000084000000C6C6C6008400000084000000C6C6C6008400000084000000C6C6
      C60084000000000000000000000000000000000000000000000000000000C6C6
      C6000000FF000000FF00A56B3900C6C6C600C6C6C600A56B39000000FF000000
      FF00C6C6C6000000000000000000000000000000000000000000DEEFFF000000
      000052B5F700000000009CD6F700000000009CD6F70000000000219CEF000000
      0000085A9C0000000000000000000000000039393900FFFFF700FFCE7B00FFCE
      7B00FFCE7B00EF8C000039393900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      000000000000A56B39000000FF000000FF000000FF000000FF00C6C6C600C6DE
      C60000000000000000000000000000000000000000000000000000000000DEEF
      FF00DEEFFF00FFFFFF00EFF7FF00FFFFFF00EFF7FF0052ADEF000873D600085A
      9C00000000000000000000000000000000003939390039393900393939003939
      3900393939003939390039393900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C6000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFF0000FFFF0000C6C6C600C6C6C600C6C6
      C600C6C6C60084848400000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008484840000000000C6C6C600FFFF0000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C6000000000084848400000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600FFFF0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000FFFF0000FFFF0000FF
      FF000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600000000000000000000FFFF0000FFFF000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600000000000000000000000000000000000000
      000000000000FFFF0000C6C6C600000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF000000000000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFF0000C6C6C600000000000000000000000000000000000000
      000000FFFF0000FFFF000000000000FFFF0000FFFF000000000000FFFF0000FF
      FF000000000000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008484840000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600FFFF0000FFFF000000000000848484000000000000000000000000000000
      000000FFFF0000FFFF000000000000FFFF0000FFFF000000000000FFFF0000FF
      FF00000000000000000000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400C6C6C600C6C6C600C6C6C600FFFF0000FFFF
      0000FFFF000084848400000000000000000000000000000000000000000000FF
      FF0000FFFF00000000000000000000FFFF0000FFFF000000000000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C6000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF00000000000000000000FFFF0000FFFF000000000000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000000000000000000000
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
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000840000000000000000000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C600FFFFFF0000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000840000000000000084000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000FFFFFF00C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000840000000000000084000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000840000000000000084000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF000000000000000000FFFFFF00C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFF0000FFFF0000C6C6C600C6C6C600C6C6
      C600C6C6C6008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000840000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008484840000000000C6C6C600FFFF0000C6C6C6000000000000000000C6C6
      C600C6C6C600C6C6C60000000000848484000000000000000000000000000000
      0000000000000000000000000000840000000000000084000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600FFFF0000C6C6C600C6C6C6000000000000000000C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600000000000000000000000000000000000000
      000000000000FFFF0000C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600C6C6C600C6C6C6000000000000000000C6C6
      C600C6C6C600FFFF0000C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008484840000000000C6C6C600C6C6C600C6C6C6000000000000000000C6C6
      C600FFFF0000FFFF000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400C6C6C600C6C6C600C6C6C600FFFF0000FFFF
      0000FFFF00008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      84008484840084848400848484008484840084848400C6C6C600C6C6C600FFFF
      FF00FFFFFF00C6C6C60084848400C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      00000000000000000000848484008484840084848400FFFFFF00FFFFFF00FFFF
      FF00840000008400000084000000840000000000000000000000004200000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CE290000CE290000CE290000CE290000CE290000CE2900000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF00FF00840084000000000000000000C6C6C600FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000005A0000004A00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084FFA50084FFA5000000000000C6390000C63900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF6B0000FF6B0000B54A0000C6420000C6420000C6420000F7630000D639
      0000000000000000000000000000000000000000000000000000000000000000
      000084008400FF00FF008400840000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000009C0000006B0000005A00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006B6B6B006B6B6B000000
      0000000000000000000084FFA5000063180000C6390000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF9C
      1000FF8C0000FF8C0000BD630000FFFFFF00FFFFFF00E7520000FF8C0000FF6B
      0000D6390000000000008C001000000000000000000000000000000000000000
      000084008400FF00FF008400840000000000FFFFFF00FFFF0000FFFFFF00FFFF
      0000000000000000000000000000000000000000000000AD0000006B00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084FFA50052FF7B0000C6390000000000000000000000
      0000000000000000000000000000000000000000000000000000FF9C1000FF8C
      0000FF8C0000FF8C0000BD630000FFFFFF00FFFFFF00E7520000FF8C0000FF8C
      0000FF6B0000D639000000000000000000000000000000000000000000000000
      0000FF00FF0084008400FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000AD00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006B6B6B00000000000000
      000084FFA5000808080084FFA50052FF7B0000C639000808080000C639000000
      00000000000000000000000000000000000000000000FFE79C00FF9C1000FF8C
      0000FF8C0000FF8C0000BD630000FFFFFF00FFFFFF00E7520000FF8C0000FF8C
      0000FF8C0000F7630000CE290000000000000000000000000000000000000000
      000084008400FF00FF008400840000000000FFFFFF00FFFF0000FFFFFF00FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084FFA50084FFA50084FFA50052FF7B0000C6390000C6390000C639000000
      00000000000000000000000000000000000000000000FFE79C00FF9C1000FF8C
      0000FF8C0000FF8C0000BD630000FFFFFF00FFFFFF00E7520000FF8C0000FF8C
      0000FF8C0000FF6B0000D6390000000000000000000000000000000000000000
      0000FF00FF0084008400FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006B6B6B006B6B6B006B6B6B000000
      00000000000084FFA50084FFA50052FF7B0000C6390000C63900000000000000
      00000000000000000000000000000000000000000000FFE79C00FF9C1000FF8C
      0000FF8C0000FF8C0000BD630000FFFFFF00FFFFFF00E7520000FF8C0000FF8C
      0000FF8C0000FF6B0000D6390000000000000000000000000000000000000000
      000084008400FF00FF008400840000000000FFFFFF00FFFF0000FFFFFF00FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000008080800BDFFCE00BDFFCE0000DE420008080800000000000000
      00000000000000000000000000000000000000000000FFE79C00FF9C1000FF8C
      0000FF8C0000FF8C0000BD630000FFFFFF00FFFFFF00E7520000FF8C0000FF8C
      0000FF8C0000FF6B0000D6390000000000000000000000000000000000000000
      0000FF00FF0084008400FF00FF0000000000FFFF0000FFFFFF00FFFF0000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000008080800080808000808080000000000000000000000
      00000000000000000000000000000000000000000000FFE79C00FF9C1000FF8C
      0000FF8C0000FF8C0000D6730000D6730000D6730000D6730000FF8C0000FF8C
      0000FF8C0000FF6B0000D6390000000000000000000000000000000000000000
      000084008400FF00FF008400840000000000FFFFFF00FFFF0000FFFFFF00FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009421000000000000000000006B6B6B00000000006B6B6B006B6B
      6B0000000000080808007B7B7B00636363005252520008080800000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFB52100FF8C
      0000FF8C0000FF8C0000D6730000D6730000D6730000D6730000FF8C0000FF8C
      0000FF8C0000FF6B0000D6390000000000000000000000000000000000000000
      0000FF00FF0084008400FF00FF0000000000FFFF0000FFFFFF00FFFF0000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D6290000D6290000000000000000000000000000000000000000
      00000000000008080800C6C6C6009C9C9C006363630008080800000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FF9C
      1000FF8C0000FF8C0000BD630000FFFFFF00FFFFFF00E7520000FF8C0000FF8C
      0000FF8C0000FF6B000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF390000FF390000FF8C6B000000000000000000000000000000
      00000000000008080800FFFFFF00C6C6C6007B7B7B0008080800000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FF9C1000FF8C0000BD630000FFFFFF00FFFFFF00E7520000FF8C0000FF8C
      0000FF6B00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF522100FF9C840000000000000000006B6B6B006B6B6B006B6B
      6B006B6B6B000000000008080800080808000808080000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FF9C1000BD630000BD630000BD630000BD630000FF8C0000FF6B
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FF000000FF000000FF000000FF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF9C840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFE79C00FFE79C00FFE79C00FFE79C00FF6B00000000
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
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      FF000000FF00FFFFFF00FF000000FF000000FFFFFF000000000000000000FFFF
      FF000084000000840000FFFFFF00000000000000000000000000848484008484
      8400000000008484840084848400000000000000000084848400848484000000
      00008484840084848400000000000000000000000000000000000000FF000000
      0000000000008484840084848400848484008484840084848400848484008484
      8400848484000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      FF000000FF00FFFFFF00FF000000FF000000FFFFFF000000000000000000FFFF
      FF000084000000840000FFFFFF0000000000C6C6C60084000000840000008484
      8400C6C6C6008400000084000000C6C6C600840000008400000084848400C6C6
      C6008400000084000000C6C6C6000000000000000000000000000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000000000000000000000000000000000000000009C
      9C00005A8400009C9C00005A8400009C9C00005A8400009C9C00005A8400009C
      9C000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      FF000000FF00FFFFFF00FF000000FF000000FFFFFF000000000000000000FFFF
      FF000084000000840000FFFFFF00000000000000000084000000840000008484
      8400000000008400000084000000000000008400000084000000848484000000
      00008400000084000000000000000000000000000000000000000000FF000000
      FF000000000000FFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF000000
      FF000000FF0000000000000000000000000000000000000000000000000000FF
      FF000094DE0000FFFF000094DE0000FFFF000094DE0000FFFF000094DE0000FF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      FF000000FF00FFFFFF00FF000000FF000000FFFFFF000000000000000000FFFF
      FF000084000000840000FFFFFF0000000000C6C6C60084000000840000008484
      8400C6C6C6008400000084000000C6C6C600840000008400000084848400C6C6
      C6008400000084000000C6C6C600000000000000000000000000000000000000
      FF000000FF00FFFFFF00FF000000FF000000FF000000FF000000FFFFFF000000
      FF00848484000000000000000000000000000000000000AD0000008C00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000004A000000520000004A00000000000000000000FFFFFF00FFFFFF000000
      FF000000FF00FFFFFF00FF000000FF000000FFFFFF000000000000000000FFFF
      FF000084000000840000FFFFFF00000000000000000084000000840000008484
      8400000000008400000084000000000000008400000084000000848484000000
      0000840000008400000000000000000000000000000000000000000000000000
      00000000FF000000FF00FF000000FF000000FF0000000000FF000000FF000000
      0000848484000000000000000000000000000000000000C60000008C000000B5
      0000005A0000008C000000B50000005A0000008C000000B50000005A0000008C
      000000B5000000840000006300000000000000000000FFFFFF00FFFFFF000000
      FF000000FF00FFFFFF00FF000000FF000000FFFFFF000000000000000000FFFF
      FF000084000000840000FFFFFF0000000000C6C6C60084000000840000008484
      8400C6C6C6008400000084000000C6C6C600840000008400000084848400C6C6
      C6008400000084000000C6C6C600000000000000000000000000000000000000
      0000000000000000FF000000FF00FFFFFF0000FFFF000000FF00FFFFFF000000
      0000848484000000000000000000000000000000000000F70000000000000000
      000000DE0000000000000000000000DE0000000000000000000000DE00000000
      00000000000000BD000000A500000000000000000000FFFFFF00FFFFFF000000
      FF000000FF00FFFFFF00FF000000FF000000FFFFFF000000000000000000FFFF
      FF000084000000840000FFFFFF00000000000000000084000000840000008484
      8400000000008400000084000000000000008400000084000000848484000000
      0000840000008400000000000000000000000000000000000000000000000000
      000000000000FFFFFF000000FF000000FF000000FF000000FF00FFFFFF000000
      0000848484000000000000000000000000000000000000F70000000000000000
      000000DE0000000000000000000000DE0000000000000000000000DE00000000
      00000000000000BD000000A500000000000000000000FFFFFF00FFFFFF000000
      FF000000FF00FFFFFF00FF000000FF000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000084000000840000FFFFFF0000000000C6C6C60084000000840000008484
      8400C6C6C6008400000084000000C6C6C600840000008400000084848400C6C6
      C6008400000084000000C6C6C600000000000000000000000000000000000000
      000000000000FFFFFF000000FF000000FF000000FF000000FF00FFFFFF000000
      0000848484000000000000000000000000000000000000F70000000000000000
      000000DE0000000000000000000000DE0000000000000000000000DE00000000
      00000000000000BD000000A500000000000000000000FFFFFF00FFFFFF000000
      FF000000FF00FFFFFF00FF000000FF000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000084000000840000FFFFFF00000000000000000084000000840000000000
      0000000000008400000084000000000000008400000084000000848484000000
      0000840000008400000000000000000000000000000000000000000000000000
      00000000000000FFFF000000FF00FFFFFF00000000000000FF00FFFFFF000000
      0000848484000000000000000000000000000000000039FF3900000000000000
      000000DE0000000000000000000000DE0000000000000000000000DE00000000
      00000000000000BD000000A500000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FF000000FF000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000084000000840000FFFFFF0000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C6008400000084000000C6C6C600840000008400000084848400C6C6
      C6008400000084000000C6C6C600000000000000000000000000000000000000
      0000000000000000FF000000FF00FFFFFF00000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000E7000000F7000000B5
      000000D6000000B5000000B5000000B5000000B5000000B5000000B50000009C
      0000009C0000006B0000004A00000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FF000000FF000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000008400000084000000000000008400000084000000848484000000
      0000840000008400000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000FFFF00FFFFFF0000000000FFFFFF00000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FF000000FF000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600840000008400000084848400C6C6
      C600C6C6C600C6C6C600C6C6C6000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      00000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
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
      0000840000008400000084000000840000008400000084000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000073CE
      FF00009CEF000084CE0031313100636363004A4A4A0021212100009CEF00009C
      EF000084CE00000000000000000000000000000000000000000094000000FF94
      9400FF949400FF949400FF949400FF949400FF949400FF949400FF949400FF94
      9400940000000000000000000000000000000000000000000000000000008400
      000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000ADE7
      FF0073CEFF0042BDFF004A4A4A00636363004A4A4A003131310018B5FF00009C
      EF000084CE000000000000000000000000000000000000000000FFFFFF00FFB5
      B500FFB5B500FFB5B500FFB5B500FFB5B500FFB5B500FFB5B500FFB5B500FFB5
      B500FF9494000000000000000000000000000000000000000000840000008400
      000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008400
      0000840000008400000000000000000000000000000000000000000000000000
      00000000CE0000000000000000000000000000000000000000000000CE000000
      000000000000000000000000000000000000000000000000000000000000ADE7
      FF0073CEFF0042BDFF004A4A4A00636363004A4A4A003939390018B5FF00009C
      EF000084CE000000000000000000000000000000000000000000FFFFFF00FFE7
      E700FFCECE00FFCECE000000000000000000FFFFFF00FFCECE00FFCECE00FFB5
      B500FF9494000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000FFFFFF00FFFFFF00FFFFFF00840000008400
      0000840000008400000000000000000000000000000000000000000000008484
      FF005252FF000000CE000000000000000000000000000000CE001818FF000000
      AD0000000000000000000000000000000000000000000000000000000000ADE7
      FF0073CEFF0042BDFF004A4A4A00636363004A4A4A004A4A4A0018B5FF00009C
      EF000084CE000000000000000000000000000000000000000000FFFFFF00FFE7
      E700FFCECE0000000000FFFFFF00FFCECE00FFCECE00FFCECE00FFCECE00FFB5
      B500FF9494000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000FFFFFF00FFFFFF00FFFFFF00840000008400
      0000840000008400000084000000000000000000000000000000000000000000
      00008484FF005252FF000000CE00000000000000F7001818FF006B6BFF000000
      000000000000000000000000000000000000000000000000000000000000ADE7
      FF0073CEFF0042BDFF004A4A4A00525252004A4A4A004A4A4A0018B5FF00009C
      EF000084CE000000000000000000000000000000000000000000FFFFFF00FFE7
      E700FFCECE0000000000FFFFFF00FFCECE00FFCECE00FFFFFF00FFCECE00FFB5
      B500FF9494000000000000000000000000008400000084000000840000008400
      0000840000008400000084000000FFFFFF00FFFFFF00FFFFFF00840000008400
      0000840000008400000084000000000000000000000000000000000000000000
      0000000000008484FF005252FF000000F7001818FF006B6BFF00000000000000
      000000000000000000000000000000000000000000000000000000000000ADE7
      FF0073CEFF0042BDFF0018B5FF004A4A4A004A4A4A0018B5FF0018B5FF00009C
      EF000084CE000000000000000000000000000000000000000000FFFFFF00FFE7
      E700FFCECE000000000000000000FFFFFF00FFFFFF0000000000FFFFFF00FFB5
      B500FF9494000000000000000000000000008400000084000000840000008400
      0000840000008400000084000000FFFFFF00FFFFFF00FFFFFF00840000008400
      0000840000008400000084000000000000000000000000000000000000000000
      000000000000000000008484FF005252FF001818FF0000000000000000000000
      000000000000000000000000000000000000000000000000000018B5FF000000
      0000ADE7FF0073CEFF0042BDFF0018B5FF0018B5FF0018B5FF00009CEF000084
      CE0000000000008CD60000000000000000000000000000000000FFFFFF00FFE7
      E700FFCECE00FFCECE0000000000000000000000000000000000FFFFFF00FFB5
      B500FF9494000000000000000000000000008400000084000000840000008400
      0000840000008400000084000000FFFFFF00FFFFFF00FFFFFF00840000008400
      0000840000008400000084000000000000000000000000000000000000000000
      0000000000008484FF005252FF005252FF005252FF000000F700000000000000
      00000000000000000000000000000000000000000000000000000000000018B5
      FF0000000000ADE7FF0073CEFF0042BDFF0018B5FF00009CEF000084CE000000
      0000008CD6000000000000000000000000000000000000000000FFFFFF00FFE7
      E700FFCECE00FFCECE00FFCECE00000000000000000000000000FFFFFF00FFB5
      B500FF9494000000000000000000000000008400000084000000840000008400
      0000840000008400000084000000FFFFFF00FFFFFF00FFFFFF00840000008400
      0000840000008400000084000000000000000000000000000000000000000000
      00008484FF005252FF008484FF00000000008484FF005252FF000000F7000000
      0000000000000000000000000000000000000000000000000000000000000000
      000018B5FF0000000000ADE7FF0042BDFF0018B5FF000073AD0000000000008C
      D600000000000000000000000000000000000000000000000000FFFFFF00FFE7
      E700FFCECE00FFCECE0000000000000000000000000000000000FFFFFF00FFB5
      B500FF9494000000000000000000000000000000000084000000840000008400
      000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00840000008400
      0000840000008400000084000000000000000000000000000000000000008484
      FF005252FF008484FF000000000000000000000000008484FF005252FF000000
      CE00000000000000000000000000000000000000000000000000000000000000
      00000000000018B5FF0000000000ADE7FF0031BDFF000000000000A5F7000000
      000073CEFF000000000000000000000000000000000000000000FFFFFF00FFE7
      E700FFE7E700FFE7E700FFE7E700FFE7E700FFE7E700FFE7E700FFE7E700FFB5
      B500FF9494000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000000000000000000000000000000000000000
      0000BDBDFF0000000000000000000000000000000000000000008484FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000018B5FF00000000000000000000A5F700000000000000
      000073CEFF000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00940000000000000000000000000000000000000084000000840000008400
      00008400000084000000FFFFFF00FFFFFF00FFFFFF0084000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000042BDFF0000A5F70000000000000000000000
      000073CEFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      00008400000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      00008400000084000000FFFFFF00FFFFFF00FFFFFF0084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000008400000084000000000000000000
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
      0000000000000000000000000000FFFFFF00000000003163CE00737373008C8C
      8C008C8C8C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C008C8C8C008C8C
      8C008C8C8C003163CE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5
      A5008C8C8C008C8C8C0063636300000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000063FF00ADADAD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00CECECE000063FF0000000000000000000000000000000000007BDE00007B
      DE00007BDE00007BDE00007BDE00007BDE00007BDE00007BDE00007BDE0000FF
      FF000000000000000000000000000000000000000000FFFFFF00C6C6C6004242
      420042424200C6C6C600E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700E7E7E700C6C6C6007B7B7B00000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000CEFF00BDBDBD00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00009CFF000000000000000000000000000042B5000000000000D6
      FF0000BDFF0000BDFF0000BDFF0000BDFF0000BDFF0000BDFF0000BDFF0000AD
      FF0000FFFF0000000000000000000000000000000000FFFFFF0042424200DEDE
      00004242420042424200E7E7E7004242420042424200424242006B6B6B00B5B5
      B50042424200E7E7E7008C8C8C00000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000000000000063FF00BDBDBD00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE000063FF000000000000000000000000000094F700004ABD000000
      000000EFFF0000D6FF0000D6FF0000D6FF0000D6FF0000D6FF0000D6FF0000DE
      FF0000D6FF0000FFFF00000000000000000000000000FFFFFF0042424200DEDE
      0000DEDE000042424200E7E7E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7
      E700E7E7E700E7E7E7008C8C8C00000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      000000000000FFFFFF000000000000000000000000000063FF00CECECE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00FFFFFF00009CFF0000000000000000000000000000ADFF0000A5FF00008C
      EF000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF004AFFFF000000000000000000FFFFFF00C6C6C6004242
      420042424200C6C6C600E7E7E7004242420042424200424242006B6B6B00B5B5
      B50042424200E7E7E7008C8C8C00000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      0000FFFFFF00000000000000000000000000000000000063FF00CECECE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00009CFF0000000000000000000000000000C6FF0000EFFF0000D6
      FF0000BDFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7
      E700E7E7E700E7E7E7008C8C8C00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000000000000000000000000000000000000000000063FF00CECECE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00009CFF0000000000000000000000000000C6FF0000EFFF0000FF
      FF0000FFFF0000D6FF0000D6FF0000D6FF0000D6FF0000D6FF0000D6FF0000FF
      FF006BFFFF0000000000000000000000000000000000FFFFFF00C6C6C6004242
      420042424200C6C6C600E7E7E7004242420042424200424242006B6B6B00B5B5
      B50042424200E7E7E7008C8C8C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000000000000000000000063FF00009CFF00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00BDBDBD00BDBD
      BD00BDBDBD00009CFF0000000000000000000000000000C6FF0000EFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0021FF
      FF006BFFFF0000000000000000000000000000000000FFFFFF004242420000FF
      000000FF000042424200E7E7E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7
      E700E7E7E700E7E7E7008C8C8C00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000000000000000000000000000000000000000000063FF00009CFF0000CE
      FF0000CEFF0000CEFF0000CEFF003163CE003163CE0063CEFF0000CEFF0000CE
      FF0000CEFF00009CFF0000000000000000000000000000C6FF0000EFFF0000FF
      FF0000FFFF0000FFFF006BFFFF006BFFFF006BFFFF006BFFFF006BFFFF006BFF
      FF000000000000000000000000000000000000000000FFFFFF00424242004242
      420000FF000042424200E7E7E7004242420042424200424242006B6B6B00B5B5
      B50042424200E7E7E7008C8C8C00000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF000000000000000000FFFF
      FF0000000000000000000000000000000000000000000063FF0000CEFF009CCE
      FF0063CEFF0073737300636363006363630052525200424242004242420000CE
      FF00009CFF000063FF0000000000000000000000000000C6FF0000FFFF0000FF
      FF0000FFFF00FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00C6C6C6004242
      420042424200C6C6C600E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700E7E7E700E7E7E7008C8C8C00000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      000000000000FFFFFF000000000000000000000000000063FF009CCEFF0000CE
      FF00009CFF00BDBDBD00BDBDBD00BDBDBD00BDBDBD0000CEFF00BDBDBD004242
      42000063FF000063FF00000000000000000000000000000000006BFFFF006BFF
      FF006BFFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5B5B500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B5B5B5008C8C8C00000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      00000000000000000000FFFFFF000000000000000000009CFF009CCEFF000063
      FF000063FF00CECECE00DEDEDE00FFFFFF00CECECE00009CFF00CECECE005252
      52000063FF00009CFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005A5A5A005A5A5A005A5A
      5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A
      5A005A5A5A005A5A5A005A5A5A00000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00000000000063FF0063CEFF000063
      FF000063FF00DEDEDE00EFEFEF00EFEFEF00DEDEDE000063FF00DEDEDE006363
      630000CEFF000063FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000CEFF0031CEFF000063
      FF000063FF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF007373
      73000063FF0000CEFF0000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000084840000CED6D600CED6D6000000000084840000000000000000
      00000000000000000000000000008484840000000000FFFFF700FFCE8400FFBD
      4A00FFB54200FFB54200FFB54200FFA53900FFA53900FFA53900FF943900FF39
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000CED6D600CED6D600CED6D600CED6D600A56B3900848400000000
      00000000000084000000CED6D6008484840000000000FFFFFF00FFF7CE00FFF7
      CE00FFF7CE00FFF7CE00FFF7CE00FFEFCE00FFDEBD00FFDEBD00FFA53900FF7B
      5200FF3900000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000084848400000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000008484
      0000CED6D600CED6D600CED6D600CED6D600CED6D600CED6D600000000008484
      000000000000CED6D600000000000000000000000000FFFFFF00FFF7D600FFF7
      D600FFF7D600FFF7D600FFF7D600FFFFDE000000FF000000FF00FFBD4A00FF8C
      6B00FF6B4200FF39000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000000000000000000000000084840000CED6
      D600CED6D600CED6D6008484840000000000CED6D600CED6D600CED6D6000000
      0000CED6D60084848400000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFE7BD00FF94
      6B00FF7B5A00FF39080000000000000000000000000000000000FFFFFF000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000000000000000000000000000000000000000008484000000000000CED6
      D600CED6D6000000000000000000CED6D6008484840000000000A56B3900CED6
      D600000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700FFFFFF00FFE7
      BD00FF845A00FF39100000000000000000000000000000000000FFFFFF008484
      840000000000FFFF0000000000000000000000000000FFFFFF00000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000CED6D600CED6
      D600CED6D600CED6D600CED6D60084848400A56B3900F7FFFF00F7FFFF00A56B
      390000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFAD4200FF39100000000000000000000000000000000000FFFFFF000000
      0000FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF00000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000000000000000000000000000000000000000000000000000000000CED6
      D60000000000CED6D600CED6D60000000000F7FFFF00A56B3900A56B3900F7FF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700ADADAD000000
      0000FFB59400FF39100000000000000000000000000000000000FFFFFF000000
      0000FFFFFF0000000000000000000000000000000000FFFFFF00000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CED6D600CED6D600CED6D600A56B3900F7FFFF00A56B3900F7FFFF00C6DE
      C600000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700CECECE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF0000FFFFFF00FFFF0000FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CED6D600CED6D60000000000CED6D600C6DEC600F7FFFF00C6DEC600CED6
      D600000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700F7F7F7000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000848484000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CED6D600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700CECE
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CED6D6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700F7F7
      F700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000848484000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000FF0000000000000000000000000000000000
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
      0000000000000000000000000000000000004242420021212100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400ADADAD00949494009494
      9400949494009494940094949400949494009494940094949400949494009494
      94007B7B7B000808080000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000021212100006BD600424242002121
      2100000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00FFFFFF00FFFFFF00D6D6D600D6D6D600D6D6D600D6D6
      D600949494000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009CDEFF000084D6000084D6000084D6000084D6000084D600005A94000000
      0000000000000000000000000000000000002121210052C6FF000873A500007B
      C60029292900212121005A5A5A005A5A5A005A5A5A004A4A4A00424242004242
      42002929290000000000000000000000000084848400FFFFFF00EFEFEF00EFEF
      EF00EFEFEF00FFFFFF006B6B6B0008080800EFEFEF00D6D6D600CECECE00CECE
      CE00949494000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084D6FF0039BDFF0039BDFF0039BDFF0039BDFF0039BDFF000084D6000000
      000000000000000000000000000000000000000000002121210084D6FF000094
      DE000873A500006BB50042424200212121006B6B6B006B6B6B006B6B6B005A5A
      5A004A4A4A0031313100000000000000000084848400FFFFFF00EFEFEF00EFEF
      EF00FFFFFF006B6B6B00D6D6D6008C8C8C0008080800EFEFEF00CECECE00CECE
      CE00949494000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF0000000000000000FF000000FF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009CDEFF0039BDFF0039BDFF0039BDFF0039BDFF0039BDFF000084D6000000
      000000000000000000000000000000000000000000000000000021212100BDE7
      FF000094DE000894DE000873A50008639C004242420021212100848484008484
      84005A5A5A0042424200000000000000000084848400FFFFFF00EFEFEF00FFFF
      FF006B6B6B00D6D6D600D6D6D600D6D6D6008C8C8C0008080800EFEFEF00CECE
      CE00949494000808080000000000000000000000000000000000000000000000
      000000000000FF000000FF0000000000000000FF000000FF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00EFF7FF009CDEFF00ADDEFF009CDEFF00ADDEFF000084D6000000
      0000000000000000000000000000000000000000000000000000ADADAD002121
      2100BDE7FF00189CE700189CE70021A5E7000873AD0010638C00424242002121
      21006B6B6B0042424200000000000000000084848400FFFFFF00FFFFFF006B6B
      6B00EFEFEF00E7E7E700E7E7E700D6D6D600D6D6D6008C8C8C0008080800CECE
      CE00949494000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF0000000000000000FF000000FF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000ADADAD009494
      940021212100BDE7F70031ADEF0031ADEF0042B5F70031ADEF000873B5000852
      8400212121004A4A4A00000000000000000084848400FFFFFF006B6B6B00EFEF
      EF00EFEFEF00EFEFEF00E7E7E700D6D6D600D6D6D600D6D6D6008C8C8C000808
      0800CECECE000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF0000000000000000FF000000FF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C6009494
      940021212100000000005ABDEF004AB5F7004AB5F70042B5F70021A5E7000873
      B500212121005A5A5A0000000000000000008484840094949400FFFFFF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00E7E7E700D6D6D60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF000000FF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C6002121
      21005AB5E70073BDF700189CEF0063BDFF0063BDFF00085A8C00424242000000
      00006B6B6B005A5A5A0000000000000000006B6B6B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF000000FF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C6002121
      2100B5DEF700F7FFFF0094D6FF0094D6FF0063C6FF0052BDFF00085284004242
      42006B6B6B005A5A5A000000000000000000000000006B6B6B006B6B6B006B6B
      6B006B6B6B006B6B6B006B6B6B006B6B6B000000000000000000000000000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DEDEDE009494
      94002121210042424200D6D6D600DEDEDE0094D6FF0094D6FF0063C6FF00006B
      AD00424242005A5A5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DEDEDE009494
      940084848400848484002121210042424200D6D6D600DEDEDE0094D6FF0094D6
      FF00005A9C004242420000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00CECECE00CECECE00DEDEDE00ADADAD0094949400949494005252
      5200000000000000000000000000000000000000000000000000FFFFFF009494
      9400949494009494940094949400949494002121210042424200C6D6EF00D6EF
      FF0063C6FF00006BAD0042424200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0052FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00EFEFEF00CECECE00ADADAD00ADADAD0073737300525252000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00DEDEDE00C6C6C600C6C6C600C6C6C600C6C6C600ADADAD00212121004242
      4200DEDEDE00D6EFFF00006BAD00424242000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000021212100EFEFEF007B7B7B006B6B6B0031313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00002121210042424200D6EFFF00424242000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000021212100424242000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400000000008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007B7B7B00000000009494940094949400949494009494
      9400949494009494940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C6000000
      0000000000000000000000000000C6C6C6000000000000000000848484000000
      000000000000000000000000000000000000000000000000000000000000085A
      A500002952000000000000000000000000000000000000000000000000000029
      5200085AA50000000000000000000000000000000000000000004A4A4A000000
      0000E7520000E7520000FF732900FF9452000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF00FFFF
      FF0000FFFF0000FFFF000000000000FFFF0000FFFF00FFFFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000FF0000000000000000000000
      840000008400000084000000FF00000000000000FF0000008400000000008484
      8400000000000000000000000000000000000000000000000000085A9C000873
      C60000295200084A8C0000000000000000000000000000000000084A8C000029
      52000873C600085A9C000000000000000000000000004A4A4A0000000000E794
      0000E7730000E77300008CFF180000000000FFB53900FFA51000FFA51000FFA5
      1000FFA51000EF8C000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      8400000084000000840000008400000084000000000000000000000000000000
      00000000000000000000000000000000000000000000085A9C0000000000ADDE
      FF0000427300086BBD0000000000313131003131310000000000086BBD000042
      7300ADDEFF0000000000085A9C00000000000000000000000000E7940000E794
      0000E7940000E79400008CFF180000000000FFFFF700FFCE7B00FFBD4A00FFBD
      4A00FFBD4A00FFA5100000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000008400FFFF
      000084848400FFFF0000FFFF0000FFFF0000000000000000FF000000FF000000
      000084848400000000000000000000000000002139000873D600219CEF0084C6
      F700085294001094EF00000000004A4A4A004A4A4A00000000001094EF000852
      940084C6F700219CEF000873D6000021390000000000E7BD9C00E7BD9C00E79C
      0000E79C0000E79C000094FF420000000000FFFFF700FFDEA500FFCE7B00FFBD
      4A00FFBD4A00FFA5100000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000000000FFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400C6C6C600000000000000000000294A0052ADEF0000000000FFFF
      FF000863AD0042A5F700000000006B6B6B006B6B6B000000000042A5F7000863
      AD00FFFFFF000000000052ADEF0000294A0000000000E7BD9C00E7BD9C00E79C
      0000E79C00006BEFB50094FF420000000000FFFFF700FFDEA500FFDEA500FFCE
      7B00FFBD4A00FFA5100000000000000000000000000084000000840000008400
      00008400000000FF000000FF0000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400C6C6C600C6C6C6000000000008396300B5D6F7009CD6F700D6EF
      FF000873C6006BB5F700000000006B6B6B006B6B6B00000000006BB5F7000873
      C600D6EFFF009CD6F700B5D6F7000839630000000000E7BD9C00E7A500006BF7
      00006BF700006BF7000094FF420000000000FFFFFF00FFFFF700FFFFF700FFFF
      F700FFE7B500FFB5390000000000000000000000000084000000840000008484
      84008400000000FF000084000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400C6C6C600C6C6C6000000000008426300C6DEF70000000000FFFF
      FF000873C6006BB5F700000000006B6B6B006B6B6B00000000006BB5F7000873
      C600FFFFFF0000000000C6DEF7000842630000000000E7BD9C00E7A500006BF7
      00006BF700006BF700006BF70000D6FFAD000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      000000FF00008400000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008484840000FFFF0000000000FFFFFF00FFFFFF000000000000FFFF008484
      840084848400C6C6C600C6C6C6000000000008396300B5D6F7009CD6F700D6EF
      FF000873C6006BB5F700000000008484840084848400000000006BB5F7000873
      C600D6EFFF009CD6F700B5D6F7000839630000000000E7BD9C00E7BD9C00CE6B
      00006BF700006BF700006BF7000084FF1800FF84000094FF420094FF4200DE73
      0000C65A0000FF7B29006B6B6B000000000000000000840000008400000000FF
      000000FF000000000000000000008484840000000000C6C6C600000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000FFFFFF00FFFFFF000000000000FFFF008484
      840084848400C6C6C600848484000000000000315A00C6E7FF0000000000FFFF
      FF000863AD0042A5F7000000000094949400949494000000000042A5F7000863
      AD00FFFFFF0000000000C6E7FF0000315A0000000000E7D6FF00E7BD9C006BDE
      0000CE6B0000CE6B00006BD673006BD67300CE6B00006BF700006BF700006BF7
      00006BDE00009C3900000000000000000000000000008400000000FF00008400
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400848484008484
      84008484840084848400848484000000000000214200A5CEF70052B5F70084C6
      F700085294001094EF00000000009494940094949400000000001094EF000852
      940084C6F70052B5F700A5CEF7000021420000000000E7EFFF00E7CEFF00E794
      00006BF700006BD673006BD67300AD5A00006BD67300AD5A00006BF700006BF7
      00006BDE0000BD39000000000000000000000000000084000000840000000000
      00000000000000000000000000000000000000000000C6C6C600FFFFFF00C6C6
      C60000000000008484000000000000000000000000000000000000000000C6C6
      C600C6C6C600C6C6C600C6C6C6008484840084848400C6C6C600C6C6C600C6C6
      C600000000008484840000000000000000000000000073BDF70000000000FFFF
      FF00084A8400106BCE0000000000949494009494940000000000106BCE00084A
      8400FFFFFF000000000073BDF700000000000000000000000000E7E7FF009CEF
      FF006BF700006BF700006BF700006BF700006BF700006BF700006BF700006BF7
      0000BD4200000000000000000000000000000000000084000000000000000000
      0000000000000000000000000000000000008484840000000000C6C6C6000000
      000000FFFF008400000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C6000000000000FFFF0000000000C6C6C600C6C6C6000000
      000084848400848484008484840000000000000000000000000073B5F7005AB5
      F70008427B00106BCE0000000000000000000000000000000000106BCE000842
      7B005AB5F70073B5F7000000000000000000000000004A4A4A0000000000E7EF
      FF009CEFFF006BF700006BF700006BF700006BF700006BF700006BF700006BBD
      0000000000004A4A4A0000000000000000000000000084000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000FFFF0000FFFF0000848400000000000000000000000000000000000000
      000000000000C6C6C600C6C6C60000000000C6C6C600C6C6C600000000008484
      84008484840084848400000000000000000000000000000000000000000084BD
      F700005294000000000000000000000000000000000000000000000000000052
      940084BDF70000000000000000000000000000000000000000004A4A4A000000
      0000E7EFFF00E7EFFF00E7A500008CF78C0084DE310084DE31006BD600000000
      00004A4A4A000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF00FFFFFF0000FFFF00840000000000000000000000000000000000
      00000000000084848400C6C6C600C6C6C600C6C6C60000000000848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF00FFFFFF0000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000C6C6C6000000000084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000F7F70000F7F7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000F7F70008FFFF0000F7F7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000808080008080800313131000808080008080800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000F7F70008FFFF0073FFFF0000F7F7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008C8C8C00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600A5A5A500A5A5A5006B6B6B00000000000000000000000000000000000000
      000000000000D6F7FF00D6F7FF0000000000D6F7FF00D6F7FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000008FFFF0073FFFF0073FFFF0000F7F7000000000000000000000000000000
      000084848400C6C6C60000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00CECECE00F7F7
      F70000840000F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700CECECE007B7B7B00000000000000000000000000000000000000
      000000000000000000004AFF7B0000631800008C290000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000633900000000
      000073FFFF0073FFFF00B5FFFF0000F7F70000000000000000000000000000FF
      FF00008484000000000084848400C6C6C6000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00F7F7F7000084
      000000630000F7F7F70000730000F7F7F70000730000F7F7F700F7F7F700F7F7
      F70000000000FFFFFF0094949400000000000000000000000000000000000000
      0000000000000000000000EF390000CE3100008C290000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063390000A56300000000
      000073FFFF00B5FFFF00B5FFFF0000F7F7000000000000000000000000000000
      000000FFFF0000FFFF00000000000000000084848400C6C6C600000000000000
      00000000000000000000000000000000000000000000FFFFFF00008400000084
      000000840000008400000084000000840000008400000084000000630000F7F7
      F700F7F7F700F7F7F70094949400000000000000000000000000000000000000
      0000D6F7FF000052180084FFA50052FF7B0000C6390000521800D6F7FF000000
      000000000000000000000000000000000000000000008C520000AD630000AD63
      0000AD630000AD630000AD630000AD630000000000009C630000C67B00000000
      0000B5FFFF00B5FFFF00B5FFFF0000F7F7000000000000000000000000000000
      00000000000000FFFF0000FFFF00008484000000000000000000848484000000
      00000000000000000000000000000000000000000000FFFFFF0000EF00000084
      00000084000000EF00000084000000CE00000073000000630000F7F7F700F7F7
      F70000000000FFFFFF0094949400000000000000000000000000000000000000
      000084FFA50084FFA50084FFA50052FF7B0000C6390000C6390000C639000000
      00000000000000000000000000000000000000000000FFA51000FFA51000FFA5
      1000FFA51000FFA51000FFA51000FFA5100000000000FF940000EF8C00000000
      0000B5FFFF00B5FFFF00B5FFFF0000F7F7000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF0000FFFF0000000000000000008484
      84000000000000000000000000000000000000000000FFFFFF00F7F7F70000CE
      000000630000F7F7F70000B50000F7F7F70000840000F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F70094949400000000000000000000000000000000000000
      00000000000084FFA50084FFA50052FF7B0000C6390000C63900000000000000
      00000000000000000000000000000000000000000000FFFFF700FFE7B500FFE7
      B500FFE7B500FFE7B500FFE7B500FFE7B50000000000FFAD2100FFA510000000
      0000B5FFFF00B5FFFF00B5FFFF0000F7F7000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000FFFF00000000000000
      0000C6C6C60000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF0000B50000FFFFFF00FFFFFF00FFFFFF0000CE0000FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0094949400000000000000000000000000000000000000
      0000000000000808080084FFA50084FFA50000C6390008080800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFD69400FFA510000000
      0000B5FFFF00B5FFFF00B5FFFF0000F7F7000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF0000FFFF000000000000000000C6C6
      C6000000000000000000000000000000000000000000E7E7E700DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00CECECE00DEDEDE00CECE
      CE00F7F7F700CECECE0000000000000000000000000000000000000000000000
      0000000000000000000008080800080808000808080000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFC66B000000
      0000F7FFFF00B5FFFF00B5FFFF0000F7F7000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000FFFF00000000000000
      0000C6C6C600000000000000000000000000000000008C8C8C005A5A5A005A5A
      5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A
      5A005A5A5A005A5A5A005A5A5A00000000000000000000000000000000000000
      000000000000080808008CB5FF008CB5FF008CB5FF0008080800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7FFFF00F7FFFF00B5FFFF0000F7F7000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF000000
      000000000000C6C6C6000000000000000000000000005A5A5A00A5A5A500C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600DEDEDE00C6C6C600DEDEDE00C6C6
      C600DEDEDE00CECECE005A5A5A00000000000000000000000000000000000000
      00000000000008080800D6E7FF00D6E7FF008CB5FF0008080800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000F7F700F7FFFF00F7FFFF0000F7F7000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF000000000000000000C6C6C60000000000000000005A5A5A008C8C8C00A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A50000000000A5A5A50000000000A5A5
      A50000000000A5A5A5005A5A5A00000000000000000000000000000000000000
      00000000000008080800D6E7FF00D6E7FF008CB5FF0008080800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000F7F700F7FFFF0000F7F7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005A5A5A005A5A5A005A5A
      5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A
      5A005A5A5A005A5A5A005A5A5A00000000000000000000000000000000000000
      0000000000000000000008080800080808000808080000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000F7F70000F7F7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000F7F7000000000000000000000000000000
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
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000424242004242420000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084E7FF004AD6FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004242420042424200EF9C9400BD4A630039393900000000000000
      00000000000000000000000000000000000000000000A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A5009C9C9C009C9C9C00949494008C8C8C008C8C8C008C8C
      8C008C8C8C008C8C8C0063636300000000000000000000000000000000000000
      0000848484008484840084848400848484000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000073DEFF001010100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004242
      420042424200EF9C9400FFCEAD00FFCEAD00CE636B00BD4A6300393939000000
      00000000000000000000000000000000000000000000FFFFFF00E7E7E7005252
      520052525200C6C6C600FFFFFF00FFFFFF00E7E7E700E7E7E700737373000000
      000000000000000000007B7B7B00000000000000000000000000C6C6C600C6C6
      C60000000000000000000000000000000000C6C6C60000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000073DEFF0008ADDE0000000000000000000000
      00000000000000000000000000000000000000000000000000004A4A4A00EF9C
      9400FFCEAD00FFCEAD00FFCEAD00FFCEAD00CE636B00CE636B00BD4A5A003939
      39000000000000000000000000000000000000000000FFFFFF00636363000000
      0000000000004A4A4A00393939006B6B6B006B6B6B0000000000FFFFFF00A5A5
      A50000000000000000008C8C8C000000000000FF000000FF0000000000000000
      000000840000008400000084000000FF00000000000000FF0000008400000000
      0000848484000000000000000000000000000000000000000000000000000000
      000000000000000000000000000073DEFF000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004A4A4A00FFCE
      AD00FFCEAD00FFCEAD00FFCEAD00FFCEAD00D6737B00CE636B00CE636B00C642
      63003939390000000000000000000000000000000000FFFFFF0073737300FFFF
      FF0000E7E7004A4A4A00FFFFFF00FFFFFF00E7E7E700E7E7E700E7E7E700E7E7
      E700BDBDBD00000000008C8C8C00000000000000000000000000000000000000
      0000008400000084000000840000008400000084000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000073DEFF0021CEFF0000000000000000000000
      00000000000000000000000000000000000000000000000000004A4A4A00FFCE
      AD00FFCEAD00FFCEAD00FFCEAD00FFCEAD00DE7B7B00D6737B00CE636B00CE6B
      7B003939390000000000000000000000000000000000FFFFFF00737373000000
      0000000000004A4A4A00393939006B6B6B006B6B6B0000000000FFFFFF000000
      0000FFFFFF00DEDEDE008C8C8C00000000000000000000000000008400000084
      0000FFFF000084848400FFFF0000FFFF0000FFFF00000000000000FF000000FF
      0000000000008484840000000000000000000000000000000000000000000000
      000000000000000000000000000073DEFF000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004A4A4A00FFCE
      AD00FFCEAD00FFCEAD00FFCEAD00DE7B7B00D6737B00E78C8400D6737B00DE84
      94003939390000000000000000000000000000000000FFFFFF0073737300FFFF
      FF0042FFFF004A4A4A00FFFFFF00FFFFFF00E7E7E700E7E7E700E7E7E700E7E7
      E700E7E7E700FFFFFF008C8C8C00000000000000000000000000000000000000
      00000000000000FF000000FF000000FF0000000000000000000000000000C6C6
      C600000000000000000084848400000000000000000000000000000000000000
      0000000000000000000073DEFF0018CEFF0000ADE700005A7300000000000000
      00000000000000000000000000000000000000000000000000004A4A4A00FFCE
      AD00FFCEAD00FFB59C00F7A59400FFFFE700FFFFCE00E78C8400E78C8400DE84
      94003939390000000000000000000000000000000000FFFFFF00737373000000
      0000000000004A4A4A00393939006B6B6B006B6B6B00C6C6C6006B6B6B004A4A
      4A00C6C6C600FFFFFF008C8C8C00000000000000000000000000000000000000
      FF000000FF0000000000000000000000840000008400000084000000FF000000
      00000000FF000000840000000000848484000000000000000000000000000000
      000000000000ADEFFF0018CEFF0000ADE70000ADE70000ADE700006B8C000000
      00000000000000000000000000000000000000000000000000004A4A4A00FFCE
      AD00FFB59C00FFFFE700FFFFE700FFFFE700FFFFE700FFFFCE00E78C8400E79C
      9C003939390000000000000000000000000000000000FFFFFF0073737300FFFF
      FF007BFFFF004A4A4A00FFFFFF00FFFFFF00E7E7E7006B6B6B00FFD68C00F794
      00004A4A4A00DEDEDE008C8C8C00000000000000000000000000000000000000
      0000000000000000000000000000000084000000840000008400000084000000
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000E7FFFF0018CEFF0000ADE70000ADE70000ADE700006B8C000000
      00000000000000000000000000000000000000000000000000004A4A4A00FFFF
      F700FFFFE700FFFFE700FFFFE700FFFFE700FFFFE700FFFFE700FFFFCE00E79C
      9C003939390000000000000000000000000000000000FFFFFF00737373000000
      0000000000004A4A4A00393939006B6B6B00E7E7E7006B6B6B00FFEFCE00FFBD
      52006B6B6B00DEDEDE008C8C8C00000000000000000000000000000000000000
      0000000000000000840000008400FFFF000084848400FFFF0000FFFF0000FFFF
      0000000000000000FF000000FF00000000000000000000000000000000000000
      000000000000FFFFFF0018CEFF000000000008526B0000ADE700006B8C000000
      0000000000000000000000000000000000000000000000000000000000004A4A
      4A00FFFFE700FFFFE700FFFFE700FFFFE700FFFFE700FFFFE700FFFFE700EFAD
      AD003939390000000000000000000000000000000000FFFFFF00CECECE005252
      520052525200C6C6C600E7E7E700E7E7E700E7E7E700C6C6C6006B6B6B006B6B
      6B00C6C6C600E7E7E7008C8C8C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0018CEFF000000000008424A0000ADE700005A73000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004A4A4A00FFFFE700FFFFE700FFFFE700FFFFE700E78C84004A4A4A004A4A
      4A000000000000000000000000000000000000000000B5B5B500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B5B5B5008C8C8C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0018CEFF0000ADE700006B8C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004A4A4A00FFFFE700E78C84004A4A4A004A4A4A00000000000000
      000000000000000000000000000000000000000000005A5A5A005A5A5A005A5A
      5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A
      5A005A5A5A005A5A5A005A5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A004A4A4A000000000000000000000000000000
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
      0000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005A5A5A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B57B00009C63000042290000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005A5A5A00FFFFC600FFCE
      8C00FFCE8400FFCE8C00FFCE8C00FFCE8400FFC68400FFC68400FFC67B00FFC6
      7B00FFBD7B00FF9C5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000FFB52100DE9400006B4A0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000000000000000000052100000D69C
      6B0052100000FFFFFF00FFD6A500FFD6A500FFD6A500FFD6A500FFD6A5005210
      0000B57B4A00AD7342000000000000000000000000005A5A5A00FFFFC600FFFF
      C600FFEFA500FFEFAD00FFEFAD00FFEFA500FFE7A500FFE7A500FFE79C00FFDE
      9C00FFDE9400F79C5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000FFB52100DE94000084520000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000052100000D69C6B00EFAD
      840052100000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFD6A5005210
      0000C68C5A009C6331000000000000000000000000005A5A5A00FFFFC600FFEF
      A500000000000000000000000000000000000000000000000000000000000000
      0000FFD69400EF9C5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000FFC65200DE94000084520000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000052100000EFAD8400EFAD
      8400521000006321000063210000632100006321000063210000632100005210
      0000C68C5A00AD7342000000000000000000000000005A5A5A00FFFFC600FFE7
      A500FFE7A500FFE7A500FFE7A500FFE7A500FFE79C00FFDE9C00FFDE9400FFD6
      9400FFD69400DE9C520000000000000000000000000000000000000000000000
      0000000000000000000000000000FFD68400DE9400009C630000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000052100000FFBD9400FFBD
      9400D69C6B00D69C6B00D69C6B00D69C6B00D69C6B00D69C6B00D69C6B00D69C
      6B00D69C6B00BD7B52000000000000000000000000005A5A5A00FFFFC600FFE7
      A500000000000000000000000000000000000000000000000000000000000000
      0000FFCE8C00D694520000000000000000000000000000000000000000000000
      0000000000000000000000000000FFD68400DE9400009C630000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000052100000F7BD8C00FFBD
      9400FFBD9400FFBD9400FFBD9400FFBD9400FFBD9400FFBD9400FFBD9400FFBD
      9400F7BD8C00AD7342000000000000000000000000005A5A5A00FFFFC600FFE7
      9C00FFDE9C00FFE79C00FFE79C00FFDE9C00FFDE9400FFD69400FFD69400FFCE
      8C00FFCE8C00CE94520000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000052100000F7BD8C008C52
      21008C5221008C5221008C5221008C5221008C5221008C5221008C5221008C52
      2100945A2900BD7B52000000000000000000000000005A5A5A00FFFFC600FFDE
      9C00000000000000000000000000000000000000000000000000000000000000
      0000FFCE8400C6944A0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7CECE0000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000052100000FFCE9C005210
      0000FFFFFF00FFD6AD00FFD6AD00FFD6AD00FFD6AD00FFD6AD00FFD6AD00FFD6
      AD00945A2900C6845A000000000000000000000000005A5A5A00FFFFC600FFDE
      9400FFD69400FFDE9400FFDE9400FFD69400FFD69400FFCE8C00FFCE8C00FFCE
      8400FFC68400BD8C4A0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7EFF70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF000000000000FFFF0000FFFF00000000000000000052100000FFDEAD005210
      0000FFFFFF00FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFD6
      AD008C4A2100CE9463000000000000000000000000005A5A5A00FFFFC600FFD6
      94000000000000000000000000000000000000000000FFCE8400FFCE8400FFC6
      8400FFC68400B58C4A0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7EFF70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF000000000000FFFF0000FFFF000000000000FFFF0000FF
      FF000000000000FFFF0000FFFF00000000000000000052100000FFEFBD005210
      0000FFFFFF00FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFD6
      AD008C4A2100DE9C73000000000000000000000000005A5A5A00FFFFC600FFD6
      9400FFCE8C00FFD69400FFD69400FFCE8C00FFCE8C00FFCE84004A4A4A004A4A
      4A004A4A4A004A4A4A000000000000000000000000000000000000000000736B
      6B009C8C8C00000000009C8C8C0031313100736B6B0031313100313131000000
      000000000000524A4A0000000000000000000000000000000000000000000000
      000000FFFF0000FFFF000000000000FFFF0000FFFF000000000000FFFF0000FF
      FF00000000000000000000FFFF00000000000000000052100000FFF7C6005210
      0000FFFFFF00FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFD6
      AD00844A18007B3908000000000000000000000000005A5A5A00FFFFC600FFCE
      8C000000000000000000000000000000000000000000FFC684004A4A4A00FFFF
      C600FFF7AD00FFCE8C000000000000000000000000000000000000000000C6BD
      BD00E7CECE00393131009C8C8C009C8C8C008C7B7B008C7B7B008C7B7B00736B
      6B0084737300CE9C9C00000000000000000000000000000000000000000000FF
      FF0000FFFF00000000000000000000FFFF0000FFFF000000000000FFFF0000FF
      FF00000000000000000000000000000000000000000052100000FFFFF7005210
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFCE
      A500844A1800FFCEA5000000000000000000000000005A5A5A00FFFFC600FFFF
      C600FFCE8400FFCE8C00FFCE8C00FFCE8400FFC68400FFC684004A4A4A00FFF7
      AD00FFCE8C004A4A4A000000000000000000000000000000000000000000FFFF
      FF00DED6D600DED6D600C6BDBD00E7CECE00E7CECE00CEB5BD00CEB5BD00CEB5
      BD00E7CECE0000000000000000000000000000000000000000000000000000FF
      FF0000FFFF00000000000000000000FFFF0000FFFF000000000000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000521000005210
      0000521000005210000052100000521000005210000052100000521000005210
      000052100000521000000000000000000000000000005A5A5A00FFFFC600FFFF
      C600FFFFBD00FFFFC600FFFFC600FFFFBD00FFFFBD00FFFFB5004A4A4A00FFCE
      8C004A4A4A00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF0000000000DED6D600DED6D600DED6D600DED6D600DED6D600DED6
      D600000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005A5A5A005A5A5A005A5A
      5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A004A4A4A004A4A
      4A00000000000000000000000000000000000000000000000000000000000000
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
      0000000029000000290000002900000029000000290000002900000029000000
      2900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840094949400ADAD
      AD0042424200A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5
      A5008C8C8C008C8C8C0052525200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      2900000029000063BD000063BD000063BD000063BD000063BD000063BD000000
      2900000029000000000000000000000000000000000000000000000000000000
      00000000000000000000D6840000E78C00000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000000000ADAD
      AD0042424200FFFFFF0000000000E7E7E70000000000E7E7E70000000000E7E7
      E70000000000E7E7E70063636300000000000000000000000000000000000000
      00000000000000000000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000029000000
      29004ABDFF004ABDFF004ABDFF004ABDFF004ABDFF004ABDFF0039B5FF00007B
      D600000029000000290000000000000000000000000000000000000000000000
      000000000000D6840000FF940000D68400000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400C6C6C600ADAD
      AD0042424200FFFFFF00E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700E7E7E700E7E7E7007B7B7B00000000000000000000000000000000000000
      0000FFFF0000FFFF0000FFFF0000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000029000000290084FF
      FF0073EFFF00BDFFFF00000000000000000000000000219CF70073EFFF0042B5
      FF00007BD6000000290000005A00000000000000000000000000000000000000
      0000D6840000FF940000FFAD2100D68400000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000000000ADAD
      AD0042424200FFFFFF0000000000E7E7E70000000000E7E7E70000000000E7E7
      E70000000000E7E7E7007B7B7B00000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000000000008484840000000000000000000000
      000000000000000000000000000000000000000029000000290084FFFF0073EF
      FF0073EFFF00BDFFFF00000000000000000000000000219CF70073EFFF0073EF
      FF0042B5FF00007BD6000000290000002900000000000000000000000000FFA5
      1000FF940000FFAD2100FFAD2100D68400000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400C6C6C600ADAD
      AD0042424200FFFFFF00E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700E7E7E700E7E7E7007B7B7B00000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000000000008484840000000000000000000000
      00000000000000000000000000000000000000002900DEFFFF0084FFFF0073EF
      FF0073EFFF0073EFFF0073EFFF0073EFFF0073EFFF0073EFFF0073EFFF0073EF
      FF0073EFFF0031ADFF000063BD0000002900000000000000000000000000FFC6
      6B00FFAD2100FFAD2100FFBD5200C67B00000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000000000ADAD
      AD0042424200FFFFFF0000000000E7E7E70000000000E7E7E70000000000E7E7
      E70000000000E7E7E7007B7B7B00000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000000000008484840000000000000000000000
      00000000000000000000000000000000000000002900DEFFFF0084FFFF0073EF
      FF0073EFFF00BDFFFF00000000000000000000000000219CF70063D6FF0073EF
      FF0073EFFF0042B5FF00007BD60000002900000000000000000000000000FFC6
      6300FFBD5200FFBD5200FFBD5200C67B00000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400C6C6C600ADAD
      AD0042424200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008C8C8C00000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000000000008484840000000000000000000000
      00000000000000000000000000000000000000002900DEFFFF0084FFFF0073EF
      FF0073EFFF00BDFFFF000000000000000000000000000000000000000000219C
      F70084FFFF0042B5FF00007BD60000002900000000000000000000000000FFC6
      6300FFBD5200FFBD5200FFBD5200C67B00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000000000008484840000000000000000000000
      00000000000000000000000000000000000000002900DEFFFF0084FFFF0073EF
      FF0073EFFF0073EFFF00BDFFFF00000000000000000000000000000000000000
      000042B5FF0042B5FF00007BD60000002900000000000000000000000000FFC6
      6B00FF940000FFAD2100FFBD5200C67B00000000000000000000000000000000
      00000000000000000000000000000000000000000000D6FFC60042FF000042FF
      000042FF000042FF000042FF000042FF000042FF000042FF000042FF000042FF
      000042FF000031DE000029BD0000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000000000008484840000000000000000000000
      00000000000000000000000000000000000000002900DEFFFF0084FFFF0073EF
      FF0084FFFF00A5FFFF00A5FFFF00BDFFFF00BDFFFF0000000000000000000000
      000042B5FF0042B5FF00007BD60000002900000000000000000000000000FFC6
      6B00D6840000FF940000FFAD2100D68400000000000000000000000000000000
      00000000000000000000000000000000000000000000D6FFC6000000000084FF
      5A000000000084FF5A0084FF5A0084FF5A000000000084FF5A0084FF5A0084FF
      5A0084FF5A0084FF5A0029BD0000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000000000008484840000000000000000000000
      00000000000000000000000000000000000000002900FFFFFF00A5FFFF00BDFF
      FF00000000000000000000000000BDFFFF00BDFFFF0000000000000000000000
      000042B5FF0042B5FF00007BD600000029000000000000000000000000000000
      0000FFC66B00D6840000D6840000D68400000000000000000000000000000000
      00000000000000000000000000000000000000000000E7FFDE00BDFFA5000000
      0000BDFFA50000000000BDFFA50000000000BDFFA50000000000BDFFA500BDFF
      A500BDFFA50084FF5A0029BD0000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000000000008484840000000000000000000000
      0000000000000000000000000000000000000000290000002900FFFFFF00BDFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000042B5FF00219CF70000002900000029000000000000000000000000000000
      000000000000FFC66B00D6840000D68400000000000000000000000000000000
      00000000000000000000000000000000000000000000E7FFDE00E7FFDE00E7FF
      DE00E7FFDE00E7FFDE0000000000E7FFDE00E7FFDE00E7FFDE00000000000000
      0000000000002184000029BD0000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000000000008484840000000000000000000000
      000000000000000000000000000000000000000000000000290000002900FFFF
      FF00BDFFFF00000000000000000000002900000000000000000000000000219C
      F7004ABDFF000000290000002900000000000000000000000000000000000000
      00000000000000000000FFC66B00FFD68C000000000000000000000000000000
      00000000000000000000000000000000000000000000E7FFDE00E7FFDE00E7FF
      DE00E7FFDE00E7FFDE00E7FFDE00E7FFDE00E7FFDE00E7FFDE00E7FFDE00E7FF
      DE00E7FFDE00E7FFDE0084FF5A00000000000000000000000000FFFF0000FFFF
      0000FFFF00000000000000000000848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000029000000
      2900FFFFFF0084FFFF0073EFFF0073EFFF0073EFFF0073EFFF0073EFFF004ABD
      FF00000029000000290000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C9C9C00848484007373
      7300737373007373730073737300737373007373730073737300737373007373
      7300737373007373730052525200000000000000000000000000FFFF0000FFFF
      0000000000008484840084848400848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      290000002900FFFFFF00DEFFFF00DEFFFF00DEFFFF00DEFFFF004ABDFF000000
      2900000029000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000029000000290000002900000029000000290000002900000029000000
      2900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5
      A500A5A5A5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000808080008080800080808000808080008080800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A5A5A50000000000000000000000000000000000000000000000
      0000FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00DEDEDE00BDBDBD00000000000000000000000000000000000000
      0000000000000000000084FFA50000C6390000C6390000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C9C9C007373
      73008484840084848400848484009494940094949400848484006B6B6B005A5A
      5A004242420000000000A5A5A500000000000000000000000000000000000000
      0000FFFFFF0000000000EFEFEF0000000000EFEFEF0000000000EFEFEF000000
      0000EFEFEF0000000000E7E7E700000000000000000000000000000000000000
      0000000000000000000084FFA50052FF7B0000C6390000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B5B5B5000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005A5A5A0000000000A5A5A500000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EFEFEF00000000000000000000000000000000000000
      0000000000000000000084FFA50052FF7B0000C6390000000000000000000000
      0000000000000000000000000000000000000000000000C6C60000C6C60000A5
      A500007B7B0000000000000000000000000000C6C60000C6C60000A5A500007B
      7B00000000000000000000000000000000000000000000000000B5B5B5000000
      0000DE8C0000DE8C0000DE8C00000000000000EFEF0000EFEF0000EFEF000000
      00005A5A5A0000000000A5A5A5000000000000000000008CEF00008CEF000000
      0000FFFFFF0000000000F7F7F70000000000F7F7F70000000000F7F7F7000000
      0000F7F7F70000000000EFEFEF00000000000000000000000000000000000000
      0000000000000808080084FFA50052FF7B0000C6390008080800000000000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF0000FF
      FF0000B5B500000000000000000000000000FFFFFF0000FFFF0000FFFF0000B5
      B500000000000000000000000000000000000000000000000000B5B5B5000000
      0000FFB52100FFA50000DE8C000000000000B5FFFF004AFFFF0000EFEF000000
      00005A5A5A0000000000A5A5A500000000000000000000C6FF0000D6FF000000
      0000DEDEDE00D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600D6D6D600D6D6D600EFEFEF00000000000000000000000000000000000000
      0000000000000808080084FFA50052FF7B0000C6390008080800000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF0084FF
      FF0000DEDE00000000000000000000000000FFFFFF00FFFFFF0084FFFF0000DE
      DE00000000000000000000000000000000000000000000000000B5B5B5000000
      0000FFB52100FFA50000DE8C000000000000B5FFFF004AFFFF0000EFEF000000
      00005A5A5A0000000000A5A5A500000000000000000000C6FF0000D6FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000808080084FFA50052FF7B0000C6390008080800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B5B5B5000000
      0000FFC65200FFB52100DE8C000000000000F7FFFF00B5FFFF0000EFEF000000
      00005A5A5A0000000000A5A5A500000000000000000000C6FF0000EFFF000000
      000021B5000021B5000021B5000021B5000021B5000021B5000021B5000021B5
      000021B5000021B5000021940000000000000000000000000000000000000000
      0000000000000808080084FFA50052FF7B0000C6390008080800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B5B5B5000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005A5A5A0000000000A5A5A500000000000000000000C6FF0000EFFF000000
      0000FFFFFF00CEFFBD009CFF84007BFF52007BFF520052FF210052FF210052FF
      210052FF210052FF210052FF2100000000000000000000000000000000000000
      000000000000000000000000000084FFA5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B5B5B5000000
      0000184AFF00184AFF00184AFF000000000039DE000039DE000039DE00000000
      00005A5A5A0000000000A5A5A500000000000000000000C6FF0000EFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000008080800080808000808080000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B5B5B5000000
      00007B9CFF004A73FF00184AFF000000000084FF52004AFF000039DE00000000
      00005A5A5A0000000000A5A5A500000000000000000000C6FF0000EFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0021FF
      FF006BFFFF000000000000000000000000000000000000000000000000000000
      000000000000080808006B6B6B005A5A5A004A4A4A0008080800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B5B5B5000000
      00007B9CFF004A73FF00184AFF000000000084FF52004AFF000039DE00000000
      00005A5A5A0000000000A5A5A500000000000000000000C6FF0000EFFF0000FF
      FF0000FFFF0000FFFF006BFFFF006BFFFF006BFFFF006BFFFF006BFFFF006BFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000008080800B5B5B5008C8C8C005A5A5A0008080800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B5B5B5000000
      00007B9CFF007B9CFF00184AFF0000000000D6FFBD0084FF520039DE00000000
      00005A5A5A0000000000A5A5A500000000000000000000C6FF0000FFFF0000FF
      FF0000FFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000008080800EFEFEF00B5B5B5006B6B6B0008080800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B5B5B5000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005A5A5A0000000000A5A5A5000000000000000000000000006BFFFF006BFF
      FF006BFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000008080800080808000808080000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D6D6D600C6C6
      C600BDBDBD00B5B5B500C6C6C600D6D6D600D6D6D600C6C6C600B5B5B500A5A5
      A5006B6B6B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300200000100010000000000801100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000008001FF03F00F83FF0000E001E0070000
      0000C001C00300000000800180010000000080010000C000000080010000C000
      000080010000C000000080010000C000000080010000C000000080010000C000
      000080010000C000000080010000E01F000080018001F80700008001C003FC00
      00008001E007FDE08001C003F00FFFF9C003FFFFF007E0078003FC01C4238001
      8003F001800180018001C0038001C0038001C0038001C00380018101C003F00F
      800183010180FC3F8001872103C0FC3FC00384E103C0FC3FC00380C10180F81F
      C0038081C003F81FC003C0038001F81FC003C0038001F81FC003800F8001F81F
      C003803FC423F83FC003FFFFFC3FFE7FFE07FE7FF9FFFFFFF003FE7FF07F0000
      C001FC3FF01F00000000FC3FE00F00000000F81FE00700000000F81FE0C70000
      0000F00FF8F700000000F00FFE7F00000000E007C61F00000000E007E1070000
      0000E007E00700000001E007F0070000C00FE007F80F0000F00FE007FF9F0000
      FE0FF00FFF9F0000FE0FF81FFFFFFFFF00000000FFFFF00F00000000E1FFE007
      0000000000FFC00300000000001F800000000000000700000000000000010000
      000000000000001000000000000000F00000000000010FF000000000800101F0
      00000000C001001000000000C001000000000000E001800100000000FF01C003
      00000000FFFFF00F00000000FFFFF00F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FC3F000000000000FC3F00000000
      0000C003000000000000C003000000000000C003000000000000C00300000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C003000000000000C001000000000000C000000000000000C00000000000
      0000FC20000000000000FC310000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFF0000FFE7FEA7FC7F0000
      FFDBFEFBFE7F0000FFBDFFFDF81F0000FFBDFEFBF01F0000FFDBFF77F00F0000
      00670017F00F0000003F002FF00F0000003F003FE0070000001F001FE0070000
      001F001FF81F0000003F003FF81F0000007F007FF81F0000C3FFC3FFF81F0000
      E5FFE5FFF83F0000F1FFF1FFFC7F0000FFFFFFFFFFFFFFFFFFFFFFFF8001FF55
      FC7FFF9F0000FFFFF83FFE070000FF7DF00FF8010000FFFFE007E0030000FF55
      C003C0070000007F0001C0070000003F0000C0030000003F0001C0030000001F
      8003C0070000001FE007C0070000003FF01FC01F0000007FF83FF03F8001C3FF
      FC7FFE7FFFFFE5FFFFFFFFFFFFFFF1FFFFFFFFFFF000FFFFFFFFFFFFF000FFFF
      FFFFFFFFF00000C1E00F00C1000000C1C00700C100010001C007000100010001
      C003000100010001C003000100010001C00700010001FF81E00F00010001FF81
      F87F00010001FF81FC3F00010001FF81FE3F00010001FFFFFFFF001F001FFFFF
      FFFF001F001FFFFFFFFFFFFFFFFFFFFFFFFFF00FC003FFFFFFFFE007E007FFFF
      8001C003E007800180018001E0070000C1830000E007000080010000E0070000
      00000000F007000000000000F80F000080010000F81F0000C1830000F00F0000
      E3C70000E0070000C1830000E0078000C1838001E007C001C183C003E007FFFF
      E3C7E007E007FFFFFFFFF00FC003FFFFF00FF00FC003FFFFC007C0038001FC3F
      800380010001F00F800180010000E007000000000000C0030000000000008003
      0000000000008001000000000000800100000000000080010000000000008001
      00000000000080030002000000008003400180010001C007800580018003E00F
      C00BC003C007F01FE82FF00FE00FFFFFFFBFFFFB0001FFFFFE0FFFE100000000
      F803FFC000000000F001FFC000000000FC03FFC000000000F803FFE000000000
      E003FFE000000000E003FFC000000000E003FF8300000000E003FF0600008001
      E003CE0F00000000E003841E0000C003E007003F0000C007E01F007E0000E00F
      E07F00FF0000FFFFF1FF81FE0000FFFFF81FFFFFFFFFFFFFE007FFF1FFE3FFE1
      C003FFE1FFC1FFC38001FFC1FF81FF838001FF83FF03F1070000E007F007E007
      0000C00FE00FE00F0000801FC01FC0070000801FC01FC0030000801FC01F8003
      0000801FC01F80038001801FC01FC0078001801FE03FE007C003C03FF07FF007
      E007E07FFFFFF00FF81FFFFFFFFFF81FFFFF003FFFFF8007E0030000FF000003
      C0010000FF000003C001000000000003C001800000000003C001800000000003
      C001000100000003E003000300000003F00700010000007FC0010000000300C1
      8000000000038080800000000003FF80800000000003FF80C00100000003FF80
      F00780000003FF80FFFFFF000003FFC1FFFFFFFFFFFFFFFF00008001FFFFFFFF
      00008001C0038003000080018001000100008001800100010000800180010001
      0000800180010001000080018001000100008001800100018001800180018001
      000080018001C003C00380018001FFFFC0078001C003FFFFE00F8001FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2492FFFFFFFFC0077FFE
      FC7FFFFF8003C01EFC7FFFFF8003000FFC7FFFFF80030006FC7FC00180034006
      FC7FC0018003C0038003C001800360008003C001C00760008003C001E38FE001
      FC7FC001E38F7800FC7FFFFFE00F7E0EFC7FFFFFE00FFFFFFC7FFFFFF01F7FFE
      FC7FFFFFFFFF4924FFFFFFFFFFFFFFFFFFFFF8F8FC1F0000FF01F8F8F00F0000
      FF01F870E0070000FF01F800C0070001F001800080038003F00180008001C007
      F00180008001E00F000180018001E00F000180038001C0070001800380018003
      001F800380010001001F8007C0010001001F8007E003000101FF8007E0078003
      01FF8007F80FC00701FFFFFFFFFFE00F9FFFF807FFCFF9CF8FFFF807FF8FEF8F
      C7FFF007FF8FDF8BE207E003FF1FBF1DF003C003FB1FFB1FF801C001F83F783E
      F0008001F83F783EF0000001F80FF80FF0000000F81F781EF0009000F83F783E
      F000E000F87FF87DF000E000F8FFB8FFF801C005F9FFD9FBFC03C007FBFFEBF7
      FE07E40FFFFFFC9FFFFFFE7FFFFFFFFFFFFF24CEFE1F9FFFF9FFFF8EFC1F8FFF
      F6CF7F8EFC1FC7FFF6B7FF1FD83FE207F6B77B1EC83FF003F8B7783EC07FF801
      FE8FF83FC03FF000FE3F780EC01FF000FF7F781EC03FF000FE3FF83FC07FF000
      FEBF787EC0FFF000FC9F78FEC1FFF000FDDFF9FFC3FFF801FDDF7BFEC7FFFC03
      FDDF4924CFFFFE07FFFFFFFFFFFFFFFF8000FFFFF3CFF00F0000DFFFE007E007
      F00F9FFFF01FC003F00F000F983F8001F00F9FE7F01F0000F00FDFF3A00F0000
      F00FF013E00F0000F00FE7F3101F0000F00FCFE7F83F0000F00FC80FFC7F0000
      F00FCFFB483F0000F00FE7F9F83F0000FFFFF000F83F8001F81FFFF9847FC003
      F81FFFFBFFFFE007F81FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFF0001FFFDFFFF
      8061C993D803FFFF80610001C003C00780618913C007800180610001E0070000
      80618913F007000080610001F007000080618913F007000080010001F0070000
      80019913F007000080010001F00F00008001F913E027800180010001C033FFFF
      8001FF3FFFFDFFFF80010001FFFFFFFFFFFFFFFFFC3FFFFFE007C007E00FFFFF
      C0038003C007F7DFC00380038003E38FC00380038001C107C00380030001E00F
      C00380030000F01FC00380030000F83F800180030000F01FC00380030000E00F
      E00380030001C107F00380030001E38FF80380038001F7DFFC23C007C003FFFF
      FE73FFFFE007FFFFFFFFFFFFF01FFFFFFFFFFFFF8001FFFF8001FFFC8001800F
      0000F3FF800100070000E1F9800100030000E1F3800100010000F0E380010000
      0000F847800100000000FC0F800100030000FE1F800100030000FC0F80010007
      0000F84F8001000F0000E0E3800183FF0000C1F18001C7FF0000C7F88001FFFF
      8001FFFF8001FFFFFFFFFFFF8003FFFFFFFFFFFFFFFF803FFF87FFFFFFFF803E
      FF87FCFF800F9F3CFF87F83C00079F38FC00F01800039C11FC00E00100019803
      FC00C00300019007FC008007800180130787C003C001801B0787A007E001801B
      0787F007F003801B00FFE00FF00FE01300FFF41FF807F3E7E0FFFE7FF807F9CF
      E0FFFDFFFC07FC1FE0FFFFFFFFFFFFFF8007FFFFFFFF3FFF0003FFFFF01F0007
      0003FFB7E00F000300038001E00F80010003F01FE00F80010003F01FE00F8001
      0003F01FF01F80010003F01FFD7F8001007FB01FFABF800100C1FE1FF55F8001
      8080BFDFEAAF8001FF80FFDFC0078001FF80FFC3C0078001FF80BFFFE00FC000
      FF80FFFFF01FE000FFC1FFFFFC7FFFFCFC00FFFF803FE3C7F0018007001FC183
      C0038007000F80018001C0070007000080018007800300000001807FE0010000
      000180FFE00100000001807FE00100000001821FE00100000001860FE0010000
      00018F03E001000000019F03E00100008003BF01F00080018003BF81F001C183
      C007FFE0F003E3C7F01FFFF0F207FFFFFFFFFFFCFFFFFFFFFFFFFFF8FFFF8001
      F01FFFF0FFFF0000F01FFFC0C3FF0000F83FFF80C0FF0000F01F8000E03F0000
      E00F0000F01F0000E00F0000F80F0000F01F0000F8070000F83F8000F00F0000
      FC7FFF80F8070000F83FFFC0FE030000F83FFFF0FF810000F83FFFF8FFE30000
      FC7FFFFCFFFF8001FFFFFFFEFFFFFFFFFE7FFFFFFFFFFFFFFC7FFE7F8001FFFF
      FC3FF83F0000C01FFC7FE01F0000000FFC3FC00F00000007FC7FC00700000007
      FC3FC0070000C003FC3FC0070000E001F81FC0070000E000F00FC0070000E000
      F00FC0070000F800F00FE0070000FE0FF00FF00F0000FFFFF81FF83F0000FFFF
      FC3FFCFF8001FFFFFFFFFFFFFFFFFFFFFFFFFE3FF807FFFF8001FC1FF807E003
      8001FC1FF007C0018001FC1FE00380018001FC1FC00380018001FC1FC0018001
      8001FC1F800180018001FE3F000180018001FE3F000080018001FE3F90008001
      8001E419E00080018001C001E00080018001C001C00580018003C003C007C003
      8007C007E40FFFFF800FE40FFE7FFFFFFFFF8001FFFFF00FFC7F0000FCFFE007
      F87F0000F0FFC003F077000000008001E07B0000803F0000806D0000803F0000
      80750000803F000080550000803F000080550000803B00008075000080330000
      806D000080200000E07B000080330000F0770000803B8001F87F0000803FC003
      FC7F0000803FE007FFFF8001803FF00FFFFFFFFFE007E000F83FFFFFC003E000
      F83FFFFF8001E000F83F870F80018000F83F020780010000F83F020780010000
      F83F020780010000F83F870F80010000F83FB8EF80010000FC7FDFF780010000
      FC7FEBFA80010003F83FF7FD80010007F83FFFFF8001000FF83FFFFF800183FF
      FC7FFFFF8003C7FFFFFFFFFFC007FFFF}
  end
  object ActionList1: TActionList
    Images = ImageList2
    Left = 11
    Top = 200
    object fun_refresh_all_dev: TAction
      Category = '3'#21151#33021
      Caption = #21047#26032
      Hint = #37325#26032#36733#20837#25152#26377#36710#36742#30340#20449#24687
      ImageIndex = 126
      ShortCut = 116
      Visible = False
      OnExecute = fun_refresh_all_devExecute
    end
    object sys_com_set: TAction
      Category = '1'#31995#32479#31649#29702
      Caption = #20018#21475#35774#32622
      ImageIndex = 0
      Visible = False
    end
    object show_MapToolbar: TAction
      Category = '7'#31383#21475#35270#22270
      Caption = #26174#31034#22320#22270#24037#20855#26639
      Checked = True
      Hint = #26174#31034#22320#22270#24037#20855#26639
      OnExecute = show_MapToolbarExecute
    end
    object sys_login_again: TAction
      Category = '1'#31995#32479#31649#29702
      ImageIndex = 16
    end
    object fun_ShowACarTrack: TAction
      Category = '3'#21151#33021
      Caption = #26174#31034#36712#36857
      Hint = #26174#31034#24403#21069#36710#36742#34892#39542#36712#36857
      ImageIndex = 45
      OnExecute = fun_ShowACarTrackExecute
    end
    object ck_car: TAction
      Category = '4'#20449#24687#26597#30475
      Caption = #36710#36742#20449#24687#26597#35810
      Hint = #36710#36742#20449#24687#26597#35810
      OnExecute = ck_carExecute
    end
    object sys_change_pass: TAction
      Category = '1'#31995#32479#31649#29702
      Caption = #23494#30721#20462#25913
      ImageIndex = 12
      OnExecute = sys_change_passExecute
    end
    object sys_exit: TAction
      Category = '1'#31995#32479#31649#29702
      Caption = #36864#20986' '
      Hint = #36864#20986
      ImageIndex = 44
      OnExecute = sys_exitExecute
    end
    object fun_SetDevTelList: TAction
      Category = '3'#21151#33021
      Caption = #35774#32622#30005#35805#26412
      Hint = #35774#32622#36710#26426#30340#30005#35805#26412
      ImageIndex = 68
      ShortCut = 16465
      OnExecute = fun_SetDevTelListExecute
    end
    object tool_not_select: TAction
      Category = '2'#22320#22270#24037#20855
      Caption = #19981#36873#23450
      Hint = #19981#36873#23450
      ImageIndex = 50
      OnExecute = tool_not_selectExecute
    end
    object show_toolbar: TAction
      Category = '7'#31383#21475#35270#22270
      Caption = #26174#31034#24037#20855#26639
      Checked = True
      Hint = #26174#31034#24037#20855#26639
      OnExecute = show_toolbarExecute
    end
    object show_statusBar: TAction
      Category = '7'#31383#21475#35270#22270
      Caption = #26174#31034#29366#24577#26639
      Checked = True
      Hint = #26174#31034#29366#24577#26639
      OnExecute = show_statusBarExecute
    end
    object tool_zoom_in: TAction
      Category = '2'#22320#22270#24037#20855
      Caption = #25918#22823
      Hint = #25918#22823
      ImageIndex = 51
      OnExecute = tool_zoom_inExecute
    end
    object tool_zoom_out: TAction
      Category = '2'#22320#22270#24037#20855
      Caption = #32553#23567
      Hint = #32553#23567
      ImageIndex = 52
      OnExecute = tool_zoom_outExecute
    end
    object fun_watch_cancel: TAction
      Category = #21151#33021'_'#26242#19981#29992
      Caption = #21462#28040#36319#36394
      Enabled = False
      Hint = #21462#28040#23545#36319#36394#36710#36742#30340#36319#36394
      ImageIndex = 58
      Visible = False
      OnExecute = fun_watch_cancelExecute
    end
    object tool_move: TAction
      Category = '2'#22320#22270#24037#20855
      Caption = #31227#21160
      Checked = True
      Hint = #31227#21160
      ImageIndex = 53
      OnExecute = tool_moveExecute
    end
    object tool_select_point: TAction
      Category = '2'#22320#22270#24037#20855
      Caption = #28857#36873#25321
      Hint = #28857#36873#25321
      ImageIndex = 54
      Visible = False
      OnExecute = tool_select_pointExecute
    end
    object tool_RectSelect: TAction
      Category = '2'#22320#22270#24037#20855
      Caption = #30697#24418#36873#25321#36710#36742
      Hint = #30697#24418#36873#25321#36710#36742
      ImageIndex = 49
      OnExecute = tool_RectSelectExecute
    end
    object tool_show_all: TAction
      Category = '2'#22320#22270#24037#20855
      Caption = #20840#22270#26174#31034
      Hint = #20840#22270#26174#31034
      ImageIndex = 56
      Visible = False
    end
    object tool_bird_eye: TAction
      Category = '2'#22320#22270#24037#20855
      Caption = #40479#30640#22270
      Hint = #25171#24320#40479#30640#22270
      ImageIndex = 57
      Visible = False
      OnExecute = tool_bird_eyeExecute
    end
    object ck_DevInfo: TAction
      Category = '4'#20449#24687#26597#30475
      Caption = #26597#30475#36710#36742#20449#24687
      Hint = #26597#30475#36710#36742#20449#24687
      ImageIndex = 15
      OnExecute = ck_DevInfoExecute
    end
    object fun_Locate_Car: TAction
      Category = '3'#21151#33021
      Caption = #36710#36742#23621#20013
      Hint = #20351#36710#36742#20301#32622#23621#20110#22320#22270#20013#24515
      ImageIndex = 0
      OnExecute = fun_Locate_CarExecute
    end
    object fun_watch_car: TAction
      Category = '3'#21151#33021
      Caption = #36319#36394#36710#36742
      Hint = #20351#36710#36742#20301#32622#19968#30452#23621#20110#22320#22270#20869
      ImageIndex = 78
      Visible = False
      OnExecute = fun_watch_carExecute
    end
    object fun_sendToDTE: TAction
      Category = #21151#33021'_'#26242#19981#29992
      Caption = #21521#36830#25509#30340#22806#35774#21457#36865#25968#25454
      Hint = #21521#36830#25509#30340#20854#20182#35774#22791#21457#36865#25968#25454
      ImageIndex = 17
      Visible = False
    end
    object show_car: TAction
      Category = '7'#31383#21475#35270#22270
      Caption = #26174#31034#36710#36742#20449#24687
      Checked = True
      Hint = #26174#31034#36710#36742#20449#24687
      OnExecute = show_carExecute
    end
    object help_help: TAction
      Category = #24110#21161
      Caption = ' '#24110#21161' '
      Hint = #24110#21161
      ImageIndex = 7
      Visible = False
    end
    object help_about: TAction
      Category = #24110#21161
      Caption = #20851#20110#26412#36719#20214'...'
      ImageIndex = 47
      OnExecute = help_aboutExecute
    end
    object tool_locate: TAction
      Category = '2'#22320#22270#24037#20855
      Caption = #26597#30475#26576#28857#30340#20449#24687
      Hint = #26597#30475#26576#28857#30340#20449#24687
      ImageIndex = 60
      OnExecute = tool_locateExecute
    end
    object tool_distance: TAction
      Category = '2'#22320#22270#24037#20855
      Caption = #27979#36317
      Hint = #27979#36317
      ImageIndex = 61
      OnExecute = tool_distanceExecute
    end
    object fun_callDev: TAction
      Category = '3'#21151#33021
      Caption = #21628#21483#36710#36742
      Hint = #35753#36710#36742#36895#22238#19968#26465#23450#20301#25968#25454
      ImageIndex = 4
      OnExecute = fun_callDevExecute
    end
    object fun_view_someDevParam: TAction
      Category = '3'#21151#33021
      Caption = #35835#21462#25351#23450#21442#25968
      ImageIndex = 3
      OnExecute = fun_view_someDevParamExecute
    end
    object fun_review: TAction
      Category = #21151#33021'_'#26242#19981#29992
      Caption = #22238#25918#20449#24687
      Hint = #22238#25918#20449#24687
      ImageIndex = 5
      Visible = False
    end
    object sys_lock: TAction
      Category = '1'#31995#32479#31649#29702
      Caption = #38145#23450' '
      ImageIndex = 62
      OnExecute = sys_lockExecute
    end
    object sys_off: TAction
      Category = '1'#31995#32479#31649#29702
      Caption = #27880#38144' '
      ImageIndex = 46
      OnExecute = sys_offExecute
    end
    object fun_Control_Swith: TAction
      Category = #21151#33021'_'#26242#19981#29992
      Caption = #21453#25511#36710#36742
      Hint = #21453#25511#36710#36742
      ImageIndex = 43
      Visible = False
    end
    object fun_view_SwitchStat: TAction
      Category = #21151#33021'_'#26242#19981#29992
      Caption = #26597#30475#25509#22836
      Hint = #26597#30475#36710#36742#21508#25509#22836#30340#29366#24577
      ImageIndex = 32
      Visible = False
      OnExecute = fun_view_SwitchStatExecute
    end
    object show_ListCar: TAction
      Category = '7'#31383#21475#35270#22270
      Caption = #26174#31034#36710#36742#21015#34920
      Hint = #26597#30475#30417#25511#36710#36742
      OnExecute = show_ListCarExecute
    end
    object show_sended_command: TAction
      Category = '7'#31383#21475#35270#22270
      Caption = #26174#31034#21457#36865#21629#20196
      Hint = #26174#31034#21457#36865#21629#20196#20449#24687
      OnExecute = show_sended_commandExecute
    end
    object fun_DevStat: TAction
      Category = #21151#33021'_'#26242#19981#29992
      Caption = #26597#30475#29366#24577
      Hint = #33719#21462#35774#22791#29366#24577','#22914#65306#35774#22791#29256#26412#21495#12289#21457#36865#25968#25454#29366#24577#31561#12290
      ImageIndex = 23
      Visible = False
      OnExecute = fun_DevStatExecute
    end
    object fun_view_DevParam: TAction
      Category = '3'#21151#33021
      Caption = #35835#21462#21442#25968
      Hint = #35835#21462#35774#22791#21442#25968
      ImageIndex = 3
      OnExecute = fun_view_DevParamExecute
    end
    object help_skin1: TAction
      Category = #24110#21161
      Caption = #27785#27785#26286#33394
    end
    object help_skin2: TAction
      Category = #24110#21161
      Caption = #22478#24066#30340#22812
    end
    object help_skin3: TAction
      Category = #24110#21161
      Caption = #28909#24773
    end
    object help_skin4: TAction
      Category = #24110#21161
      Caption = 'XP'#39118#26684
    end
    object cmd_cancel: TAction
      Category = #24050#21457#21629#20196
      Caption = #21462#28040#21629#20196
      OnExecute = cmd_cancelExecute
    end
    object cmd_reSend: TAction
      Category = #24050#21457#21629#20196
      Caption = #21629#20196#37325#21457
      OnExecute = cmd_reSendExecute
    end
    object cmd_ShowCmd: TAction
      Category = #24050#21457#21629#20196
      Caption = ' '#24050#21457#21629#20196' '
    end
    object tool_layer_control: TAction
      Category = '2'#22320#22270#24037#20855
      Caption = #22270#23618#25511#21046
      Hint = #22270#23618#25511#21046
      ImageIndex = 56
      OnExecute = tool_layer_controlExecute
    end
    object fun_Set_DevParam: TAction
      Category = '3'#21151#33021
      Caption = #35774#32622#21442#25968
      Hint = #35774#32622#35774#22791#21442#25968
      ImageIndex = 9
      ShortCut = 16467
      OnExecute = fun_Set_DevParamExecute
    end
    object fun_Devs_SetParam: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #32676#35774#35774#22791#21442#25968
      Hint = #38598#32676#35774#32622#35774#22791#21442#25968
      ImageIndex = 9
      OnExecute = fun_Devs_SetParamExecute
    end
    object fun_refresh_a_dev: TAction
      Category = #21151#33021'_'#26242#19981#29992
      Caption = #21047#26032#26576#36710#20449#24687
      Hint = #21047#26032#25351#23450#36710#36742#30340#20449#24687
      ImageIndex = 18
    end
    object set_AllCarTrack: TAction
      Category = '6'#35774#32622
      Caption = #36710#36742#34892#39542#36712#36857#35774#32622
      ImageIndex = 2
      OnExecute = set_AllCarTrackExecute
    end
    object map_openLayer: TAction
      Category = '6'#35774#32622
      Caption = #21152#20837#22270#23618
      Hint = #21152#20837#22270#23618
      ImageIndex = 8
      OnExecute = map_openLayerExecute
    end
    object map_CloseLayer: TAction
      Category = '6'#35774#32622
      Caption = #21024#38500#22270#23618
      Hint = #21024#38500#22270#23618
      ImageIndex = 42
      OnExecute = map_CloseLayerExecute
    end
    object show_Received_Info: TAction
      Category = '7'#31383#21475#35270#22270
      Caption = #26174#31034#20256#20837#20449#24687
      Hint = #26597#30475#32593#20851#26381#21153#22120#20256#20837#30340#20449#24687
      OnExecute = show_Received_InfoExecute
    end
    object show_Sended_Message: TAction
      Category = '7'#31383#21475#35270#22270
      Caption = #26174#31034#21457#36865#35746#21333#21015#34920
      Hint = #26174#31034#21457#36865#35746#21333#21015#34920
      Visible = False
      OnExecute = show_Sended_MessageExecute
    end
    object set_AlarmSound: TAction
      Category = '6'#35774#32622
      Caption = #35774#32622#25253#35686#22768#38899
      ImageIndex = 4
      OnExecute = set_AlarmSoundExecute
    end
    object set_SaveWorkShop: TAction
      Category = '6'#35774#32622
      Caption = #20445#23384#26412#22320#37197#32622
      Hint = #20445#23384#26412#22320#37197#32622
      ImageIndex = 11
      Visible = False
      OnExecute = set_SaveWorkShopExecute
    end
    object stop_Alarm: TAction
      Category = #25253#35686
      Caption = #35299#38500#32039#24613#25253#35686
      ImageIndex = 59
      OnExecute = stop_AlarmExecute
    end
    object show_AlarmStop: TAction
      Category = '7'#31383#21475#35270#22270
      Caption = #26174#31034#25253#35686#24050#35299#38500#36710#36742
      OnExecute = show_AlarmStopExecute
    end
    object fun_Devs_CallDev: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #32676#21457#36710#36742#28857#21517
      Hint = #35753#32452#20013#36710#36742#36895#22238#19968#26465#23450#20301#25968#25454
      ImageIndex = 4
      OnExecute = fun_Devs_CallDevExecute
    end
    object fun_Devs_SendControlInfo: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #32676#21457#25991#26412#35843#24230#20449#24687
      Hint = #32676#21457#25991#26412#35843#24230#20449#24687
      ImageIndex = 66
      ShortCut = 16468
      OnExecute = fun_Devs_SendControlInfoExecute
    end
    object tool_SetConfineAlarmArea: TAction
      Category = '2'#22320#22270#24037#20855
      Caption = #35774#32622#30005#23376#22260#26639#21306#22495
      Hint = #35774#32622#30005#23376#22260#26639#21306#22495
      ImageIndex = 79
      OnExecute = tool_SetConfineAlarmAreaExecute
    end
    object show_ConfineAreaList: TAction
      Category = '7'#31383#21475#35270#22270
      Caption = #26174#31034#30005#23376#22260#26639#21015#34920
      OnExecute = show_ConfineAreaListExecute
    end
    object show_AlarmLists: TAction
      Category = '7'#31383#21475#35270#22270
      Caption = #26174#31034#25253#35686#36710#36742#21015#34920
      Hint = #26174#31034#36710#36742#25253#35686#21015#34920
      OnExecute = show_AlarmListsExecute
    end
    object SelectDevs: TAction
      Category = #20998#32452'_'#36873#25321#36710#36742
      Caption = #37325#26032#36873#25321#36710#36742
      OnExecute = SelectDevsExecute
    end
    object show_SearchAddress: TAction
      Category = '7'#31383#21475#35270#22270
      Caption = #26174#31034#26631#31614#26597#35810
      OnExecute = show_SearchAddressExecute
    end
    object fun_SendControlInfo: TAction
      Category = '3'#21151#33021
      Caption = #25991#26412#20449#24687#19979#21457
      Hint = #21457#36865#25991#26412#20449#24687
      ImageIndex = 66
      ShortCut = 16468
      OnExecute = fun_SendControlInfoExecute
    end
    object fun_SendControlInfo_NeedAnswer: TAction
      Category = '3'#21151#33021
      Caption = #21457#36865#38656#22238#22797#30340#35843#24230#20449#24687
      Hint = #21457#36865#38656#21496#26426#22238#22797#30340#35843#24230#20449#24687
      ImageIndex = 24
      Visible = False
      OnExecute = fun_SendControlInfo_NeedAnswerExecute
    end
    object fun_PursueDev: TAction
      Category = '3'#21151#33021
      Caption = #20020#26102#20301#32622#36319#36394#25511#21046
      ImageIndex = 17
      OnExecute = fun_PursueDevExecute
    end
    object fun_ModifyDisplayName: TAction
      Category = '3'#21151#33021
      Caption = #20462#25913#26174#31034#23631#20027#30028#38754#20449#24687
      Hint = #20462#25913#26174#31034#23631#20027#30028#38754#20869#23481
      ImageIndex = 19
      Visible = False
    end
    object fun_ModifyLCDMenu: TAction
      Category = '3'#21151#33021
      Caption = #20462#25913#26174#31034#23631#22266#23450#33756#21333
      ImageIndex = 32
      Visible = False
    end
    object fun_Devs_SendControlInfo_NeedAnswer: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #32676#21457#38656#22238#22797#30340#35843#24230#20449#24687
      Hint = #32676#21457#38656#22238#22797#30340#35843#24230#20449#24687
      ImageIndex = 24
      OnExecute = fun_Devs_SendControlInfo_NeedAnswerExecute
    end
    object fun_SendToDTEs: TAction
      Category = #21151#33021'_'#26242#19981#29992
      Caption = #21521#32452#20869#36710#36742#30340#22806#35774#21457#36865#25968#25454
      Hint = #21521#32452#20869#25152#26377#36710#36742#30340#22806#35774#21457#36865#25968#25454
      Visible = False
    end
    object fun_UpdateDevFirmWare: TAction
      Category = '3'#21151#33021
      Caption = #21319#32423#36710#26426#22266#20214#31243#24207
      Hint = #21319#32423#36710#26426#22266#20214#31243#24207
      ImageIndex = 20
      Visible = False
    end
    object fun_Devs_SetDevTelList: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #32676#35774#30005#35805#26412
      ImageIndex = 68
      ShortCut = 16465
      OnExecute = fun_Devs_SetDevTelListExecute
    end
    object fun_Devs_PursueDev: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #32676#21457#30417#25511#21442#25968
      Hint = #35753#36710#36742#20197#22266#23450#30340#26102#38388#38388#38548#22238#22797#23450#20301#25968#25454
      ImageIndex = 17
      Visible = False
      OnExecute = fun_Devs_PursueDevExecute
    end
    object fun_Devs_ModifyLCDMenu: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #32676#25913#26174#31034#23631#22266#23450#33756#21333
      ImageIndex = 32
    end
    object fun_Devs_ModifyDisplayName: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #32676#25913#26174#31034#23631#20027#30028#38754#20449#24687
      ImageIndex = 19
    end
    object fun_Devs_UpdateFirmWare: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #32676#21319#32423#36710#26426#22266#20214#31243#24207
      ImageIndex = 20
    end
    object ck_DriverInfo: TAction
      Category = '4'#20449#24687#26597#30475
      Caption = #26597#30475#21496#26426#20449#24687
      ImageIndex = 14
      OnExecute = ck_DriverInfoExecute
    end
    object ck_TaxiMetaInfo: TAction
      Category = '4'#20449#24687#26597#30475
      Caption = #26597#30475#35745#20215#22120#20449#24687
      ImageIndex = 14
      Visible = False
    end
    object show_TaxiMetaRunData: TAction
      Category = '7'#31383#21475#35270#22270
      Caption = #26174#31034#20986#31199#36710#23458#27425#26126#32454
    end
    object fun_TaxiMeterStopDateTime: TAction
      Category = '3'#21151#33021'_'#20986#31199#36710#30456#20851
      Caption = #35774#32622#35745#20215#22120#20572#26426#26102#38388
      ImageIndex = 72
      Visible = False
    end
    object fun_Devs_TaxiMeterStopDateTime: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #32676#35774#35745#20215#22120#20572#26426#26102#38388
      ImageIndex = 72
    end
    object fun_SendOrder: TAction
      Category = '3'#21151#33021'_'#20986#31199#36710#30456#20851
      Caption = #21457#36865#35746#21333
      ImageIndex = 70
      ShortCut = 16452
      Visible = False
      OnExecute = fun_SendOrderExecute
    end
    object Selected: TAction
      Category = #20998#32452'_'#36873#25321#36710#36742
      Caption = #24050#32463#36873#20013#30340#36710#36742
      OnExecute = SelectedExecute
    end
    object fun_CancelOrderMenu: TAction
      Category = '3'#21151#33021'_'#20986#31199#36710#30456#20851
      Caption = #20462#25913#21462#28040#35746#21333#30340#33756#21333
      ImageIndex = 71
      Visible = False
      OnExecute = fun_CancelOrderMenuExecute
    end
    object fun_Devs_CancelOrderMenu: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #32676#35774#21462#28040#35746#21333#30340#33756#21333
      ImageIndex = 71
      OnExecute = fun_Devs_CancelOrderMenuExecute
    end
    object Sel_Dev_Empty: TAction
      Category = #36873#25321#36710#36742
      Caption = #31354#36710
      OnExecute = Sel_Dev_EmptyExecute
    end
    object Sel_Dev_Full: TAction
      Category = #36873#25321#36710#36742
      Caption = #37325#36710
      OnExecute = Sel_Dev_FullExecute
    end
    object Sel_Dev_Online: TAction
      Category = #36873#25321#36710#36742
      Caption = #22312#32447
      OnExecute = Sel_Dev_OnlineExecute
    end
    object Sel_Dev_Postion: TAction
      Category = #36873#25321#36710#36742
      Caption = #23450#20301
      OnExecute = Sel_Dev_PostionExecute
    end
    object Sel_Dev_Not_Online: TAction
      Category = #36873#25321#36710#36742
      Caption = #19981#22312#32447
      OnExecute = Sel_Dev_Not_OnlineExecute
    end
    object Sel_Dev_Not_Postion: TAction
      Category = #36873#25321#36710#36742
      Caption = #38750#23450#20301
      OnExecute = Sel_Dev_Not_PostionExecute
    end
    object ck_SendMsgList: TAction
      Category = '4'#20449#24687#26597#30475
      Caption = #24050#21457#35843#24230#20449#24687#26597#35810
      ImageIndex = 74
    end
    object ck_SendOrderList: TAction
      Category = '4'#20449#24687#26597#30475
      Caption = #24050#21457#35746#21333#26597#35810
      ImageIndex = 75
    end
    object SystemConfig: TAction
      Category = '6'#35774#32622
      Caption = #31995#32479#35774#32622
      ImageIndex = 76
      OnExecute = SystemConfigExecute
    end
    object fun_SwitchToMe: TAction
      Category = '3'#21151#33021'_'#24102#30005#35805#26381#21153#22120
      Caption = #25318#25509#30005#35805
      Hint = #25318#25509#30005#35805
      ImageIndex = 77
      Visible = False
    end
    object fun_TermToTouShu: TAction
      Category = '3'#21151#33021'_'#24102#30005#35805#26381#21153#22120
      Caption = #36716#25237#35785#30005#35805
      Visible = False
    end
    object fun_SetCutOilElec: TAction
      Category = '3'#21151#33021
      Caption = #35774#32622#26029#27833#26029#30005
      ImageIndex = 81
      Visible = False
    end
    object fun_DevHide: TAction
      Category = '3'#21151#33021
      Caption = #38544#34255
      Hint = #22320#22270#19978#19981#26174#31034
      ImageIndex = 103
      OnExecute = fun_DevHideExecute
    end
    object fun_Devs_Show: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #32676#26174#31034
      ImageIndex = 82
      OnExecute = fun_Devs_ShowExecute
    end
    object Hot_zoom_in: TAction
      Category = #24555#25463#38190
      Caption = 'Hot_zoom_in'
      OnExecute = Hot_zoom_inExecute
    end
    object Hot_zoom_out: TAction
      Category = #24555#25463#38190
      Caption = 'Hot_zoom_out'
      OnExecute = Hot_zoom_outExecute
    end
    object Hot_zoom_in2: TAction
      Category = #24555#25463#38190
      Caption = 'Hot_zoom_in2'
      OnExecute = Hot_zoom_in2Execute
    end
    object Hot_zoom_out2: TAction
      Category = #24555#25463#38190
      Caption = 'Hot_zoom_out2'
      OnExecute = Hot_zoom_out2Execute
    end
    object Hot_Left: TAction
      Category = #24555#25463#38190
      Caption = 'Hot_Left'
      OnExecute = Hot_LeftExecute
    end
    object Hot_Right: TAction
      Category = #24555#25463#38190
      Caption = 'Hot_Right'
      OnExecute = Hot_RightExecute
    end
    object Hot_Up: TAction
      Category = #24555#25463#38190
      Caption = 'Hot_Up'
      OnExecute = Hot_UpExecute
    end
    object Hot_Down: TAction
      Category = #24555#25463#38190
      Caption = 'Hot_Down'
      OnExecute = Hot_DownExecute
    end
    object help_test: TAction
      Category = #24110#21161
      Caption = 'help_test'
    end
    object fun_DevShowOnly: TAction
      Category = '3'#21151#33021
      Caption = #20165#26174#31034#24403#21069#36873#20013#36710
      Hint = #22320#22270#19978#20165#26174#31034#24403#21069#36873#20013#36710
      ImageIndex = 50
      OnExecute = fun_DevShowOnlyExecute
    end
    object fun_ReadDevVersion: TAction
      Category = '3'#21151#33021
      Caption = 'fun_ReadDevVersion'
    end
    object Hot_Map_KeyDown: TAction
      Category = #24555#25463#38190
      Caption = 'Hot_Map_KeyDown'
    end
    object Hot_Map_KeyUp: TAction
      Category = #24555#25463#38190
      Caption = 'Hot_Map_KeyUp'
    end
    object Map_AddNode: TAction
      Category = #22320#22270#35774#32622
      Caption = #28155#21152#22320#21306#21517
      OnExecute = Map_AddNodeExecute
    end
    object Map_DelNode: TAction
      Category = #22320#22270#35774#32622
      Caption = #21024#38500#22320#21306#21517
      OnExecute = Map_DelNodeExecute
    end
    object Map_Set_DefaultNode: TAction
      Category = #22320#22270#35774#32622
      Caption = #35774#25104#40664#35748#22320#22270
      OnExecute = Map_Set_DefaultNodeExecute
    end
    object Map_Save: TAction
      Category = #22320#22270#35774#32622
      Caption = #20445#23384#22320#22270#35774#32622
      OnExecute = Map_SaveExecute
    end
    object Map_Reflash: TAction
      Category = #22320#22270#35774#32622
      Caption = #21047#26032#24403#21069#35774#32622
      OnExecute = Map_ReflashExecute
    end
    object Map_SaveAsNode: TAction
      Category = #22320#22270#35774#32622
      Caption = #20445#23384#33410#28857
      OnExecute = Map_SaveAsNodeExecute
    end
    object Map_ImputNode: TAction
      Category = #22320#22270#35774#32622
      Caption = #23548#20837#33410#28857
      OnExecute = Map_ImputNodeExecute
    end
    object fun_SetDownTime: TAction
      Category = #24110#21161
      Caption = 'fun_SetDownTime'
      OnExecute = fun_SetDownTimeExecute
    end
    object fun_History: TAction
      Category = '3'#21151#33021
      Caption = #36712#36857#22238#25918
      ImageIndex = 45
      OnExecute = fun_HistoryExecute
    end
    object Map_Manage: TAction
      Category = #22320#22270#35774#32622
      Caption = #22320#22270#31649#29702
      Hint = #22320#22270#31649#29702
      ImageIndex = 83
      OnExecute = Map_ManageExecute
    end
    object help_Update: TAction
      Category = #24110#21161
      Caption = #22312#32447#21319#32423
      OnExecute = help_UpdateExecute
    end
    object tool_UserDefinedtext: TAction
      Category = '2'#22320#22270#24037#20855
      Caption = #29992#25143#33258#23450#20041#22320#22270#26631#31614
      Hint = #29992#25143#33258#23450#20041#22320#22270#26631#31614
      ImageIndex = 28
      OnExecute = tool_UserDefinedtextExecute
    end
    object show_Map: TAction
      Category = '7'#31383#21475#35270#22270
      Caption = #26174#31034#22320#22270#31383#21475
      OnExecute = show_MapExecute
    end
    object fun_ChangeMap: TAction
      Category = '3'#21151#33021
      Caption = #20999#25442#22320#22270
      OnExecute = fun_ChangeMapExecute
    end
    object show_fullScreen: TAction
      Category = '7'#31383#21475#35270#22270
      Caption = #20840#23631#26174#31034
      ImageIndex = 2
      OnExecute = show_fullScreenExecute
    end
    object fun_Devs_Hide: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #32676#38544#34255
      ImageIndex = 82
      OnExecute = fun_Devs_HideExecute
    end
    object fun_Devs_Hide_All: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #38544#34255#20840#37096#36710#36742
      ImageIndex = 82
      OnExecute = fun_Devs_Hide_AllExecute
    end
    object fun_Devs_Show_All: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #26174#31034#20840#37096#36710#36742
      ImageIndex = 82
    end
    object fun_Devs_Show_Only: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #21482#26174#31034#26412#32452
      ImageIndex = 82
      OnExecute = fun_Devs_Show_OnlyExecute
    end
    object fun_ReadDriverInfo: TAction
      Category = '3'#21151#33021
      Caption = #35835#21462#21496#26426#20449#24687
      ImageIndex = 84
      Visible = False
    end
    object ck_DriverOnOffDuty: TAction
      Category = '4'#20449#24687#26597#30475
      Caption = #26597#35810#21496#26426#19978#19979#29677#20449#24687
    end
    object Map_ChangeNodeName: TAction
      Category = #22320#22270#35774#32622
      Caption = #20462#25913#22320#21306#21517
      OnExecute = Map_ChangeNodeNameExecute
    end
    object fun_GetAPicture: TAction
      Category = '3'#21151#33021
      Caption = #25293#25668
      Hint = #21629#20196#36710#26426#31435#21363#25293#25668#19968#24352#29031#29255
      ImageIndex = 87
      ShortCut = 16464
      OnExecute = fun_GetAPictureExecute
    end
    object fun_Devs_GetAPicture: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #32676#21457#25293#29031
      ImageIndex = 87
      OnExecute = fun_Devs_GetAPictureExecute
    end
    object tool_SetRunWay: TAction
      Category = '2'#22320#22270#24037#20855
      Caption = 'tool_SetRunWay'
      Hint = #35774#32622#36335#32447#65292#25353'Ctrl+'#21452#20987#20572#27490#35774#32622
      ImageIndex = 99
      OnExecute = tool_SetRunWayExecute
    end
    object Print_Screen: TAction
      Category = #24110#21161
      Caption = #25171#21360#23631#24149
      OnExecute = Print_ScreenExecute
    end
    object Print_Map: TAction
      Category = #24110#21161
      Caption = #25171#21360#22320#22270
      OnExecute = Print_MapExecute
    end
    object MapSaveToJpeg: TAction
      Category = #24110#21161
      Caption = #25130#21462#22320#22270#22270#29255
      OnExecute = MapSaveToJpegExecute
    end
    object ck_Picture: TAction
      Category = '4'#20449#24687#26597#30475
      Caption = #26597#35810#22810#23186#20307#20449#24687
      ImageIndex = 92
      OnExecute = ck_PictureExecute
    end
    object show_Picture: TAction
      Category = '7'#31383#21475#35270#22270
      Caption = #26174#31034#29031#29255
      OnExecute = show_PictureExecute
    end
    object fun_ReadGPRSFlux: TAction
      Category = '3'#21151#33021
      Caption = #35835#21462'GPRS'#27969#37327
      ImageIndex = 86
      Visible = False
    end
    object Set_HisTrack: TAction
      Category = '6'#35774#32622
      Caption = #36712#36857#22238#25918#32447#35774#32622
      OnExecute = Set_HisTrackExecute
    end
    object fun_SendAdInfo: TAction
      Category = #21151#33021'_'#26242#19981#29992
      Caption = #21457#36865#24191#21578
      ImageIndex = 85
      Visible = False
    end
    object fun_SendDelAdInfo: TAction
      Category = '3'#21151#33021'_'#24191#21578#30456#20851
      Caption = #31649#29702#24191#21578
      ImageIndex = 44
      Visible = False
    end
    object fun_SendListenTEL: TAction
      Category = '3'#21151#33021
      Caption = #21629#20196#36710#26426#22238#25320#30005#35805
      Hint = #21629#20196#36710#26426#25320#25171#25351#23450#30340#30005#35805
      ImageIndex = 77
    end
    object show_GPSHostory: TAction
      Category = '7'#31383#21475#35270#22270
      Caption = #26174#31034#36712#36857#22238#25918
      OnExecute = show_GPSHostoryExecute
    end
    object ck_StopRecord: TAction
      Category = '4'#20449#24687#26597#30475
      Caption = #20572#36710#35760#24405#26597#30475
    end
    object fun_BrakeState: TAction
      Category = '3'#21151#33021
      Caption = #35774#32622#21049#36710#30005#24179
      Visible = False
    end
    object fun_CallDriver: TAction
      Category = '3'#21151#33021'_'#24102#30005#35805#26381#21153#22120
      Caption = #24314#31435#19977#26041#36890#35805
      Hint = #24314#31435#19977#26041#36890#35805
      ImageIndex = 68
      Visible = False
    end
    object tool_SetFactory: TAction
      Category = '2'#22320#22270#24037#20855
      Caption = #28155#21152#24037#21378#24037#22320
      Hint = #28155#21152#24037#21378#24037#22320
      ImageIndex = 36
      Visible = False
      OnExecute = tool_SetFactoryExecute
    end
    object ck_taximetaRundataTj: TAction
      Category = '4'#20449#24687#26597#30475
      Caption = #20986#31199#36710#33829#36816#25968#25454#32479#35745
      ImageIndex = 41
    end
    object tool_SeekCar: TAction
      Category = '2'#22320#22270#24037#20855
      Caption = #21306#22495#26597#36710
      Hint = #21306#22495#26597#36710
      ImageIndex = 63
      OnExecute = tool_SeekCarExecute
    end
    object ck_DevHourDis: TAction
      Category = '4'#20449#24687#26597#30475
      Caption = #26597#35810#34892#39542#37324#31243
    end
    object fun_ReadDevHourDis: TAction
      Category = '3'#21151#33021
      Caption = #35835#21462#34892#39542#37324#31243
      Hint = #35835#21462#36710#26426#27599#23567#26102#34892#39542#37324#31243#25968#25454
      Visible = False
    end
    object fun_Devs_ReadDevHourDis: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #32676#35835#21462#36710#36742#37324#31243
    end
    object Set_DevOil: TAction
      Category = '6'#35774#32622
      Caption = #35774#32622#36710#36742#27833#32791
    end
    object fun_ReadallAd: TAction
      Category = '3'#21151#33021'_'#24191#21578#30456#20851
      Caption = #35835#21462#24191#21578
      ImageIndex = 43
      Visible = False
    end
    object ck_empty: TAction
      Category = '4'#20449#24687#26597#30475
      Caption = #26597#35810#31354#36710#29575
    end
    object ck_emptyCarNo: TAction
      Category = '4'#20449#24687#26597#30475
      Caption = #19981#22312#32447#36710#36742#32479#35745
    end
    object tool_StationAdd: TAction
      Category = '2'#22320#22270#24037#20855
      Caption = #31449#21488#28155#21152
      Hint = #28155#21152#31449#21488#20449#24687
      ImageIndex = 44
      Visible = False
    end
    object fun_SetEmptyWord: TAction
      Category = '3'#21151#33021'_'#20986#31199#36710#30456#20851
      Caption = #35774#32622#31354#37325#36710#25552#31034#35821#38899
      Hint = #35774#32622#25552#31034#36827#20837#25110#31163#24320#37325#36710#30340#35821#38899
      ImageIndex = 88
      Visible = False
    end
    object ck_MonthSpeed: TAction
      Category = '4'#20449#24687#26597#30475
      Caption = #26597#30475#34892#39542#36895#24230#26354#32447
      Visible = False
    end
    object Set_ZtCarrySound: TAction
      Category = '6'#35774#32622
      Caption = #35774#32622#28195#22303#36710#31354#37325#36710#22768#38899
      ImageIndex = 4
    end
    object set_sleepTime: TAction
      Category = '6'#35774#32622
      Caption = #35774#32622#20241#30496#26102#38388
      ImageIndex = 89
    end
    object ReadAlarmAreaFroDev: TAction
      Category = '3'#21151#33021
      Caption = #35835#21462#30005#23376#22260#26639
      Hint = #35835#21462#36710#26426#20869#23384#20648#30340#30005#23376#22260#26639
      Visible = False
      OnExecute = ReadAlarmAreaFroDevExecute
    end
    object ck_QueryAreaAlarm: TAction
      Category = '4'#20449#24687#26597#30475
      Caption = #26597#35810#36827#20986#21306#22495#25253#35686#35760#24405
      ImageIndex = 63
    end
    object SmsCmd_UpgradeDevFirmware: TAction
      Category = '3_2'#30701#20449#21629#20196
      Caption = #21319#32423#20027#26426#22806#35774#35013#32622
      Hint = #36890#36807#30701#20449#21319#32423#20027#26426#22266#20214#31243#24207
    end
    object SmsCmd_RemoveAlarm: TAction
      Category = '3_2'#30701#20449#21629#20196
      Caption = #35299#38500#32039#24613#25253#35686
      Hint = #36890#36807#30701#20449#35299#38500#32039#24613#25253#35686
    end
    object SmsCmd_DevRestart: TAction
      Category = '3_2'#30701#20449#21629#20196
      Caption = #21629#20196#36710#26426#22797#20301#37325#21551
      Hint = #36890#36807#30701#20449#21629#20196#36710#26426#22797#20301#37325#21551
    end
    object SmsCmd_ControlDev: TAction
      Category = '3_2'#30701#20449#21629#20196
      Caption = #25511#21046#36710#36742#26029#27833#26029#30005
      Hint = #36890#36807#30701#20449#25511#21046#36710#36742#26029#27833#26029#30005
    end
    object SmsCmd_SetDevParam: TAction
      Category = '3_2'#30701#20449#21629#20196
      Caption = #35774#32622#21442#25968
      Hint = #36890#36807#30701#20449#35774#32622#21442#25968
    end
    object fun_ReadPicTimesInfo: TAction
      Category = '3'#21151#33021
      Caption = #35835#21462#29031#29255#26102#38388#33539#22260
      Visible = False
    end
    object fun_ReadThePic: TAction
      Category = '3'#21151#33021
      Caption = #35835#21462#23384#20648#30340#29031#29255
      Visible = False
    end
    object ck_OverSpeedInfo: TAction
      Category = '4'#20449#24687#26597#30475
      Caption = #26597#35810#36229#36895#25253#35686#35760#24405
    end
    object ck_TjAreaWarn: TAction
      Category = '4'#20449#24687#26597#30475
      Caption = #36827#20986#21306#22495#25253#35686#32479#35745
    end
    object ck_TjOverSpeed: TAction
      Category = '4'#20449#24687#26597#30475
      Caption = #36229#36895#25253#35686#32479#35745
    end
    object ck_EmergncyAlarmInfo: TAction
      Category = '4'#20449#24687#26597#30475
      Caption = #26597#35810#32039#24613#25253#35686#35760#24405
    end
    object fun_CallTheDev: TAction
      Category = '3'#21151#33021'_'#24102#30005#35805#26381#21153#22120
      Caption = #25320#25171#36710#36733#30005#35805
      Hint = #20013#24515#36890#36807#30005#35805#26381#21153#22120#21435#25320#25171#36710#36733#30005#35805
      ImageIndex = 16
      Visible = False
    end
    object fun_ReadDevVersion_Extend: TAction
      Category = '3'#21151#33021
      Caption = #35835#21462#36710#26426#21450#22806#35774#29256#26412
      Visible = False
    end
    object fun_ReadDevTelList: TAction
      Category = '3'#21151#33021
      Caption = #35835#21462#30005#35805#26412
      Hint = #35835#21462#36710#26426#20869#30340#30005#35805#26412
      ImageIndex = 68
      Visible = False
    end
    object fun_ReadLCDMenu: TAction
      Category = '3'#21151#33021
      Caption = #35835#21462#26174#31034#23631#22266#23450#33756#21333
      Hint = #35835#21462#26174#31034#23631#20869#23384#20648#30340#22266#23450#33756#21333
      ImageIndex = 32
      Visible = False
    end
    object fun_StopUploadSavedPic: TAction
      Category = '3'#21151#33021
      Caption = #32456#27490#29031#29255#19978#20256
      Hint = #32456#27490#19978#20256#36710#26426#20869#23384#20648#29031#29255
      ImageIndex = 39
      Visible = False
    end
    object Show_ListeningDev: TAction
      Category = #25253#35686
      Caption = #37325#28857#26597#30475#30417#21548#36710#36742
      Hint = #26597#30475#27491#22312#34987#30417#21548#36710#36742'('#22312#22320#22270#23621#20013#24182#36319#36394')'
      OnExecute = Show_ListeningDevExecute
    end
    object ck_DriverFatigueRecord: TAction
      Category = '4'#20449#24687#26597#30475
      Caption = #26597#35810#21496#26426#30130#21171#39550#39542#35760#24405
    end
    object ck_TjGrpDevs: TAction
      Category = '4'#20449#24687#26597#30475
      Caption = #36710#36742#23433#35013#24773#20917#32479#35745
      Visible = False
      OnExecute = ck_TjGrpDevsExecute
    end
    object ck_DevMonthRunInfo: TAction
      Category = '4'#20449#24687#26597#30475
      Caption = #32479#35745#36710#36742#26376#36816#34892#25253#21578
    end
    object fun_setDevEventList: TAction
      Category = '3'#21151#33021
      Caption = #35774#32622#20107#20214
      Hint = #35774#32622#32456#31471#20107#20214
      ImageIndex = 93
      OnExecute = fun_setDevEventListExecute
    end
    object fun_Devs_SetDevEventList: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #32676#35774#20107#20214
      ImageIndex = 93
      OnExecute = fun_Devs_SetDevEventListExecute
    end
    object fun_sendQuestion: TAction
      Category = '3'#21151#33021
      Caption = #25552#38382#19979#21457
      Hint = #19979#21457#19968#20010#25552#38382#21040#36710#26426
      ImageIndex = 94
      OnExecute = fun_sendQuestionExecute
    end
    object fun_Devs_SendDevQuestion: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #32676#21457#38382#39064
      ImageIndex = 94
      OnExecute = fun_Devs_SendDevQuestionExecute
    end
    object ck_ServeJudge: TAction
      Category = '4'#20449#24687#26597#30475
      Caption = #26381#21153#35780#20215#20449#24687
      ImageIndex = 5
      OnExecute = ck_ServeJudgeExecute
    end
    object fun_FindPostion: TAction
      Category = '3'#21151#33021
      Caption = #36710#36742#28857#21517
      ImageIndex = 31
      OnExecute = fun_FindPostionExecute
    end
    object fun_sendAntiFake: TAction
      Category = '3'#21151#33021
      Caption = #19979#21457#38450#20266#26631#24535
      ImageIndex = 91
      Visible = False
      OnExecute = fun_sendAntiFakeExecute
    end
    object fun_Devs_sendAntiFake: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #32676#21457#38450#20266#26631#24535
      OnExecute = fun_Devs_sendAntiFakeExecute
    end
    object fun_SendBackCallTel: TAction
      Category = '3'#21151#33021
      Caption = #19979#21457#22238#25320#30005#35805
      ImageIndex = 77
      OnExecute = fun_SendBackCallTelExecute
    end
    object fun_Devs_SendBackCallTel: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #32676#21457#22238#25320#30005#35805
      OnExecute = fun_Devs_SendBackCallTelExecute
    end
    object fun_SendControlCar: TAction
      Category = '3'#21151#33021
      Caption = #36710#36742#25511#21046
      ImageIndex = 92
      OnExecute = fun_SendControlCarExecute
    end
    object fun_Devs_SendControlCar: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #32676#21457#36710#36742#25511#21046
      OnExecute = fun_Devs_SendControlCarExecute
    end
    object fun_SendInfoServer: TAction
      Category = '3'#21151#33021
      Caption = #19979#21457#20449#24687#26381#21153
      ImageIndex = 66
      OnExecute = fun_SendInfoServerExecute
    end
    object fun_Devs_SendInfoServer: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #32676#21457#20449#24687#26381#21153
      OnExecute = fun_Devs_SendInfoServerExecute
    end
    object fun_SendQueryPicture: TAction
      Category = '3'#21151#33021
      Caption = #23384#20648#22270#29255#26816#32034
      ImageIndex = 31
      OnExecute = fun_SendQueryPictureExecute
    end
    object fun_Devs_SendQueryPicture: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #32676#21457#23384#20648#22270#29255#26816#32034
      ImageIndex = 31
      OnExecute = fun_Devs_SendQueryPictureExecute
    end
    object fun_Devs_SendUpPicture: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #32676#21457#19978#20256#23384#20648#22270#29255
      OnExecute = fun_Devs_SendUpPictureExecute
    end
    object fun_SendUpPicture: TAction
      Category = '3'#21151#33021
      Caption = #19978#20256#23384#20648#22270#29255
      ImageIndex = 11
      Visible = False
      OnExecute = fun_SendUpPictureExecute
    end
    object fun_SendSetNightMode: TAction
      Category = '3'#21151#33021
      Caption = #39030#28783#22812#38388#27169#24335#21442#25968
      Visible = False
    end
    object fun_Devs_SendSetNightMode: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #32676#21457#39030#28783#22812#38388#27169#24335#21442#25968
    end
    object fun_SendStopAntiFake: TAction
      Category = '3'#21151#33021
      Caption = #20572#27490#38450#20266#26174#31034
      Visible = False
      OnExecute = fun_SendStopAntiFakeExecute
    end
    object fun_Devs_SendStopAntiFake: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #32676#21457#20572#27490#38450#20266#26174#31034
    end
    object fun_SendOpenNightMode: TAction
      Category = '3'#21151#33021
      Caption = #25511#21046#39030#28783#22812#38388#27169#24335
      Visible = False
    end
    object fun_Devs_SendOpenNightMode: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #32676#21457#24320#21551#22812#38388#27169#24335
    end
    object fun_SendVideo: TAction
      Category = '3'#21151#33021
      Caption = #19979#21457#35270#39057#25991#20214
      Visible = False
    end
    object fun_Devs_SendVideo: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #32676#21457#35270#39057#25991#20214
    end
    object Show_EventList: TAction
      Category = '7'#31383#21475#35270#22270
      Caption = #26174#31034#25509#25910#20107#20214#20449#24687
      OnExecute = Show_EventListExecute
    end
    object fun_SendClassInfoMenu: TAction
      Category = '3'#21151#33021
      Caption = #19979#21457#20998#31867#33756#21333
      Visible = False
      OnExecute = fun_SendClassInfoMenuExecute
    end
    object fun_Devs_SendClassInfoMenu: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #32676#21457#20998#31867#33756#21333
      OnExecute = fun_Devs_SendClassInfoMenuExecute
    end
    object Show_AnswerList: TAction
      Category = '7'#31383#21475#35270#22270
      Caption = #26174#31034#25509#25910#31572#26696
      OnExecute = Show_AnswerListExecute
    end
    object fun_SendInfoMenu: TAction
      Category = '3'#21151#33021
      Caption = #19979#21457#28857#25773#33756#21333
      ImageIndex = 101
      OnExecute = fun_SendInfoMenuExecute
    end
    object fun_Devs_SendInfoMenu: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #32676#21457#28857#25773#33756#21333
      ImageIndex = 101
      OnExecute = fun_Devs_SendInfoMenuExecute
    end
    object fun_QueryLightState: TAction
      Category = '3'#21151#33021
      Caption = #26597#35810#39030#28783#29366#24577
      Visible = False
    end
    object fun_devs_QueryLightState: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #32676#21457#39030#28783#29366#24577
    end
    object show_LightStateList: TAction
      Category = '7'#31383#21475#35270#22270
      Caption = #35774#22791#29366#24577
    end
    object fun_QueryLedState: TAction
      Category = '3'#21151#33021
      Caption = #26597#35810'LED'#29366#24577
      Visible = False
    end
    object fun_Devs_QueryLedState: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #32676#21457#26597#35810'Led'#29366#24577
    end
    object fun_InitializeMCU: TAction
      Category = '3'#21151#33021
      Caption = #24674#22797'MCU'#21021#22987#20540
      OnExecute = fun_InitializeMCUExecute
    end
    object fun_Devs_InitializeMCU: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #32676#21457'MCU'#21021#22987#20540
      OnExecute = fun_Devs_InitializeMCUExecute
    end
    object fun_ControlTerminal: TAction
      Category = '3'#21151#33021
      Caption = #32456#31471#25511#21046
      ImageIndex = 100
      OnExecute = fun_ControlTerminalExecute
    end
    object fun_Devs_ControlTerminal: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #32676#21457#32456#31471#25511#21046
      ImageIndex = 100
      OnExecute = fun_Devs_ControlTerminalExecute
    end
    object fun_ControlMCU: TAction
      Category = '3'#21151#33021
      Caption = #25511#21046'MCU'#22797#20301
      OnExecute = fun_ControlMCUExecute
    end
    object fun_Devs_ControlMCU: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #32676#21457'MCU'#22797#20301
      OnExecute = fun_Devs_ControlMCUExecute
    end
    object fun_QueryLcdState: TAction
      Category = '3'#21151#33021
      Caption = #26597#35810'LCD'#29366#24577
    end
    object fun_Devs_QueryLcdState: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #32676#21457#26597#35810'LCD'#29366#24577
    end
    object fun_ResetLCD: TAction
      Category = '3'#21151#33021
      Caption = #22797#20301'LCD'
    end
    object fun_Devs_ResetLCD: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #32676#21457#22797#20301'LCD'
    end
    object fun_OpenLCD: TAction
      Category = '3'#21151#33021
      Caption = #25511#21046'LCD'#24320#20851
    end
    object fun_Devs_OpenLCD: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #32676#21457#24320#21551'LCD'
    end
    object fun_SendViewAdInfo: TAction
      Category = '3'#21151#33021'_'#24191#21578#30456#20851
      Caption = #26174#31034#25351#23450#24191#21578#20449#24687
      Visible = False
    end
    object fun_Devs_SendViewAdInfo: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #32676#21457#26174#31034#25351#23450#24191#21578#20449#24687
    end
    object fun_SendDownLoadAdInfo: TAction
      Category = '3'#21151#33021'_'#24191#21578#30456#20851
      Caption = #19979#36733#25351#23450#24191#21578#20449#24687
      Visible = False
    end
    object fun_Devs_SendDownLoadAdInfo: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #32676#21457#19979#36733#25351#23450#24191#21578#20449#24687
    end
    object fun_Devs_QueryAdInfo: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #32676#21457#26597#35810#27491#22312#25773#25918#30340#24191#21578#20449#24687
    end
    object fun_QueryAdInfo: TAction
      Category = '3'#21151#33021'_'#24191#21578#30456#20851
      Caption = #26597#35810#27491#22312#25773#25918#30340#24191#21578
      Visible = False
    end
    object fun_QueryALLAdInfo: TAction
      Category = '3'#21151#33021'_'#24191#21578#30456#20851
      Caption = #26597#35810'LCD'#24191#21578#20449#24687
      Visible = False
    end
    object fun_SendDeleteAdInfo: TAction
      Category = '3'#21151#33021'_'#24191#21578#30456#20851
      Caption = #21024#38500#25351#23450#30340#24191#21578#20449#24687
      Visible = False
    end
    object fun_SendDeleteAllAdInfo: TAction
      Category = '3'#21151#33021'_'#24191#21578#30456#20851
      Caption = #21024#38500#25152#26377#24191#21578#20449#24687
      Visible = False
    end
    object fun_Devs_SendDeleteAllAdInfo: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #32676#21457#21024#38500#25152#26377#24191#21578#20449#24687
    end
    object ck_MessageList: TAction
      Category = '4'#20449#24687#26597#30475
      Caption = #26597#35810#25991#26412#20449#24687
      Visible = False
      OnExecute = ck_MessageListExecute
    end
    object tj_ServeJudge: TAction
      Category = '4'#20449#24687#26597#30475
      Caption = #26381#21153#35780#20215#32479#35745
      ImageIndex = 25
    end
    object show_EarlyWarningCar: TAction
      Category = '7'#31383#21475#35270#22270
      Caption = #26174#31034#39044#35686#20449#24687
      OnExecute = show_EarlyWarningCarExecute
    end
    object fun_SendQueryAudio: TAction
      Category = '3'#21151#33021
      Caption = #38899#39057#25968#25454#26816#32034
      ImageIndex = 104
      OnExecute = fun_SendQueryAudioExecute
    end
    object fun_Devs_SendQueryAudio: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #32676#21457#38899#39057#25968#25454#26816#32034
      OnExecute = fun_Devs_SendQueryAudioExecute
    end
    object fun_Polling_MCU: TAction
      Category = '3'#21151#33021
      Caption = #35774#22791#24033#26816
      ImageIndex = 9
      Visible = False
      OnExecute = fun_Polling_MCUExecute
    end
    object fun_Devs_Polling_MCU: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #32676#21457#35774#22791#24033#26816
      Visible = False
      OnExecute = fun_Devs_Polling_MCUExecute
    end
    object Show_Prompt_Info: TAction
      Category = '7'#31383#21475#35270#22270
      Caption = #26174#31034#25552#31034#20449#24687
      Visible = False
      OnExecute = Show_Prompt_InfoExecute
    end
    object Show_QueryPictureList: TAction
      Category = '7'#31383#21475#35270#22270
      Caption = #26174#31034#22270#20687#26816#32034#21015#34920
      OnExecute = Show_QueryPictureListExecute
    end
    object Show_ServeJudgeList: TAction
      Category = '7'#31383#21475#35270#22270
      Caption = #26381#21153#35780#20215#21015#34920
    end
    object show_Audio: TAction
      Category = '7'#31383#21475#35270#22270
      Caption = #26174#31034#38899#39057
      OnExecute = show_AudioExecute
    end
    object fun_SetMeterParam: TAction
      Category = '3'#21151#33021'_'#20986#31199#36710#30456#20851
      Caption = #35774#32622#35745#20215#22120#21442#25968
      Visible = False
    end
    object fun_Devs_SetMeterParam: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #32676#21457#35774#32622#35745#20215#22120#21442#25968
    end
    object fun_ReadMeterParam: TAction
      Category = '3'#21151#33021'_'#20986#31199#36710#30456#20851
      Caption = #26597#35810#35745#20215#22120#21442#25968
      Visible = False
    end
    object fun_QueryMeterState: TAction
      Category = '3'#21151#33021'_'#20986#31199#36710#30456#20851
      Caption = #26597#35810#35745#20215#22120#29366#24577
      Visible = False
    end
    object fun_Devs_QueryMeterState: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #32676#21457#26597#35810#35745#20215#22120#29366#24577
    end
    object fun_QueryTSMState: TAction
      Category = '3'#21151#33021
      Caption = #26597#35810'TSM'#29366#24577
    end
    object fun_Devs_QueryTSMState: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #32676#21457#26597#35810'TSM'#29366#24577
    end
    object fun_CancelOrder: TAction
      Category = '3'#21151#33021'_'#20986#31199#36710#30456#20851
      Caption = #21462#28040#35746#21333
      ImageIndex = 33
      Visible = False
    end
    object sys_manage_driverBlacklist: TAction
      Category = '1'#31995#32479#31649#29702
      Caption = #21496#26426#40657#21517#21333#31649#29702
      ImageIndex = 89
      Visible = False
      OnExecute = sys_manage_driverBlacklistExecute
    end
    object sys_manage_passengerblacklist: TAction
      Category = '1'#31995#32479#31649#29702
      Caption = #20056#23458#40657#21517#21333#31649#29702
      ImageIndex = 90
      Visible = False
      OnExecute = sys_manage_passengerblacklistExecute
    end
    object ck_DriverIntegral: TAction
      Category = '4'#20449#24687#26597#30475
      Caption = #21496#26426#31215#20998#26597#35810
    end
    object tool_FindThing: TAction
      Category = '2'#22320#22270#24037#20855
      Caption = #22833#29289#26597#25214
      Hint = #22833#29289#26597#25214
      ImageIndex = 57
      Visible = False
      OnExecute = tool_FindThingExecute
    end
    object tool_SetAreaAlarmToDev_Circle: TAction
      Category = '2'#22320#22270#24037#20855
      Caption = #22686#21152
      Hint = #30011#19979#21457#21040#36710#26426#30340#22278#24418#21306#22495
      ImageIndex = 96
      OnExecute = tool_SetAreaAlarmToDev_CircleExecute
    end
    object show_FindThing: TAction
      Category = '7'#31383#21475#35270#22270
      Caption = #22833#29289#26597#25214
      OnExecute = show_FindThingExecute
    end
    object ck_QuestionList: TAction
      Category = '4'#20449#24687#26597#30475
      Caption = #26597#35810#25552#38382#20449#24687
      Visible = False
      OnExecute = ck_QuestionListExecute
    end
    object ck_QueryCmdList: TAction
      Category = '4'#20449#24687#26597#30475
      Caption = #26597#35810#26085#24535#20449#24687
      Visible = False
      OnExecute = ck_QueryCmdListExecute
    end
    object fun_QueryBlackVer: TAction
      Category = '3'#21151#33021
      Caption = #26597#35810#40657#21517#21333#29256#26412
      Visible = False
      OnExecute = fun_QueryBlackVerExecute
    end
    object fun_sendUpBlace: TAction
      Category = '3'#21151#33021
      Caption = #36890#30693#19979#36733#40657#21517#21333
      Visible = False
    end
    object fun_Devs_SendUpBlackVer: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #32676#21457#19979#36733#40657#21517#21333
    end
    object Show_Abnormal_CarList: TAction
      Category = '7'#31383#21475#35270#22270
      Caption = #24322#24120#36710#36742#21015#34920
      OnExecute = Show_Abnormal_CarListExecute
    end
    object fun_Devs_FindPostion: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #32676#21457#20301#32622#26597#35810
    end
    object fun_PlayMusic: TAction
      Category = '3'#21151#33021'_'#24102#30005#35805#26381#21153#22120
      Caption = #25773#25918#38899#20048
      ImageIndex = 4
      ShortCut = 117
      Visible = False
    end
    object fun_StopMusic: TAction
      Category = '3'#21151#33021'_'#24102#30005#35805#26381#21153#22120
      Caption = #20572#27490#25773#25918
      ImageIndex = 72
      ShortCut = 118
      Visible = False
    end
    object fun_showinfoFrm: TAction
      Category = '3'#21151#33021'_'#24102#30005#35805#26381#21153#22120
      Caption = #28040#24687
      ShortCut = 8275
      Visible = False
    end
    object ck_UpdateRecord: TAction
      Category = '4'#20449#24687#26597#30475
      Caption = #26597#35810#21319#32423#35760#24405#20449#24687
      Visible = False
      OnExecute = ck_UpdateRecordExecute
    end
    object fun_zdgz: TAction
      Category = '3'#21151#33021
      Caption = #37325#28857#36319#36394
      Hint = #25171#24320#19968#20010#26032#30340#22320#22270#31383#21475#65292#37325#28857#36319#36394#19968#20010#36710
      ImageIndex = 78
      ShortCut = 114
      OnExecute = fun_zdgzExecute
    end
    object Tj_Online: TAction
      Category = '5'#32479#35745
      Caption = #22312#32447#29575#32479#35745
      ImageIndex = 46
      OnExecute = Tj_OnlineExecute
    end
    object Info_DevModify: TAction
      Category = '5'#32479#35745
      Caption = #36710#36742#32500#20462#21488#24080
      ImageIndex = 45
      OnExecute = Info_DevModifyExecute
    end
    object Info_DevAlarmInfo: TAction
      Category = '5'#32479#35745
      Caption = #25253#35686#22788#29702#21488#24080
      ImageIndex = 45
      OnExecute = Info_DevAlarmInfoExecute
    end
    object Info_SysManage: TAction
      Category = '5'#32479#35745
      Caption = #20449#24687#31649#29702
      ImageIndex = 64
      OnExecute = Info_SysManageExecute
    end
    object tool_SetAreaAlarmToDev_Rect: TAction
      Category = '2'#22320#22270#24037#20855
      Caption = 'tool_SetAreaAlarmToDev_Rect'
      Hint = #30011#19979#21457#21040#36710#26426#30340#30697#24418#21306#22495
      ImageIndex = 95
      OnExecute = tool_SetAreaAlarmToDev_RectExecute
    end
    object tool_SetAreaAlarmToDev_Polygon: TAction
      Category = '2'#22320#22270#24037#20855
      Caption = 'tool_SetAreaAlarmToDev_Polygon'
      Hint = #30011#19979#21457#21040#36710#26426#30340#22810#36793#24418#21306#22495
      ImageIndex = 97
      OnExecute = tool_SetAreaAlarmToDev_PolygonExecute
    end
    object fun_Devs_Record: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #24405#38899
      ImageIndex = 98
      OnExecute = fun_Devs_RecordExecute
    end
    object fun_Record: TAction
      Category = '3'#21151#33021
      Caption = #24405#38899
      ImageIndex = 98
      OnExecute = fun_RecordExecute
    end
    object fun_SetAreaToDev: TAction
      Category = '3'#21151#33021
      Caption = #35774#32622#21306#22495'/'#36335#32447#21040#36710#26426#20013
      ImageIndex = 109
      OnExecute = fun_SetAreaToDevExecute
    end
    object fun_DelAreaFromDev: TAction
      Category = '3'#21151#33021
      Caption = #21024#38500#35813#36710#26426#20013#25351#23450#30340#21306#22495'/'#36335#32447
      ImageIndex = 110
      OnExecute = fun_DelAreaFromDevExecute
    end
    object fun_DelAllAreaFromDev: TAction
      Category = '3'#21151#33021
      Caption = #24378#21046#21024#38500#35813#36710#26426#20013#25152#26377#21306#22495'/'#36335#32447
      ImageIndex = 111
      OnExecute = fun_DelAllAreaFromDevExecute
    end
    object fun_SendTSPData: TAction
      Category = '3'#21151#33021
      Caption = #21457#36865#36879#20256#25968#25454
      ImageIndex = 108
      OnExecute = fun_SendTSPDataExecute
    end
    object fun_Devs_SendTSPData: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #21457#36865#36879#20256#25968#25454
      OnExecute = fun_Devs_SendTSPDataExecute
    end
    object fun_CollectRunRecData: TAction
      Category = '3'#21151#33021
      Caption = #34892#39542#35760#24405#25968#25454#37319#38598
      ImageIndex = 106
      OnExecute = fun_CollectRunRecDataExecute
    end
    object fun_Devs_CollectRunRecData: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #34892#39542#35760#24405#25968#25454#19978#20256
      OnExecute = fun_Devs_CollectRunRecDataExecute
    end
    object fun_SetRunRecParam: TAction
      Category = '3'#21151#33021
      Caption = #34892#39542#35760#24405#21442#25968#19979#20256
      ImageIndex = 107
      OnExecute = fun_SetRunRecParamExecute
    end
    object fun_Devs_SetRunRecParam: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #34892#39542#35760#24405#21442#25968#19979#20256
      OnExecute = fun_Devs_SetRunRecParamExecute
    end
    object show_DevAlarm: TAction
      Category = '7'#31383#21475#35270#22270
      Caption = #26174#31034#25253#35686#20449#24687'('#32456#31471#19978#25253')'
      OnExecute = show_DevAlarmExecute
    end
    object show_ERunDataList: TAction
      Category = '7'#31383#21475#35270#22270
      Caption = #26174#31034#30005#23376#36816#21333#19978#25253#21015#34920
      Hint = #26174#31034#30005#23376#36816#21333#21015#34920
      OnExecute = show_ERunDataListExecute
    end
    object show_DriverUploadInfoList: TAction
      Category = '7'#31383#21475#35270#22270
      Caption = #26174#31034#39550#39542#21592#36523#20221#20449#24687#37319#38598#19978#25253#21015#34920
      Hint = #26174#31034#39550#39542#21592#36523#20221#20449#24687#37319#38598#19978#25253#21015#34920
      OnExecute = show_DriverUploadInfoListExecute
    end
    object fun_DealEmgcyAlarm: TAction
      Category = '3'#21151#33021
      Caption = #22788#29702#32039#24613#25253#35686
      ImageIndex = 112
      OnExecute = fun_DealEmgcyAlarmExecute
    end
    object ck_devalarm: TAction
      Category = '4'#20449#24687#26597#30475
      Caption = #26597#35810#25253#35686#20449#24687
      ImageIndex = 112
      OnExecute = ck_devalarmExecute
    end
    object ck_devgrouponline: TAction
      Category = '4'#20449#24687#26597#30475
      Caption = #26597#35810#36710#32452#22312#32447#29575
      ImageIndex = 113
      OnExecute = ck_devgrouponlineExecute
    end
    object ck_devmileage: TAction
      Category = '4'#20449#24687#26597#30475
      Caption = #26597#35810#36710#36742#34892#39542#37324#31243
      ImageIndex = 114
      OnExecute = ck_devmileageExecute
    end
    object show_QueryAudioList: TAction
      Category = '7'#31383#21475#35270#22270
      Caption = #26174#31034#38899#39057#26816#32034#21015#34920
      OnExecute = show_QueryAudioListExecute
    end
    object sys_infotype: TAction
      Category = '1'#31995#32479#31649#29702
      Caption = #20449#24687#28857#25773#31867#22411#32500#25252
      OnExecute = sys_infotypeExecute
    end
    object sys_info: TAction
      Category = '1'#31995#32479#31649#29702
      Caption = #20449#24687#28857#25773#20449#24687#32500#25252
      OnExecute = sys_infoExecute
    end
    object show_MediaEventUpload: TAction
      Category = '7'#31383#21475#35270#22270
      Caption = #26174#31034#22810#23186#20307#20107#20214#20449#24687#19978#20256#21015#34920
      OnExecute = show_MediaEventUploadExecute
    end
    object show_SrvRunInfo: TAction
      Category = '7'#31383#21475#35270#22270
      Caption = #26174#31034#26381#21153#22120#36816#34892#29366#24577
      OnExecute = show_SrvRunInfoExecute
    end
    object show_RunRecData: TAction
      Category = '7'#31383#21475#35270#22270
      Caption = #26174#31034#34892#39542#35760#24405#20202#19978#20256#25968#25454
      OnExecute = show_RunRecDataExecute
    end
    object show_AlarmSupervise: TAction
      Category = '7'#31383#21475#35270#22270
      Caption = #26174#31034#30563#21150#25253#35686#21015#34920
      OnExecute = show_AlarmSuperviseExecute
    end
    object fun_SendQueryVideo: TAction
      Category = '3'#21151#33021
      Caption = #35270#39057#25968#25454#26816#32034
      ImageIndex = 117
      OnExecute = fun_SendQueryVideoExecute
    end
    object show_QueryVideoList: TAction
      Category = '7'#31383#21475#35270#22270
      Caption = #26174#31034#35270#39057#26816#32034#21015#34920
      OnExecute = show_QueryVideoListExecute
    end
    object fun_Devs_SendQueryVideo: TAction
      Category = '3'#21151#33021'_'#20998#32452
      Caption = #32676#21457#23384#20648#35270#39057#26816#32034
      OnExecute = fun_Devs_SendQueryVideoExecute
    end
    object show_RecvGovInfo: TAction
      Category = '7'#31383#21475#35270#22270
      Caption = #26174#31034#25919#24220#24179#21488#19979#21457#25968#25454
      OnExecute = show_RecvGovInfoExecute
    end
    object show_applyGpsDataFromGov: TAction
      Category = '3'#21151#33021
      Caption = #30003#35831#20132#25442
      ImageIndex = 119
      OnExecute = show_applyGpsDataFromGovExecute
    end
    object show_cancelGpsDataFromGov: TAction
      Category = '3'#21151#33021
      Caption = #21462#28040#20132#25442
      ImageIndex = 120
      OnExecute = show_cancelGpsDataFromGovExecute
    end
    object show_video: TAction
      Category = '7'#31383#21475#35270#22270
      Caption = #26174#31034#35270#39057
      OnExecute = show_videoExecute
    end
    object show_tspDataUpload: TAction
      Category = '7'#31383#21475#35270#22270
      Caption = #26174#31034#32456#31471#36879#20256#25968#25454
      OnExecute = show_tspDataUploadExecute
    end
    object fun_readVer: TAction
      Category = '3'#21151#33021
      Caption = #35835#21462#32456#31471#36719#20214#29256#26412
      ImageIndex = 121
      OnExecute = fun_readVerExecute
    end
    object help_updatelog: TAction
      Category = #24110#21161
      Caption = #26412#36719#20214#20462#25913#26085#24535
      OnExecute = help_updatelogExecute
    end
    object show_DevKeyEventLog: TAction
      Category = '7'#31383#21475#35270#22270
      Caption = #26174#31034#36710#36742#20851#38190#20107#20214#26085#24535
      OnExecute = show_DevKeyEventLogExecute
    end
    object show_areaToDev: TAction
      Category = '7'#31383#21475#35270#22270
      Caption = #26174#31034#35774#32622#21040#36710#26426#20013#30340#21306#22495'/'#36335#32447
      OnExecute = show_areaToDevExecute
    end
    object fun_OrderVideo: TAction
      Category = '3'#21151#33021
      Caption = #35270#39057#30417#25511
      ImageIndex = 122
      OnExecute = fun_OrderVideoExecute
    end
    object ck_notice: TAction
      Category = '4'#20449#24687#26597#30475
      Caption = #26597#35810#24179#21488#36890#30693
      ImageIndex = 123
      OnExecute = ck_noticeExecute
    end
    object sys_feedback: TAction
      Category = '1'#31995#32479#31649#29702
      Caption = #29992#25143#21453#39304
      ImageIndex = 124
      ShortCut = 49222
      OnExecute = sys_feedbackExecute
    end
    object Ck_QueryDevRunStateOnTheTime: TAction
      Category = '4'#20449#24687#26597#30475
      Caption = #26597#35810#26576#26102#38388#28857#30340#36710#36742#36816#34892#29366#24577
      ImageIndex = 5
      OnExecute = Ck_QueryDevRunStateOnTheTimeExecute
    end
    object ck_queryPhotoPos: TAction
      Category = '4'#20449#24687#26597#30475
      Caption = #26597#35810#29031#29255#21450#20301#32622
      ImageIndex = 125
      OnExecute = ck_queryPhotoPosExecute
    end
    object fun_photo_fatigue: TAction
      Category = '3'#21151#33021
      Caption = #25293#25668#21496#26426#22836#20687
      ImageIndex = 87
      OnExecute = fun_photo_fatigueExecute
    end
    object sys_refresh: TAction
      Category = '1'#31995#32479#31649#29702
      Caption = #21047#26032
      ImageIndex = 126
      ShortCut = 116
      OnExecute = sys_refreshExecute
    end
    object ck_queryDevMileage: TAction
      Category = '4'#20449#24687#26597#30475
      Caption = #26597#35810#36710#36742#34892#39542#37324#31243#21450#27833#32791
      ImageIndex = 127
      OnExecute = ck_queryDevMileageExecute
    end
    object ck_querySetCarRunStatePlan: TAction
      Category = '4'#20449#24687#26597#30475
      Caption = #26597#35810#36710#36742#37325#36733#36816#34892#35745#21010
      ImageIndex = 128
      OnExecute = ck_querySetCarRunStatePlanExecute
    end
    object fun_setCarRunStatePlan: TAction
      Category = '3'#21151#33021
      Caption = #35774#32622#36710#36742#37325#36733#36816#34892#35745#21010
      ImageIndex = 128
      OnExecute = fun_setCarRunStatePlanExecute
    end
    object fun_upgradeterminal: TAction
      Category = '3'#21151#33021
      Caption = #21319#32423#32456#31471
      ImageIndex = 129
      OnExecute = fun_upgradeterminalExecute
    end
    object fun_GetDriverInfo: TAction
      Category = '3'#21151#33021
      Caption = #33719#21462#39550#39542#21592#36523#20221#20449#24687
      ImageIndex = 131
      OnExecute = fun_GetDriverInfoExecute
    end
    object fun_getTerminalProperty: TAction
      Category = '3'#21151#33021
      Caption = #26597#35810#32456#31471#23646#24615
    end
  end
  object MainMenu2: TMainMenu
    AutoHotkeys = maManual
    Images = ImageList2
    Left = 48
    Top = 88
    object N42: TMenuItem
      Caption = #31995#32479#31649#29702'(&S)'
      object N159: TMenuItem
        Caption = #22522#30784#25968#25454#32500#25252
        ImageIndex = 8
        object N167: TMenuItem
          Action = sys_infotype
          ImageIndex = 116
        end
        object N170: TMenuItem
          Action = sys_info
          ImageIndex = 115
        end
      end
      object syslock1: TMenuItem
        Action = sys_lock
      end
      object N5: TMenuItem
        Action = sys_off
      end
      object N45: TMenuItem
        Caption = '-'
        ImageIndex = 16
      end
      object N46: TMenuItem
        Action = sys_change_pass
      end
      object N47: TMenuItem
        Caption = '-'
      end
      object N238: TMenuItem
        Action = sys_feedback
      end
      object N88: TMenuItem
        Action = sys_refresh
      end
      object N94: TMenuItem
        Caption = '-'
      end
      object N48: TMenuItem
        Action = sys_exit
      end
    end
    object N49: TMenuItem
      Caption = #22320#22270#24037#20855'(&T)'
      Visible = False
      object N51: TMenuItem
        Action = tool_zoom_in
      end
      object N52: TMenuItem
        Action = tool_zoom_out
      end
      object N54: TMenuItem
        Action = tool_move
      end
      object N53: TMenuItem
        Caption = '-'
      end
      object N59: TMenuItem
        Action = tool_not_select
      end
      object N55: TMenuItem
        Action = tool_select_point
      end
      object N74: TMenuItem
        Action = tool_RectSelect
      end
      object N22: TMenuItem
        Caption = '-'
      end
      object N23: TMenuItem
        Action = tool_locate
      end
      object TMenuItem
        Action = tool_distance
      end
      object Action11: TMenuItem
        Action = tool_SetConfineAlarmArea
        Visible = False
      end
      object N206: TMenuItem
        Action = tool_UserDefinedtext
      end
      object N261: TMenuItem
        Action = tool_SeekCar
        Visible = False
      end
      object N56: TMenuItem
        Caption = '-'
      end
      object N58: TMenuItem
        Action = tool_bird_eye
      end
      object N57: TMenuItem
        Action = tool_layer_control
      end
      object N208: TMenuItem
        Action = Map_Manage
      end
      object N254: TMenuItem
        Action = tool_SetFactory
      end
    end
    object N64: TMenuItem
      Caption = #30417#25511'(&M)'
      object N71: TMenuItem
        Caption = #23545#20998#32452#36710#36742
        ImageIndex = 69
        object N187: TMenuItem
          Action = fun_Devs_Show
        end
        object N212: TMenuItem
          Action = fun_Devs_Hide
        end
      end
      object N116: TMenuItem
        Caption = '-'
      end
      object Menu_MainShow: TMenuItem
        Caption = #30028#38754#26174#31034
        ImageIndex = 102
        object N92: TMenuItem
          Action = fun_Locate_Car
        end
        object N65: TMenuItem
          Action = fun_watch_car
        end
        object N2: TMenuItem
          Action = fun_ShowACarTrack
        end
        object N186: TMenuItem
          Action = fun_DevHide
        end
        object N251: TMenuItem
          Action = fun_DevShowOnly
        end
      end
      object N280: TMenuItem
        Caption = '-'
      end
      object N11: TMenuItem
        Action = fun_Set_DevParam
      end
      object N20: TMenuItem
        Action = fun_view_DevParam
        ShortCut = 16466
      end
      object N173: TMenuItem
        Action = fun_ControlTerminal
      end
      object N111: TMenuItem
        Action = fun_FindPostion
        ShortCut = 113
      end
      object N128: TMenuItem
        Action = fun_PursueDev
      end
      object N90: TMenuItem
        Action = fun_SendControlInfo
      end
      object N107: TMenuItem
        Action = fun_setDevEventList
      end
      object N113: TMenuItem
        Action = fun_sendQuestion
      end
      object N168: TMenuItem
        Action = fun_SendInfoMenu
      end
      object N126: TMenuItem
        Action = fun_SendInfoServer
      end
      object N118: TMenuItem
        Action = fun_SendBackCallTel
      end
      object N89: TMenuItem
        Action = fun_SetDevTelList
      end
      object N120: TMenuItem
        Action = fun_SendControlCar
      end
      object N61: TMenuItem
        Action = fun_GetAPicture
      end
      object N7: TMenuItem
        Action = fun_Record
      end
      object N9: TMenuItem
        Action = fun_SendQueryPicture
      end
      object N12: TMenuItem
        Action = fun_SendQueryAudio
      end
      object N178: TMenuItem
        Action = fun_SendQueryVideo
      end
      object N6: TMenuItem
        Caption = '-'
        Visible = False
      end
      object N133: TMenuItem
        Action = fun_CollectRunRecData
      end
      object N134: TMenuItem
        Action = fun_SetRunRecParam
      end
      object N132: TMenuItem
        Caption = '-'
      end
      object N183: TMenuItem
        Caption = #19982#25919#24220#24179#21488#20132#25442#25351#23450#36710#36742#23450#20301#20449#24687
        ImageIndex = 118
        object N184: TMenuItem
          Action = show_applyGpsDataFromGov
        end
        object N188: TMenuItem
          Action = show_cancelGpsDataFromGov
        end
      end
      object N182: TMenuItem
        Caption = '-'
      end
      object N289: TMenuItem
        Action = ReadAlarmAreaFroDev
      end
      object N219: TMenuItem
        Action = fun_ReadDriverInfo
      end
      object N264: TMenuItem
        Action = fun_ReadDevHourDis
        ImageIndex = 21
      end
      object GPRS1: TMenuItem
        Action = fun_ReadGPRSFlux
      end
      object N101: TMenuItem
        Action = fun_ReadDevVersion_Extend
      end
      object N102: TMenuItem
        Action = fun_UpdateDevFirmWare
      end
    end
    object N135: TMenuItem
      Caption = #26597#35810#32479#35745'(&Q)'
      object N136: TMenuItem
        Action = ck_DevInfo
      end
      object N137: TMenuItem
        Action = ck_DriverInfo
        Visible = False
      end
      object N27: TMenuItem
        Caption = '-'
      end
      object N151: TMenuItem
        Action = ck_OverSpeedInfo
        Visible = False
      end
      object N240: TMenuItem
        Action = ck_EmergncyAlarmInfo
        Visible = False
      end
      object N248: TMenuItem
        Caption = '-'
        Visible = False
      end
      object N231: TMenuItem
        Action = ck_Picture
      end
      object N234: TMenuItem
        Action = ck_MessageList
      end
      object N149: TMenuItem
        Action = ck_devalarm
      end
      object N150: TMenuItem
        Action = ck_devgrouponline
      end
      object N157: TMenuItem
        Action = ck_devmileage
        Visible = False
      end
      object N315: TMenuItem
        Action = ck_QuestionList
      end
      object N317: TMenuItem
        Action = ck_QueryCmdList
      end
      object N50: TMenuItem
        Action = ck_UpdateRecord
      end
      object N243: TMenuItem
        Action = ck_queryPhotoPos
      end
      object N213: TMenuItem
        Caption = '-'
        Visible = False
      end
      object N236: TMenuItem
        Action = ck_notice
      end
      object N287: TMenuItem
        Action = ck_TjGrpDevs
      end
      object ckDevHourDis1: TMenuItem
        Action = ck_DevHourDis
        Visible = False
      end
      object N225: TMenuItem
        Action = ck_TjOverSpeed
        Visible = False
      end
      object N291: TMenuItem
        Action = ck_DevMonthRunInfo
        Visible = False
      end
      object N246: TMenuItem
        Action = ck_querySetCarRunStatePlan
      end
      object N245: TMenuItem
        Action = ck_queryDevMileage
      end
      object N242: TMenuItem
        Action = Ck_QueryDevRunStateOnTheTime
      end
    end
    object N96: TMenuItem
      Caption = #35774#32622'(&S)'
      object N95: TMenuItem
        Action = set_AllCarTrack
        Visible = False
      end
      object N237: TMenuItem
        Action = Set_HisTrack
        Visible = False
      end
      object N97: TMenuItem
        Caption = '-'
        Visible = False
      end
      object N98: TMenuItem
        Caption = #22320#22270#22270#23618#35774#32622
        Visible = False
        object N99: TMenuItem
          Action = map_openLayer
        end
        object N100: TMenuItem
          Action = map_CloseLayer
        end
      end
      object N63: TMenuItem
        Caption = '-'
        Visible = False
      end
      object N66: TMenuItem
        Action = set_AlarmSound
      end
      object N277: TMenuItem
        Caption = '-'
        Visible = False
      end
      object N278: TMenuItem
        Action = Set_DevOil
        Visible = False
      end
      object N67: TMenuItem
        Action = set_SaveWorkShop
      end
      object N180: TMenuItem
        Caption = '-'
      end
      object SystemConfig1: TMenuItem
        Action = SystemConfig
      end
    end
    object N75: TMenuItem
      Caption = #31383#21475#35270#22270'(&V)'
      object N209: TMenuItem
        Action = show_fullScreen
      end
      object N143: TMenuItem
        Caption = #31995#32479#30382#32932#39118#26684
        Visible = False
        object ClearLooksBLUE1: TMenuItem
          AutoCheck = True
          Caption = 'ClearLooks-BLUE'
          RadioItem = True
          OnClick = Xplorer1Click
        end
        object ClearLooksHUMAN1: TMenuItem
          Tag = 1
          AutoCheck = True
          Caption = 'ClearLooks-HUMAN'
          RadioItem = True
          OnClick = Xplorer1Click
        end
        object CrystalClearCRCL1S1: TMenuItem
          Tag = 2
          AutoCheck = True
          Caption = 'Crystal Clear-CRCL1S'
          RadioItem = True
          OnClick = Xplorer1Click
        end
        object GUIRelaxCINDER1: TMenuItem
          Tag = 3
          AutoCheck = True
          Caption = 'GUIRelax-CINDER'
          RadioItem = True
          OnClick = Xplorer1Click
        end
        object GUIRelaxSKYMAN1: TMenuItem
          Tag = 4
          AutoCheck = True
          Caption = 'GUIRelax-SKYMAN'
          RadioItem = True
          OnClick = Xplorer1Click
        end
        object GUIRelaxSUBTLE1: TMenuItem
          Tag = 5
          AutoCheck = True
          Caption = 'GUIRelax-SUBTLE'
          RadioItem = True
          OnClick = Xplorer1Click
        end
        object iTunes1: TMenuItem
          Tag = 6
          AutoCheck = True
          Caption = 'iTunes'
          RadioItem = True
          OnClick = Xplorer1Click
        end
        object macos1: TMenuItem
          Tag = 7
          AutoCheck = True
          Caption = 'macos'
          RadioItem = True
          OnClick = Xplorer1Click
        end
        object MSN1: TMenuItem
          Tag = 8
          AutoCheck = True
          Caption = 'MSN'
          RadioItem = True
          OnClick = Xplorer1Click
        end
        object office20031: TMenuItem
          Tag = 9
          AutoCheck = True
          Caption = 'office2003'
          RadioItem = True
          OnClick = Xplorer1Click
        end
        object office20071: TMenuItem
          Tag = 10
          AutoCheck = True
          Caption = 'office2007'
          RadioItem = True
          OnClick = Xplorer1Click
        end
        object ONaturalBLUE1: TMenuItem
          Tag = 11
          AutoCheck = True
          Caption = 'ONatural-BLUE'
          RadioItem = True
          OnClick = Xplorer1Click
        end
        object OpusOSBLUEB21: TMenuItem
          Tag = 12
          AutoCheck = True
          Caption = 'OpusOS-BLUEB2'
          RadioItem = True
          OnClick = Xplorer1Click
        end
        object OpusOSDEEP21: TMenuItem
          Tag = 13
          AutoCheck = True
          Caption = 'OpusOS-DEEP2'
          RadioItem = True
          OnClick = Xplorer1Click
        end
        object OpusOSOLIVE1: TMenuItem
          Tag = 14
          AutoCheck = True
          Caption = 'OpusOS-OLIVE'
          RadioItem = True
          OnClick = Xplorer1Click
        end
        object Royale1BLUE1: TMenuItem
          Tag = 15
          AutoCheck = True
          Caption = 'Royale1-BLUE'
          RadioItem = True
          OnClick = Xplorer1Click
        end
        object Royale1HOMESTEAD1: TMenuItem
          Tag = 16
          AutoCheck = True
          Caption = 'Royale1-HOMESTEAD'
          RadioItem = True
          OnClick = Xplorer1Click
        end
        object Royale1METALLIC1: TMenuItem
          Tag = 17
          AutoCheck = True
          Caption = 'Royale1-METALLIC'
          RadioItem = True
          OnClick = Xplorer1Click
        end
        object RoyaleGlassGRAPHITE1: TMenuItem
          Tag = 18
          AutoCheck = True
          Caption = 'Royale Glass-GRAPHITE'
          RadioItem = True
          OnClick = Xplorer1Click
        end
        object SamuiSAMUI221: TMenuItem
          Tag = 19
          AutoCheck = True
          Caption = 'Samui-SAMUI22'
          RadioItem = True
          OnClick = Xplorer1Click
        end
        object D4PANTHER1: TMenuItem
          Tag = 20
          AutoCheck = True
          Caption = 'TD 4-PANTHER'
          RadioItem = True
          OnClick = Xplorer1Click
        end
        object iger2TGR1: TMenuItem
          Tag = 21
          AutoCheck = True
          Caption = 'Tiger2-TGR'
          RadioItem = True
          OnClick = Xplorer1Click
        end
        object iger2TGRPS1: TMenuItem
          Tag = 22
          AutoCheck = True
          Caption = 'Tiger2-TGRPS'
          RadioItem = True
          OnClick = Xplorer1Click
        end
        object igerWINDOWB1: TMenuItem
          Tag = 23
          AutoCheck = True
          Caption = 'Tiger-WINDOWB'
          RadioItem = True
          OnClick = Xplorer1Click
        end
        object igerWINDOWG1: TMenuItem
          Tag = 24
          AutoCheck = True
          Caption = 'Tiger-WINDOWG'
          RadioItem = True
          OnClick = Xplorer1Click
        end
        object VistaXPVISTAXPB21: TMenuItem
          Tag = 25
          AutoCheck = True
          Caption = 'VistaXP-VISTAXPB2'
          RadioItem = True
          OnClick = Xplorer1Click
        end
        object Xplorer1: TMenuItem
          Tag = 26
          AutoCheck = True
          Caption = 'Xplorer'
          RadioItem = True
          OnClick = Xplorer1Click
        end
        object skinDefault: TMenuItem
          AutoCheck = True
          Caption = #40664#35748
          Checked = True
          RadioItem = True
          OnClick = skinDefaultClick
        end
      end
      object N210: TMenuItem
        Caption = '-'
      end
      object N77: TMenuItem
        Action = show_car
      end
      object N207: TMenuItem
        Action = show_Map
      end
      object N123: TMenuItem
        Caption = '-'
      end
      object N78: TMenuItem
        Action = show_ListCar
      end
      object N122: TMenuItem
        Action = show_ConfineAreaList
      end
      object N121: TMenuItem
        Action = show_AlarmLists
      end
      object N138: TMenuItem
        Action = show_DevAlarm
      end
      object N227: TMenuItem
        Action = show_areaToDev
      end
      object N141: TMenuItem
        Caption = '-'
      end
      object N1: TMenuItem
        Action = show_Picture
      end
      object N285: TMenuItem
        Action = show_Audio
      end
      object N223: TMenuItem
        Action = show_video
      end
      object ShowQueryPictureList1: TMenuItem
        Action = Show_QueryPictureList
      end
      object N158: TMenuItem
        Action = show_QueryAudioList
      end
      object N226: TMenuItem
        Action = show_QueryVideoList
      end
      object N142: TMenuItem
        Caption = '-'
      end
      object N241: TMenuItem
        Action = show_GPSHostory
      end
      object N127: TMenuItem
        Action = show_SearchAddress
      end
      object N109: TMenuItem
        Action = show_sended_command
      end
      object N306: TMenuItem
        Action = Show_EventList
      end
      object N316: TMenuItem
        Action = Show_AnswerList
      end
      object N204: TMenuItem
        Action = Show_Prompt_Info
      end
      object N139: TMenuItem
        Action = show_ERunDataList
      end
      object N140: TMenuItem
        Action = show_DriverUploadInfoList
      end
      object N171: TMenuItem
        Action = show_MediaEventUpload
      end
      object N172: TMenuItem
        Caption = '-'
      end
      object N176: TMenuItem
        Action = show_RunRecData
      end
      object N235: TMenuItem
        Action = show_RecvGovInfo
      end
      object N175: TMenuItem
        Action = show_SrvRunInfo
      end
      object N181: TMenuItem
        Action = show_AlarmSupervise
      end
      object N203: TMenuItem
        Action = show_tspDataUpload
      end
      object N220: TMenuItem
        Caption = '-'
      end
      object N221: TMenuItem
        Action = show_DevKeyEventLog
      end
      object N79: TMenuItem
        Caption = '-'
      end
      object N80: TMenuItem
        Action = show_toolbar
      end
      object N104: TMenuItem
        Action = show_MapToolbar
      end
      object N21: TMenuItem
        Action = show_statusBar
      end
    end
    object N76: TMenuItem
      Caption = #24110#21161'(&H)'
      object N81: TMenuItem
        Action = help_help
        Caption = #24110#21161' '
      end
      object N82: TMenuItem
        Caption = '-'
        Visible = False
      end
      object N83: TMenuItem
        Action = help_about
        ShortCut = 16496
      end
      object N215: TMenuItem
        Action = help_updatelog
      end
      object dddd1: TMenuItem
        Caption = 'Save Screen to file'
        Visible = False
      end
      object N205: TMenuItem
        Action = help_Update
      end
      object N228: TMenuItem
        Action = Print_Screen
      end
      object N229: TMenuItem
        Action = Print_Map
      end
      object N230: TMenuItem
        Action = MapSaveToJpeg
      end
    end
  end
  object ImageList1: TImageList
    Left = 9
    Top = 232
    Bitmap = {
      494C010117001800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000006000000001002000000000000060
      000000000000000000000000000000000000595D5B00686B6900545856005559
      5700565A5800565A5800565A5800565A5800575B5900575B5900575B5900575B
      5900575B5900565A58005D615F00FFFFFF00FFFFFF0011118D0011118D001111
      8D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B1704100AB693D00A75F39009F57
      3500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000053575500C3C3C300979898009093
      9200BBC1BE00C1C6C300C3C8C600C3C9C600C4C9C600C4C9C600C4C9C600C4C9
      C600C4C9C600C1C7C5005F636100FFFFFF0011119000151D9F001020AD001112
      9100111190001111900011119000111190001111900011119000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BA7B4A00C0895F00BF896200AF6D
      4700A25A3700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000053575500BEBEBE00ABABAB00AFAF
      AF00858685008B8F8D00C5C9C700D2D6D400D5D9D700D6DAD800D7DBD9008688
      C5004345B600D4D8D60071757300FFFFFF00131596006C7AD400203BC5001225
      B20010139500111EA7001330C2001330C2001222AD001012940010129400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C3885900CFA27D00CDA28000C08C
      6600B0724900A55D38009F5734009850310094492E008F432A00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000053575500BEBEBE00AAAAAA00A9A9
      A900A1A1A100999999006F6F6F00888A8900D0D2D000E3E5E4006B6CC4001111
      AC000C0CA900E4E6E50086888700FFFFFF00101398002025A2007182D8002140
      CA001731BE001939C8001939C8001939C800304DCE00444DB90010139800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CA916600CC997100D0A38100CFA4
      8300CA9E7B00BC855D00AF714900A76440009E573800974A30008F432C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000053575500BEBEBE00AAAAAA00A5A5
      A5009D9D9D00959595008F8F8F00828282005E5F64004849BB001B1BB5003535
      D3000404A6001E1EB0001314A5000B0BAA00FFFFFF000F139E001A20A6001E41
      CC001F44CF001F44CF001F44CF003657D4007080D700181DA3000F139E00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CC946900CE9D7600D5AC
      8C00CB9B7600CCA07C00C89B7600C5956F00C08F6900AC6D4800984D3100FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000053575500BEBEBE00AAAAAA00A3A3
      A3009A9A9A009292920089898900797986002425AC002424BC003838D6004141
      D9003A3AD4003C3CD2003D3DD2000000A500FFFFFF000F14A300192DB8002751
      D6002751D6002751D6003D63DA007386DB00181EA8000F14A300FFFFFF001111
      8D0011118D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CE986D00D3A8
      8600D6AC8E00C9987100C4906800BF8A5F00C28F6700BF8B64007F684700864E
      3200FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000053575500BEBEBE00A9A9A900A1A1
      A100989898008F8F8F0073738B000E0EA2002D2DC4003636D7000808CE000C0C
      CE000C0CCE000E0ECF005151DC000101A500FFFFFF000E15A8002E5DDE002E5D
      DE002E5DDE00436EE100768BDF001820AD000E15A800FFFFFF00111190001112
      9100101BA3001111900011119000FFFFFF00FFFFFF00FFFFFF00D6A27C00D4A3
      7E00DCB59800D0A17D00CC9A7400CFA48300C89A76007D8C64006AB87A008C50
      35008E412A0088402700FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000053575500BEBEBE00A7A7A7009E9E
      9E00969696008D8D8D001616A1003636C5005656DD002D2DD5002525D3001A1A
      D1001010CF001B1BD2006E6EE2000404A600FFFFFF000D15AE00537FE9003468
      E5004977E800788FE4001720B3000D15AE00FFFFFF0010129300101394001125
      B300122FC2001124B00010129300FFFFFF00FFFFFF00FFFFFF00DDAD8800DBAB
      8900E1BDA200D6AA8700D9B39400CE9F7A0095895F006DBC7C00936F4600B075
      4F00A46241008F432B008B412800FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000053575500BEBEBE00A4A4A4009C9C
      9C00939393008B8B8B0064648A001111A6005E5ED5006969E1004848DB004A4A
      DB004C4CDB004D4DDB008D8DE8000303A6000D16B2000F18B3007086E1006A94
      F0007B94E7001721B7000D16B200FFFFFF001012970011149800152BB7001737
      C7001737C7001939C70010129700FFFFFF00FFFFFF00FFFFFF00E5B49200E0B1
      8F00E6C4AB00E2BFA400D8AD8E00A8947100AB8A5700A4784800BB845D00C08F
      6900BC8A61009C52350091442C00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000053575500BEBEBE00A2A2A2009A9A
      9A009191910088888800808080006A6A7E002121B0006565D2008888E7008E8E
      E8009595EA009696EA009A9AEB000101A500FFFFFF000C17B6000F1BB800586C
      D8001623BB000C17B600FFFFFF000F139C0010159D001831BD001D40CD001D40
      CD001D40CD005C75DA000F139C00FFFFFF00FFFFFF00FFFFFF00E9BD9E00E5B7
      9700E4BB9F00E4BB9F00A0A6850076C17F00B08F5A00C7966F00CB9E7B00BC85
      5900C3926C00A6633F009A503100FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000053575500BDBDBD00A0A0A0009797
      97008F8F8F00868686007E7E7E0076767600E1E3EC003C3CB9006161CD00A7A7
      EC003030BC002828B7002122B1000101A500FFFFFF00FFFFFF000C17B9000C17
      B9000C17B900FFFFFF000F14A1001016A2001C39C300234BD300234BD300234B
      D3002D53D5004350BF000F14A100FFFFFF00FFFFFF00FFFFFF00FFFFFF00EABE
      9F00E6B89A00BAB2920077C58200B5B08100D8B09200D7AE8F00C9976F00C38F
      6600C89B7600B1714A00A25A3700FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000053575500BBBBBB009D9D9D009494
      9400898989007F7F7F007676760070707000EEF0F000EFF1F3006565C7005151
      C4001515AC00D3D4ED008889A2009696DA00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000E14A5001017A7002140C9002A56DA002A56DA002A56DA003C64
      DD002750D500121BAA000E14A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00DBBB9800C5B38600E2BEA300DFB79A00D5A88600D0A17D00CB9A
      7300CEA28000BF8B6200AB683C00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000053575500BABABA00959595008989
      89007E7E7E00757575006E6E6E0068686800EEEFEF00F2F4F400F9F9F9009292
      D7003E3EBC00FAFAFA00A1A3A200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000E15AA004755C700577FE6003061E0003061E0006A8EE9007E94
      E4004D77E4002B55D800131DAF000E15AA00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E5B59500E4BA9D00E6C4AB00E2BEA400DEB99C00D9B2
      9300D1A37F00D1A68500BB7F5100AE6A3E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000053575500ADADAD008C8C8C007F7F
      7F00757575006C6C6C006464640060606000EDEFEF00F2F3F300F7F8F800FAFB
      FB00FBFBFB00F9F9F900989B9A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000D16AF006679D9009BB5F3009BB5F3004B5BCD00121C
      B1007086DF005581EA006784E300101AB100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EABE9F00E6B89800E3B49300DFB18E00DAAB8900DAAD
      8C00DCB59800D7AF9000CC9B7400B77844000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000053575500A6A6A600858585007979
      79006E6E6E00656565005D5D5D0059595900EDEFEF00EFF1F100F3F4F400F5F6
      F600F5F6F600ECEEED007D817F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000D16B3000D16B3000D16B3000D16B3000D16B3000D16
      B300121CB5007187E1003C4CC9000D16B300FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00ECC0A100E7BB9C00E5B59400DFAE8B00D9A7
      8100D8A78200D7AC8B00D3A78400C18556000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000595D5B0053575500535755005357
      550053575500535755005357550053575500545856005A5E5C00626564006669
      6800676A6800636765006B6E6D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000C17B6000C17B6000C17B600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00DCAA8500D4A17C00D09A7000CA9166000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF001A1AAD001B1BAD001B1BAC001C1CAC001C1CAB001D1DAB001D1DAA001D1D
      AA00FFFFFF00FFFFFF00FFFFFF00FFFFFF0001630000045E00000A5B0000085B
      00000558010032732C0061905A00618D5800628B5700668C5B0044723700144B
      020015490000164B0000174500001A410000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF001A1A
      AE001717AB000F0FAC000F0FB6001212BF001818C6001D1DC7001E1EC0001E1E
      AE001E1EA900FFFFFF00FFFFFF00FFFFFF0001630000025E0000065A00000357
      00002B712A00E2EBE000FFFFFF00FBFFFB00FCFFFC00FFFFFF00F2F4F0004D76
      40000E44000011460000174300001A410000FFFFFF00013B0000001B00000000
      0000000000000000000000010000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF001919AE001616
      AC000707B2001717C1005050D2005F5FD3006666D6006363DF003F3FE0002D2D
      E2002424BD001F1FA800FFFFFF00FFFFFF0002630000005D0000005800000055
      00004F894D00FFFFFF0071B972003B9E3B003CA33D005CB35C00F7FFF800829C
      7300094000000D3E0000164000001A410000FFFFFF0003660000214E05003B6E
      3900123B1100000B000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF001919AF003A3ABF001212
      B8002222BF004B4BC3003636B6001C1CAC001C1CAB003838B4006767D8004040
      EC003B3BF2002424BD001E1EA900FFFFFF0002630000005B000000560000004D
      0000437F4000FAFDFA003FA14000007E000000850000249A2400EDFBEE007593
      6700003700000D3E0000133D000019400000FFFFFF00005C0000437C4800E0F6
      FF00A6DAB7002891340000280000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF0000610000176B150040843E004083
      3D0040803C00427E3C00447C3C00457A3C0047793C0048783C004A763C004B74
      3C004D733C005275400032571D001A4100001818B0002626B6003030C2000909
      B4002323B2001B1BAD00FFFFFF00FFFFFF00FFFFFF002323D7002A2ADE003131
      E6004B4BED002E2EE3001E1EAD001E1EAA0001610100307B2E00699E64006598
      600094B59200FFFFFF004AA64A0003850300098B09002FA02F00EFFBF000B3C1
      A9006D8A5F00779266004E6F3B001B420300FFFFFF00005A00001D6F220087C8
      BA003EB9490096EBB20038B46100002800000000000000000000000000000000
      0000000000000000000000000000FFFFFF0012691200AFCDAC00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFF00FFFEFF00FFFEFF00FFFD
      FF00FFFDFF00FFFFFF00CDD6C70033551F001818B0004949C6000C0CB5001414
      B0001A1AAE00FFFFFF00FFFFFF00FFFFFF001919CC001F1FD2002424D8002A2A
      DE007070DC004242E1001E1EBD001D1DAA0023742400E0ECDF00FEFFFE00F2FB
      F300F2FAF300E3F1E30042A24200058505000A8B0A002E9F2E00D2EBD200F2FC
      F300F4FFF500FAFFFC00F2F4F0004B683800FFFFFF00005A00000C5700001282
      1600009E000032BC4F009CF1C5003DBB6F00032A000000000000000000000000
      0000000000000000000000000000FFFFFF003C833A00FFFFFE00C6E1C700A3CF
      A300AAD4AB00ABD5AB00AAD7AB00ACD9AD00ADDAAE00AEDBAF00AEDCAF00AFDE
      B000ABDDAC00C1E6C100FFFFFF00657E53001818B0006060CF001111B5001919
      AE00FFFFFF00FFFFFF00FFFFFF001111C3001515C8001A1ACD001F1FD2002323
      D7003838B4006767E0001D1DC5001D1DAB0043874200FFFFFF0075B375002E88
      2F003293320030963000178C1700108B1000128F12001A941A0035A435003AAA
      3A0030A8300063C16400FFFFFF006F845B00FFFFFF00005A00000E5600000B5A
      0000038B000000A711002FC562009CF5CD0043BE7400072D0100000000000000
      0000000000000000000000000000FFFFFF0041864100FFFFFF0056A256000170
      0100067B06000680060006850600098909000B8B0B000D8F0D000F930F001198
      11000795070043B44300FEFFFD006D825A001818B0006E6ED5003737BF004848
      BF00FFFFFF00FFFFFF000B0BBC000E0EBF001111C3001515C8001919CC00FFFF
      FF002424AF007C7CDE001717C4001C1CAB0040853F00FFFFFF0050A15000006F
      0000017A0100047F04000D880D00138D1300148F1400159215000E930E000E96
      0E000494040040B24100FCFFFD006B805700FFFFFF00035C00000E5600001351
      000013540000058E0A0000B52D002CCF75009CF7D00049C178000A2F03000100
      0000000000000000000000000000FFFFFF003F853F00FFFFFF0055A455000073
      0000077E0700098209000B870B000D8B0D000F8D0F0011901100139513001599
      15000B970B0045B44600FCFFFD006A8057001818B0007171D6004040C2004646
      BF00FFFFFF000606B6000808B9000B0BBC000E0EBF001111C300FFFFFF00FFFF
      FF002424AF006F6FD9001212BD001C1CAC0040854000FFFFFF004FA04F00006D
      000000780000017E01000C880C00138D1300158F1500149214000C910C000C95
      0C00029402003FB24000FDFFFD006B805800FFFFFF000F3500000E5600001252
      0000184B0000194F000007931C0000C3490029D683009DF6CF004FC47C000E31
      0500010000000000000000000000FFFFFF003F853F00FFFFFF0055A355000072
      0000067D0600088108000A860A000C8A0C000E8D0E0010911000129512001499
      14000A970A0044B44500FCFFFD006A8057001717B1006969D2004444C6001E1E
      B1001E1EBC002F2FC2002323C0001313BC000A0ABC00FFFFFF00FFFFFF00FFFF
      FF003636B6005050D1001010B4001B1BAC0042874100FFFFFF007FBA7F003C92
      3C00409B40003D9D3D001A8E1A000F8B0F00118F11001A951A0042A942004BB0
      4B0041B0410070C77100FFFFFF006F835B00FFFFFF00010000000F5900001252
      0000184D00001E4500001E48010009972E0000D0630028D785009EF6CD0055C8
      8100133307000200000000000000FFFFFF0042864100FFFFFF005AA45A000873
      08000C7E0C000C840C000C870C000D8B0D00108E100012911200149514001699
      16000C980C0047B44800FDFFFD006D8259001717B1005C5CCE004E4EC9003232
      BE003838C4003939C4003232C3001C1CBD00FFFFFF00FFFFFF00FFFFFF001B1B
      AD005E5EC9003535C9001D1DB0001B1BAD001F721F00D6E5D600FFFFFF00FBFF
      FA00FFFFFF00EEF7EE0045A2450004850400098B09002F9F2F00DAEEDA00FEFF
      FF00FEFFFD00FFFFFF00E9ECE50046653300FFFFFF0000000000041900001355
      0000184E00001D470000233F0000234201000C9B3E0000D7700028D681009EF5
      CC005ACB850019360C0004000000FFFFFF003A823800FDFDFD00CFE6CF00B0D5
      B000B6D9B700B7DBB700B7DCB700B7DEB800B8DFB800B9E0B900BAE0BA00BAE2
      BA00B7E2B700C9EBCA00FFFFFF00647C50001717B1002828B8007070D5004444
      C7004040C6003838C4001E1EBC00FFFFFF00FFFFFF00FFFFFF001A1AAE003B3B
      BB004747CA002727BC001A1AAC001A1AAD00006100002676250058945600538C
      520089AC8700FEFFFF004AA64A0003850300098B09002FA02F00EEFBEF00A9B9
      A0005A7C520068845800446530001C420100FFFFFF0000000000000000000517
      0000184E00001D48000022410000283A0000293C01000F9B460000D8710027D5
      7F009EF5CE0054C778001D390400FFFFFF000E670E009EC29D00F9FAF800FCFB
      FA00FAF9F800FAF8F700FAF8F700FBF7F700FAF7F700FAF7F700FAF6F700FBF6
      F700FCF6F800FDF8F900BFCAB7002F521A00FFFFFF001717B1004747C5006A6A
      D3004444C7003737BF001E1EB1001F1FB2002121B3001E1EB0002D2DB8003737
      C3003939C4001F1FB0001A1AAE00FFFFFF0003640000005C000000560000004E
      0000437F4100FAFDFA003EA03E00007D00000084000022992200EDFCEF007793
      680000370000103E0000153E00001B420000FFFFFF0000000000000000000000
      0000051000001D48000022420000273C00002C3500002E3500001595430000D8
      73002BD4720030C1320029530100FFFFFF000061000010661000347932003478
      320033763100347331003472310037703100386F3100396D31003B6B31003D69
      31003F69320041683400274F15001B410000FFFFFF00FFFFFF001717B1004747
      C5007878D9004F4FC9004444C6003D3DC1003B3BC0003E3EC4003D3DC5005F5F
      D2003B3BBF001919AE00FFFFFF00FFFFFF0003640000015E0000005800000055
      00004F884D00FFFFFF007ABF7B0046A6470049AB4A0066BA6600F9FFFA00809B
      7100094000000F3F0000184100001C420000FFFFFF0000000000000000000000
      000000000000060E0000213F0000273C00002B37000031310000332E00001B8D
      41000FC031001D6F0000342F0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF001717
      B1002828B8006464D2007373D6007373D7007070D7006A6AD4006060CF002929
      B7001919AF00FFFFFF00FFFFFF00FFFFFF0002640000035F0000075A00000458
      0000276F2500D9E5D600FFFFFF00FFFFFF00FFFFFF00FFFFFF00E9EEE6004772
      3A000E45000012470000194400001C420000FFFFFF0000000000000000000000
      00000000000000000000060B0000273C00002B37000030330000352C00003432
      00002B4F06003331000034300000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF001717B1001717B1001717B1001818B0001818B0001818B0001818B0001818
      AF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0002640000055F00000B5C0000095C
      000006590000286D230051854E0051824C0051804C0056814F0039692D001348
      0100164A0000174C0000194600001C420000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00626262005555
      5500565656005555550055555500545454005353530053535300525252005252
      52004F4F4F005C5C5C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00003725140069513A008A725C00967E6C0098816C0090786000715A46003C2E
      220000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF0000000000FDFDFC00FBFB
      FB00FCFCFC00FDFDFD00FDFDFD00FEFEFE00FDFDFD00F8F8F800ACACAC000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00363636001111
      1100171717001414140011111100111111000F0F0F000E0E0E000C0C0C000909
      090000000000272727005B5B5B00FFFFFF00FFFFFF00FFFFFF0037200E00C097
      6A00F8DAB000FFF4CD00FFFDDB00FFFFE700FFFFE400FFFED900FFF4CC00FCDC
      B200C49A72002E1F1400FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000021A000002440000025A0000025D0000025D0000025A000002440000021A
      0000000000000000000000000000FFFFFF00FFFFFF0000000000FAFAF900F7F7
      F700FAFAFA00FBFBFB00FCFCFC00FEFEFE00FCFCFC00F1F1F100D3D3D300B0B0
      B00005050500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00383838001818
      18001D1D1D001B1B1B0017171700181818001717170016161600141414001313
      1300090909002B2B2B005A5A5A00FFFFFF00FFFFFF00FFFFFF00B17D4900FFE0
      AB00FADAA600FBE1B100FDEBBC00FFEEC200FEEEC100FDE8B900FADEAC00F8D8
      A400FFDCA400936A4800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000553
      000008740200139D08001DC40E0021D5110021D511001DC40E00139D08000874
      020005530000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000F9F9F900F7F7
      F700FAFAFA00F7F7F700DCDCDC00C7C7C700ECECEC00F4F4F400D2D2D200F5F5
      F500B1B1B10000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00393939001818
      18001A1A1A001717170005050500000000001111110014141400141414001313
      1300090909002A2A2A0059595900FFFFFF00FFFFFF00FFFFFF008B5D2F00FAC8
      8900F4CC9300F8D6A100FADDAB00FAE1B000FAE0AE00F9DCA800F7D39D00F3C9
      8F00FCC686006F4E3100FFFFFF00FFFFFF00FFFFFF00FFFFFF000B7F00000E88
      040021C4110023D1120022B6110022D1110022D1110022D1110022D111001EC3
      0F000D8803000B7F0000FFFFFF00FFFFFF00FFFFFF0000000000F9F9F900F6F6
      F600F9F9F9005DDD870016D04E003BC05D00BED7C100FBFBFB00EEEEEE00D7D7
      D700D9D9D900A9A9A90000000000FFFFFF00FFFFFF00FFFFFF00373737001616
      16000F0F0F0047474700CECECE004949490000000000000000000E0E0E000E0E
      0E00070707002929290059595900FFFFFF00FFFFFF00FFFFFF0044250C00EFB4
      7300F3C38700F4C99000F5CF9700F6D19B00F6D19A00F5CD9500F3C78D00F3C1
      8400E9AC6D00331F0F00FFFFFF00FFFFFF00FFFFFF000C8500000F8A030027C0
      170023C8120022B21100E6E6E60022B2110022C8110022C8110022C8110022C8
      11001FBC0F000E8902000C850000FFFFFF00FFFFFF0000000000F9F9F800F6F6
      F500F8F8F80037D565008BE9A500059C25001C6D2300FEFEFE00FBFBFB00F6F6
      F600F3F3F300F9F9F90000000000FFFFFF00FFFFFF00FFFFFF00363636001414
      1400050505004C4C4C00FEFEFE00FEFEFE00A7A7A70022222200000000000909
      0900000000002727270059595900FFFFFF00FFFFFF00FFFFFF0000000000BE81
      4400F7C28400F1C38C00F2C79000F2C79000F2C78F00F2C58E00F0C18A00F8C0
      7F00B079450000000000FFFFFF00FFFFFF00FFFFFF000D89000022A8130026C0
      150022AD1100DEDEDE00E2E2E200E6E6E60022B3110022BE110022BE110022BE
      110022BE110017A209000D890000FFFFFF00FFFFFF0000000000F8F8F800F4F4
      F400F7F7F700F3F8F50083DF98005FB16D00428C4300FDFDFD00FEFEFE00FEFE
      FE00FDFDFD00FEFEFE0000000000FFFFFF00FFFFFF00FFFFFF00353535001313
      13000303030047474700FEFEFE00FEFEFE00FEFEFE00FEFEFE00787878000000
      0000000000002727270059595900FFFFFF00FFFFFF00FFFFFF00FFFFFF005A33
      0D00F3B57500F6D1A800F4D0A800F4D1A900F4D1A900F3CFA700F6D1A700EFB0
      7200462A1300FFFFFF00FFFFFF00FFFFFF00FFFFFF000E8D00003BBD2B0023AE
      1200D5D5D500DADADA00DEDEDE00E2E2E200C0D8BD0022AE110022B4110022B4
      110022B4110021AF11000E8D0000FFFFFF00FFFFFF0000000000F8F8F700F3F3
      F300F5F5F500F8F8F800FAFAFA00FBFBFB0074C57700FCFCFC00E0F0E000FDFD
      FD00FDFDFD00FEFEFE0000000000FFFFFF00FFFFFF00FFFFFF00343434001111
      11000000000047474700FEFEFE00FEFEFE00FEFEFE00E4E4E4005A5A5A000000
      0000000000002626260059595900FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00009C602800F4C59700F2D0B000F2CCA800F3CCA900F4D3B400F3C395008856
      2A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000F92000050C83F009EDC
      9600D2D2D200D5D5D50051B64400DDDEDD00E2E2E200A6CEA00024A8130022AA
      110022AA110028AE17000F920000FFFFFF00FFFFFF0000000000F7F7F700F2F2
      F100F4F4F300F6F6F600F8F8F800FAFAFA007BC98200FBFBFB00ABD9AB00FCFC
      FC00FCFCFC00FDFDFD0000000000FFFFFF00FFFFFF00FFFFFF00343434000E0E
      0E00000000004A4A4A00FEFEFE00F2F2F2007878780000000000000000000505
      0500000000002525250059595900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00270F0000D4955A00FBE3BD00FEF3DC00FEF2D800FFE3BB00CC915B001609
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF001096000054CB430044BB
      3300FFFFFF002EAB1D0023A2120051B04400DEDEDE00E2E2E20087C27F0022A1
      110022A111002CAA1B0010960000FFFFFF00FFFFFF0000000000F6F6F600F0F0
      EF00F2F2F200F4F4F400F6F6F600F8F8F70083CE8C00FAFAFA0092CD9200FBFB
      FB00FBFBFB00FDFDFD0000000000FFFFFF00FFFFFF00FFFFFF00323232000C0C
      0C000707070037373700A2A2A2001B1B1B000000000000000000050505000505
      0500000000002222220059595900FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000885E3400FCDAA800FEE9BD00FEEDC300FEEDC200FDE6B900FBD5A0007852
      320000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00119A000051CB400047BE
      360047BE360047BE360042B9310036AF2500AACDA500DEDEDE00E2E2E20068B5
      5D00279F160034B02300119A0000FFFFFF00FFFFFF0000000000F5F5F500EEEE
      ED00F0F0F000F2F2F200F4F4F300F5F5F5007FCC8700DFECDF0075C07500F9F9
      F900FAFAFA00FCFCFC0000000000FFFFFF00FFFFFF00FFFFFF00313131000909
      0900000000000000000000000000000000000000000000000000000000000000
      0000000000002121210058585800FFFFFF00FFFFFF00FFFFFF00FFFFFF002C14
      0000E5A86700F7CC9100F5D29B00F8D8A400F7D7A300F5CF9800F8C98D00DCA0
      6300190C0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00129E00003DC02C0054CB
      43004EC53D004EC53D004EC53D004EC53D004EC53D00D3F1CE00FFFFFF00FFFF
      FF0052C9410036B82500129E0000FFFFFF00FFFFFF0000000000F4F4F400ECEC
      EB00EEEEED00F0F0EF00F2F2F100F3F3F2007AC9820020892000CFE8D300F7F7
      F600F7F7F700FBFBFB0000000000FFFFFF00FFFFFF00FFFFFF00272727000303
      0300353535002727270000000000000000003232320022222200000000000000
      00002A2A2A003232320055555500FFFFFF00FFFFFF00FFFFFF00FFFFFF00552F
      0E00F2AD6500EFB97A00F1C18600F2C58C00F2C58C00F0BF8400EFB67600EAA5
      60003D240C00FFFFFF00FFFFFF00FFFFFF00FFFFFF0013A200001AA707005CD7
      4B0059D0480057CE460057CE460057CE460057CE460057CE4600FFFFFF0058CF
      470056D2450019A6060013A20000FFFFFF00FFFFFF0000000000F3F3F200EAEA
      E900ECECEB00EEEEED00EFEFEF00F1F1F00075C77D006AAE6900F3F3F300F4F4
      F400F4F4F400F9F9F90000000000FFFFFF00FFFFFF00FFFFFF00646464000000
      000078787800FEFEFE00AEAEAE00000000007C7C7C00FEFEFE00A4A4A4000000
      000097979700BDBDBD0051515100FFFFFF00FFFFFF00FFFFFF00FFFFFF005029
      0700EFA66000EFBC8800F0C08D00F0C39100F0C29000EFBF8C00F0BA8400E59D
      5700351D0800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0014A5000021AF
      0E0060DA4E0063DA52005FD64E005FD64E005FD64E005FD64E0063DA52005DD8
      4B0020AE0D0014A50000FFFFFF00FFFFFF00FFFFFF0000000000F2F1F100E7E7
      E600EAE9E800ECECEB00EDEDEC00EEEEED00AFDAB100DFE7DE00F1F1F000F1F1
      F100F1F1F100F8F8F80000000000FFFFFF00FFFFFF00FFFFFF00BABABA00BFBF
      BF000000000079797900FEFEFE00BFBFBF00000000007F7F7F00FEFEFE00B0B0
      B00000000000515151005C5C5C00FFFFFF00FFFFFF00FFFFFF00FFFFFF002006
      0000D6955A00F8D3B000F2CCA700F2CDA800F2CDA800F2CCA700FBD4AC00C384
      4B0009000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0014A8
      00001BAD080042C82F005FDC4E006BE35A006BE359005FDC4E0040C72E001BAD
      070014A80000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000F9F8F800F2F2
      F200F4F3F300F4F4F400F5F5F500F6F6F600F7F7F600F7F7F700F7F7F700F7F7
      F700F7F7F700FBFBFB0000000000FFFFFF00FFFFFF00FFFFFF008D8D8D001D1D
      1D0069696900E4E4E400EDEDED00151515006B6B6B00F5F5F500EEEEEE001818
      18005B5B5B00ADADAD0055555500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0076451A00F7CFAC00FEEFE000FBEBDC00FBEBDC00FFF0DF00EFC39C004C2C
      0E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0015A9000015AA000015AA000015AA000015AA000015AA000015AA000015A9
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF001D1D1D000000
      00006A6A6A0088888800262626000000000074747400909090001E1E1E000000
      00008484840071717100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A35B1C00D5A37900E8C7AB00E8C6A800C6966E00482A1000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000001F2609001A1C0700030100000000000016171200A7A69800F4F1
      E7005C5A5700000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF00A8989000E0E0
      E00050504800FFFFFF0000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CACAC900CCCAC700C9C6C200C8C6
      C200C8C5C100C7C4C100C6C3C000C5C3C000C4C2BF00C4C1BE00C3C1BE00C3C1
      BF00C3C1BF00C3C1BF00C3C2C100B1B1B1000000000000000000000000000100
      0000070801009F671F00412D100000000000282A2600A7A6C7006D6DD8006A69
      D200AAA8E2008D8A90000808060002020200FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF009870380048381800FFFFFF00FFFFFF008888D8008888D8008888
      D8008888D800A8989000FFFFFF0000000000D1E4E700D1E4E700D1E4E700D1E4
      E700D1E4E700D1E4E700D1E4E700D1E4E700D1E4E700D1E4E700D1E4E700D1E4
      E700D1E4E700D1E4E700D1E4E700D1E4E700DBD7D200C9B7A000BCA28000BCA4
      8300BEA58600BFA78900BFA98C00C1AB8E00C1AB8F00C2AD9200C5B39B00C9B9
      A400CABAA600CBBCA900D1C9BE00C4C3C1000000000000000000000000000000
      0000694E1600DD6A24008D4E1B00703C0900947673003D40C7001616AE002F2F
      CB003A3AD3008786DD0056544D0000000000FFFFFF00FFFFFF0000000000FFFF
      FF0048381800D07828008850280088502800887860003838C8001818A8003838
      C8003838C8008888D80050504800FFFFFF00D3E6EA00D3E6EA00D3E6EA00D3E6
      EA00D3E6EA00D3E6EA00D3E6EA00D3E6EA00D3E6EA00D3E6EA00D3E6EA00D3E6
      EA00D3E6EA00D3E6EA00D3E6EA00D3E6EA00D8D1C800B08E6800986A32009B6F
      3800A0753F00A57C4600A9824F00AD865500AF8A5900B28F6000B9996E00C1A5
      8000C5AB8A00CAB39600D1C5B500C5C3C100000000000000000000000000312C
      0500C8742100CD682100CB672200DC681500B18588004E54E000302EC7002929
      C0002121AD003B3CC5008E8C980000000000FFFFFF00FFFFFF00FFFFFF004838
      1800D0782800D0782800D0782800D0782800A89890003838C8003838C8003838
      C8001818A8003838C800A8989000FFFFFF00D4E8EB00D4E8EB00D4E8EB00D4E8
      EB00D4E8EB00D4E8EB00D4E8EB00D4E8EB00D4E8EB00D4E8EB00D4E8EB00D4E8
      EB00D4E8EB00D4E8EB00D4E8EB00D4E8EB00D4CFC8009881620077572B007A5C
      2F007F623400876B3B008E744300937B4A00988250009A875600A08F6000A99C
      7000B1A87F00BDB89500CCC9B600C5C5C200000000000100000000000000AA88
      3800E8902000D07D1800CF7B1E00C87D2600C0A89C00A6ABF3006D6CDD003A3A
      D0001C1CAE003B3ABA009C9A9A0000000000FFFFFF0000000000FFFFFF009870
      3800D0782800D0782800D0782800D0782800A89890008888D8008888D8003838
      C8001818A8003838C800A8989000FFFFFF00D6E8EB00D6E8EB00D6E8EB00D6E8
      EB00D6E8EB00D6E8EB00D6E8EB00D6E8EB00D6E8EB00D6E8EB00D6E8EB00D6E8
      EB00D6E8EB00D6E8EB00D6E8EB00D6E8EB00CECEC900797A62004B4E29004C51
      2B00535A3000616A3A006A754300727F490077854D007F8852008A8F59009299
      6400A5AC7B00BCC6A000D1D4C100C8C7C5000000000000000000000000006D63
      5400D3B47900E7AC4200F9B12B0065490A005F606400D4D2EB00B6B7EE008D8D
      E8005959D900B0B0EE0058584E0000000000FFFFFF00FFFFFF00FFFFFF009870
      3800A8989000E8A83000E8A830004838180088786000E0E0E000B0B0D8008888
      D8003838C800B0B0D8005050480000000000D6E8EB00D6E8EB00D6E8EB00D6E8
      EB00D6E8EB00D6E8EB00D6E8EB00D6E8EB00D6E8EB00D6E8EB00D6E8EB00D6E8
      EB00D6E8EB00D6E8EB00D6E8EB00D6E8EB00CFD2CC007D896D004E6237004F67
      3B00637A4B00818F6000A2AA7E00BDC09300C5C08F00D0C29100D7C49600DED2
      AB00EBE5C500F5F1DA00EDEBDF00CCCCC9000000000000000000000000000000
      000010141900423C2D00BBA059009879320004060900908C8900BDBAC800B7B6
      D100AFADBF006B6A64000404050002010100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00483818008878600098703800FFFFFF00A8989000B0B0D800B0B0
      D8008888D80088786000FFFFFF0000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D7D8D2009A9D8000757D53007E8D
      6200ACB38500D5CFA200EEE4B900FAEFC700FBEFCA00FBEDC600FBEDC600FDF1
      CC00FEF3D000FDF4D600F0ECDD00CDCDCB000000000000000000040302000001
      020000000000000000000000040044352A001B110C00000000000B0C0C001111
      0E000C0C0800000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF004838180000000000FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00E2E1DA00CBC5A600BCB48700C7C1
      9400EDE1B600FDEBBF00FEE7B900FEE7BC00FEEBC500FEECC300FEEBC100FEEC
      C500FEEECA00FCEFCD00F0E9D800CFCDCB000504030000000000463C24008E75
      4700000000000000000000000000372E2B00C89A440065440B00120800000000
      000000000000030202000000000000000000FFFFFF00FFFFFF00483818009870
      380000000000FFFFFF00FFFFFF0048381800D07828004838180000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00EDE7E100F6E1C200F9DCAE00FADF
      B100FDE5BD00FEE0BA00FED8AC00FED1A200FFD3A000FFDEAE00FFE6BE00FFE7
      C100FEE5BF00FCE0B400F1DDC000D0CCC700000000000000000005040200C3A2
      6400A177440037271A000B08040008050600CD9D4D00EAA32100BF8420006F49
      12001F140700000000000000000000000000FFFFFF0000000000FFFFFF008878
      600098703800000000000000000000000000D0782800E8A83000C07028004838
      180000000000FFFFFF00FFFFFF00FFFFFF00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00EEE3DA00F9CAA100FDC18A00FEC9
      9500FEC59000FEBB8400FFB98100FFB67C00FFC28700FFD5A000FFE4BA00FFE3
      B900FED6A000FCD09500F1D6B000D1CCC6000000000002020200000000004B46
      3A00FFD49A00D3844100B1662800A45B2000BA6E2700C97E2400CC812000E598
      2F0086643000000000000100000000000000FFFFFF00FFFFFF00FFFFFF005050
      4800F0C09000D07828009870380088502800C0702800D0782800D0782800D078
      280098703800FFFFFF0000000000FFFFFF00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00EEDFD400F9B58200FC9C5400FD9E
      5700FD9C5500FD9C5400FD9F5800FD9F5900FDB17000FDCE9400FDE0B000FDDF
      AE00FDD09000FCCF8F00F2D7AF00D3CEC8000000000000000000010101000000
      0000776D6500F2B18700CF6D3000C8692900C4682600B55F2100C56B2600B778
      410018130C00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0088786000F0C09000D0782800D0782800C070280088502800C07028009870
      38000000000000000000FFFFFF00FFFFFF00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00EEE4DC00F7C7A400F8B48100F8B4
      8100F8B48200F8B48300F8B58400F7B58300F7BB8C00F7CCA000F6DBB500F6DC
      B500F6DEB700F5E2BF00EFE1C900D4D1CD000000000000000000000000000000
      0000000000004644430073503E00A365430094583700C2724400C86E3A004631
      250000000000010000000000000000000000FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00885028009870380088502800C0702800D07828004838
      1800FFFFFF00FFFFFF00FFFFFF00FFFFFF00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00E8E6E400EFE6DF00F0E2D800EFE2
      D800EFE2D800EFE2D800EEE2D800EEE1D700EDE1D600ECE1D700EBE3DA00EAE3
      DA00E9E5DE00E9E7E300E6E4E000CFCFCE000000000000000000000000000000
      00000101000000000000000000000000010008111500CA9F860088583C000000
      000002010000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00A898900088502800FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D2D4D600D7E0E700D8E4EF00D7E4
      EF00D7E4EF00D6E4EF00D6E3EE00D5E3ED00D4E2EC00D3DFE900D2DBE400D2D8
      E200D1D5DE00D0D2D800CECFD300BCBCBD000000000000000000000000000000
      0000000000000302020002010000020100000000000047352B001D1612000100
      000001000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000048381800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D9EBEE00D9EBEE00D9EBEE00D9EB
      EE00D9EBEE00D9EBEE00D9EBEE00D9EBEE00D9EBEE00D9EBEE00D9EBEE00D9EB
      EE00D9EBEE00D9EBEE00D9EBEE00D9EBEE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D4E5E800D4E5E800D4E5E800D4E5
      E800D4E5E800D4E5E800D4E5E800D4E5E800D4E5E800D4E5E800D4E5E800D4E5
      E800D4E5E800D4E5E800D4E5E800D4E5E800FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
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
      0000000000008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000808080008080800313131000808080008080800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400848484008484840084848400FF000000848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      84008484840084848400C6C6C60084848400C6C6C60084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000D6F7FF00D6F7FF0000000000D6F7FF00D6F7FF00000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484000084000000FF000084848400C6C6C60084848400848484008484
      8400000000000000000000000000000000000000000000000000000000008484
      84008484840084848400FF00000084848400FF00000084848400FF0000008484
      840000000000000000000000000000000000000000000000000084848400C6C6
      C60084848400C6C6C60084848400C6C6C60084848400C6C6C60084848400C6C6
      C600848484000000000000000000000000000000000000000000000000000000
      000000000000000000004AFF7B0000631800008C290000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      00000084000000FF000000840000C6C6C60084848400C6C6C60084848400C6C6
      C60084848400000000000000000000000000000000000000000084848400FF00
      000084848400FF00000084848400FF00000084848400FF00000084848400FF00
      0000848484000000000000000000000000000000000000000000848484008484
      8400C6C6C60084848400C6C6C60084848400C6C6C60084848400C6C6C6008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000EF390000CE3100008C290000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000084
      000000FF00000084000000FF000084848400C6C6C60084848400C6C6C6008484
      8400848484000000000000000000000000000000000000000000848484008484
      8400FF00000084848400FF00000084848400FF00000084848400FF0000008484
      8400FF000000000000000000000000000000000000008484840084848400C6C6
      C60084848400C6C6C60084848400C6C6C60084848400C6C6C60084848400C6C6
      C600848484008484840000000000000000000000000000000000000000000000
      0000D6F7FF000052180084FFA50052FF7B0000C6390000521800D6F7FF000000
      00000000000000000000000000000000000000000000848484000084000000FF
      00000084000000FF000000840000C6C6C60084848400C6C6C60084848400C6C6
      C60084848400848484000000000000000000000000008484840084848400FF00
      000084848400FF00000084848400FF00000084848400FF00000084848400FF00
      000084848400FF00000000000000000000000000000084848400C6C6C6008484
      8400C6C6C60084848400C6C6C60084848400C6C6C60084848400C6C6C6008484
      8400C6C6C6008484840000000000000000000000000000000000000000000000
      000084FFA50084FFA50084FFA50052FF7B0000C6390000C6390000C639000000
      000000000000000000000000000000000000000000008484840000FF00000084
      000000FF00000084000000FF000084848400C6C6C60084848400C6C6C6008484
      8400C6C6C6008484840000000000000000000000000084848400FF0000008484
      8400FF00000084848400FF00000084848400FF00000084848400FF0000008484
      8400FF000000808080000000000000000000000000008484840084848400C6C6
      C600FFFFFF00C6C6C60084848400C6C6C60084848400C6C6C60084848400C6C6
      C600848484008484840000000000000000000000000000000000000000000000
      00000000000084FFA50084FFA50052FF7B0000C6390000C63900000000000000
      00000000000000000000000000000000000000000000848484000084000000FF
      0000FFFFFF0000FF000000840000C6C6C60084848400C6C6C60084848400C6C6
      C60084848400848484000000000000000000000000008484840084848400FF00
      000084848400FF00000084848400FF00000084848400FF00000084848400FF00
      0000808080008484840000000000000000000000000084848400C6C6C6008484
      8400FFFFFF00FFFFFF00C6C6C60084848400C6C6C60084848400C6C6C6008484
      8400C6C6C6008484840000000000000000000000000000000000000000000000
      0000000000000808080084FFA50084FFA50000C6390008080800000000000000
      000000000000000000000000000000000000000000008484840000FF00000084
      0000FFFFFF00FFFFFF0000FF000084848400C6C6C60084848400C6C6C6008484
      8400C6C6C6008484840000000000000000000000000084848400FF0000000084
      0000FFFFFF00FFFFFF00FF00000080808000FF00000080808000FF0000008080
      8000FF000000808080000000000000000000000000008484840084848400C6C6
      C600FFFFFF00FFFFFF00FFFFFF00C6C6C60084848400C6C6C60084848400C6C6
      C600848484008484840000000000000000000000000000000000000000000000
      0000000000000000000008080800080808000808080000000000000000000000
      00000000000000000000000000000000000000000000848484000084000000FF
      0000FFFFFF00FFFFFF00FFFFFF00C6C6C60084848400C6C6C60084848400C6C6
      C60084848400848484000000000000000000000000008484840080808000FF00
      0000FFFFFF00FFFFFF00FFFFFF00FF00000080808000FF00000080808000FF00
      0000808080008484840000000000000000000000000000000000848484008484
      8400C6C6C600FFFFFF00FFFFFF00FFFFFF00C6C6C60084848400C6C6C6008484
      8400848484000000000000000000000000000000000000000000000000000000
      000000000000080808008CB5FF008CB5FF008CB5FF0008080800000000000000
      0000000000000000000000000000000000000000000000000000848484000084
      000000FF0000FFFFFF00FFFFFF00FFFFFF00C6C6C60084848400C6C6C6008484
      8400848484000000000000000000000000000000000000000000848484008080
      8000FF000000FFFFFF00FFFFFF00FFFFFF00FF00000080808000FF0000008080
      8000FF000000000000000000000000000000000000000000000084848400C6C6
      C60084848400C6C6C60084848400C6C6C60084848400C6C6C60084848400C6C6
      C600848484000000000000000000000000000000000000000000000000000000
      00000000000008080800D6E7FF00D6E7FF008CB5FF0008080800000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      00000084000000FF000000840000C6C6C60084848400C6C6C60084848400C6C6
      C60084848400000000000000000000000000000000000000000084848400FF00
      000080808000FF00000080808000FF00000080808000FF00000080808000FF00
      0000848484000000000000000000000000000000000000000000000000008484
      84008484840084848400C6C6C60084848400C6C6C60084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      00000000000008080800D6E7FF00D6E7FF008CB5FF0008080800000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484000084000000FF000084848400C6C6C60084848400848484008484
      8400000000000000000000000000000000000000000000000000000000008484
      84008484840080808000FF00000080808000FF00000080808000848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000008080800080808000808080000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008080800084848400000000000000
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
      0000000000000000000000000000000000000000000000000000080808000808
      0800313131000808080008080800000000000000000008080800080808000808
      08000808080008080800000000000000000000000000000000000000000073CE
      FF00009CEF000084CE0031313100636363004A4A4A0021212100009CEF00009C
      EF000084CE000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000CE0000000000000000000000000000000000000000000000CE000000
      0000000000000000000000000000000000000000000000000000D6D6FF0084FF
      A5000000000000C63900D6D6FF000000000000000000D6D6FF00FFAD2900FF9C
      0000DE8C0000D6D6FF000000000000000000000000000000000000000000ADE7
      FF0073CEFF0042BDFF004A4A4A00636363004A4A4A003131310018B5FF00009C
      EF000084CE000000000000000000000000000000000000000000000000008484
      8400848484000084000000FF00000084000000FF000000840000848484008484
      8400000000000000000000000000000000000000000000000000000000008484
      FF005252FF000000CE000000000000000000000000000000CE001818FF000000
      AD000000000000000000000000000000000000000000000000000000000084FF
      A5000063180000C6390000000000000000000000000000000000FFAD2900FF9C
      0000DE8C0000000000000000000000000000000000000000000000000000ADE7
      FF0073CEFF0042BDFF004A4A4A00636363004A4A4A003939390018B5FF00009C
      EF000084CE0000000000000000000000000000000000000000008484840000FF
      00000084000000FF00000084000000FF00000084000000FF00000084000000FF
      0000848484000000000000000000000000000000000000000000000000000000
      00008484FF005252FF000000CE00000000000000F7001818FF006B6BFF000000
      00000000000000000000000000000000000000000000000000000000000084FF
      A50052FF7B0000C6390000000000000000000000000000000000FFAD2900FF9C
      0000DE8C0000000000000000000000000000000000000000000000000000ADE7
      FF0073CEFF0042BDFF004A4A4A00636363004A4A4A004A4A4A0018B5FF00009C
      EF000084CE000000000000000000000000000000000000000000848484000084
      000000FF00000084000000FF00000084000000FF00000084000000FF00000084
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000008484FF005252FF000000F7001818FF006B6BFF00000000000000
      00000000000000000000000000000000000000000000D6D6FF000808080084FF
      A50052FF7B0000C639000808080000000000D6D6FF0008080800FFAD2900FF9C
      0000DE8C000008080800D6D6FF0000000000000000000000000000000000ADE7
      FF0073CEFF0042BDFF004A4A4A00525252004A4A4A004A4A4A0018B5FF00009C
      EF000084CE0000000000000000000000000000000000848484000084000000FF
      00000084000000FF00000084000000FF00000084000000FF00000084000000FF
      0000008400008484840000000000000000000000000000000000000000000000
      000000000000000000008484FF005252FF001818FF0000000000000000000000
      0000000000000000000000000000000000000000000084FFA50084FFA50084FF
      A50052FF7B0000C6390000C6390000000000FFAD2900FFAD2900FFAD2900FF9C
      0000DE8C0000DE8C0000DE8C000000000000000000000000000000000000ADE7
      FF0073CEFF0042BDFF0018B5FF004A4A4A004A4A4A0018B5FF0018B5FF00009C
      EF000084CE00000000000000000000000000000000008484840000FF00000084
      000000FF00000084000000FF00000084000000FF00000084000000FF00000084
      000000FF00008484840000000000000000000000000000000000000000000000
      0000000000008484FF005252FF005252FF005252FF000000F700000000000000
      000000000000000000000000000000000000000000000000000084FFA50084FF
      A50052FF7B0000C6390000C639000000000000000000FFAD2900FFAD2900FF9C
      0000DE8C0000DE8C00000000000000000000000000000000000018B5FF000000
      0000ADE7FF0073CEFF0042BDFF0018B5FF0018B5FF0018B5FF00009CEF000084
      CE0000000000008CD600000000000000000000000000848484000084000000FF
      0000FFFFFF0000FF00000084000000FF00000084000000FF00000084000000FF
      0000008400008484840000000000000000000000000000000000000000000000
      00008484FF005252FF008484FF00000000008484FF005252FF000000F7000000
      00000000000000000000000000000000000000000000000000000808080084FF
      A50084FFA50000C6390008080800000000000000000008080800FFAD2900FFAD
      2900DE8C000008080800000000000000000000000000000000000000000018B5
      FF0000000000ADE7FF0073CEFF0042BDFF0018B5FF00009CEF000084CE000000
      0000008CD600000000000000000000000000000000008484840000FF00000084
      0000FFFFFF00FFFFFF0000FF00000084000000FF00000084000000FF00000084
      000000FF00008484840000000000000000000000000000000000000000008484
      FF005252FF008484FF000000000000000000000000008484FF005252FF000000
      CE00000000000000000000000000000000000000000000000000000000000808
      0800080808000808080000000000000000000000000000000000080808000808
      0800080808000000000000000000000000000000000000000000000000000000
      000018B5FF0000000000ADE7FF0042BDFF0018B5FF000073AD0000000000008C
      D6000000000000000000000000000000000000000000848484000084000000FF
      0000FFFFFF00FFFFFF00FFFFFF0000FF00000084000000FF00000084000000FF
      0000008400008484840000000000000000000000000000000000000000000000
      0000BDBDFF0000000000000000000000000000000000000000008484FF000000
      0000000000000000000000000000000000000000000000000000080808006B6B
      6B005A5A5A004A4A4A00080808000000000000000000080808006B6B6B005A5A
      5A004A4A4A000808080000000000000000000000000000000000000000000000
      00000000000018B5FF0000000000ADE7FF0031BDFF000000000000A5F7000000
      000073CEFF000000000000000000000000000000000000000000848484000084
      000000FF0000FFFFFF00FFFFFF00FFFFFF0000FF00000084000000FF00000084
      000000FF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000008080800B5B5
      B5008C8C8C005A5A5A0008080800000000000000000008080800B5B5B5008C8C
      8C005A5A5A000808080000000000000000000000000000000000000000000000
      0000000000000000000018B5FF00000000000000000000A5F700000000000000
      000073CEFF0000000000000000000000000000000000000000008484840000FF
      00000084000000FF00000084000000FF00000084000000FF00000084000000FF
      0000008400000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000008080800EFEF
      EF00B5B5B5006B6B6B0008080800000000000000000008080800EFEFEF00B5B5
      B5006B6B6B000808080000000000000000000000000000000000000000000000
      000000000000000000000000000042BDFF0000A5F70000000000000000000000
      000073CEFF000000000000000000000000000000000000000000000000008484
      8400848484000084000000FF00000084000000FF00000084000000FF00000084
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000808
      0800080808000808080000000000000000000000000000000000080808000808
      0800080808000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000600000000100010000000000000300000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
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
      0000000000000000000000000000000000000000FFFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      F81FF01FF81FF81FE00FF01FE00FE00FC007F83FC007C007C007F01FC007C007
      8003E00F800380038003E00F800380038003F01F800380038003F83F80038003
      8003FC7F80038003C007F83FC007C007C007F83FC007C007E00FF83FE00FE00F
      F83FFC7FF83FF83FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE007FFFF
      F7DF8001C003F81FE38F8001C003E00FC107C183C003C007E00F8001C003C007
      F01F0000C0038003F83F0000C0038003F01F800180018003E00FC183C0038003
      C107E3C7E0038003E38FC183F003C007F7DFC183F803C007FFFFC183FC23E00F
      FFFFE3C7FE73F83FFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object Timer: TTimer
    Enabled = False
    Interval = 2500
    OnTimer = TimerTimer
    Left = 224
    Top = 217
  end
  object PopupMenu_MapTool: TPopupMenu
    AutoHotkeys = maManual
    Images = ImageList2
    Left = 88
    Top = 87
    object N24: TMenuItem
      Action = tool_not_select
    end
    object N37: TMenuItem
      Caption = '-'
    end
    object N25: TMenuItem
      Action = tool_zoom_in
    end
    object N26: TMenuItem
      Action = tool_zoom_out
    end
    object N29: TMenuItem
      Action = tool_move
    end
    object N36: TMenuItem
      Caption = '-'
    end
    object N30: TMenuItem
      Action = tool_locate
    end
    object N33: TMenuItem
      Action = tool_distance
    end
    object N34: TMenuItem
      Action = tool_select_point
    end
    object N38: TMenuItem
      Caption = '-'
    end
    object N35: TMenuItem
      Action = tool_bird_eye
    end
  end
  object PopupMenu_cmd: TPopupMenu
    AutoHotkeys = maManual
    OnPopup = PopupMenu_cmdPopup
    Left = 160
    Top = 87
    object N85: TMenuItem
      Action = cmd_cancel
      Visible = False
    end
    object N87: TMenuItem
      Caption = '-'
      Visible = False
    end
    object N86: TMenuItem
      Action = cmd_reSend
    end
  end
  object ApplicationEvents: TApplicationEvents
    OnException = ApplicationEventsException
    Left = 41
    Top = 199
  end
  object PopupMenu_Alarm: TPopupMenu
    AutoHotkeys = maManual
    Left = 226
    Top = 87
    object N69: TMenuItem
      Action = stop_Alarm
    end
    object N70: TMenuItem
      Caption = '-'
    end
    object showAlarmStop1: TMenuItem
      Action = show_AlarmStop
    end
  end
  object PopupMenu_DevGroup: TPopupMenu
    AutoHotkeys = maManual
    Images = ImageList2
    OnPopup = PopupMenu_DevGroupPopup
    Left = 192
    Top = 87
    object N40: TMenuItem
      Action = fun_Devs_CallDev
    end
    object N32: TMenuItem
      Action = fun_Devs_PursueDev
    end
    object N15: TMenuItem
      Action = fun_Devs_SetParam
    end
    object N16: TMenuItem
      Action = fun_Devs_ControlTerminal
    end
    object N14: TMenuItem
      Action = fun_Devs_Polling_MCU
    end
    object N31: TMenuItem
      Action = fun_Devs_GetAPicture
    end
    object funDevsSendControl1: TMenuItem
      Action = fun_Devs_SendControlInfo
    end
    object N18: TMenuItem
      Action = fun_Devs_SetDevEventList
    end
    object N28: TMenuItem
      Action = fun_Devs_SendDevQuestion
    end
    object N13: TMenuItem
      Caption = '-'
    end
    object N218: TMenuItem
      Action = fun_Devs_Hide_All
    end
    object N216: TMenuItem
      Action = fun_Devs_Show
    end
    object N214: TMenuItem
      Action = fun_Devs_Hide
    end
    object N217: TMenuItem
      Action = fun_Devs_Show_Only
    end
  end
  object PopupMenu_SelectDevs: TPopupMenu
    AutoHotkeys = maManual
    Left = 122
    Top = 87
    object N124: TMenuItem
      Action = SelectDevs
    end
    object N144: TMenuItem
      Caption = '-'
    end
    object N145: TMenuItem
      Action = Selected
    end
  end
  object MSNPopUp1: TMSNPopUp
    Text = 'text'
    URL = 'http://www.url.com/'
    IconLeft = 8
    IconTop = 8
    Width = 160
    Height = 100
    GradientColor1 = 16764057
    GradientColor2 = clWhite
    ScrollSpeed = 9
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    HoverFont.Charset = DEFAULT_CHARSET
    HoverFont.Color = clBlue
    HoverFont.Height = -11
    HoverFont.Name = 'MS Sans Serif'
    HoverFont.Style = [fsUnderline]
    Title = 'title'
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clRed
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = [fsBold]
    Options = [msnCascadePopups, msnAllowScroll]
    TextAlignment = taCenter
    TextCursor = crDefault
    PopupMarge = 2
    PopupStartX = 16
    PopupStartY = 2
    DefaultMonitor = dmDesktop
    BackgroundImage.Data = {
      B6BB0000424DB6BB0000000000003600000028000000A0000000640000000100
      18000000000080BB0000120B0000120B00000000000000000000497DEF497DEF
      497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497D
      EF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF49
      7DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF
      497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497D
      EF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF49
      7DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF
      497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497D
      EF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF49
      7DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF
      497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497D
      EF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF49
      7DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF
      497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497D
      EF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF49
      7DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF597CE2F2736B
      E17477E17377E17377E17478E17377E17377E27477E17378E17377E27477E173
      77E27477E17477E17377E17377E27377E17378E17477E17378E17378E27477E1
      7477E27377E17477E27377E17377E17378E17377E17477E27377E17477E17377
      E17377E17477E17377E17377E17477E17477E27377E27377E17377E17477E173
      77E17477E17377E27377E17377E17477E17377E17478E17477E27377E17377E1
      7377E17377E17477E27478E17377E17378E17377E17377E17477E17377E17377
      E17377E17377E27377E17477E17377E27477E17477E27377E27377E17377E173
      78E17377E17377E17377E17477E17377E17378E17477E17477E17377E17478E1
      7377E17477E17377E27477E17377E27377E17477E17377E17377E17377E17377
      E27378E17377E27377E17377E27377E27477E27378E17477E17477E17377E174
      78E17377E17377E17377E17378E27477E17478E17477E27377E17378E27477E1
      7378E17377E17478E17477E27377E27478E17377E17377E17477E17377E17378
      E17377E17477E17477E27377E17478E17477E17377E17477E17377E17377E173
      77E17378E17377E17477E17477E27477E17377E17378E27478E17377E17377E1
      7377E17377E27377E17377E17377E17377E17377F2736B597CE2597CE2F4736A
      E37477E37477E37477E37476E47476E37577E37477E37477E47477E47477E374
      76E37476E37477E37477E37477E37476E47477E37477E37477E47577E37477E3
      7477E37477E37477E47477E37577E37477E37477E47477E37577E37476E37577
      E37477E37477E37477E37477E47477E47477E47477E37577E37476E37477E474
      77E37477E37477E47477E37477E47577E47477E37477E37477E37577E37477E4
      7477E37477E47477E37477E47477E37477E37477E47577E47476E37477E37477
      E37477E47476E37477E47477E37477E37476E37477E37477E37477E47477E374
      77E47477E47476E37477E37477E37477E47476E47477E37477E37477E37577E4
      7476E37577E47476E37476E47477E37477E37477E47477E37477E47477E47477
      E37477E47477E37476E37477E37477E37477E37477E37477E37477E37477E474
      76E47477E37477E37476E47477E37476E37477E37477E47477E37477E37477E3
      7477E47477E37477E37477E47476E37477E37477E37477E37476E47477E37477
      E47477E47476E47477E47476E37576E47477E47476E47477E37477E47477E474
      77E47477E37476E47476E37476E37477E37477E37477E47477E37477E37577E4
      7477E47577E37476E47476E37476E37577E37477F47369597CE2597CE3F5746B
      E37577E37578E47578E47577E37577E47578E37577E37578E47578E37578E375
      78E37577E47577E37577E37577E37578E47578E37577E37577E37577E37578E4
      7577E37577E37577E47578E47577E37578E37478E47578E37577E37577E37577
      E47478E37477E37578E47577E37578E37578E37477E47577E47578E37578E374
      77E37577E37578E47578E47578E47578E37578E47477E47578E47577E47577E3
      7578E37577E37577E37577E47578E37577E47578E37577E37577E37577E47577
      E37578E37577E47578E37578E47577E37578E37577E37578E47578E37577E375
      77E47577E37578E47577E47577E47578E37577E37578E37578E47577E37478E3
      7577E37578E47478E37578E37577E47577E47577E37578E37577E47578E37577
      E37577E37578E47578E47577E37577E37577E47478E47577E37577E37578E475
      77E47578E47578E37577E47578E47578E47578E37477E37578E37578E37477E3
      7577E37477E37477E37577E37478E37478E47577E37478E37577E47478E47577
      E37578E37578E47578E37577E37578E47578E37578E47577E37578E37578E375
      78E37577E47578E47577E37578E47578E47577E47578E37578E47577E47578E4
      7577E37577E37578E37577E47577E37577E47577F5746A597CE2597CE3F5756B
      E47578E37678E37678E47578E37678E47678E37678E47678E37679E47678E375
      78E47679E47678E37678E37678E37678E47679E47578E47579E47578E47678E4
      7678E37579E47579E47678E47679E47579E47678E47678E37679E37679E47578
      E47578E37579E47678E37579E37678E37678E37578E37679E37678E47679E475
      78E47578E37678E37678E37678E47679E37578E37678E47678E47678E47678E3
      7578E47678E47678E47579E37679E47678E47678E37678E47578E37678E47679
      E37579E47678E37578E37678E37679E37678E37678E37679E47578E37679E476
      78E47678E47578E47578E37678E37678E47678E47678E47579E47678E47579E4
      7678E47679E47679E47678E47679E47679E37578E47678E37578E47678E47578
      E47679E47678E47678E37678E37578E47678E37578E37679E47678E37678E475
      78E47678E47678E37678E37678E47679E47678E47678E47678E47578E47578E3
      7678E47678E47678E37578E37678E47678E37579E47578E47678E47678E47678
      E37678E37578E37678E37678E37578E47578E47678E47679E47678E37678E375
      79E37578E47678E37678E47678E37678E37678E47679E47679E37678E47579E4
      7679E47678E47579E47578E37678E47578E37578F4756C597CE3597CE3F5766C
      E47679E47779E47779E47779E47679E47679E47779E47779E37679E47779E476
      79E47779E47779E47779E47779E47779E47779E37679E47779E47779E47679E4
      7679E47779E47779E37779E47779E47679E47679E37779E47779E47779E47779
      E47679E47779E47779E47779E37779E47679E37679E47679E47779E47679E476
      79E47779E47779E47679E47779E47679E47679E47779E47779E47679E37679E4
      7779E47679E37679E37779E47779E37679E47679E47679E37679E37779E47679
      E47779E37779E37779E47679E47679E37779E37779E47779E47779E37679E477
      79E37779E37679E47779E47779E47779E47779E37779E47779E47779E47679E3
      7679E47679E47779E37679E47779E47779E37679E37779E47779E37779E47779
      E37779E47779E47679E47779E37679E37679E47679E37779E47779E37679E376
      79E47779E47679E47679E47779E37679E37679E37779E37779E47679E37679E4
      7779E47679E37779E47679E47779E47679E37779E47679E47679E47679E37779
      E47779E47779E37779E37779E47679E37679E47779E47679E47679E47779E377
      79E47779E47679E37679E47679E47679E47679E37779E37679E37779E47779E4
      7779E37679E37679E47779E47679E47779E37779F5766C597CE3597CE3F5766D
      E37779E47779E47879E4787AE3787AE47779E4787AE47779E4787AE3777AE478
      7AE47879E4777AE3787AE4777AE4777AE4787AE47779E4777AE4787AE3787AE4
      777AE3777AE3787AE4777AE4777AE4777AE4777AE47879E4777AE4777AE4787A
      E47779E4777AE3787AE37879E47779E4787AE4777AE4787AE3777AE3777AE377
      7AE47779E47879E4777AE4787AE4777AE4777AE37779E3777AE4777AE4787AE4
      787AE47779E37779E4787AE4787AE3777AE3777AE4787AE3777AE47879E3787A
      E4777AE4787AE37879E4777AE37779E4787AE47879E4787AE3787AE47779E477
      7AE4777AE4787AE3787AE4777AE4787AE47779E4777AE3777AE4787AE4787AE4
      787AE37779E4777AE4787AE4777AE4777AE47879E47879E47779E3787AE3787A
      E4787AE3777AE4787AE47879E47879E3777AE3787AE47879E3787AE4787AE477
      7AE37879E4777AE47879E3777AE3777AE47779E47779E4777AE47879E4777AE3
      777AE47879E4777AE3777AE4787AE4787AE47779E4777AE4787AE47879E4777A
      E4787AE4787AE4777AE4777AE3787AE3787AE47779E4777AE4787AE4787AE477
      7AE37879E4777AE4787AE47779E4787AE4787AE4787AE4787AE4777AE4787AE3
      777AE4787AE4777AE4787AE4777AE4787AE4787AF5776C597CE3597DE3F5786E
      E4797BE4787BE4797AE4797BE3797BE3797BE4797BE4797AE4797BE3787BE479
      7BE4787AE4797AE4787BE4797AE4797AE4787BE4787AE4787AE4797AE4787AE4
      787AE4787BE3787BE4797AE4797BE4787BE4787BE4797BE4787BE4787AE4787A
      E4787AE4787BE4787BE4797AE4787BE4787BE4787BE4787BE4787AE4797BE478
      7AE4797AE4787BE4787BE4787BE4787BE4797BE3797BE4787AE4797AE4787AE4
      797BE4797BE4797BE4797BE4797BE4787AE4787AE4787BE4797AE4787BE4787A
      E4797AE4787AE4797AE4797BE4797BE4787BE4787BE4787BE4797BE4787AE479
      7AE4787AE4797BE4797BE4797BE4787BE4787BE4787AE4787AE4787AE4797BE4
      797AE4797BE4787BE3797AE4797BE4787AE4797BE4797AE3797AE4787BE4797A
      E4787BE4787BE4787AE4797BE4797BE4797AE4787AE4797BE4797BE4787BE478
      7AE4787BE3787BE3787BE4787AE4787AE4797AE4787BE4797BE4787BE4787BE4
      787BE3787BE4787AE4787BE4787BE4787BE4797AE4797BE3787BE4797BE4787A
      E4787BE4787AE4787BE4787AE4787AE4797AE4797AE4787BE4797AE4797BE478
      7AE4797BE4787BE4787BE4787BE4787BE4787AE4797BE4787AE4787AE3787AE4
      787AE4787BE4797BE4787AE4787AE4787BE4797BF5786D597CE3597DE3F5786E
      E57A7BE4797CE47A7BE47A7CE47A7BE47A7CE4797CE47A7CE4797CE47A7CE479
      7CE4797BE47A7CE47A7BE4797BE4797CE4797BE47A7BE47A7CE47A7CE47A7BE4
      797BE5797BE4797BE4797CE4797BE47A7CE47A7BE57A7BE4797CE4797BE4797B
      E47A7BE47A7CE4797CE5797BE4797BE4797CE4797CE47A7BE4797BE4797BE479
      7BE4797BE47A7BE47A7CE4797CE47A7CE4797BE47A7CE47A7CE4797BE47A7BE4
      797CE4797CE4797BE4797BE4797CE4797CE4797CE47A7CE47A7CE4797BE4797B
      E4797CE47A7BE4797CE47A7BE47A7BE4797CE47A7BE57A7CE4797BE4797BE47A
      7CE47A7CE4797CE4797BE5797CE4797CE4797CE47A7BE4797BE47A7CE57A7CE4
      7A7BE4797CE4797BE4797CE4797BE47A7CE4797CE47A7BE47A7CE4797BE4797C
      E47A7CE4797BE4797CE4797CE4797CE47A7BE4797CE4797BE47A7CE57A7BE47A
      7CE5797CE4797BE4797CE4797BE47A7BE47A7CE4797CE4797BE47A7BE57A7BE4
      7A7CE47A7CE47A7CE4797BE4797CE47A7CE4797BE4797BE4797CE47A7BE5797C
      E4797BE47A7BE4797BE47A7CE4797BE4797BE4797BE47A7CE4797BE4797BE479
      7CE47A7CE4797CE57A7CE4797BE4797CE47A7BE4797BE47A7BE5797BE47A7BE4
      797CE4797CE5797BE4797CE47A7BE4797CE47A7BF5796F597DE3597DE3F57A70
      E47B7CE47B7CE47B7CE47B7CE57A7DE57A7CE47A7DE47A7DE57B7DE47B7CE47A
      7DE47A7DE57B7DE47A7CE47B7DE47A7DE47B7DE57A7CE47A7CE57B7CE47A7DE4
      7B7CE47A7CE47A7DE47B7CE47A7CE57B7CE47A7CE47B7CE47B7CE47A7DE47B7C
      E57B7CE57B7CE47A7CE57A7DE57B7CE47A7DE47A7CE47A7CE47B7DE47A7CE47A
      7CE47B7CE47B7DE47A7CE57A7CE47A7DE47A7DE47B7CE47A7CE47B7CE57B7CE4
      7A7DE47A7DE47A7DE47B7DE47B7CE47A7DE47A7CE47A7DE47A7CE47B7CE57B7D
      E57B7CE47B7CE57A7DE47B7CE47A7DE57B7CE47A7CE47A7DE47B7DE47B7DE47A
      7DE47B7DE47A7DE57A7CE47A7DE57A7CE47A7DE47B7CE47A7CE57B7CE47A7DE4
      7A7CE47A7DE47A7CE47A7CE47A7DE47B7CE47A7DE57B7CE57A7CE47A7CE57B7D
      E47A7CE57A7DE47A7CE47A7DE57A7CE47B7DE57A7CE47A7DE47B7CE47A7DE47B
      7DE47A7CE47A7CE57B7CE57A7DE47A7CE47A7CE47B7DE47A7CE47B7CE57A7CE4
      7A7CE47B7CE47B7DE47B7CE47A7DE47B7DE47B7CE47B7DE47B7CE47A7DE57A7C
      E47A7CE57A7CE47B7DE47A7CE47A7DE57A7CE47B7DE57A7CE47B7DE47B7CE47B
      7CE57A7DE47B7CE47A7DE47B7DE47A7DE47B7CE47B7CE47A7CE47B7DE47A7DE4
      7A7CE57B7DE47A7DE47B7CE57B7DE47B7CE47B7CF67A70597DE3597DE3F67B70
      E47C7DE57C7DE47C7DE57B7DE47C7EE57B7EE47B7DE47C7DE47C7EE57B7DE47B
      7EE47C7DE57B7EE57C7DE47B7DE57B7DE57B7DE57C7DE47C7DE57B7DE47B7EE4
      7C7DE47C7DE47C7EE57B7DE47C7EE57C7DE57B7DE47C7DE57C7EE57C7DE57C7D
      E57C7EE57C7DE47B7EE57B7DE57B7DE47B7DE47C7DE47C7DE57B7EE47C7DE47C
      7DE57B7DE57B7DE47C7DE47B7DE57C7EE57B7DE57B7DE47C7DE47B7EE47B7EE5
      7B7DE57C7EE47C7DE47C7DE47B7EE57C7EE57B7EE57C7DE57B7EE47B7DE57B7D
      E47B7DE47B7EE57B7DE57C7DE47B7EE47C7EE57B7DE57B7DE57C7DE57C7DE57B
      7DE47B7DE47B7DE57C7DE47C7DE47C7EE57C7EE57B7DE57C7DE57B7DE47C7EE5
      7C7DE47C7EE47B7DE57C7DE47C7DE47B7DE47C7DE47B7DE47C7EE57B7EE47B7D
      E57C7EE57C7DE47C7EE57B7DE47C7DE57B7DE47C7DE47B7DE47C7DE47C7DE47C
      7DE47C7DE47C7EE57C7DE57B7DE47C7DE57B7DE47C7EE47C7DE47B7DE47C7DE5
      7C7DE47B7EE57C7EE57B7EE47C7DE47C7DE47B7DE47C7EE47B7EE47B7DE47B7E
      E47C7EE47C7DE57B7DE47C7EE57B7EE57C7DE47C7DE57B7DE47B7DE57C7DE47C
      7DE47B7EE47C7DE47B7DE47B7EE57C7EE47B7DE47B7EE47B7DE57C7DE47B7DE4
      7B7DE57B7DE47C7EE47B7DE47C7DE47B7EE47C7EF67B71597DE3597DE3F67C72
      E47D7EE57D7EE57D7FE57D7FE57C7EE47C7EE57D7EE47C7EE57C7EE47D7EE47C
      7EE47C7FE57D7EE57D7FE57D7EE57D7EE47D7EE47C7FE57C7EE47C7EE57C7FE4
      7C7EE57D7EE47C7FE57D7EE47D7EE47D7EE57C7EE47C7EE57C7EE57D7EE57C7F
      E47C7FE57D7EE57D7EE57D7EE57C7EE47D7EE47C7FE57D7EE47D7EE57D7FE47C
      7EE47D7EE47C7FE57D7FE47D7EE47D7EE47D7EE57C7FE57C7EE47D7EE47C7EE4
      7D7FE57D7EE57D7EE57D7FE47C7FE57D7EE57D7EE57D7EE47D7EE57C7FE57D7F
      E57D7EE47C7FE57C7EE57D7EE57D7EE57D7FE57D7EE47C7FE57D7EE47C7FE57C
      7EE57D7EE57C7EE47D7FE47D7EE57D7EE47C7EE57D7FE47D7FE57D7EE47D7EE5
      7D7FE57D7EE47C7EE57C7FE57D7EE57C7EE47D7EE57D7EE47D7EE47D7EE57D7E
      E57D7EE57D7EE57D7EE57D7EE47C7EE47C7EE57C7FE57D7EE47D7EE57D7EE47C
      7EE57C7FE47D7EE57D7FE57D7FE57D7EE47C7FE57D7EE57D7FE57D7FE47C7EE5
      7D7FE57C7FE57D7FE47C7EE57D7EE47C7EE47C7EE57D7FE57D7EE47C7FE57C7E
      E47D7EE57C7EE57D7EE57C7EE57C7FE57D7EE47D7EE47D7EE47D7EE47D7EE57C
      7EE47D7EE47C7FE47C7EE47C7FE47D7EE57D7EE57D7EE57D7EE57C7EE57D7FE4
      7C7EE47C7EE57D7EE47D7EE47C7EE47D7EE57D7EF67C72597DE3597DE3F57E73
      E47E7FE57D7FE57E7FE47D7FE57E7FE57E7FE57E7FE47E7FE57E7FE47D7FE57E
      7FE47D7FE47E80E57E7FE57E80E47D80E57E7FE57E7FE57D7FE47E7FE57E7FE5
      7E80E47D7FE57D7FE47D80E57E7FE57D80E57E7FE57D7FE47E7FE47E7FE57E7F
      E57E7FE57E80E57D7FE47E80E57E7FE57E7FE47E80E47E80E47E7FE57E7FE57E
      7FE47E7FE57E7FE57E7FE47E7FE57E7FE57D80E47E7FE47E80E57D7FE57E7FE4
      7D7FE57E7FE57E7FE57E7FE57D80E57E7FE57D80E57E7FE57E7FE57D7FE57D7F
      E57E80E47D7FE47D80E57E7FE47E7FE57E80E57E7FE57D80E57E7FE57E80E57E
      80E57D7FE47E7FE47D80E57D7FE57D7FE47D7FE57D80E47E7FE57E7FE57E7FE4
      7E7FE57E80E57E7FE57E7FE47E7FE57D80E57D7FE57E80E57D80E57E80E47D7F
      E57E7FE47E7FE57E7FE47E80E57D80E57E7FE47E80E57E7FE47E7FE57E7FE57E
      80E57D7FE47D7FE57D7FE57E80E57E7FE57E80E57E7FE57E7FE57E80E57E80E5
      7E80E57E80E47D7FE57E80E57D7FE57D7FE47E7FE57E80E57E7FE57D80E57E7F
      E57E80E47E80E47E7FE57E80E57E7FE47D7FE57E80E57E7FE57D80E57E7FE57D
      7FE47D7FE57E80E57E7FE47D7FE57D80E57E80E57D80E47E7FE57E80E57E7FE5
      7E80E47E80E57D7FE57E7FE57E7FE57E80E47E80F67E73597DE3597DE3F67F74
      E57E81E57F80E57F80E47F81E57F80E47F80E57F80E47F80E57F80E57F81E57F
      80E57F81E47F80E57F81E57F80E47F81E57F80E57F81E47F80E57F80E57F80E5
      7F80E57F80E57F80E57F80E57F81E57F81E57F80E47F81E57F80E57F81E57E80
      E57F80E57F80E57F81E57F80E57F81E57F80E57F80E57F80E57F80E57F80E57F
      81E57E80E57F81E57F80E47F80E57F80E57F80E57F80E57F81E57F81E57F80E5
      7E81E57F81E47F81E57F80E57F80E47F81E57F80E57F80E57F80E57F81E57F80
      E57F80E47F81E57E80E57F80E47F80E57F80E57F81E57F80E57F81E47E81E47F
      80E47F81E57F80E57F80E47E80E57F81E57F81E57F80E47F80E57F80E57F81E5
      7F80E47F81E57F81E57F80E57F80E57E81E57F81E57E80E57F80E57F80E57F81
      E57F80E57E81E47F80E57F81E57E81E57F80E57F81E57F80E57F80E57F81E47F
      80E57F80E57F80E57F80E57F80E47F80E57F80E57F81E57F80E57F80E57F80E5
      7F80E57F81E57F81E57F80E57E81E57F80E57F80E57F80E57E81E47F80E57F80
      E57F80E57F80E57F80E57F81E57F80E57F80E47F80E57F81E57F81E57F80E57F
      81E47E80E47F80E57F80E57F80E57F81E47F80E57F81E47F80E57F80E57F80E5
      7F81E57F80E57F80E57F80E47F81E57F80E57F80F67F75597DE4597DE4F68176
      E58181E58082E58082E58182E58081E58082E58081E58082E58081E58081E580
      82E58081E58081E68082E58182E58082E58081E58082E58081E58081E68081E5
      8081E58081E58081E58081E58082E68081E58081E68082E58081E58082E58082
      E58082E58082E58081E58082E58082E58081E58081E58082E58082E58082E580
      82E58081E58082E58081E58081E58081E58081E58081E58081E58182E58081E6
      8181E58182E58081E58082E58081E58081E58082E58082E58182E58082E58082
      E58182E58082E58082E58081E58182E58081E58081E58081E58081E58082E580
      82E58081E58081E58081E58081E58082E58082E58081E58081E58082E58082E5
      8081E58181E58082E58082E58081E58081E58082E58181E58081E58181E58081
      E58082E58082E68081E68081E58081E58082E58082E58081E58081E58081E581
      82E58082E58181E68081E58181E58081E58182E58081E58081E68082E58081E5
      8081E58081E58081E58081E58082E58081E58081E58082E58081E58081E58181
      E58081E68081E58082E58081E58081E58081E58081E58082E58082E58081E580
      82E58081E58081E58081E58081E68081E58081E58082E58081E58081E58081E5
      8081E58081E58181E58082E58082E58081E58081F68075597DE3597DE4F78176
      E58182E58182E58282E58282E58183E58283E58182E68283E68282E58183E581
      82E58282E68182E58283E58183E58283E68182E58282E58183E58182E58183E5
      8182E58183E58283E58182E68182E58283E58282E68282E58182E68183E58182
      E58183E58182E58283E58183E58182E68282E68182E58182E58183E58282E581
      82E58183E58182E58182E58183E58182E58182E58183E58183E58183E68183E5
      8282E58182E58282E58182E58182E58282E58182E58183E58282E58282E58282
      E58182E58283E58182E68182E68182E58283E58182E68182E58182E58282E582
      83E58283E58182E68182E58183E68182E68282E58183E58182E58183E58182E5
      8182E58283E58182E58282E58183E58283E68183E58182E58282E68182E68182
      E58282E58283E68183E58182E58182E68182E58182E58182E68183E58282E682
      83E58183E58182E58182E58283E68282E58283E58182E58282E58182E58282E6
      8183E58182E68283E58283E58282E68183E58182E68182E58283E58182E58283
      E58183E58182E58282E58182E58183E68182E58182E58183E58182E58183E681
      83E58182E58282E58183E68282E58283E58182E58183E58282E58183E58183E6
      8283E58182E58183E68282E58183E58282E58282F78277597EE4597EE4F68378
      E68384E58284E68283E58284E58284E68384E58383E58283E68284E58383E683
      84E58384E58283E58383E68384E58383E58284E58383E68284E68383E58283E6
      8383E68383E58284E68284E58383E58384E58284E68383E58284E58283E68383
      E58384E68384E68384E68384E68284E58284E58383E58384E58383E68383E683
      84E58384E68283E68384E58284E58383E58283E68284E58283E58384E58284E5
      8283E68383E58284E58384E68384E58283E58384E68384E58283E58384E68284
      E58384E68284E68283E58283E58283E68284E58383E68284E58383E58384E683
      83E68383E58384E68284E68384E58283E58384E68283E58384E58284E68283E5
      8383E58384E68283E58383E58284E58384E68383E58383E58283E68283E68384
      E58384E68283E68384E58383E58384E68284E58384E68383E68283E58383E582
      84E58383E58284E68283E68383E58283E68384E58283E58384E68284E58283E5
      8284E58384E58383E58283E68283E58384E58284E68284E58384E58384E68283
      E58384E58283E58283E58384E68383E68283E58383E68383E68284E58284E683
      84E58284E68283E58283E68383E58284E58384E68384E58383E58283E58384E5
      8383E58384E68284E58284E58284E68284E68383F68478597EE4597EE4F78579
      E68484E68485E68485E68484E58385E68485E68485E68485E58384E68485E584
      85E68484E68485E58385E68384E58484E58485E58484E68485E58485E68485E5
      8485E58484E68485E58485E68484E68385E68484E58485E68484E68484E58484
      E58484E68485E68385E68485E68484E68485E68485E68485E68485E68484E583
      85E68485E68485E68485E68485E58484E68485E58485E68485E58485E68385E6
      8484E58485E58484E58485E58384E68385E68485E58485E58484E58484E58485
      E58385E58485E58485E58485E68484E68485E68485E68485E58484E68485E684
      84E68485E68485E58484E68484E68484E68484E58485E68485E68484E68384E6
      8485E68485E68484E68485E68485E58484E68485E58484E68484E58385E68484
      E68484E68485E68384E68485E68485E68484E68485E58485E68484E68485E684
      84E58485E58485E58484E58484E68485E58485E68484E68485E58485E58484E5
      8485E58484E58485E68484E58485E68485E68484E58485E58484E58485E68485
      E58485E68485E68384E58485E58484E68484E68385E68485E68484E58485E684
      85E68385E68384E58385E58485E68484E58485E68485E68485E68484E58485E5
      8485E58485E58485E68485E58485E58484E58485F78579597EE4597EE4F7867A
      E68586E68586E58586E68586E68586E68586E68586E68686E68585E68586E686
      85E58585E68585E68485E68586E68586E58586E68586E68586E58686E58586E6
      8586E68585E68586E58586E68585E68486E68586E58586E68586E68586E68586
      E68586E58686E68586E68686E68585E68585E68586E68586E68586E68686E685
      86E58586E68686E68586E58686E58586E68586E68586E58586E68586E68686E5
      8586E58585E68586E68585E68586E68585E68686E68586E68585E68585E58686
      E68585E68586E68585E68586E68586E68586E68686E68586E68586E68586E685
      86E68586E68585E68586E68586E68585E68585E58586E68586E68586E58586E6
      8586E58686E58586E68685E68585E68586E68585E58586E68585E68586E68685
      E58586E58586E68685E68586E68586E68586E68685E58686E68586E68586E685
      86E58685E68586E68586E68586E68586E68586E68585E68586E58586E68586E6
      8586E68586E68586E68686E68585E68586E68586E68586E68686E68685E58586
      E58585E68586E68586E58586E68586E68586E68486E58586E68685E68585E585
      86E68686E68586E58585E68686E68586E68586E68585E68586E58585E68686E6
      8586E68586E68586E68586E68586E68585E68586F7867A597EE4597EE4F7877C
      E68787E68687E68687E68687E68787E68786E68787E68687E68787E68687E686
      87E68787E68687E68787E68687E68687E68787E68787E68787E68687E68787E6
      8787E68787E68687E68787E68687E68787E68687E68687E68786E68787E68687
      E68787E68787E68687E68687E68786E68687E68687E68787E68687E68687E686
      87E68687E68687E68787E68787E68687E68687E68687E68787E68787E68687E6
      8787E68787E68687E68787E68687E68787E68787E68787E68686E68787E68687
      E68686E68786E68687E68787E68687E68786E68687E68787E68787E68687E686
      87E68687E68787E68787E68786E68787E68787E68787E68787E68787E68787E6
      8787E68686E68787E68687E68786E68687E68687E68687E68787E58686E68787
      E68687E68687E68686E68687E68687E68787E68687E68687E68787E68787E686
      87E68787E68787E68787E68787E68787E68787E68787E68787E68687E68687E6
      8787E68787E68687E68687E68687E68787E68687E68687E68787E68687E68787
      E68687E68687E68687E68787E68687E68787E68787E68687E68786E68787E687
      87E68686E68787E68787E68687E68787E68787E68787E68687E68686E68687E6
      8787E68787E68687E68787E68687E68786E68687F7877C597EE45A7EE4F8887D
      E68888E68888E68888E78788E78788E68888E68788E68888E68788E68788E687
      88E78788E68788E68888E68889E68888E78888E78888E78888E68788E68888E6
      8888E78788E68888E68889E68888E68888E68889E78888E68788E68888E68788
      E68889E68888E68788E68788E68889E68788E68888E68888E78888E78888E688
      88E68888E78888E78888E68888E68789E78888E68888E68888E68888E78788E6
      8889E68888E78888E68888E78788E68888E68888E68888E68789E68888E68888
      E68889E78888E68888E68788E68888E68887E68888E68888E68788E68889E688
      88E68788E68888E78788E68888E68888E68888E68888E68889E68888E68888E6
      8788E68888E68888E68888E68888E68888E68888E68888E68888E78887E68888
      E68888E78888E68889E68888E68888E68888E68788E68888E78888E68788E787
      88E68888E68888E68888E68888E68888E68888E68888E68888E68788E68888E6
      8888E68888E68888E68789E68888E68888E78789E68888E68888E78788E68888
      E68788E78788E68888E68888E68788E68888E78888E68888E68889E78888E688
      88E68887E68888E68888E68888E68888E68888E68888E68888E68787E68888E6
      8889E78888E68888E68888E78888E68889E68788F7887D597EE45A7EE4F8897E
      E68989E6898AE6898AE68889E68889E68989E78889E6898AE78889E68A8AE78A
      89E6898AE68A89E68A89E68989E68989E6898AE68A89E6898AE68989E7898AE7
      8A89E78989E68989E68989E68989E6898AE68989E6898AE78989E68989E68A8A
      E7898AE6898AE78A8AE68889E68989E68A89E68989E68989E6898AE68989E689
      89E68989E68989E68989E68A8AE68A89E6898AE6898AE78A89E78989E68989E6
      8A89E6898AE68989E7898AE6888AE78989E68989E78989E68A89E68989E6898A
      E68989E78A89E68989E68889E68989E68A8AE78989E68989E68989E78989E689
      89E68A8AE68A8AE78889E78989E68989E68A89E68A89E68989E68989E6898AE6
      898AE68989E6898AE7898AE78989E68989E6898AE6898AE78A89E6898AE68989
      E68989E6898AE78989E6898AE78989E68989E68A89E68989E68989E6898AE789
      89E78989E68989E6898AE78989E78A89E68A89E68A89E78989E68889E78989E7
      8989E6898AE68989E68989E6898AE68989E6888AE78989E68989E78A89E68989
      E68989E68A8AE78989E68989E68A89E7898AE6898AE68989E68989E78A8AE789
      89E7898AE68989E6898AE78989E68A89E6898AE78989E7898AE6898AE78989E6
      8989E78989E68989E68A89E78989E7898AE68A89F88B7E5A7EE4597EE4F88B7F
      E78A8BE78B8BE78B8BE78B8AE78B8AE68A8AE68B8BE78A8BE78B8BE68A8BE78A
      8AE78A8AE78B8AE78B8BE78A8AE78B8AE68A8BE78B8AE78B8AE68A8BE68B8BE7
      8A8AE78B8AE68A8AE78A8AE68A8AE78A8BE78B8AE68A8AE68A8AE78B8AE78B8B
      E68A8BE78B8AE78B8AE78B8BE68B8AE68B8AE68A8AE78B8BE78B8AE78A8AE68B
      8BE78B8BE78A8AE68B8BE68A8AE78A8AE68B8AE68A8BE78A8BE78B8BE68A8AE6
      8B8AE78B8AE68B8AE78A8AE78B8AE78B8AE78B8AE78B8BE78A8AE78B8BE68A8A
      E78B8AE68A8AE68A8BE78B8AE78A8BE78A8BE78B8BE68A8BE68A8BE78A8AE78A
      8AE68A8AE68B8BE68B8AE78A8AE78B8BE78B8AE68B8BE78B8AE78B8AE68A8AE7
      8A8AE78B8AE68B8AE68B8AE78A8AE68B8BE68B8AE78A8BE78B8BE68A8AE78B8A
      E78A8AE78A8BE68B8AE68A8BE68B8BE78B8BE78B8AE78B8BE68A8BE78A8AE68A
      8AE78B8BE78B8AE78B8AE78B8AE78A8AE68A8AE68A8BE78B8BE68B8AE68B8BE7
      8A8AE78A8AE68A8BE78A8AE78B8BE78B8AE68B8BE68B8AE78B8AE78A8BE68A8A
      E78A8BE68A8BE78A8AE68A8BE78B8BE68B8AE68B8BE78B8BE78A8AE68A8AE78B
      8AE78A8AE78B8BE78B8AE78A8BE78B8AE68B8BE78B8BE78A8BE78A8AE68B8BE7
      8A8AE78B8BE68B8AE78B8BE78B8AE78A8BE78A8AF88C805A7EE55A7FE5F88E81
      E78C8BE68C8CE78C8CE68C8CE78C8CE68B8CE68C8CE78C8CE78C8CE78B8CE78B
      8CE78C8BE78C8CE78C8CE78C8CE78C8CE78C8CE78C8CE78C8BE78C8CE78C8CE7
      8B8CE78C8CE78B8CE68B8CE78C8CE68C8CE78C8CE68B8BE78C8CE78C8CE78C8C
      E78B8BE78C8BE78C8BE78C8CE78C8CE78C8CE78B8CE78C8CE78C8BE78C8CE78C
      8CE68C8BE78C8CE78C8BE68C8BE68B8CE78C8BE78D8BE78B8CE78C8CE68C8BE6
      8C8CE78C8BE68C8BE78C8BE78C8BE78C8BE78C8CE78C8CE68C8CE78C8BE78D8B
      E78C8CE78B8CE78B8CE78C8CE78B8CE68B8CE68C8BE78C8CE78C8CE78B8CE78B
      8CE78B8BE68C8CE78C8BE68B8CE68C8CE78C8CE78C8CE78C8CE68C8CE78B8BE6
      8C8BE68C8CE78C8BE68C8BE78B8CE78C8BE68C8BE78D8BE78C8BE68B8BE78C8B
      E78C8CE78C8CE78C8CE78C8CE68C8CE78C8BE68C8CE78C8CE78C8BE78B8BE78C
      8BE78C8CE78C8CE78C8BE78C8BE78B8BE68B8CE78B8CE78C8BE78C8CE68C8CE7
      8B8CE78C8BE78C8CE78B8CE78C8CE78C8CE78C8CE78C8CE78C8CE78B8CE78C8B
      E78B8BE78C8BE78D8BE78C8BE68C8CE78C8BE78C8CE78C8BE68C8CE78B8BE78C
      8CE78C8BE68C8CE78C8BE78B8CE78C8CE68C8CE78C8CE78C8CE78C8BE68C8BE6
      8B8CE78C8CE78C8CE78C8CE78C8BE78D8CE78B8CF88E815A7FE55A7FE5F88F82
      E78D8DE78D8DE78D8DE78D8DE78D8DE78E8DE78D8DE88D8DE78D8DE78D8DE78E
      8DE78D8DE78D8DE78D8DE78D8DE78D8DE78D8DE78D8DE78D8DE78D8DE78D8DE7
      8D8DE78D8DE78E8DE78E8DE78D8DE78D8DE78D8DE78E8DE78D8DE78D8DE78D8D
      E78E8CE78D8DE78D8DE78D8DE78D8DE78D8DE78E8DE78D8DE78D8DE78D8DE78D
      8DE78D8CE78D8DE78D8CE78E8DE78D8DE78D8DE78D8CE78E8DE78D8DE78D8CE7
      8E8DE78D8DE78D8CE78D8DE78D8DE78D8CE78D8DE78D8DE78D8DE78D8CE78D8D
      E78D8DE78E8DE78E8DE78D8DE78E8DE78E8DE78E8CE78D8DE78D8DE78E8DE78E
      8DE78D8DE78D8DE78D8EE78E8DE78D8DE78D8DE78D8DE78D8DE78D8DE78E8DE7
      8D8DE78D8DE78D8CE78D8DE78E8DE78D8DE78D8DE78D8CE78D8CE78E8DE78D8C
      E78D8DE78D8EE78D8DE78D8DE78D8DE78D8CE78E8DE78D8DE78D8CE78D8EE78D
      8CE78D8DE78D8DE78D8DE78D8CE78E8CE78E8DE78E8DE78D8CE78D8DE78D8EE7
      8E8DE78D8CE78D8DE78E8DE78D8DE78D8DE78D8DE78D8DE78E8DE78E8DE78D8C
      E78E8CE78E8CE78E8EE78D8CE78E8DE78D8CE78D8DE78D8CE78D8DE78D8DE78D
      8DE78D8CE78D8DE78D8DE78E8DE78D8DE78D8DE78D8DE78D8DE78D8CE78D8DE7
      8E8DE78D8DE78D8DE78D8DE78D8CE78D8DE78E8DF88F825A7FE55A7FE5F89084
      E78E8EE78E8EE78E8EE78E8EE78F8EE78F8EE78F8EE88E8EE78F8EE78E8EE78F
      8EE78E8EE88E8EE78F8FE88E8EE78F8EE88E8EE78E8EE78F8FE78E8EE78F8EE7
      8E8EE78E8EE78F8EE88F8EE78E8EE78E8FE78F8EE78F8FE78E8EE78F8EE88E8E
      E78F8EE78E8FE78F8EE78F8FE78E8EE78F8EE78F8EE78F8EE78F8EE78E8FE78D
      8EE78E8EE78E8FE78E8EE78F8EE78E8EE88F8EE88E8EE78F8EE78F8EE78E8EE7
      8E8EE78E8EE78F8FE78E8EE78E8EE78F8EE78E8EE78F8FE88E8EE78F8FE78E8E
      E78F8EE78F8EE78F8EE78E8FE78F8EE78F8EE78E8EE88E8EE88E8EE78F8EE78F
      8EE88E8FE88E8EE78F8EE78F8EE78E8EE78E8EE78E8EE78E8EE78E8EE78E8EE8
      8E8FE78F8EE78E8EE78E8EE78F8EE78E8EE78F8EE88E8EE78E8EE78F8FE78E8E
      E78E8EE78E8EE88F8EE78E8EE78E8EE78F8EE78E8EE78E8EE88E8EE78E8EE78E
      8EE78F8EE78F8EE78F8EE78F8EE78F8EE78F8EE78F8EE88F8EE78F8EE78E8EE7
      8F8EE78E8EE78E8EE78F8EE78F8EE78F8EE78F8EE78E8EE78E8EE78F8EE88D8F
      E78F8EE78F8FE78F8EE88E8FE78E8EE88E8EE78F8FE78E8EE78E8EE78E8EE78F
      8EE88E8FE78F8EE78E8EE88F8EE88F8EE78E8FE78F8EE78E8FE88E8EE78E8EE7
      8F8EE78E8EE88F8EE78E8EE78F8EE88E8EE78F8EF990825A7FE55A7FE5F89284
      E7908FE8908FE7908FE79090E7908FE89090E8908FE8908FE79090E8908FE790
      8FE7908FE7918FE8908FE79090E7908FE89090E7908FE7908FE79090E8908FE7
      9090E7908FE89090E8908FE79090E78F8FE8908FE7908FE79090E79090E8908F
      E7908FE7908FE79090E8908FE79090E7908FE7908FE7908FE79090E8908FE790
      8FE79090E7908FE79090E7908FE89090E7908FE8908FE7918FE7908FE79090E7
      9090E8908FE8908FE8908FE89190E7908FE7908FE8908FE79090E7908FE8908F
      E7908FE7908FE8908FE8908FE8908FE8908FE88F8FE7908FE7908FE7908FE790
      8FE7908FE89090E7918FE7908FE89090E79090E78F8FE7908FE7908FE78F8FE7
      908FE7908FE8908FE8908FE89090E78F8FE8908FE79090E8908FE7918FE8908F
      E78F8FE8908FE7908FE7908FE7908FE8908FE88F8FE7908FE79090E8908FE790
      90E8908FE8908FE8908FE8908FE8908FE89090E8908FE8908FE79090E7908FE8
      908FE8908FE8908FE79090E7908FE79090E7908FE8908FE7908FE8908FE7908F
      E7908FE7908FE7908FE7908FE88F8FE8908FE7908FE8908FE7908FE89090E790
      8FE8908FE8908FE7908FE7908FE89090E7908FE8908FE7908FE8908FE8908FE8
      908FE8908FE8908FE7908FE79090E7908FE79090F992855A7FE55A7FE5F99386
      E8918FE79291E79191E89190E79191E79291E89191E89290E79091E89191E892
      91E89290E89191E89290E89190E89291E79191E79190E89190E79190E89290E7
      9290E89190E79190E89290E79191E79190E89291E79190E89291E89291E89190
      E89291E79190E89191E79190E89291E89191E89291E89190E89291E89190E891
      91E89191E89290E89291E79191E89290E79090E79290E89191E79291E89191E7
      9190E8918FE79290E79290E89191E89191E89191E89190E79190E79190E79190
      E89090E79291E79190E89290E89191E79190E89191E89291E79190E89190E891
      90E79190E79191E79191E89190E89190E79190E89190E79191E89190E89191E8
      9290E89191E89191E79190E89191E89190E89191E89290E89191E79190E89290
      E89190E79290E89191E89291E89190E89190E79190E89291E89190E79190E892
      91E79191E89190E89091E89291E89191E89290E7918FE89190E89191E79291E7
      9290E89190E89190E79190E89190E89191E79291E79190E79291E89091E8928F
      E89191E79190E79191E89290E79190E79191E79190E89191E89290E89190E891
      91E89290E89190E89191E89290E89190E79190E79091E89190E79191E79190E7
      9191E89191E89191E89190E79191E79191E79191FA94875A7FE55A7FE5FA9488
      E89392E89392E89392E89391E89393E89392E89392E89392E89392E89392E893
      93E89492E89292E89391E89391E89392E89492E89293E89392E79391E89392E8
      9391E89392E89391E89391E79492E89392E79392E89292E79392E89392E89392
      E89392E89392E89392E79393E79392E89392E89392E89392E89392E89292E892
      92E79393E89392E89392E89292E89391E89392E89392E89292E89392E89392E8
      9291E79392E89392E89392E89393E89492E89392E89292E89392E89392E89392
      E79392E89392E89392E89392E89392E89392E89392E89392E89291E89391E893
      92E89492E89392E89292E89392E89391E89391E89392E89392E89392E89392E7
      9392E79292E89392E89492E89392E89391E89392E89391E89392E89292E89392
      E89392E79392E89392E89392E89392E79392E89392E89392E89392E89391E793
      92E89392E89393E89392E89392E89392E89492E89392E89292E89392E79392E7
      9392E89392E79392E79392E89392E89392E89392E89392E89392E89392E79392
      E89392E89392E89392E79392E79292E89392E89392E89392E89392E89391E893
      92E89391E89392E89392E89392E79392E89392E89392E79391E89392E89392E8
      9392E89392E79392E89392E89392E79492E89392FA95885A7FE55A80E5FA9789
      E89493E89593E89493E89593E89493E99493E89493E89493E99594E89493E895
      93E89493E89494E89493E89493E89493E89493E89493E89593E89593E89593E8
      9493E99493E89493E89493E89493E99494E89393E89493E89493E89494E89593
      E89593E89593E89493E89493E99493E99493E89494E89593E89393E89493E894
      93E89493E89493E89493E89494E89493E99594E89493E89493E89593E89493E9
      9493E89594E89593E89493E99593E89493E89493E89493E89493E89494E89593
      E89593E89593E89493E89593E99493E89593E89593E89593E89493E89493E894
      93E89493E89493E89493E89493E89593E89593E89493E89593E89493E89593E8
      9493E89393E89493E89493E89494E89593E89493E89493E89493E89493E89593
      E89593E89493E89593E89493E89593E89493E89594E89493E89594E99593E894
      93E99593E99593E89593E89493E89493E89493E89493E89493E89493E89593E8
      9493E99494E89493E89494E89493E99493E89494E89593E89493E89593E89493
      E89493E89593E89493E89493E89493E89593E89593E89593E89493E89593E895
      93E89493E99593E89593E89593E89393E89593E89593E99493E89494E99493E8
      9593E89494E89593E89493E89593E89493E89493FA97895A80E65A80E6FA998B
      E99594E89694E89695E99695E89594E99695E89695E89694E99694E89694E896
      94E89695E89695E89694E99695E89694E89594E89694E89694E89694E99694E8
      9695E89694E99694E99694E89594E89795E99694E89694E99695E89695E99694
      E89694E99695E89695E89694E89694E89694E89695E89694E99694E99695E896
      94E89794E89695E99695E89695E89694E89695E89695E89694E99694E99694E8
      9694E89694E89694E99695E99694E89694E99695E89695E99694E99695E89694
      E89694E99695E99695E99695E89695E99694E89695E99695E89694E89694E896
      94E89594E89794E99695E89795E89695E99695E99695E99695E89695E89694E8
      9694E99695E89694E99695E89695E89694E99694E89695E89695E99694E99695
      E89694E89694E89695E89695E89694E89695E89695E89694E89694E89694E996
      93E89695E89693E99695E89694E89695E99594E89694E89695E99694E99694E9
      9694E89695E99695E89695E89595E89695E89694E89694E89594E89695E99694
      E89695E99694E89695E89695E89694E89694E99695E99694E89695E89694E896
      94E89694E99694E89694E99694E89694E89695E89695E89694E99695E89694E8
      9694E99695E99694E89694E89695E89595E89694FA998B5A80E65A80E6FB9A8C
      E89796E99795E89896E89796E99796E99796E89896E99796E89795E99896E898
      96E89896E99896E89796E89896E89797E89795E99897E89796E99896E99895E8
      9796E99796E89896E99896E89796E99796E99896E99796E89796E89796E99796
      E99895E89796E89896E89896E89696E89796E99896E99896E99896E99796E997
      96E99796E89896E89896E99896E89796E99896E99896E89796E99896E99796E9
      9796E99795E89796E89796E99796E89895E99896E99696E89896E89796E99895
      E99796E89796E99796E99896E89896E99896E89796E99796E89897E99797E898
      95E99695E99795E89896E89796E99796E99896E89796E99796E89796E89896E9
      9796E99896E99796E99896E99896E89796E89796E99696E99796E89895E99796
      E99797E99896E89696E89796E89896E99796E89796E89895E89896E99896E898
      96E89796E89795E89796E99796E89796E89796E99796E99896E89896E89795E8
      9796E99796E99896E89796E89796E89796E99895E99796E89795E99796E99796
      E99796E99896E99796E89796E99895E89796E99796E89896E99796E89895E897
      95E99796E89896E89796E99696E89896E99896E89896E99796E89796E89796E9
      9796E99796E89897E99797E99796E99796E89795FB9A8C5A80E65A80E6FB9C8E
      E99997E89897E89997E99997E89997E99997E99997E99997E99997E89997E899
      97E89997E99998E99997E99997E89997E99997E99997E99997E89997E89997E9
      9997E89997E99997E89997E99998E89897E99998E99997E99997E99997E99997
      E99997E99997E89997E99997E99997E99997E89997E99997E99998E99997E999
      98E89897E99997E99997E99997E99997E99997E99997E99997E99998E89997E9
      9997E99997E99997E99997E99997E89997E99997E99997E99997E89997E99997
      E99997E99997E99997E89998E89998E89997E99997E99997E99997E99997E899
      97E99997E99897E99997E99897E99997E89997E89997E99997E99997E99998E8
      9997E99997E99998E89997E89997E89897E99997E99997E89997E99997E99897
      E89997E99997E99997E99997E99998E99897E89998E99997E99998E89997E899
      98E99997E99997E99997E99997E89998E89997E99997E99997E99997E99997E9
      9997E89998E89997E89997E99997E99997E99997E99997E99997E99897E99997
      E99998E99997E99997E99998E89997E99997E99997E99997E99997E99997E899
      97E99997E99997E99997E99997E99998E89997E99997E99997E89997E99997E9
      9997E99997E89997E89997E99997E99997E99997FB9C8D5A80E65A80E6FB9E8F
      E99A98E99A99E99B98E99A98E99B98E99A98E99B99E99A98E99A99E99B98E99A
      98E99B99E99B98E99A98E99A99E89A98E99A98E99B98E99A98E99A99E99B98E9
      9A98E99A99E99A99E99A99E99B99E99A99E99A99E99A98E99A99E99B98E99B99
      E99A99E99B97E99A99E99A98E99C98E99B98E99B98E99B98E99B99E99A99E99A
      99E99A99E99B98E99A98E99A98E99B98E99B98E99A98E99A98E99B99E99A98E9
      9B99E99A98E99B99E99B98E99A99E99A98E99A98E99B98E99A98E99A99E99A98
      E99B99E99A98E99B98E99B99E99A99E99A99E99B99E99A98E99B98E99B98E99B
      98E99B98E99A99E99B98E99A98E99A99E99A98E99A98E99A98E99A98E99A99E9
      9A99E99A99E99B99E99A99E99B98E99A99E99B98E99B98E99A98E89A98E99A99
      E99B98E99B99E99B98E99B99E99B99E99A98E99B98E99B98E99A99E89A98E99B
      99E99A99E99B98E99A98E99B99E99A99E99A99E99B97E99B99E99B98E99A99E9
      9A99E99B99E99B98E89B98E99B99E99A99E99A99E99A98E99B98E99A98E99B98
      E99A99E99B98E89A98E99A98E99A98E99A99E99A98E99A98E99B99E99A99E99A
      98E99B98E99A99E99A98E99B99E99B99E99A98E99B99E99A98E99A98E99B99E9
      9A99E99A98E99B98E99A98E99B98E99A99E99A99FB9E8F5A80E65A80E6FB9F91
      E99B9AE99C9AE99C9AEA9C9AEA9C9AE99C9AE99C9AE99C9AE99C9AEA9C9AE99C
      9AE99C9AE99C9AE99B9AE99C9AE99C9AE99C9AEA9C9AE99C9AE99C9AEA9C99E9
      9C9AEA9C9AE99C9AE99C9AE99C9AE99C9AE99C9AEA9C99E99C9AE99C9AE99C9A
      E99C9AE99C99E99C9AE99C9AE99C9AE99C9AE99C9AE99C9AE99C9AE99C9AE99C
      9AE99C9AE99C9AEA9C9AE99C9AE99C9AE99C9AE99C9AE99C99E99C9AEA9C9AE9
      9C9AE99C9AE99C9AE99C9AE99C9AE99C9AE99C9AEA9C9AE99C9AE99C9AE99C9A
      E99C9AE99C9AE99C9AE99C9AE99C9AE99C9AE99C9AEA9C99E99C9AE99C9AEA9C
      9AE99C9AE99C9AE99C9AE99C9AE99C9AE99C9AE99B99E99C9AE99C9AE99C9AE9
      9C9AE99C9AEA9C9AE99C9AE99C9AE99C9AE99C9AE99C9AE99C9AE99C9AE99C9A
      E99C9AE99C9AE99C9AE99C9AE99C9AE99B99E99C9AE99C9AEA9C9AE99C9AE99C
      9AEA9C9AE99C9AE99C9AE99C9AE99C9AE99C9AE99C9AE99C9AE99C9AEA9C9AE9
      9C9AE99C9AE99C9AE99C9AE99C9AE99C9AEA9C9AE99C9AE99C9AE99C9AE99B9A
      E99C9AE99C9AE99C9AE99C99EA9C9AE99C9AEA9C9AE99C99EA9C9AE99C9AEA9C
      99E99B9AE99C9AEA9C9AE99C9AEA9C9AE99C9AE99C9AE99C9AEA9C9AEA9D9AEA
      9C9AE99C9AE99C9AE99B9AE99C9AE99C9AEA9C9AFB9F915A80E65A80E6FBA192
      EA9E9BE99D9BEA9E9BEA9D9CE99D9BE99D9BEA9E9CEA9D9BEA9D9CE99D9BE99E
      9BE99E9BEA9D9CEA9E9BE99E9BEA9E9BEA9E9BE99D9CE99D9BE99E9CE99E9BEA
      9D9BE99E9BE99D9BE99D9BEA9D9BE99E9CEA9D9BEA9E9BE99E9CE99D9BE99D9B
      E99E9CEA9D9BEA9E9BE99D9CE99D9BE99D9CEA9D9BEA9D9BEA9E9BE99D9BE99D
      9CE99D9BEA9D9BE99D9BE99E9CEA9E9BEA9D9CE99E9BEA9E9BEA9E9BE99D9BE9
      9D9BE99E9BE99E9BE99D9BE99E9BE99D9BEA9D9CE99D9BE99D9BE99D9BEA9E9C
      EA9D9BE99E9BE99E9CE99E9BEA9E9CE99E9CE99D9BEA9E9BEA9D9BE99E9BEA9D
      9BE99E9BE99D9BE99E9BE99E9CEA9E9BEA9D9BEA9E9BEA9D9BE99D9BEA9E9BEA
      9D9BE99E9BEA9D9BE99E9CE99E9BE99E9BE99E9BE99E9BE99E9BE99D9BEA9E9B
      EA9E9BE99E9CEA9D9CEA9E9BE99D9BEA9E9BE99E9CE99E9BEA9D9BE99D9BEA9E
      9BE99D9BE99D9BE99D9BE99E9BEA9E9BEA9E9BEA9D9CE99D9BEA9E9BEA9E9BEA
      9E9BEA9E9CE99D9BEA9E9BE99D9BEA9E9BEA9E9BE99D9BE99E9BE99E9BEA9E9C
      EA9D9CE99E9BE99D9BE99E9BE99D9BEA9E9BEA9D9BE99E9BEA9D9BEA9E9BE99E
      9BE99E9BE99D9BEA9D9BEA9E9BE99D9CEA9E9BEA9E9BEA9E9BE99D9BE99E9BEA
      9E9BEA9D9BE99E9BE99E9CEA9E9BEA9E9CEA9D9BFCA1925A80E65A81E6FBA393
      E9A09DE99F9DE99E9DEA9F9DEA9F9CEA9F9DEA9F9DE99F9DE99F9CEA9F9CE99F
      9CEA9E9CE99F9DE99F9DE99F9BE99F9CEA9E9CEA9F9CEA9F9CEAA09DEA9F9CEA
      9F9DE99F9CE99F9CE99F9CEA9F9DEA9F9CE99F9CEA9E9DEA9F9DE99F9CEA9F9C
      E99F9DEA9E9DE99F9DEA9F9DEA9F9CE99F9CEA9F9CE99F9DEA9F9CE99F9DE99F
      9DEA9F9DEA9F9DEA9F9DEA9E9DE99E9CEA9F9CEA9F9DE99E9DE99E9DEA9F9DEA
      9F9CEA9F9DE99F9CEA9F9DEA9E9DEA9F9CEA9F9DE99F9DE99F9CEA9F9DEA9F9D
      EA9F9DEA9F9CEA9E9DEA9F9CEAA09CE99E9CEA9F9DEA9F9DEA9F9DE99E9DEA9F
      9DEA9E9DEA9F9CE99E9DE9A09CEA9E9CE99F9CE9A09CE99F9DE99F9CE99F9DEA
      9F9CEA9F9DE99F9CEA9F9DEA9F9DEAA09DEA9E9DEA9E9DEA9E9CEA9F9CE99E9D
      E99F9CE99F9DE99E9DEA9F9CEA9F9CEA9F9CE99F9DEA9F9CEA9F9DE99F9CE9A0
      9DEA9F9CE99F9CE99F9DE99F9CEA9F9DEA9F9CE99F9CEA9F9CEA9F9CEA9F9DEA
      9F9DEAA09DEA9E9DEA9E9CEA9F9DEA9E9DEA9F9DE99F9CE99F9DE99F9DEA9F9D
      EA9F9DEA9F9BEA9F9DE99E9CE99F9DE99E9DEA9F9CE99F9DE99F9DEA9F9DEA9F
      9DEAA09DE99F9CE99F9DEA9F9CE99F9DEA9F9CEA9F9DE99F9DEA9F9BE99F9DE9
      9E9DEA9F9DE99F9DE9A09DEA9F9DEA9F9DEA9F9DFCA3935A81E65A81E7FCA595
      EAA09DEAA19DEAA09DEAA19DE9A09EEAA19EEAA19DEAA19DEAA19EEAA19EEAA1
      9EEAA09EEAA19DEAA09EEAA19EEAA19EEAA09EE9A19EEAA19EEAA09DEAA19EEA
      A19EEAA19EEAA09EEAA19EEAA09EEAA19DEAA19EEAA09EEAA19EEAA19EEAA19E
      EAA19DEAA19EEAA19DEAA19EEAA19EEAA19EE9A09EEAA19EEAA19EEAA19EEAA1
      9DEAA19DEAA19DEAA19DEAA09DE9A09EEAA19EEAA19EEAA09DE9A09EEAA19EEA
      A09EEAA19EEAA19EEAA19EEAA09EEAA19EEAA19EEAA09EEAA19EEAA19EE9A19E
      E9A09DE9A19EEAA09DEAA19EEAA09DEAA19EEAA09DEAA19DEAA19EEAA09EEAA1
      9EEAA09DEAA19EEAA09EEAA09DE9A09EEAA19EEAA09EEAA19DEAA09EEAA19EEA
      A19EEAA19DEAA19EEAA19EEAA19EEAA09DEAA09EEAA09EEAA09EEAA19EEAA09E
      EAA19EEAA19EEAA19DEAA19EEAA19EEAA09EEAA19EEAA19EEAA09DEAA19EEAA1
      9DEAA09EEAA19EEAA09EE9A19EEAA19EEAA19EEAA09EEAA09EE9A19EEAA19EEA
      A19DEAA09DEAA19EEAA09EEAA19EEAA19EEAA19EEAA19EEAA19DEAA19DEAA09D
      E9A19EEAA19DEAA19EEAA09DEAA19EEAA09EEAA19DEAA19EE9A09DEAA19DEAA1
      9EE9A09DEAA19EEAA19DEAA19EE9A09EEAA19EEAA19DE9A19DEAA19DEAA19EEA
      A09EEAA19DEAA19EEAA09DEAA19DEAA19DEAA19EFCA4955A81E75A81E7FCA696
      EAA29FEAA19FEAA29FEAA29FEAA29FEBA29EEAA19FEAA29FEAA2A0EBA29FEAA1
      9FEAA29FEAA29FEAA2A0EAA29FEAA29FEAA2A0E9A2A0EAA2A0EAA29FEAA29FEA
      A39FEBA29FEAA29FEAA19FEBA2A0EAA29FEAA29FEAA2A0EAA29EEAA39FEAA29F
      EAA29FEAA39FEAA29FEAA19EEAA19FEAA2A0EAA2A0EAA2A0EAA29FEAA29EEAA2
      9FEAA29FEAA29FEAA29FEAA29FEAA29FEAA2A0EAA29FEAA29FEBA2A0EAA39EEA
      A29FEAA1A0EAA29FEAA2A0EAA29EEAA2A0EAA29EEAA2A0EAA29EEAA3A0EAA29E
      EAA29FEAA29EEAA29FEAA29EEAA29FEAA3A0EBA29FEAA29FEAA29FEAA29FEAA2
      A0EAA29FEBA29FEAA2A0EAA29FEAA2A0EAA2A0EAA2A0EAA29FEAA29FEAA2A0EA
      A39FEAA39FEAA29FEAA29EEAA39EEAA29FEAA29EEAA2A0EAA29FEAA2A0EAA2A0
      EAA39FEAA19EEAA39FEAA2A0EBA29EEAA29FEBA29EEAA29FEAA29FEAA29FEAA1
      9FEAA29FEAA29FEAA29EEAA29EEAA2A0EAA19FEAA29FEAA29FEAA2A0EAA19FEB
      A29FEAA29FEAA3A0EAA29EEAA2A0EAA3A0EAA29FEAA19FEAA29FEAA39FEAA19F
      E9A29EEAA29FEAA39FEAA29FEAA2A0EAA2A0EAA29FEAA29EEBA29FEAA29FEAA2
      9EEAA29FEAA29FEAA19FEAA29FEAA29EEAA19FEAA29FEBA29FEAA39FEAA1A0EA
      A2A0EAA29FEAA2A0EAA29FEAA39FEBA39FEAA2A0FCA6965A81E75A81E7FCA798
      EBA4A1EBA3A1EAA4A1EBA4A1EBA4A1EAA4A0EBA4A1EBA4A1EBA4A1EAA4A1EAA4
      A1EBA4A1EAA4A1EAA4A0EAA4A0EBA4A1EAA4A1EBA4A0EBA4A0EBA4A1EAA4A1EA
      A3A0EAA4A1EAA4A1EAA4A0EAA4A1EAA4A1EAA4A1EAA4A1EBA4A0EAA3A1EAA4A1
      EAA4A1EBA3A0EAA4A1EAA4A0EBA3A1EAA4A1EAA4A1EAA4A1EAA4A1EAA4A0EBA4
      A1EAA4A1EBA4A1EBA4A1EAA4A1EBA4A1EBA4A0EAA3A0EAA4A1EAA3A0EAA3A0EA
      A4A1EAA4A0EAA4A0EAA4A1EBA4A1EAA4A0EAA4A1EAA4A1EAA4A0EBA4A0EAA4A0
      EAA4A1EAA4A0EAA4A1EBA4A0EAA4A1EBA4A1EAA4A1EAA4A1EAA4A0EAA4A0EBA4
      A0EAA4A1EAA4A1EBA4A0EAA4A0EBA4A0EAA4A0EBA4A1EBA4A1EAA4A1EAA4A1EA
      A4A0EAA3A1EAA4A1EBA4A0EAA3A0EAA4A1EBA4A0EBA4A1EAA4A0EBA4A0EAA4A1
      EAA4A1EAA3A1EAA4A1EAA3A1EBA4A0EAA4A1EAA4A1EBA4A1EBA4A1EBA4A1EAA3
      A1EAA4A1EAA4A0EAA3A0EAA4A0EAA4A0EBA3A1EAA4A0EBA4A1EBA4A1EBA4A0EA
      A4A1EAA4A1EBA3A0EBA4A1EAA4A1EBA3A1EAA4A0EBA3A1EAA4A1EAA3A1EAA4A1
      EBA4A0EAA4A1EAA3A0EAA4A1EBA4A1EAA4A0EAA4A1EAA4A0EAA4A1EAA4A1EBA4
      A0EAA4A1EAA4A1EAA4A1EAA4A0EBA4A1EAA4A1EBA4A1EAA3A1EAA3A0EBA3A0EA
      A3A0EAA4A1EAA4A1EAA4A1EAA3A1EAA4A1EBA4A0FCA8985A81E75A81E7FDAA99
      EAA4A2EBA5A1EBA6A1EAA5A1EAA5A2EBA5A2EBA6A1EBA5A2EAA5A1EBA5A2EBA6
      A1EBA6A2EBA4A1EBA6A2EBA5A2EAA5A2EAA5A2EBA6A2EAA6A2EBA5A2EAA4A2EB
      A5A2EBA6A2EBA4A1EAA6A2EBA5A1EBA5A1EAA5A2EBA5A1EAA6A2EBA5A2EAA5A2
      EBA5A1EBA5A2EBA6A1EAA6A2EBA5A1EBA5A1EAA5A1EAA4A2EAA6A2EAA6A2EBA5
      A1EAA5A1EAA4A2EAA5A2EAA5A1EAA6A2EAA6A2EAA5A2EBA6A2EAA5A2EBA5A2EB
      A5A2EBA5A2EAA5A2EBA6A1EAA5A2EBA5A2EBA5A2EBA4A1EAA5A2EAA6A2EBA5A2
      EBA6A1EBA5A2EBA5A3EBA6A2EBA5A1EBA6A2EAA5A2EAA6A1EBA5A2EBA5A2EAA4
      A2EBA5A2EBA5A2EAA4A2EAA5A2EAA5A2EAA5A2EBA5A1EBA5A2EBA5A1EAA5A1EA
      A5A2EAA5A1EBA5A2EAA5A2EBA5A2EAA6A2EBA5A2EAA6A1EAA5A2EBA5A2EAA6A2
      EAA4A2EBA5A3EBA6A2EAA5A1EAA6A2EBA5A1EAA5A3EBA6A2EAA5A1EBA5A2EBA5
      A2EAA5A2EAA6A2EBA5A2EAA6A2EBA5A2EBA5A2EBA4A2EAA6A2EAA5A2EBA6A2EB
      A5A2EBA5A1EBA5A2EBA5A2EBA5A1EBA5A1EAA5A2EAA5A3EBA5A1EAA5A1EBA6A2
      EBA6A2EAA5A2EBA5A2EBA6A2EBA5A2EBA5A2EBA5A2EAA5A2EBA5A2EBA5A1EAA5
      A2EAA5A2EBA6A2EAA5A1EBA5A2EAA5A2EAA6A1EBA6A2EAA5A2EBA5A2EBA5A2EA
      A5A2EAA5A2EAA6A2EBA6A1EBA5A2EAA4A1EBA6A2FCAA995A81E75A81E7FCAC9B
      EAA6A2EAA7A3EBA7A3EBA7A3EAA7A2EBA7A3EBA6A3EAA7A3EBA6A3EAA7A4EAA7
      A3EAA6A3EBA7A3EBA6A3EAA7A4EBA7A4EBA7A2EAA6A4EBA6A4EBA7A4EBA7A2EA
      A7A3EBA7A2EAA6A3EBA6A4EBA7A3EBA6A3EBA7A4EAA7A3EBA6A3EBA7A4EAA7A3
      EBA7A3EAA7A3EBA6A3EBA6A4EBA7A3EBA7A3EBA7A3EBA6A2EAA6A4EBA6A4EBA7
      A3EBA7A3EBA7A4EBA7A4EBA7A3EAA6A2EBA6A4EBA7A2EBA6A4EBA7A4EBA7A3EB
      A7A4EBA6A4EBA7A3EBA7A3EAA7A2EBA7A4EBA7A3EAA6A3EBA7A3EAA7A4EBA7A2
      EBA6A3EBA7A3EBA7A3EBA7A2EAA7A3EBA6A2EAA6A3EAA6A3EBA7A4EBA7A4EAA6
      A3EBA7A4EAA7A4EAA7A4EBA7A3EBA7A4EBA7A3EBA7A3EBA7A3EBA7A3EBA7A3EB
      A6A3EAA7A3EBA7A3EAA7A2EAA7A3EBA7A4EAA7A4EBA6A3EBA7A3EBA7A4EAA6A2
      EBA7A4EAA7A4EBA7A4EBA7A3EAA7A4EBA7A3EAA6A4EBA6A2EBA7A3EBA7A3EBA7
      A2EBA7A3EBA7A4EBA7A3EBA6A3EBA7A3EBA7A3EAA7A3EBA6A4EBA7A2EBA6A3EA
      A7A4EBA7A3EBA7A3EBA7A3EBA7A3EBA7A3EBA7A4EBA7A4EBA7A3EBA7A3EBA6A4
      EBA6A2EAA7A3EAA7A4EAA6A4EBA7A2EBA7A4EAA7A2EBA7A3EAA7A2EBA7A3EBA7
      A4EBA7A4EBA6A3EBA6A3EBA7A3EBA7A3EAA7A3EBA7A2EBA7A4EBA7A3EBA7A4EB
      A7A3EAA7A4EBA6A2EBA7A3EBA7A4EBA6A3EBA6A4FDAC9B5A81E75A82E7FDAD9C
      EAA8A4EBA8A5EBA9A5EBA9A5EBA9A4EBA8A5EBA8A5EBA9A5EBA8A5EAA9A4EAA9
      A5EAA8A5EBA9A5EBA8A4EAA8A4EBA8A5EBA8A4EBA8A5EBA8A4EBA8A5EBA9A4EB
      A8A5EBA9A4EBA8A5EBA8A4EBA9A5EBA8A5EBA8A4EBA8A5EBA8A4EBA8A5EAA9A4
      EBA8A5EBA8A5EBA8A5EBA8A5EBA9A5EBA8A5EBA8A5EBA8A4EBA8A4EBA8A5EBA8
      A5EBA8A5EBA9A4EBA8A5EBA9A5EBA8A4EBA8A5EBA9A4EBA8A4EBA8A4EBA8A5EB
      A8A5EBA8A4EBA9A5EBA9A5EAA9A4EBA8A4EBA9A5EBA8A5EBA8A4EBA9A4EBA9A5
      EBA8A5EBA9A5EBA8A4EBA7A4EBA8A5EBA8A4EBA8A4EBA8A5ECA8A5EBA9A5EBA8
      A4EBA9A5EBA8A5EBA9A4EBA8A5EBA9A4EBA8A5EBA9A5EBA8A4EBA9A5EBA8A5EB
      A8A5EBA9A5EBA8A4EBA9A4EBA8A5EBA9A4EBA8A5EBA8A5EBA8A5EBA9A4EBA8A4
      EBA9A4EBA9A5EBA9A4EBA8A5EBA9A5EBA9A5EAA8A5EBA8A4EBA8A5EBA9A5EBA8
      A5EBA9A4EBA7A5EBA8A4EBA8A5EBA8A4EBA9A4EBA9A5EBA8A4EBA8A4EBA8A5EA
      A8A4EBA8A5EBA9A4EBA8A5EBA8A5EBA8A5EBA8A5EBA9A5EBA9A5EBA8A5EBA8A5
      EBA8A4EBA8A4EBA9A4EBA8A5EBA8A4EBA9A5EAA8A4EBA8A5EAA8A4EBA8A5EBA9
      A5EBA8A4EBA8A5EBA8A5EBA8A5EBA9A5EBA9A5EBA9A4EBA9A4EBA8A5EBA8A5EB
      A8A4EBA8A5EBA8A4EBA9A5EBA9A5EBA8A5EBA8A5FDAD9C5A82E75A82E7FDAF9E
      ECAAA6EBAAA6EBA9A6EBAAA5EBAAA6EBAAA6EBAAA6EBAAA6ECAAA6ECAAA6ECAA
      A6ECAAA5ECA9A6EBAAA6ECAAA6ECAAA5EBAAA6EBAAA6EBAAA6EBAAA5EBA9A6EB
      AAA6ECA9A6EBAAA7ECAAA6EBAAA5EBAAA6EBAAA6EBAAA7ECAAA6EBAAA7ECAAA6
      EBAAA6EBAAA6EBA9A6EBAAA5EBA9A5ECAAA6EBAAA5EBAAA6EBAAA6EBAAA7EBAA
      A5EBAAA6EBA9A6ECAAA5EBA9A6EBAAA6EBAAA5EBAAA6EBAAA6EBAAA6EBAAA6EB
      AAA5EBAAA6ECAAA6EBA9A6ECA9A6EBAAA6EBAAA5EBAAA6ECAAA6EBAAA6EBAAA7
      ECAAA6ECAAA6EBAAA6EBA9A6EBAAA6EBAAA6ECAAA6EBAAA6ECAAA5EBA9A5EBAA
      A6EBA9A6EBAAA6EBA9A6EBAAA6EBA9A6EBAAA7EBA9A6EBAAA6EBA9A5EBAAA6EC
      AAA6EBA9A5ECAAA6EBA9A6EBAAA6EBAAA6EBAAA7EBAAA6EBAAA6ECA9A6EBAAA6
      EBA9A6EBAAA5EBAAA6EBAAA5EBAAA5EBAAA6ECAAA5EBAAA6EBAAA5ECAAA5EBAA
      A7EBA9A6ECAAA5EBAAA6EBAAA5EBAAA6EBAAA6EBA9A6EBAAA6EBAAA6EBAAA6EC
      AAA6EBAAA5ECA9A6EBAAA6ECAAA5EBAAA5EBAAA5ECA9A6EBAAA6EBAAA6EBAAA5
      EBAAA6EBAAA6EBA9A6EBAAA7EBAAA6EBA9A5ECAAA6EBAAA5ECAAA6EBA9A5EBAA
      A6EBAAA6EBAAA6EBAAA5ECAAA5EBAAA5EBA9A6EBAAA6EBAAA6EBAAA7EBAAA5EB
      A9A6EBAAA6EBAAA6EBA9A6EBA9A5EBAAA5EBAAA5FEAF9E5A82E75A82E8FEB09F
      ECABA8ECABA7EBABA7EBACA7EBACA8EBABA7EBABA8EBACA6EBABA6ECACA8EBAC
      A8ECABA7EBABA8EBACA8ECACA7ECACA7EBACA8EBACA7ECABA7ECACA7EBABA6EC
      ACA8EBACA6EBABA7ECACA8EBACA7EBACA8ECACA8ECABA8EBACA7ECABA8EBACA7
      EBACA8EBACA8ECACA6EBACA7ECABA7ECABA8ECABA7ECABA8ECACA7EBABA8EBAC
      A7EBACA6EBABA7EBACA7ECABA8ECACA7EBABA7EBACA7EBABA7EBABA8EBACA8EC
      ABA7EBACA8ECACA8ECACA8ECABA8EBACA8ECACA7ECACA8ECABA7EBACA8EBACA8
      ECACA8EBACA8ECABA7ECABA8ECACA7ECACA8EBABA8ECACA8ECACA7EBABA7ECAB
      A7EBACA6ECABA7ECABA7EBABA8EBABA8EBACA7EBABA8EBACA7EBACA7ECACA6EC
      ABA8ECABA7ECACA7EBABA7EBACA7ECACA7EBABA7ECACA7EBACA8ECABA8EBACA7
      ECABA8ECACA7ECACA8EBABA7ECACA7ECACA6EBACA7EBABA6EBABA7ECACA7ECAB
      A7ECABA7EBACA7ECACA7ECACA7EBACA7EBACA7ECABA7EBABA8EBACA8EBACA8EC
      ABA7ECABA7ECABA8EBABA6ECACA7ECABA7EBABA7ECABA6ECACA8EBACA7EBACA7
      EBACA8EBABA8EBABA8ECACA8EBACA7ECABA7ECACA7ECABA7EBACA7EBACA7ECAC
      A6ECABA8EBACA8ECACA7EBABA7ECACA7EBABA8EBACA7EBACA7ECABA8EBACA7EC
      ACA6ECACA7ECABA7ECABA8ECABA7EBABA7EBABA7FDB19F5A82E85A82E8FDB2A1
      ECADA8ECADA9EBADA8EBADA9ECADA9ECADA9ECADA8ECADA8EBADA8ECADA8ECAD
      A9ECADA9EBADA9ECADA8ECADA9EBACA9ECADA8EBACA9ECADA8ECACA9ECADA8EB
      ADA9EBAEA8ECADA8ECADA9ECACA9ECADA8ECADA9EBADA8ECACA9ECADA9EBACA9
      ECACA8EBADA8ECADA8ECAEA9ECADA9EBADA9ECADA9EBADA9ECACA8ECADA8EBAD
      A9ECADA8EBADA8EBADA9ECADA9ECAEA9ECADA9EBACA9ECADA8ECADA9ECAEA9EB
      ACA9EBADA8ECACA9ECADA9ECADA9ECADA8ECACA9ECADA8EBADA9ECADA9ECACA9
      ECADA9EBACA8ECADA9ECADA9ECADA8EBADA9ECADA9ECADA9EBADA9ECADA9ECAD
      A9ECAEA8ECADA9ECADA8ECADA8ECADA9ECADA9ECADA9EBADA9EBAEA9ECADA8EB
      ADA8ECADA9ECADA9ECADA9ECADA9ECACA8ECADA8ECADA9ECADA9ECADA9EBADA9
      ECACA9ECADA9EBADA9ECADA9ECADA9ECADA8EBACA9ECADA8EBADA9ECADA9EBAD
      A9ECADA9EBACA9ECADA8EBADA9EBACA9ECACA9ECADA9ECADA9ECACA8ECADA9EC
      ADA8EBADA9EBADA8EBADA8ECAEA9ECADA9ECADA9EBADA8ECAEA8ECADA9ECAEA9
      ECACA8EBADA9ECADA8EBADA9ECADA9ECADA9ECADA8ECADA9EBACA9EBAEA9ECAD
      A9EBADA8ECAEA9ECADA9EBADA9ECACA9ECADA9ECACA9EBADA8ECADA9ECADA9EC
      ADA8ECADA9ECADA9ECADA9EBADA9ECACA9ECADA9FDB3A15A82E85A82E8FDB4A1
      ECAFAAECAFA9ECAFAAEBAFA9ECAFA9ECAFAAECAFAAECAFAAECAEAAECAFAAEBAE
      A9ECAFAAECAEA9ECAFAAECAFABEBAEAAECAFAAECAEAAECAFAAECAEAAECAFAAEB
      AFAAECAEAAECAEAAECAFABECAEA9ECAFAAECAFA9EBAFAAEBAEA9ECAFA9ECAEAA
      ECAEAAEBAFAAECAEAAECAEAAECAEA9ECAFABECAFAAEBAFA9ECAEAAECAEAAECAF
      AAECAFAAEBAFAAECAFAAECAFAAECAFA9ECAFAAECAEAAEBAFAAECAFABECAEA9EB
      AFAAECAFAAEBAEA9ECAEA9ECAFAAECAFAAECAFABECAFAAECAEAAECAFAAECAEAA
      ECAFA9ECAEAAECAFAAECAFAAECAFAAEBAFABECAFABECAFA9EBAFAAECAFA9ECAF
      AAECAFAAECAEA9ECAFAAECAFAAECAEA9EBAFAAECAFABECAFAAECAEA9ECAFAAEB
      AEAAECAEA9ECAFAAECAFAAECAFAAEBAEAAECAFAAECAFA9ECAFA9ECAFA9ECAFA9
      ECAFA9EBAFA9EBAFABECAEA9ECAEAAECAFAAECAFABECAFAAECAFA9ECAFAAEBAF
      ABECAEA9ECAEAAECAFAAEBAFA9ECAEAAECAEAAECAEAAEBAEA9ECAEAAECAFA9EC
      AEAAEBAFAAEBAFAAEBAEAAECAFABECAFAAECAFAAEBAFAAECAEAAECAFA9ECAEAA
      ECAEAAEBAEAAEBAEAAEBAFAAEBAFAAECAEABECAFAAECAFAAECAEAAECAEA9ECAF
      AAEBAEAAECAEA9ECAFAAECAFAAECAEA9EBAEAAECAEAAEBAFAAECAEA9ECAFAAEB
      AEAAECAFA9ECAEA9EBAEABEBAFAAECAFA9EBAFAAFEB4A25A82E85A82E8FEB6A4
      ECB0ABECB1ABECB0ABECAFABECB0ABECB0AAECB0ACECB0ABECAFABECB0ABEBB0
      ABECB0ABEDB0ABECB0ACECB0ACECB0ABECAFACECB0ACECB0ABECB0ACECB0ABEC
      B0AAECB0AAECB0ABEDB0ABECB0ABECAFABECAFABECB1ACEBB0ABECB0ABECB0AC
      ECB0ACECAFACECB0ACEDB0AAECB0ABECB0ACECB0ACECAFABECB0ABECB0ABECB0
      ACECB0ABEDAFABECB0ABECAFAAECAFABECB0ACECB0AAEBB0ABECB0ABECB0ABEC
      B1ABECAFACEBB0ABECB0ABECB0ABECB0ABECB0ACEDB0ACECB0ABECB0AAECB0AA
      ECB0ABEDB0ACECB1AAECB0AAECB0ABECB0ACECB1ACECAFABECAFABECB0ABECAF
      ACECAFAAECB0ABECB0ABECB1ACECB0ABEBB0ABECB1ACECAFABECB0ABECB0ACED
      B0ACECB0ABEDAFACECB0ABECAFABEBB0AAEDB0ACECB0ABECAFABEDAFABECB0AB
      ECB1ABEBB0ABEDB1ACECB0ABECB0ACECAFABECB0ACECAFAAECAFABECB1AAECAF
      ACECB0ABECB0AAECB0ABECAFABECB0AAECB0ABECB0ABECB0ABECB0ACECB0ABEC
      B0ABEDB0ACECAFACEDAFABECB1ABECB1ABECAFABEDB0ABECB0ABEDAFABECB0AC
      EDB0ABEBB0ABEBB0ACEDAFAAEBB0ABECB0ACECAFABECAFABECB0AAECB0ABECB1
      ABECAFABECB0ABECB1AAECB0ACECB0ABEBB0AAECAFACEBAFACECB0ABECAFACEB
      B0AAECAFABECB0ABEBB0ABEDB0ABECB1ABEBAFABFEB6A45A82E85A83E8FFB8A6
      ECB2ACECB2ADECB2ADECB1ADECB2ADEDB2ACEDB2ADEDB2ADECB2ADECB1ACECB2
      ADEDB2ACECB1ADEDB2ADECB2ADECB2ADEDB1ADECB2ADECB1ADEDB2ACECB2ADEC
      B2ACECB2ACECB2ADEDB2ADECB2ADECB1ACEDB1ADECB1ACECB2ADEDB2ADECB1AC
      ECB1ACECB1ADECB2ADEDB2ADECB2ADECB2ADECB2ACECB1ADEDB2ADECB1ACECB2
      ACECB2ADEDB1ACECB2ADEDB1ACECB1ADECB2ADEDB1ACECB2ADECB2ACECB2ADED
      B2ACECB1ACECB2ADECB1ADEDB1ADEDB2ACECB1ADECB2ACECB1ADECB2ACECB1AC
      ECB2ADECB1ADEDB2ACECB2ACECB2ADEDB1ADECB2ACEDB1ADECB1ADECB2ADECB1
      ADECB1ACECB2ADEDB2ADEDB1ACEDB2ADEDB2ADECB2ACEDB1ADECB2ADECB2ACED
      B2ADECB1ADEDB1ADECB2ACECB1ADEDB1ADEDB2ACECB2ADECB1ADEDB1ADECB2AD
      ECB1ADECB2ADECB1ACEDB1ADEDB1ACECB1ADEDB1ADECB1ACEDB1ADEDB1ACEDB1
      ACECB2ADECB1ACECB2ADEDB2ADECB2ACECB1ADECB1ADEDB1ADECB2ADEDB2ADED
      B1ADEDB2ACECB1ACECB2ADECB1ADEDB1ADEDB1ACEDB2ADECB2ACEDB1ADECB2AD
      EDB1ACEDB1ADECB2ADECB1ACECB2ADECB2ACEDB1ACECB2ADEDB2ACECB2ADECB2
      ADECB2ACECB2ADEDB1ACEDB2ACECB1ADECB2ACECB2ADEDB1ADECB2ADEDB1ADED
      B2ACEDB1ADEDB2ADECB1ACEDB2ADEDB1ADEDB1ADFFB7A65A83E85A83E8FFB8A7
      ECB2AEECB2ADEDB3AEECB3ADECB3AFEDB2AEECB4ADECB3AEEDB4AEEDB3AEEDB3
      AEECB2AEECB3AEEDB4AEECB4AEEDB3AEECB3AEECB3ADEDB3AEECB3AEECB2ADED
      B3AEEDB3AEEDB3ADECB3AEEDB3AEEDB3AEEDB3AEECB3AEEDB3AEECB3AEECB3AE
      EDB3AEEDB3ADEDB3ADEDB3AEECB4ADECB2ADECB3AEECB3AEEDB3ADECB3AEEDB3
      AEECB3ADEDB3AEEDB3AEECB3AEEDB3ADEDB4AEECB3AEEDB3ADEDB2AEEDB2ADEC
      B2AEEDB3AEECB3ADEDB3ADECB4AEECB4AEECB3ADEDB4AEECB3AEECB4AEECB3AE
      EDB3AEEDB3ADECB2AEECB2AEEDB3AFEDB4AEEDB2AEEDB3AEECB3AEEDB3ADECB3
      ADECB2AEEDB3ADECB3AEECB3AEECB3ADEDB3ADECB2AEEDB3AEEDB4ADECB2AEEC
      B3ADEDB3AEECB3AEEDB2AEECB3AEECB3AEECB3AEECB3AEECB3ADEDB3AEECB2AE
      ECB3ADECB4ADECB3AEEDB3AEEDB3AEEDB3AEECB3ADEDB3AEEDB3AEEDB3AEEDB2
      AEECB3AEEDB3AEEDB4AEECB3ADEDB3AEECB3AEECB3AEECB3AEECB2ADEDB3ADED
      B3ADECB3AEECB3AEECB4ADEDB3AFEDB3AEEDB3AEECB3AEEDB2AEECB3ADEDB3AD
      ECB2AEEDB3AEECB2AFECB2AEEDB3AEEDB3AEEDB3AEEDB4AEECB4AEECB2AEEDB2
      AEECB4AEECB3AEECB3AEEDB3AEEDB3ADEDB3AEEDB3AEEDB3AEEDB3AEEDB3ADED
      B3AEEDB3AEEDB3AEEDB3AEEDB2ADEDB3AEECB3AEFEB9A65A83E85A83E8FFBAA9
      ECB4B0ECB4AFEDB5B0ECB4AFECB4AFEDB4AEECB4AFECB4AFEDB4AEEDB4AFEDB4
      AEECB4B0EDB5AEEDB4AEECB4AEEDB4B0ECB4AEECB4AFEDB4AFECB4AFECB4AFED
      B5AFEDB5AFEDB5AFECB4AFEDB4AFEDB4AFEDB4AFECB4AFEDB5B0ECB5B0ECB5B0
      EDB4B0EDB5AFEDB4AFEDB5AFECB4AFECB4AFECB4B0ECB4B0EDB5AFECB5AFEDB4
      B0ECB4AFEDB4AEEDB5AEECB4B0EDB4AFEDB4AEECB4AFEDB4AFEDB4AFEDB4AFEC
      B4AFEDB4B0ECB5AFEDB4AFECB4B0ECB4AFECB5AFEDB4AFECB4AEECB4B0ECB4AF
      EDB4AEEDB4AFECB4B0ECB4AFEDB5AFEDB4AEEDB4B0ECB5B0ECB4B0EDB5AFECB4
      AFECB4B0EDB4AFECB5AFECB5B0ECB4AFEDB5AFECB4B0EDB4AFEDB4AFECB4B0EC
      B5AFEDB4B0ECB5AEEDB4B0ECB5AEECB4AEECB5B0ECB5B0ECB4AFEDB4AFECB4B0
      ECB4AFECB4AFEDB5B0ECB4B0ECB4B0EDB4B0ECB4AFEDB4AFEDB4AEEDB5AFECB5
      AFECB4B0EDB4AFEDB4AFECB4AFEDB5AFECB5AFECB5AEECB4AEECB4AFEDB4AFED
      B4AFECB5AFECB5AFEDB4AFEDB5AFEDB5AEECB5AFECB4B0EDB4AEECB4AFEDB5AF
      ECB4AEEDB4AFECB4AFEDB5AFEDB5B0EDB5B0ECB4AEEDB4B0ECB4AFECB4B0EDB4
      AEECB4B0ECB4AEECB4AEEDB4B0EDB4AFEDB5AEEDB4AEEDB4AFEDB5AEECB4AFED
      B4AFEDB4AEEDB5B0EDB4AFEDB4AFECB4AFECB5AFFEBAA85A83E85A83E8FFBCA9
      EDB6B0EDB5B1EDB6B0EDB5B1ECB6B0EDB6B0EDB6B1EDB6B0ECB6AFEDB5B1EDB6
      B0EDB6B0EDB5B0EDB5B0ECB6B0EDB6B0EDB5B0EDB6B1EDB6B0EDB6B0EDB6B0ED
      B5AFECB6B0EDB6B1EDB5B1EDB6B0ECB6B0EDB6B1ECB6B0EDB5B0EDB5B0EDB5B0
      ECB6B0EDB5B1EDB6B1EDB5B1EDB5B1EDB7B1ECB6B0EDB5B0EDB5B1EDB5B0EDB6
      B0EDB6B1EDB6B0EDB6B0EDB6B0EDB5B0EDB5B0EDB6B0EDB6B0ECB5B0ECB5B0ED
      B6B0EDB6B0EDB5B1EDB6B1EDB5B0EDB5B0EDB7B1ECB5B0ECB6B0EDB5B0EDB6B0
      EDB6B0ECB5B0EDB6B0EDB6B0EDB5B0EDB6B0EDB5B0ECB5B0EDB6B0EDB5B1EDB6
      B1ECB7B0EDB6B1EDB5B1EDB5B0EDB6B1EDB5B1ECB5B0EDB6AFEDB6B1EDB6B0ED
      B5B1EDB6B0EDB6B0EDB5B0EDB5B0EDB6B0EDB5B0EDB5B0ECB6B0EDB6B0EDB5B0
      EDB6B1EDB6B1EDB6B0ECB6B0ECB6B0EDB6B0EDB6B0EDB6B1EDB5B0EDB5B1ECB6
      B0EDB6B0ECB6B0EDB5B0EDB6B0EDB5B1EDB5B0ECB5B0EDB6B0EDB5B1EDB6B1ED
      B6B1EDB6B0EDB5B0EDB5B1EDB5B0EDB5B0ECB5B1EDB6B0EDB5B0EDB6B1ECB5B1
      EDB7B0EDB6B0EDB6B0EDB6B0EDB5B0ECB5B0ECB6B0EDB5B0EDB6B0EDB5B0EDB6
      B0EDB5B0EDB6B0EDB6B0EDB6B0EDB6B1EDB5B0ECB6B0EDB5B1ECB6B0ECB6B1ED
      B6B1EDB6B0EDB5B0ECB6B0EDB6B1ECB6B0EDB5B0FFBCA95A83E85A83E9FFBEAB
      EDB7B1EDB7B1EDB7B1EDB7B1EDB7B2EDB7B2EDB7B1EDB8B1EEB8B1EDB7B1EEB7
      B2EDB7B1EDB7B2EDB7B2EDB8B1EDB8B1EDB7B2EEB8B1EDB8B1EDB7B1EDB8B2ED
      B7B1EEB7B2EDB7B1EDB7B1EDB8B1EDB7B2EDB8B1EDB7B2EEB7B1EDB7B1EDB7B1
      EEB8B1EDB7B1EDB8B1EDB7B1EDB7B1EDB7B1EEB7B1EDB7B1EDB7B1EDB7B2EDB8
      B1EDB7B1EDB8B2EDB7B2EDB7B1EDB7B1EDB7B2EDB8B2EDB7B1ECB7B2EEB7B2ED
      B8B1EDB8B1EDB7B1EDB7B1EDB7B1EDB7B2EDB7B1EDB7B1EEB8B2EDB7B1EDB7B2
      EDB8B2EDB7B2EDB7B1EDB7B2EDB7B1EDB7B1EDB7B1EDB7B1EDB8B1EDB7B1EDB7
      B1EEB7B1EDB8B1EDB7B1EDB7B2EDB7B1EDB7B1EDB7B1EDB8B1EDB8B1EDB8B1ED
      B7B1EDB7B1EEB7B2EDB7B1EDB7B2EDB7B2EDB7B1EDB7B2EDB7B1EDB6B2EDB7B1
      EDB8B1EDB8B1EDB7B1EDB7B1EDB8B2EDB8B1EDB8B2EEB7B1EDB7B2EDB7B1EEB7
      B2EDB8B1EDB7B2EDB7B2EDB8B2EDB7B1EDB7B2EDB6B2EDB7B2EDB7B1EDB8B1ED
      B8B1EDB7B2EDB7B2EDB7B1EDB7B2EDB7B1EEB6B1EDB8B1EDB7B2EDB8B1EDB7B1
      EDB7B1EDB7B2EDB7B1EDB7B2EDB7B1ECB7B1EDB7B1EDB7B1EDB7B2EDB7B2EDB8
      B2EDB7B2EDB7B1EDB7B1EDB8B1EDB6B1EDB7B1EDB8B2EDB7B1ECB7B1EDB7B1ED
      B7B1EEB8B2EDB7B1EEB8B1EEB7B1EDB8B2EDB7B1FFBEAB5A83E95A83E9FFBFAD
      EDB9B2EDB9B3EDB8B2EDB8B2EDB8B2EDB9B2EEB8B2EDB8B3EEB8B3EDB8B2EEB9
      B2EDB9B2EDB9B2EDB9B4EEB8B3EDB8B3EDB9B2EEB8B3EEB8B3EDB9B3EDB8B3ED
      B9B3EEB9B3EEB8B2EEB9B2EDB8B3EDB9B3EEB8B3EDB9B2EEB9B3EEB9B2EDB8B2
      EEB8B3EDB8B3EDB8B2EDB8B3EDB9B3EDB9B3EEB9B3EDB9B3EEB9B2EDB8B3EDB8
      B3EDB9B2EDB8B2EDB8B2EEB9B3EEB9B4EDB9B3EDB8B2EDB9B3EEB9B2EEB9B4EE
      B8B3EDB8B3EDB9B2EDB9B2EDB9B3EDB8B3EDB8B3EDB9B3EEB8B2EDB8B3EDB9B4
      EDB8B2EDB9B4EDB9B2EDB9B4EDB8B2EDB9B3EEB9B2EDB9B2EDB8B2EDB9B3EEB9
      B3EEB8B3EDB8B3EDB9B2EDB8B4EEB9B2EDB8B3EDB9B2EDB8B3EDB8B2EEB8B3EE
      B9B3EDB8B3EEB8B3EDB9B2EDB8B2EEB9B4EDB9B3EDB9B3EDB9B2EDB8B4EDB9B3
      EEB8B2EDB8B3EDB9B2EEB9B2EDB8B4EDB8B3EDB8B3EEB9B3EDB9B2EDB9B2EEB9
      B2EDB8B3EDB9B3EEB9B3EDB8B3EDB9B2EDB8B2EDB8B3EEB9B2EDB8B3EDB8B2ED
      B8B2EDB9B2EDB8B2EDB9B3EDB8B3EDB9B3EEB8B2EDB8B2EDB9B4EDB8B3EDB9B2
      EEB8B3EEB9B4EDB9B2EDB8B4EEB8B2EDB9B3EEB9B3EDB8B2EDB9B3EDB9B3EDB8
      B2EEB8B3EEB9B3EDB9B3EDB8B2EEB8B3EDB8B3EDB8B2EDB9B2EEB8B3EEB9B3ED
      B9B2EEB8B4EDB8B2EEB8B2EEB9B3EDB8B4EEB9B3FFBFAC5A83E95A83E9FFC1AD
      EDBAB3EDBAB4EDBAB4EDBAB4EEBBB4EEBBB3EEBBB4EDBAB5EDB9B3EEBAB3EDBA
      B3EEBBB4EDB9B4EDBBB4EEBAB4EDBAB4EDBAB4EDB9B5EEBAB5EEBAB5EDBAB3ED
      BBB4EDB9B4EEBAB3EEBBB4EDBAB5EEBAB4EEBAB5EEBBB4EDBBB5EEBBB4EDBAB4
      EDBAB4EDBAB4EEBAB3EDBAB4EEBBB4EEBBB5EDBAB4EEBBB5EEB9B4EDBAB3EDBA
      B4EDBAB4EEBAB3EDBAB4EEBBB4EEB9B4EEBAB4EDBAB3EEBBB5EEBAB4EDBBB4EE
      BAB5EEBAB4EDBAB4EDBAB4EDBBB5EDBAB3EEBAB5EDB9B5EDBAB4EDBAB5EDBBB4
      EDB9B4EEBBB4EEBBB4EEBBB4EDBAB4EEBBB4EEB9B4EDBAB3EEBAB3EDBAB4EEBB
      B5EDBAB5EEBAB5EDBBB3EDBAB5EEBBB3EEBAB4EDBBB3EDBAB3EDBAB3EEBAB5EE
      BAB5EDBAB4EDBAB3EDBBB4EDBAB4EEBAB4EEBAB4EDBAB3EEBAB4EDBBB4EDB9B5
      EEBAB3EDB9B5EEBBB3EEBBB4EDB9B4EEB9B4EDBAB4EDBAB4EDBBB4EDBAB4EEB9
      B4EDBAB5EEBAB4EEB9B3EEB9B4EDB9B3EDBAB3EEBAB4EEBAB4EDBAB5EEBAB3EE
      B9B4EEBBB3EDBAB4EDBBB5EEBAB4EDBBB5EDBAB3EEBAB4EEBBB4EDBAB5EEB9B4
      EEB9B4EEBBB4EEBBB4EDBAB4EEBAB4EDB9B5EEBAB5EEBAB4EDBBB4EDB9B3EDBA
      B4EEBAB4EEBBB4EEBAB4EDBAB4EEBAB5EEBAB5EDB9B4EEB9B4EEBAB5EEBBB5ED
      BBB3EDB9B4EDBAB4EDB9B4EDBAB5EEBAB4EEB9B5FFC1AD5A83E95A83E9FFC3AF
      EEBBB5EEBBB5EEBBB6EDBCB6EEBBB6EEBBB5EDBBB6EEBBB5EDBBB5EDBBB5EDBB
      B5EEBBB6EDBBB5EDBBB5EDBCB5EEBBB5EDBBB6EEBBB5EDBCB5EEBCB5EDBCB5EE
      BBB5EEBBB6EDBBB5EDBBB6EEBBB5EEBBB5EDBBB5EEBBB5EEBBB5EEBBB6EDBCB6
      EEBBB5EEBCB5EEBCB4EEBCB5EEBBB5EEBBB5EEBBB5EEBBB5EDBBB6EDBBB5EDBB
      B4EEBCB5EEBBB5EDBBB5EDBBB4EDBBB5EEBCB6EDBCB4EEBBB5EDBBB6EEBBB5ED
      BBB5EDBCB5EEBBB5EEBBB6EDBBB5EDBCB5EEBBB5EEBBB5EDBBB6EDBCB5EDBBB5
      EEBBB5EEBBB5EEBBB6EDBBB5EDBCB6EEBBB5EDBBB6EEBCB5EEBBB5EDBBB5EDBB
      B5EDBCB5EEBCB5EDBBB5EEBCB5EDBBB5EEBCB5EDBBB5EDBBB5EEBCB5EEBCB5ED
      BBB5EEBCB5EDBBB4EEBBB6EEBBB6EDBBB4EEBBB5EDBBB5EDBBB6EEBBB5EEBBB5
      EDBBB5EEBBB5EDBBB5EDBBB6EEBBB5EEBBB5EEBBB6EDBCB4EEBBB6EDBCB6EEBB
      B6EDBCB5EEBCB6EDBBB5EEBBB6EEBBB5EEBBB5EEBCB6EDBBB6EEBCB5EEBBB5EE
      BBB6EEBBB5EDBCB6EEBBB5EEBCB6EEBBB5EDBCB5EEBCB6EEBBB5EDBCB5EDBBB6
      EDBBB4EDBBB5EEBBB6EDBCB5EDBBB6EEBBB5EDBCB5EEBBB6EDBBB5EDBBB5EEBB
      B6EDBCB6EEBBB5EEBCB5EDBCB6EDBCB5EEBBB5EEBBB5EEBBB6EDBCB5EDBBB5EE
      BBB5EDBBB5EDBCB6EEBBB6EEBBB5EEBCB5EDBBB5FFC2AF5A83E95A84E9FFC3B1
      EEBDB7EEBDB7EEBDB6EEBCB6EDBDB6EEBCB7EEBCB6EEBDB6EEBEB7EDBDB6EEBD
      B7EEBCB6EDBDB6EEBCB7EEBCB7EEBDB7EEBCB6EEBDB6EEBCB6EDBEB6EEBDB7EE
      BDB6EEBCB6EDBDB7EEBCB6EEBDB6EEBCB6EEBDB6EEBCB7EEBDB6EEBCB6EEBCB6
      EEBDB7EEBEB7EDBCB6EEBCB7EEBCB7EEBCB6EEBCB7EDBDB6EEBDB6EEBDB7EEBD
      B6EEBDB6EDBDB7EEBDB7EDBDB6EEBCB6EEBEB6EEBCB6EEBCB6EEBDB6EEBCB6EE
      BDB6EDBCB6EEBDB7EEBDB6EDBDB6EEBCB7EEBDB6EEBDB6EEBDB6EDBCB6EDBDB6
      EEBCB7EEBDB7EDBCB6EDBCB6EDBEB6EEBCB6EDBDB6EEBDB7EEBDB7EEBDB7EEBC
      B6EEBCB6EEBCB6EDBDB7EEBCB6EEBDB7EDBCB6EEBCB7EEBDB6EEBCB7EEBCB6ED
      BDB6EEBCB7EEBDB6EEBDB6EEBDB6EEBDB6EDBDB7EEBDB7EDBCB6EEBCB7EEBDB6
      EEBDB7EEBCB6EDBDB7EEBDB6EEBCB6EEBDB7EEBDB6EEBEB6EEBCB6EEBEB6EEBD
      B6EEBEB6EDBDB6EEBCB7EEBCB6EEBCB7EEBDB7EEBCB6EDBDB6EEBCB6EEBDB7ED
      BCB6EEBDB6EEBCB6EEBCB6EEBCB6EEBDB7EEBEB7EDBCB6EEBDB7EEBCB6EDBCB6
      EDBDB6EEBDB6EEBDB6EDBDB7EEBDB6EEBDB6EEBDB6EEBDB6EEBCB7EEBCB7EEBD
      B6EDBCB6EEBDB7EEBDB7EEBCB6EEBCB6EEBDB6EEBEB6EEBDB6EEBCB6EEBDB6EE
      BCB7EDBEB6EEBCB6EEBDB6EEBCB6EEBDB6EEBDB6FFC4B15A84E95A84E9FFC5B1
      EEBDB7EEBFB7EEBFB7EEBEB7EEBFB7EEBEB7EEBEB8EEBEB7EEBEB9EEBFB8EEBE
      B7EEBEB7EFBFB8EEBDB7EEBDB8EEBFB7EEBEB7EEBFB7EEBDB7EFBEB7EEBEB7EE
      BFB8EEBEB7EEBEB7EEBEB7EEBFB7EEBEB8EEBFB7EEBDB8EEBFB8EEBEB7EEBDB7
      EEBEB7EEBEB7EEBEB8EEBDB7EEBEB7EEBEB7EEBEB7EEBEB8EEBEB7EEBFB7EEBF
      B8EEBEB8EEBFB7EEBEB9EEBEB7EEBEB7EEBEB7EEBDB8EEBEB7EEBFB7EEBDB8EE
      BEB8EEBEB8EEBFB8EEBFB7EEBFB7EEBEB7EEBFB7EEBEB8EEBFB7EEBEB8EEBFB8
      EEBEB8EEBFB7EEBEB7EEBEB7EEBEB7EEBDB8EEBEB7EEBEB7EEBFB7EEBFB7EEBE
      B8EEBEB7EEBDB7EFBFB9EEBEB8EEBEB7EEBDB8EEBEB7EEBFB8EEBDB7EEBEB8EE
      BDB7EEBEB7EEBFB7EEBFB7EEBFB7EEBEB8EEBEB8EEBFB7EFBEB7EEBDB7EEBEB8
      EEBFB7EEBEB7EEBEB8EEBEB7EEBEB7EEBDB8EEBFB7EEBEB8EEBEB7EEBEB7EEBF
      B7EEBEB8EEBEB7EEBEB7EEBEB7EEBEB7EEBFB7EEBEB8EFBEB8EEBEB7EEBEB7EE
      BEB7EEBEB8EEBEB7EEBEB7EEBDB7EEBFB8EEBEB7EFBEB7EEBEB7EEBEB8EEBEB7
      EEBDB8EEBFB7EEBFB7EEBEB9EEBEB7EEBEB7EEBEB7EEBEB7EEBEB8EEBEB7EEBF
      B7EEBEB7EEBEB7EEBDB7EEBDB7EEBEB7EEBFB7EEBEB8EEBFB7EEBEB7EEBFB7EE
      BDB7EEBEB7EEBEB7EEBFB7EEBEB7EEBEB7EEBEB7FFC6B15A84E95A84E9FFC6B2
      EEBFB8EEBFB9EEBFB9EEC0B8EEBFB8EEBFB8EFC0B9EEBFB8EFBFB9EEBFBAEEBF
      B8EEC0B9EFBFB9EFBFB9EEBFB8EFBFB9EEBFB9EEBFB8EFBFB8EFC0B8EEBFB9EE
      BFB9EFC0B9EEBFB9EEBFB8EEBFB9EFC0B8EEBFB8EFBFB9EEBFB8EEBFB8EEBFB8
      EFC0B8EEBFB8EEC0B8EEBFB9EEBFB8EEBFB9EEC0B9EEC0B9EFC0B8EEBFB8EEBF
      B8EEC0B8EEBFB8EEBFB9EEBFB9EEC0B8EEBFB8EEBFB8EEC0B8EEBFB8EEBFB9EE
      BFBAEEC0B9EEBFB8EFBFB8EEBFB9EEC0B9EEBFB9EEBFB9EEBFB9EEC0B9EEBFBA
      EFC0B9EEBFB8EEBFB9EEC0B8EEBFB9EEBFBAEEBFB8EEBFB8EEBFB9EEBFB9EFBF
      B9EEC0B8EEBFB9EFBFB9EEC0B9EEBFB9EEBFB9EFBFB8EFBFBAEEBFB8EEC0BAEE
      BFB8EEBFB8EEBFB9EEBFB8EEBFB9EEBFB8EEBFB8EFBFB9EFC0B8EEBFB8EEC0BA
      EEBFB8EEC0B8EEC0B8EEBFB8EEC0B8EEBFB9EFBFB8EFBFB8EEC0B8EEBFB9EFBF
      B9EEBFBAEEBFB8EEC0B9EEC0B8EEBFB8EEBFB8EEBFB9EFC0B9EEC0B8EEC0B8EE
      C0B8EEBFBAEEBFB8EEC0B8EEBFB8EEBFB8EEBFB8EFC0B9EEBFB8EEC0B9EEC0B9
      EEBFBAEEBFB8EEBFB9EEC0B9EFBFB8EEC0B9EEBFB8EFBFB9EEBFB9EEC0B8EEBF
      B8EEBFB9EEBFB9EEBFB8EEBFB9EFC0B8EEBFB8EEBFB8EEBFB8EEC0B9EFBFB9EE
      BFB8EEBFB8EEC0B9EFBFB9EFBFB9EEBFB8EEBFB9FFC6B35A84E95A84E9FFC8B3
      EEC0B9EEC0BAEEC1BBEEC0BAEEC1BAEFC1B9EEC0BAEEC1B9EFC1BAEFC0BAEEC1
      BAEEC1BAEFC0BAEEC1BAEEC1B9EEC0BAEFC1BBEFC1BAEEC1B9EEC1B9EFC1BBEE
      C0B9EEC0BAEFC1BAEEC1BAEFC0BAEFC0B9EEC1BAEFC1BBEEC0B9EFC1B9EFC1B9
      EEC1BAEEC1BAEEC0B9EEC1BAEFC1BAEFC1BAEFC0BBEEC1B9EEC0B9EEC1BAEFC0
      BAEEC1B9EFC0BAEEC1B9EEC1BBEFC1B9EFC1B9EEC1BAEFC2B9EFC0BAEEC1BAEF
      C1BBEEC0BAEEC1B9EEC0B9EFC1BBEFC0BBEEC1BAEEC1BAEFC0BAEEC0B9EEC1BB
      EEC2BBEFC0BAEEC1BAEFC1BAEFC0BAEEC1BAEFC0B9EFC1B9EEC0BAEFC1BBEEC1
      BAEFC2B9EEC0BBEEC0BBEEC0BAEFC1BAEFC2B9EEC1B9EEC0BAEFC1B9EEC1BAEF
      C0BAEEC1B9EFC0BAEEC0BAEFC0BAEEC1BAEEC0B9EEC1BBEEC0B9EFC1BAEEC1BA
      EFC0B9EFC0B9EEC1BAEFC1BAEEC1B9EFC1BAEEC0BAEEC1B9EEC1BAEEC1BBEFC1
      BBEFC0BAEFC1BAEEC0BBEEC2BAEEC1BAEFC0B9EEC1B9EEC2BAEEC0B9EFC1BAEF
      C0B9EFC2BAEFC1B9EEC0B9EEC2BAEFC0B9EEC1B9EEC1BAEFC2B9EEC0BAEEC2BB
      EEC1BAEEC0BAEEC1BBEEC0B9EEC2BAEEC0BBEFC1BAEEC1BBEFC1BBEEC0BAEFC0
      B9EEC1BAEEC1BBEFC0B9EEC0BBEFC0B9EFC0BAEEC0BAEFC1BAEFC2BBEEC0BAEF
      C1B9EEC1B9EFC0BAEFC1BAEEC1BBEFC1B9EFC1BBFFC8B55A84E95A84E9FFCAB5
      EFC2BBEFC2BAEEC3BBEEC1BCEFC2BBEFC3BAEEC2BCEEC2BBEEC2BCEEC1BBEFC3
      BCEEC2BBEEC2BCEFC3BAEEC3BAEFC2BAEEC3BCEFC2BBEFC2BAEFC2BBEFC2BBEF
      C1BBEEC1BAEFC3BAEEC2BCEEC2BAEFC1BBEFC2BBEEC2BCEFC2BBEFC3BAEFC2BB
      EEC2BBEFC3BBEEC2BBEEC2BBEFC2BCEFC3BBEEC1BBEFC2BBEEC2BBEFC3BBEFC2
      BBEEC2BAEFC2BCEEC2BBEEC2BBEEC2BBEEC3BAEEC1BCEFC2BAEEC1BCEFC2BBEE
      C2BBEEC2BCEEC3BBEEC2BBEFC2BBEFC2BCEFC2BAEFC1BBEEC2BBEFC1BAEFC2BB
      EFC2BBEEC1BBEEC2BBEFC2BCEFC2BBEEC3BAEFC2BBEFC3BBEFC2BAEEC2BBEEC2
      BBEFC2BBEFC2BCEFC2BBEEC2BAEFC1BAEEC2BBEFC2BAEFC2BBEFC1BBEFC2BBEF
      C2BBEEC3BBEEC1BAEFC2BCEFC1BBEFC2BCEFC2BAEEC3BBEEC2BBEFC1BBEFC2BB
      EEC1BBEFC1BBEEC2BBEFC3BCEFC1BBEFC2BBEEC2BBEFC2BBEEC1BBEEC2BBEFC3
      BBEFC2BAEEC3BCEEC1BCEFC2BBEEC3BCEEC2BBEFC3BAEFC2BBEEC1BAEFC2BCEF
      C1BAEEC2BBEEC3BAEFC1BAEEC2BBEFC2BAEEC2BBEEC2BBEEC3BBEEC2BBEEC2BB
      EFC1BBEFC2BBEEC3BBEEC1BAEEC2BCEFC1BBEFC3BCEEC1BBEFC3BBEFC2BBEFC2
      BBEEC2BBEFC3BBEFC2BAEFC2BBEEC2BBEFC1BCEEC2BBEFC2BBEEC2BBEFC1BBEF
      C3BBEEC2BAEEC2BAEFC2BBEFC3BBEFC3BBEEC1BCFFCAB55A84E95A84EAFFCBB6
      EFC4BDEFC4BBEFC3BCEFC3BCEFC3BCEEC3BCEFC4BCEEC2BDEFC3BCEFC3BCEFC3
      BCEFC4BDEFC4BCEFC3BCEEC3BCEFC4BCEFC3BCEFC3BCEFC3BCEFC3BDEFC3BCEF
      C3BCEFC3BBEEC3BBEFC3BCEEC3BCEFC3BCEFC3BCEFC3BCEFC4BDEEC3BBEFC3BD
      EFC4BBEFC3BBEFC3BDEEC3BDEFC3BCEEC3BDEFC3BCEFC4BCEFC3BCEFC3BCEFC4
      BCEFC4BCEFC4BCEFC3BDEEC3BCEFC4BDEEC3BBEFC3BCEFC3BCEFC3BCEFC4BCEF
      C2BCEFC4BCEFC3BDEFC4BDEEC3BCEFC3BCEFC3BCEFC3BCEFC4BCEEC2BBEFC3BB
      EEC3BCEFC2BBEFC3BDEFC3BCEFC4BCEFC3BBEFC3BDEEC3BDEFC4BCEEC3BCEEC3
      BCEFC3BCEFC4BCEEC3BCEEC4BCEEC2BCEFC3BDEFC3BCEFC4BDEEC2BCEFC4BCEF
      C3BCEEC3BDEFC3BCEEC4BCEFC3BDEEC3BCEFC4BBEFC3BCEFC4BCEEC3BCEFC4BD
      EFC3BDEFC2BDEFC4BBEFC3BCEFC3BDEFC3BCEFC4BCEEC3BCEFC3BCEFC4BCEFC3
      BCEEC4BCEFC3BCEEC2BCEFC3BBEFC3BCEFC4BCEFC3BBEFC3BBEEC3BBEFC3BCEF
      C3BBEFC3BDEEC3BBEFC3BBEFC3BCEFC4BCEEC3BCEFC4BDEFC3BDEFC3BCEEC3BC
      EFC3BCEFC3BBEFC3BCEEC3BCEFC3BCEEC2BCEFC3BCEFC3BCEFC3BCEFC3BCEFC4
      BDEFC3BDEEC3BBEFC4BCEFC4BCEFC4BCEFC3BCEFC4BBEFC3BCEFC3BCEFC3BCEF
      C3BDEEC3BCEFC4BBEFC3BDEFC3BCEFC3BDEFC3BCFFCCB65A84EA5A84EAFFCDB8
      EFC4BDEFC4BDEEC4BEEFC5BDEFC5BEF0C4BEEFC4BDEFC4BDEFC4BDEFC5BDEFC4
      BDEFC4BDEFC4BDEFC4BEEFC4BDEEC4BEEFC4BDEFC5BEEFC5BEEFC4BDEFC4BEEF
      C5BCEFC5BDEFC4BDEFC4BCEFC5BEEFC5BDEFC4BEEFC4BDEFC4BDEFC4BDEFC5BD
      EFC4BDEFC4BDEFC4BDEFC5BDEFC5BDEFC4BDEFC5BDEEC4BDEFC4BDEFC5BEEFC4
      BEEFC4BEEFC4BDEFC5BDEFC5BEEFC4BDEFC4BDEFC4BDEFC5BEEFC5BDEEC4BDEF
      C4BEEFC4BDEFC5BDEFC4BDEFC4BEEFC4BCEFC4BDEFC5BDEFC4BDEFC4BDEFC5BD
      F0C5BDEFC4BDEFC4BDEFC5BDEFC4BDEFC4BDEFC5BDEFC4BDEFC4BEEFC5BEEFC5
      BEEEC4BDEFC4BCEFC5BDF0C4BDF0C4BEEFC5BDEFC4BEEFC4BDEFC4BDEFC4BDEF
      C5BEF0C4BDEFC4BDEFC4BDEFC4BDEFC5BDEFC4BDEFC4BDEFC4BCEFC5BEEFC4BD
      EFC5BDEFC4BDEFC4BCEFC4BDEFC5BDEFC5BDEFC4BEEFC4BCEFC5BEEFC4BDEEC4
      BEEFC4BEEFC4BCEFC4BDEFC4BDEFC5BDEFC4BCEFC4BCEFC4BCEFC5BDEFC4BDEF
      C5BDEEC4BDEFC4BDEFC5BDEFC4BEEFC4BEEFC4BDEFC4BDEFC4BDEFC4BDF0C4BE
      EFC5BCEFC4BDEFC4BEEFC5BEEFC4BCEFC4BDEFC5BDEFC5BDEFC4BDEFC4BEEFC4
      BDEFC5BDEFC5BDEFC4BEEFC4BEEFC4BDEFC4BDEFC4BDEFC4BEEFC4BDEFC5BDEF
      C4BDF0C5BEEFC4BDEFC5BDEFC4BDEFC4BDEFC4BDFFCCB85A84EA5A85EAFFCDB9
      EFC5BEEFC6BEF0C6BEEFC5BFF0C5BEF0C5BEEFC5BEEFC5BEEFC6BEEFC5BEEFC5
      BEEFC5BEEFC5BEEFC5BEEFC5BEEFC6BEF0C6BEEFC5BEEFC5BEEFC5BEF0C6BEEF
      C5BDEFC5BEEFC5BEEFC6BEEFC6BEEFC5BFEFC6BEEFC6BFEFC5BDEFC5BFF0C5BE
      F0C5BFEFC5BEF0C6BEEFC5BEEFC5BEEFC6BEEFC5BEEFC5BEEFC6BFEFC6BEEFC5
      BEEFC5BEEFC5BFEFC5BDEFC5BEEFC6BEEFC5BFEFC6BEEFC5BEEFC5BEEFC5BEEF
      C6BEEFC5BEEFC6BEEFC5BEEFC6BEEFC6BEEFC6BEEFC5BDEFC5BFEFC6BEEFC5BF
      F0C6BEEFC5BEEFC6BEEFC6BEEFC5BFEFC5BEEFC6BDEFC5BEEFC5BEEFC5BEEFC5
      BEEFC6BEEFC6BEEFC6BEF0C6BEF0C6BEEFC5BEEFC6BEEFC5BEEFC5BFEFC5BEEF
      C6BEF0C5BEEFC6BEEFC6BEEFC6BEEFC5BFEFC5BFEFC5BEEFC5BEF0C5BEEFC5BE
      F0C5BEEFC6BEF0C5BEEFC5BEEFC5BEEFC5BFEFC5BEEFC6BEF0C6BEEFC5BEEFC6
      BEEFC5BEEFC5BDEFC6BFEFC5BFEFC6BFEFC5BEEFC5BEEFC5BEF0C5BEEFC5BFEF
      C5BFEFC6BEEFC5BFEFC5BFEFC5BEEFC6BEEFC6BFEFC5BEEFC5BEEFC5BEF0C6BE
      EFC5BDEFC5BFEFC6BEEFC5BEF0C5BEEFC6BEEFC6BEEFC5BDEFC5BEF0C6BEEFC5
      BEEFC5BEEFC6BFEFC5BEF0C6BEEFC5BFEFC6BEEFC6BFEFC6BEEFC5BEEFC7BFEF
      C5BEF0C6BEEFC5BEEFC5BDEFC5BDEFC5BEEFC6BFFFCEBA5A85EA5A85EAFFCEBA
      EFC6BFEFC7BFF0C7BFEFC6BFF0C6BFEFC7BFEFC7BFEFC7BFF0C7BFEFC6BFEFC6
      BFEFC6BFF0C7BFEFC6BFEFC7BFEFC7BEEFC7BFF0C6BFF0C6BFEFC7BFEFC7BFEF
      C7BFEFC7BEEFC6BFEFC7BFEFC7BFEFC6BFEFC7BFF0C8BFEFC6BFEFC7BFEFC7BE
      EFC7BFEFC6BEF0C7BFEFC6BFEFC6BFF0C8BFEFC7BFEFC6BFEFC6BFEFC6BFF0C6
      BFEFC6BFF0C6BFEFC6BEF0C6BFF0C7BFF0C7BFEFC7C0EFC6BFEFC7BFF0C6BFEF
      C6BFEFC7BFEFC6BEEFC7BFF0C7BFEFC8BFEFC7BFF0C6BFEFC7BFF0C7BFEFC6BF
      EFC6BFEFC7BFF0C7BFF0C6BFF0C6BFEFC7BEEFC6BFEFC6BFEFC7BFEFC6BFEFC6
      BFEFC7BEEFC7BFF0C6C0EFC8BFEFC7BFEFC6BFEFC7BFEFC6BFEFC7BFEFC7BFEF
      C7BFEFC6BEEFC7BFEFC7BFEFC7BFF0C6BFEFC6BFF0C7BFEFC7C0F0C7BFEFC6BF
      EFC7BFF0C6BFEFC6BFEFC6BEEFC7BEEFC6BFF0C6BEF0C8C0EFC6BEEFC7BFEFC6
      BFEFC7BFEFC7BFEFC6BFEFC6BFF0C6BFF0C7BFEFC6BFF0C7BFF0C7BEF0C7BFEF
      C7BFEFC7BFEFC6BFEFC7BFEFC6BFEFC7BFF0C6BFEFC7BFEFC7BFEFC7BFEFC8BF
      EFC6BFF0C7BFEFC7BFF0C7BFF0C7BFF0C6BFEFC6BEEFC7BFEFC6BEF0C6BFEFC7
      BFF0C6BFF0C7BFEFC6BFEFC7BFEFC6BFEFC7BFEFC8BFEFC7BFEFC6BFEFC7BFF0
      C7BFEFC6BFF0C6BFEFC6BFEFC7BFEFC7BFEFC7BFFFCFBA5A85EA5A85EAFFD0BB
      F0C7C0F0C8C0EFC7C0EFC7C0EFC8BFF0C8C0F0C8C0F0C9BFEFC7C0EFC8C0EFC7
      C0F0C7C0EFC8C0F0C8C1EFC8C0EFC7C0EFC8C0F0C8C0F0C8C0F0C8C0F0C7C0F0
      C9C1F0C9C0EFC8C0F0C7C0EFC9C0F0C8C0F0C8C0EFC8C0EFC8C0EFC8C0F0C8BF
      F0C8C0F0C7C0EFC7C0F0C8C0F0C7C0EFC8C0F0C8C0F0C7C1EFC7C0F0C8BFEFC8
      C0F0C8C1EFC7C0EFC8C0EFC7C0EFC7C0EFC8C0EFC8C0EFC8C0EFC8C0F0C8C0F0
      C7BFEFC8C0EFC7BFF0C8C0EFC7C0F0C8C0EFC7BFF0C8C1EFC8C0F0C7C0EFC8C0
      F0C7C0EFC9C0F0C7C1F0C7C0EFC7C0F0C9C0EFC7C0EFC8BFF0C8C0EFC7C0F0C8
      C0F0C7C0F0C8C0F0C8C0EFC8C0F0C8C0F0C8C0F0C7C0EFC7C0F0C8C0F0C9C0F0
      C9C0F0C8C0F0C8BFEFC8C0F0C8C0F0C8C0EFC7C0F0C8C0EFC8C0F0C9C0F0C7BF
      F0C8C0EFC8C0F0C8C0F0C7BFF0C8C0EFC8C0F0C7BFF0C8C0EFC8C0EFC8C0EFC7
      C0EFC8C0EFC8C0F0C7BFF0C8C0F0C7C0F0C8C0F0C7C0F0C8C0F0C8BFEFC8C0EF
      C8C0F0C7C0F0C8BFEFC8C0EFC7C0EFC8C0F0C8C0EFC8C0F0C8C0F0C8C0EFC8C0
      F0C8C0EFC8C0F0C8C0EFC8C0EFC8C0EFC7C0F0C8C0EFC8C0EFC7C0F0C8C0EFC9
      BFF0C8C0EFC8C0EFC7C0EFC8C0F0C7C0EFC7C0F0C8C0EFC8C0F0C8BFEFC7C0EF
      C8C0F0C7C0EFC8C0EFC8C0EFC8C1F0C8C0EFC8C0FFD0BB5A85EA5A85EAFFD1BC
      EFC9C1F0CAC1EFC8C1F0C8C1EFCAC1F0C9C1EFC9C1EFC9C0EFC9C0F0CAC1EFC8
      C1EFC9C1F0C8C0EFCAC1F0C9C1EFC8C1F0C9C0EFC9C1F0C9C1F0C9C1EFC8C1F0
      C9C1EFC9C1F0C9C1F0C9C1F0C9C1F0C9C2EFC9C1EFC8C1F0C9C1EFC8C1F0C9C1
      F0C9C1F0C9C1EFC9C1EFC9C1F0C8C0F0C8C1EFC9C1EFC8C1EFC8C0EFC9C1F0C9
      C1EFC9C1F0C9C2F0C9C2F0C8C1EFC8C1F0C8C1F0C9C1EFC9C1EFC9C1F0CAC1EF
      C8C1F0C9C1EFC9C1F0C9C1F0C8C1F0C9C2F0C9C0F0C9C1EFC9C1EFC8C1EFC9C1
      EFC9C1F0C9C0EFC8C1EFC9C1EFC9C1F0C9C1EFC8C1EFCAC1F0C9C1EFC8C1EFC9
      C1EFC8C1F0C9C1F0C9C0EFC8C1F0C8C1EFC9C1EFC9C1EFC9C1EFC9C1EFC9C1EF
      C9C0F0CAC1F0CAC1F0CAC1F0C9C1EFCAC0F0C8C2EFC9C1F0C8C1F0C9C1F0C9C1
      EFC9C1EFC9C1EFC9C1F0C9C0EFC8C1F0C9C1EFC9C0F0C8C1F0C9C1F0C8C1EFC8
      C2EFC9C0F0C8C1F0C9C0F0C9C1F0C8C1EFC8C1F0C9C1F0C8C2EFC8C0F0C9C0EF
      C8C0F0C9C1EFC9C1F0C9C1F0C8C1EFC9C1F0C9C1EFC9C1F0C9C1EFC9C1EFC9C1
      F0C9C1F0C9C1EFC9C1EFC8C1F0C8C1F0C8C1F0C9C1EFC9C0F0C8C2F0C9C1EFC9
      C1EFCAC1F0C8C1F0C9C0F0C9C1EFC9C1F0C8C1F0C9C1EFC9C1F0C9C0EFC9C1F0
      C9C1F0C9C1F0CAC1F0C9C1F0C9C1F0C8C1EFC9C1FFD1BC5A85EA5A85EAFFD3BD
      F0CAC3F0CAC3F0CAC3F0CAC2F0CAC2F0CAC2F0CAC3EFC9C1EFCAC2F0CAC2F0CA
      C2F0CAC1EFCAC1EFCAC2F0CAC2EFCAC1F0CAC2EFCAC2F0CAC1EFCAC3EFC9C2F0
      CAC1F0C9C1F0CAC2F0CBC2EFCAC2F0CAC2F0CAC1F0C9C2F0CAC2F0C9C2F0CAC3
      F0CAC2F0CAC2F0CAC2F0CAC3F0CAC1EFC9C2F0CAC2EFCAC1F0CAC1F0CAC2F0CA
      C2F0CAC1F0CAC2F0CAC2F0C9C2F0C9C2F0C9C1EFCAC2F0CAC2EFCAC2F0CAC1EF
      CAC2F0CAC2EFCAC3EFCAC2F0CAC2F0CAC2F0CBC2F0CAC1F0CAC2F0C9C2F0CAC1
      F0CAC3F0CAC1F0C9C1EFCAC2F0CAC2F0CAC2F0C9C2F0CAC2F0CAC2F0C9C2EFCA
      C2EFCAC2EFCAC1EFC9C2EFC9C1F0C9C2F0CAC2F0CAC2F0CAC2EFCAC2F0CAC2F0
      CAC1F0CAC2EFCAC2F0CAC1EFCAC2EFCAC2F0CAC2F0CAC2F0CAC2EFCAC1F0CBC2
      F0CAC2F0C9C2F0CAC2EFCAC1F0CAC1EFCAC2EFCBC2F0C9C2F0C9C2F0C9C2EFCA
      C2F0CAC1F0C9C2EFCAC2F0CAC2F0CAC2EFCAC2F0CAC2F0C9C2F0CAC2EFCAC1F0
      CAC1F0CAC2EFCAC2F0CAC2F0CAC2EFC9C2F0C9C2F0CAC2EFCAC1F0CAC1F0CAC2
      F0CAC2F0CAC3F0CAC2F0C9C3F0CAC2F0C9C2EFCAC2EFCAC2F0C9C2F0C9C2F0C9
      C2F0CAC1F0CAC2EFCBC1F0CAC2EFCAC2F0CAC2F0CAC2F0CAC2F0C9C1EFCAC2EF
      CAC2F0CBC2F0CAC2F0C9C2F0CAC2F0CAC2F0CAC2FFD3BC5A85EA5A85EAFFD4BE
      F0CAC3F0CBC3F0CBC3F0CCC3EFCAC3F0CAC3F0CBC3F0CAC2F0CBC3F0CBC3F0CB
      C3F0CBC2F0CCC3F0CAC3F0CAC3EFCBC2F0CBC3F0CBC3F0CBC3F0CAC3F0CAC2EF
      CBC3F0CBC3F0CBC2F0CBC3F0CCC2F0CBC2F0CBC2F0CAC3F0CCC3F0CBC3F0CBC3
      F0CBC3F0CBC3EFCBC3F0CBC3F0CBC3F0CBC2F0CBC3F0CBC2EFCCC2F0CBC2F0CB
      C3F0CBC2F0CBC3F0CBC2F0CBC2EFCBC4F0CBC3F0CBC2F0CBC3EFCBC3F0CAC2F0
      CCC2F0CAC2F0CBC3F0CBC4F0CBC3EFCAC2F0CBC3EFCBC2F0CBC3F0CAC2F0CBC2
      F0CBC3F0CBC3F0CBC2F0CBC3F0CBC3F0CCC4F0CAC3F0CBC3F0CBC3F0CBC3F0CB
      C3F0CCC3F0CBC3F0CAC4F0CBC3F0CBC4F0CBC3F0CBC3F0CBC3F0CBC2F0CBC3F0
      CBC2F0CAC3EFCBC2F0CBC2F0CBC2F0CBC4F0CBC2F0CBC3F0CBC3F0CCC3F0CBC2
      F0CBC4F0CAC3F0CBC3F0CBC2F0CCC2F0CBC3F0CBC3F0CAC3F0CBC3F0CAC3F0CC
      C2F0CBC2F0CBC3F0CAC4F0CBC3F0CCC2F0CBC3F0CBC3F0CBC3F0CBC3F0CBC2F0
      CBC3F0CBC3F0CBC3F0CBC3F0CBC2F0CAC3F0CBC2F0CAC3F0CAC3F0CBC2F0CBC3
      F0CCC2F0CBC3F0CBC3F0CAC3F0CBC3F0CAC3F0CCC4F0CBC3F0CAC2F0CAC2EFCB
      C3F0CBC3EFCCC3F0CBC2F0CBC3EFCAC3F0CCC3F0CBC3F0CBC3F0CAC2EFCBC3F0
      CBC2EFCBC3F0CBC3F0CAC3F0CBC4F0CBC3F0CBC3FFD4BD5A85EA5A85EAFFD4BF
      F0CCC4F0CDC3F0CCC3F0CCC4F0CBC4F0CBC4F1CCC4F0CCC3F1CCC3F0CCC4F0CC
      C3F1CCC3F0CCC4F0CCC4F0CCC3F0CCC3F1CCC3F0CCC4F0CCC4F0CBC3F0CCC3F0
      CBC4F0CDC4F0CCC3F0CBC4F0CCC3F0CCC4F1CBC3F0CCC3F0CCC4F0CCC4F0CCC3
      F0CCC3F0CCC3F0CDC3F0CCC4F0CCC4F0CDC3F0CCC3F0CCC3F0CCC3F0CCC3F0CC
      C3F0CCC4F0CCC4F0CCC4F1CDC4F0CCC4F0CDC4F0CCC4F0CCC3F0CCC3F1CBC3F0
      CCC3F1CBC4F0CCC3F0CCC4F0CCC3F0CCC3F1CBC3F0CCC4F0CCC4F0CBC3F0CBC4
      F0CCC4F0CCC4F0CCC4F0CCC3F0CCC4F1CCC4F0CCC4F0CDC4F0CCC4F0CCC4F0CC
      C4F0CCC3F0CBC4F0CBC4F0CCC4F0CDC4F0CCC3F0CDC4F0CDC3F0CCC4F0CCC4F0
      CCC4F0CBC3F0CCC4F0CCC4F0CCC3F1CCC4F0CCC3F0CCC4F1CCC4F0CCC4F0CBC3
      F0CCC4F0CCC4F0CCC5F0CCC3F0CCC3F0CCC4F0CCC3F0CBC4F0CCC4F0CBC3F0CC
      C3F0CCC3F0CCC4F0CCC4F0CCC4F1CCC3F0CBC4F0CCC4F0CDC4F0CCC3F0CCC4F0
      CCC4F0CCC3F1CCC4F0CCC4F0CCC3F0CBC3F0CCC3F0CCC4F0CBC4F0CBC4F0CDC3
      F1CCC3F0CCC3F0CCC3F0CBC4F0CCC4F0CBC4F0CCC4F0CDC3F0CBC3F0CBC3F0CC
      C4F0CCC4F0CCC3F0CBC3F0CCC4F0CBC4F0CCC4F0CCC3F0CBC4F0CBC3F0CCC4F0
      CCC3F0CBC4F0CDC4F0CBC5F1CCC4F0CCC4F0CCC3FFD4BF5A85EA5B85EBFFD6BF
      F1CDC5F0CDC4F1CDC4F1CCC4F0CCC4F0CDC4F0CDC5F0CDC4F0CCC4F0CCC4F1CD
      C4F0CDC4F0CCC4F0CDC5F0CDC4F0CDC4F0CDC4F0CDC5F0CDC4F1CCC4F0CDC4F0
      CDC4F1CDC4F0CDC4F1CCC4F0CCC4F1CCC5F0CDC4F0CDC4F1CDC4F0CDC5F0CDC4
      F0CDC4F0CDC4F0CDC4F0CDC5F0CDC4F0CDC4F0CDC4F0CDC4F0CCC4F0CDC4F0CD
      C4F0CCC5F0CCC4F1CDC5F1CDC5F0CDC4F0CDC4F1CCC5F0CDC4F1CDC4F0CDC4F0
      CCC4F0CCC5F0CCC4F1CCC4F1CDC4F0CDC4F0CCC4F1CDC5F0CDC5F0CDC4F0CDC5
      F0CDC5F0CDC4F0CCC5F0CCC4F0CDC5F0CDC4F0CDC4F0CDC5F0CDC5F1CDC5F0CC
      C4F0CDC4F0CCC4F0CDC4F0CCC4F1CDC4F0CDC4F1CDC4F1CDC4F0CDC5F0CDC4F0
      CDC5F0CCC4F0CDC5F1CCC5F0CCC4F0CDC4F0CDC4F0CDC4F0CDC4F0CDC4F0CCC4
      F0CCC4F0CDC5F1CDC5F0CDC4F0CCC4F0CDC5F0CDC4F0CDC4F1CCC5F0CDC4F0CC
      C4F0CDC4F0CDC4F0CDC4F0CDC4F0CCC4F0CDC5F0CDC4F0CDC4F0CDC4F0CDC5F1
      CDC4F0CDC4F1CDC4F0CDC5F0CDC4F1CCC4F0CDC4F0CDC4F1CDC4F0CCC5F0CDC4
      F0CDC4F0CDC4F1CDC4F0CCC5F0CDC4F1CDC4F0CCC4F1CDC4F0CCC4F0CDC4F1CC
      C4F0CDC4F0CCC4F0CCC4F0CDC4F0CCC5F0CCC4F0CDC4F0CDC4F0CCC4F0CDC4F0
      CDC4F0CCC4F0CDC4F0CDC5F0CCC4F0CDC4F0CCC4FFD5C05A85EA5B85EBFFD7C0
      F1CDC5F1CDC5F0CDC5F1CEC5F0CDC5F0CEC5F1CEC5F0CEC5F0CEC5F0CEC5F0CE
      C5F0CEC5F0CDC5F1CEC5F0CEC5F0CDC5F0CEC5F1CEC5F0CEC5F1CDC5F0CDC5F0
      CEC5F0CDC5F0CDC5F0CEC5F1CDC5F0CDC5F0CEC5F1CDC5F0CEC5F1CEC5F0CEC5
      F0CEC5F1CDC5F1CDC5F0CDC5F0CEC5F0CDC5F0CEC5F0CEC5F0CDC5F0CEC5F0CE
      C5F0CDC5F0CDC5F0CDC5F0CDC5F0CEC5F0CDC5F0CDC5F1CEC5F1CEC5F1CEC5F1
      CEC5F0CDC5F0CEC5F0CDC5F0CEC5F0CEC5F0CEC5F0CDC5F0CEC5F1CEC5F0CEC5
      F1CEC5F0CEC5F0CDC5F0CDC5F0CEC5F0CEC5F1CEC5F0CDC5F0CEC5F1CEC5F1CD
      C5F0CEC5F0CDC5F0CEC5F0CDC5F0CDC5F0CDC5F1CDC5F0CEC5F0CDC5F0CEC5F0
      CEC5F0CDC5F1CEC5F1CDC5F0CDC5F0CEC5F0CEC5F1CEC5F0CDC5F1CEC5F0CDC5
      F1CEC5F1CDC5F0CEC5F0CEC5F0CEC5F1CEC5F1CEC5F0CEC5F0CDC5F0CEC5F0CD
      C5F1CEC5F0CEC5F0CEC5F0CEC5F0CEC5F0CEC5F0CEC5F0CDC5F0CDC5F0CEC5F1
      CEC5F0CEC5F0CEC5F0CEC5F0CDC5F1CEC5F1CEC5F0CDC5F1CEC5F1CDC5F0CDC5
      F1CEC5F0CEC5F0CEC5F0CEC5F1CEC5F0CEC5F0CDC5F1CDC5F0CEC5F0CEC5F1CE
      C5F0CEC5F0CDC5F0CEC5F0CDC5F1CEC5F1CDC5F0CEC5F0CEC5F1CDC5F0CEC5F1
      CDC5F0CEC5F0CDC5F0CEC5F0CDC5F0CEC5F0CEC5FFD7C05A85EB5B85EBFFD7C1
      F0CEC6F1CEC6F0CEC6F0CFC6F0CEC6F0CEC6F1CFC6F0CEC6F0CFC6F1CFC6F1CF
      C6F0CFC6F1CEC6F0CFC6F0CEC6F1CEC6F0CEC5F0CEC6F1CFC6F0CEC6F0CFC5F1
      CFC6F0CEC6F1CFC6F0CFC6F1CEC6F0CEC6F1CFC5F0CEC5F1CEC6F0CEC6F0CFC6
      F0CEC6F0CEC6F1CFC6F0CEC6F0CFC6F0CEC6F1CFC5F1CFC6F1CEC5F1CFC6F0CE
      C6F1CEC6F0CEC6F0CEC6F1CEC6F0CFC6F1CEC6F1CEC5F0CEC6F0CEC6F1CEC6F1
      CFC6F0CEC6F1CFC6F1CEC6F0CFC6F1CEC6F0CFC6F0CEC6F1CFC6F1CFC5F1CEC5
      F0CEC6F0CFC5F1CEC6F0CEC6F0CFC6F1CEC6F0CFC6F1CEC6F0CEC6F1CEC6F0CE
      C6F1CFC6F0CEC6F1CEC6F0CEC6F1CEC6F0CEC6F1CEC6F0CFC6F1CEC5F0CFC6F0
      CEC6F1CEC6F1CEC6F0CEC6F0CEC6F0CFC6F0CFC6F0CEC5F1CFC6F0CEC6F1CEC6
      F1CFC6F0CEC6F1CEC6F1CFC6F1CFC6F0CEC6F1CFC6F0CEC6F0CEC6F1CFC6F0CE
      C6F1CFC6F0CEC6F1CFC6F1CFC6F0CFC6F0CEC6F1CEC6F1CEC6F0CEC6F0CEC6F0
      CFC6F0CFC6F0CEC6F0CEC6F0CEC6F1CFC5F0CFC6F1CEC6F0CFC6F1CEC5F0CEC6
      F0CEC6F0CEC6F0CEC6F1CFC6F0CFC5F1CEC6F0CFC6F1CEC6F1CFC6F0CEC6F0CF
      C6F1CEC5F0CEC6F1CFC6F1CEC6F0CFC5F1CEC6F1CFC6F1CEC6F0CEC5F0CFC6F1
      CFC6F1CFC6F0CEC6F1CEC6F1CEC5F0CFC6F0CFC6FFD8C05A86EB5A86EBFFD8C2
      F1CFC7F1CFC6F0CFC6F1D0C7F1CFC7F1CFC7F1D0C6F1CFC6F0CFC7F1CFC6F1CF
      C7F0CFC6F1CFC7F1CFC6F1CFC7F0CFC7F1CFC6F1CFC6F1CFC6F1CFC6F1D0C6F0
      CFC6F0CFC6F1D0C6F0CFC6F1CFC7F1CFC7F1CFC6F1CFC6F1CFC6F1CFC7F1D0C6
      F0CFC6F1CFC7F1D0C7F0CFC7F0CFC7F0CFC7F0CFC6F0D0C7F1CFC6F0CFC7F1CF
      C7F1CFC6F1CFC7F1CFC6F0CFC7F1CFC7F0CFC6F0CFC7F1CFC6F0CFC7F0CFC6F0
      CFC7F0CFC7F1CFC7F1CFC7F0D0C7F1CFC6F1CFC7F1CFC6F0CFC7F0D0C6F1CFC7
      F0CFC7F1CFC7F1CFC7F0CFC6F0CFC6F1CFC7F0CFC7F0CFC7F0CFC6F0CFC6F1CF
      C7F0D0C6F1CFC6F0CFC6F1CFC7F1CFC7F0CFC6F1CFC7F0CFC7F1CFC6F0CFC6F0
      CFC7F0CFC6F0CFC7F1CFC7F0CFC7F1CFC7F0CFC7F0CFC6F1D0C6F0CFC6F1CFC7
      F1CFC6F0CFC7F0CFC7F0D0C6F0CFC7F1CFC7F1CFC6F0CFC7F0CFC7F1CFC6F0CF
      C7F0D0C6F1CFC6F1CFC7F1CFC7F1CFC7F0CFC6F1CFC7F0CFC6F0CFC7F1CFC7F1
      CFC7F1CFC6F1CFC7F0CFC7F1CFC7F1CFC6F1CFC7F0CFC6F1CFC7F0CFC6F1CFC7
      F1CFC7F1CFC7F0CFC6F0D0C6F1CFC6F0CFC6F0D0C6F1CFC6F1CFC7F0CFC6F1D0
      C6F0CFC7F1CFC6F0CFC6F1CFC7F1CFC6F1CFC7F0CFC7F1CFC6F1CFC6F0CFC7F1
      D0C6F1CFC6F1CFC6F1CFC7F0CFC6F0CFC6F0CFC6FFD8C25B86EB5B86EBFFD9C3
      F1D0C7F1D0C7F1D0C8F1D0C7F1D0C7F1D0C7F1D0C7F1D0C7F0D0C7F1D0C8F1D0
      C7F1CFC7F1CFC7F1D0C7F1D0C7F1D0C7F1D0C7F0D0C8F1D0C7F1D0C8F0CFC7F1
      D0C7F1D0C7F0D0C7F1D0C7F1D0C7F0D0C7F1D0C7F0D0C7F1D0C7F0D0C7F1D0C8
      F1D0C7F0D0C7F1D0C8F1D0C7F1D0C7F1D0C7F1D0C7F0D0C7F0D0C7F1D0C7F1D0
      C7F1D0C7F1D0C7F1D0C7F1D0C7F0D0C7F1D0C7F1D0C8F0D0C7F1D0C7F1D0C7F1
      D0C8F0D0C7F1D0C7F1D0C7F1D0C7F0D0C8F1D0C7F1D0C8F1D0C7F1D0C7F1D0C8
      F1D0C7F1D0C8F0D0C7F1D0C7F1D0C7F1D0C7F1D0C8F1D0C7F1D0C8F1D0C7F0D0
      C7F1D0C7F1D0C7F1D0C7F1D0C8F1D0C7F1D0C7F0D0C7F1D0C7F0D0C7F1D0C7F1
      D0C7F1D0C7F0D0C7F1D0C7F0D0C7F1D0C7F1D0C7F1D0C7F1D0C7F1D0C8F0CFC7
      F1CFC7F1D0C7F1D0C7F0CFC7F1D0C7F1D0C7F0CFC8F1D0C7F1CFC7F0D0C7F1D0
      C7F1CFC7F1D0C7F0D0C8F1D0C8F0D0C7F1D0C7F0D0C7F1D0C7F1D0C7F0D0C7F1
      D0C7F1D0C7F1D0C7F1D0C7F1CFC7F1D0C7F1D0C7F1D0C8F1D0C7F1D0C7F0D0C7
      F1D0C8F1D0C7F1D0C8F1D0C7F1D0C7F1D0C7F1D0C7F1D0C7F1D0C7F0CFC8F1D0
      C7F1CFC8F1D0C7F1D0C7F1D0C7F0D0C7F1CFC7F1D0C8F1D0C7F1CFC7F1D0C7F1
      D0C7F0D0C7F0D0C7F1D0C7F0D0C7F1D0C7F1D0C7FFD9C45A86EB5A86EBFFDAC4
      F1D1C8F1D1C7F1D1C8F1D0C8F1D1C8F1D0C8F1D1C7F1D1C7F1D0C7F1D0C8F1D1
      C8F1D0C7F0D0C8F1D1C8F0D1C8F1D0C8F0D0C8F1D0C8F1D1C7F1D1C8F1D1C8F1
      D0C8F1D0C8F0D0C8F1D1C7F1D0C8F0D0C8F1D0C8F1D1C7F1D1C8F1D1C7F0D1C8
      F1D1C8F1D1C8F1D1C8F0D1C8F1D0C8F1D0C7F1D1C8F1D0C8F1D1C8F1D0C8F1D1
      C8F0D1C8F0D1C7F1D0C8F1D0C8F1D0C8F1D1C8F1D1C8F0D1C8F1D0C8F1D1C8F1
      D0C7F0D0C8F1D0C8F1D1C8F1D1C7F1D1C8F1D1C7F1D1C8F1D0C8F1D1C8F1D1C8
      F1D1C8F1D0C7F1D1C8F1D0C7F1D0C8F1D0C8F1D1C8F1D1C8F1D0C8F1D1C7F1D1
      C8F0D0C8F0D1C8F1D0C8F1D0C8F0D0C8F1D1C8F1D1C8F1D0C8F1D0C7F1D0C8F1
      D0C7F1D1C8F1D1C8F0D0C8F1D0C8F1D1C8F1D0C8F0D1C7F1D1C8F1D1C8F1D1C8
      F0D1C8F1D0C7F0D1C8F1D1C7F1D1C8F0D1C8F1D0C8F1D0C8F1D0C8F0D1C8F1D1
      C8F1D1C8F1D1C8F1D0C8F0D0C7F1D0C8F1D1C8F1D0C8F1D1C7F1D0C8F0D0C8F1
      D1C8F1D1C8F1D1C7F1D0C8F1D1C8F0D0C8F1D0C8F1D1C8F1D0C8F0D0C7F0D0C8
      F1D1C7F1D1C8F0D1C8F1D1C7F1D0C8F1D0C7F1D0C8F1D1C8F1D0C8F1D1C8F1D1
      C8F1D1C8F1D1C8F1D0C7F0D1C8F1D0C8F0D1C8F1D0C8F1D1C8F1D0C7F0D0C8F1
      D0C8F1D1C8F0D1C8F0D1C8F1D1C8F1D0C8F1D0C8FFDAC45A86EB5B86EBFFDAC4
      F1D2C9F0D1C9F1D2C8F1D2C8F0D1C9F1D1C8F1D2C8F1D1C8F1D1C9F1D1C8F1D1
      C8F1D1C9F0D1C8F1D2C9F0D1C8F1D1C8F1D1C9F1D1C8F1D1C9F1D1C9F1D1C8F0
      D2C9F1D1C8F1D2C8F0D1C8F1D2C9F1D2C9F1D2C8F0D1C9F1D2C9F1D2C9F1D1C8
      F1D2C9F1D1C9F1D1C9F1D1C8F1D1C9F1D1C9F1D1C8F1D1C8F1D2C8F1D1C9F1D1
      C8F1D1C9F1D1C8F1D2C9F1D1C9F1D2C8F1D1C9F1D2C8F1D1C8F1D1C9F1D1C9F0
      D1C8F1D2C8F1D1C8F1D1C8F0D2C9F1D1C8F1D1C9F1D2C8F1D2C9F1D2C8F1D1C9
      F1D2C9F1D1C8F1D2C8F1D1C9F1D1C8F1D1C9F1D2C8F1D1C9F0D1C8F1D2C9F1D1
      C8F1D2C8F1D1C9F1D1C9F1D1C9F1D1C8F1D2C9F1D1C9F1D2C9F1D1C8F1D1C9F0
      D1C8F1D1C8F1D1C9F1D1C9F1D2C8F0D1C8F1D2C9F1D1C8F1D2C8F1D1C9F1D1C9
      F1D1C8F1D1C8F1D1C8F0D2C9F1D1C9F1D2C8F1D1C9F1D2C8F1D1C8F1D2C8F1D1
      C9F1D1C8F1D2C8F1D2C8F1D2C9F0D1C8F1D2C8F1D1C9F1D1C8F0D1C9F1D1C9F1
      D1C9F1D1C8F1D1C9F1D2C9F1D2C8F1D2C8F0D2C8F1D2C9F1D1C9F1D1C9F0D1C8
      F1D1C9F1D2C9F1D2C9F1D2C8F1D1C8F1D1C8F0D2C9F1D1C9F1D2C8F0D2C8F1D2
      C9F1D1C8F1D1C8F1D1C8F1D1C8F0D2C9F0D2C8F1D1C8F1D1C8F1D1C9F1D2C8F1
      D2C8F1D1C8F1D2C8F1D1C9F1D1C8F1D2C8F0D1C9FFDAC45B86EB5B86EBFFDDC9
      F2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4
      CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2
      D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CD
      F2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4
      CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2
      D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CD
      F2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4
      CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2
      D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CD
      F2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4
      CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2
      D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CD
      F2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4
      CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2
      D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDF2D4CDFFDDC95B86EB5A85E8FBCCA6
      ECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4
      ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADEC
      C4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4AD
      ECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4
      ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADEC
      C4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4AD
      ECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4
      ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADEC
      C4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4AD
      ECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4
      ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4AEEC
      C4ADECC4ADECC4ADECC4AEECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4AD
      ECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4
      ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4ADEC
      C4ADECC4ADECC4ADECC4ADECC4ADECC4ADECC4AEFBCCA65A85E85881E1EEA754
      E1A363E1A565E1A566E1A465E1A565E1A565E1A566E1A465E1A364E1A363E0A2
      63E1A363E0A363E1A364E1A465E1A464E1A464E1A565E1A565E1A465E1A464E1
      A464E1A565E1A465E1A364E1A363E1A363E0A363E1A364E1A363E0A363E0A363
      E0A363E0A363E1A364E1A464E1A464E1A465E1A465E1A465E1A465E1A565E1A4
      65E1A465E1A465E1A465E1A465E1A465E1A465E1A565E1A565E1A465E1A465E1
      A465E1A464E0A262E0A262E1A565E1A364E1A363E0A263E1A465E1A566E1A565
      E1A565E1A565E1A565E1A465E1A465E1A363E0A263E1A363E0A363E1A364E1A4
      65E1A464E0A364E1A565E1A565E1A565E1A364E1A364E1A565E1A465E1A464E0
      A263E1A363E1A363E1A363E1A364E0A262E0A263E0A263E0A262E1A363E1A464
      E1A464E1A465E1A465E1A465E1A465E1A466E1A566E1A565E1A565E1A565E1A5
      65E1A565E1A565E1A565E1A565E1A565E1A565E1A565E1A565E1A465DFA262E1
      A465E1A565E1A465E0A161E0A262E1A464E1A465E1A464E1A363E1A464E1A465
      E1A465E1A465E1A566E1A465E0A262E0A363E1A565E1A565E1A565E1A565E1A5
      65E1A465E0A263E1A364E1A465E1A363E1A464E1A566E1A465E1A565E1A465E0
      A262E0A363E1A465E0A262E1A364E1A464E0A262EEA7555881E15C8BF2FFFFFF
      FFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFEFD
      FFFFFFFFFEFDFFFFFEFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFEFFFDFCFFFCFBFFFEFDFFFDFCFFFDFDFFFFFEFF
      FFFEFFFEFDFFFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFDFAFFFAF8FDFFFFFFFFFFFFFDFBFFFCFAFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFFFFFFFFFEFCFFFFFDFFFFFF
      FFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
      FCFFFDFCFFFCFAFFFDFBFFFEFDFFFCFBFFFEFDFFFEFDFFFDFDFFFEFCFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F7FCFF
      FFFFFFFFFFFFFFFFF8F3F7FCF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFCF7FDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFDFBFFFFFEFFFFFFFFFEFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB
      F8FDFCFAFFFFFFFFFBF9FFFFFDFFFFFFFFFAF8FDFFFFFF5C8BF15B8AF0FFFFF7
      F9F3F6FFFBFFF9F3F6FEFBFEFFFCFFFEF9FDF9F4F5F7F2F4FBF7FAFDF7FBFEFC
      FFFFFBFFFAF4F7F5EEF0F5ECEEF8F1F4FCF8FBFFFBFFFFFCFFFFFBFFFFFBFFFF
      FCFFFFFBFFFFFBFFFFFEFFFCF6F9F3ECECF4ECECF6EEEFF6F2F3FFFBFEFFFEFF
      FFFFFFFBFAFBF5ECEEF8F4F6F9F5F8F8F3F5F6EFEFF6EEF0F5EEEFF9F2F5FBF5
      F8FEFBFDFFFCFFFFFCFFFFFCFFFFFCFFFFFCFFFFFBFFFFFBFFFFFCFFFFFCFFFF
      FCFFFFFCFFFFFAFFF6F0F0F7F2F4FBF7FBF9F3F6F7F0F1FEFBFFF9F4F7FEFBFE
      FFFCFFFFFBFFFFFBFFFEFAFEFEF9FEFCF8FBFEFBFFFFFDFFFCF6FAF6EFF0F5EC
      EEF8F0F2FBF6F9FFFDFFFFFCFFFFFBFFFFFCFFFFFCFFFFFBFFFFFCFFFFFCFFFD
      F9FDF5EEEEF3EBECF7EEF0F5F1F2FCFAFCFFFEFFFFFEFFFDFDFDF5EEEFF8F2F4
      F9F5F7F9F3F5F6EFF0F6EEF0F5EFEFF7F0F2FBF5F8FDF9FCFFFBFFFFFCFFFFFB
      FFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFAF4F5F7
      F0F2FFFEFFFEFAFDF4EBECFAF5F7F9F3F6FCF6F9FFFCFFFFFCFFFFFCFFFFFCFF
      FFFCFFFFFCFFFEFAFDFAF2F5FAF5F8FEFAFEFFFBFFF5EAD5EADFCBADA697948E
      818A84788A84788A84788A84788A84788A84788A84788A8478948E81ADA697EA
      DFCBF5EAD5FFFDFFFCF9FBF6EFF1FBF6F9FCF7FBFFFFF65B89EF5C8BF1FFFFFA
      F6EDEEFFFBFFF6EEEEFAF4F6FFFCFFF9F2F4F8F2F3FEF8FCFFFDFFFEFAFCFCF8
      FAF9F2F5F6EEEEF5EEEFF5ECECF6EEF0FDF8FCFFFBFFFDF9FCFFFCFFFFFBFFFF
      FBFFFFFBFFFFFBFFFFFCFFF9F2F5F6EFF0F9F4F5F8F0F3FCF9FBFFFCFFFFFBFF
      FFFCFFFDFAFDFAF4F5FCF8FAFDFAFDFDF8FCF8F0F1F5EBECF6EFF0FBF5F7F7F0
      F1F8F2F5FCF6F9FEFAFEFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFF
      FBFFFFFBFFFFFBFFFAF4F6F8F2F4FFFDFFFDFAFDF4EAEBFEF9FDF7F2F3F8F1F3
      FFFDFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFCF7FBFAF3F7F7EDEEF5EEF0F5EC
      EEF5ECEDFCF7FBFFFCFFFDF9FDFFFCFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFB
      F6F9F6EEEFF9F4F5F8F0F2FCF7FAFFFCFFFFFBFFFFFBFFFEFBFEFAF5F7FCF7F9
      FDF9FCFDF8FBF9F1F4F5EBECF6EEEEFAF4F7F8F2F3F8F1F3FBF5F8FEFAFEFFFB
      FFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFCF5F7F6
      EEEFFFFDFFFEFAFDF4ECEBFDF7FAFBF5F8F6EEF0FEFAFEFFFBFFFFFBFFFFFBFF
      FFFBFFFFFCFFFAF4F7F6F0F1FEFAFDFFFCFFFFFBFFE3D9C6928B7FC7C4BEF4F3
      F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F3F2C7C4BE92
      8B7FE3D9C6FFFCFFFFFEFFF7F0F0F6EEEFFAF2F4FFFFFC5B89F05C8BF1FFFFF9
      F6EEEFFFFAFDFBF7F9F5ECEEFFF9FDFBF5F7FFFAFEFFFDFFFDF8FCF7EFF0FAF5
      F7F5ECEDF4EBEBFCF6F9FCF7FAFCF8FAFEFBFEFDF9FCF7F0F2FCF8FBFFFCFFFF
      FBFFFFFBFFFFFBFFFDF8FBF7F1F1FEFBFCFFFDFFFEF9FDFFFCFFFFFBFFFFFBFF
      FFFBFFFFFCFFFFFEFFFFFCFFFFFCFFFFFEFFFEFBFEFCF6F8F9F2F4FEFCFFFEF9
      FCFAF3F5F5EDEEF9F3F6FFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFF
      FBFFFFFBFFFFFBFFFBF6F9FAF4F6FFFBFFFDF9FCF4EAEBFEF9FDFDF9FBF4ECEC
      FDF9FCFFFCFFFFFBFFFFFBFFFFFBFFFEFBFEF8F2F4F7EEEFF2EAE8FBF4F7FDF7
      FBFCF8FAFDFBFEFEFAFDF8F1F4FBF6F9FFFCFFFFFBFFFFFBFFFFFBFFFFFBFEF7
      F0F2FCF7F9FFFDFFFEF9FDFEFBFFFFFBFFFFFBFFFFFBFFFFFBFFFFFEFFFFFCFF
      FFFCFFFFFCFFFFFBFEFCF7F9F8F0F2FFFAFEFEFAFDFAF4F8F6EEEFF8F2F2FFFB
      FFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFEF9FBF8
      F1F4FFFBFFFEFAFDF4ECECFCF7F9FFFBFEF5EDEEFBF6F9FFFCFFFFFBFFFFFBFF
      FFFBFFFFFCFFF8F2F4FBF7F9FFFDFFFFFBFFFEFBFDACA496CDCAC5FAF9F8F5F3
      F0F3F0EEF3F0EDF3F0EDF3F0EDF3F0EDF3F0EDF3F0EDF3F0EEF5F3F0FAF9F8CD
      CAC5ACA496FFFCFFFFFDFFFBF5F7F3E9E9F6EEF0FFFFFF5C8BF15C8BF1FFFFF8
      F6EEEFFFFAF9FDF9FDF5ECEDFCF6F7FFFBFEFFFCFEFDFAF9F7EFF1FBF2F3F8F2
      F4F5ECEBFBF6F7FFFDFFFFFCFDFFFDFFFFFCFBFEFAFEF8F1F1F8EFEFFDFAFCFF
      FBFBFFFBFFFFFCFCFBF5F5F7EFF0FFFCFDFFFCFFFFFCFCFFFBFEFFFBFCFFFCFC
      FFFBFDFEFAFBFEF9FDFEF8FBFDFAFDFFFBFBFFFDFDFEFCFEF8F1EFFAF4F6FFFC
      FBFFFCFFF8F1F3F5EBEAFDF9FBFFFBFAFFFCFEFFFBFBFFFBFDFFFBFEFFFBFBFF
      FBFFFFFBFAFFFBFEFCF9FBF7F0F0FEFAFDFDFAF8F4EBECFDF9F9FEFCFEF7EFF0
      F9F1F0FFFEFFFFFBFBFFFBFFFFFBFDFFFBFCFBF6F8F6EDECF9F3F3FFFEFFFFFC
      FDFFFDFFFFFBFCFEFBFCFAF3F5F6EDEDFDF9FCFFFCFCFFFBFEFFFCFCFCF9F9F6
      EEEEFEF9FAFFFCFFFFFCFCFFFBFEFFFBFDFFFCFCFFFBFEFFFBFAFEFAFDFFF9FA
      FDFAFDFEFAFDFFFCFCFFFDFFF9F3F1F8F1F3FFFDFEFFFCFFFAF5F8F4EAE7FBF6
      F9FFFCFBFFFBFEFFFBFEFFFBFBFFFBFFFFFBFAFFFBFEFFFBFBFFFBFDFFFBFDF7
      F2F0FCF7FAFEFBFAF4EBECFCF7F8FFFDFFF8F2F3F8EEEDFFFDFFFFFBFBFFFBFD
      FFFBFDFFFBFCFDF7FAFFFBFBFFFCFEFCF7F8F8F3F3908A7DF2EEECE7E0DADFD6
      CEDCD3CADCD2C9DCD2C9000000000000DCD2C9DCD2C9DCD3CADFD6CEE7E0DAF3
      F0ED8F897CFFFBFEFFFBFEFFFBFFF5ECEDF5EDEEFFFFFE5C8BF15C8BF0FFFFF3
      F5EBE9FDF5F3FFF9FAF9F1EFF9F2F1FFF9FBFEF8F7F9F1EFF8EFECFDF4F3F4EA
      E7F8EEECFFFAFBFEF9F9FEF9F7FEF8FAFEF9F7FEF9F9FFF8F9F8EEECF9F1EFFE
      F9F8FFF9FAFDF7F5F7EEEBFAF1EFFEF9F8FEF9FAFFF9F7FFFAF9FEFAF8FDF5F5
      FEF4F4FDF5F4F9F0EFF9F0EEF9F2F1FBF4F2FDF5F2FEF9FAFCF5F3F7EDEDFEF6
      F3FEF9F9FEF9F8F8EEECF6EDECFEF6F4FDF5F7FEF9F8FEF9F8FEF9F9FEF9F7FE
      F9FAFEF9F6FEF9F9FCF6F5F8EEECFEF8F8FCF4F1F4E8E7FCF4F2FFFAFAFBF3F3
      F6EDEBFEFAFBFFF9F7FEF9FAFEF9F8FBF3F3F9F1EFF7ECEAFFF9FAFFF9FBFEF9
      F7FEF8FAFEF9F7FEFAF8FFF9FAF9EFEDF8EFEDFEF9F7FEFAFAFFFAF8F8EFEBF8
      EFEDFFF7F8FEF9FAFEF9F6FEF9F9FEF9F9FDF7F5FDF4F5FEF6F4FAF2F1FAF0EE
      F9F1EFFBF5F3FDF4F1FEF9F8FFF9F7F6EBEBFDF6F4FEF9F9FFF9FAFAEFEDF5EC
      EAFDF5F2FDF4F5FEF9FAFFF9F7FEF9FAFEF9F6FEF9F9FEF9F6FEF9F9FEF8F7F7
      EFECFCF6F6FDF7F5F4EAE7FAF2F0FEFAF9FCF5F4F7EDEAFEFAFCFFF9F7FEF9F8
      FEF9FAFBF4F2FDF4F3FEF6F4FCF3F4F7EFEAF9F0EE8A8478EFEAE5D7CBBFD3C6
      B9D2C4B8D2C4B7000000000000000000000000D2C4B7D2C4B8D3C6B9D7CBBFEF
      EAE58A8478FEF9F9FEF9F9FEF8FAF7EDEEF6ECEAFFFFF65C8BF15B89EFFFFBED
      F0EBE7F6F3F1F9F7F6F7F3F3F2ECE9F9F7F7F8F5F5F3EEEDF9F5F5F2EAE8EFE5
      E4F5F0EEFBF9F9F9F6F6F9F7F7F9F7F6F9F7F7F9F7F6FAF8F8F9F6F5F2EDEAF4
      F0EFFAF8F8F8F4F3F1ECE9F8F4F3F9F7F7F9F7F6FAF8F8F9F5F5F4EFEEF2EEEB
      F4EEECF8F3F2F6F3F2F7F3F2F7F4F3F9F5F4F2E9E8F8F1F1FBF7F7F3EEEBF7F5
      F3F9F7F6F9F7F8F8F6F4EFE7E5F8F4F3F2ECE9F7F4F3F9F7F6F9F7F6F9F7F7F9
      F7F6F9F7F7F9F7F6F7F4F4F4F1EFF9F5F3F2E9E9F2EDEAF4F0EEFAF7F7F9F6F6
      F2ECEAF7F4F3FAF8F8F9F7F6F7F4F3F0EBE8F1E9E6F3ECEBFBFAFAF9F6F6F9F7
      F7F9F7F6F9F7F7F9F7F7FAF7F8FAF7F7F4EEECF3EEEDF9F6F7FAF7F6F1ECE9F6
      F2F0F9F8F7F9F7F6F9F7F7F9F6F6F5F0EFF3EEECF2EDEBF8F2F1F7F4F2F7F3F3
      F7F3F2F8F5F4F3ECEBF6EFEFFAF7F8F4F0EFF5F0F0F9F7F7F9F7F7F9F7F6F2EB
      E9F6F0EFF2EDEAF4F1F1FAF8F7F9F7F6F9F7F7F9F7F6F9F7F6F9F7F7F8F6F6F3
      EEEDF9F6F4F4EDECF1ECE9F3EEECF9F8F6F9F7F7F2EDEBF6F2F1FAF8F9F9F7F7
      F9F5F4F1ECE9F2EDEBF1EAE9F3EEECF7F4F3F9F6F68A8478EBE3DCD4C5B7D4C5
      B7D4C5B7000000000000000000000000000000000000D4C5B7D4C5B7D4C5B7EB
      E3DC8A8478F9F7F6F9F7F6F7F6F4F2EEECF5F1F0FFFBEB5B8AEF5A88EEFFF6EC
      F1EBEDF5F2F6F6F4F7F5F3F6EFEBEBF6F3F5F4F0F3F1ECECF5F2F5F2EAEBEBE3
      E4F1EDEFF7F6FAF6F4F8F6F4F7F6F4F7F6F4F7F7F5F8F6F4F8F7F5F8F3F0F2EF
      EBEBF7F5F9F2EEEFEFECECF6F3F7F6F4F7F6F4F8F6F4F7EFEAEBEFEAEAF4F2F4
      F4F2F5F6F3F6F7F5F9F7F5F9F7F5F9F7F4F8F5EEF0F0EBEBF7F3F6F2EEF0F4F2
      F5F6F4F7F6F4F7F7F6F9F1ECF0F0ECECF1EDEEF1EDEEF6F4F7F6F4F7F6F4F7F6
      F4F8F6F4F7F6F4F7F4F0F2F2EFEFF5F0F0ECE4E6F5EFF0F3EFF2F7F4F7F6F3F7
      F1EDEEF1EFF0F6F5F8F8F6F8F1EDEFEFE8E9EDE5E5EFE9EBF7F7FBF6F4F7F6F4
      F7F6F4F8F6F4F8F7F5F7F6F4F7F7F5F8F5F2F6F0EBEBF6F3F7F3F0F2EEEAEAF4
      F2F6F6F4F8F6F4F8F7F5F9F1EDEEEEE8E9F2F0F2F4F2F5F6F3F7F7F5F8F7F5F9
      F7F5F9F7F5F8F5F0F2F0E9EAF6F3F6F4F0F1F2EFF2F6F4F7F6F4F7F7F5F7F3F0
      F2EFEAEBF3F0F1EEE9E9F7F5F9F6F4F8F6F4F7F6F4F7F6F4F8F6F4F7F5F2F4F1
      ECECF5F1F4EFE6E7F4EDEFF0EDF0F7F5F8F6F4F9F2EEEFEFEDEDF7F4FAF7F6F9
      F3EFF1EFE8E9EFE9EAEDE8EAF6F3F6F8F6FAF1EEEE8A8478EBE2D9D7C7B7D7C7
      B7000000000000D7C7B7000000000000D7C7B7000000000000D7C7B7D7C7B7EB
      E2D98A8478F6F4F7F6F4F8F6F5F7F0EAEAF7F3F5FFF7EB5A88EF5A88EFFFF3E8
      F3EEECF7F3F7F7F3F6F7F3F2F0EAEDF6EEF0F3EBEDF2EDEEF0EAE8F7F1F4EEE7
      E6F2EAEBF9F5FAF8F3F3F7F3F9F7F3F4F7F2F6F7F1F2F7F3F3F7F3F8F5F1F1F0
      EBECF8F3F5F5F1F1F6F1F5F7F3F4F7F3F9F7F4F3F1ECEEEEE7E6F6F2F3F8F4FA
      F7F4F4F8F4F9F7F3F2F7F3F6F8F3F6F7F4F4F9F4F9EAE5E2F4EFF0F2E9EAF5F1
      F3F7F3F8F7F3F1F7F3F9F7F3F2EFE8E9F7F1F3F0E8E6F6F2F6F7F3F0F7F3F8F7
      F3F3F7F3F5F7F3F7F3E8E8F1EBEFF6ECEBECE4E5F3ECEBF7F3F6F7F3F8F7F3F1
      F2EDEFF1E8E7F8F3F6F6F1F4F1E9E8F3EDEFEFE9E9F0E8E7FAF6FBF8F3F4F7F3
      F7F7F3F3F7F3F4F7F1F4F7F2F2F7F3F8F7F3F4F0EBEBF6F1F3F6F1F2F5F1F6F7
      F3F4F7F3F8F7F4F5F5F0F0EDE5E6F4F0F0F8F4FAF7F4F3F7F4F9F7F3F5F7F3F5
      F8F3F8F7F3F2F9F4F9EBE7E3F6F0F1F1EAEDF4EDEEF7F3F9F7F3F0F7F3F8F7F3
      F4F0EAE8F7F3F8F2E8E4F2EFF3F7F4F3F7F3F8F7F3F6F7F3F3F7F3F9F5EBEAEF
      E8EAF7EEF0EEE3E4F1EBE9F7F2F3F7F3F8F8F4F3F3EEF2EFE6E6F8F2F5F8F4F7
      F3EAE9F2ECEFF6EEEFF6F0F4F9F5F7F4EFEEEEE8E88A8478ECE2D9DAC9B9DAC9
      B9000000DAC9B9DAC9B9000000000000DAC9B9DAC9B9000000DAC9B9DAC9B9EC
      E2D98A8478F7F3F0F8F5F3F3E9E8EFE5E4F9F5F2FFF8E95A88EE5A88EEFEF1E3
      F6EEEDF7F1F1F7F1F2F7F0F0EFE4E2F4EAEBF5ECEEF5EDECECE1DEF7F0EFF5EA
      E9EEE4E1F1E8E7F0EBE9F8F2F2F7F1F1F6F0F0F1E8E7F8F1F1F7F0F1F6F0F0F5
      ECECF7F0F1F7F1F2F7F1F3F7F1F1F7F1F3F5EDEBEDE2DFF3E9E8F8F2F2F6F0F2
      F7F1F1F4EEEFF0E7E6F0E8E5F1E8E5F6EFEBF8F0F1EBE1DDEDE3E1EFE3E0F7EF
      EEF7F1F1F7F1F0F7F1F1F8F2F1EFE6E3F9F1F2F2E7E3F5EFEEF7F1F0F7F1F1F7
      F0F1F7F1F1F7F0F2F1E7E4F1E6E6EEE3E0EBE1DEF5EDEDF7F1F1F7F1F1F8F1F0
      F3E8E7EFE5E4F5F0F1F7EEEFEFE4E0F3EBEAF6EDECEEE4E1F1E7E6F0EAE7F7F0
      F0F7F1F1F7F0F1F2E9E8F6EDEDF7F0F1F7F1F1F4EBECF6EEEFF7F1F2F7F1F4F7
      F0F1F7F1F4F7EFEDEDE3E0F1E7E5F8F1F1F6F0F2F6F0F0F6F0F0F0E8E8F0E8E4
      F1E7E6F5EDE8F8F1F3ECE4E0F0E6E4ECE2DFF6EDEAF7F1F2F7F1F0F7F1F1F8F1
      F2F0E8E5F7F1F2F5EAE8F1E9E8F8F2F2F7F1F1F7F1F2F7F1F1F7F1F3F4EAE8ED
      E2E1F2E8E5EADFDCF3EAEAF8F1F1F7F1F1F8F2F1F4EAE9ECE2E0F8F1F1F6EFF0
      EEE4E0F2ECEBF9F1F2F8F1F3F6EDEDEDE4DFF3EBEC8A8478EDE4DBDDCCBCDDCC
      BCDDCCBCDDCCBCDDCCBC000000000000DDCCBCDDCCBCDDCCBCDDCCBCDDCCBCED
      E4DB8A8478F7F1F0F9F2F3EFE5E1EFE4E1F7F1F1FFFDF15B89EF5A88EFFFF7EC
      F1ECEFF1EBEEF1EBEEEFEAEDE8E0DFEEE7EAF1ECEFEFE9E9E8DFDDF0EAEDF2EC
      EEEBE4E4E6DEDBECE6E9F1ECEFF0ECEFECE6E7EBE3E1F1EBEDF1EBEEF1EDF0EF
      E9EBECE6E8F2ECF1F1EBEEF1ECEFF0EBEFEBE3E3E9E0E0F1EBEDF0ECEFEFEAEC
      EDE8EBEAE2E1EBE5E7E9E2E2E6DEDCE8E0DEE9E2E2E8E1E1EAE1E0EFE8E9F1EC
      EFF1EBEEF1EBEFF1EBEEF2EDF1E9E1E1F1EDF0EEE7E8F0EAEDF1EBEFF1EBEEF1
      ECEFF1EDF0EFE8ECEBE3E2EBE3E1E9E0E0ECE6E9F2EEF0F1EBEEF1EBEEF0EBEF
      EAE3E4EBE4E4F1EBEEF0EAEDEAE0DEEDE7E8F2EEF0EEE7E7E6DDDAEBE4E6F1EC
      EFF1ECF0EDE8EAE8E1E0F0E9EBF1ECEEF1EBEEF0EBEDECE6E7F1EBEEF1EBEEF1
      ECEFF1ECF0ECE6E7E7DEDDF0EAECF0ECF0EEEAECEEEAEDEAE2E3EBE3E5EBE3E4
      E6DFDDE8E0DFE9E2E2E8E1E0E9E1E0EFE7E7F1ECEFF1EBEEF1EBEFF1EBEEF2EC
      EFEAE3E3F0ECEFF1EAECEDE8E8F0ECEFF1EBEEF1EBEEF1ECEFF0E9EDEDE5E5E8
      E0DDECE3E3EAE4E6F2ECEEF0EBEEF1EBEEF1ECF0EBE4E7E8E1E1F2ECF1EEEAEB
      E9E2E1F1EBEFF0ECF0EEE7E7E7DFDDECE4E6F2EDF08A8478EFE6DDE0D0C0E0D0
      C0E0D0C0E0D0C0E0D0C0000000000000E0D0C0E0D0C0E0D0C0E0D0C0E0D0C0EF
      E6DD8A8478F1ECF0F1EAEDE7E0DEF0EAEDF0EBEEFFFDF45B89F05A89EFFFF8EA
      EEE8E8EEE8E8EEE8E8EDE7E7E5DDDAECE3E3EEE8E7E9E1E1ECE3E2EEE8E8EDE7
      E8EAE2E1EDE5E3EEE7E8EEE8E8EDE4E3E5DCD9E9DFDDECE3E2EEE9E9EEE9E9EC
      E5E4EBE3E1EEE9EAEEE8E8EFE9EAE7DFE0E9E1DCEEE7E6EEEAEAEDE5E4E7DDD9
      E9E2E1EEE7E6ECE4E3E7DCD9E8E0DFE8DFDDEBE4E3EDE6E6EEE7E7EFE8E8EEE8
      E8EEE8E8EEE8E8EEE8E8F0EAEAE4DAD9EDE3E2EEE7E7EDE5E7EEE8E8EEE8E8EF
      E9E9EAE0DCE3DAD8E5DCD9E9E0E0ECE6E5EEE8E7EEE7E8EEE8E8EEE8E8EEE7E8
      E7E0DFE8DFDDEEE8E7EAE2E2EBE2E3EFE7E6EDE7E9EAE2E2EDE5E2EEE7E8EEE9
      E9EEE6E5E5DDDAE8DEDCECE2E1EEE9E9EEE8E8EEE7E6EBE2E1EEE8E8EEE8E8EE
      E9E9E9E1E2E8DFDCEDE6E5EEE8E9EDE7E7E9DDD9E8E0E0EDE6E6EDE5E5E9DCD8
      E8E0E0E9DFDCEAE3E2EDE6E6EDE6E6EFE8E8EEE8E8EEE8E8EEE8E8EEE8E8EFE9
      E9E6DDDCEBE1DFEEE8E8ECE4E7EEE7E8EEE8E8EEE7E8EBE3E0E3D9D7E4DCD9E9
      E0DFECE4E5EEE8E8EEE8E8EEE8E8EEE8E8EEE8E9E9E1E2E7DEDAF0E8E9EAE0E0
      EAE2DFEFEAEAEBE2E0E7DCD9EBE3E3EEE8E8EEE8E88A8478F1E9E0E3D4C5E3D4
      C5E3D4C5E3D4C5E3D4C5000000000000E3D4C5E3D4C5E3D4C5E3D4C5E3D4C5F1
      E9E08A8478EFE9EAE8E0DEE2D7D4EFE9E9EEE8E8FFF7EB5A89EF5988EEF9F3E1
      E8E3DFE8E3DFE8E3DFE8E2DFE1D9D3E5DDD9E9E4DFE3DBD5E5DED9E8E4E0E7E2
      DCE4DDD7EAE6E1E8E4DFE9E4E0E3DDD6DED7CDE0D8CFE4DED8E9E5E1E8E4E0E6
      E0DBE4DED7E9E5E1E8E3DFE8E4E2E1DAD6E4DCD8EAE6E1E7E2DCE1D8D0E6E0DB
      E8E5E0E9E1DEE0D7D0E6E0DAE3DAD6E3DBD5E9E5DFE9E4DFE9E4DFE8E3DFE8E3
      DFE8E3DFE8E3DFE8E3DFEAE5E2DDD4CCE5DFDAE7E1DEE0D9D1E9E4DFE8E3DFE6
      E1DDE0D9D2E5DEDCE6DFDCE8E3DFE9E4DFE8E4DFE8E3DFE8E3DFE8E3DFE8E2DF
      E3DCD7E2DAD3E9E3E0E3DBD7E2DCD7EAE4E2E6E2DCE3DCD6EAE6E2E8E4E0E9E4
      E1E4DED7DFD6CDDFD8D1E3DCD6E8E4E0E8E3DFE7E2DDE4DDD7E9E3DFE8E3DFE9
      E4E1E2DCD8E3DBD5E9E3DFE9E4DEE1D9D1E5DED8E7E3DEE9E4DFE1D8D3E4DFD8
      E6DCD9E1DAD2E8E4DFE9E4DFE9E4DFE8E4DFE8E3DFE8E3DFE8E3DFE8E3DFE9E4
      E1DFD7D0E3DCD8E8E3DFE1DAD5E6E2DCE8E3DFE8E2DEE2D9D4E3DCD9E6DFDCE8
      E3DEE8E4DEE9E4DFE8E3DFE8E3DFE8E3DFE8E3E0E5DDDAE0D8D1E8E2DEE5DCD9
      E7E1DEE9E4E1E1DBD3E3DAD4E9E5DFE9E4DFE8E3DF8A8478F2EBE4E6D9CCE6D9
      CCE6D9CCE6D9CCE6D9CC000000000000E6D9CCE6D9CCE6D9CCE6D9CCE6D9CCF2
      EBE48A8478E7E3DDDFD5CFDDD6CDE9E3DFE8E3DFF9F2E15988EE5988EDF9EAD7
      E8DCD7E8DCD7E8DCD7E7DCD8DFD2CBE4D8D2E6D9D4E0D2CDDFD4CFE8DCD7DFD3
      CBE1D3CEE9DED9E8DCD7E7DCD8DFD3CCE0D4CDE4D8D2DCD0CAE7DCD7EADDD8E6
      DAD3E2D5CEE8DCD8E9DDD8E3D8D2DDCFC8E6DAD6E8DDD9E3D7D0E4D8D1E8DCD8
      E9DDD8E5D9D3E4D7D1E9DDD9DDD0CAE1D5CFE8DCD7E8DCD7E8DCD7E8DCD7E8DC
      D7E8DCD7E8DCD7E8DCD7EADED9DDD1C9E8DDD8E4DAD5DDD0CAE6D9D5E7DCD7E2
      D5CFE6D9D4E8DDD7E8DCD7E8DCD7E8DCD7E8DCD7E8DCD7E8DCD7E8DCD7E8DCD8
      E2D6D1E1D4CDE7DAD6E1D4CFDDD0CBE7DCD8E0D4CCDED1CBEADFDAE8DCD7E8DD
      D9E1D4CEDED2CAE5DAD4DED1CAE5DAD5E9DCD7E7DBD5E2D5CEE7DAD6E8DCD7E6
      DAD6DDD0C9E5D8D3E8DCD8E5D9D3E2D6CFE7DCD7E8DCD7E7DBD6E3D6CFE9DEDA
      DFD3CDDED2CCE9DDD8E8DCD7E8DCD7E8DCD7E8DCD7E8DCD7E8DCD7E8DCD7E9DD
      D8DFD3CCE6DCD7E6DBD6DED2CDE4D6D2E8DCD7E4D8D2E3D6D1E8DDD8E8DCD7E8
      DCD7E8DCD7E8DCD7E8DCD7E8DCD7E8DCD7E9DDD8E4D8D3DFD1CAE6D9D5DFD1CC
      E7D9D5E8DCD7E7DCD6E7DBD7E8DCD7E8DCD7E8DCD7908A7DEEE8E1EAE0D5E9DE
      D3E9DED3E9DED3E9DED3000000000000E9DED3E9DED3E9DED3E9DED3EADFD5EF
      E9E38F897CE0D2CBDFD3CCE1D4CDE9DDD7E8DCD7F9EAD75988ED5987ECEFE0CF
      DFD3CFDFD3CFDFD3CFDBD1CAD5CAC3E0D4CDDED2CBD8CBC4D9CDC6E0D3CFDACB
      C3D7CCC5E0D5D1E0D3CFDBCEC7D7C9C1E1D4CFDCD3CED8CBC5E0D2CCDFD4D0DF
      D4CFDFD2CBDED2CCE0D5D2DBCFC9D4C8C1DED4CEDDD0CAD8CAC4DFD3CDDFD5CF
      DDD2CDD8C9C3DFD2CDDFD2CCD5CAC0DFD1CBDFD3CFDFD3CFDFD3CFDFD3CFDFD3
      CFDFD3CFDFD3CFDFD4CFE0D5D1D7CBC6E0D5CFDACDC8D6CBC7DED1C9DBCEC8D9
      CDC8E0D4CFDFD3CFDFD3CFDFD3CFDFD3CFDFD3CFDFD3CFDFD3CFDFD3CFDDD2CD
      D5CBC3DDD1CCE0D4CCDACDC5D6C9C2E1D4CFDACCC4D6CAC2E1D5D2E0D3CFDCD0
      C9D7C9C1E0D2CCDED5CFD9CCC6DED1CADFD4D0DFD4CFDFD2CCDFD3CBDFD3CFDD
      D1CDD4C8C0DBD1CCE0D3CDD6C8C2DED1CCDFD4CFE0D5D0D7CAC3DED0CAE0D3CF
      D4C8C0DFD1C9DFD3CFDFD3CFDFD3CFDFD3CFDFD3CFDFD3CFDFD3CFDFD3CFE0D4
      D0D8CDC8E0D4CFDCCFC8D6CBC6DDD1C8DED1C9D6CAC4E1D5D1DFD3CFDFD3CFDF
      D3CFDFD3CFDFD3CFDFD3CFDFD3CFDFD4D0DED3CED6CDC4DBCFCBDFD2CCD6C9C1
      DED1CBDFD3CFDFD4CFDFD5CFDFD3CFDFD3CFDFD3CFADA697C6C2BAF2EDE6EDE5
      DDECE4DBECE4DBECE4DBECE4DBECE4DBECE4DBECE4DBECE4DBEDE5DDF2EDE6C8
      C3BBACA496D6CAC2DED3CDD7CCC7E0D4D0DFD3CFEFE0CF5987EC5886EBE6DCC5
      D7CFC6D7CFC6D7CFC6D3CAC1D1C5BDD8CEC5D7CEC5D4C9C1D2C7BED7CFC5D2C5
      BDD2C8C1D8D1C8D6CEC4D0C4BCD6CEC4D7CFC6D7D0C6D3C8BFD2C7BFD6CFC6D7
      CFC5D7CEC5D6CFC5D6D0C7D5CBC3D4CAC2D6CEC4D3C7BED4C8C0D7CFC6D6CFC6
      D2C5BED1C5BCD8D0C6D4C8C1D0C5BDD7CFC5D7CFC6D7CFC6D7CFC6D7CFC6D7CF
      C6D7CFC6D7CFC6D7D0C7D4CAC1CFC2BBD9CFC6D4CBC0D3C7BED7CEC5D3C9BFD4
      CAC2DAD0C7D7CFC6D7CFC6D7CFC6D7CFC6D7CFC6D7CFC6D7CFC6D7CFC6D5CDC4
      CFC3BBD7CDC4D8D0C7D4CCC3D0C4BCD7CFC5D3C6BFD1C6BED9D1C8D7CEC5D1C5
      BDD5CCC2D7CFC6D7CFC6D3C9C0D2C6BDD6CEC6D7CFC6D7CFC5D6CFC6D6CEC6D7
      CDC5D3C9C1D7CDC5D4C9C0D3C6BED7CEC5D7D0C8D3C9C1D0C3BBD7CEC4D5CAC2
      CFC2BBD7CFC6D7CFC6D7CFC6D7CFC6D7CFC6D7CFC6D7CFC6D7CFC6D7CFC6D6CB
      C3CFC2BBDACFC7D5CBC0D2C8BFD6CCC4D3CBBFD3C8C0DAD1C8D8CFC6D7CFC6D7
      CFC6D7CFC6D7CFC6D7CFC6D7CFC6D7D0C7D5CDC5CFC3BBD6CBC3D9CFC5D3C8BF
      D7CEC5D7CFC6D7CFC6D7CFC6D7CFC6D7CFC6D7CFC6E5DAC7928B7FC2BDB6EBE7
      E3F7F3F0F7F3F0F7F3F0F7F3F0F7F3F0F7F3F0F7F3F0F7F3F0EBE7E3C2BDB692
      8B7FE3D9C6D4CBC2D5CEC4D0C2BBD8CFC6D7CFC6E6DCC55886EB5886EBE5D7C5
      D6CBC6D6CBC6D6CBC6D4C8C2D5CAC4D6CBC6D6CBC5D1C5BDD2C5BED6CBC6D1C4
      BBD1C3BDD7CDC8D6CBC6D5CAC5D6CBC6D6CBC6D6CBC7D4C9C3CEC1B7CFC2BAD3
      C8C0D1C3BBCEBEB5D0C3BBD3C8C1D2C5BFCEC2BBD5CAC4D6CBC6D7CCC7D1C4BE
      CFC0B8D5CAC5D6CBC7D4C8C1CEBFB6D3C8C2D6CBC6D6CBC6D6CBC6D6CBC6D6CB
      C6D6CBC6D6CBC6D7CDC8CFBFB7D5C9C5D0C5C1D3C6BFD0C4BCD6CBC6D2C6BED5
      C9C4D6CBC6D6CBC6D6CBC6D6CBC6D6CBC6D6CBC6D6CBC6D6CBC6D6CBC6D4C9C2
      D4C9C4D6CBC6D6CBC6D2C6BED1C4BCD6CBC6D2C5BDD0C1BAD7CDC9D5CAC5D5CA
      C5D6CBC6D6CBC6D6CCC7D5CBC5D0C2B9CEC0B9D2C8C0D2C5BDCEBEB5CFC2BAD2
      C7C0D3C6C0CEC1BAD4C8C2D6CBC6D7CCC7D3C7C2CDBEB5D5C9C4D6CCC7D6CAC4
      CEBEB6D2C8C0D6CBC6D6CBC6D6CBC6D6CBC6D6CBC6D6CBC6D6CBC6D6CBC6D2C4
      BED3C6C1D2C9C5CFC0B7D3C8C2D4C9C3D2C6BED4C9C3D6CBC6D6CBC6D6CBC6D6
      CBC6D6CBC6D6CBC6D6CBC6D6CBC6D6CBC6CFC3BCD0C1B9D7CDC7D4C8C2D3C6BF
      D6CBC6D6CBC6D6CBC6D6CBC6D6CBC6D6CCC7D4C9C3F5EAD5EADFCBAFA798958F
      828A84788A84788A84788A84788A84788A84788A84788A8478958F82AFA798EA
      DFCBF5EAD5D7CBC7D5C9C3CEBEB6D7CBC6D6CBC6E5D7C55886EB5886EBE5D7C5
      D6CBC6D6CBC6D6CBC6D6CBC6D6CBC6D6CBC6D6CAC5D2C6BFD5CAC4D6CBC6D1C4
      BBD1C3BDD7CDC8D6CBC6D6CBC6D6CBC6D6CBC6D6CCC7D6CBC6D5C8C3D0C2BBCE
      BDB5CEBFB7D2C4BFCFBFB9CEBDB5CEBFB8D4C9C3D7CCC6D6CBC7D5C9C4CFC2BC
      D2C5BED6CBC6D6CBC6D6CBC7D3C5BECFC0B8D4C9C3D6CBC6D6CBC6D6CBC6D6CB
      C6D6CBC6D6CBC7D4C9C3CFC2BAD6CBC6D1C5BDD4C7C0CEBEB7D6CBC6D0C4BCD2
      C6C1D6CBC6D6CBC6D6CBC6D6CBC6D6CBC6D6CBC6D6CBC6D6CBC6D6CBC6D6CBC6
      D6CBC6D6CBC6D6CBC6D3C6BFD4C8C1D7CCC7D1C4BCD0C1BAD7CDC9D6CBC6D6CB
      C6D6CBC6D6CBC6D6CCC7D6CCC7D5CAC4D0C3BCCEBEB6CDBDB6D3C5BFD0C1B9CE
      BDB4CDBEB6D3C7C0D6CBC6D6CBC6D6CAC6D1C4BDD1C4BCD6CBC5D6CBC6D6CBC6
      D5C8C3CEBEB7D4C9C1D6CBC6D6CBC6D6CBC6D6CBC6D6CBC6D6CBC6D5CAC5D0C3
      BAD4C9C3D2C6BED2C5BED1C2BBD4C7C2D1C6BED1C4BED7CDC8D6CBC6D6CBC6D6
      CBC6D6CBC6D6CBC6D6CBC6D6CBC6D5C9C4CFC1BAD0C1B9D7CDC8D4C8C2D3C6BF
      D6CBC6D6CBC6D6CBC6D6CBC6D7CCC8D2C8C2CDBFB7D3C5BFD4C6C0D4C7C0D4C7
      BFCFBEB6CEBDB4CFC1BACFC3BCCFC3BDCDBEB6D4C8C2D6CBC6D6CBC6D6CBC6D6
      CBC6D6CBC6D6CBC7D3C8C2D2C6BDD6CBC7D6CBC6E5D7C55886EB5785EADCD2C0
      D3CDC9D3CECAD3CECAD1CBC6D0C9C5D0CBC5D0CBC5D1CCC8D2CDCAD3CECAD1CB
      C7D0CAC6CFC7C3D0CAC4D3CFCBD2CDC9CDC5BFCDC3BCD4CFCCD3CECBD2CDCAD2
      CEC8D3CECBD2CDCAD3CECAD2CFC9D3CECBD3CECBD3CECAD3CFCBD1CDC8CBC2BC
      D2CCC9D3CFCBD3CECBD1CBC6CBC4BFCEC6C1D3CCC9D3CECAD3CECAD3CECAD3CE
      CAD3CECAD3CECBD0CBC6D1CAC5D1CAC5CEC7C3D3CDC9CFC9C3D1CAC5CAC0B9CD
      C5BFD2CDC9D3CECAD3CECAD3CECAD3CECAD3CECAD3CECAD3CECAD3CECAD3CECA
      D3CECAD3CECAD3CEC9CDC7C1CFC8C5D4D0CCCEC7C1CDC4BFD4D0CDD3CECAD3CE
      CAD3CDC9CEC7C1CBC2BBD3CDC9D3CECBD3CECBD2CFC8D3CECAD3CECBD3CECBD2
      CFC8D3CECAD3CECBD3CECAD3CECBD2CEC9CBC2BCD1CBC8D3CECAD3CECAD3CCC7
      CDC6C1CDC6C1D2CCC8D3CECAD3CECAD3CECAD3CECAD3CECAD3CECAD2CDC8CFC9
      C3D2CBC7CCC5C0D3CECBD0C9C3D1CAC5CAC1BBCCC3BDD2CDC8D3CECBD3CECAD3
      CECAD3CECAD3CECAD3CECAD3CFCBCEC6C1CABFB9CEC7C3D4D0CCCEC5C0CEC7C1
      D3CFCBD3CECAD3CFCBD2CDC9CCC4BDCAC0B9D0C8C4D3CECBD3CECCD2CBC8D1CA
      C6D0CAC6CBC2BDCCC4BFCBC2BCCCC4BEC9BEB8D1CAC7D3CECAD3CECAD3CECAD3
      CECAD3CECAD4CFCCCDC5C0CFC8C4D3CECAD3CECAE2DBC95886EC497DEF497DEF
      497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497D
      EF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF49
      7DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF
      497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497D
      EF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF49
      7DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF
      497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497D
      EF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF49
      7DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF
      497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497D
      EF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF49
      7DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF
      497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497D
      EF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF49
      7DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF497DEF}
    Left = 262
    Top = 216
  end
  object SelectDeviceMenu: TMainMenu
    AutoHotkeys = maManual
    Left = 292
    Top = 87
    object N152: TMenuItem
      Caption = #36873#25321#36710#36742
      object N153: TMenuItem
        Action = SelectDevs
      end
      object N154: TMenuItem
        Action = Selected
      end
    end
  end
  object PopupMenuSelected: TPopupMenu
    AutoHotkeys = maManual
    Images = ImageList2
    Left = 322
    Top = 88
    object N155: TMenuItem
      Action = fun_Devs_CallDev
    end
    object N156: TMenuItem
      Action = fun_Devs_PursueDev
    end
    object N41: TMenuItem
      Action = fun_Devs_SendControlInfo
    end
    object N43: TMenuItem
      Action = fun_Devs_GetAPicture
    end
    object N44: TMenuItem
      Action = fun_Devs_Polling_MCU
    end
    object N160: TMenuItem
      Caption = '-'
      Visible = False
    end
    object N163: TMenuItem
      Action = Sel_Dev_Online
      Caption = #36873#25321#22312#32447
      Visible = False
    end
    object N165: TMenuItem
      Action = Sel_Dev_Postion
      Caption = #36873#25321#23450#20301
      Visible = False
    end
    object N161: TMenuItem
      Action = Sel_Dev_Empty
      Caption = #36873#25321#31354#36710
      Visible = False
    end
    object N179: TMenuItem
      Caption = '-'
      Visible = False
    end
    object N164: TMenuItem
      Action = Sel_Dev_Not_Online
      Caption = #36873#25321#19981#22312#32447
      Visible = False
    end
    object N166: TMenuItem
      Action = Sel_Dev_Not_Postion
      Caption = #36873#25321#38750#23450#20301
      Visible = False
    end
    object N162: TMenuItem
      Action = Sel_Dev_Full
      Caption = #36873#25321#37325#36710
      Visible = False
    end
    object N270: TMenuItem
      Caption = '-'
    end
    object N269: TMenuItem
      Action = fun_ReadDevHourDis
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 1500
    OnTimer = Timer1Timer
    Left = 190
    Top = 217
  end
  object MSNPopUp2: TMSNPopUp
    Text = 'text'
    URL = 'http://www.url.com/'
    IconLeft = 8
    IconTop = 8
    TimeOut = 0
    Width = 160
    Height = 100
    GradientColor1 = 16764057
    GradientColor2 = clWhite
    ScrollSpeed = 9
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    HoverFont.Charset = DEFAULT_CHARSET
    HoverFont.Color = clBlue
    HoverFont.Height = -11
    HoverFont.Name = 'MS Sans Serif'
    HoverFont.Style = [fsUnderline]
    Title = 'title'
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    Options = [msnCascadePopups, msnAllowScroll]
    TextAlignment = taCenter
    TextCursor = crDefault
    PopupMarge = 2
    PopupStartX = 16
    PopupStartY = 2
    DefaultMonitor = dmDesktop
    BackgroundImage.Data = {
      96EA0000424D96EA0000000000003600000028000000C8000000640000000100
      18000000000060EA0000120B0000120B00000000000000000000F6EDEDF6EEED
      F6EDEEF6EEEDF6EEEEF6EDEDF6EDEDF6EDEDF6EDEDF6EEEEF6EDEDF6EDEDF6ED
      EEF6EEEDF6EDEEF6EEEDF6EDEDF6EEEEF6EDEEF6EDEDF6EDEEF6EEEDF6EDEEF6
      EDEDF6EEEEF6EEEDF6EDEEF6EDEEF6EDEEF6EDEEF6EDEDF6EEEDF6EDEDF6EDED
      F6EEEDF6EEEEF6EDEEF6EDEEF6EDEEF6EDEEF6EEEDF6EEEEF6EEEEF6EDEEF6ED
      EDF6EDEDF6EEEDF6EDEDF6EEEEF6EDEDF6EDEDF6EEEEF6EEEDF6EEEEF6EDEDF6
      EDEDF6EDEDF6EDEDF6EDEEF6EDEDF6EDEEF6EDEEF6EDEEF6EDEEF6EEEDF6EDEE
      F6EDEEF6EDEDF6EDEEF6EDEDF6EEEEF6EDEEF6EDEEF6EDEDF6EDEDF6EEEDF6EE
      EDF6EDEEF6EEEEF6EDEEF6EDEEF6EEEEF6EDEDF6EDEEF6EEEDF6EDEEF6EEEDF6
      EEEEF6EDEDF6EDEDF6EDEDF6EEEDF6EDEEF6EDEEF6EDEDF6EDEDF6EEEEF6EDEE
      F6EEEDF6EDEDF6EDEEF6EDEEF6EDEDF6EDEDF6EDEDF6EDEDF6EDEDF6EDEEF6EE
      EDF6EEEEF6EDEDF6EDEDF6EEEDF6EDEEF6EDEEF6EDEDF6EEEEF6EDEEF6EDEEF6
      EEEEF6EEEDF6EEEDF6EEEEF6EEEDF6EDEDF6EDEEF6EDEDF6EDEDF6EDEDF6EDED
      F6EDEEF5EDEEF6EDEDF6EEEEF6EDEEF6EEEDF6EDEDF6EDEEF6EDEEF6EEEEF6ED
      EDF6EDEDF6EDEDF6EDEDF6EDEEF6EEEEF6EDEEF6EDEEF6EDEEF6EDEEF6EDEEF6
      EDEEF6EDEDF6EDEDF6EDEEF6EDEEF6EEEEF6EDEDF6EDEDF6EEEDF6EDEEF6EDEE
      F6EEEEF6EDEEF6EDEEF6EDEDF6EEEDF6EDEEF6EDEDF6EDEEF6EDEEF6EEEEF6EE
      EDF6EDEDF6EDEEF6EDEDF6EDEDF6EDEEF6EDEEF6EEEEF6EEEEF6EDEDF6EDEDF6
      EDEEF6EDEDF6EDEEF6EDEEF6EDEEF6EDEEF6EDEEF6EEEDF6EEEEF6EDEEF6EDEE
      F6EDEDF6EEEDF6EEEEF6EDEDF6EEEDF6EDEEF5EDECF6EDECF5EDEDF5EDECF5EE
      ECF6EDECF5EDECF5EDECF5EDECF5EDECF5EEECF5EDECF6EDECF5EDECF5EDECF5
      EEEDF5EEECF6EDECF5EDECF5EEECF6EDECF6EDECF5EDECF5EEECF6EDECF5EEEC
      F5EDECF5EDECF5EDECF6EDECF5EDECF5EDECF5EDECF5EEECF5EDECF5EDECF5ED
      ECF5EDECF6EDECF5EDECF5EEECF6EEECF5EDEDF5EEECF5EEECF5EEECF5EEECF5
      EDECF6EDECF6EDECF5EDECF5EEECF5EDECF5EEECF5EDECF5EDECF6EDECF6EDEC
      F6EDECF6EDECF5EEECF6EEECF5EDECF6EDECF5EDECF5EDECF5EDECF5EEECF6ED
      ECF6EDECF5EDECF5EDECF5EDECF6EDECF5EDECF5EEECF6EEECF5EDECF6EDEDF5
      EDECF5EDECF5EDECF5EEECF6EDECF5EEECF6EDECF5EDECF5EDECF5EDECF5EDEC
      F5EEECF5EEECF6EDECF5EDECF5EEEDF5EEECF6EDECF5EDECF5EEECF5EDECF5ED
      ECF5EDECF5EEECF5EDECF5EEECF6EEECF5EEECF5EDECF5EDECF5EDECF5EDECF5
      EDECF5EEECF5EDECF6EDECF5EDECF5EDECF6EDEDF5EDECF5EEECF6EDECF5EDEC
      F6EEECF5EDECF5EDECF6EEECF5EDECF5EDECF5EDECF5EDECF5EDECF5EEECF5EE
      EDF5EEECF5EDECF5EEECF5EEECF5EDECF6EDECF5EEECF5EDECF5EDECF5EDECF5
      EDECF5EDECF6EDECF5EDECF5EDECF5EDECF5EDECF6EEECF5EDECF5EEEDF5EEEC
      F5EDECF5EDECF6EEEDF5EEECF5EDECF6EDECF5EDECF5EDECF5EDECF5EDECF5EE
      ECF6EEECF6EDECF5EDECF6EDECF5EDECF5EDECF6EDECF5EEEDF5EDECF5EDECF5
      EDECF6EDECF5EDECF5EEECF6EDECF5EDECF5EDECF6EDEDF5EDECF5EDECF5EDEC
      F5EEECF5EDECF6EDECF5EDECF6EDECF6EDECF5EDECF5EEECF5EDEDF5EDECF5EE
      ECF5EDECF5EDECF5EEECF5EDEAF5EDEAF5EDEBF4EEEAF5EDEAF5EEEBF4EDEAF5
      EDEAF4EDEAF5EDEAF4EDEAF5EEEBF4EDEBF5EEEAF4EDEBF4EDEAF5EDEBF5EDEB
      F4EDEAF5EEEBF5EDEBF4EDEBF5EDEBF4EDEAF5EDEAF5EDEAF4EDEAF5EDEBF5EE
      EAF4EEEBF5EDEAF5EDEBF5EDEBF5EDEBF4EDEAF4EDEAF4EEEBF5EDEAF4EDEBF5
      EEEBF4EDEBF4EDEBF5EEEBF5EDEAF4EEEBF4EDEBF5EEEAF4EEEAF4EDEAF4EDEA
      F4EDEAF5EDEAF4EEEAF4EDEBF5EDEBF4EDEAF4EDEAF4EDEBF5EEEAF4EDEBF5ED
      EAF4EDEBF4EDEAF4EDEAF4EDEBF5EDEAF4EDEAF5EDEAF5EDEBF5EDEBF4EDEBF4
      EDEAF4EEEBF5EDEAF5EDEBF5EDEAF4EDEAF4EEEAF4EDEBF5EDEBF4EEEBF4EEEB
      F4EDEAF4EDEAF4EDEAF5EEEAF5EDEBF5EEEAF5EEEAF4EDEBF4EEEBF5EDEBF5ED
      EBF4EEEBF5EDEAF5EDEBF4EDEAF5EDEAF5EDEBF4EDEBF5EDEBF4EDEBF4EDEBF4
      EDEAF5EDEAF5EDEBF5EEEAF5EDEBF5EDEBF5EDEBF5EDEAF5EDEAF5EEEAF4EDEA
      F5EDEBF4EDEAF5EDEBF4EDEBF4EEEAF4EDEAF5EEEBF4EEEAF4EDEBF5EDEBF5EE
      EBF5EEEBF4EEEBF5EDEBF5EDEBF4EDEAF5EDEBF5EDEBF5EDEAF4EDEBF4EDEBF4
      EEEBF4EDEAF5EDEAF5EEEAF5EDEBF4EDEBF5EDEAF5EDEBF5EDEAF4EDEBF5EDEB
      F5EEEAF4EEEAF5EDEBF5EDEBF4EEEAF4EDEBF4EDEBF4EDEAF5EDEBF5EDEAF5EE
      EBF5EDEAF4EDEBF5EDEBF4EDEAF5EDEAF4EDEAF5EDEAF5EDEAF5EEEBF5EDEAF4
      EDEBF5EDEAF5EDEAF4EEEBF5EDEAF4EDEAF5EDEBF4EEEAF4EEEBF5EDEAF5EDEA
      F4EDEBF4EDEAF5EDEBF5EEEAF5EDEBF4EDEBF4EDEBF4EEEAF4EDEBF4EDEAF4EE
      EAF5EDEBF5EDEBF4EEEAF5EEEAF4EEEBF4EDEBF5EEEBF4EDEBF4EEEBF4EDEAF4
      EDEBF3EEE8F3EDE8F4EDE8F3EDE9F4EDE8F3EEE9F3EDE9F4EDE9F3EDE9F4EDE9
      F4EDE9F4EDE9F4EDE9F3EDE9F4EDE9F4EDE9F4EEE9F4EDE9F3EDE9F3EDE8F3EE
      E9F3EDE9F3EEE9F4EDE8F4EDE9F4EDE9F4EDE9F4EDE9F3EDE9F3EEE9F4EDE8F4
      EDE9F4EEE8F3EDE9F4EDE8F4EEE9F4EEE9F4EDE9F4EDE9F3EDE9F3EDE9F4EDE9
      F3EDE9F4EDE9F4EDE9F3EEE9F4EEE8F3EDE9F4EDE9F4EDE9F3EEE9F3EDE9F3ED
      E9F4EDE9F3EDE9F4EDE8F4EDE9F4EDE9F3EDE8F4EDE9F4EEE9F4EDE9F4EDE8F4
      EEE9F4EEE9F4EEE9F3EDE9F4EDE9F4EDE9F4EDE9F4EDE9F4EDE9F3EDE9F4EDE8
      F4EDE9F4EDE8F4EDE9F4EDE9F4EEE9F4EDE9F4EDE9F4EDE9F4EDE9F3EDE9F3ED
      E8F4EEE9F3EDE9F4EEE9F3EEE9F3EDE9F4EEE8F3EDE8F3EDE8F4EDE9F3EDE9F4
      EDE9F4EDE9F3EDE9F4EDE9F3EDE9F4EEE9F4EDE9F3EDE9F4EDE9F4EDE9F4EDE9
      F4EDE9F4EDE9F3EDE9F4EEE9F4EEE9F4EDE8F3EDE9F4EDE9F4EDE9F4EDE9F4ED
      E9F3EDE9F4EDE9F4EEE9F4EDE9F4EDE9F3EEE9F4EDE8F3EDE9F4EEE8F3EEE9F4
      EDE9F3EDE9F4EDE9F4EEE9F3EDE9F3EDE9F3EDE9F3EDE9F4EDE9F4EDE9F4EDE9
      F4EDE8F4EDE9F4EDE9F3EDE8F4EDE9F4EDE9F3EDE8F4EDE9F4EEE8F4EDE8F4ED
      E9F3EDE9F4EDE9F3EDE8F3EDE9F3EDE8F3EDE9F3EDE8F4EDE9F4EDE9F4EDE9F4
      EDE9F4EEE9F4EDE9F4EDE9F3EDE9F4EDE9F4EEE9F4EDE9F4EDE8F4EDE9F4EDE9
      F4EDE9F3EDE9F4EDE9F3EDE9F3EEE9F3EDE9F4EEE9F4EDE9F4EDE9F3EEE8F4ED
      E9F4EDE8F4EEE8F4EDE8F4EDE9F4EEE9F4EDE9F3EDE8F3EDE9F4EDE9F4EDE9F3
      EDE8F3EDE9F3EDE9F3EDE8F4EDE9F3EDE9F3EDE9F3EDE9F4EDE9F2EDE7F2EDE7
      F3EDE7F3EDE7F3EDE7F2EDE7F2EDE7F3EDE7F2EDE7F2EDE7F2EDE7F3EDE7F3ED
      E7F3EDE7F3EDE7F3EDE7F3EEE7F3EDE7F2EDE7F2EDE7F3EDE7F3EDE7F2EDE7F3
      EEE7F2EDE7F3EDE7F2EDE8F3EEE7F3EDE7F3EDE7F3EDE7F3EDE7F3EDE7F2EDE7
      F3EDE7F3EDE7F2EDE7F3EDE7F3EDE7F2EDE8F2EDE7F2EDE7F3EDE7F3EEE7F3ED
      E7F3EDE7F3EDE7F3EDE7F3EDE7F3EDE7F3EDE7F2EDE7F3EDE7F2EDE7F3EDE7F3
      EDE7F2EDE7F3EDE7F3EDE7F2EEE7F3EDE7F2EDE8F3EDE7F3EDE7F2EEE7F2EEE7
      F3EEE7F2EEE7F3EDE7F3EEE8F3EDE7F3EEE7F3EEE7F3EDE7F3EDE7F2EEE7F2ED
      E7F2EDE7F3EDE7F3EDE7F3EDE7F2EDE7F3EDE7F3EDE7F3EDE7F3EDE7F2EDE7F3
      EDE7F2EDE7F3EDE7F2EDE7F2EDE7F2EEE7F2EDE7F3EDE7F2EDE7F3EDE7F2EDE7
      F3EDE7F2EDE7F3EDE7F3EEE7F3EEE7F2EDE7F3EDE7F3EDE7F3EDE7F2EDE8F3ED
      E7F2EDE7F3EDE7F2EDE7F3EDE7F3EDE7F2EEE7F3EDE7F2EDE8F3EDE7F3EDE7F2
      EDE7F3EDE7F3EDE8F3EEE7F3EDE7F3EDE7F3EDE7F2EDE7F3EDE7F3EDE7F2EDE7
      F3EEE7F2EDE7F2EDE7F3EDE8F2EDE7F2EDE7F3EDE7F2EDE7F3EDE7F2EDE7F3EE
      E7F2EDE7F3EDE7F3EDE7F3EDE7F3EDE7F3EDE7F3EDE7F2EDE7F3EDE8F3EEE7F2
      EDE7F3EDE7F3EDE7F3EDE7F3EDE7F2EDE7F3EDE7F3EDE7F3EDE7F2EDE7F3EDE7
      F3EDE7F2EDE7F3EDE7F2EDE7F2EDE7F3EDE7F3EDE7F3EDE7F3EDE7F3EDE7F3ED
      E7F3EDE7F2EEE7F2EDE7F2EDE7F3EDE7F3EDE7F3EDE7F2EDE7F2EDE7F3EDE8F2
      EEE7F2EDE7F2EDE7F3EDE7F3EDE7F2EDE8F3EDE7F3EDE7F2EDE7F2EDE7F2EDE7
      F3EDE8F3EEE7F2EDE7F3EDE7F3EDE8F3EEE7F2EDE5F2EDE5F2EDE5F2EDE6F2ED
      E6F2EDE5F2EDE5F2EEE5F2EDE5F1EDE5F2EDE5F2EDE5F2EDE6F2EDE5F1EDE6F2
      EDE6F2EDE5F1EDE5F2EDE5F2EDE5F1EDE6F2EDE5F1EDE5F2EEE5F2EDE6F2EDE5
      F2EDE5F2EDE6F2EDE6F2EDE5F2EEE5F1EDE5F2EDE5F2EDE5F2EDE5F2EDE5F2ED
      E5F2EDE6F2EDE5F1EDE5F2EDE5F2EDE5F2EDE5F2EDE5F1EDE5F2EDE5F2EDE5F2
      EDE5F2EDE5F2EDE6F1EDE5F1EDE6F1EDE5F2EDE5F2EDE5F2EDE5F2EDE5F2EDE5
      F2EDE5F1EDE5F2EDE5F2EDE6F2EDE5F2EDE6F2EDE5F2EDE5F1EDE5F1EDE5F2ED
      E6F2EDE5F2EDE5F2EDE6F1EDE6F2EDE5F2EDE5F2EDE6F1EDE5F1EDE5F2EDE6F1
      EDE5F2EDE5F2EDE5F1EDE5F1EDE5F2EDE5F2EDE5F1EDE6F2EDE5F2EDE5F2EDE6
      F2EDE5F2EEE5F2EDE5F1EDE6F1EDE5F2EDE6F2EDE5F1EDE5F1EDE5F2EDE5F2ED
      E5F2EDE5F2EDE6F2EDE6F1EEE5F1EDE5F1EDE5F2EEE5F2EDE6F2EDE6F2EDE6F2
      EDE5F2EDE5F1EEE5F1EDE6F1EDE5F1EDE5F2EDE5F2EEE5F1EDE5F2EDE5F2EDE5
      F2EDE5F2EDE5F2EDE5F2EDE5F2EDE6F2EDE6F2EDE5F2EDE6F2EDE5F1EDE6F2EE
      E5F2EDE5F2EDE5F2EDE6F2EDE5F2EDE5F1EDE5F2EEE5F2EDE6F2EDE5F2EDE5F2
      EDE5F2EDE5F2EDE5F1EDE5F2EDE5F2EDE5F2EEE6F1EDE5F2EDE5F2EDE5F2EEE6
      F1EDE5F2EDE6F1EDE5F2EDE5F2EDE5F2EDE5F2EDE5F2EDE5F2EDE5F2EDE5F2EE
      E6F2EDE5F2EDE5F2EDE5F2EDE5F2EDE5F2EDE5F1EDE5F2EDE5F1EDE5F2EDE5F2
      EDE5F1EDE6F2EDE5F2EDE5F2EDE6F2EEE6F1EDE5F1EDE5F2EDE5F2EDE5F2EDE5
      F1EDE6F2EDE5F2EDE5F2EDE5F2EDE5F2EDE5F2EDE5F2EDE5F2EDE6F1EDE5F2EE
      E5F2EDE5F2EDE5F2EDE5F0EDE3F1EDE4F1EDE3F1EDE3F1EDE3F1EEE3F1EDE4F0
      EDE3F0EDE3F1EEE3F1EDE3F1EDE4F1EDE3F0EDE3F1EDE4F1EDE3F1EDE4F1EDE3
      F0EDE4F1EDE3F1EDE3F1EDE3F0EDE3F1EDE3F0EDE4F1EDE4F1EDE3F0EDE3F1ED
      E3F1EDE3F1EDE3F1EDE3F0EDE3F0EDE3F1EDE4F1EDE4F0EDE3F1EDE4F0EDE3F1
      EDE3F1EDE3F1EDE3F1EDE3F0EDE4F1EDE3F1EDE4F1EDE3F0EDE3F0EDE3F1EDE3
      F1EDE3F1EDE3F1EDE3F1EDE3F0EDE3F1EDE3F0EDE4F1EDE3F1EDE4F0EDE3F1ED
      E3F1EDE4F1EDE3F1EDE4F0EEE4F0EDE3F1EEE3F1EDE4F1EDE3F0EDE3F1EDE3F1
      EDE4F0EDE4F1EDE3F1EDE3F1EDE4F1EDE3F1EDE4F1EDE3F0EEE3F1EDE3F1EDE4
      F1EDE3F0EDE4F1EDE4F0EEE3F0EDE4F1EDE4F1EDE3F1EDE3F0EEE4F1EDE3F1ED
      E3F0EDE3F1EDE3F0EDE3F1EEE3F0EDE3F0EDE3F0EEE3F0EDE3F1EDE3F1EDE3F1
      EDE3F0EDE3F1EDE3F1EDE3F0EDE3F1EDE3F0EDE4F1EDE4F0EDE4F1EDE4F1EDE3
      F1EDE3F1EDE3F1EDE4F0EDE3F0EEE3F0EDE3F1EDE4F1EDE3F1EDE3F0EDE4F1ED
      E3F0EDE4F1EDE4F1EDE4F1EDE3F0EDE3F0EDE3F0EDE3F0EDE4F1EDE4F1EDE3F0
      EDE3F1EDE3F1EDE4F1EDE3F1EDE3F0EDE3F0EDE3F1EDE3F1EDE4F1EDE3F1EDE3
      F1EEE4F0EDE3F1EDE3F0EDE4F1EDE3F0EDE3F1EDE3F1EDE3F1EDE3F1EDE3F1ED
      E3F0EDE3F1EDE4F1EDE3F1EDE4F1EDE3F1EDE3F1EDE3F1EDE3F1EDE3F1EDE3F1
      EDE3F0EDE3F0EDE3F1EDE4F1EDE3F0EDE3F1EDE3F1EDE3F1EDE3F0EDE4F1EDE4
      F0EDE3F0EDE3F0EDE4F1EDE3F1EDE3F1EDE3F1EDE3F0EDE3F1EDE4F1EDE4F1ED
      E3F1EDE3F0EEE3F0EDE3F1EDE4F1EDE4F0EDE4F1EDE3F0EDE4F1EDE3F1EDE3F0
      EDE4F0EDE1F0EDE1EFEDE1F0EDE1F0EDE1F0EDE1F0EDE1F0EDE1EFEDE1F0EDE2
      EFEDE2F0EDE1F0EDE1F0EDE1F0EDE1F0EDE1F0EDE1F0EDE1F0EDE1F0EDE1F0ED
      E1F0EDE1F0EDE1F0EDE1F0EDE1EFEDE1F0EDE1EFEDE2EFEDE2F0EDE1EFEDE1F0
      EDE1F0EDE1F0EDE2F0EDE1F0EDE2F0EDE1F0EDE1EFEDE2F0EDE2F0EDE1F0EDE1
      EFEDE1EFEDE1F0EDE1F0EDE2F0EDE1F0EDE1EFEDE1F0EDE1F0EDE1F0EDE1F0ED
      E2F0EDE1EFEDE1EFEDE1F0EDE1EFEDE1F0EDE1EFEDE1F0EDE1F0EDE1F0EDE1EF
      EDE1F0EDE1F0EDE1F0EDE1F0EDE1F0EDE1EFEDE1F0EDE2EFEDE2F0EDE2F0EDE1
      F0EDE2F0EDE2F0EDE1F0EDE1EFEDE2F0EDE1EFEDE1F0EDE1F0EDE1EFEDE1F0ED
      E1EFEDE1EFEDE2F0EDE1F0EDE1F0EDE1F0EDE1F0EDE1EFEDE1EFEDE1F0EDE1F0
      EDE1F0EDE1F0EDE1EFEDE2EFEDE1EFEDE1F0EDE1F0EDE1F0EDE1F0EDE1EFEDE1
      F0EDE1F0EDE1EFEDE1F0EDE1EFEDE1F0EDE1F0EDE1F0EDE1F0EDE2F0EDE2F0ED
      E2F0EDE1F0EDE2EFEDE2F0EDE2EFEDE1F0EDE1F0EDE1F0EDE1F0EDE1F0EDE1F0
      EDE1F0EDE2F0EDE1EFEDE1F0EDE1F0EDE1F0EDE1F0EDE1F0EDE1EFEDE1F0EDE1
      F0EDE1F0EDE2F0EDE2F0EEE1F0EDE1F0EDE2F0EDE1F0EDE2EFEDE2EFEDE2F0ED
      E2F0EDE1F0EDE1F0EDE2EFEDE2EFEDE1F0EDE1F0EDE1EFEDE1F0EDE1F0EDE1EF
      EDE1EFEDE1F0EDE2EFEDE1EFEDE1F0EEE1F0EDE1EFEDE2F0EDE1EFEDE1F0EEE2
      F0EDE1EFEDE1F0EDE2F0EDE2F0EDE1F0EDE1F0EDE1F0EDE2F0EDE1F0EDE2F0ED
      E1F0EDE1EFEDE1EFEDE1EFEDE1F0EDE2F0EDE1EFEDE2EFEDE1EFEDE1EFEDE2F0
      EDE1F0EDE2EFEDE1EFEDE1F0EDE1EFEDE1F0EDE1F0EDE1F0EDE1EEEDDFEFEDDF
      EFEDDFEEEDDFEEECDFEEEDDFEFEDDFEFEDDFEEEDDFEFEDDFEFEDDFEEEDDFEEED
      DFEEEDDFEEEDDFEFEDE0EFEDDFEFEDDFEFEDDFEEEDDFEEEDDFEFEDDFEEEDE0EF
      EDDFEFEDDFEFEDDFEEEDDFEEEDDFEEEDDFEEEDDFEFEDDFEFEDDFEEEDDFEFEDDF
      EFEDDFEFEDDFEEEDDFEEEDDFEFEDDFEFEDDFEEEDDFEEEDE0EEEDDFEEEDDFEEED
      DFEEEDE0EEECDFEFEDDFEEEDDFEFEDDFEEEDDFEFEDDFEEEDE0EEEDDFEFEDDFEF
      EDE0EEEDDFEFEDDFEEEDDFEEEDDFEFEDDFEEEDDFEFEDE0EEEDDFEFEDDFEFEDDF
      EEEDDFEFEDDFEFEDDFEEEDDFEEEDDFEEEDDFEFEDDFEFEDDFEFEDDFEFEDDFEFED
      DFEFEDDFEFEDDFEEEDE0EFEDDFEFEDDFEFEDDFEFEDDFEFEDDFEEEDDFEEEDDFEF
      EDE0EEEDDFEEEDDFEFEDDFEFEDDFEFEDDFEFEDDFEFEDDFEFEDE0EFEDDFEFEDDF
      EFEDDFEFEDDFEEEDDFEFEDDFEFEDE0EFEDDFEEEDDFEFEDDFEEEDDFEEEDE0EFED
      DFEFEDDFEEEDDFEEEDDFEFEDDFEEEDDFEFEDDFEFEDDFEFEDDFEFEDDFEFEDDFEF
      EDDFEFEDDFEFEDDFEFEDDFEFEDDFEEEDDFEFEDDFEEEDDFEFEDDFEFEDDFEFEDDF
      EFEDDFEEEDDFEEEDDFEEEDDFEFEDDFEFEDE0EEEDDFEFEDDFEEEDDFEEECDFEEED
      E0EFEDDFEFEDDFEFEDDFEFECDFEFEDDFEFEDDFEEEDDFEEEDDFEEEDE0EFEDDFEF
      EDDFEFEDDFEFEDE0EEEDDFEFEDDFEFEDE0EFEDDFEEEDDFEFEDDFEFEDDFEFEDDF
      EFEDDFEEEDDFEFEDDFEEEDDFEFEDDFEFEDDFEFEDDFEFEDDFEFEDDFEFEDDFEFED
      DFEEEDDFEEEDDFEEEDDFEFEDDFEFEDDFEFEDDFEFEDDFEFEDDFEEEDDFEFEDE0EE
      EDE0EFEDDFEEEDE0EEEDDFEFEDDFEFEDDFEFEDDFEEEDDFEFEDDFEEEDDFEFEDDF
      EFEDDFEFEDDFEEEDE0EFECDFEFEDDFEFEDDFEEEDDDEEEDDDEEEDDCEEEDDDEEED
      DDEDEDDDEDEDDDEDEDDDEDEDDCEDEDDCEDEDDDEEEDDDEDEDDDEEECDDEEEDDCEE
      EDDDEDEDDDEDEDDDEDEDDDEDEDDDEEEDDCEDEDDDEDEDDDEEEDDDEEEDDDEDEDDD
      EEEDDDEDEDDCEEEDDDEDECDDEDEDDCEDEDDDEEEDDCEEEDDDEDEDDDEDEDDCEEED
      DDEDEDDDEEEDDDEEECDDEEEDDDEDEDDDEDECDDEEEDDDEEEDDDEDEDDDEEEDDDED
      ECDDEEEDDCEDEDDCEEECDDEDEDDDEDEDDCEDEDDDEDEDDDEDEDDDEEEDDDEEECDD
      EEEDDCEEEDDDEDEDDDEEEDDDEEEDDDEEEDDDEDEDDDEEEDDDEDEDDDEEEDDDEEED
      DDEDEDDDEEEDDDEEEDDDEEEDDDEEEDDDEDEDDDEEEDDDEDEDDDEEEDDDEDEDDDED
      EDDCEDECDDEDEDDDEDECDDEDEDDDEEEDDDEDEDDDEEEDDCEDEDDDEEEDDDEEEDDD
      EDEDDCEEEDDCEEEDDDEEEDDDEDEDDDEDEDDCEEEDDDEDEDDCEDEDDDEDEDDDEDED
      DDEDEDDDEEEDDDEEEDDDEEEDDDEDEDDCEDEDDDEEEDDDEEEDDDEDEDDCEDEDDDEE
      ECDDEEEDDDEDEDDDEDECDDEDECDCEDEDDDEDEDDCEEEDDDEDEDDDEEEDDDEDECDD
      EEEDDDEDEDDDEDEDDDEEEDDDEDEDDDEEEDDDEDEDDDEEEDDDEDEDDDEEEDDDEEED
      DDEDEDDDEDEDDDEDEDDDEEEDDDEDEDDDEDEDDCEEECDCEEEDDDEEEDDDEDEDDCED
      EDDDEDECDDEEEDDCEEEDDDEDEDDCEDEDDDEEEDDCEDEDDDEEEDDCEDEDDDEDEDDD
      EDECDCEEEDDDEDEDDCEDEDDDEDEDDDEEEDDCEDEDDDEEEDDDEEEDDDEDEDDDEDED
      DDEDEDDCEDEDDDEDEDDCEDEDDCEEECDDEDEDDDEEEDDDEEEDDDEDECDDEDECDDEE
      ECDDEEEDDDEDEDDCEEEDDDEEECDDEDEDDDEDEDDDEDEDDDEEEDDDEEECDDEEEDDD
      EEEDDDEDEDDDEDEDDDEDEDDDEDEDDDEEECDDEEECDDEEEDDCEEEDDDEDEDDCEEED
      DDEDECDDEDEDDDEDEDDDECEDDAEDEDDBECEDDBECECDBECEDDBECEDDBECEDDBED
      EDDBECEDDBECECDBECECDAEDEDDBEDEDDAEDEDDBECEDDAEDEDDBECEDDBECEDDB
      EDEDDBECEDDAECEDDAECEDDBECECDBEDEDDBECEDDBEDEDDBEDECDBECEDDBEDED
      DAECEDDAEDEDDBEDEDDAECECDBECEDDBEDEDDBECEDDAECEDDAEDECDAEDEDDAEC
      EDDBECEDDBEDEDDBECEDDBEDEDDBECEDDBECEDDBECECDAECEDDBECEDDBECEDDA
      ECECDAEDEDDAEDEDDAECEDDBEDECDAECEDDBECEDDAECEDDBEDEDDAEDEDDBECED
      DAECEDDBECEDDBECEDDAEDEDDBECEDDBECEDDAEDEDDBECEDDAEDEDDBEDECDAED
      EDDAECEDDAECEDDBEDEDDBECEDDBECECDBECEDDBECEDDBECEDDBECEDDAECEDDB
      EDEDDBECEDDAECEDDBECEDDAEDEDDBEDEDDBECEDDBECECDBECEDDBEDEDDBEDED
      DBECEDDAECEDDBECEDDBECECDBECEDDBECEDDAECEDDBECECDBECEDDBECEDDBEC
      EDDBEDEDDAEDEDDAECEDDAECEDDBEDEDDBECECDAEDEDDBECEDDBECEDDBECECDB
      ECECDAEDEDDAEDEDDBECECDBECEDDAEDEDDBEDEDDBEDEDDAEDEDDAEDEDDAECED
      DBECEDDBEDEDDBECECDAECEDDBECEDDBECEDDBECEDDBECEDDBECEDDBECEDDBEC
      EDDAEDEDDBECEDDBECEDDAECEDDBECEDDBECECDBECEDDBEDEDDAECEDDAECEDDB
      ECEDDBECEDDBECECDBECEDDBECEDDBECEDDAEDEDDAECEDDBECEDDAECEDDAECED
      DBEDEDDBECEDDBECEDDBECEDDBEDECDBEDECDBECEDDBECEDDAECEDDAEDEDDBEC
      EDDBECEDDAECECDAECEDDBECEDDAECEDDAEDEDDAECECDBEDEDDBEDEDDAEDEDDB
      ECEDDBECEDDBECEDDBECECDBECEDDAEDEDDBEDEDDAEDEDDAEDEDDAECEDDBECED
      DAECEDDAEDEDDAECEDDBEDEDDAEDEDDBECEDDBECEDDAECEDDAECECDBECEDDBED
      EDDBEBEDD9EBEDD8EBEDD8EBEDD9EBEDD8EBEDD8EBECD9EBEDD9EBEDD9EBECD8
      EBEDD9EBEDD8ECEDD8EBEDD8EBEDD8EBEDD8ECEDD8EBEDD8EBEDD9EBEDD9EBED
      D9EBECD8EBEDD8EBEDD8EBECD8EBECD8EBEDD9EBEDD8EBEDD9EBEDD8EBEDD8EB
      EDD8EBECD9EBEDD9EBECD8EBECD8EBEDD9EBEDD8EBECD8EBEDD9EBEDD8EBEDD8
      EBECD8EBEDD8EBECD8EBEDD8EBECD8EBECD8ECEDD8EBEDD8EBEDD8EBECD8EBED
      D8EBECD8EBEDD8EBEDD8EBEDD8EBEDD9EBEDD9EBEDD8EBECD9EBEDD8EBECD8EB
      EDD8EBEDD8EBECD8EBEDD9EBECD8EBEDD8EBEDD8EBEDD8EBEDD8ECECD8EBECD8
      EBECD8EBEDD8EBECD8EBECD9EBEDD9ECEDD8EBEDD9EBEDD8EBEDD8ECEDD9EBED
      D8EBEDD8EBEDD8EBECD8EBEDD9EBEDD8EBECD8EBECD9EBECD8EBEDD8EBEDD8EB
      EDD8EBEDD8EBEDD8EBEDD8EBEDD8EBECD8EBEDD8EBEDD8EBEDD8EBEDD8EBECD8
      EBEDD8EBEDD8EBECD8ECEDD9EBEDD8EBEDD8ECEDD8EBECD8EBEDD8EBEDD8EBED
      D8EBECD8EBEDD8EBEDD8EBEDD8EBECD9EBEDD8EBEDD8EBEDD8EBEDD8EBEDD9EB
      EDD8ECEDD8EBEDD8ECEDD9EBEDD8EBEDD9EBEDD8EBEDD9EBECD9EBEDD8EBEDD8
      EBEDD8EBEDD8EBEDD8EBEDD8EBEDD8EBECD8EBEDD8EBEDD9EBEDD8EBEDD8EBED
      D9EBEDD8EBEDD9EBECD8EBEDD8EBEDD9ECEDD8EBEDD8EBEDD8EBEDD8EBEDD8EB
      EDD8EBECD8EBEDD8EBEDD8EBECD8EBEDD9EBEDD8ECECD9EBEDD9EBEDD8EBEDD8
      EBECD8EBEDD8EBEDD9EBEDD8EBEDD8EBEDD8ECEDD8EBEDD8EBECD8EBEDD8EBED
      D9EBEDD8EBEDD8EBECD9EBEDD8EBECD8EBEDD8EBEDD9EBEDD8EBEDD9EBEDD8EB
      EDD8ECEDD8EBEDD8EBEDD8EBEDD8EBEDD8EBECD8ECEDD8EBEDD9EAEDD5EAEDD6
      EAEDD6EAEDD6EAEDD5E9ECD5EAECD6EAEDD6EAEDD6EAECD5EAEDD6EAECD5EAED
      D5E9EDD6EAEDD6EAEDD6E9EDD6EAECD6EAECD6EAEDD6EAEDD6EAECD6E9EDD6EA
      EDD5EAEDD6EAEDD5EAEDD6EAEDD6EAEDD6EAEDD6EAEDD6EAECD6EAEDD6EAEDD5
      EAEDD5EAEDD5EAEDD6EAECD6EAEDD6EAEDD5EAEDD6EAEDD5EAEDD6EAEDD6EAED
      D5EAEDD5EAEDD5EAECD6EAEDD5EAEDD6EAEDD6EAEDD6EAECD6E9EDD6EAEDD6EA
      ECD6E9EDD5EAECD5EAEDD5EAECD6EAECD6EAEDD6EAEDD6E9EDD6EAEDD6EAECD6
      EAEDD6EAEDD5E9EDD6EAEDD6E9EDD6EAEDD6EAECD5EAEDD6EAECD6EAEDD5E9ED
      D6EAEDD5EAEDD5EAEDD6EAECD6E9EDD6EAECD5EAEDD5EAEDD6E9EDD6EAEDD6EA
      EDD5EAEDD6EAEDD6EAEDD6EAEDD5EAEDD6EAEDD5EAEDD6EAECD6E9EDD6EAECD6
      EAECD6E9EDD5EAECD5EAEDD5EAEDD6EAEDD6EAEDD5EAEDD6EAECD6E9EDD5E9ED
      D6E9ECD5EAEDD6EAECD5EAECD5E9ECD5EAEDD6EAEDD6EAECD6EAEDD5EAECD6EA
      EDD6EAEDD6EAECD5E9EDD6EAECD6EAECD6EAEDD5EAEDD5EAEDD6E9EDD6EAEDD5
      EAEDD5EAECD6EAECD6EAEDD6EAEDD6EAEDD6EAEDD6EAEDD6E9ECD6EAEDD6EAEC
      D6EAECD6EAECD6EAEDD6E9EDD5EAEDD6EAECD5EAEDD6EAECD5EAECD6EAEDD5EA
      EDD6EAEDD6EAECD6EAECD6EAEDD6EAEDD6EAEDD6EAEDD6EAEDD5E9ECD6EAECD6
      E9ECD6EAEDD5EAEDD6EAEDD6EAEDD5EAEDD6EAEDD6E9EDD5E9ECD6EAEDD6EAED
      D6E9EDD6E9EDD5E9EDD6EAECD6EAEDD6EAEDD6E9EDD6EAECD5EAEDD6EAEDD5E9
      EDD6EAECD5EAECD5EAECD6EAEDD6EAEDD6EAEDD6EAEDD6EAEDD6EAEDD6EAECD5
      EAECD6EAEDD6EAEDD6EAEDD6EAEDD5EAEDD6E9EDD3E8EDD3E9EDD3E9EDD4E9ED
      D3E9EDD4E9EDD3E9ECD3E9EDD3E8EDD3E8EDD4E8EDD3E9EDD3E8ECD4E9EDD3E8
      EDD3E9EDD4E9EDD4E9EDD3E9EDD3E8ECD3E8ECD3E9EDD3E9EDD4E8EDD4E8EDD3
      E9EDD3E8EDD3E9ECD3E8ECD3E9EDD4E8ECD3E9ECD3E9ECD3E8EDD3E9ECD4E8ED
      D3E9ECD3E8EDD3E8EDD3E8EDD3E9ECD3E8EDD3E9EDD3E8ECD3E8EDD3E9ECD3E8
      EDD4E8EDD3E8EDD3E8EDD3E8EDD4E8EDD3E9ECD3E8EDD3E9ECD4E9EDD3E9EDD3
      E9ECD4E8EDD3E9EDD3E9EDD3E8EDD3E9EDD3E9EDD3E9EDD3E8ECD3E9EDD3E8EC
      D3E9EDD3E9EDD3E9EDD4E9EDD3E9ECD3E9EDD3E9ECD3E9ECD3E9ECD3E8ECD3E8
      EDD3E9EDD4E9EDD3E9ECD4E8EDD3E9EDD3E9ECD3E8ECD3E8EDD4E8ECD4E8EDD3
      E8EDD4E9EDD3E9EDD3E9EDD3E9ECD4E8EDD3E8ECD3E9EDD3E8EDD3E9EDD3E8EC
      D3E8ECD3E9ECD3E8EDD4E9EDD3E8EDD3E8ECD3E9EDD3E8EDD3E8EDD4E8EDD4E9
      EDD3E9EDD4E8EDD3E8ECD3E8EDD3E9EDD4E9ECD4E8EDD3E9EDD3E8EDD3E9ECD3
      E9EDD4E8ECD3E8EDD3E8ECD3E9ECD4E8EDD3E8ECD3E8ECD3E9EDD3E9EDD3E8EC
      D3E9EDD3E8ECD4E9EDD3E9ECD3E9EDD3E8ECD3E9EDD3E9ECD3E9EDD3E9EDD3E9
      EDD3E8EDD4E8EDD3E9EDD3E8ECD3E9ECD3E9EDD3E9EDD3E8EDD3E9ECD4E9EDD3
      E9ECD3E9EDD3E9EDD3E9EDD3E8ECD4E8ECD3E9ECD3E9EDD3E8ECD3E8EDD3E9ED
      D3E9EDD3E8EDD3E9EDD3E8ECD3E8EDD3E8EDD3E9ECD3E8ECD3E9EDD3E9EDD3E9
      EDD4E8ECD3E8ECD3E8EDD3E8EDD3E9ECD3E9EDD3E8EDD4E9EDD3E9ECD3E8EDD3
      E8EDD3E8EDD3E9EDD3E9EDD3E8EDD3E9EDD3E9ECD3E8ECD3E9EDD3E9EDD3E9EC
      D3E9EDD4E9ECD4E8ECD3E7EDD1E8EDD0E7ECD1E7EDD0E7EDD1E7EDD1E7ECD1E7
      EDD0E7EDD0E7ECD0E8ECD1E7EDD1E7EDD0E8EDD0E7ECD1E7EDD1E8ECD0E7EDD0
      E7EDD1E8EDD1E7ECD1E8EDD1E7ECD1E8EDD0E7ECD1E7ECD1E7EDD0E7EDD1E7EC
      D0E7EDD1E7ECD1E7EDD0E7ECD1E7ECD1E7EDD1E7ECD0E7ECD0E8EDD1E8ECD1E7
      EDD0E7EDD0E7EDD1E8EDD1E7ECD1E7EDD1E7EDD1E8EDD0E7ECD1E7ECD0E7ECD1
      E7EDD0E7EDD0E7ECD0E7EDD1E8EDD1E8EDD1E7EDD1E8ECD0E8ECD1E7ECD1E7ED
      D0E7EDD1E8EDD1E7EDD0E7ECD0E7EDD0E7ECD1E8EDD0E7ECD1E7EDD1E7EDD0E7
      EDD0E7EDD0E8EDD1E7ECD0E7ECD1E8EDD1E8EDD1E7EDD1E7EDD1E8EDD0E7ECD0
      E7ECD0E7EDD1E7EDD1E8EDD0E7ECD1E8EDD0E7ECD1E7EDD1E8EDD1E8EDD0E7ED
      D1E7ECD1E8EDD1E7EDD1E7ECD1E8ECD1E8EDD0E7EDD1E8EDD0E7ECD0E7ECD1E7
      EDD1E7EDD1E8EDD1E7ECD0E7EDD0E8EDD1E7ECD1E8ECD1E7EDD0E7EDD1E7ECD1
      E7EDD1E7ECD1E7EDD0E8ECD0E7EDD1E7ECD0E7ECD1E7ECD0E7ECD1E7ECD1E8EC
      D0E7ECD0E7EDD1E8EDD1E7ECD0E7ECD1E8ECD1E8ECD0E7EDD1E7EDD1E7ECD0E7
      ECD1E7EDD1E7EDD0E7EDD1E7ECD0E7EDD1E7EDD1E7EDD1E7EDD0E8ECD1E7EDD1
      E7EDD0E7ECD1E7EDD0E8ECD0E7ECD1E7EDD0E8EDD0E7ECD1E7ECD0E7EDD0E8ED
      D0E7EDD0E7EDD0E7ECD1E7EDD0E7ECD0E7EDD1E7ECD1E7ECD0E7ECD1E8ECD0E8
      EDD0E7EDD1E7ECD1E7EDD1E7EDD1E7ECD1E7EDD1E7EDD1E8EDD0E7ECD0E7EDD1
      E7EDD0E8EDD1E7ECD1E7EDD1E7EDD0E7EDD0E7EDD1E7EDD0E7ECD0E7ECD1E8ED
      D0E8EDD1E7ECD1E7ECD1E7EDD1E8ECD1E7ECD1E7EDD1E7EDD0E8EDD1E7EDD1E7
      EDD1E6EDCDE6ECCEE6ECCEE6EDCEE6EDCEE6ECCEE6EDCEE6ECCEE6EDCEE6EDCE
      E5ECCEE6EDCEE6ECCEE6ECCEE6EDCEE5EDCEE5ECCEE6ECCEE6ECCEE6EDCEE6EC
      CEE6EDCEE6EDCEE6ECCEE6ECCEE6EDCEE5EDCEE6ECCEE6ECCEE5ECCEE6ECCEE5
      EDCEE6ECCEE6EDCEE5EDCEE6EDCEE5EDCEE6EDCEE6EDCEE6EDCEE6EDCEE6ECCE
      E6EDCEE6EDCEE5EDCEE6EDCEE6ECCEE6ECCEE5EDCDE6ECCEE5EDCEE6ECCEE6EC
      CEE5EDCEE6EDCEE6ECCEE6ECCEE6EDCDE6ECCEE5EDCEE6ECCEE6ECCEE6ECCEE6
      EDCEE6EDCDE6ECCEE6EDCEE6ECCEE6ECCEE6EDCDE6EDCEE6EDCEE6ECCEE5ECCE
      E6EDCEE5ECCEE6ECCEE6ECCEE5EDCEE6ECCEE6EDCEE6ECCEE6ECCEE6EDCEE6ED
      CEE5EDCEE6ECCEE6ECCEE6ECCEE6EDCEE6EDCEE6EDCEE6ECCEE6EDCEE6EDCEE6
      EDCEE6EDCEE6ECCEE6ECCEE5EDCEE6EDCEE6EDCEE6EDCDE6ECCEE6EDCEE6ECCE
      E6ECCEE6EDCEE6EDCEE6EDCEE6ECCEE6EDCEE6ECCEE6ECCEE6EDCEE5ECCEE5ED
      CEE6EDCEE6ECCEE6ECCEE6EDCEE5ECCEE6EDCDE5ECCEE6EDCEE6EDCEE5EDCEE6
      EDCEE6ECCEE5EDCEE6EDCEE6ECCEE6EDCEE6ECCEE5EDCEE6ECCEE6EDCEE6ECCE
      E5ECCEE6EDCEE6EDCEE6EDCDE6ECCEE5ECCEE6ECCEE6EDCEE6EDCEE6EDCEE6ED
      CEE6ECCEE6EDCEE6EDCEE6ECCEE5EDCEE5EDCEE6EDCEE6ECCEE6EDCEE6EDCEE5
      EDCEE6ECCEE6ECCEE6EDCEE6ECCDE6EDCEE6EDCEE6EDCEE6EDCEE6EDCEE6ECCE
      E5ECCEE5ECCEE6EDCEE5EDCDE6ECCEE6ECCEE5ECCEE6ECCEE6ECCDE6EDCEE6EC
      CEE5EDCEE6ECCEE5EDCEE6ECCEE6EDCEE6ECCEE6EDCDE6EDCDE6EDCEE6EDCEE6
      EDCEE6EDCEE6EDCEE5ECCEE6EDCDE6ECCEE6ECCEE6ECCEE5ECCEE5ECCBE5EDCB
      E4ECCBE4ECCCE5EDCCE4ECCCE5ECCBE4EDCBE4EDCBE4ECCCE5EDCBE5ECCBE5EC
      CBE5ECCBE5EDCBE5EDCBE5ECCBE5EDCBE5EDCBE5EDCBE4ECCCE5ECCBE4EDCBE5
      ECCBE5ECCBE4ECCBE5EDCBE5ECCBE4EDCBE5ECCBE4EDCBE4EDCBE5ECCCE4EDCB
      E4EDCBE5ECCBE5EDCBE4ECCCE5ECCBE5EDCCE5ECCBE5EDCBE4ECCBE4EDCBE4EC
      CBE5ECCBE5EDCBE4ECCCE4EDCBE4EDCBE5ECCCE4EDCBE4ECCCE4ECCCE4EDCBE4
      EDCBE5EDCBE5ECCBE4ECCBE4ECCCE4EDCCE4EDCBE5EDCBE5EDCBE5ECCBE4ECCB
      E4ECCBE4ECCBE5ECCBE4EDCBE5ECCBE4ECCBE4EDCBE4ECCBE4ECCBE4EDCBE5EC
      CBE5ECCBE4ECCBE5EDCBE5EDCCE5ECCBE4ECCCE4ECCBE5EDCBE4ECCCE4EDCBE5
      EDCBE4EDCCE5ECCBE5EDCBE5ECCBE4ECCBE5ECCBE4ECCBE4EDCBE4ECCBE4ECCB
      E5EDCCE5ECCBE4ECCBE4EDCBE4EDCBE4EDCBE5ECCBE5EDCBE5ECCBE4ECCBE5EC
      CBE4ECCBE4EDCCE5ECCCE4ECCBE5EDCBE5ECCBE5ECCBE4ECCBE5EDCBE4EDCBE4
      ECCCE4ECCBE4EDCBE5EDCBE4EDCBE4ECCBE4EDCBE5ECCBE5EDCBE4EDCBE5EDCB
      E5ECCCE4ECCBE4EDCCE4ECCBE5ECCBE5ECCBE4ECCBE5EDCCE4EDCBE5ECCBE4ED
      CBE5ECCBE4ECCBE4EDCCE4ECCBE5ECCBE5ECCCE5ECCCE5EDCBE4ECCBE5ECCBE4
      ECCBE5EDCCE4ECCBE5EDCBE5EDCBE4EDCCE4ECCBE5EDCCE4EDCBE5ECCBE4EDCB
      E5ECCCE4ECCBE5ECCCE5EDCBE5ECCBE4EDCCE5ECCBE5ECCBE4EDCBE5EDCCE4ED
      CBE5EDCCE4ECCBE4ECCBE5ECCBE4EDCBE5ECCBE4ECCBE4ECCBE4EDCBE5EDCBE4
      EDCBE4EDCCE5EDCBE5EDCBE4ECCBE5EDCBE5ECCCE4EDCBE5EDCBE4ECCBE4EDCB
      E5EDCCE4EDCBE5EDCCE5EDCBE4ECCCE4EDCBE3EDC8E3ECC8E3ECC8E3EDC9E3EC
      C8E3ECC9E3EDC9E3ECC9E3ECC8E3ECC9E3ECC8E3ECC9E3EDC9E3ECC8E3EDC9E3
      EDC8E3ECC8E3ECC9E3EDC8E3EDC8E3ECC9E3ECC9E3ECC9E3ECC9E3ECC9E3EDC8
      E3EDC9E3EDC9E3ECC8E3EDC8E3ECC9E3EDC8E3ECC9E3ECC8E3ECC8E3EDC8E3EC
      C8E3EDC9E3ECC9E3ECC8E3ECC8E3EDC8E3ECC9E3EDC9E3EDC9E3EDC8E3ECC9E3
      ECC8E3EDC9E3ECC8E3EDC8E3EDC8E3ECC9E3ECC8E3ECC9E3EDC8E3ECC8E3ECC8
      E3EDC8E3ECC9E4EDC8E3ECC8E3ECC8E3ECC9E3EDC8E3ECC8E3EDC8E3ECC9E3EC
      C9E3EDC9E3EDC8E4ECC9E4EDC9E3EDC8E3EDC8E3ECC8E3ECC8E3ECC9E3ECC9E3
      ECC9E3EDC9E3ECC9E3ECC8E3EDC9E3ECC8E3ECC9E3ECC8E3ECC8E3EDC8E3EDC8
      E3EDC9E3ECC8E3EDC8E3ECC8E3ECC9E3EDC8E3EDC8E3ECC8E3EDC8E3ECC8E3EC
      C8E3ECC9E3EDC8E3ECC8E3EDC9E3EDC8E3ECC8E3EDC9E3ECC9E3ECC8E3ECC9E3
      ECC9E3ECC8E3ECC8E3ECC8E3ECC8E3ECC8E4EDC8E3ECC8E3EDC8E3ECC9E3ECC9
      E3EDC9E3EDC9E3ECC9E3ECC9E3ECC9E3ECC9E3ECC9E3ECC8E3ECC8E3ECC8E3EC
      C8E3EDC8E3EDC8E3ECC9E3ECC9E3EDC8E3EDC9E3EDC8E3EDC8E3EDC9E3EDC8E3
      ECC9E3ECC8E3ECC9E3EDC8E3ECC8E3EDC8E3ECC8E3ECC8E3ECC8E3EDC9E3ECC8
      E3ECC8E3ECC8E3ECC8E3ECC8E3ECC8E3ECC8E3ECC8E3ECC8E3EDC8E3EDC8E3EC
      C9E3ECC9E3ECC8E3ECC9E3ECC8E3ECC9E3ECC9E3ECC9E3ECC9E3EDC8E3ECC8E3
      ECC9E3EDC8E3ECC9E3EDC8E3ECC8E3EDC8E3EDC8E3ECC9E3ECC8E3ECC9E3ECC8
      E3EDC9E3EDC9E4ECC9E3ECC9E3ECC8E3ECC8E3ECC9E3ECC8E3EDC9E3ECC8E3EC
      C8E3EDC9E3EDC9E3ECC9E2EDC6E1EDC6E1ECC5E2ECC6E1ECC5E2ECC5E2ECC6E2
      EDC6E1ECC6E1ECC5E1ECC6E2ECC5E2ECC5E2EDC6E2ECC6E1ECC6E2ECC6E2ECC5
      E1ECC6E2ECC6E2ECC6E2EDC5E2ECC5E2ECC6E1EDC6E2EDC6E1ECC6E1ECC5E2ED
      C6E1ECC6E1ECC6E2EDC5E1ECC6E2EDC5E2ECC5E1ECC6E1EDC6E2EDC5E2EDC5E2
      ECC6E2ECC6E1ECC5E2ECC6E1EDC5E1ECC6E2ECC5E2ECC5E1ECC5E1ECC5E2ECC6
      E1EDC5E2ECC6E1ECC6E2EDC5E1ECC5E2ECC5E1EDC5E1ECC6E1ECC6E2ECC6E1EC
      C6E2EDC6E2EDC6E1EDC5E2ECC6E1ECC5E1ECC6E2ECC5E2ECC5E2ECC5E2ECC5E1
      ECC6E1ECC6E1ECC6E2EDC5E2EDC6E1ECC5E2ECC5E2EDC5E2ECC6E2ECC6E1ECC6
      E2ECC6E2ECC6E2ECC5E2ECC6E2ECC6E2ECC6E2ECC6E2ECC5E2EDC6E1ECC6E1EC
      C6E2EDC5E2ECC6E1EDC5E2ECC5E2ECC6E2EDC6E2EDC5E2ECC6E2EDC5E2ECC6E2
      ECC6E1ECC5E2EDC5E2ECC5E1EDC6E1ECC6E1ECC5E1ECC5E1ECC6E2ECC5E2ECC5
      E2ECC5E2ECC5E2EDC5E1EDC5E1EDC6E2ECC6E2EDC6E2ECC6E2EDC6E2EDC5E1EC
      C5E2ECC6E2ECC6E2ECC6E1ECC6E2ECC6E2ECC6E1ECC6E2EDC5E2ECC6E2ECC5E1
      ECC5E2ECC5E1ECC6E1ECC6E1EDC5E2ECC5E1EDC5E1EDC6E1EDC5E1EDC5E2ECC6
      E2ECC5E1ECC5E2ECC5E2EDC5E2ECC5E2EDC5E1EDC6E1EDC5E1ECC6E1ECC6E2EC
      C6E2ECC5E2EDC5E2ECC6E1ECC5E1ECC6E2EDC5E1ECC6E2EDC6E2ECC6E1EDC5E2
      ECC6E2ECC6E1ECC5E2ECC6E2ECC6E2ECC5E2EDC6E1EDC6E1ECC6E1ECC5E2EDC6
      E1EDC5E2ECC6E2ECC6E2EDC5E2EDC5E2ECC5E2ECC5E1ECC5E2ECC5E1ECC6E2EC
      C5E2ECC5E2EDC5E1ECC6E1ECC5E2ECC5E2EDC6E2EDC5E1ECC5E2EDC6E1EDC5E2
      EDC6E0ECC2E0ECC2E1ECC2E0ECC2E0ECC3E0EDC3E0EDC2E0ECC2E0EDC3E0EDC3
      E0ECC3E0EDC2E0ECC3E0ECC2E0EDC2E0EDC3E0ECC3E0ECC3E0ECC3E1ECC2E0EC
      C3E0ECC3E0ECC3E0EDC2E0ECC3E0EDC3E0EDC2E0ECC2E1ECC2E0EDC2E0ECC2E0
      ECC2E0ECC3E0EDC3E0ECC3E0EDC3E0ECC3E0ECC3E0ECC2E0ECC3E0ECC3E0ECC3
      E0ECC3E0ECC3E0ECC3E0ECC2E0ECC2E0ECC3E0EDC3E0ECC2E0ECC3E0EDC3E0EC
      C3E0ECC3E0ECC3E1ECC3E1EDC2E0ECC3E0ECC3E0ECC2E0ECC2E0EDC3E0ECC2E0
      ECC3E0ECC2E0EDC3E0ECC3E0EDC3E0ECC2E0ECC3E0ECC3E0EDC3E0ECC3E0ECC3
      E1EDC3E0EDC3E1EDC3E0EDC2E0EDC3E0ECC2E0EDC2E0EDC3E0ECC3E0EDC3E0EC
      C3E1EDC2E0EDC2E0EDC3E0ECC3E0ECC2E0ECC2E0ECC3E0ECC3E0ECC2E0ECC2E0
      ECC3E0EDC3E1ECC3E0ECC2E0ECC2E0EDC3E0EDC2E0ECC2E0ECC3E0EDC2E0ECC3
      E0ECC2E0ECC2E0EDC3E0ECC2E0ECC2E0ECC2E0ECC2E0ECC3E1ECC3E0ECC3E0EC
      C3E0ECC2E0ECC3E0EDC2E0ECC2E0EDC3E1ECC2E0EDC2E0ECC2E0EDC3E0ECC3E0
      ECC3E0EDC3E0ECC2E0EDC2E0ECC2E0ECC3E0ECC2E1ECC2E0ECC3E0ECC2E0EDC3
      E0ECC3E0EDC3E0ECC3E0EDC2E0ECC2E0EDC2E0EDC3E0ECC2E0ECC3E0ECC3E0ED
      C3E0ECC3E0ECC2E0ECC2E0EDC2E0ECC3E0ECC3E0EDC2E0ECC2E0ECC2E0ECC3E0
      EDC3E0EDC3E0ECC3E0EDC3E1ECC2E0ECC2E0ECC3E0ECC3E0ECC3E0EDC3E0ECC2
      E0ECC3E0ECC3E0ECC3E0EDC2E0ECC2E0EDC2E0ECC2E0ECC2E0ECC3E0ECC2E0EC
      C2E0EDC3E0ECC2E1ECC3E0EDC2E0ECC3E0ECC3E0ECC2E0ECC3E0EDC2E0ECC2E0
      ECC2E0ECC2E0ECC2E0EDC2E0ECC2E0ECC3E0ECC3E0EDC3E0ECC2DFEDC0DFECC0
      DFEDBFDFECBFDEECC0DFECC0DFECC0DFECBFDFECBFDFEDBFDEECC0DFEDBFDEEC
      C0DFEDC0DFECBFDFECC0DEECBFDFECC0DEECC0DEECC0DEECBFDEEDBFDFECC0DF
      ECBFDEECC0DEECC0DEECC0DFECC0DEECC0DEEDC0DFEDBFDEEDC0DFECC0DFECBF
      DEECBFDFECC0DFECC0DFECC0DFECC0DEECBFDFEDC0DFECBFDFECBFDEECC0DFED
      C0DEECC0DFEDC0DEECC0DEECBFDFECC0DEECBFDEECC0DFECC0DFECC0DFEDBFDF
      ECC0DFECC0DFECC0DEECBFDEECC0DFECC0DEECC0DEECC0DFECC0DEECC0DFEDBF
      DFECC0DEECC0DFECC0DEECBFDEEDBFDEECC0DEECC0DEECC0DFECC0DEECC0DFED
      C0DEECC0DFECC0DEEDC0DFEDBFDFECC0DEECC0DFECC0DFECC0DFECC0DFEDC0DE
      ECC0DFECC0DEECBFDFECBFDEECC0DFEDBFDFEDC0DFECC0DFECC0DEECBFDEECBF
      DEEDBFDEECC0DFECC0DEECC0DFEDBFDFECC0DFECC0DEECBFDEECBFDEECC0DEED
      C0DFECC0DFEDC0DEECC0DEECBFDEECC0DFECC0DEECC0DFECBFDFECC0DEECC0DE
      EDBFDFECBFDEECBFDEECC0DFECC0DEECC0DFEDC0DFEDBFDFECC0DFECC0DEECC0
      DFECBFDEECC0DEECBFDFECC0DFECC0DEEDC0DEECC0DFECC0DFEDC0DFECC0DEED
      C0DEECBFDFECC0DEECBFDEECC0DFEDBFDEECBFDFECC0DFECC0DEECC0DEEDC0DF
      ECC0DFECC0DFECC0DEECC0DFEDBFDEECC0DEECC0DFECC0DEEDC0DFEDC0DFEDC0
      DFECC0DEECC0DEECBFDFECC0DFECC0DEEDBFDFECC0DFECC0DFEDC0DFEDC0DFEC
      C0DEECC0DFEDC0DFECC0DEECBFDEECC0DEECC0DEECBFDEEDBFDEEDBFDEECC0DE
      EDC0DEECC0DEECC0DFEDC0DFECBFDFECBFDFECC0DEECC0DFECC0DFECC0DFECC0
      DEECBFDEECC0DEECC0DEECC0DFEDC0DFECC0DDECBDDDECBDDDEDBDDDECBCDDEC
      BDDDECBDDDECBCDDECBCDDECBDDDECBDDDECBCDDECBDDDECBDDDECBDDDEDBDDD
      ECBCDDECBCDDECBCDDECBCDDECBDDDECBDDDECBDDDECBDDDECBDDDECBDDDECBD
      DDECBCDDECBDDDECBDDDECBDDDEDBDDDECBCDDECBDDDECBCDDECBCDDECBDDDEC
      BDDDECBCDDECBDDDECBDDDECBDDDECBDDDECBCDDECBDDDECBDDDECBDDDECBDDD
      ECBDDDECBDDCECBDDDECBDDDECBCDDECBDDDECBDDDECBCDDECBDDDECBDDDECBC
      DDECBDDDECBCDDECBCDDECBCDDECBDDDEDBDDDECBCDDECBDDDECBDDDECBDDDEC
      BDDDEDBDDDECBDDDECBDDDECBDDDECBCDDECBDDDEDBDDDECBDDDECBCDDECBCDD
      EDBDDDECBDDDECBDDDECBCDDECBDDDECBDDDECBDDDECBDDDECBDDDECBDDDECBD
      DDEDBDDDECBDDDECBCDDECBCDDECBDDDECBCDDECBCDDECBCDDECBDDDECBDDDEC
      BDDDEDBCDDECBDDDECBDDDECBCDDECBCDDECBCDDECBCDDECBDDDECBCDDECBCDD
      ECBCDDEDBCDDECBCDDECBDDDECBDDDECBDDDECBDDDECBDDDECBCDDECBCDDECBC
      DDEDBCDDECBCDDEDBCDDECBCDDECBDDDECBDDDEDBDDDECBCDDECBDDDECBDDDEC
      BDDDECBDDCECBCDDECBCDDECBCDDECBCDDEDBCDDECBCDDECBCDDECBDDDECBCDD
      ECBDDDECBDDDECBCDDECBCDDECBCDDEDBDDDECBCDDECBDDDECBDDDECBCDDECBD
      DDECBDDDECBCDDECBCDDEDBCDDEDBDDDECBCDDECBDDDECBDDDECBCDDECBDDDEC
      BDDDECBDDDEDBCDDECBCDDECBDDDECBDDDECBDDDECBDDDECBDDDECBDDDECBDDD
      EDBCDCEDBCDDECBDDDECBDDDEDBDDDECBCDDEDBDDDECBDDDEDBCDDECBCDDECBC
      DDECBDDDECBDDDECBDDDEDBCDDECBCDDECBCDDECBDDDECBCDDECBCDDECBCDDED
      BDDDECBCDDECBCDDECBDDCECB9DBECBADBECB9DBECBADBECB9DBECBADCECB9DC
      EDBADCECB9DBECBADBECB9DBECB9DBECBADCECB9DCECBADCECBADBECB9DCECB9
      DBECBADBECB9DCECBADBECB9DCECBADBECB9DCECB9DBECBADBECBADBECB9DCEC
      BADBECBADCECBADBECB9DBECBADBECB9DCEDBADBECBADCECB9DBECBADBECBADB
      ECBADCECB9DBECB9DBECB9DBECB9DCECBADCECBADBECBADCECBADBECBADCECB9
      DCECBADCECBADBECBADBECB9DCECBADBECB9DBECBADCEDBADBECB9DCECBADCEC
      B9DCECB9DBECB9DCECB9DBECBADBECBADBECB9DCEDBADBECBADBECBADBECBADB
      ECB9DCECB9DBECBADBECB9DBECBADCECB9DCECBADBECBADBECBADCECBADBECB9
      DBECB9DCECBADBECB9DBECB9DBECBADCECB9DBECBADBECBADBECB9DBECB9DBEC
      B9DBECBADBECBADBECBADBECBADCECBADBECB9DCECBADBECB9DBECB9DCECBADB
      ECBADCECBADBECB9DBECBADBECBADCECBADCECBADBECBADBECBADBECBADBECB9
      DBECB9DBECBADBECBADCECB9DBECB9DCECBADCEDBADCECBADBECB9DBECB9DCEC
      BADCECB9DBECBADBECBADBECB9DBECBADBECB9DBECBADBECBADBECB9DBECB9DB
      ECBADBECBADBECBADBECB9DBECBADCECB9DBECB9DCEDBADBECBADBECB9DCECBA
      DCECB9DCECBADCECBADBECB9DCEDB9DBECB9DCECBADCECB9DBECBADCECB9DCEC
      BADBECBADBECB9DBECBADBECB9DBECBADBECB9DBECBADBECBADCECBADBECBADC
      ECBADCECBADCECBADBECBADCECBADBECB9DCECBADBECB9DCECBADBECB9DBECBA
      DCECBADBECBADBECBADCECBADCECB9DCECB9DBECBADBECB9DCECBADBECB9DBED
      B9DBECB9DBECBADCECBADBECBADBECBADCECB9DCECB9DCECBADBECBADCECB9DC
      ECBADAECB6DAECB7DAECB6DAECB7D9ECB6D9ECB7D9ECB7DAECB6D9ECB7D9ECB6
      DAECB6DAECB6D9ECB6DAECB6DAECB6DAECB6D9ECB7DAECB7DAECB6DAECB6DAEC
      B7DAECB7DAEBB7DAECB6DAECB6DAECB6D9ECB6DAECB6DAECB7DAECB6DAECB7D9
      ECB7DAECB6DAECB6DAECB6DAECB6DAECB7DAECB7D9ECB6DAECB6DAECB6DAECB6
      DAECB6DAECB7DAECB7DAECB7DAECB7DAECB7D9ECB6DAECB6DAECB7DAECB6DAEB
      B7DAECB7DAECB6DAECB6D9ECB7DAECB7DAECB6DAECB6D9ECB7DAECB6DAECB6DA
      ECB7DAECB6DAECB6DAECB6DAECB7D9ECB6DAECB6DAECB6DAECB6DAEBB6DAECB6
      DAECB6DAECB6D9ECB6DAECB6DAECB7DAECB6DAECB6DAECB7DAECB6DAECB6D9EC
      B6D9ECB7DAECB6DAECB6DAECB6DAECB6DAECB6DAECB6DAECB7DAECB6DAECB7D9
      ECB6DAECB7DAECB6DAECB6DAECB7DAECB6D9ECB6D9ECB7DAECB6DAECB6DAECB6
      DAECB6D9ECB7DAECB6D9ECB6DAECB7DAECB6D9ECB6DAECB7D9ECB6DAECB7DAEC
      B7D9ECB6DAECB7DAECB6DAECB7D9ECB7DAECB7DAECB6DAECB6DAECB6DAECB6D9
      ECB6DAECB7DAECB6DAECB6DAECB6DAECB6DAECB6DAECB6DAECB7D9ECB7DAECB7
      DAECB7DAECB6DAECB6DAECB7DAECB6DAECB7D9ECB6D9ECB6DAECB7DAECB7DAEC
      B6DAECB7DAECB6DAECB6DAECB6DAECB7DAECB6D9ECB6DAECB6DAECB7DAECB7DA
      ECB6DAECB7DAECB6DAECB6DAECB6DAECB7DAECB6DAECB7DAECB7D9ECB6DAECB7
      DAECB7DAECB6DAECB7D9ECB6D9ECB6DAECB7DAECB6DAECB6DAECB6D9ECB7DAEC
      B7DAECB6DAECB6DAECB6DAECB6DAECB7D9ECB7DAECB7DAEBB7DAECB7DAECB6DA
      ECB6DAECB6DAECB6DAECB6DAECB6DAECB7DAECB7DAECB7DAECB6D9ECB3D9ECB4
      D8ECB4D8ECB3D9ECB4D8ECB3D8ECB3D8ECB3D8ECB4D8ECB4D8ECB3D8ECB4D8EC
      B3D9ECB3D8ECB3D8ECB3D9ECB3D9ECB4D8ECB4D8ECB3D8ECB3D8ECB4D9ECB3D8
      ECB3D8ECB3D8ECB4D8ECB3D9ECB3D8ECB3D8ECB3D8ECB3D8ECB3D8ECB4D8ECB3
      D8ECB3D8ECB3D8ECB3D8ECB4D8ECB4D8EBB4D8EBB4D8ECB3D9ECB4D8ECB3D8EC
      B4D9EBB3D8ECB3D8ECB3D8EBB3D8ECB3D9ECB3D8ECB3D8ECB3D8ECB4D8ECB3D9
      ECB3D8ECB3D8ECB3D8ECB3D8ECB4D8ECB3D8ECB4D8ECB3D8ECB3D8EBB3D8EBB4
      D8ECB4D8ECB3D8ECB4D8ECB4D8ECB3D8ECB3D8ECB4D8ECB3D8ECB3D9ECB4D9EB
      B4D8ECB3D8ECB3D8ECB4D8ECB4D8ECB3D8ECB3D8ECB4D9ECB3D9EBB4D9ECB3D8
      ECB3D8ECB3D8ECB4D9ECB4D8ECB4D8ECB3D8ECB3D9ECB4D8ECB3D8EBB3D8ECB4
      D8ECB3D8ECB4D8ECB4D8ECB4D9ECB3D8ECB4D8ECB3D8ECB3D8ECB3D8ECB3D9EC
      B4D9ECB3D8ECB3D8ECB4D8ECB3D8ECB3D9EBB4D8ECB4D8ECB3D8ECB3D8ECB4D8
      ECB3D9ECB4D9ECB3D8ECB3D8ECB3D8ECB3D8ECB3D8ECB3D9ECB3D8ECB3D9ECB4
      D8ECB4D8ECB3D8EBB3D8ECB4D8ECB3D8ECB3D8ECB3D8ECB4D8ECB3D9ECB3D8EC
      B3D9ECB3D9ECB3D8ECB3D9ECB4D9ECB3D8ECB3D9ECB3D8ECB4D8ECB3D9ECB3D8
      ECB3D8ECB4D8ECB3D8EBB3D8EBB3D8ECB3D8ECB3D8ECB3D8ECB3D9ECB4D8ECB3
      D8ECB3D8ECB3D8ECB3D8ECB3D9ECB3D8ECB3D8ECB4D9ECB4D8ECB4D9ECB4D8EC
      B3D8ECB3D8ECB3D8ECB3D8ECB3D9EBB3D8EBB4D8ECB3D9ECB3D8ECB4D8ECB4D9
      ECB3D8ECB3D8ECB3D8ECB3D8ECB3D8ECB3D8ECB3D9ECB4D8ECB3D8ECB3D9ECB3
      D8ECB3D8EBB3D9ECB4D8ECB3D8ECB3D9EBB4D6ECB0D6ECB0D7ECB0D6ECB0D7EC
      B0D7ECB0D7ECB0D7ECB0D7EBB0D7ECB0D6ECB0D7ECB0D7ECB0D7EBB0D7ECB0D7
      EBB0D6ECB0D6ECB0D6EBB0D6EBB1D6EBB0D7ECB0D7EBB0D7ECB0D7EBB0D6ECB0
      D7ECB0D6ECB0D6EBB0D6EBB0D7ECB0D7ECB0D6ECB0D6ECB0D6ECB0D7ECB0D6EB
      B0D7ECB0D7ECB0D7ECB0D7ECB1D6ECB0D6ECB0D7ECB0D6ECB0D7ECB0D7ECB0D7
      ECB0D7ECB0D7ECB0D7ECB0D6ECB0D7ECB1D7EBB0D7ECB0D6EBB0D7ECB0D6ECB0
      D7ECB0D7ECB0D6ECB0D7ECB0D7ECB0D7ECB0D7ECB0D7EBB0D7ECB0D7ECB0D6EB
      B0D6ECB0D6ECB1D7ECB0D6EBB0D7ECB0D7ECB0D6EBB0D6EBB0D7ECB0D6ECB0D6
      ECB0D7EBB0D6ECB0D6ECB0D6ECB0D6ECB0D6EBB0D7ECB0D6ECB0D7ECB0D6EBB0
      D7ECB0D7ECB1D7ECB0D6ECB0D6ECB0D7ECB0D6EBB0D6EBB0D6ECB0D6EBB0D6EC
      B0D7EBB0D6ECB0D7EBB0D6ECB0D6EBB0D6ECB0D6ECB0D6ECB0D6ECB0D6ECB0D6
      ECB0D7ECB0D6ECB0D7ECB0D7ECB0D7ECB0D7EBB0D7ECB0D7ECB0D7ECB0D6ECB0
      D6EBB0D6ECB0D6EBB0D6ECB0D6ECB0D6ECB0D7ECB0D6ECB0D6EBB0D7ECB0D6EC
      B1D6ECB0D7ECB0D7EBB0D6EBB0D6ECB0D6ECB0D6ECB0D7ECB0D7EBB0D7EBB0D7
      EBB0D7ECB0D7ECB0D6ECB0D7EBB0D6ECB0D7ECB0D6ECB0D7ECB0D7ECB0D6ECB0
      D6EBB0D7ECB0D7ECB0D6ECB0D7EBB0D6ECB0D7EBB0D7ECB0D7ECB0D7ECB0D6EC
      B1D6ECB0D6ECB0D6ECB0D7ECB0D7ECB0D7ECB0D7ECB0D7ECB0D6ECB0D6EBB0D7
      ECB0D6EBB0D7ECB0D7ECB0D6ECB0D7ECB0D7ECB0D6ECB0D6ECB0D7EBB0D7ECB0
      D7ECB0D6ECB0D6ECB0D6EBB0D6ECB0D7EBB0D6ECB0D7ECB0D7ECB0D6ECB0D7EC
      B0D6ECB0D6EBB0D7ECB0D5ECADD5ECADD4ECADD5EBADD5ECACD5ECACD5ECADD5
      EBADD5ECACD5EBADD5ECACD5ECADD5ECADD5ECADD5ECADD5ECADD5ECADD5ECAD
      D5ECADD5EBADD4EBADD5ECADD5ECADD5EBADD5ECADD5ECADD5EBADD5ECADD5EB
      ADD5ECADD5EBADD5ECADD5EBADD5ECADD5ECADD4EBACD5ECADD5EBADD5EBADD5
      ECADD5EBADD5EBADD5ECADD5ECADD5EBADD5ECADD5EBACD5EBADD5EBADD5EBAC
      D4ECADD5ECADD5ECADD5ECADD5ECADD4EBADD4ECACD5EBADD5EBADD5ECADD4EC
      ADD5ECADD5ECACD5ECADD5ECADD4EBADD5ECADD5ECADD5ECADD5ECACD5EBADD5
      ECADD4ECADD4EBADD5EBACD5ECACD5EBADD5ECADD4ECADD5ECADD5ECADD5ECAD
      D5ECADD5EBADD4EBADD4ECADD5EBADD5ECACD5ECACD5ECACD5ECADD5ECACD5EB
      ADD5ECADD5EBACD5EBADD5ECADD5ECADD5ECADD5EBADD5EBACD5ECADD5ECADD5
      ECADD5ECADD5EBADD5ECADD5EBADD5ECACD5ECACD5ECACD5ECACD5EBADD5EBAD
      D5EBADD5EBADD5ECADD5ECADD5ECADD5ECADD5ECADD5ECADD5ECADD5EBADD5EC
      ADD5EBADD5ECACD4ECADD5ECADD5ECADD5ECADD5EBADD5EBADD5ECADD5EBADD5
      EBADD5ECADD5EBADD5ECADD5ECADD5ECADD5EBACD5EBADD5ECADD5ECADD5ECAD
      D5ECADD5ECACD5ECACD5EBADD5ECADD5ECADD5ECACD5EBACD5ECADD5EBADD5EB
      ADD5ECADD5ECADD5ECADD5ECADD5EBADD5EBADD5ECACD5EBADD5ECADD5ECADD5
      ECADD5ECADD5ECADD5ECADD5ECADD5ECACD5EBADD5ECADD5EBADD5ECADD5EBAD
      D5ECADD5ECADD5ECADD5ECADD5ECADD5ECADD5ECADD5EBADD5ECACD5EBADD5EC
      ADD5ECADD5ECADD5ECADD5ECADD5ECADD5ECADD5EBADD5ECACD5EBADD5ECADD5
      ECADD4ECA9D4ECA9D4EBA9D3EBA9D4EBAAD3ECAAD4ECAAD4ECA9D3EBAAD3ECA9
      D3ECA9D4ECAAD3ECAAD4ECAAD3ECAAD4ECAAD3EBAAD3ECA9D3ECAAD4EBA9D4EC
      AAD4ECAAD3ECAAD4ECAAD3EBA9D4EBAAD4ECAAD3ECA9D3ECA9D3ECA9D3ECAAD3
      ECA9D3EBA9D3ECAAD4ECA9D3EBAAD3EBA9D3ECA9D4ECAAD3ECAAD3ECAAD3ECA9
      D3ECAAD3ECAAD4ECA9D3EBA9D3EBAAD4ECA9D3ECAAD3EBAAD3EBA9D3ECA9D3EB
      A9D4ECAAD3EBA9D3ECA9D3ECA9D3EBA9D3ECA9D3ECA9D3ECA9D3ECA9D3ECAAD4
      EBA9D3ECA9D3EBA9D3ECAAD3EBAAD3ECA9D3ECA9D3ECA9D3EBAAD3ECAAD3EBA9
      D3ECAAD4ECA9D3EBA9D3EBAAD3ECAAD3ECAAD3ECA9D4EBA9D3EBAAD3EBAAD3EC
      AAD3EBAAD3ECAAD4ECAAD3ECA9D3EBA9D3EBA9D3ECA9D3ECA9D3ECA9D3EBAAD3
      EBAAD3ECA9D3EBA9D3ECAAD3EBA9D3ECA9D3EBAAD4ECAAD3ECA9D3ECAAD3EBA9
      D3ECA9D3ECAAD3EBA9D3ECA9D3EBA9D3EBA9D4EBAAD3EBAAD3EBA9D3ECA9D3EB
      AAD3ECAAD3ECA9D3ECA9D3EBAAD4ECAAD4ECAAD3ECAAD3ECAAD3ECAAD3EBAAD4
      ECA9D3EBAAD3EBA9D3EBA9D3ECA9D4ECA9D3EBAAD3ECA9D3ECA9D3ECAAD3EBA9
      D3ECA9D3EBAAD3ECA9D3ECA9D4ECAAD4ECA9D3ECA9D3EBAAD3ECA9D3EBAAD3EC
      AAD3EBA9D3ECA9D3ECAAD3ECA9D3ECA9D3ECA9D3ECAAD3ECAAD3ECAAD4EBAAD3
      ECAAD4EBAAD3ECAAD4EBAAD3ECAAD3ECA9D3ECA9D3ECA9D4EBA9D3ECA9D3ECAA
      D3ECA9D3EBAAD3EBA9D3EBAAD3ECAAD3ECA9D4EBAAD3ECA9D3EBA9D4ECA9D3EC
      AAD3ECAAD3ECAAD3ECAAD3ECA9D4ECAAD3EBA9D3ECA9D4ECAAD3EBA9D3EBA9D3
      ECA9D3ECA9D3ECAAD3EBA9D3ECAAD3EBAAD3ECAAD3EBA9D3ECAAD1EBA6D2EBA6
      D1ECA6D1ECA7D2ECA6D1EBA6D2EBA6D2ECA6D1EBA6D2ECA6D2ECA6D1ECA6D2EB
      A6D2ECA6D1ECA6D2ECA7D1ECA6D2ECA7D1EBA6D2ECA6D2ECA6D1ECA6D2ECA6D2
      EBA6D1ECA7D2ECA6D2ECA6D1ECA6D2ECA6D1ECA6D2EBA6D2ECA6D1ECA7D2EBA6
      D1ECA6D2ECA6D2ECA6D1EBA6D1EBA6D2EBA6D1ECA6D1EBA6D1ECA6D2ECA6D1EB
      A7D2ECA7D2EBA6D1ECA6D2ECA7D1ECA7D1EBA6D1ECA6D1ECA6D2ECA6D2ECA6D1
      ECA6D1ECA6D1EBA7D1EBA6D1EBA6D2ECA6D2ECA7D1ECA6D1ECA6D1ECA6D1ECA7
      D1EBA7D2EBA7D2ECA6D1ECA6D1ECA6D2EBA6D2ECA6D1ECA6D1EBA6D1ECA6D1EB
      A6D2ECA6D1ECA6D1EBA6D2ECA7D1EBA7D1ECA6D2ECA6D1ECA6D2ECA6D2EBA6D2
      ECA7D2ECA6D2ECA7D1ECA6D1EBA6D1ECA6D1EBA6D2ECA6D2EBA6D2ECA7D1ECA6
      D1EBA7D1ECA7D1EBA6D2EBA6D2ECA6D1ECA7D2ECA6D1ECA6D2ECA6D1ECA6D2EB
      A6D2EBA6D2EBA6D2EBA6D2EBA6D1ECA6D1EBA7D1ECA6D2EBA7D2EBA6D1EBA7D1
      EBA6D1ECA6D1ECA7D2ECA7D1ECA6D2ECA6D2ECA6D2ECA6D1EBA6D2EBA7D2ECA6
      D2EBA7D1EBA6D2EBA6D1EBA7D2ECA6D1EBA6D1ECA6D1EBA6D2ECA6D1EBA7D2EC
      A6D1EBA6D1ECA6D2ECA6D2EBA6D1ECA6D2ECA6D1EBA6D2ECA6D1EBA7D2ECA6D1
      EBA6D1EBA7D1EBA6D1ECA6D1ECA6D2ECA6D1ECA6D2ECA7D2ECA6D2ECA6D2EBA6
      D1ECA7D2ECA6D2EBA6D2ECA6D2EBA6D1ECA6D1ECA6D2ECA7D1EBA6D1ECA6D1EC
      A6D2ECA6D2EBA7D2ECA6D2ECA6D1ECA7D1ECA7D2EBA6D1ECA6D1ECA7D2ECA6D1
      ECA6D2ECA6D1EBA6D2EBA7D1EBA6D1ECA6D2ECA6D1EBA6D1ECA6D2ECA6D1ECA6
      D1ECA6D1EBA7D2EBA6D2ECA6D1ECA7D1EBA6D0ECA3D0EBA3CFEBA3D0EBA3CFEB
      A2CFECA3D0EBA3D0EBA3D0ECA2D0EBA3D0EBA3D0EBA2D0ECA3CFEBA3D0ECA3D0
      EBA3D0ECA3D0EBA3D0ECA3D0ECA3D0EBA3D0ECA3D0ECA3D0ECA3D0ECA3D0EBA3
      D0ECA3D0EBA3D0EBA3D0EBA2D0EBA3D0EBA3D0ECA3D0EBA3CFECA3D0ECA3D0EC
      A3D0ECA3D0ECA3D0EBA3D0EBA3D0EBA3CFECA3CFEBA3D0EBA3D0EBA2D0ECA2D0
      EBA3D0ECA2D0ECA2D0EBA3CFECA3D0ECA3D0ECA3D0EBA3D0EBA3D0EBA2D0ECA3
      D0ECA3D0ECA3D0ECA3CFEBA3D0ECA3D0EBA3D0EBA3CFEBA3CFEBA3CFEBA3D0EB
      A3D0EBA2D0ECA3D0EBA3D0ECA3D0ECA3CFEBA2CFECA3D0EBA3D0ECA3D0ECA3D0
      EBA3D0EBA3D0ECA2D0EBA3D0EBA3D0ECA3D0ECA3D0EBA3CFECA3D0ECA3D0ECA3
      CFEBA2D0ECA2D0EBA3D0EBA3D0EBA3D0ECA3D0ECA3D0ECA3D0EBA3D0ECA3D0EC
      A3D0ECA3CFECA3D0ECA3D0ECA3CFEBA3CFEBA3D0ECA3D0ECA2D0ECA2D0EBA3D0
      EBA3D0ECA3CFECA3D0ECA3CFECA3CFECA3D0ECA3D0EBA3CFECA3D0ECA3D0EBA3
      D0ECA3CFECA3D0ECA3CFECA3D0EBA3CFECA3CFEBA3D0ECA3D0ECA3D0EBA3CFEC
      A2D0EBA3CFEBA3D0ECA3D0ECA3D0EBA3D0ECA3D0ECA3D0EBA3CFECA3D0EBA3D0
      ECA3D0ECA3D0ECA2CFECA3D0ECA3CFEBA3D0ECA2D0EBA3D0EBA3D0ECA3CFEBA3
      CFEBA2CFEBA3D0EBA3CFECA3CFECA3D0ECA3D0EBA3D0ECA3D0EBA3D0EBA3D0EC
      A3D0EBA3D0EBA3D0ECA3CFEBA3D0ECA3D0EBA3CFECA3CFECA3CFEBA3D0EBA3D0
      ECA2D0EBA3D0EBA3D0ECA3D0ECA3D0ECA3CFEBA3D0EBA3D0ECA3D0EBA3D0ECA3
      D0ECA2D0EBA3D0EBA3CFEBA3D0ECA3D0EBA2D0ECA2D0ECA2CFEBA3D0EBA3D0EB
      A3D0EBA3CFEBA3D0EBA3CEEBA0CEEBA0CEEB9FCEECA0CEEB9FCEEB9FCEECA0CE
      ECA0CEEB9FCEEBA0CEEB9FCEECA0CEECA0CEEB9FCEEBA0CEECA0CEEB9FCEEB9F
      CEEC9FCEECA0CEEBA0CEEB9FCEEB9FCEEBA0CEEC9FCEEC9FCEECA0CEEBA0CEEB
      A0CEEBA0CEEBA0CEEBA0CEEB9FCEEC9FCEEB9FCEEBA0CEEBA0CEEBA0CEEB9FCE
      ECA0CEEBA0CEEBA0CEEB9FCEEB9FCEEC9FCEEB9FCEEBA0CEEB9FCEEB9FCEEC9F
      CEEB9FCEEBA0CEEC9FCEEBA0CEEB9FCEEB9FCEEC9FCEEC9FCEEBA0CEEB9FCEEC
      9FCEECA0CEEBA0CEECA0CFEB9FCFEC9FCEEB9FCEEBA0CEEB9FCEEBA0CEEB9FCE
      EB9FCEEB9FCEEB9FCFECA0CEEBA0CEEC9FCEEBA0CEECA0CEECA0CEEBA0CFEBA0
      CFEB9FCEEB9FCEEC9FCEEBA0CEEB9FCEEBA0CEEB9FCEEB9FCEEBA0CEEB9FCEEB
      9FCEEBA0CEEC9FCEEC9FCEEB9FCEEBA0CEEB9FCEEBA0CEECA0CEEB9FCEECA0CE
      EB9FCEEBA0CEEC9FCEEBA0CEECA0CEEB9FCEEB9FCEECA0CFECA0CEEBA0CEEC9F
      CEEBA0CEEBA0CEEBA0CEEB9FCEECA0CEEC9FCEEB9FCEEBA0CEEB9FCEEB9FCEEC
      A0CEEB9FCEEB9FCEEBA0CEEC9FCEEBA0CEEBA0CEEB9FCEEC9FCEEC9FCEECA0CE
      EBA0CEECA0CEEB9FCEEB9FCEEBA0CEEB9FCEEC9FCEEB9FCFEBA0CFEBA0CEEB9F
      CEECA0CEEBA0CEEB9FCEEC9FCEEC9FCEEBA0CEECA0CEEB9FCEECA0CEEB9FCEEB
      A0CEEB9FCFEB9FCEEBA0CEEB9FCEECA0CEEB9FCEEB9FCEEBA0CEEB9FCEEC9FCE
      ECA0CEEB9FCEECA0CFEC9FCEEBA0CEEBA0CEEBA0CFEBA0CEEC9FCEEC9FCEEC9F
      CEEB9FCEEC9FCEEB9FCEEBA0CEEBA0CFEB9FCEEB9FCEEB9FCEEB9FCEEBA0CEEB
      A0CEECA0CEEB9FCEEBA0CEEBA0CEEBA0CEEBA0CEECA0CEEB9FCEEC9FCEEBA0CE
      EC9FCCEB9CCCEB9CCCEB9CCCEC9CCCEC9CCCEB9CCCEB9CCCEC9CCDEC9CCCEB9C
      CCEB9CCCEC9DCCEB9CCDEC9CCDEC9CCCEB9CCCEC9CCDEC9CCDEB9CCDEB9CCCEB
      9CCDEC9CCDEB9CCDEB9CCCEB9CCCEC9CCCEC9CCDEB9CCCEB9CCCEB9CCCEB9CCC
      EC9CCCEB9CCCEB9CCCEB9CCCEB9CCDEB9CCDEB9CCDEB9CCDEB9CCCEB9CCDEB9C
      CCEB9CCCEC9CCCEC9CCCEB9CCCEB9CCCEB9CCCEB9CCDEC9CCCEB9CCDEC9CCCEB
      9CCCEB9CCDEC9CCCEB9CCDEB9CCCEB9CCCEC9DCDEB9CCCEB9CCCEB9CCCEC9CCC
      EB9CCCEB9DCDEB9CCDEB9CCCEB9CCCEB9CCCEB9CCDEC9CCCEB9CCCEC9CCDEC9C
      CCEC9CCCEB9CCDEC9CCDEB9CCCEC9CCDEB9CCCEB9CCCEB9DCDEB9CCDEB9CCCEC
      9DCDEB9CCCEC9CCCEB9CCCEB9CCDEB9CCCEB9CCDEC9CCDEC9CCCEB9CCCEC9CCC
      EC9CCCEB9CCDEC9CCCEC9CCDEB9CCDEB9CCCEB9CCCEB9CCDEB9CCDEC9CCCEC9C
      CCEB9CCDEB9CCDEB9CCCEC9CCCEB9CCDEC9CCCEC9CCCEB9CCCEB9CCDEB9CCCEC
      9CCDEB9CCCEB9CCCEB9CCDEB9CCCEB9CCCEB9CCCEC9CCCEB9CCCEB9CCDEB9CCC
      EB9CCDEC9CCDEC9CCCEB9CCCEC9CCDEC9CCDEB9CCCEB9CCDEB9CCCEC9DCCEB9C
      CDEB9CCCEC9CCCEB9CCDEC9CCCEB9CCDEB9CCDEB9DCCEB9CCDEC9CCCEB9CCDEB
      9DCCEB9CCDEB9DCCEB9CCCEC9CCDEB9CCCEB9CCCEB9CCCEB9CCCEB9CCCEB9CCC
      EB9DCCEB9CCDEC9CCDEB9CCCEC9CCDEB9CCDEC9CCCEB9CCCEB9CCDEC9CCCEC9C
      CDEB9DCCEC9CCCEC9CCCEC9CCCEB9CCCEC9CCDEB9CCCEC9CCDEB9CCDEB9CCCEB
      9CCCEB9CCCEB9CCCEB9CCDEC9CCCEB9CCCEB9DCCEB9CCCEB9CCDEB9CCCEC9CCD
      EC9CCDEB9CCDEC9CCCEC9CCCEB9CCCEB9CCCEC9CCCEC9CCCEC9CCBEC98CBEC99
      CBEB99CBEB99CAEB98CBEC98CBEB99CBEB99CBEB99CAEB99CBEB99CBEB98CAEB
      99CBEB98CAEB99CBEB99CAEB98CBEB99CBEC99CAEC99CBEB99CBEB98CBEB98CA
      EB99CAEB99CAEB99CBEB98CBEB98CBEB98CBEB98CAEB99CBEB99CBEB99CBEB99
      CBEB99CBEB99CBEB98CAEC99CBEC99CBEB99CBEB98CAEB99CAEC98CBEB98CBEB
      99CBEB99CBEB99CBEB98CBEB99CBEC99CAEB98CAEB99CAEC98CBEC99CBEB98CA
      EB98CAEB98CAEB98CAEB99CAEB99CBEB99CAEB98CBEB99CAEB99CBEB98CAEB99
      CBEB98CAEC99CBEB98CBEB99CBEC99CBEC99CBEC99CBEB99CBEB98CAEC98CBEB
      98CAEB99CAEB99CAEC99CBEB98CBEB99CBEB98CAEC98CBEB99CBEC99CBEB98CA
      EB98CBEB98CBEB98CAEB99CAEB99CBEC98CBEB99CBEB99CAEB99CBEC99CAEB98
      CBEB98CBEC99CBEB99CAEB99CBEC99CAEB99CBEB98CAEC99CAEC98CBEB99CBEC
      98CAEB98CBEB99CAEB99CBEB99CAEB99CAEB98CBEB99CAEB99CAEB99CBEB99CA
      EC99CBEB99CBEB98CBEB99CBEB99CAEB99CBEC98CBEB98CBEB99CAEB98CAEB98
      CAEC98CBEB99CBEB99CAEB98CBEB99CBEB98CBEB98CBEB98CAEB99CAEC98CAEB
      99CBEB99CBEC98CBEC99CBEB99CAEB99CBEB99CAEC98CBEB98CAEB99CBEC99CB
      EB98CBEB99CBEB98CBEC99CAEB99CAEC98CBEC99CBEB98CBEC99CBEB99CBEB99
      CAEB99CAEB99CBEB99CBEB99CBEB98CAEC99CBEB99CAEC99CBEC99CBEC98CBEB
      98CBEB99CAEB98CBEC99CBEB99CAEB98CAEC99CBEB98CBEC99CBEB99CAEB99CA
      EC99CBEC99CBEB99CBEC99CAEB99CBEB98CBEB99CAEB99CAEC99CBEB99CBEC99
      CAEB99CBEB99CAEB98CBEB99CAEB99CBEB99C8EB95C9EB95C9EB95C9EB95C9EB
      96C8EB95C9EB95C9EB95C9EB95C9EB95C9EB95C8EC95C9EB95C9EC95C8EB95C9
      EB95C9EB95C9EB95C9EC96C9EB95C8EB95C9EB95C9EB96C9EB95C9EC95C9EB95
      C9EB95C8EC95C8EC95C9EB95C9EB95C8EB95C9EB95C9EC95C9EB95C9EB95C9EB
      96C9EB95C9EB96C9EB95C9EB95C9EB95C9EB95C9EB95C8EB95C8EC95C9EB95C9
      EB95C9EC95C8EB95C9EB95C9EB95C9EC95C9EB95C9EB95C8EB95C9EB95C9EB95
      C9EB95C8EB96C9EB95C9EB95C9EB95C9EB96C9EB95C9EC95C9EB95C9EB95C9EB
      95C9EB95C9EC95C9EB95C9EB95C9EB95C9EB96C9EB95C9EB95C9EC96C9EB95C8
      EC95C9EB95C9EB95C8EC95C9EB96C9EB95C9EB95C9EC95C9EB95C8EB95C9EB95
      C9EB95C9EB96C9EC96C9EC95C8EB96C9EB96C9EB96C8EB95C9EB95C9EB96C9EB
      95C8EB96C9EB95C9EB95C9EB95C9EB96C9EB95C9EB96C8EB95C9EC95C8EB95C9
      EC95C9EB96C9EB95C9EB96C9EC96C9EB95C9EB95C9EB95C9EB95C9EB95C9EB95
      C8EB96C9EB95C9EB95C9EB95C9EC95C9EB95C8EB95C9EB95C8EB95C9EB95C9EB
      95C9EB96C9EB95C9EB96C9EB95C9EC95C9EB95C9EB95C9EB95C8EB95C9EB96C9
      EB96C9EB95C9EB95C9EB95C9EB95C8EB96C8EC95C9EB95C9EB95C9EB96C9EB95
      C8EB96C9EB96C9EB95C8EB95C9EB95C9EB95C9EB96C9EB95C9EC95C8EC95C9EB
      95C9EB95C9EB96C8EB95C9EC96C9EB95C9EB95C9EB96C9EB96C9EB95C9EB96C9
      EB95C9EB96C9EB95C8EB95C9EB95C9EB95C9EB95C9EB95C9EB96C9EC95C9EB95
      C8EB95C9EB95C9EC95C9EB95C9EB95C9EC95C9EB95C9EB95C8EB95C9EB95C9EB
      95C9EB95C9EB95C9EB95C7EB92C7EB92C7EB92C7EB91C8EB92C7EB91C7EB92C7
      EB91C7EB92C7EB91C7EB91C7EB92C7EB92C7EB91C7EB92C8EB92C7EB91C7EB92
      C7EB92C8EB92C7EB92C8EB92C7EB92C7EB91C7EB92C7EB92C7EB91C8EB91C7EB
      92C7EB92C7EB92C7EB92C7EB92C7EC92C7EB92C7EB92C7EB91C7EB92C7EB92C7
      EB92C7EB92C7EB92C7EB92C8EB91C7EB92C7EB92C7EB91C7EB92C7EB92C7EB92
      C7EC92C7EB92C7EB92C7EB92C7EB92C7EB92C7EB92C7EB92C7EC92C7EB92C7EB
      92C8EB92C8EB92C7EC92C7EB91C7EC92C7EB92C8EB91C7EB92C7EB92C7EB91C7
      EB92C7EB92C7EB92C7EB92C7EC92C7EB92C7EB92C8EB92C8EB92C7EB92C7EB92
      C7EB92C7EB91C7EB92C8EC92C7EB92C7EB92C7EB91C7EB91C7EC92C7EB92C7EB
      92C7EB92C7EB92C7EB91C7EB91C7EB92C7EB92C7EB92C7EB92C7EC92C7EB92C7
      EB92C7EB92C7EB91C7EB91C7EB92C7EB92C7EB92C7EB92C7EB91C8EB92C7EB92
      C7EB92C7EB92C7EB92C7EB92C7EB92C7EB92C8EB92C7EB92C7EB91C7EB92C7EB
      92C7EB92C7EB92C7EB92C7EB92C7EB92C7EB91C7EB91C8EB91C7EB92C7EC92C7
      EB92C7EB92C7EB92C7EB92C7EB92C7EB92C7EB92C7EB91C8EB91C7EB92C7EB92
      C7EB92C7EB92C7EB92C7EB91C7EB92C7EB92C7EB92C7EB91C7EB92C7EB92C8EB
      92C7EB92C7EB92C7EB91C7EB92C7EB92C7EB92C7EB92C7EB92C7EB92C7EB92C7
      EB92C7EB92C7EB92C7EB92C7EB92C7EB92C7EB92C7EB92C7EB92C7EB92C7EB92
      C7EB92C7EB92C7EB92C7EB92C7EB91C7EB92C7EB92C7EB91C8EB92C7EB92C7EB
      92C7EB92C7EB92C8EC92C7EB92C7EB92C8EB92C7EB91C7EB92C7EB92C7EB92C7
      EB91C5EB8FC6EB8FC5EB8EC6EB8EC6EB8EC5EB8EC5EB8EC5EB8FC5EB8EC5EB8E
      C5EB8EC5EB8EC5EB8EC6EB8EC5EB8FC5EB8FC5EB8FC5EB8EC5EB8FC5EB8FC6EB
      8EC5EB8EC6EB8FC6EB8EC6EB8FC6EB8EC5EB8EC5EB8FC5EB8FC5EB8FC6EB8FC5
      EB8EC6EB8EC5EB8EC6EB8EC5EB8EC5EB8EC5EB8EC5EB8EC5EB8EC5EB8EC5EB8F
      C5EB8EC5EB8FC5EB8EC6EB8FC5EB8EC6EB8EC5EB8FC5EB8FC5EB8EC5EB8EC5EB
      8EC5EB8EC6EB8EC5EB8EC5EB8EC5EB8EC6EB8EC6EB8EC5EB8FC5EB8FC6EB8EC6
      EB8EC5EB8EC5EB8FC5EB8EC5EB8EC5EB8FC5EB8FC5EB8EC5EB8EC5EB8EC5EB8E
      C5EB8EC6EB8EC6EB8EC5EB8EC6EB8EC6EB8FC6EB8EC6EB8EC5EB8EC5EB8EC6EB
      8FC5EB8EC5EB8EC5EB8EC5EB8FC5EB8FC5EB8EC5EB8EC5EB8EC5EB8FC5EB8EC6
      EB8EC6EB8FC5EB8FC5EB8EC6EB8EC6EB8EC5EB8EC5EB8FC5EB8FC5EB8EC5EB8E
      C6EB8EC6EB8EC5EB8EC5EB8EC5EB8EC5EB8EC5EB8EC5EB8EC5EB8EC5EB8EC6EB
      8EC5EB8EC6EB8FC5EB8EC5EB8EC5EB8EC6EB8EC5EB8EC5EB8EC5EB8EC5EB8EC5
      EB8EC5EB8EC6EB8FC5EB8EC6EA8EC6EB8EC5EB8FC5EB8EC5EB8EC6EB8FC5EB8E
      C5EB8EC5EB8EC5EB8EC5EB8FC5EB8FC5EB8FC5EB8EC6EB8EC5EB8EC6EB8EC5EB
      8EC5EB8EC5EB8EC5EB8EC5EB8EC6EB8EC6EB8EC6EB8EC5EB8EC5EB8EC5EB8FC5
      EB8FC5EB8EC6EB8EC5EB8EC5EB8FC6EB8EC5EB8EC5EB8EC5EB8FC5EB8EC6EB8E
      C5EA8EC5EB8EC5EB8EC6EB8FC5EB8EC5EB8EC6EB8EC5EB8EC5EB8EC6EB8EC5EB
      8EC5EB8FC5EB8EC6EB8EC5EB8EC5EB8EC6EB8EC5EB8EC6EB8EC5EB8EC5EB8EC5
      EB8EC5EB8FC5EB8EC5EB8EC5EB8FC5EB8FC5EB8EC5EB8EC5EB8EC4EB8BC4EB8B
      C4EB8BC4EB8BC4EA8BC3EA8BC4EB8BC3EB8BC3EB8BC4EB8BC3EB8BC4EB8BC3EB
      8AC3EB8BC3EA8BC4EB8BC4EB8BC3EB8AC4EB8AC4EB8AC4EB8BC3EB8BC4EB8BC3
      EB8BC4EB8BC4EB8BC3EA8BC4EB8BC3EB8BC4EB8BC3EB8BC3EB8BC3EB8BC4EA8B
      C3EB8BC4EB8BC4EA8BC3EB8AC3EB8BC3EB8BC4EB8BC4EB8BC3EB8BC4EB8BC4EB
      8BC4EB8BC3EB8BC3EB8BC3EB8BC4EB8BC4EB8BC4EB8BC3EB8BC3EB8BC4EB8BC3
      EB8BC4EB8BC4EB8BC3EB8BC3EB8BC4EB8BC3EA8BC4EB8BC4EB8BC3EB8BC4EB8B
      C3EB8BC4EB8BC4EB8BC4EB8BC4EB8BC3EB8BC3EB8BC3EB8BC3EA8BC4EB8AC4EB
      8BC3EB8BC4EB8BC4EB8BC4EB8BC4EB8AC4EB8AC4EA8BC3EB8BC3EB8BC3EB8BC3
      EB8BC4EB8AC3EB8BC4EB8BC3EB8BC3EA8AC3EB8BC4EB8BC3EB8BC3EB8AC4EB8A
      C4EB8AC4EB8BC3EB8BC3EB8BC4EB8BC3EB8BC3EB8BC4EB8BC4EB8BC3EB8BC3EB
      8BC4EB8BC3EB8BC3EB8BC4EA8AC3EB8BC4EA8BC4EB8BC3EB8AC4EB8BC4EB8BC4
      EB8BC3EB8BC3EB8BC3EB8BC3EB8BC4EA8BC3EB8BC3EB8BC3EA8BC4EB8BC3EB8B
      C3EB8BC4EB8BC3EB8BC3EB8BC4EB8BC3EB8AC3EB8AC4EB8AC3EB8BC3EB8BC3EB
      8BC3EB8BC4EB8BC4EB8BC4EB8BC3EB8AC4EA8AC3EB8BC3EB8BC4EA8BC3EB8BC3
      EA8BC3EB8AC4EB8AC4EB8BC4EB8AC4EB8BC4EB8BC3EB8BC4EB8BC3EB8BC4EB8B
      C3EB8BC3EB8AC4EB8BC3EB8BC4EB8BC3EB8BC3EB8BC3EB8BC3EB8BC4EB8BC3EB
      8BC3EB8AC4EB8BC3EB8BC4EA8BC3EA8BC3EB8BC4EB8BC4EB8BC3EB8BC4EB8AC3
      EB8BC4EB8AC3EB8BC4EB8BC3EB8BC4EB8AC4EB8BC4EB8BC4EB8AC3EB8BC3EA8B
      C3EB8BC3EB8BC3EB8BC4EB8BC4EA8BC4EB8BC2EA88C2EA87C2EA87C2EB87C2EB
      88C1EB88C2EB87C2EB88C2EB87C2EB88C2EB88C1EA87C2EB87C1EB87C1EB87C2
      EB88C2EB88C1EB87C1EB87C2EB88C1EB87C2EB87C1EB87C2EB87C1EB87C2EB87
      C2EB87C1EB88C1EB87C1EB88C2EB87C2EB88C2EB87C1EB87C2EB87C2EB88C2EB
      88C2EB87C1EB87C2EB87C2EB88C2EB87C2EB88C2EB87C1EB87C2EA88C2EB87C1
      EB87C2EA88C1EB87C1EB87C2EB87C2EB88C2EB87C2EB88C2EB88C2EB88C2EB87
      C1EB87C2EB87C2EB87C2EA88C2EB87C2EB88C2EB87C2EB88C1EB88C2EB87C2EB
      87C2EB88C2EB87C2EB87C1EB87C2EB88C2EB87C1EA87C2EB87C2EB87C2EB87C2
      EB88C2EB87C1EB87C2EA88C1EA87C2EA87C2EB88C2EB87C2EA88C2EA88C2EB87
      C2EB87C2EB88C2EB87C2EB87C1EA88C2EB87C2EB87C2EB87C1EB87C1EB88C1EB
      87C2EB87C2EB87C2EB87C2EA87C2EB87C2EB88C2EB87C1EB88C2EA87C2EA87C2
      EA88C2EA87C2EB87C2EB87C1EB87C2EB87C2EB88C2EB88C1EA87C2EB87C2EB87
      C2EB87C1EB88C1EB87C2EB87C1EA87C2EB87C1EB87C2EB87C1EB87C1EB88C2EB
      88C1EB88C2EB88C2EB87C1EB87C2EB87C2EB88C1EB87C2EB87C1EA87C2EB88C1
      EA88C2EB87C2EB87C2EB87C2EB87C2EB87C1EB88C2EB88C2EB87C2EB87C2EB87
      C1EB87C2EB88C2EB87C2EB87C2EA88C2EB87C1EB87C2EA87C2EB87C2EB87C2EB
      88C2EB87C2EB87C2EB87C2EB88C2EB88C2EA88C2EA87C2EB88C2EB87C2EA87C2
      EB88C1EB87C2EB87C1EB87C2EA87C2EA88C2EB87C2EA88C2EA88C2EB87C2EB88
      C2EB87C2EA88C1EB88C2EB87C2EA87C2EB88C2EA87C1EA87C1EB88C2EB88C2EB
      87C2EB87C2EB88C2EB87C0EA84C0EA84C0EA84C0EB84C0EB84C0EB84C0EA84C0
      EB84C0EB84C0EB84C0EB83C0EB84C0EB84C0EB83C0EB84C0EA84C0EB84C0EA84
      C0EA84C0EA84BFEA83C0EA84C0EB84C0EA84C0EB84C0EB83C0EA84C0EA83C0EB
      84C0EB84C0EA84C0EB84C0EB84C0EB83C0EB84BFEB84C0EA84C0EA84C0EB83C0
      EB84C0EB84C0EB84C0EB83C0EA84C0EB84C0EB84C0EB84C0EB84C0EA84C0EB84
      C0EB84C0EB84C0EB84C0EB83C0EB84C0EB84C0EB83C0EA84C0EB84C0EB84C0EB
      84C0EA84C0EB84C0EB84C0EA83C0EA83C0EA83C0EB84C0EB84C0EB84C0EB83C0
      EA84C0EB84C0EB84C0EB84C0EB84C0EA84C0EB84C0EA84C0EA83C0EB84C0EB84
      C0EB84C0EA84C0EA84C0EB83C0EB84C0EB84C0EA84C0EA84C0EA84C0EB84C0EA
      84C0EB84C0EB84C0EA83C0EB84C0EA84C0EB84C0EB84BFEB84C0EB83C0EA84C0
      EB84C0EA84C0EB84C0EB84C0EB84C0EB84C0EB84C0EB84C0EA84C0EB84C0EB84
      C0EB84C0EB84C0EB84C0EB83C0EB84C0EB83C0EA84C0EB84C0EA84C0EA84C0EB
      84C0EB84C0EB83C0EB83C0EB84C0EA84C0EB83C0EB83C0EB83C0EB84C0EB84C0
      EA84C0EB83C0EB84C0EB84C0EA84C0EB83C0EB84C0EB84C0EB84C0EB84BFEB84
      C0EA84C0EB84C0EB84C0EB84C0EB84C0EA84C0EB84C0EB84C0EB84C0EB84C0EB
      84C0EB84C0EB84C0EB84C0EB83C0EA84C0EB84BFEB84C0EB83C0EB84BFEB84C0
      EB84C0EB84BFEB84C0EA83C0EB84C0EB84C0EA84C0EB84C0EB84C0EB84C0EA84
      C0EB84C0EA83C0EB83C0EB83C0EB84C0EA84C0EB84BFEB84C0EA84C0EA83C0EB
      84C0EB84C0EB84C0EB83C0EB84C0EA83C0EB84C0EB84C0EB84C0EA84C0EB84C0
      EB84BEEB80BFEB80BEEB80BEEA80BEEA80BEEB80BEEA80BEEB80BEEB80BEEA80
      BEEB80BEEA80BEEB81BEEB80BEEA80BEEA80BEEB80BEEB81BEEB81BEEA80BEEB
      81BEEA81BEEB81BFEB80BEEB81BEEA80BEEB81BEEA80BFEB81BEEB80BEEA81BF
      EA81BFEA81BEEB81BEEA80BEEB80BFEA80BFEB80BEEB80BEEA81BEEB80BEEA81
      BEEB80BEEA80BEEB80BEEB80BEEB80BFEB80BEEB80BEEB81BEEB80BEEB80BEEB
      80BEEA80BFEB80BEEA80BEEB81BEEA80BEEB80BEEB81BEEB80BEEB81BEEB80BE
      EA80BEEA81BEEB80BFEB80BEEB80BEEA80BFEA81BEEA80BEEB80BEEB80BFEB81
      BEEB80BFEB80BEEA80BEEB80BFEB80BEEB81BEEB80BEEB80BEEB80BFEB80BEEA
      80BEEB80BEEB80BEEA81BEEA81BEEB80BEEB80BFEA80BEEB81BEEB80BEEB81BF
      EB80BEEA81BEEA80BEEA80BEEA80BEEB80BEEB80BEEB80BEEB80BEEB80BEEB80
      BEEB81BEEA81BEEB80BEEB80BEEB81BFEB81BEEA80BEEB81BEEA80BEEA80BEEB
      80BEEB80BEEA81BEEB80BEEB80BEEB81BEEB81BFEA80BEEB81BEEB80BEEB80BE
      EB80BEEB80BEEB80BEEB80BEEB81BEEA81BEEB80BEEB80BEEB80BEEB80BEEB81
      BEEA80BEEB80BFEB81BEEA80BEEA80BEEB80BFEB80BEEA81BEEB81BEEB80BEEB
      81BEEB81BFEB80BEEB80BEEB81BEEB81BFEA81BEEB81BFEB80BEEB80BEEA81BF
      EA80BFEB80BEEB80BEEB80BEEA81BEEB80BEEB80BEEB81BEEB81BEEB81BEEB80
      BEEB80BFEB80BEEB80BEEA80BEEA80BEEB80BEEA80BEEA80BEEA80BEEB80BEEB
      81BEEB81BFEA80BEEB80BEEB80BEEA80BEEA81BEEA80BEEA80BEEB81BEEA80BE
      EA80BEEA80BFEA80BEEA80BEEB80BEEB80BEEB81BEEB80BEEB81BCEA7CBDEB7C
      BCEB7DBCEB7DBCEA7DBDEA7DBDEB7DBDEA7DBCEA7DBCEB7CBCEA7DBDEB7DBCEA
      7DBDEA7DBCEB7DBCEA7DBCEB7DBCEB7DBCEB7DBCEB7DBDEA7DBCEA7CBDEB7DBD
      EA7DBDEB7DBDEA7CBCEA7DBDEB7DBCEB7CBCEB7DBDEB7DBCEA7DBCEB7DBDEA7D
      BDEB7DBCEA7CBCEA7DBDEB7DBCEB7CBCEB7CBDEB7DBCEB7DBDEA7DBDEA7CBCEA
      7DBCEB7CBCEA7CBDEB7DBDEB7DBCEB7DBCEB7CBDEB7DBCEB7DBCEB7DBDEA7DBD
      EA7DBCEB7DBDEA7DBCEA7CBDEB7DBCEB7CBCEB7CBCEB7DBCEA7DBDEA7CBDEA7D
      BCEB7DBCEB7DBCEB7DBCEB7CBDEB7DBDEA7CBDEA7DBCEB7DBCEA7DBCEA7CBDEA
      7DBCEB7DBCEB7CBCEB7DBCEA7DBCEA7DBCEB7DBCEA7DBCEB7DBCEA7DBCEB7DBC
      EA7DBDEB7DBDEA7DBCEB7DBDEA7CBCEA7DBDEB7DBCEA7DBCEB7DBCEB7CBDEA7D
      BCEA7DBCEB7DBCEA7DBCEB7DBDEA7DBCEB7CBCEA7CBCEA7DBCEB7DBCEB7DBDEA
      7DBCEB7DBCEB7DBDEB7CBCEA7CBCEB7DBCEA7CBDEB7DBCEB7DBDEA7CBCEB7DBC
      EB7DBCEB7CBCEA7CBCEA7DBCEA7DBCEA7DBDEB7DBDEB7DBDEB7DBCEB7DBCEB7D
      BCEA7CBCEB7DBDEB7DBCEB7DBCEA7DBCEB7DBCEA7DBCEB7CBDEB7DBCEA7DBCEB
      7DBDEA7DBDEA7DBCEA7DBCEA7DBCEB7DBCEB7DBCEA7CBDEB7DBCEB7DBCEB7DBC
      EB7DBCEA7DBCEA7CBDEB7DBCEA7DBDEB7DBCEA7DBCEA7CBCEB7DBCEB7DBDEB7D
      BCEA7DBCEA7DBDEB7DBCEA7DBCEA7DBDEB7CBCEA7DBDEB7DBCEB7DBCEA7DBCEA
      7CBCEA7DBCEB7DBCEB7DBCEB7DBCEB7DBCEB7DBCEA7DBCEB7DBCEA7CBDEA7DBC
      EB7DBDEB7DBCEB7DBCEA7DBCEB7DBDEB7CBDEB7DBCEB7DBCEB7CBCEB7DBCEB7C
      BDEA7DBCEA7CBCEB7DBCEB7CBCEA7DBCEA7DBBEA79BBEB79BBEB7ABAEB7ABBEA
      7ABBEB79BAEA79BBEA79BAEA79BBEA7ABAEB79BAEB7ABBEA79BAEA79BAEB7ABA
      EA7ABBEB79BBEB7ABBEB79BAEA79BBEA79BAEB7ABAEB79BBEA79BAEA79BBEB79
      BBEA79BAEA79BBEA79BBEB79BAEA79BAEA7ABAEA79BBEB79BBEA7ABAEA79BAEA
      79BBEA7ABBEB79BBEA7ABBEA79BBEB7ABAEA79BBEB7ABAEA79BBEA79BBEA7ABB
      EA79BBEB79BBEB79BAEB79BAEB79BBEB79BAEA79BBEA7ABAEA79BBEA79BAEA79
      BAEB7ABAEB7ABAEA7ABBEA79BBEB7ABAEB79BAEA7ABAEB79BAEA79BBEB79BAEB
      79BAEA7ABAEA79BBEB7ABBEA79BBEA79BBEB79BAEA79BAEA7ABBEB79BBEA79BA
      EA79BAEB79BAEA7ABBEB79BAEA79BAEB7ABBEA7ABAEB79BBEB79BBEA79BBEB79
      BAEB79BBEB79BAEB79BBEA79BBEA7ABBEA79BAEA79BAEB79BAEB79BBEA79BBEA
      79BBEB79BAEB7ABAEB79BAEA79BBEA7ABBEA7ABBEA7ABBEA79BAEB79BAEA79BB
      EB79BBEB79BBEA7ABBEA7ABAEA79BBEA79BBEB7ABBEB79BAEA7ABBEB7ABBEB79
      BBEA79BBEB79BAEB79BAEB79BAEB7ABBEB79BAEB79BBEA7ABBEA79BAEB7ABBEA
      79BAEB79BAEB79BAEA7ABBEA7ABAEB79BBEB79BBEA79BBEA79BAEB79BBEA79BB
      EA79BAEB79BBEA79BAEA79BBEA7ABBEB79BBEA79BAEA7ABBEB79BBEB79BAEA79
      BBEA79BBEA79BBEA79BAEA79BBEA7ABAEB79BAEA79BBEA7ABBEB79BAEA79BBEA
      79BBEA79BBEB79BAEA7ABBEA79BAEA79BAEA7ABBEA79BAEA79BAEB7ABBEA79BB
      EB79BBEA7ABBEB79BBEA7ABBEA79BAEB7ABBEA79BBEA79BBEB7ABAEA79BAEA79
      BBEA79BAEA7ABBEB7ABBEB79BBEA79BAEB79BAEA79BAEA79BBEB7ABBEA7ABAEB
      79BBEB79BBEB79BBEB7AB9EA75B9EB76B9EA76B8EA76B9EB75B8EA76B9EB76B9
      EA76B9EB76B9EA76B9EA76B8EA76B9EA76B9EB76B9EA76B9EB75B8EB76B8EA76
      B9EA75B9EB76B9EA76B8EA76B8EB76B8EB75B8EA76B9EA76B9EB75B9EA76B8EA
      76B9EA76B9EA75B9EB76B9EA76B9EA76B9EB76B8EB75B9EA76B9EA76B9EA76B8
      EA76B9EA75B8EA76B9EA75B9EB75B9EA76B9EB76B9EA76B9EA76B9EA76B9EA76
      B9EA76B9EA76B9EA75B9EB76B9EA75B8EB76B9EA76B8EA76B9EA75B9EB76B9EB
      75B9EB76B9EA76B9EA76B9EB75B8EA76B9EB76B9EB75B9EA76B9EA75B8EB76B9
      EA76B8EB76B9EB76B9EA76B9EA76B9EB76B9EB75B9EB76B8EB76B9EA75B9EA76
      B9EB76B9EB76B8EA76B9EB76B9EB76B9EA76B9EA75B9EB76B9EB76B9EA76B9EB
      76B8EA76B9EA76B8EA76B9EB76B9EA75B9EB76B9EB75B9EA75B9EA76B9EB76B8
      EA76B9EA76B9EA76B9EB75B9EA76B9EA75B9EA76B9EA76B9EA76B9EA76B9EB76
      B9EA76B9EA76B9EA76B9EA76B9EB75B9EB76B8EB75B8EB76B9EA76B9EB76B9EA
      75B9EB76B8EA76B9EA75B9EA76B8EA76B9EA76B9EA75B9EA76B9EA76B9EB76B9
      EA76B9EA76B9EA76B9EA76B9EA76B8EB76B9EA75B9EB76B9EA76B9EA75B8EA76
      B8EB76B9EB75B9EA76B9EB75B9EB76B9EA76B9EA75B9EB76B9EA76B8EB75B9EB
      75B8EB76B9EA76B8EA76B9EB75B9EB76B9EB76B9EA76B9EB76B8EA75B8EB75B9
      EA75B9EA76B9EA76B9EB76B9EB76B8EB75B9EA75B8EA76B9EB76B9EA76B8EB76
      B9EB76B9EA76B9EB76B9EB76B9EB76B9EA75B9EB76B9EA76B9EA75B9EA76B9EA
      75B9EB76B8EA76B9EB75B8EB76B9EA75B8EA76B8EB76B9EB76B9EA76B9EA76B9
      EB76B7EA73B7EB72B7EA72B7EB72B7EA73B7EA72B7EB72B7EA72B7EA72B7EA73
      B7EA73B7EB72B7EB72B7EA72B8EA72B7EB72B7EB72B7EA73B7EA73B7EA72B7EB
      72B7EA72B7EA72B7EA72B7EA72B7EB72B7EA72B7EA72B7EA73B7EA73B7EB73B7
      EA72B7EA72B7EA73B7EA73B7EA72B7EA73B7EA72B7EB72B7EA72B7EA72B7EA72
      B7EA73B7EA72B7EA73B7EB73B7EA73B7EA72B7EA73B7EA73B7EA72B7EA72B7EA
      73B7EA72B7EB73B7EB73B7EB73B7EB72B7EA72B7EA72B7EA72B7EA73B7EA72B7
      EB72B7EA72B7EB72B7EA72B7EA73B7EA73B7EA72B7EB72B7EA72B7EA73B7EA72
      B7EB73B7EA72B7EA72B7EA73B7EA72B7EA73B7EA73B7EA73B7EA72B7EA72B7EA
      73B7EB73B7EA72B7EA73B7EA72B7EA72B7EA72B7EA73B7EA73B7EA72B7EA72B7
      EA73B7EB73B7EB73B7EA72B7EA72B7EB73B7EA72B8EA73B7EB72B7EA72B7EA72
      B7EA73B7EB72B7EA73B7EA72B7EA73B7EA73B7EB73B7EB72B7EB72B7EA73B7EA
      72B7EA72B7EA72B7EA72B7EB72B7EB72B7EA72B7EB72B7EA72B7EA73B7EB72B7
      EB72B7EA73B7EB72B7EA72B7EA73B7EB73B7EB73B7EA72B7EB73B7EA72B7EA73
      B7EA73B7EA72B7EA72B7EA72B7EA73B7EB73B7EA72B7EA73B7EA73B8EA72B7EA
      73B7EB73B7EA72B7EB72B7EA72B7EA72B7EA72B7EA72B7EA72B7EA73B7EA72B7
      EB72B7EB72B7EB73B7EA72B7EA73B7EB72B7EB72B7EA72B7EA73B7EA73B7EB73
      B7EA73B7EB73B7EB73B7EB73B7EA73B7EA73B7EA73B7EA72B7EA73B7EA72B7EA
      73B7EA72B7EA72B7EA72B7EA73B7EA72B7EA73B7EA72B7EA72B7EB72B7EB72B7
      EA72B7EB73B7EA73B7EA72B7EA73B7EA72B7EA73B7EA73B7EB72B5EA6FB5EA6F
      B5EA6FB6EB6FB5EB6FB5EA6FB5EB6FB5EA6FB5EA6FB5EB6EB5EA6FB5EA6FB5EA
      6FB6EA6FB5EB6FB5EA6FB5EA6FB5EB6FB5EA6FB5EA6FB5EB6FB5EA6FB6EA6FB5
      EA6FB5EA6FB5EA6FB5EB6FB6EA6FB5EB6FB5EB6FB5EA6FB6EA6FB5EA6FB5EA6F
      B5EA6FB5EA6FB5EA6FB5EA6FB5EA6EB5EA6FB6EB6FB5EA6FB6EB6FB5EB6FB5EA
      6FB5EA6FB5EA6FB5EA6FB5EA6FB6EA6EB5EA6FB5EA6FB5EA6FB5EA6FB5EA6FB5
      EA6FB6EA6FB5EB6FB6EA6FB5EA6FB6EA6FB6EA6FB5EA6FB5EB6FB5EB6FB5EA6F
      B5EA6EB5EA6FB5EA6FB5EA6FB5EA6FB5EA6FB6EA6FB5EA6FB6EA6FB5EA6FB5EA
      6FB5EB6FB5EA6FB5EA6FB5EB6FB6EA6FB6EA6FB5EA6FB5EA6FB5EA6FB5EA6FB5
      EA6FB5EB6FB5EA6FB5EB6FB5EA6FB5EA6EB5EB6FB5EA6EB6EA6FB6EB6FB5EA6F
      B5EB6FB6EA6FB5EA6FB5EA6FB5EA6FB6EA6FB5EB6FB5EB6FB5EB6FB5EA6FB5EA
      6FB5EA6EB5EA6EB5EB6FB6EA6FB5EA6FB5EB6FB6EA6FB5EA6FB5EA6EB5EB6FB5
      EA6FB6EA6FB5EA6FB5EB6FB5EA6EB5EB6FB5EA6FB5EA6EB5EA6FB5EB6FB5EA6F
      B5EA6FB6EA6FB6EA6FB5EB6FB6EA6FB6EA6EB5EB6FB6EA6FB5EB6FB5EA6FB5EA
      6FB5EA6FB5EA6FB6EA6FB5EA6EB5EA6FB5EA6FB5EA6FB5EB6FB5EA6FB5EA6FB5
      EA6FB6EA6FB6EA6FB5EA6FB5EA6FB5EA6FB5EA6FB5EB6FB5EA6FB5EA6FB6EB6F
      B5EB6FB5EB6FB5EA6EB5EB6EB5EA6FB5EB6FB5EA6FB5EA6EB5EA6FB5EB6FB5EA
      6FB5EA6FB6EA6FB5EA6FB5EA6FB6EA6FB5EB6FB5EA6FB5EA6EB5EA6FB6EA6FB5
      EB6FB6EB6FB5EA6FB5EA6FB5EA6EB5EA6FB5EA6FB6EA6FB5EA6EB5EA6EB5EA6F
      B5EB6FB5EB6FB5EA6FB5EA6FB5EB6FB5EA6FB3EA6BB3EA6BB4EB6BB4EA6CB3EA
      6BB4EA6CB4EA6BB4EA6BB3EA6CB3EA6CB4EA6BB3EA6BB3EA6CB3EA6CB3EB6BB4
      EA6BB3EA6CB4EA6BB3EA6BB4EA6CB3EB6CB4EA6BB3EA6BB4EA6CB4EA6BB3EA6B
      B4EA6CB3EA6BB3EA6BB4EA6CB3EA6CB4EA6CB3EA6BB3EA6CB3EA6BB4EA6CB4EA
      6BB3EA6CB4EA6BB4EA6BB4EA6BB4EA6CB3EA6CB4EA6BB3EA6BB3EA6BB4EA6BB3
      EA6BB3EA6CB3EA6BB4EB6BB3EA6CB4EA6BB4EA6CB4EA6CB3EA6BB4EA6BB4EA6C
      B4EA6BB4EA6CB3EA6BB4EA6CB3EA6BB4EA6CB4EA6BB3EA6BB3EA6BB3EB6BB3EA
      6BB4EA6CB4EA6BB3EA6CB4EA6BB4EA6CB4EA6BB4EA6BB3EA6BB3EA6BB4EA6CB4
      EB6CB3EA6BB4EA6CB3EA6CB3EA6CB3EA6CB3EA6BB4EB6BB4EA6BB4EA6BB3EA6C
      B3EA6BB4EA6CB4EA6CB4EA6CB4EA6BB4EB6BB4EB6CB3EA6BB4EA6CB4EA6CB3EA
      6CB4EA6BB4EA6BB4EA6CB3EA6BB3EA6CB3EA6BB4EB6BB4EA6BB4EA6BB4EA6CB4
      EA6BB4EA6CB3EA6CB3EB6CB4EA6BB3EB6BB3EA6BB3EA6BB4EA6BB4EA6CB4EA6B
      B4EA6CB4EA6BB4EA6BB4EA6BB3EA6BB3EA6BB3EA6CB4EA6CB3EB6BB3EA6BB3EA
      6CB3EA6CB3EB6BB3EA6BB4EA6CB4EA6BB3EA6BB4EA6CB4EA6CB4EA6BB3EA6CB4
      EB6CB3EA6CB4EA6BB3EA6BB3EA6BB3EA6CB3EA6BB3EA6CB3EA6BB3EA6BB3EA6C
      B3EA6BB4EA6BB4EA6CB3EA6CB3EB6BB4EA6BB3EA6CB3EA6BB3EA6BB3EA6CB3EA
      6CB4EA6BB3EA6BB4EA6BB4EA6BB4EA6CB3EA6CB3EA6CB4EA6BB3EA6CB3EA6CB3
      EA6BB3EA6BB3EA6CB3EA6CB4EA6BB3EA6CB4EA6BB3EA6BB4EB6BB4EA6BB4EA6C
      B3EA6BB4EA6BB3EB6CB3EA6BB4EA6CB3EA6CB3EA6BB3EA6BB3EA6CB3EA6CB4EA
      6BB3EB6CB4EA6BB3EA6CB2EA67B2EA68B1EB67B2EA68B2EA67B2EB68B2EA68B1
      EA68B2EA68B2EA68B2EA68B2EA68B1EA68B2EA68B1EA68B2EA68B2EA68B2EA68
      B1EA68B2EA67B2EA68B2EA68B2EA68B1EB68B2EA67B2EA68B2EA68B2EA68B2EB
      68B1EA68B2EA68B2EA68B1EA68B2EA68B2EA68B1EA68B2EA68B1EA68B2EA68B2
      EA68B2EB68B2EA68B2EB68B1EA68B1EA68B2EA68B1EA68B2EA68B2EA68B1EA68
      B2EA68B1EA68B2EA68B2EA68B1EA68B1EB68B2EA67B2EA68B2EA68B2EA68B2EA
      68B2EA68B2EB68B2EA68B2EA68B2EA68B2EA68B2EA68B1EA68B1EA68B2EA68B2
      EA68B1EA68B2EA68B2EA68B1EA68B1EA68B1EA68B1EA68B2EA68B1EB68B1EA68
      B1EA68B2EA68B2EA68B2EA68B1EA68B1EA68B2EA68B1EA68B2EA68B2EA68B2EA
      68B2EA68B2EA68B2EA68B2EA68B2EA67B2EA68B1EA68B2EA68B2EA68B2EA68B2
      EA68B2EA68B2EA68B2EA68B2EA68B2EA68B2EA68B2EA68B1EA68B2EA68B2EA68
      B1EA68B2EA68B2EA67B2EA68B1EA68B2EA68B1EA68B2EA68B1EA68B2EA68B2EA
      68B1EA68B2EB68B1EA68B2EA68B2EB68B2EB67B1EA68B2EA68B2EA68B2EA68B2
      EA68B2EA68B2EA68B1EB68B1EA68B1EA68B2EA68B2EB68B2EA68B2EA68B2EA68
      B2EA68B2EB68B1EA68B2EA68B2EA68B2EA68B1EA68B2EA68B2EA68B1EA68B2EA
      68B1EA68B2EA68B2EA68B2EA68B2EA68B1EA68B2EA68B2EA68B2EA68B2EA68B2
      EA68B2EA68B2EA68B2EB68B2EA68B1EA68B2EA68B1EA68B2EA68B1EA68B2EA68
      B2EA68B2EB68B2EB68B1EA68B1EA68B2EA68B2EA68B2EA68B2EA68B2EA68B2EA
      68B2EA68B1EA68B2EA68B2EA68B1EA68B2EA68B2EA68B2EA68B2EB68B1EA68B2
      EA68B0EA64AFEA64B0EA65B0EA64B0EA65B0EA65B0EA64B0EA65B0EA64B0EA65
      B0EA64B0EA64B0EA65B0EA65B0EA64B0EA65B0EA64B0EA64B0EA65B0EA64B0EA
      65B0EA65B0EA65B0EA65B0EA65B0EA64B0EA65B0EA65B0EA64B0EA65B0EA64B0
      EA64B0EA65B0EA65B0EA64B0EA64B0EA65B0EA65B0EA65B0E964B0EA64B0EA64
      B0EA64B0EA65B0EA65B0EA64B0EA64B0EA65B0EA64B0EA64B0EA65B0E964B0EA
      64B0EA64B0EA65B0EA64B0EA65B0EA64B0EA65B0EA64B0EA65B0EA64AFEA64AF
      EA65B0EA64B0EA65B0EA65B0EA65B0EA64B0EA65B0EA65B0EA65B0EA64B0EA65
      B0EA65AFEA64B0EA64B0E964B0EA64B0EA64B0EA65B0EA64B0EA64B0EA65B0EA
      65B0EA65B0EA64B0EA65AFEA65B0EA65B0EA65B0EA64AFEA64B0EA64B0EA64B0
      EA65B0EA65B0EA64B0EA65B0EA64B0EA65B0EA65B0EA65B0EA65B0EA64B0EA65
      B0EA64B0EA64B0EA65B0EA64AFEA65B0EA64B0EA64B0EA64B0EA65B0EA64B0EA
      65B0EA65B0EA64B0EA64B0EA64B0EA64B0EA64B0EA65B0EA64B0EA65B0EA65B0
      EA65B0EA65B0EA65B0E964B0EA65B0EA65B0EA64B0EA65B0EA64B0EA64B0EA64
      B0EA65B0EA64B0EA65B0EA65B0EA64B0EA64B0EA65B0EA64B0EA64B0EA65B0EA
      65B0EA65B0EA64B0EA64B0EA64B0EA65B0EA64AFEA64B0EA65B0EA65B0EA65B0
      EA65B0EA65B0EA64B0EA65B0EA65B0EA65B0EA65B0EA65B0EA65B0EA65B0EA64
      B0EA65B0E965B0EA65B0EA64B0EA65B0EA64B0EA64B0EA64B0EA64AFEA65B0EA
      65B0EA64B0EA64B0EA64B0EA65B0EA64B0EA64B0EA65B0EA64B0EA65B0EA65B0
      EA64B0EA65B0EA65B0EA65B0EA65B0EA64B0EA65B0EA65B0EA65AEEA61AEEA61
      AEEA62AEEA61AEEA61AEEA61AEEA61AEEA61AEEA62AFEA61AEEA61AEEA61AEEA
      61AEEA61AEEA62AEEA61AEEA61AFEA61AEEA62AEEA61AFEA61AEEA61AEEA61AE
      EA61AEE961AEEA61AEEA61AEEA61AEEA61AEEA61AEEA61AEEA61AEEA61AFE961
      AEEA62AEEA61AEEA61AEEA61AEE961AEEA61AEEA61AEEA61AFEA61AEEA61AFE9
      61AEEA61AEE961AEE961AEEA61AFEA61AFEA61AEEA61AFEA61AEEA61AEEA62AE
      EA61AFEA61AEEA61AEEA61AEEA61AEE961AEEA62AEEA61AEEA61AEEA61AFEA62
      AEEA61AEEA61AEEA61AEEA61AEEA61AFE961AFEA61AEEA61AFEA61AEEA61AEEA
      61AEE961AFEA61AFEA61AEEA61AEEA62AEEA61AEEA61AFEA61AEEA61AEEA61AE
      EA61AFEA61AEE961AEEA61AEE961AEEA61AEEA61AEE961AEEA61AFEA61AEEA62
      AEEA61AEEA61AEEA61AEEA61AEE961AEE962AEEA61AEE961AFEA61AEEA62AEEA
      61AEEA61AEEA62AEEA61AEEA61AEEA62AFE961AEE961AEEA61AEEA61AEEA61AE
      EA61AFEA61AEEA61AEEA61AEEA61AEEA61AEEA61AEE961AEEA61AEE961AEE961
      AEEA62AEEA61AEEA61AEE961AEEA61AEEA61AEEA61AFE961AEEA61AEEA62AEEA
      62AEEA61AEEA61AEEA61AFEA61AEEA61AEEA61AEEA61AEEA61AEE961AEEA61AE
      EA61AEE962AEEA61AEEA61AEEA61AEEA61AEE961AEEA61AEEA61AEEA62AEEA61
      AEEA61AEEA61AEEA61AFEA61AEEA61AEE961AEEA61AEEA61AEEA61AEEA61AEEA
      61AEE961AEEA61AEEA61AEEA61AEE961AEEA62AEEA61AEEA61AEEA61AEEA61AE
      EA61AEEA61AEEA61AFE961AEEA61AFEA62AEEA61AEEA61AFEA61AFEA61AEEA61
      AEE961AEEA61AEEA61AEEA61AEEA61AEEA61ADEA5EACEA5EACEA5EACEA5EADEA
      5EADEA5DADE95EADE95EACEA5EADEA5EACE95DADEA5EACEA5EACEA5DACEA5EAC
      EA5EACEA5EADE95DACE95EACEA5EADEA5EADEA5EACEA5EADE95EADEA5EACEA5D
      ACEA5EACEA5EADE95EACE95EADEA5EADEA5EACE95EACEA5DACEA5EADEA5EACEA
      5EADEA5EADEA5EADEA5EADEA5EADEA5DACEA5DACEA5EACEA5EADEA5EADEA5EAC
      E95EADEA5EACEA5EADEA5EADEA5EADE95DACEA5DADEA5DADE95EADEA5EADEA5E
      ADE95DADEA5DACE95EADEA5EACEA5EACEA5EADEA5DADEA5EADEA5DADEA5EACEA
      5EACEA5DADEA5EADEA5DADEA5EACEA5EADEA5DADEA5EACEA5EADE95EACEA5DAC
      EA5EADEA5EACEA5EADE95EACEA5EADEA5DADEA5EACEA5EACEA5EADE95EADE95E
      ACE95EACEA5EADEA5EACEA5DADEA5EADEA5EACEA5EADE95EADEA5EACEA5EACEA
      5EACEA5DADEA5DADEA5EADE95EACE95EADEA5EADEA5EACEA5EADEA5DACEA5EAC
      EA5EADEA5DACEA5EACE95EACEA5EACEA5EACEA5EACEA5DACEA5EACEA5EADEA5E
      ACEA5EACEA5EADE95EADEA5DACEA5EADEA5EACEA5EACEA5EADEA5DACE95DADEA
      5EADEA5EACEA5EADE95EADE95DACEA5EACEA5EADEA5EACEA5EADEA5EACE95EAD
      E95DACE95DACEA5EADEA5EACEA5EACEA5EACEA5EACEA5EADE95EACE95EADEA5E
      ADEA5EADEA5EACEA5EADE95EACEA5DADEA5EADEA5EADEA5DACEA5DACEA5EACEA
      5EADEA5EACEA5EADEA5DACEA5EADEA5DACEA5EACEA5EADEA5EADEA5EACEA5EAD
      EA5EADE95DADEA5EADEA5EADEA5EACEA5DADEA5EADEA5EACEA5EADE95EADEA5E
      ADEA5EACEA5EACE95EACEA5EADEA5EACEA5EADE95DADEA5EACE95EACEA5EACEA
      5DADEA5EACEA5DACEA5EABE95AABE95AABEA5BABEA5AABE95AABEA5AABE95BAB
      EA5BABEA5AABE95AAAEA5AAAEA5AABEA5BABEA5AABEA5BABEA5AABEA5AABEA5A
      ABEA5AAAEA5AABE95AAAE95AABE95AABEA5AAAEA5AABE95AAAE95AABE95AABEA
      5AABEA5AABEA5BAAE95AABE95BABEA5BABE95AABEA5AABEA5AABEA5AABE95BAB
      EA5AABEA5BAAEA5BABEA5BABEA5BABEA5AABE95AABE95BABEA5BABEA5AABEA5A
      ABEA5AAAE95BABEA5AABEA5AABEA5AABEA5BABE95AABEA5AAAEA5AAAEA5BABE9
      5AABE95AABE95AAAEA5AAAEA5AABE95BABEA5BABEA5AABEA5BABEA5AABE95AAB
      E95BABEA5AABEA5AABE95BAAEA5BABE95AABEA5BAAEA5BABEA5AABEA5AABE95B
      ABEA5BABEA5AAAEA5BAAE95AABE95BABEA5BABEA5AABEA5AABEA5AABEA5AABE9
      5BABEA5AABE95AABEA5AAAEA5BAAE95BABEA5BABEA5BABEA5AABEA5BABE95BAA
      E95BABEA5BABEA5AABEA5AABE95BAAE95AABEA5BABE95AAAEA5AAAEA5BAAEA5A
      ABEA5AAAEA5AABEA5BABE95BABEA5AABEA5AABEA5AABE95AABEA5AABE95BABE9
      5AAAEA5BABEA5BABEA5AABE95BABEA5AABEA5AABE95BABEA5BABE95AABEA5BAA
      E95AABE95BABE95BAAE95AABEA5AAAEA5BABEA5AABE95AABEA5AABEA5AABE95B
      AAEA5AAAE95BABEA5AAAE95AAAEA5BABEA5AABEA5AABEA5BABEA5BABE95AABE9
      5BAAE95BAAEA5AABEA5AABEA5AABE95AABEA5AAAE95AABEA5BABEA5AABEA5AAB
      E95AABE95AAAE95AAAE95AAAEA5BABEA5BABE95AABEA5BABEA5AABEA5BABEA5A
      AAE95AAAE95AABEA5AABEA5AABEA5BABEA5AABEA5BABE95BABEA5AABE95AABEA
      5AABE95AABE95AABEA5BABEA5AAAEA5BABEA5AABE95AABEA5AABEA5AAAEA5AAB
      EA5AA9EA57A9E957A9EA57A9E957A9EA57A9EA57A9EA57A9EA57A9EA57A9EA57
      A9EA57A9E957A9E957A9E957A9EA57AAEA57A9EA57A9EA57A9EA57A9E957A9EA
      57A9E958A9EA57A9E958A9E957A9EA57A9EA57A9EA57A9E957A9EA57A9E957A9
      EA58A9EA57A9EA57A9E957A9EA57A9EA57A9EA57A9EA57A9EA57A9E957A9EA57
      A9E957A9EA57A9EA57A9EA57A9E957A9EA57A9E957A9EA57A9EA57A9EA57A9EA
      57A9EA57A9EA57A9EA57A9EA57A9EA57A9EA57A9E957A9EA58A9EA57A9EA57A9
      E957A9EA57A9E957A9E957A9EA57A9E957A9EA57A9EA57A9E957AAE957A9EA57
      A9EA57A9EA57A9E957A9EA58A9EA57A9EA57A9E957A9E957A9E957A9EA57A9EA
      57A9EA57A9E957A9EA57A9EA58A9EA57A9EA57A9EA57AAE958A9E957AAEA57A9
      E957A9EA57A9E957A9EA57AAEA57A9EA57A9E957A9EA57A9EA57A9EA57A9EA57
      A9EA57A9E957A9EA57AAE957A9EA57A9EA57A9EA57A9EA57AAEA57A9EA57A9E9
      57A9EA57A9E957A9EA57A9E957A9E957A9EA57A9E957A9E957A9EA57A9EA57A9
      E957A9E957AAEA57A9E957A9E957A9E957AAEA57A9EA57A9EA57A9E957A9E957
      A9E957A9EA57A9EA57A9EA57A9EA57A9E957A9EA57A9EA57AAE957A9EA57A9E9
      57A9EA57A9EA57A9EA57A9EA57A9EA57A9EA57A9EA57A9EA57A9E957A9EA58A9
      E957AAE957A9EA57A9EA57A9E957A9EA57A9EA57A9EA57A9EA57A9E957A9EA57
      A9E958A9EA57A9EA57A9EA57AAE957A9EA57A9EA57A9EA57A9EA57A9EA58A9EA
      57A9EA57A9EA57A9EA57A9E957A9E957A9EA57A9E957A9EA57A9EA57AAE957A9
      E957AAE957A9EA57A9E957A9EA57AAEA57A9E957A9E957A9EA58A7EA54A7E954
      A7E954A7EA53A8E954A8E954A8E954A7EA53A8EA54A7EA54A8EA54A7EA53A7E9
      53A7EA53A8EA54A7E954A8EA54A7EA53A7E953A7E954A7E954A8EA54A7EA53A7
      EA53A7EA54A8E954A7EA54A7E954A7E954A8EA53A8EA53A8EA54A7EA54A8E954
      A8EA54A7E953A7E954A7E954A7E953A8EA54A8EA54A8E953A8E953A8E954A7EA
      54A8EA54A7E954A8EA54A7EA54A7E954A7E954A7E953A8E954A7EA54A7EA54A7
      EA53A8EA54A7E954A7E954A7EA54A7E954A7EA53A7EA54A8EA54A7E953A7E954
      A8E953A7E954A7EA54A8EA54A8E954A7EA54A8EA54A8EA54A7E954A7E954A7EA
      54A7EA54A7E954A7E954A7E954A7E954A8E954A8E954A8E953A8EA54A8E954A8
      EA54A8E954A8EA54A8E954A7E954A7EA54A7EA54A7E954A7EA54A7E954A8E954
      A8EA53A7E954A8EA54A7E954A7EA54A8EA54A7E953A8EA54A7EA54A8E954A7E9
      54A7E954A7EA54A7EA54A7EA54A7EA54A8EA54A7EA53A7EA54A7E954A7EA54A7
      EA54A7E954A7EA54A7EA54A7E954A7E954A7EA54A8E954A8E954A7EA54A8E954
      A7EA54A8EA54A8EA54A8EA54A8EA54A7EA54A7EA54A8EA54A7E954A8EA54A7EA
      54A7EA54A7E954A7EA54A8E954A7E954A8EA54A7EA54A8E954A8E954A8EA54A8
      E954A7EA54A7EA54A8EA54A7EA54A8EA54A7EA54A7EA54A8EA54A8EA53A8E954
      A7E954A8EA54A7E954A8EA54A8EA54A8EA54A7EA54A7E954A7E954A8E954A8EA
      54A7EA54A7E953A7E954A7E954A7E953A7E954A8EA54A7EA54A8E954A8EA53A8
      EA54A7EA54A7E953A7E954A7E954A7EA54A7EA53A8EA54A7EA53A8E954A7EA53
      A8EA54A7EA54A7E954A7EA54A8E953A8EA54A6EA50A6E951A6E950A5E951A6EA
      51A5E950A6E950A6E950A5EA50A5E950A5E951A6EA51A6EA50A6EA51A6EA51A6
      EA50A6E951A6E951A5E950A6E950A6EA51A6EA51A6EA51A6EA50A6EA51A5E951
      A6E951A5E951A6EA50A5E951A5EA51A6EA51A5E951A6E951A6E951A6E950A6E9
      51A6EA51A5EA51A6EA50A5EA50A6EA50A6EA50A6E951A6E951A6E950A5E950A6
      E950A6E950A6EA51A6E950A6EA50A6EA51A6EA50A6E951A6E950A6E950A5E951
      A5EA51A6E951A6E950A6EA50A6EA50A5E951A6EA51A6E950A5EA51A5E950A5E9
      50A6E951A6EA51A6EA51A6E950A6E951A5EA50A6E950A6EA50A6EA50A5EA51A5
      E951A6E950A6EA50A6EA50A6E950A6EA51A5E950A5EA50A6E951A6EA50A6E951
      A6E950A6E950A6E950A6E951A6EA51A6EA50A6EA51A5EA51A6E950A6EA51A6EA
      51A5EA50A5E950A6EA51A6E950A5EA51A5EA51A6E951A6EA51A5EA50A5EA51A5
      EA50A6E951A6EA50A6E951A5EA51A6E951A6E951A6E950A6E951A5E950A6E950
      A5EA51A6E950A6EA51A6E950A6EA51A6EA51A6E951A6EA51A6EA51A6EA50A6E9
      50A6E951A6EA51A6E951A6E951A6E950A6E950A6E951A5EA51A6EA51A6EA51A6
      E950A5E951A5EA51A6EA50A6E951A5E951A6EA50A5EA50A5E951A5E950A6E950
      A6E950A6E951A6EA50A6E951A5EA50A6E950A6EA50A6E951A5E951A5EA50A5E9
      51A6EA51A6E950A6EA50A6E951A6EA50A6EA51A6E951A5E950A6E951A6EA50A6
      E951A6E950A5EA50A6EA51A6EA51A6E951A5E951A6E950A6EA51A6EA51A6E951
      A6E951A5EA50A6E950A6EA51A6E950A5E951A6E950A6EA51A6E951A6E951A6EA
      50A5EA50A6E951A6EA50A4E94EA4E94DA4E94EA5EA4EA4EA4DA4E94EA5E94DA4
      E94DA4E94DA4E94DA4E94EA4E94DA4EA4DA4EA4DA4EA4DA4EA4DA5E94DA4E94D
      A4EA4EA4EA4DA5E94DA4E94DA4E94DA4EA4DA4EA4EA4E94EA4E94DA4E94DA4EA
      4EA4EA4DA4EA4DA4EA4DA4E94DA4E94DA4E94EA4E94DA4EA4DA4EA4DA5E94DA4
      EA4DA4E94EA4E94DA4E94EA4E94EA4E94EA4EA4DA5E94EA4E94DA4E94DA4EA4D
      A4EA4DA4EA4EA4E94EA4EA4EA4EA4DA4E94DA4EA4DA4E94DA4E94EA4E94EA4EA
      4DA4EA4EA4E94DA4EA4DA4EA4DA5E94EA4EA4EA5E94EA4EA4EA4EA4EA4EA4DA4
      E94DA4EA4DA4E94EA4E94EA4EA4DA4EA4DA4E94DA5E94DA4EA4EA4EA4DA4EA4D
      A4E94EA5E94DA4E94DA4E94EA4E94EA4E94DA4EA4DA4EA4EA4EA4DA4E94DA4EA
      4DA4E94DA4E94DA4E94EA4EA4DA4EA4DA4E94DA4E94DA4E94DA4E94DA4EA4DA4
      E94EA4E94DA4EA4EA4E94DA4EA4DA4EA4DA5EA4DA5E94DA4E94DA4EA4DA4E94E
      A4EA4DA4E94DA5E94DA4E94EA4E94EA4E94DA4EA4EA4E94EA4E94EA4E94EA4EA
      4DA4EA4DA4E94EA4E94DA4E94DA4EA4DA4EA4DA4EA4EA5EA4DA4E94EA4E94DA4
      EA4DA4E94EA4E94DA4E94DA4E94DA4E94DA4E94DA4EA4DA4EA4EA4E94DA4E94D
      A4EA4EA4E94DA4EA4DA4E94EA4EA4DA4E94DA4EA4DA4EA4DA4EA4DA4E94DA4E9
      4DA4EA4EA4EA4EA4EA4EA4EA4DA4EA4EA5E94DA4E94EA4EA4EA4E94DA4E94DA4
      E94DA5E94EA4E94EA4E94EA4E94EA4E94EA4E94DA4EA4DA4E94DA4E94EA4E94E
      A4E94EA4E94DA4E94EA4EA4EA4EA4EA4E94EA4E94DA4E94EA4E94DA5E94DA5E9
      4DA4E94DA4EA4EA4E94EA4E94DA4E94DA4E94DA4EA4EA4E94DA4E94DA4E94EA4
      EA4DA3E94AA2E94BA3E94BA2EA4AA2E94AA3E94BA2EA4AA3E94BA3E94AA3E94A
      A2EA4AA2E94AA2E94AA2E94AA3EA4AA3E94AA2E94AA2E94AA3EA4AA2EA4AA2E9
      4AA2E94AA2E94AA3E94AA3E94AA3EA4BA3EA4AA2EA4AA2EA4BA3EA4AA2E94AA2
      EA4AA2EA4AA3E94BA3EA4AA2E94AA2E94BA3E94BA3EA4AA3E94AA2E94BA3E94A
      A2E94AA3E94AA3EA4AA2E94AA3E94BA3E94AA3EA4AA3EA4AA3EA4AA2E94AA2E9
      4AA3EA4AA2EA4AA3E94AA2E94AA2EA4AA2E94BA2EA4AA2E94BA2E94AA3E94AA3
      E94AA2EA4AA2E94AA3E94AA2EA4AA2E94BA2E94AA3EA4AA3EA4BA3E94AA2EA4A
      A2E94AA3E94AA3E94AA3E94AA2EA4AA3E94AA3EA4AA2EA4AA2E94AA2E94AA3E9
      4AA3EA4AA2EA4AA3E94BA2EA4AA3E94AA3EA4BA2EA4AA2E94AA3E94BA2E94AA3
      E94AA2EA4AA3EA4AA3E94AA3E94AA3EA4AA3E94BA3E94AA2E94AA3E94AA2E94A
      A3E94AA2E94AA2EA4AA3E94AA3EA4AA3E94AA3EA4AA2E94AA3E94AA2E94AA3EA
      4AA2EA4AA3E94AA3E94AA3E94BA3EA4AA2E94AA2EA4AA3E94AA2E94AA2EA4AA3
      E94AA3E94AA2EA4AA3E94AA3E94BA3E94AA2EA4AA3E94BA2EA4AA2EA4BA3EA4A
      A2E94AA3E94BA3E94BA2E94AA2EA4AA2E94AA3EA4BA3E94AA3EA4AA3EA4AA3E9
      4AA2E94AA2EA4AA3E94AA2E94AA3E94AA2EA4AA3E94AA2E94BA2E94AA3E94AA3
      E94AA3EA4AA3E94AA2E94AA2EA4AA2EA4AA2E94AA3EA4AA3E94AA2EA4AA2EA4B
      A3E94AA3EA4AA3EA4AA2E94AA3E94BA2EA4AA2E94AA2E94AA3E94AA3E94AA2EA
      4AA2E94AA3E94AA2E94BA2E94AA2E94AA3E94AA3EA4BA2E94AA2EA4AA2E94AA2
      E94AA2EA4AA2E94BA2E94AA2E94AA3E94AA3E94AA2EA4AA2EA4AA1E947A1E947
      A1EA47A1EA47A1E947A1EA47A1E947A1E947A1E947A1E947A1E947A1E947A1E9
      47A1EA47A1E947A1E947A1E947A1E947A1EA47A0E947A1E947A1EA48A1E947A1
      E947A1E947A1E947A1EA47A1EA47A1E947A1EA47A1EA47A1E948A1E947A1EA47
      A1EA47A1EA47A1EA47A1E947A1E947A1EA47A0E947A1E947A1E947A1E947A1EA
      47A1E947A1E947A1EA47A1EA47A1EA47A1E947A1E947A1E947A1E947A1E947A1
      E947A1E947A1E947A1E947A1E947A1E947A1EA47A1EA47A0E947A1E947A1E947
      A0E947A0EA47A0E947A1E947A1EA47A1E947A1E947A1E947A1E947A0E947A1E9
      47A1E947A1EA47A1E947A1E947A0E947A0EA47A0E947A1EA47A1EA47A1E947A1
      E947A1E947A1E947A1E947A1E947A1E947A1E947A1E947A1E947A0E947A1EA47
      A1E947A1E947A1E948A0E948A1E947A1EA47A1E947A1E947A1E947A0E947A0E9
      47A1EA47A1E947A1EA47A1EA47A1E947A1E947A1E948A1E947A0E947A0EA47A1
      E947A1E947A1EA47A1EA47A1E947A1E947A1E947A1EA47A1EA47A1E947A0E947
      A1E947A1E947A1E947A1E947A1E947A1EA47A1E947A1E947A1E947A1EA47A1EA
      48A1E947A1E947A1E947A1E947A0E947A0E947A0E947A1E947A1E947A1EA47A1
      E947A0E947A1E947A1EA47A1EA47A1EA47A1E947A1E947A1E947A1E947A1E947
      A1E947A1E948A1E947A1EA47A1E947A1EA47A1EA47A0E947A0E947A0E947A1E9
      47A1EA47A1EA47A1E947A0E947A1EA48A1EA47A1E947A1EA47A1E947A1E947A0
      E948A1E947A1E947A1E947A1E947A1EA47A1E947A1EA47A1E947A0E947A1E947
      A1E947A1E947A1E947A1E947A1E947A1E947A0E944A0E9449FE9449FE9449FEA
      449FEA44A0E944A0E9449FE9449FE9449FE9449FE9449FE944A0EA44A0E9449F
      E9449FE9449FEA44A0E944A0E9449FE9449FE9449FE9449FE9449FE9449FE944
      A0EA449FEA449FE944A0E944A0E944A0EA44A0E9449FE9449FE9449FEA449FE9
      44A0E9449FE9449FE944A0E944A0E9449FE9449FE9449FEA44A0E9449FE9449F
      E9449FE9449FE9449FE944A0E9449FEA449FE9449FEA44A0E9449FEA44A0E944
      A0E9449FE9449FE9449FE9449FE9449FE944A0E9449FE9449FE9449FE944A0E9
      44A0E944A0E944A0EA44A0E944A0E9449FE9449FEA449FE9449FE9449FE9449F
      E9449FE9449FE944A0E944A0E9449FE9449FE944A0E9449FE944A0E944A0E944
      9FE9449FE9449FE9449FEA44A0E9449FE9449FE9449FE944A0E9449FEA449FE9
      44A0E9449FE9449FE944A0E944A0EA449FE944A0EA449FE944A0EA44A0E9449F
      EA449FE9449FEA44A0EA449FE944A0E9449FE944A0E944A0E9449FEA44A0E944
      9FEA44A0E9449FE9449FE944A0E9449FE945A0E944A0E944A0EA449FE944A0E9
      44A0E9449FE9449FE9449FE944A0E9449FE9449FE944A0E944A0E944A0E9449F
      E9449FE9449FE9449FE9449FE944A0E9449FE9449FEA449FE944A0E944A0E944
      A0E9449FE9449FE9449FE944A0E9449FE9449FEA449FE9449FE9449FE9449FE9
      449FE944A0E9449FE9449FEA449FEA449FE9449FE9449FE944A0E944A0E9449F
      EA44A0E9449FE9449FE9449FE9449FE9449FE944A0E9449FE944A0E9449FE944
      9FE9449FEA449FE944A0E944A0E9449FE9449FEA449FE9449FEA449FE9449FE9
      449FE944A0E9449FE9449EE9419EE9419EE9419DE9419EE9419EE9419EE9419E
      E9409EE9419EE9419DE9419DE9419EEA419EE9419EE9419EE9419EE9419EEA41
      9EE9419EE9419DE9409EE9419EE9419EE9419DE9419EE9419DE9419EE9419DEA
      419EE9419EE9419EE9419EE9419EE9419DE9419DE9419DE9419EE9419DE9419D
      EA419EE9419EE9419EE9419EE9419EE9419DE9419EE9419EE9419DE9419EE941
      9EE9419DEA419EE9419DE9419EEA419EE9419EE9419EE9419EE9409EE9419DE9
      419EEA419DE9419DE9419EE9419DE9419DE9419EE9419EE9419EE9419EE9419E
      E9419EE9419EE9409EE9419EE9419EE9419EE9419EE9419EE9419EE9419EE941
      9EE9419EE9419EEA419EE9419EE9419EE9419DE9419DE9419EE9419DE9419EEA
      419DE9419EE9419EEA419EEA419EE9409EE9419EE9419EEA419EE9419EE9419E
      E9419EE9419EEA419EE9419EE9419EE9419EE9419EE9419EEA419DE9409EE941
      9DEA419EEA419DE9419DE9419EEA419EE9419EE9419EE9419EE9419DEA419EE9
      419DE9419EE9419DE9419EE9419EE9419EE9419EE9419EEA419EE9419EE9419D
      EA419EEA419EE9419EEA419EE9419EE9419EE9419EE9419EE9419DE9419DE941
      9DE9419EE9419EE9419EE9419EE9419EE9419EE9419DE9419EE9419EE9419DE9
      419DE9419EE9419EE9419EE9419EE9419DE9419EE9419DE9419EEA419DE9419E
      E9419DE9419EEA419DE9419EE9419DE9419DE9419EE9419DE9419EE9419EE941
      9DE9419EE9419EE9419EE9419EEA419DE9419EE9419DE9419EE9419EE9419EE9
      419DE9419EEA419EE9409EE9419DE9419EE9419EE9419EE9419EE9419DE9419E
      E9419CE93E9CE93E9DE93E9CE93E9DE93E9CE93E9DE93E9CE93E9CE93F9CE93E
      9CE93E9CE93E9CE93E9CE93E9CEA3E9DE93E9CE93E9CE93E9CE93E9CE93E9CE9
      3E9CE93E9CE93E9DE93E9CE93E9CE93E9CEA3E9DE93E9DE93E9CE93E9DE93E9D
      E93E9CE93E9CE93E9CE93E9CE93E9CE93E9DE93E9DE93E9CE93E9CE93E9DE93E
      9DE93E9CE93E9CE93E9DE93E9CE93E9DE93E9CE93E9CE93E9CE93E9CE93E9DEA
      3E9DE93F9CE93E9CE93E9DE93E9CE93E9CE93E9DE93E9CE93E9DE93E9DE93E9D
      E93E9CE93E9DE93E9CE93E9CE93E9CE93E9CE93E9DEA3E9CE93E9CE93E9DE93E
      9CE93E9CE93E9DE93E9DE93E9CE93E9CE93E9DE93E9CE93E9CE93E9CE93E9CE9
      3E9CE93E9CE93E9CE93E9CE93E9CE93E9CEA3E9DE93E9DE93E9CE93E9CE93E9C
      E93E9CE93E9CE93E9CE93E9CE93E9CE93E9CE93E9CE93E9CE93E9CE93E9CE93E
      9DE93E9CE93E9CE93E9CE93E9CE93E9CE93E9CE93E9CE93E9DE93E9CE93E9CE9
      3E9CE93E9CE93E9CE93E9CE93E9CE93E9DEA3E9CE93E9CEA3E9CE93E9CE93E9C
      E93E9CE93E9CE93E9DE93E9DE93E9DE93E9DE93E9CE93E9CE93E9CE93E9CE93E
      9CE93E9CE93E9DE93E9CE93E9CE93E9DE93E9DE93E9CE93E9CE93E9CE93E9CE9
      3E9CE93E9CE93E9CE93E9DE93E9CE93E9CE93E9CE93E9CE93E9CE93E9DE93E9C
      E93E9CE93E9DE93E9CE93E9CE93E9CE93E9DE93E9CE93E9CE93E9DE93F9CE93E
      9DE93E9CE93E9CE93E9CE93E9CE93E9CE93E9CE93E9CE93E9CE93E9CE93E9CE9
      3E9CE93E9DE93E9CE93E9DE93E9CE93E9CE93E9CE93E9CEA3E9CE93E9DE93E9C
      E93E9CE93E9DE93E9CE93E9CE93E9CE93E9CE93E9CE93E9DE93E9AE93C9BE93B
      9BE93B9BE93B9BE93B9AE93B9BE93B9BE93B9BE93B9BE93B9BE93B9BE93B9BE9
      3B9BE93B9BE93B9AE93B9BE93B9AE83B9BE93C9BE93C9BE93B9BE93B9BE93B9A
      E93B9BE93B9BE93B9AE93B9AE93B9BE93B9AE93B9BE93B9AE93B9BE93B9BE93B
      9AE93B9BE93B9BE93C9BE93B9BE93B9BE93B9BE93B9BE93B9BE93B9AE93B9BE9
      3B9BE93B9BE93B9AE93B9BE93B9BE93B9BE93B9BE93B9BE93B9BE93B9BE93B9B
      E93B9BE93B9BE93B9BE93B9AE93B9AE93B9BE93B9BE93B9BE93B9BE93B9BE93B
      9AE93B9AE93B9BE93B9BE93B9BE93B9BE93B9BE93B9BE93B9AE93B9BE93B9BE9
      3B9BE93C9BE93B9BE93B9BE93B9BE93B9BE93B9BE93B9BE93B9BE93B9BE93B9B
      E93B9AE93B9BE93C9BE93B9AE93B9AE93B9BE93B9BE93B9BE93B9BE83B9BE93B
      9AE93B9BE93B9BE93C9BE93B9BE93B9BE93B9BE93B9BE93B9AE93B9BE83B9BE9
      3B9BE93B9AE93B9AE93B9BE93B9BE93C9BE93B9BE93B9BE93B9BE93B9AE93B9B
      E93B9AE93B9AE93B9BE93B9AE93B9BE93B9AE93B9BE93B9BE93B9AE93B9AE93B
      9BE93B9AE93B9BE93B9BE93B9BE93B9AE93B9BE93B9BE93B9BE93B9AE93B9BE9
      3B9BE93B9BE93B9BE93C9AE93B9BE93B9BE93B9BE93B9BE93C9AE93B9AE93B9B
      E93B9AE93B9BE93B9BE93B9BE93B9BE93B9BE93B9BE93B9BE93B9BE93B9BE93B
      9BE93B9BE93C9BE93B9AE93B9BE93B9BE93B9BE93B9BE93B9BE93B9BE93B9AE9
      3B9BE93B9AE93B9BE93B9BE93B9BE93B9BE93C9BE93B9BE93B9AE93B9AE93B9B
      E93B9BE93B9AE93B9AE93B9BE93B9BE93B9BE93B9BE93B9AE93B9BE93B9AE93B
      9BE93B9BE93B9BE93B9BE93C9AE93B9BE93B99E93899E93899E9399AE93899E8
      399AE93899E93899E83899E9389AE93899E93899E93999E93899E9389AE93899
      E93899E9399AE93899E9389AE93999E93999E93899E93899E93899E93899E838
      99E93899E93899E9389AE93899E93899E93899E93999E93999E93899E93999E9
      3999E93899E9399AE93899E93899E9399AE9389AE9389AE93899E8389AE93899
      E9389AE93899E93899E83899E9389AE93999E93999E93899E93899E93999E938
      9AE9389AE9389AE93899E93899E93899E9399AE9399AE93899E93899E93899E8
      3899E93899E93899E93899E83899E83999E9389AE9399AE93899E93899E9389A
      E93899E93899E9389AE93899E9389AE93899E93899E9399AE93899E93999E939
      99E93899E9389AE9389AE83999E93899E9389AE9389AE93899E93899E93899E9
      389AE93899E93899E93899E93999E93899E93899E93899E83899E93899E9399A
      E93999E93999E83899E93899E93899E93899E93899E9389AE93899E93899E839
      99E93899E93899E93899E9389AE93899E93899E83899E93899E93999E93899E9
      3899E93999E9389AE9389AE9399AE93899E93899E93899E93999E93899E93899
      E9399AE93899E9389AE93899E93899E93899E93899E9389AE93899E93899E938
      99E9389AE93899E93899E83999E93899E93899E93899E93999E93899E93899E9
      3899E9389AE93899E93899E93899E93899E93899E93999E93999E93899E93899
      E93999E9399AE9389AE93999E83899E8389AE93899E93899E9389AE93999E938
      99E93899E9389AE93899E93899E93999E93899E9389AE9389AE93899E93899E9
      3899E93899E93899E93898E93698E93598E93598E93598E93598E93597E93698
      E83598E83698E93598E93598E83698E83598E93698E93598E93598E93598E936
      97E93597E93698E93698E93597E93697E93598E93698E93598E83698E93698E8
      3598E93598E83597E93598E83698E93598E93598E93598E83697E93597E93698
      E83698E93698E93598E83598E93598E93598E93698E83598E93598E93598E935
      98E93597E93697E93598E93598E93697E93598E93698E93597E93598E93698E9
      3597E93597E93698E93698E93597E83598E93698E93598E93598E93698E83598
      E93698E93598E93598E93698E93698E93698E93598E93598E83598E93597E936
      98E93598E93598E93598E83698E93598E93598E93698E93598E83597E93698E9
      3598E93598E93698E93597E93597E93598E93598E93698E93698E93697E93597
      E93598E93597E93598E93698E93598E93598E93598E93598E93698E93698E936
      97E93698E93598E93698E93598E93598E83598E93598E93598E93598E93698E9
      3598E93598E93598E93598E93698E93598E83598E93697E93598E93698E93598
      E93598E93697E93698E93598E93698E93597E93698E93598E93698E93598E936
      98E93698E83598E93597E93598E93598E93597E93598E93598E93698E83698E8
      3698E93598E93698E93597E93698E93698E93598E93598E93598E93597E93597
      E93598E93598E93597E93698E93597E93598E83598E93598E83598E83598E936
      98E93598E93698E93698E93698E93698E93598E93598E93698E93598E93698E9
      3598E93698E83698E83698E93598E93598E93598E93598E93697E93698E83598
      E93596E93396E83296E93396E93397E93297E93397E93297E93296E93396E933
      97E93397E83396E93397E93397E83396E83297E93397E93396E83397E93396E9
      3396E93396E83397E83297E93397E93297E93397E93397E83397E93297E93397
      E93396E93297E93396E83397E83396E93396E93396E93297E93396E93296E933
      97E83397E93397E93396E93397E93397E93396E93397E93397E83397E93296E8
      3396E93396E93396E83297E93297E93297E93396E83397E93397E93397E93396
      E93397E93397E93296E93397E93397E93396E93396E93396E93396E93297E933
      97E93397E93397E93296E93397E93396E83397E93296E83297E83397E83297E9
      3397E93296E93397E93297E83296E93397E93297E93297E93396E93296E93397
      E93397E83296E93396E83297E83397E93297E93396E83396E93396E93396E833
      96E83296E93397E93397E83396E93397E93296E93396E93397E93396E83396E9
      3396E93296E93396E83397E93396E83397E93396E93397E93396E93396E83396
      E93396E83397E93396E93397E93396E93396E83296E93397E93297E83396E833
      96E93397E83397E93296E93397E93397E93396E93396E83297E83396E93397E9
      3397E83396E93297E93297E93396E83396E93396E93396E93397E83396E83396
      E93397E93397E83396E93296E93396E93396E93297E93397E83297E93396E932
      97E93396E93396E93396E93396E93297E93397E93397E93397E93396E93397E9
      3296E93397E93396E93297E93397E93296E93397E93297E83396E83296E93396
      E93297E83396E93396E93297E93396E93297E83396E93396E83295E83095E830
      95E83095E83095E93095E83095E93095E93095E93095E93095E93095E93095E9
      3095E93095E83095E93095E93095E83095E83096E93095E93095E93096E93095
      E93095E93096E93095E93095E83095E93095E93095E93095E83096E83095E830
      95E93095E93095E93095E93095E93095E93095E93095E93095E83095E93095E9
      3095E93095E93095E93096E93095E93095E83095E93095E93095E93095E83095
      E93095E83095E93095E93095E83095E93095E93095E83095E83095E83095E930
      95E83095E83095E93095E83095E93095E93095E83095E93095E93095E93095E9
      3095E83095E93095E93095E93095E83095E93096E83095E93095E83096E83095
      E93095E83095E83095E93095E93095E93095E93095E93095E93095E83095E830
      95E93095E83095E83095E93095E83095E93096E93095E83095E93095E83095E9
      3096E83095E93095E93095E93095E83095E93095E83095E93095E83095E93095
      E93095E83096E93095E93096E92F95E93095E93095E93095E83095E93095E830
      95E93095E93095E93095E93095E83095E93096E93095E83095E93095E83095E9
      3095E93095E93096E83095E93095E83095E83095E93095E93095E83095E93095
      E93095E93095E83095E93095E93095E83095E83095E93095E83095E83096E930
      95E83095E93095E93095E93095E93095E83095E93095E83095E83095E93095E9
      3095E93095E83095E93095E93095E93095E83095E93095E93095E93095E83095
      E93095E83095E93095E93095E93095E83095E93095E93095E93095E93095E930
      95E83095E93095E93095E83095E93095E93094E92D94E92E94E82D94E92D94E8
      2E94E92D94E92D93E92D94E92D93E92E93E82E94E92E94E82D94E92D93E82E94
      E82D93E92D94E82E93E92D94E92D94E92D94E92E93E82E94E92E94E92E94E82D
      94E82E94E92D94E82E94E92D93E82E94E92E94E92E93E92D94E92D93E92E94E9
      2D94E92E93E92D94E92E94E82E94E92D94E92D94E92D94E92D93E92D94E92D94
      E92D93E82E94E92D93E82D93E92E94E82E93E82E93E82D94E92E93E82D94E82D
      93E82E94E92E93E92E94E92E94E92E94E82E94E82D94E82E94E92D93E92E94E9
      2E94E92E93E82D94E82E94E92D94E82E94E92D93E82D94E92D94E82E94E92E93
      E92E94E82E94E82E93E82D94E92D93E82D93E92D94E92E94E82D94E92D94E82D
      94E92D94E82D94E92D93E92D93E92D93E92D94E92D94E82E94E82D93E92E93E8
      2E94E92E93E92D93E92E93E92D94E92E94E82E93E92E94E92D94E82D93E92D93
      E92E94E82D94E92E94E92E93E82E94E82E94E92E94E92D93E92D93E92D94E82D
      93E82D94E82D94E92E93E92E94E82D93E82E94E92E94E92D94E82D94E92D93E8
      2D94E82E94E82D94E92D94E82D94E92D94E82D94E92E94E82D93E92D94E82D94
      E82D94E92D94E82E94E92E93E92E94E92E94E82D94E92E94E92D93E92D94E82D
      94E92E94E92E94E82D94E82D93E82E94E82E94E82E93E92D94E82E94E82D93E9
      2D94E92D93E92E94E82D94E92D93E92D93E92D94E92E94E82D93E82D94E82D94
      E92D94E92E94E92D94E82D94E92D94E82D94E92D94E92E94E92D94E92D94E82E
      94E92E94E92E94E82D94E92D94E92D93E92E94E82D94E82D94E82D94E92E94E8
      2E94E92D94E92D94E82E93E82B92E92B92E92B93E82B93E92B92E82B93E82A93
      E92B92E92B92E82A92E92B93E82B92E82B92E92B92E92B92E82B92E92B92E82B
      92E82B93E92B93E92B92E82B93E92B92E92B92E82B92E82B93E92A92E92B93E9
      2B93E82B93E92B93E92A92E92B92E92B92E92A92E82B93E92B93E92B92E92B93
      E82A93E92B92E92B93E82A93E82B92E92B93E92B93E92B93E92A92E82B93E82A
      92E82B93E92B92E92B92E92B93E92B93E92A92E82B92E82B93E92B93E82B92E9
      2B92E82B92E92B93E82B92E82B92E82B92E92B92E92B93E92B92E82B93E92B93
      E92A93E92B92E82B92E92B92E92B93E82A92E82B92E92A92E82A93E82B93E82B
      93E92B92E92B93E92B92E92B92E82B92E92A93E92B93E92B92E82B93E82B92E9
      2A93E82B93E82B92E92B92E82B93E92B93E92B92E92B92E82B92E92A93E82A92
      E82A92E82B92E92B93E82B93E82B93E92B92E82B93E92B92E82B93E92B93E82B
      92E92B92E92B92E82B92E82B93E92B92E92B92E92B93E92B93E82B93E92B92E8
      2B92E92B92E82B92E82B92E82B92E82B93E92B93E82B93E82B92E82B93E82B93
      E92B92E92B92E92A92E82B92E82B93E92B92E92B93E92B92E92B93E82B92E82B
      93E92B93E92B93E82B93E82A93E92B92E82B92E82B92E82B93E82B92E92B93E8
      2B93E92B92E92B92E92B92E82B93E82B93E92B93E92B92E82A93E92B92E82B92
      E82B93E82B93E82B92E82B93E82B92E92B93E82B93E82B92E82B93E82A92E82B
      92E92B92E82B92E92B93E92B93E82B92E92B92E92B93E92B92E92B92E82B93E9
      2B93E82B93E92B93E92B93E82B93E92B92E92B92E82A92E82B93E82B93E92B93
      E82B91E82991E92891E82991E82991E92891E82991E92992E92891E82891E929
      92E82892E82991E92892E92891E82891E92891E82891E92891E92891E82992E9
      2892E92891E82891E82891E82991E82891E92891E82891E92992E82991E82992
      E92991E82891E92892E92891E92991E82891E92891E92891E82991E82891E828
      91E82992E82891E82991E92991E82992E82891E82891E82891E82891E82991E9
      2991E92891E82891E92891E82991E92891E82991E82891E92891E82892E82992
      E92991E82992E92991E92891E82891E92991E82991E82891E82891E92891E828
      92E92991E92991E82892E82992E82891E92991E82891E92892E92891E82892E9
      2892E92891E82891E82991E82892E92991E92891E82891E82891E82891E82891
      E82992E82991E92891E82891E92991E92991E92891E92991E92891E92992E929
      91E82991E92891E82891E92891E92892E82992E92991E82991E82891E92991E9
      2891E82891E82991E92891E92891E82891E82991E82991E92892E92991E92891
      E82891E92992E82891E92891E92992E82991E82991E82991E82991E82991E828
      91E82891E82992E82891E82891E92891E82991E82891E82991E92991E82991E8
      2892E92891E82891E82891E82991E82891E92991E82892E92991E82891E82992
      E82891E82992E92992E92991E82991E82991E82891E92991E82991E92991E828
      91E82991E92891E82892E82991E82891E92891E82892E92991E92991E92991E9
      2991E82991E82991E82891E92991E92891E92892E92992E92891E82991E82991
      E82992E82891E82891E92991E82991E82892E92991E82992E82990E92690E926
      90E82690E82690E82690E82690E92690E82690E92690E92690E82690E82690E8
      2690E92690E82690E92690E92690E82690E92690E92690E82690E82690E92690
      E82690E92690E82690E82690E82690E82690E92690E82690E92690E92690E826
      90E92690E82790E82690E92790E92790E92690E82690E82690E92690E92690E8
      2690E82690E82690E92690E82690E82690E82690E92690E82690E82690E92690
      E92690E82690E82690E82690E92690E92690E92690E92790E82690E92690E926
      90E82690E82690E82690E82690E82690E82690E82690E92690E92690E92690E9
      2690E82690E82690E82690E92690E92690E82690E92690E82690E82690E82690
      E92690E92690E82690E82690E82690E82690E92690E82690E92690E82690E926
      90E82690E92690E82690E82690E82690E82690E82690E82690E9268FE82690E8
      2690E82690E82690E92690E82690E92690E92690E82690E82690E82690E82690
      E92690E82690E92690E92690E92690E92690E82690E82690E92690E92690E826
      90E82690E82690E92690E82690E82690E82690E92690E82690E82690E82690E9
      2690E82690E82690E82690E82790E82690E92690E92690E82690E92690E82690
      E82690E92690E82690E82690E92690E92790E82690E92690E92690E82690E826
      90E92690E92690E82790E92690E92690E92690E92690E82690E82690E82690E8
      2690E92690E82690E92690E82690E92690E92690E92690E92690E82690E92690
      E92690E92690E92690E82690E82690E92690E82690E92690E82690E82690E926
      90E82690E82690E92790E92690E92690E8268FE9238FE8248FE8238FE8248FE9
      248EE8248FE8248FE8248EE9248FE9248FE9248FE8238FE9248FE8238FE9248F
      E9238FE8248FE8248FE9248FE8248FE8248FE9248FE8248FE9238FE8248FE823
      8EE9248FE9248FE9248EE9248FE8248FE8248EE9248FE8238FE9248FE9238FE9
      248FE8248FE8248FE8248FE9248FE8248FE9248FE9248FE8248EE9248FE8238F
      E9248FE8248FE9248FE9248EE9238FE9248FE8238FE8248FE8248FE8238EE823
      8EE8238FE9248FE9238FE9248FE9238FE8248FE9248FE8248FE8238EE8238EE8
      248FE8248FE8248FE8248FE8248FE9248FE8238FE9248FE8248FE9238FE8248F
      E8248FE8248FE8248FE8248FE9238EE9238FE8248FE9248FE8248FE9248FE824
      8FE8248FE8238EE9248EE8238EE8248FE8248FE9248FE9248FE8248FE8248FE9
      248FE9248FE9248FE8238EE9248EE8248FE8238FE8248FE8238FE9248FE8238E
      E9248FE9248FE8238FE8238EE9248FE8248FE8248FE9238FE8248FE8248EE824
      8FE8248FE8238FE9248FE8248FE9248FE8238FE9248FE9248FE8248FE8248FE8
      248FE9248FE8238FE8238FE8248FE8238FE8248FE9238FE8248FE9238FE8248F
      E8238EE8238FE8238FE8248FE8248FE8248FE8248FE8248FE8248FE9248FE824
      8FE9248FE8238FE8248FE9248FE9248FE8248FE8238EE8248EE8238FE8248FE8
      248FE8248FE8248EE8248FE8238FE9248FE8248FE8248FE9248FE9238FE8238F
      E8248EE8248FE8248EE8238FE8238FE8238FE9238EE9248FE9248FE8248FE823
      8FE8248FE9248FE8248FE9248FE8248FE8248FE8238FE9248FE8248FE8248FE9
      238FE8248FE9238EE9248EE9218DE8218DE8218EE8228DE8228EE9218EE8228E
      E9218EE8228EE8218EE8218EE8218EE8218EE8228DE9218EE9228DE8218DE922
      8DE8228DE8218DE8228EE9228EE8218EE9228DE8218DE9228EE9228EE8218DE8
      218DE8228EE8228EE8228DE8218DE8218DE8218DE8218EE8218EE8228DE8228E
      E8228DE8228EE8218EE8228EE9228EE8218DE8218EE8218EE8218EE8228EE921
      8EE8228EE8218DE9228DE8228EE8228EE8218EE9228EE8218EE8218EE9228EE9
      228DE8218DE9218DE8228EE9218EE8218DE9218DE8228EE8218EE8228EE8218D
      E8218DE9228DE8218EE9228DE9218DE8218EE8228EE8218DE9218EE8228EE821
      8DE9218EE8228EE8218DE9218DE8218DE8218EE8228EE8228EE9228EE8228EE8
      228DE8218EE8228EE8218EE9218EE9218EE8228DE8218DE9228EE9228EE8228E
      E8218EE8218EE8228DE8218EE8228DE8218DE8228EE8228EE8218EE9218EE922
      8DE8218EE8218DE8228DE9228EE9228DE8228EE8228EE8218DE8218DE8228DE8
      218EE9218EE8228DE9228EE8218EE8228DE9218DE9228DE8218DE9218EE9228E
      E9218EE8228EE8218DE8218DE8228EE8218EE8228EE8218EE8218EE8228DE821
      8DE8218DE8228DE8228EE9228EE8218DE9218EE8218EE9218EE8218DE9218DE8
      228EE9228EE8218DE9228DE9228DE8218DE9228DE8218EE9228DE8228EE9218D
      E8228EE8228DE9218EE8218DE8228DE8218EE9218EE8228DE8218EE8228DE822
      8DE8228EE8218DE9218EE8228DE8228EE9228EE8218DE8218EE8228EE9218DE8
      228DE9218DE9218EE9218EE8228EE9218EE8218EE8228EE8218EE8228DE8228E
      E8218CE8208DE91F8CE81F8CE91F8CE91F8DE81F8DE81F8CE9208CE81F8DE820
      8DE8208DE8208DE91F8DE8208DE9208CE8208DE8208DE91F8DE8208CE81F8DE8
      208CE8208CE81F8DE81F8DE91F8CE81F8CE8208DE9208CE81F8DE81F8CE9208D
      E8208CE8208DE81F8DE81F8DE8208DE8208CE81F8DE9208DE91F8DE91F8DE81F
      8DE91F8CE8208CE9208DE91F8DE81F8DE81F8CE81F8CE9208CE9208DE9208CE9
      208CE9208CE81F8DE8208CE81F8CE91F8CE9208CE9208CE8208CE91F8DE91F8D
      E91F8CE9208CE8208DE9208DE8208DE8208DE8208DE81F8DE81F8CE9208CE81F
      8CE81F8DE81F8DE9208DE8208CE8208DE8208DE8208DE81F8DE9208DE81F8CE9
      1F8DE91F8DE8208CE81F8CE81F8DE81F8DE81F8CE91F8DE81F8DE8208DE8208D
      E81F8DE8208CE8208CE8208CE81F8CE8208DE91F8DE8208DE81F8DE81F8DE81F
      8CE81F8CE81F8CE81F8DE81F8CE81F8DE81F8DE8208CE9208CE81F8CE81F8CE8
      208CE81F8DE91F8DE91F8DE81F8DE81F8DE8208DE81F8CE81F8CE9208CE8208C
      E81F8CE81F8DE8208DE81F8CE81F8DE81F8DE81F8DE81F8CE81F8DE81F8CE81F
      8CE8208DE81F8CE9208DE8208DE8208DE81F8CE8208DE81F8CE81F8DE9208DE8
      1F8CE81F8CE91F8DE81F8DE81F8CE81F8DE81F8DE8208CE81F8DE81F8DE81F8D
      E9208CE9208CE81F8DE81F8DE8208CE81F8DE91F8CE81F8DE81F8DE91F8DE81F
      8DE9208CE81F8CE81F8CE81F8CE91F8DE81F8DE81F8DE81F8DE8208DE8208DE9
      208DE91F8DE8208CE81F8DE8208CE81F8DE81F8DE91F8CE8208DE91F8DE81F8D
      E8208DE8208CE81F8DE8208CE8208DE91F8CE8208CE91F8CE8208BE81D8CE91D
      8CE81E8BE81D8CE81D8CE81E8BE81D8CE81E8CE81D8BE81E8CE81E8BE81D8BE9
      1D8BE81E8CE81D8BE91D8CE81E8CE91E8CE81D8BE81D8BE91D8CE91D8BE81D8C
      E81D8CE81D8CE91D8BE81D8CE81D8CE81E8CE81D8CE81D8CE81E8BE81D8BE81D
      8BE81D8CE91D8BE81D8BE91D8CE81D8CE81D8BE81E8CE81D8CE81E8BE81D8CE8
      1D8CE91E8CE81D8CE81D8CE81D8CE81E8CE91D8BE81E8CE81D8CE81E8BE81E8B
      E91E8CE81D8BE81E8BE81E8BE81D8CE81D8CE81D8CE81D8BE81D8BE91E8BE81D
      8BE81D8CE81E8CE91D8BE81E8CE81D8BE81D8BE81E8CE81D8CE91E8CE81D8CE8
      1D8BE81D8CE81E8CE81D8CE81E8BE91D8BE81D8CE81E8CE81D8CE81E8BE91E8C
      E81D8CE81D8CE81D8BE81D8BE91E8BE81D8CE81D8CE81D8CE81D8CE81D8BE81D
      8BE81E8CE81E8CE81D8BE81D8BE81E8BE81E8CE81D8CE91D8BE81E8BE81E8BE8
      1E8CE91D8CE81D8CE81E8CE81D8CE81D8BE81D8BE91D8BE81E8CE81D8CE81E8B
      E81D8CE81E8BE91E8BE81E8CE91E8CE91D8BE91E8CE81E8BE81E8BE81E8BE81D
      8CE81D8CE81D8CE91E8BE91D8CE81D8CE81D8CE81D8CE81E8BE81D8BE91D8BE9
      1E8CE81E8CE91E8BE81D8CE81E8CE81E8BE91D8CE81D8BE91D8CE91D8CE91D8C
      E81D8BE81D8CE81E8CE91D8BE91D8CE81D8CE81D8BE81D8BE81E8CE91E8CE81D
      8CE81E8CE91E8CE81E8BE81D8BE91D8CE91E8BE81D8CE81D8CE91D8CE81D8BE8
      1E8CE81D8BE81E8CE81D8BE91E8CE81D8CE81E8BE81D8BE81E8BE81D8BE81D8C
      E81D8CE91D8BE81D8CE91E8BE81D8CE81E8CE81D8CE81D8BE81D8BE81E8CE81E
      8BE91D8CE81E8BE81E8BE81E8BE81E8BE91D8AE81B8AE81B8BE81B8BE81B8AE8
      1C8BE81C8AE91B8BE81C8BE91C8BE81B8BE81B8BE81B8BE91B8BE81C8BE81C8A
      E81C8BE81B8BE81C8AE81B8BE81B8BE81B8BE91B8BE81B8BE81B8BE81B8AE81B
      8AE81B8AE81C8AE81B8BE81B8AE81B8BE81B8AE81B8BE81C8AE91B8BE81C8BE8
      1B8BE81C8AE81C8BE81B8BE81B8AE81B8BE81B8AE81C8AE91B8AE81B8BE81C8A
      E81B8BE91B8BE81B8AE81C8BE81B8BE81C8BE81B8BE81B8BE81B8BE81C8AE81C
      8BE91B8BE81C8BE81C8BE81C8AE81C8AE81B8BE91C8AE81B8BE81B8AE81B8AE8
      1B8BE91B8AE91C8BE81B8AE81C8AE81C8AE81C8AE81C8AE81C8BE81B8BE81B8A
      E81B8BE81B8AE81B8AE81B8AE91B8BE81C8AE81B8BE91C8BE81C8AE91B8AE81C
      8BE81C8BE81C8AE81B8AE81B8AE81B8BE81C8BE81C8AE81C8AE81C8BE81B8BE8
      1C8AE81B8AE81B8AE81B8AE81B8AE81B8BE91B8BE81B8BE81C8BE91B8BE81C8A
      E81C8BE81B8BE81C8BE91B8BE81C8BE81C8BE91B8AE81B8BE81C8AE81B8AE91B
      8AE81C8BE81C8BE81B8BE81C8AE81C8BE91C8AE81B8BE81C8BE81B8BE81B8AE8
      1B8BE81C8BE81C8BE81B8AE81B8BE81C8BE81C8AE91C8BE81B8AE91C8AE81C8A
      E81B8BE81B8BE81C8AE81C8BE81C8BE81B8AE91B8BE81C8BE81C8BE91C8AE81B
      8BE81C8AE81C8BE81B8AE81C8BE81C8BE81B8BE81C8BE81C8BE81C8BE81B8BE8
      1B8AE81B8BE81B8BE81C8AE91C8BE81B8AE81B8BE91B8BE81B8AE81C8BE91C8B
      E81B8AE81C8BE81C8BE81B8AE81C8AE81B8BE81B8AE91C8AE81B8BE81B8AE81C
      8AE81B8AE81C8AE81B8BE81B8BE81C8BE81B8BE81B8BE81B8BE81B8BE81C8AE8
      1C8BE81C8BE81B8AE81C8AE8198AE81A89E8198AE91A8AE81989E81A8AE91A89
      E81A89E91989E81A8AE81A8AE81A8AE8198AE81A89E81989E81A8AE91989E919
      8AE81989E8198AE81A8AE81989E81A8AE81989E81A89E81A8AE81989E81989E8
      1A89E91A8AE8198AE81A89E81A89E81989E8198AE81A8AE81A89E81A8AE91989
      E8198AE8198AE81A8AE81A89E81989E81A8AE81A89E81A89E8198AE81A8AE91A
      8AE81A89E8198AE81989E81A8AE8198AE8198AE81A89E81A8AE8198AE8198AE9
      198AE8198AE91A89E81A89E81A8AE8198AE81A8AE8198AE8198AE81A89E8198A
      E81A8AE8198AE8198AE9198AE81A8AE91989E81A89E8198AE8198AE81989E81A
      89E81A8AE8198AE9198AE8198AE81989E81A89E91989E8198AE81A89E81A8AE8
      1A8AE8198AE91A8AE81A89E81989E81989E81A8AE81A8AE81989E81A8AE8198A
      E81A89E81989E81989E8198AE8198AE81989E8198AE8198AE81989E81A8AE819
      8AE81A8AE8198AE81A8AE81A8AE8198AE8198AE8198AE81989E81A8AE81989E8
      198AE8198AE81A89E9198AE8198AE8198AE81989E81989E81A8AE81A89E81A89
      E81989E81A8AE81989E81A89E81989E81A89E8198AE8198AE81A8AE91989E81A
      8AE81989E8198AE81A89E81A89E8198AE81A8AE8198AE8198AE8198AE81A89E9
      1A8AE91A8AE8198AE8198AE8198AE8198AE81A8AE81989E8198AE8198AE91A89
      E8198AE81A8AE81A89E91A8AE81A89E81A89E8198AE81A89E91989E81989E819
      8AE81A8AE81A8AE8198AE81989E81989E8198AE81A89E8198AE81989E81A89E8
      1A89E8198AE81A8AE8198AE81A8AE81989E81989E9198AE81989E8198AE8198A
      E81A88E81888E81889E91889E81889E81788E81889E81788E81888E81889E818
      89E81889E91888E81889E91889E81889E81889E81889E91889E81889E81788E8
      1788E81888E91888E81889E81889E81788E81889E81889E81889E81889E81888
      E81889E81888E81889E81889E81889E81788E81889E81789E81888E81889E818
      89E81889E81789E81889E81889E91889E81789E81889E81889E81789E81888E8
      1888E81789E81889E81889E91789E81888E81788E81889E81889E81889E81889
      E81889E81888E81788E81889E81889E81889E81889E81789E81788E81888E818
      88E81789E81788E81789E91888E81888E81789E81888E81888E81888E81889E8
      1889E81889E81789E81889E81889E81889E81889E81888E81888E81889E81789
      E81889E81889E91889E81888E81889E81889E81889E81789E91888E81788E817
      89E81889E81889E91888E81888E81889E91889E81889E81889E81888E81889E8
      1889E91889E81889E81888E81889E81789E81889E91789E81889E81889E81889
      E91789E81888E81889E81889E81789E81889E81888E81889E81889E81889E818
      89E91889E81888E81889E81889E81888E81888E81889E81789E91789E81889E8
      1789E81888E81889E81889E81888E91889E81888E81889E81788E81889E91888
      E81789E81789E81889E81788E81889E91889E81788E81888E81889E81789E818
      88E91888E91889E81789E81889E81889E81889E81889E81888E81789E91889E8
      1889E91889E91789E81889E91888E81889E81888E81889E81889E81789E81889
      E91789E81789E81889E81789E81789E81888E81888E81889E81888E81788E817
      88E81688E91687E81688E81688E81788E81688E81688E81688E81688E81688E8
      1688E91688E81688E91688E81688E81687E81688E81688E81688E81688E81688
      E81688E81688E81688E81788E81688E81688E81788E81688E81688E81688E816
      87E81687E81688E81688E81688E81688E81787E81688E81687E81688E81688E8
      1687E81688E81688E81687E81688E91688E81688E91688E81687E81688E81688
      E81688E81687E81688E81688E81688E81688E81687E81688E81688E81688E816
      88E81688E81688E81688E81688E81688E81687E81687E81688E81688E81688E8
      1688E91687E81688E81688E81788E91688E81688E81688E81688E81688E81688
      E81788E81687E81687E81688E81787E81688E81688E81687E81688E81688E816
      88E91688E81687E81688E81687E81688E81688E81688E81688E81688E81688E8
      1788E81688E81688E81688E81687E81788E81688E81688E81688E81787E81688
      E81688E91687E81688E81688E81687E81687E81688E81688E91688E81688E816
      87E81688E91688E81688E81688E81688E81688E81688E81688E81687E81688E8
      1788E81688E81688E81688E81688E81688E91787E81688E81688E81688E81688
      E81688E81688E81687E81688E81688E81688E81788E81688E81688E81688E816
      88E81687E81688E81688E81688E81688E81688E81688E81688E81687E81688E8
      1688E81688E81688E81688E81688E81788E81688E81688E91688E81688E81687
      E81688E81688E81688E81688E81688E81688E81687E81688E81688E81688E816
      88E81788E81688E91687E81688E81688E81687E81587E81587E81487E81587E8
      1587E81487E81587E81587E81487E81488E81487E81487E81587E81487E81587
      E81487E81487E81587E81587E81487E81587E81587E81587E81587E91487E815
      87E81588E81587E81487E91587E81587E81587E81587E81587E81587E81587E8
      1587E81587E81587E81587E81587E81487E81587E81587E81487E81587E81587
      E81587E81487E81587E81487E81587E81587E81487E81487E81487E81587E815
      87E81487E91487E81587E81487E81587E81587E81487E81587E81587E81487E8
      1487E81587E81487E81587E81487E81587E81487E81587E81587E81587E81487
      E81487E81487E81587E81487E81587E81487E81587E91588E81587E81587E915
      87E81587E81487E81587E81487E81488E81587E81587E81587E81487E81587E8
      1487E81587E81487E81587E81487E81587E81588E81587E81587E81487E81487
      E81487E81587E81587E81487E81587E81487E81587E81487E81487E81587E815
      87E81587E81587E81587E81487E81487E81487E81587E81487E81587E81587E8
      1588E81487E91587E81587E81587E81587E81587E81487E81487E81487E81487
      E81487E81487E81587E81487E81587E81487E81587E81488E81487E81487E815
      87E81587E81487E81487E81487E81587E81587E81587E81487E81587E81587E9
      1587E81587E81587E81487E81487E81587E81488E81587E81487E81487E81587
      E81587E81488E81587E81487E81487E81587E81487E81587E81487E81587E815
      87E81587E81587E81487E91587E81587E81587E81587E81487E81587E81587E8
      1487E81487E81487E81586E81486E81386E81386E81387E81486E81387E81387
      E81386E81386E81487E81387E81386E81386E81387E81386E81386E81387E813
      87E81386E81386E81486E81386E81387E81386E81386E81386E81386E81486E8
      1387E81387E81386E81386E81386E81387E81386E81387E81386E81386E81387
      E81386E81387E81387E81487E81386E81386E81487E81387E81486E81387E813
      86E81386E81386E81387E81387E81486E81386E81387E81387E81387E81386E8
      1386E81387E81386E81387E81386E81386E81386E81387E81386E81387E81386
      E81487E81387E81387E81386E81386E81386E81386E81386E81386E81386E813
      86E81386E81386E81486E81386E81387E81386E81486E81387E81486E81386E8
      1387E81387E81387E81386E81487E81386E81387E81386E81386E81486E81386
      E81487E81387E81386E81387E81387E81386E81387E81387E81386E81386E814
      86E81386E81386E81386E81386E81387E81386E81386E81386E81387E81486E8
      1386E81386E81386E81386E81487E81387E81387E81387E81387E81387E81387
      E81387E81387E81386E81386E81487E81386E81387E81386E81386E81386E813
      87E81386E81387E81386E81386E81386E81386E81386E81387E81387E81386E8
      1387E81386E81387E81386E81386E81386E81386E81387E81387E81386E81386
      E81386E81386E81486E81386E81386E81486E81386E81387E81386E81386E813
      86E81386E81386E81386E81387E81387E81386E81386E81386E81387E81386E8
      1387E81386E81386E81386E81386E81386E81387E81386E81386E81387E81387
      E81486E81386E81386E81387E81386E81386E81386E81486E81386E81386E813
      87E81486E81486E81487E81386E81387E81486E81386E81487E81386E81386E8
      1486E81386E81387E81386E81386E81486E81387E81386E81386E81386E81386
      E81386E81387E81386E81386E81386E81386E81386E81386E81386E81387E814
      87E81386E81386E81386E81387E81386E81387E81386E81387E81386E81386E8
      1386E81386E81386E81386E81386E81386E81386E81387E81387E81386E81386
      E81387E81387E81386E81387E81386E81386E81386E81386E81387E81386E813
      86E81387E81387E81386E81487E81386E81386E81386E81386E81386E81386E8
      1387E81387E81386E81386E81386E81386E81487E81386E81386E81387E81386
      E81386E81386E81386E81487E81387E81386E81387E81387E81386E81386E813
      87E81387E81387E81387E81386E81386E81387E81386E81386E81486E81386E8
      1387E81486E81386E81387E81387E81487E81386E81386E81386E81386E81386
      E81486E81386E81386E81386E81486E81386E81387E81387E81386E81386E813
      86E81386E81387E81386E81386E81387E81386E81386E81386E81386E81386E8
      1386E81486E81387E81386E81387E81386E81387E81386E81387E81487E81386
      E81386E81386E81386E81386E81386E81386E81386E81386E81386E81386E813
      87E71386E81386E81386E81386E81386E81387E81486E81386E81486E81386E8
      1386E81387E81386E81387E81387E81386E81386E81386E81386E81487E81387
      E81386E81386E81387E81487E81386E81386E81386E81387E81389E81A8AE81A
      8AE81A8AE81A89E81A8AE81A8AE91A8AE9198AE81A8AE8198AE9198AE81989E8
      1989E81989E81A89E8198AE81A8AE91A89E9198AE8198AE81A8AE81A8AE81989
      E81A8AE81A89E81A8AE81A8AE91A8AE81989E9198AE81A8AE81A89E81A8AE81A
      8AE81A8AE8198AE81A8AE81A8AE81A8AE81A8AE8198AE81A8AE81A8AE81A89E8
      1A89E81A8AE81A8AE91A8AE81A8AE81989E81A89E81A8AE81A8AE8198AE81A8A
      E81A8AE81989E81989E9198AE81A8AE81A8AE81A8AE81A8AE81989E91A89E91A
      89E91A8AE81A89E81989E81A89E81989E8198AE81A89E81A89E81A89E9198AE8
      198AE81A8AE81A8AE81A8AE8198AE8198AE8198AE81A89E91989E81A8AE81A8A
      E9198AE81A8AE8198AE91A89E81A8AE81A8AE81A8AE9198AE81A89E81989E91A
      8AE81A8AE81A8AE81A89E81A89E81A8AE8198AE81A8AE81A8AE81A89E81A8AE8
      1A8AE81A8AE81A8AE91A89E8198AE81A8AE81A8AE9198AE81A8AE81A8AE81A8A
      E81A8AE81A89E8198AE81A8AE81A8AE81A8AE81A89E91A8AE8198AE81A8AE81A
      8AE91A8AE81989E91A8AE81A8AE81A89E81A89E81A8AE81A8AE9198AE81A8AE8
      1A8AE81A89E81A8AE8198AE91A89E81A8AE81A89E81A8AE81A89E81A8AE81A89
      E81A8AE81A8AE8198AE91A89E81A8AE81A8AE81A89E81A89E81A8AE81A8AE81A
      89E81989E81A8AE81A8AE8198AE81A8AE81A8AE81A8AE81989E81A8AE8198AE9
      1A8AE91A8AE81A8AE8198AE81A89E81A8AE91989E9198AE81A8AE81A8AE81A8A
      E81A8AE81A8AE8198AE81A8AE81A8AE81A89E91989E91A8AE81A8AE8198AE819
      89E8198AE81A8AE91A89E81A8AE81A89E8198EE8228EE8228EE8228EE8218EE8
      228EE9228EE8228EE8228EE9228EE8228DE8228EE8228EE8228EE9218EE8228E
      E8228EE9228EE9228EE8228EE8228EE9228EE8228EE8228EE9228EE8228EE922
      8DE8228DE8228EE9228EE9228EE9228EE8228DE8228EE8228DE8228EE9228EE8
      228DE8228EE8228EE9228DE8228EE8228EE9228EE8228EE8228DE9228EE8228E
      E8228EE9228DE8228EE8228EE8228EE8228EE9228DE9228EE9228EE8228EE822
      8EE8228EE8228EE8228EE8228EE8228EE8228DE8228EE9228EE9228EE9228EE8
      228EE8228DE9228EE8228EE8228EE8228EE8228EE8228EE8228EE8228EE8228E
      E8228EE8228EE8228EE9228EE8228EE8228EE9228EE8228EE9228EE8228EE822
      8EE9228EE9228DE8228EE9228DE8228EE9228EE8228EE9228EE8228EE9228EE8
      228EE8228EE8228EE8228EE8228EE8228EE8228EE8228EE9228EE9228DE9228E
      E8228EE9228EE8228EE9228EE9228DE8228DE8228EE8228EE8228EE8228EE822
      8EE8228EE8228EE9228EE8228EE8228EE8228EE8228EE8228EE8228DE9228EE8
      228EE9228EE9228EE9228EE9228EE8228EE8228DE8228EE8228EE9228EE8228E
      E9228EE9228EE9228EE8228EE8228EE8228EE8228EE9228EE9228EE8228EE822
      8EE9228DE8228EE9228EE8228EE9228EE8228EE8228EE8228EE8228DE8228EE8
      228EE9228EE9228EE8228EE8228EE9228EE9228EE8228EE8228EE9228EE9228D
      E8228EE8228EE8218EE8228EE8228EE8228EE8228EE9228EE8228EE8228EE822
      8EE9218EE9228EE8228EE9228EE9228EE9228EE9228EE8228EE8218EE9228EE8
      228EE8228EE9228DE82293E92B93E92C93E92B93E92C93E92B93E82C93E92C93
      E92C92E92C93E82C93E82C93E82C92E92B93E92C93E82C93E92C93E82C93E92B
      93E92B93E82C93E92C92E92C93E92C92E92B93E92C93E92B93E82C93E92B93E8
      2B93E92C93E82C92E92C93E92C93E92C92E82B93E82C93E82B93E82C93E92B93
      E82C93E92C93E82C92E82C93E92C93E82C93E82C93E92B93E82B93E92C93E92C
      93E82C92E92C93E82C92E92C92E82C93E92B93E92B93E92B93E92C93E92C93E8
      2C93E92C93E92C93E92B93E92B93E82C93E92C93E92B93E92B93E92C93E92C93
      E82C92E92C93E92B92E92C93E92B93E92C93E92B92E92C93E92B93E92C93E92B
      93E92C93E92B93E92B92E82C93E92B93E82C93E92C93E82B93E92B93E92C93E9
      2B93E92C93E82B93E92C93E92B93E92B93E92C93E82C93E92B92E92C93E92C93
      E92C93E82B93E82C92E92B93E82C93E92C92E92B92E92C93E92C93E92C93E92B
      93E92B93E92C93E82C93E92C93E92C93E82C93E92C92E82C93E92B93E82C93E8
      2C93E92C92E92C92E92C93E82C93E92C93E92C93E92B93E82C93E92B93E82B93
      E92B93E92C92E82C93E92C93E82B92E92C93E82C92E82C93E82C93E92B92E82C
      93E92C92E92C93E82C93E82B93E82C93E92C93E92C93E82C93E92B92E92B93E9
      2C93E82C93E82B92E82C93E92B92E92C93E92C93E82C92E82B93E92B93E82C93
      E92C93E92C93E82C92E82C93E92C93E82C93E92C93E92B93E92C93E92C93E82C
      93E92B93E92C93E92C93E92C93E82C93E82C92E82C93E92C93E92B93E92B93E8
      2C92E92C93E92B93E92B93E92C93E92C93E92C93E82B92E82B93E82C93E82B93
      E92C99E93698E93699E93799E93798E93698E93699E93798E93699E93799E937
      99E93798E83698E93798E93798E83799E93698E93698E83799E93699E83798E8
      3699E93799E93698E93698E83698E93799E83698E93699E83698E93698E93799
      E93698E93699E93799E93699E93799E93698E93699E93799E93698E83799E937
      98E93798E93799E93799E93699E93699E93698E93699E93699E93799E93798E9
      3698E93699E83798E83799E83698E93798E93699E93799E93799E93699E93698
      E93799E93699E93699E93798E83698E93699E93798E93698E93698E93798E836
      98E83798E93699E83798E83698E93799E83799E83798E93799E93798E93798E9
      3799E93699E93699E93698E93799E93798E93799E93699E93698E93798E93798
      E93799E83699E93698E93699E93699E93698E93799E93799E93799E93798E936
      98E93798E93698E83699E93798E93799E93699E93798E93798E93699E93798E9
      3799E93798E93798E93798E93799E93699E83699E93799E83699E93799E93799
      E93699E93699E93799E93798E93699E93698E93799E93798E83698E93799E936
      99E93698E93699E83798E93698E93698E93798E83798E93699E93699E93698E9
      3699E93699E93699E93799E93798E93798E93798E93799E93699E93698E93798
      E93698E93699E93698E93698E93698E93698E93798E93699E93799E93698E837
      98E93798E93698E93799E93699E93699E93798E93698E83698E93699E93698E9
      3799E93798E93698E83798E93698E93698E83799E93699E93798E93799E93799
      E93799E83698E93798E93799E93798E93698E93699E93798E9369FE9439FE943
      9EEA429EE9429FE9429FE9439EEA429FE9439FE9439FE9429FE9429FE9439FE9
      439FE9429FE9439EE9439FE9429FE9429EE9439EE9429EE9429FE9429EEA429F
      E9439FE9429FE9429FE9439FE9439EE9429EE9429FE9439FE9429FE9429FE943
      9FEA429EE9439FE9429FE9439FE9429EE9429FE9429FE9429EE9429FE9439FE9
      439FE9439EE9429FE9439EE9439EE9439EE9429FEA439FE9439EE9439EE9429E
      EA429FE9439FE9429EE9439FE9439FE9429FEA429FE9439EE9429EE9439EEA43
      9EE9429FEA429FE9439FE9439FEA439EEA439EE9439FE9429EE9439FE9439FE9
      429EE9439FE9439FE9439EE9439FE9439FEA439FE9429FE9439EE9429EE9429E
      E9429FE9439EE9429FE9439FE9439FE9429FEA429FE9439FE9439EE9429FE942
      9EE9439FE9439FE9439FE9439EE9429EE9429FEA429FE9439FE9429EE9429FE9
      429EE9429FE9439FE9439FE9439FE9439FEA429FE9439EEA429EE9439EE9439E
      E9429EEA429EE9439EE9429EE9429FE9429FEA439EE9439FE9429EE9429FE943
      9EEA429FE9439FE9439FE9439EE9439EE9429FE9429FE9429FE9439EE9439FEA
      439EE9439EE9439FE9429FE9429EE9439EE9429FE9439FE9439EEA439FEA439F
      E9429EE9439FE9439FE9439EE9429FE9439EE9429FEA439FEA439EE9429FE942
      9FE9439FE9439FE9439EE9429EE9439EEA439EEA429EE9439EE9439FEA429FE9
      439EEA439EE9439EEA439EE9439EE9439EE9439FE9429FE9439EEA439FE9429F
      E9439FE9439EE9439EE9429FE9439FEA439FE9439FE9429EE9439EEA429FE943
      9EE9439EE9439FE9429FE9439FE9429FE942A5EA4FA5E94FA5EA4FA5E950A5EA
      50A5E94FA5E94FA5E950A6EA50A5E94FA5E94FA6E94FA5E950A5EA4FA5EA4FA5
      E94FA5E94FA5E950A5EA4FA5EA4FA5EA4FA5E94FA5EA50A5E94FA5E94FA6E94F
      A5EA4FA5EA4FA5EA4FA5E94FA5E950A5E94FA6E94FA6E94FA5EA4FA6E94FA5EA
      4FA5EA50A6EA4FA5E94FA5E950A5E94FA5EA4FA5EA4FA5E94FA6E94FA5E950A5
      E950A5EA50A5EA50A5E94FA5EA4FA5EA4FA6EA4FA5E94FA5E950A5E94FA5E950
      A5E94FA5EA4FA5E94FA5E950A5E950A5E94FA5E950A5EA4FA5E950A5EA4FA5E9
      4FA5E94FA5E94FA5E94FA5EA4FA5E94FA6E94FA5EA50A5EA4FA5E950A5EA4FA5
      E94FA5EA4FA5E94FA5E94FA6EA4FA5EA4FA5E94FA5EA4FA6E950A5E950A5E950
      A5E94FA5E94FA5EA50A5EA4FA6EA4FA5EA50A5E94FA6E94FA5E94FA5EA50A5EA
      4FA5EA4FA5E94FA5E94FA6EA50A5EA50A5E950A5E94FA5E94FA5EA50A5E94FA5
      EA4FA5EA50A5EA50A5E94FA5E950A5EA4FA6E94FA5E950A5EA50A5E94FA5EA50
      A5E94FA6EA4FA6E950A6E950A5E94FA5EA50A5EA4FA5E94FA5E94FA5E94FA5EA
      4FA5EA4FA5EA4FA5EA50A5EA4FA5EA4FA5EA4FA5EA4FA5E94FA5E950A5EA4FA5
      EA50A6EA4FA5E94FA5EA50A5EA4FA6EA4FA5E94FA5E94FA5EA50A5EA50A5E950
      A5E94FA5EA4FA6E950A6E950A5EA4FA5E94FA5E94FA5E950A5E94FA5EA50A6EA
      50A5EA50A5EA4FA5E94FA5EA4FA5E94FA6E94FA5EA4FA5E94FA5E950A5E94FA5
      EA50A5EA4FA5EA4FA6EA4FA5E94FA5EA4FA5EA50A5EA50A5E94FA5EA50A6EA4F
      A5EA4FA5E94FA5E94FA5EA4FA5E94FA5EA50A5E94FA5EA50A5EA4FA6E94FA5E9
      50A5E94FA5E950A5E94FACEA5DACE95DACEA5CADE95DACEA5DACEA5DACEA5DAC
      EA5CACE95DACEA5DACEA5DACEA5DACEA5DACE95DACE95DACE95DACEA5DACEA5D
      ACEA5DACEA5DACEA5DACE95DACEA5DACEA5DACEA5DACEA5CACE95DACEA5DACEA
      5DACEA5DACEA5DACEA5DACEA5DACEA5DACEA5DACEA5DACE95DACE95DACEA5DAC
      E95DACEA5DACEA5DACEA5DACEA5CADE95DACE95DACE95DACEA5DACE95CACEA5D
      ACEA5DACEA5DACE95CACEA5DACEA5DACE95DACEA5DACE95DACEA5DACEA5DACEA
      5CACEA5DACEA5DACEA5DACE95DACEA5DACEA5DACEA5DACE95DACEA5DACEA5DAC
      E95DACEA5DACEA5DACEA5DACEA5DACEA5DACEA5CACEA5CACEA5DACEA5DACE95C
      ACEA5DACE95DACE95DADEA5DACEA5DACEA5DACEA5DACEA5DACEA5DACE95DACEA
      5DACEA5DACEA5DACEA5DACEA5DACEA5DACE95DACEA5DACEA5DACEA5DACEA5DAC
      EA5DACE95DACEA5DACEA5DACE95DACEA5DACEA5DACEA5DACEA5DACEA5DACEA5D
      ACEA5DACEA5DACEA5DACEA5DACEA5DACEA5CACEA5DACEA5DACEA5CACEA5DACEA
      5DACEA5DACEA5DACEA5DACEA5DACEA5DACEA5DACEA5DACEA5DACEA5DACEA5DAC
      EA5CACEA5DACEA5DACEA5DACEA5DACEA5DACEA5DACEA5DACEA5DACEA5DACEA5D
      ACE95DACEA5DACEA5DACEA5DACE95DACEA5DACEA5DACEA5DACEA5DACEA5DACE9
      5DACEA5DACEA5DACEA5DACE95CACEA5CACEA5CACE95DACEA5DACEA5DADEA5DAD
      EA5DACEA5DACEA5DACEA5DACEA5DACEA5DACEA5CACEA5DACEA5DACEA5DACEA5D
      ACEA5DACEA5DACE95DACEA5DACEA5CACEA5CACE95CADE95DACEA5DACEA5DACE9
      5DACEA5DACEA5DACEA5DACEA5DACE95DACEA5DACEA5DADE95DACEA5DACE95DAC
      EA5DB3EA6BB3EB6BB3EA6BB3EA6BB3EA6BB3EA6BB3EA6BB3EA6BB4EA6AB3EA6B
      B3EA6BB3EA6BB4EB6BB3EA6BB4EA6BB3EA6BB3EB6AB3EA6BB3EB6AB3EA6BB3EA
      6BB4EB6AB3EA6BB3EA6BB4EB6BB3EB6BB3EA6BB4EA6BB4EA6AB3EA6AB3EA6BB3
      EA6BB3EA6BB3EA6BB3EB6BB3EA6BB3EA6BB4EA6BB4EA6BB3EA6BB3EA6BB3EA6B
      B4EA6BB3EA6BB3EA6BB3EB6BB3EA6BB3EA6BB3EA6BB3EA6BB3EB6BB3EA6BB4EA
      6AB3EA6BB3EA6BB4EA6BB4EA6BB4EA6BB3EB6BB3EA6BB3EB6BB3EA6BB3EA6BB3
      EB6BB3EA6BB3EB6BB3EA6AB3EA6BB3EA6BB3EA6BB4EA6BB3EA6BB3EA6BB3EA6B
      B3EA6BB3EA6BB3EA6BB4EA6BB3EA6BB4EA6BB4EA6BB3EA6BB4EA6BB3EA6BB3EA
      6BB3EA6BB3EA6BB3EA6BB3EA6BB3EB6BB3EA6AB3EB6BB4EA6BB3EA6BB3EA6BB3
      EA6BB3EA6BB3EA6BB3EB6BB3EA6BB3EA6BB4EA6BB4EA6BB3EA6BB3EA6BB3EA6A
      B3EA6BB3EA6BB3EA6BB3EA6BB3EB6AB4EA6BB3EA6BB3EA6BB4EA6BB3EA6BB3EA
      6BB4EA6AB4EB6BB3EA6BB3EA6BB3EA6BB4EA6BB3EA6BB3EA6BB3EA6BB3EA6BB3
      EA6BB3EA6BB3EA6AB3EA6BB3EB6BB3EA6BB3EA6AB3EB6AB3EA6BB3EB6BB3EB6B
      B4EA6BB3EA6BB3EA6BB3EA6BB3EA6AB3EA6BB3EA6BB3EA6BB3EA6BB3EA6BB3EA
      6BB3EA6AB3EB6BB3EA6BB4EA6BB3EA6BB3EB6BB3EA6BB3EA6BB4EA6BB3EA6BB3
      EA6BB3EB6BB3EA6BB3EA6AB3EA6AB3EA6BB3EA6BB4EA6AB3EA6BB4EA6BB3EA6B
      B3EA6BB4EA6BB3EA6AB3EA6AB4EA6BB3EA6BB3EA6AB4EA6BB3EA6BB3EA6BB3EA
      6BB3EA6BB3EB6BB3EA6BB3EA6BB3EB6BB3EA6BB3EA6BB3EA6BB3EB6BB3EA6BB3
      EA6BB3EA6BB3EB6BB3EA6BB4EA6BB3EB6BB4EA6BB3EA6BB3EB6BBAEA79BAEB79
      BAEA7ABBEB79BAEB79BAEA79BAEB7ABAEA79BBEB79BBEB79BBEA79BAEA79BAEA
      79BBEB79BBEA79BBEB7ABAEA79BAEB79BAEA79BBEA79BBEA7ABAEA79BAEB79BB
      EB79BAEA79BAEA79BAEB79BAEA79BBEA79BAEB79BBEB79BBEA79BBEA7ABAEB79
      BAEB7ABBEA79BBEB79BAEA79BAEA79BAEA79BAEA79BAEB7ABAEB79BAEB7ABAEA
      79BAEA79BAEB79BAEA7ABAEB79BAEA79BAEA79BBEB79BAEA79BBEA79BBEB7ABA
      EB7ABBEB79BBEA79BBEB7ABBEA79BAEA79BBEA79BAEA79BBEA79BBEA79BAEA79
      BBEA79BBEA79BAEA79BAEB79BAEB79BAEB79BAEA7ABAEB79BAEA79BAEB79BBEA
      79BAEA79BBEB79BBEB79BBEB79BAEA79BBEB79BAEB79BBEB79BAEA79BBEA79BA
      EB79BAEA79BBEA79BAEA79BBEA79BBEB79BBEA79BBEB79BAEA79BAEA79BBEA79
      BAEA79BAEA79BAEB79BAEB79BBEA79BAEB79BAEB79BBEA79BBEB79BBEB79BBEB
      79BBEA79BBEA79BAEB79BAEB79BAEA79BBEA79BBEA79BAEA79BBEB79BAEB7ABB
      EB79BAEB79BAEB7ABBEA7ABAEA79BBEA79BAEB79BAEA79BAEA79BAEA79BAEB79
      BAEA7ABAEA79BBEA79BBEA79BBEA7ABBEA79BAEB79BAEB79BAEA79BBEA7ABBEA
      79BAEA79BBEB79BAEB79BAEB79BBEB79BAEA79BAEB79BAEB79BBEB79BAEA79BA
      EB79BBEA79BAEA79BAEA79BAEB79BBEB79BAEA79BBEA79BBEB79BAEB7ABBEA79
      BAEB7ABBEB79BAEB79BAEA79BBEA79BBEA79BAEA79BBEB7ABAEA79BAEB7ABBEA
      7ABAEA79BAEA79BBEB79BBEA79BAEB79BBEA79BAEA79BBEB79BBEA79BAEB79BB
      EA79BAEB79BAEB79BBEA79BBEB7ABAEB79BAEB7ABBEA79BBEB7ABBEB79BAEB79
      BAEA7ABAEA79BAEB79BBEA79BBEB79BAEA79C2EB88C2EB87C2EB88C2EB88C2EB
      87C2EB87C1EB87C2EB88C2EB88C2EB88C2EB87C2EA87C1EA88C1EB87C2EB87C2
      EA87C2EB88C2EB88C1EA87C2EB88C1EA88C2EB87C2EA87C1EB87C2EA88C1EB88
      C2EB87C2EA88C1EB87C2EA88C2EB87C2EB87C1EA88C2EB87C2EB88C2EB87C2EB
      87C2EB88C1EA87C2EA87C2EA88C2EA87C2EB88C2EB87C2EB88C2EB88C2EB88C1
      EB88C2EB87C2EB87C2EA87C2EB87C2EB87C2EB87C2EB88C1EB88C1EB87C2EA87
      C2EB87C2EB87C2EB88C2EB88C2EB88C2EB87C2EB88C2EA88C1EA88C2EB88C2EA
      88C2EB87C2EB87C2EB88C2EB87C2EB88C2EB88C2EB87C2EA88C2EB87C2EB88C1
      EB88C2EB87C2EB87C2EB87C2EB87C1EA87C2EB88C2EB88C2EB88C2EB87C2EB88
      C1EB88C2EA88C2EB88C2EB88C2EB88C2EB88C2EB87C1EB88C2EB88C2EB88C2EB
      88C2EB88C2EB87C2EB88C2EB88C2EA88C2EA87C2EA88C2EB88C2EB88C2EB88C2
      EB88C2EB88C2EB87C2EB87C1EA88C2EB87C2EB88C2EB87C2EB87C2EB88C2EB87
      C2EB87C1EA88C2EA87C2EB88C2EB88C2EA87C2EB87C2EA87C1EB88C2EB88C2EB
      87C2EB88C2EB88C2EB88C2EB88C2EB88C2EB87C2EB88C2EB88C2EB88C2EB87C2
      EB88C2EB88C2EB87C2EB88C2EB87C2EA88C2EB88C1EB88C2EB88C1EB87C2EB87
      C1EA87C2EB88C2EA87C2EB88C2EB87C2EB88C2EB88C2EB87C2EB87C2EB87C2EB
      87C2EA88C2EB88C2EA88C2EB88C2EA88C2EB87C2EB87C2EB88C1EB88C2EB87C2
      EB88C2EB87C1EA88C2EB88C2EB87C1EB88C2EB87C2EB87C2EB87C2EB87C2EB87
      C2EB88C2EA87C2EB88C2EA88C2EB88C2EB88C2EB87C2EB87C2EB88C2EB88C2EB
      88C1EB88C2EB88C1EB88C9EB96CAEB95C9EB96C9EB95C9EC96C9EB96C9EC95C9
      EB96C9EB96C9EC96C9EB96C9EB95C9EC95C9EB96C9EC96C9EB96C9EB95C9EB96
      C9EC96CAEC96C9EB96C9EC96C9EC96C9EC96C9EB96CAEB95C9EC96C9EB96C9EB
      96C9EB96C9EB95C9EC95CAEC96C9EB96C9EB96C9EB95C9EB95C9EB96C9EB95C9
      EB95C9EB95C9EB96C9EB96C9EB96C9EB96C9EB96C9EB96C9EB96C9EB95C9EB96
      C9EB96C9EC96C9EC95CAEB96C9EC96C9EB96CAEB96C9EB96CAEB96C9EB96C9EB
      96C9EB96C9EB96C9EB95C9EB96C9EB96C9EB95C9EC96C9EB96C9EB95C9EB95CA
      EB95C9EB96C9EB96C9EB96C9EB96C9EB96CAEB96C9EB96C9EB96C9EB96C9EB95
      CAEB96C9EC95C9EB96C9EB96C9EB95C9EB96CAEB96C9EB96C9EB96CAEB95C9EC
      96C9EB96CAEB95C9EB95C9EC96C9EB95C9EB96C9EB96C9EB96C9EC96C9EB96C9
      EB96C9EB96C9EB95C9EB95C9EB95C9EB96C9EC96CAEB96C9EB96C9EB96C9EB96
      C9EC96C9EB96C9EB95C9EB96C9EB95C9EB96C9EB95C9EB95C9EB96C9EB96C9EC
      96C9EB95CAEB96C9EB95C9EB96C9EB95C9EB96C9EB96C9EB96C9EC95C9EB96C9
      EB96C9EB96C9EB96CAEC96CAEB95C9EB96C9EB95C9EC96C9EB96C9EB95C9EB96
      C9EB95C9EB96C9EB96C9EB95C9EB96C9EC96C9EB96C9EC96C9EB96C9EB96C9EB
      95C9EB96C9EB96C9EB95C9EC96C9EB95C9EB95C9EB96C9EB95C9EB95C9EB96C9
      EC95C9EB96C9EC95C9EB96C9EC95C9EC96C9EB96C9EB96C9EB96C9EB96C9EB96
      C9EB95C9EB96C9EB96C9EB95CAEB96C9EC96C9EB96C9EC96C9EB95C9EB96C9EB
      96C9EB96C9EB95C9EB96C9EC96C9EB95C9EB96C9EB95C9EB95C9EB96C9EB96CA
      EB96D0EBA4D1ECA4D1ECA3D0ECA4D0EBA4D0ECA4D1ECA3D0ECA4D0ECA3D0ECA3
      D0EBA3D0ECA4D0ECA4D0ECA4D1EBA4D0EBA3D0EBA4D0ECA4D0ECA4D0ECA4D0EC
      A3D0ECA3D0EBA4D0ECA4D0EBA3D1EBA4D0ECA3D0ECA4D0ECA4D0EBA3D0EBA4D1
      EBA4D0ECA4D0EBA4D0ECA4D0ECA4D0EBA4D0ECA4D0EBA4D0ECA3D0ECA4D0ECA4
      D1EBA4D0ECA4D0ECA3D0ECA4D1EBA4D0EBA3D0ECA4D0EBA4D0EBA3D0EBA4D0EC
      A3D0ECA4D0ECA4D0ECA4D0ECA4D0ECA4D0EBA4D0EBA4D0ECA4D0ECA3D0ECA4D0
      EBA4D0EBA4D0ECA4D1EBA4D0ECA4D0EBA4D1ECA3D0ECA4D0EBA4D1ECA4D0EBA4
      D1ECA3D0ECA4D0ECA4D0ECA4D0EBA4D0ECA4D0ECA3D0ECA3D1ECA3D0EBA4D0EC
      A4D0EBA4D0ECA4D0EBA4D0ECA4D0ECA3D0EBA4D1ECA4D0EBA4D0EBA4D0ECA4D0
      ECA4D0ECA3D0ECA3D0ECA4D0ECA4D0EBA4D0EBA4D1EBA3D0EBA4D0EBA4D0ECA4
      D0EBA3D1ECA3D0EBA4D0EBA3D1EBA4D1EBA4D1EBA3D0ECA3D0ECA4D1ECA4D1EC
      A3D0ECA4D0ECA4D0EBA4D0EBA4D0ECA4D0EBA4D0EBA3D1EBA3D0EBA4D0ECA4D1
      EBA3D1ECA3D0EBA4D0ECA4D0EBA4D0ECA4D1EBA4D0ECA3D0ECA3D0EBA3D1ECA4
      D1EBA4D0EBA4D0ECA4D0EBA4D0ECA4D0EBA3D0EBA3D0EBA3D0ECA3D0ECA4D0EB
      A4D0ECA3D0ECA4D0ECA4D0ECA4D1EBA4D0ECA4D0EBA4D1EBA4D0ECA4D0EBA4D0
      ECA4D1EBA4D1ECA3D0EBA4D0ECA4D0ECA4D0ECA4D1EBA4D0ECA4D0ECA3D0ECA4
      D0ECA4D0EBA4D0ECA4D0ECA4D0ECA4D0ECA4D0ECA3D0EBA4D0EBA4D0EBA4D0EC
      A3D0ECA4D0EBA4D0ECA4D0ECA3D0ECA4D1ECA3D1EBA4D0EBA4D0ECA4D0ECA4D0
      EBA4D0ECA4D0ECA4D1EBA4D1EBA4D1EBA4D1ECA4D0ECA4D0ECA4D7ECB1D7ECB1
      D7EBB1D8EBB1D8ECB1D7ECB1D8ECB2D8ECB1D8ECB2D7ECB1D7ECB1D7ECB1D7EC
      B1D7ECB1D7ECB1D7ECB2D7ECB2D7ECB1D7ECB1D7ECB1D7ECB1D7EBB2D8ECB1D7
      EBB1D8ECB1D7ECB2D7ECB1D7ECB2D7ECB2D7ECB1D7ECB1D7ECB1D7EBB1D7ECB2
      D7ECB1D7ECB1D7ECB1D8ECB1D7ECB1D8ECB2D7ECB1D7ECB2D7EBB1D7ECB1D7EC
      B2D7ECB2D7ECB1D7EBB2D7ECB1D7ECB2D7ECB1D7ECB1D7ECB1D8ECB1D7ECB1D7
      ECB2D8ECB2D7EBB1D7ECB1D7ECB2D8ECB1D7ECB1D8ECB1D7ECB1D7ECB1D7ECB2
      D7EBB1D7ECB1D7ECB1D7ECB1D7ECB1D7EBB1D7ECB1D7ECB1D7ECB2D7ECB2D7EC
      B1D8ECB1D7ECB1D7ECB2D7ECB1D7ECB1D8ECB1D8ECB1D7ECB1D7ECB1D7ECB1D8
      ECB1D7ECB1D7ECB1D7EBB2D8ECB1D7ECB1D7ECB2D7ECB1D7ECB1D7ECB1D7EBB1
      D7EBB1D8ECB1D8ECB1D7ECB1D7EBB1D7ECB1D7ECB2D8ECB1D7ECB1D7ECB1D7EC
      B2D7ECB1D7EBB2D7ECB1D7ECB1D8EBB1D7ECB1D8ECB1D7ECB1D7ECB2D7EBB2D7
      ECB1D7ECB1D7ECB2D7ECB2D8EBB1D7ECB2D8EBB1D7ECB1D7ECB1D7ECB1D7EBB1
      D7ECB1D7ECB2D7ECB2D8ECB1D8ECB1D8ECB1D7ECB1D7ECB1D7ECB1D7ECB1D7EB
      B2D7ECB1D7ECB2D7ECB1D7ECB1D7ECB2D7EBB1D7ECB1D8EBB1D7ECB1D8ECB1D7
      ECB1D7ECB1D7ECB1D7ECB2D7EBB1D7ECB1D7ECB1D7ECB2D8ECB1D7EBB1D7ECB1
      D7EBB1D7ECB1D7ECB1D8EBB1D7EBB1D7ECB1D7ECB1D7ECB1D7ECB1D7ECB1D7EC
      B1D7ECB2D7ECB2D8ECB1D7ECB2D8ECB1D7ECB1D7ECB1D7EBB1D7ECB1D7ECB1D7
      EBB1D7ECB1D8ECB2D7ECB1D7EBB1D7EBB2D7ECB2D7ECB1D7ECB1D7EBB1D7EBB2
      D7ECB1D7ECB2D7ECB2D7ECB1D7EBB1D7ECB1DEECBEDEECBEDEECBEDEECBEDEEC
      BEDDECBEDEECBFDEECBEDEECBEDEECBEDEECBEDEECBEDEECBEDEECBEDEECBEDD
      ECBEDDECBEDEEDBEDEECBEDDECBEDEECBEDDECBEDEECBEDEECBEDEECBEDEECBE
      DEECBEDEECBEDEECBEDEECBEDEECBEDDEDBEDEECBEDEECBEDDECBEDEECBEDEEC
      BEDDECBFDEECBEDDECBEDDECBEDEECBEDDECBEDEECBEDEECBEDDECBEDEECBEDE
      ECBEDEEDBEDDECBEDEECBEDEECBEDEECBEDEECBEDEECBEDDEDBEDDECBEDEECBE
      DDECBEDEECBEDEECBEDEECBEDEECBEDDECBEDEECBEDDECBEDEECBEDEECBEDEEC
      BEDEECBEDEECBEDEECBEDDECBEDEECBEDDECBEDDECBEDEEDBEDDECBFDEECBEDD
      ECBEDEECBEDEECBEDEECBEDEECBEDEECBEDDECBEDDECBEDEECBEDEECBEDEECBE
      DEECBEDEECBEDDECBEDEECBEDEECBEDEECBEDEECBEDDEDBEDEECBEDEECBEDDEC
      BEDEECBEDEEDBEDDEDBEDDECBEDEECBEDDECBEDDECBEDDECBEDEECBFDDECBEDE
      ECBFDEECBEDDECBEDEECBEDEECBEDEECBEDEECBEDEECBEDEECBEDDEDBEDEECBE
      DEECBEDEECBEDEECBEDEECBEDDECBEDEECBEDDECBEDEECBEDEECBEDDECBEDEEC
      BEDEECBEDEECBEDEECBEDDECBEDEECBEDEECBEDEECBEDEECBEDEECBEDDECBEDE
      ECBEDDECBEDEECBEDDECBEDEECBEDEECBEDEECBEDDECBFDEECBEDEECBEDEECBE
      DEECBEDEECBEDEECBEDDECBEDEEDBEDEEDBEDEECBEDDECBEDEECBEDEECBEDEEC
      BEDDECBEDDECBEDDECBEDEECBEDEECBEDEECBEDDEDBEDDECBFDEECBEDEECBEDE
      ECBEDDECBEDDECBEDEECBFDEECBEDEECBEDEECBEDEECBEDDECBEDDECBEDEECBF
      DEECBEDEEDBEDDECBFDDECBEDEECBEDEECBEDDECBEDEECBEDDECBEDDECBEDDEC
      BEDEEDBEDEECBEDEECBEE4EDCAE3ECCAE3ECCBE4EDCAE4ECCAE4EDCAE4EDCAE4
      ECCAE4EDCAE4EDCAE4ECCAE4ECCAE4ECCAE4EDCAE3EDCBE4EDCAE4ECCAE4EDCA
      E3EDCAE4ECCAE4EDCAE4ECCAE4ECCAE4EDCAE3ECCAE4ECCAE4ECCAE4ECCAE4EC
      CAE3ECCAE4ECCAE4ECCAE4ECCBE4ECCAE4ECCAE4EDCAE4EDCBE4ECCAE3EDCAE4
      ECCAE4ECCBE4EDCAE3ECCAE4EDCAE4EDCAE4ECCAE3EDCBE4EDCAE4ECCAE4ECCA
      E4EDCAE4ECCAE4ECCAE4ECCAE4EDCAE4ECCAE4ECCAE4EDCAE4ECCAE4ECCAE4EC
      CAE4ECCAE3EDCAE4ECCAE4EDCAE4EDCAE4EDCAE4ECCAE3EDCAE4ECCBE4EDCAE4
      EDCAE4ECCAE4ECCAE4ECCAE4ECCAE4EDCAE4ECCAE4EDCAE4ECCBE4ECCAE3ECCA
      E4ECCAE4EDCAE4EDCAE4ECCAE4EDCAE4EDCAE3EDCAE4EDCAE4EDCAE4ECCAE3ED
      CAE4EDCAE4ECCBE4EDCAE4EDCAE4EDCAE4ECCAE4ECCAE4ECCAE3EDCAE4ECCBE4
      EDCAE4EDCBE3ECCAE3ECCAE4ECCAE4EDCBE3ECCAE4ECCAE4ECCAE4ECCAE4ECCA
      E4ECCAE4EDCAE4ECCAE4ECCAE4ECCAE3ECCAE4EDCAE4EDCAE4ECCAE4EDCAE4ED
      CAE4ECCAE4ECCAE4ECCAE4EDCAE4EDCAE4ECCAE4EDCAE4ECCAE3EDCAE4ECCAE4
      ECCAE4ECCAE4ECCAE4EDCAE4EDCAE3EDCAE4EDCAE4ECCAE4ECCAE4EDCBE4ECCB
      E4ECCAE4ECCAE4ECCAE4ECCAE4ECCBE4EDCAE4ECCAE3EDCAE3ECCAE4EDCAE4EC
      CAE4EDCAE4ECCAE4ECCAE4EDCAE3EDCAE4ECCAE4EDCAE4EDCAE4EDCAE3ECCAE4
      EDCAE4ECCAE4EDCAE4ECCAE4ECCAE4ECCAE3ECCAE4EDCAE4ECCBE4EDCAE4ECCA
      E4EDCAE4EDCAE4ECCAE4ECCAE4EDCAE4EDCAE4ECCAE4EDCAE4EDCAE4ECCBE4EC
      CAE3EDCBE4EDCAE4EDCAE4ECCAE4ECCAE4ECCAE4EDCAE4ECCBE4ECCAE4EDCAE4
      EDCAEAEDD5E9EDD5E9EDD5E9EDD5EAECD5E9ECD5E9EDD5E9ECD5EAECD5EAEDD4
      EAEDD5E9EDD5EAEDD5E9EDD5EAECD5E9EDD5E9EDD5E9ECD5E9EDD4EAECD5EAED
      D5EAECD5EAECD5E9ECD5E9ECD5EAEDD5E9ECD5E9EDD5EAEDD4EAEDD5E9EDD5E9
      EDD5EAEDD5E9EDD5E9EDD5E9EDD5E9ECD5E9EDD5E9EDD5E9EDD5E9EDD5EAEDD5
      E9EDD5E9EDD5EAEDD5E9EDD5E9ECD4EAEDD5EAECD5E9ECD5E9EDD5E9ECD5E9ED
      D5E9EDD5E9EDD5EAEDD5E9EDD5E9ECD4E9ECD5E9EDD5E9ECD5EAECD4E9EDD5E9
      EDD5E9EDD4E9EDD5E9EDD5E9EDD5E9ECD5E9ECD5E9ECD5EAEDD5EAEDD5E9EDD5
      EAECD5E9EDD5E9EDD5E9EDD5EAEDD5E9EDD5E9ECD5E9ECD5E9ECD5E9EDD5E9ED
      D5EAECD5EAECD5EAEDD5EAEDD5E9ECD5EAECD5E9EDD5E9EDD5EAEDD5EAEDD5EA
      EDD5E9ECD5E9EDD5EAEDD5E9EDD4E9EDD5EAEDD5E9EDD5E9EDD5E9ECD5E9EDD5
      E9EDD5EAEDD5EAEDD5E9ECD5EAEDD5E9EDD5EAECD5E9EDD5E9EDD5EAEDD5E9ED
      D5EAEDD5EAEDD5E9ECD5EAEDD5E9EDD5E9EDD5EAECD5EAECD5E9ECD5EAEDD5E9
      EDD5EAEDD5E9EDD5E9ECD5E9EDD5E9EDD5EAEDD5EAEDD5E9EDD5EAECD4EAECD5
      E9ECD5EAEDD5E9ECD5EAEDD5EAEDD5E9EDD5E9EDD4E9ECD5E9EDD5EAECD5E9ED
      D5E9EDD5EAEDD5E9EDD5E9EDD5E9ECD5EAECD5E9ECD5EAEDD5EAEDD5E9ECD5EA
      EDD5E9ECD5E9EDD5E9EDD5E9EDD5EAECD4EAEDD5E9EDD5E9EDD5E9EDD5E9EDD5
      E9EDD5EAEDD5EAEDD5E9ECD5E9ECD5E9EDD5E9EDD5E9EDD5EAEDD5EAECD5E9EC
      D5E9EDD5EAEDD5E9EDD5E9ECD5E9EDD5E9EDD4E9EDD5EAEDD5E9ECD5E9ECD5E9
      EDD5E9ECD5E9EDD5EAEDD5E9EDD5EAEDD5EAECD5EAECD4E9EDD5EFEDDFEEEDDE
      EFEDDEEEEDDEEFEDDFEEEDDFEEEDDFEEEDDFEFEDDEEEEDDEEEEDDFEFEDDFEEEC
      DEEEEDDEEEEDDFEEEDDFEEEDDFEFEDDEEFEDDEEFEDDEEEEDDFEEEDDFEFEDDFEE
      EDDFEEEDDFEFEDDFEEEDDFEFEDDEEEEDDFEEEDDFEEEDDEEFEDDFEFEDDEEEEDDE
      EEEDDFEFEDDFEEEDDEEEEDDFEFECDFEEEDDFEEEDDEEFEDDFEEEDDFEEEDDFEEED
      DFEFEDDFEEEDDFEEEDDFEFEDDFEEEDDEEEEDDFEEEDDFEEEDDFEFEDDFEFECDEEF
      EDDFEEEDDFEEEDDEEFECDFEEEDDEEFEDDFEEEDDFEFEDDFEFECDFEEEDDFEEEDDF
      EEEDDEEFEDDFEFECDFEFEDDEEEEDDEEEEDDFEEEDDFEEECDFEEEDDFEEEDDFEFED
      DEEEEDDEEFEDDFEFEDDEEEEDDFEFEDDFEEEDDFEFEDDEEEEDDFEFEDDEEFEDDFEE
      EDDEEFEDDFEEEDDFEEEDDEEFEDDEEEEDDEEEEDDEEFEDDFEEEDDFEEEDDEEEEDDF
      EEEDDEEFEDDFEEEDDFEEEDDFEFEDDEEEEDDFEEEDDFEEEDDEEEEDDFEFEDDEEEED
      DFEFEDDEEEEDDEEFEDDEEFEDDFEEEDDEEEEDDEEEEDDEEEEDDFEFEDDFEEEDDEEE
      EDDEEEEDDFEFEDDFEFEDDFEEEDDFEEEDDFEFEDDFEEEDDEEEEDDFEFEDDFEEEDDF
      EEECDEEFEDDFEEEDDFEEEDDEEEEDDFEEEDDFEEEDDFEFECDEEEEDDFEFEDDFEEED
      DFEEEDDEEFECDFEFEDDEEFEDDFEEEDDFEEEDDFEFEDDFEEEDDEEFEDDFEEEDDFEF
      EDDFEEEDDFEEEDDFEEEDDEEFEDDEEFEDDFEEEDDFEFEDDFEFEDDEEEEDDEEFEDDE
      EEEDDFEEEDDFEFEDDEEFEDDEEFEDDFEFEDDEEEEDDEEFEDDEEFEDDEEFEDDEEEED
      DEEEEDDFEEEDDFEEECDEEEEDDEEEEDDFEEEDDFEFEDDFEFEDDFEEEDDFEFEDDFEE
      EDDEEFEDDEEEEDDEEEEDDFEFEDDFEEEDDFEEEDDEEFEDDFEFEDDFEEEDDFEEEDDF
      EFEDDFEFECDFEFEDDFEFEDDFEEEDDFEEEDDEF3EDE6F3EEE7F3EDE7F3EDE6F3ED
      E6F2EDE6F3EDE7F3EDE7F3EEE7F3EDE6F3EDE7F3EDE7F2EDE7F2EDE6F3EDE7F3
      EDE7F3EDE7F2EDE7F3EEE7F3EDE7F2EDE7F2EDE7F3EDE7F2EDE7F2EDE7F2EEE7
      F3EDE7F2EDE7F3EDE7F2EDE7F2EDE7F3EDE7F2EDE7F2EDE6F3EDE7F3EDE7F2ED
      E7F3EDE6F2EEE7F3EDE7F3EDE7F3EDE7F3EEE7F3EDE6F3EEE7F2EDE7F3EDE7F2
      EDE7F3EDE7F3EDE7F2EEE7F2EDE7F3EDE6F3EDE7F3EDE6F3EEE7F3EDE7F3EEE7
      F2EDE7F3EDE7F2EEE6F3EDE7F3EDE7F3EDE7F3EDE7F2EDE7F3EDE6F2EEE7F2ED
      E7F2EDE7F2EDE7F2EDE7F3EDE7F3EDE7F2EDE7F3EDE7F3EDE7F2EEE7F2EDE7F3
      EDE7F2EDE7F3EDE7F2EEE7F3EDE7F3EDE7F2EDE7F2EDE7F3EDE6F2EDE7F3EDE7
      F3EDE7F3EDE7F2EDE7F2EEE7F2EDE6F3EDE7F3EDE6F3EDE6F2EDE6F3EDE6F3ED
      E7F3EDE7F3EDE7F3EDE7F3EDE7F3EEE7F2EDE7F3EDE7F3EDE7F2EDE7F2EDE7F3
      EDE7F3EEE7F2EDE7F3EDE7F2EDE7F2EDE7F2EDE7F2EDE7F2EDE7F2EEE6F2EDE7
      F3EDE7F2EEE7F2EDE7F3EDE7F2EEE7F3EDE7F2EDE7F3EDE7F2EDE6F3EDE7F2ED
      E7F3EDE6F2EDE7F3EDE7F2EDE7F3EDE7F3EDE7F2EDE7F2EDE7F3EDE7F2EDE7F3
      EDE7F2EDE7F3EDE7F2EDE7F3EDE7F3EDE7F3EDE7F2EDE7F2EDE6F2EDE7F3EEE7
      F2EDE7F3EEE7F2EDE7F3EDE7F3EEE7F3EDE7F2EDE7F3EDE7F3EDE6F2EDE7F2ED
      E7F3EDE7F3EDE6F3EDE7F2EDE7F2EDE6F2EDE6F3EEE7F2EDE7F3EDE7F2EDE7F3
      EDE7F2EDE7F2EDE7F3EDE7F3EDE7F3EDE7F3EDE7F3EDE7F3EEE6F2EDE7F2EDE7
      F3EDE7F3EDE7F2EDE7F3EDE7F2EDE7F2EDE7F3EDE7F2EDE7F3EDE7F2EDE7F3ED
      E7F3EDE7F3EDE7F2EDE7F6EEEDF6EDEEF6EEEDF6EEEEF6EEEEF6EDEEF6EEEDF6
      EDEDF6EDEDF6EDEDF6EEEEF6EEEEF6EDEDF6EDEEF6EDEEF6EDEDF6EDEDF6EDED
      F6EEEEF6EDEEF6EDEDF6EDEEF6EDEEF6EDEDF6EDEDF6EEEEF6EDEEF6EEEEF6EE
      EEF6EDEDF6EDEDF6EDEEF6EDEDF6EDEDF6EDEEF6EDEDF6EEEEF6EDEEF6EDEDF6
      EDEEF6EDEEF6EEEEF6EDEDF6EDEDF6EEEDF6EDEDF6EDEDF6EDEDF6EDEDF6EDED
      F6EDEDF5EDEDF6EEEDF6EEEEF6EDEEF6EDEEF6EDEDF6EDEEF6EDEDF6EDEEF6EE
      EDF6EDEDF6EDEEF6EDEEF6EEEEF6EDEEF6EDEEF6EDEDF6EDEEF6EDEEF6EDEEF6
      EDEDF6EDEEF6EDEEF6EDEEF6EDEDF6EEEEF6EDEEF6EEEDF6EEEEF6EEEEF6EDED
      F6EEEDF6EDEDF6EEEDF6EEEEF6EDEDF6EEEDF6EDEDF6EDEEF6EDEEF6EDEEF6ED
      EEF6EDEDF6EEEDF6EEEEF6EEEDF6EDEEF6EDEDF6EEEDF6EEEDF6EDEEF6EDEDF6
      EEEEF6EDEEF6EDEDF6EDEDF6EDEEF6EDEDF6EDEEF6EEEEF6EDEDF6EDEDF6EDEE
      F6EDEEF6EEEDF6EEEDF6EEEDF6EDEEF6EEEEF6EDEEF6EDEEF6EDEEF6EDEDF6ED
      EEF6EEEEF6EDEDF6EEEEF6EDEEF6EDEDF6EDEEF6EDEEF6EDEEF6EDEEF6EDEEF6
      EDEEF6EDEDF6EDEDF6EDEDF6EDEDF6EDEEF6EEEDF6EEEEF6EDEDF6EEEEF6EDED
      F6EDEEF6EDEEF6EDEEF6EDEDF6EEEEF6EEEEF6EDEDF6EEEEF6EEEDF6EDEDF6EE
      EDF6EDEEF6EEEDF6EDEEF6EDEEF6EDEDF6EDEEF6EEEDF6EDEEF6EDEEF6EDEEF6
      EEEEF6EDEDF6EDEEF6EDEEF6EDEEF6EDEEF6EDEDF6EEEDF6EDEEF6EDEDF6EEEE
      F6EDEDF6EDEDF6EEEEF6EEEDF6EDEEF6EDEDF6EEEDF6EDEDF6EDEDF6EDEDF6ED
      EEF6EDEEF6EDEDF6EDEEF6EDEDF6EEEDF6EDEDF6EDEEF6EEEDF6EEEDF6EEEEF6
      EEEDF6EDEDF6EDEDF6EDEDF6EDEDF6EDEDF6EDEEF6EDEDF6EDEDF6EEEEF6EDEE
      F6EDEDF6EDEEF6EDEEF6EEEEF6EDEEF6EDEDF6EDEDF6EEEEF6EDEEF6EDEEF6EE
      EDF6EEEDF6EEEEF6EDEEF6EDEDF6EDEEF6EEEDF6EEEEF6EDEEF6EDEDF6EDEEF6
      EDEDF6EEEEF6EDEEF6EEEEF6EDEEF6EDEEF6EDEDF6EDEEF6EDEDF6EEEDF6EEED
      F6EDEEF6EEEDF6EDEEF6EEEDF6EDEEF6EDEEF6EDEEF6EDEEF6EDEDF6EDEDF6ED
      EEF6EDEEF6EDEDF6EDEDF6EDEDF6EDEDF6EDEEF6EEEDF6EDEEF6EDEDF6EDEEF6
      EDEEF6EDEDF5EDEEF6EDEDF6EDEEF6EDEDF6EEEDF6EEEDF6EDEEF6EDEDF6EEEE
      F6EDEDF6EDEDF6EEEEF6EDEDF6EDEDF6EEEDF6EDEDF6EDEDF6EDEDF6EDEEF6ED
      EDF6EDEEF6EEEDF6EEEEF6EEEEF6EDEDF6EDEEF6EDEEF6EDEDF6EEEEF6EDEEF6
      EDEEF6EEEDF6EEEEF6EEEDF6EEEEF6EDEEF6EEEEF6EEEEF6EDEEF6EDEEF6EEEE
      F6EDEEF6EDEEF6EEEDF6EDEDF6EDEEF6EDEEF6EEEEF6EDEDF6EDEEF6EDEDF6ED
      EDF6EEEDF6EDEDF6EDEDF6EDEDF6EDEEF6EEEEF6EDEEF6EEEDF6EEEDF6EDEDF6
      EDEEF6EDEDF6EDEEF6EDEDF6EEEDF6EEEEF6EEEDF6EEEEF6EDEDF6EDEDF6EEEE
      F6EDEDF6EEEDF6EDEDF6EDEEF6EDEEF6EDEDF6EDEDF6EDEDF6EDEEF6EDEEF6EE
      EDF6EDEEF6EDEDF6EDEEF6EDEEF6EEEDF6EEEDF6EEEDF6EDEEF6EDEDF6EDEDF6
      EEEDF6EDEEF6EEEEF6EDEDF6EDEEF6EDEDF6EEEEF6EDEEF6EDEEF6EDEDF6EDEE
      F6EEEEF6EEEEF6EDEEF6EDEEF6EDEDF6EDEDF6EEEEF6EDEDF6EDEEF6EDEEF6EE
      EEF6EEEDF6EDEEF6EDEEF6EEEEF6EDEEF6EDEEF6EDEEF6EDEDF6EDEDF6EDEEF6
      EDEEF6EEEDF6EEEDF6EDEEF6EEEEF6EDEDF6EDEEF6EDEDF6EEED}
    Left = 302
    Top = 217
  end
  object PopupMenuMapSet: TPopupMenu
    Images = ImageList2
    Left = 260
    Top = 87
    object N193: TMenuItem
      Action = Map_Reflash
    end
    object N198: TMenuItem
      Caption = '-'
    end
    object N189: TMenuItem
      Action = Map_AddNode
    end
    object N190: TMenuItem
      Action = Map_DelNode
    end
    object N224: TMenuItem
      Action = Map_ChangeNodeName
    end
    object N197: TMenuItem
      Caption = '-'
    end
    object N191: TMenuItem
      Action = Map_Set_DefaultNode
    end
    object N192: TMenuItem
      Action = Map_Save
    end
    object N196: TMenuItem
      Caption = '-'
    end
    object N194: TMenuItem
      Action = map_openLayer
    end
    object N195: TMenuItem
      Action = map_CloseLayer
    end
    object N199: TMenuItem
      Action = tool_layer_control
    end
    object N200: TMenuItem
      Caption = '-'
    end
    object N201: TMenuItem
      Action = Map_SaveAsNode
    end
    object N202: TMenuItem
      Action = Map_ImputNode
    end
  end
  object SaveDialog1: TSaveDialog
    Filter = 'XML(*.xml)|*.xml'
    Left = 342
    Top = 217
  end
  object OpenDialog1: TOpenDialog
    Left = 374
    Top = 217
  end
  object PopupMenuText: TPopupMenu
    Left = 75
    Top = 199
    object MenuItemEditText: TMenuItem
      Caption = #20462#25913
      OnClick = BitBtnEditTextClick
    end
    object MenuItemDelText: TMenuItem
      Caption = #21024#38500
      OnClick = BitBtnEditTextClick
    end
  end
  object PrintDialog1: TPrintDialog
    Left = 224
    Top = 257
  end
  object TimerCall: TTimer
    Enabled = False
    Interval = 1500
    OnTimer = TimerCallTimer
    Left = 144
    Top = 220
  end
  object ADOQuery1: TADOQuery
    Parameters = <>
    Left = 672
    Top = 164
  end
  object ADOConnection1: TADOConnection
    Left = 640
    Top = 164
  end
  object PopupMenu_funDev: TPopupMenu
    AutoHotkeys = maManual
    Images = ImageList2
    Left = 8
    Top = 87
    object Menu_MainShow1: TMenuItem
      Caption = #30028#38754#26174#31034
      ImageIndex = 102
      Visible = False
      object N3: TMenuItem
        Action = fun_watch_car
      end
      object N105: TMenuItem
        Action = fun_ShowACarTrack
      end
      object N185: TMenuItem
        Action = fun_DevHide
      end
      object N275: TMenuItem
        Action = fun_DevShowOnly
      end
    end
    object N256: TMenuItem
      Caption = #36710#36742#23450#20301'/'#36319#36394
      ImageIndex = 132
      object N93: TMenuItem
        Action = fun_Locate_Car
      end
      object N112: TMenuItem
        Action = fun_FindPostion
        ShortCut = 113
      end
      object N239: TMenuItem
        Action = fun_zdgz
      end
      object N17: TMenuItem
        Action = fun_PursueDev
      end
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N252: TMenuItem
      Caption = #32456#31471#21442#25968
      ImageIndex = 130
      object N91: TMenuItem
        Action = fun_Set_DevParam
      end
      object N19: TMenuItem
        Action = fun_view_DevParam
        ShortCut = 16466
      end
      object N250: TMenuItem
        Action = fun_view_someDevParam
      end
    end
    object N259: TMenuItem
      Caption = #32456#31471'/'#36710#36742#25511#21046
      ImageIndex = 100
      object N174: TMenuItem
        Action = fun_ControlTerminal
      end
      object N249: TMenuItem
        Action = fun_upgradeterminal
      end
      object N125: TMenuItem
        Action = fun_SendControlCar
      end
    end
    object N260: TMenuItem
      Caption = '-'
    end
    object N258: TMenuItem
      Caption = #36710#36742#26085#24120#35843#24230
      ImageIndex = 134
      object N106: TMenuItem
        Action = fun_setDevEventList
      end
      object N114: TMenuItem
        Action = fun_sendQuestion
      end
      object N84: TMenuItem
        Action = fun_SetDevTelList
      end
      object N119: TMenuItem
        Action = fun_SendBackCallTel
      end
      object N73: TMenuItem
        Action = fun_SendControlInfo
      end
      object N103: TMenuItem
        Action = fun_GetDriverInfo
      end
      object N247: TMenuItem
        Action = fun_setCarRunStatePlan
      end
    end
    object N257: TMenuItem
      Caption = #20449#24687#28857#25773
      ImageIndex = 133
      object N169: TMenuItem
        Action = fun_SendInfoMenu
      end
      object N129: TMenuItem
        Action = fun_SendInfoServer
      end
    end
    object N262: TMenuItem
      Caption = '-'
    end
    object N253: TMenuItem
      Caption = #22810#23186#20307
      ImageIndex = 135
      object N62: TMenuItem
        Action = fun_GetAPicture
      end
      object N8: TMenuItem
        Action = fun_Record
      end
      object N233: TMenuItem
        Action = fun_OrderVideo
      end
      object N244: TMenuItem
        Action = fun_photo_fatigue
      end
      object N255: TMenuItem
        Caption = '-'
      end
      object N39: TMenuItem
        Action = fun_SendQueryPicture
      end
      object N60: TMenuItem
        Action = fun_SendQueryAudio
      end
      object N177: TMenuItem
        Action = fun_SendQueryVideo
      end
    end
    object N232: TMenuItem
      Caption = '-'
    end
    object N72: TMenuItem
      Caption = #21306#22495'/'#36335#32447#31649#29702
      ImageIndex = 105
      object N108: TMenuItem
        Action = fun_SetAreaToDev
      end
      object N110: TMenuItem
        Action = fun_DelAreaFromDev
      end
      object N115: TMenuItem
        Action = fun_DelAllAreaFromDev
      end
    end
    object N222: TMenuItem
      Caption = #35760#24405#20202
      ImageIndex = 106
      object N117: TMenuItem
        Action = fun_CollectRunRecData
      end
      object N131: TMenuItem
        Action = fun_SetRunRecParam
      end
    end
    object N130: TMenuItem
      Caption = '-'
    end
    object N311: TMenuItem
      Action = fun_SendTSPData
    end
    object N211: TMenuItem
      Action = fun_readVer
    end
    object N146: TMenuItem
      Caption = '-'
    end
    object N148: TMenuItem
      Action = fun_DealEmgcyAlarm
    end
    object N147: TMenuItem
      Caption = '-'
    end
    object N10: TMenuItem
      Action = fun_History
    end
  end
  object ImageListCarPicInMap: TImageList
    Left = 48
    Top = 268
    Bitmap = {
      494C010108000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
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
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F00000000007F7F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F7F7F000000000000000000000000007F7F7F00000000000000
      FF00000000007F7F7F0000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F7F00000000000000FF000000
      00007F7F7F000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      00007F7F7F000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF0000000000000000000000FF00000000007F7F
      7F00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF00000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF00000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF00000000007F7F
      7F00000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF0000000000000000000000FF000000
      00007F7F7F000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF0000000000000000007F7F
      7F00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F7F7F00000000000000
      FF00000000007F7F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F000000000000000000000000007F7F7F000000
      00000000FF00000000007F7F7F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F00000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F00000000007F7F7F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
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
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      000000000000000000000000000000000000000000007F7F7F00000000007F7F
      7F00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      00007F7F7F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      000000000000000000000000000000000000000000007F7F7F00000000000000
      FF00000000007F7F7F000000000000000000000000007F7F7F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F000000
      00000000FF00000000007F7F7F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F00000000000000FF0000000000000000000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F0000000000000000000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F00000000000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF00000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000007F7F7F00000000000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F0000000000000000000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F00000000000000FF0000000000000000000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F00000000000000FF00000000007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F000000
      00000000FF00000000007F7F7F000000000000000000000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000007F7F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F000000
      00007F7F7F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF7FFFFFFFFFFFFFFF7FCFFFFFFFFFE3
      FE3FC3FFFFFFFFC3FE3FE0FFFF3FFB83FC1FE03FFC3FF907FC1FF007F03FF80F
      F80FF00FC000F01FF80FF81F0000F03FF007F80FC000E01FF007FC07F03FE00F
      FE3FFC83FC3FC07FFE3FFDC1FF3FC1FFFE3FFFE1FFFF87FFFE3FFFF1FFFF9FFF
      FE3FFFFFFFFFFFFFFE3FFFFFFFFFFFFFFC7FFFFFFFFFFFFFFC7FFFFFFFFFFFFF
      FC7F8FFFFFFFFFF9FC7F87FFFFFFFFE1FC7F83BFFCFFFF83FC7FC13FFC3FFE03
      E00FE03FFC0FF007E00FF01F0003F807F01FF81F0000FC0FF01FF00F0003F80F
      F83FE00FFC0FF01FF83FFC07FC3FE09FFC7FFF07FCFFC1DFFC7FFFC3FFFFC3FF
      FEFFFFF3FFFFC7FFFEFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object ImageListMapCar: TImageList
    Left = 120
    Top = 264
    Bitmap = {
      494C01010A000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
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
      000000000000000000000000000000000000090909000909090057575700E6E6
      E600ABABAB00747474005757570046464600575757005757570084848400C0C0
      C000F9F9F9000909090009090900464646000202020002020200141414003B3B
      3B00292929001B1B1B00141414001010100014141400141414001F1F1F002F2F
      2F00424242000202020002020200101010000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B1000900FF1A2A00FF233200FF23
      3200FF233200FF1F2E00FF1F2E00FF1F2E00FF1F2E00FF1F2E00FF233200FF23
      3200FF233200FF1F2E00D2000F00090909000404260006075600080985000809
      8500080985000708670007086700070867000708670007086700080985000809
      8500080985000708670004052F00020202000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF1A2A00FF1A2A00FF2C3A00FF4C
      2C0000000000FF2C3A00FF2C3A00FF2C3A00FF2C3A00FF2C3A00FF965700FF96
      5700FF4C2C00FF233200FF1F2E00D2000F0006075600060756000A0BC200140A
      C200000000000A0BC2000A0BC2000A0BC2000A0BC2000A0BC2002614CA002614
      CA00140AC200080985000708670004052F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF1F2E002CFFF300FF653500FF65
      3500FF653500FF653500FF2C3A00FF2C3A00FF2C3A00FF2C3A00FF653500FF65
      3500FF653500E9FFFE00C0C0C000FF1A2A000708670064C20A001A0CC4001A0C
      C4001A0CC4001A0CC4000A0BC2000A0BC2000A0BC2000A0BC2001A0CC4001A0C
      C4001A0CC4008FDB3C002F2F2F00060756000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF233200FF965700FF965700FF96
      5700FF965700FF965700FF965700FF965700FF965700FF965700FF965700FF96
      5700FF965700FF965700FF283600FF1F2E00080985002614CA002614CA002614
      CA002614CA002614CA002614CA002614CA002614CA002614CA002614CA002614
      CA002614CA002614CA00090AA900070867000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF283600ABABAB0000000000FFFB
      B200FFE09400FF2C3A00FF2C3A00FF2C3A00FF2C3A00FF2C3A00FF653500FFE0
      940074747400F9F9F90074747400FF233200090AA90029292900BFBFBF00482B
      D5003B23D2000A0BC2000A0BC2000A0BC2000A0BC2000A0BC2001A0CC4003B23
      D2001B1B1B00424242001B1B1B00080985000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFBB2000000000057575700FFE0
      9400FF965700FF965700FF965700FF283600FF1A2A00FF965700FF965700FF2C
      3A00747474000000000057575700FF0E1E00482BD50052525200141414003B23
      D2002614CA002614CA002614CA00090AA900060756002614CA002614CA000A0B
      C2001B1B1B00FDFDF10014141400050641000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF965700FFFBB200FF965700FFFB
      B200FFFBB200FFFBB200FF965700FF965700FF965700FF965700FF965700FF96
      5700FF2C3A00FF965700FF965700D2000F002614CA00482BD5002614CA00482B
      D500482BD500482BD5002614CA002614CA002614CA002614CA002614CA002614
      CA000A0BC2002614CA002614CA0004052F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF0E1E00FF965700FF96
      5700FF965700FF965700FF965700FF965700FF965700FF965700FF965700FF96
      5700FF965700FF2C3A00D2000F000000000000000000050641002614CA002614
      CA002614CA002614CA002614CA002614CA002614CA002614CA002614CA002614
      CA002614CA000A0BC20004052F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF96570009090900FF2C3A007474
      74004646460023232300ABABAB00F9F9F900F9F9F90009090900464646004646
      460023232300FF965700FF965700FF0E1E002614CA00020202000A0BC2001B1B
      1B00101010000808080029292900424242004242420002020200101010001010
      1000080808002614CA002614CA00050641000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF9657008484
      8400464646004646460000000000000000000000000084848400090909000909
      09000909090074747400000000000000000000000000000000002614CA001F1F
      1F001010100010101000525252005B5B5B005B5B5B001F1F1F00020202000202
      0200020202001B1B1B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000074747400E6E6
      E600F9F9F900C0C0C000ABABAB00090909000909090046464600464646000909
      0900FF96570000000000000000000000000000000000000000001B1B1B003B3B
      3B00424242002F2F2F0029292900020202000202020010101000101010000202
      02002614CA000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007474
      7400FF4C2C00FF4C2C00FF965700FF965700FF965700FF965700FF965700FF2C
      3A00000000000000000000000000000000000000000000000000000000001B1B
      1B00140AC200140AC2002614CA002614CA002614CA002614CA002614CA000A0B
      C200000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000808080008080800393939007B7B
      7B00636363004A4A4A0039393900313131003939390039393900525252006B6B
      6B0084848400080808000808080031313100090909000909090057575700E6E6
      E600ABABAB00747474005757570046464600575757005757570084848400C0C0
      C000F9F9F9000909090009090900464646000000000000000000040404002222
      22001212120008080800040404000303030004040400040404000B0B0B001717
      17002A2A2A00000000000000000003030300090909000909090057575700E6E6
      E600ABABAB00747474005757570046464600575757005757570084848400C0C0
      C000F9F9F9000909090009090900464646000C0D5E0014169800191CBC00191C
      BC00191CBC001618A6001618A6001618A6001618A6001618A600191CBC00191C
      BC00191CBC001618A6000E0F6C000808080012779F001AC3FF0023C5FF0023C5
      FF0023C5FF001FC3FF001FC3FF001FC3FF001FC3FF001FC3FF0023C5FF0023C5
      FF0023C5FF001FC3FF001292C00009090900030303000C0C0C00161616001616
      1600161616001010100010101000101010001010100010101000161616001616
      16001616160010101000050505000000000012129F001A1FFF002328FF002328
      FF002328FF001F23FF001F23FF001F23FF001F23FF001F23FF002328FF002328
      FF002328FF001F23FF001216C0000909090014169800141698001E21E0003A1E
      E000000000001E21E0001E21E0001E21E0001E21E0001E21E0005D3BE4005D3B
      E4003A1EE000191CBC001618A6000E0F6C001AC3FF001AC3FF002CC7FF002C98
      FF00000000002CC7FF002CC7FF002CC7FF002CC7FF002CC7FF005788FF005788
      FF002C98FF0023C5FF001FC3FF001292C0000C0C0C000C0C0C00252525002525
      2500000000002525250025252500252525002525250025252500353535003535
      3500252525001616160010101000050505001A1FFF001A1FFF002C30FF00572C
      FF00000000002C30FF002C30FF002C30FF002C30FF002C30FF009F57FF009F57
      FF00572CFF002328FF001F23FF001216C0001618A600A4E01E004825E1004825
      E1004825E1004825E1001E21E0001E21E0001E21E0001E21E0004825E1004825
      E1004825E100C3ED7C006B6B6B00141698001FC3FF00FF672C00358BFF00358B
      FF00358BFF00358BFF002CC7FF002CC7FF002CC7FF002CC7FF00358BFF00358B
      FF00358BFF00FFEFE900C0C0C0001AC3FF001010100025252500292929002929
      2900292929002929290025252500252525002525250025252500292929002929
      29002929290069696900171717000C0C0C001F23FF00FFFF2C007035FF007035
      FF007035FF007035FF002C30FF002C30FF002C30FF002C30FF007035FF007035
      FF007035FF00FFFFE900C0C0C0001A1FFF00191CBC005D3BE4005D3BE4005D3B
      E4005D3BE4005D3BE4005D3BE4005D3BE4005D3BE4005D3BE4005D3BE4005D3B
      E4005D3BE4005D3BE4001C1FD2001618A60023C5FF005788FF005788FF005788
      FF005788FF005788FF005788FF005788FF005788FF005788FF005788FF005788
      FF005788FF005788FF0028C6FF001FC3FF001616160035353500353535003535
      3500353535003535350035353500353535003535350035353500353535003535
      350035353500353535001F1F1F00101010002328FF009F57FF009F57FF009F57
      FF009F57FF009F57FF009F57FF009F57FF009F57FF009F57FF009F57FF009F57
      FF009F57FF009F57FF00282CFF001F23FF001C1FD20063636300DEDEDE008A66
      EA007B58E8001E21E0001E21E0001E21E0001E21E0001E21E0004825E1007B58
      E8004A4A4A00848484004A4A4A00191CBC0028C6FF00ABABAB0000000000C8B2
      FF009994FF002CC7FF002CC7FF002CC7FF002CC7FF002CC7FF00358BFF009994
      FF0074747400F9F9F9007474740023C5FF001F1F1F0012121200B7B7B7005454
      5400494949002525250025252500252525002525250025252500292929004949
      4900080808002A2A2A000808080016161600282CFF00ABABAB0000000000FFB2
      FF00E694FF002C30FF002C30FF002C30FF002C30FF002C30FF007035FF00E694
      FF0074747400F9F9F900747474002328FF008A66EA0094949400393939007B58
      E8005D3BE4005D3BE4005D3BE4001C1FD200141698005D3BE4005D3BE4001E21
      E0004A4A4A00FEFEF8003939390011138200C8B2FF0000000000575757009994
      FF005788FF005788FF005788FF0028C6FF001AC3FF005788FF005788FF002CC7
      FF0074747400000000005757570016BBF700545454003A3A3A00040404004949
      49003535350035353500353535001F1F1F000C0C0C0035353500353535002525
      250008080800F6F6F6000404040008080800FFB2FF000000000057575700E694
      FF009F57FF009F57FF009F57FF00282CFF001A1FFF009F57FF009F57FF002C30
      FF00747474000000000057575700161AF7005D3BE4008A66EA005D3BE4008A66
      EA008A66EA008A66EA005D3BE4005D3BE4005D3BE4005D3BE4005D3BE4005D3B
      E4001E21E0005D3BE4005D3BE4000E0F6C005788FF00C8B2FF005788FF00C8B2
      FF00C8B2FF00C8B2FF005788FF005788FF005788FF005788FF005788FF005788
      FF002CC7FF005788FF005788FF001292C0003535350054545400353535005454
      5400545454005454540035353500353535003535350035353500353535003535
      3500252525003535350035353500050505009F57FF00FFB2FF009F57FF00FFB2
      FF00FFB2FF00FFB2FF009F57FF009F57FF009F57FF009F57FF009F57FF009F57
      FF002C30FF009F57FF009F57FF001216C00000000000111382005D3BE4005D3B
      E4005D3BE4005D3BE4005D3BE4005D3BE4005D3BE4005D3BE4005D3BE4005D3B
      E4005D3BE4001E21E0000E0F6C00000000000000000016BBF7005788FF005788
      FF005788FF005788FF005788FF005788FF005788FF005788FF005788FF005788
      FF005788FF002CC7FF001292C000000000000000000008080800353535003535
      3500353535003535350035353500353535003535350035353500353535003535
      35003535350025252500050505000000000000000000161AF7009F57FF009F57
      FF009F57FF009F57FF009F57FF009F57FF009F57FF009F57FF009F57FF009F57
      FF009F57FF002C30FF001216C000000000005D3BE400080808001E21E0004A4A
      4A00313131001818180063636300848484008484840008080800313131003131
      3100181818005D3BE4005D3BE400111382005788FF00090909002CC7FF007474
      74004646460023232300ABABAB00F9F9F900F9F9F90009090900464646004646
      4600232323005788FF005788FF0016BBF7003535350000000000252525000808
      08000303030001010100121212002A2A2A002A2A2A0000000000030303000303
      0300010101003535350035353500080808009F57FF00090909002C30FF007474
      74004646460023232300ABABAB00F9F9F900F9F9F90009090900464646004646
      4600232323009F57FF009F57FF00161AF70000000000000000005D3BE4005252
      52003131310031313100949494009C9C9C009C9C9C0052525200080808000808
      0800080808004A4A4A00000000000000000000000000000000005788FF008484
      8400464646004646460000000000000000000000000084848400090909000909
      0900090909007474740000000000000000000000000000000000353535000B0B
      0B0003030300030303003A3A3A0044444400444444000B0B0B00000000000000
      00000000000008080800000000000000000000000000000000009F57FF008484
      8400464646004646460000000000000000000000000084848400090909000909
      09000909090074747400000000000000000000000000000000004A4A4A007B7B
      7B00848484006B6B6B0063636300080808000808080031313100313131000808
      08005D3BE400000000000000000000000000000000000000000074747400E6E6
      E600F9F9F900C0C0C000ABABAB00090909000909090046464600464646000909
      09005788FF000000000000000000000000000000000000000000080808002222
      22002A2A2A001717170012121200000000000000000003030300030303000000
      000035353500000000000000000000000000000000000000000074747400E6E6
      E600F9F9F900C0C0C000ABABAB00090909000909090046464600464646000909
      09009F57FF000000000000000000000000000000000000000000000000004A4A
      4A003A1EE0003A1EE0005D3BE4005D3BE4005D3BE4005D3BE4005D3BE4001E21
      E000000000000000000000000000000000000000000000000000000000007474
      74002C98FF002C98FF005788FF005788FF005788FF005788FF005788FF002CC7
      FF00000000000000000000000000000000000000000000000000000000000808
      0800252525002525250035353500353535003535350035353500353535002525
      2500000000000000000000000000000000000000000000000000000000007474
      7400572CFF00572CFF009F57FF009F57FF009F57FF009F57FF009F57FF002C30
      FF00000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000808080008080800393939007B7B
      7B00636363004A4A4A0039393900313131003939390039393900525252006B6B
      6B00848484000808080008080800313131000808080008080800393939007B7B
      7B00636363004A4A4A0039393900313131003939390039393900525252006B6B
      6B0084848400080808000808080031313100090909000909090057575700E6E6
      E600ABABAB00747474005757570046464600575757005757570084848400C0C0
      C000F9F9F9000909090009090900464646000808080008080800393939007B7B
      7B00636363004A4A4A0039393900313131003939390039393900525252006B6B
      6B00848484000808080008080800313131006B000000AD000000D6000000D600
      0000D6000000BD000000BD000000BD000000BD000000BD000000D6000000D600
      0000D6000000BD0000007B000000080808005D0E500096168000BA1B9F00BA1B
      9F00BA1B9F00A4188C00A4188C00A4188C00A4188C00A4188C00BA1B9F00BA1B
      9F00BA1B9F00A4188C006B105C0008080800585858008C8C8C00919191009191
      9100919191008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F00919191009191
      9100919191008F8F8F0069696900090909000E5D1B0016962C001BBA36001BBA
      36001BBA360018A4300018A4300018A4300018A4300018A430001BBA36001BBA
      36001BBA360018A43000106B1F0008080800AD000000AD000000FF000000FF29
      0000FFFFFF00FF000000FF000000FF000000FF000000FF000000FF522100FF52
      2100FF290000D6000000BD0000007B0000009616800096168000DE21BE00DE21
      A00000000000DE21BE00DE21BE00DE21BE00DE21BE00DE21BE00E23DA200E23D
      A200DE21A000BA1B9F00A4188C006B105C008C8C8C008C8C8C00959595009595
      9500000000009595950095959500959595009595950095959500ABABAB00ABAB
      AB0095959500919191008F8F8F006969690016962C0016962C0021DE410021DE
      5F000000000021DE410021DE410021DE410021DE410021DE41003DE27D003DE2
      7D0021DE5F001BBA360018A43000106B1F00BD00000000ADFF00FF390800FF39
      0800FF390800FF390800FF000000FF000000FF000000FF000000FF390800FF39
      0800FF3908006BC6FF006B6B6B00AD000000A4188C0021DE7D00DF289C00DF28
      9C00DF289C00DF289C00DE21BE00DE21BE00DE21BE00DE21BE00DF289C00DF28
      9C00DF289C007EECBA006B6B6B00961680008F8F8F00959595009A9A9A009A9A
      9A009A9A9A009A9A9A00959595009595950095959500959595009A9A9A009A9A
      9A009A9A9A00F4F4F400C0C0C0008C8C8C0018A43000DE21820028DF6A0028DF
      6A0028DF6A0028DF6A0021DE410021DE410021DE410021DE410028DF6A0028DF
      6A0028DF6A00EC7EB0006B6B6B0016962C00D6000000FF522100FF522100FF52
      2100FF522100FF522100FF522100FF522100FF522100FF522100FF522100FF52
      2100FF522100FF522100EF000000BD000000BA1B9F00E23DA200E23DA200E23D
      A200E23DA200E23DA200E23DA200E23DA200E23DA200E23DA200E23DA200E23D
      A200E23DA200E23DA200D01FB200A4188C0091919100ABABAB00ABABAB00ABAB
      AB00ABABAB00ABABAB00ABABAB00ABABAB00ABABAB00ABABAB00ABABAB00ABAB
      AB00ABABAB00ABABAB00939393008F8F8F001BBA36003DE27D003DE27D003DE2
      7D003DE27D003DE27D003DE27D003DE27D003DE27D003DE27D003DE27D003DE2
      7D003DE27D003DE27D001FD03D0018A43000EF00000063636300DEDEDE00FF84
      5200FF734200FF000000FF000000FF000000FF000000FF000000FF390800FF73
      42004A4A4A00848484004A4A4A00D6000000D01FB20063636300DEDEDE00E868
      AD00E65AAA00DE21BE00DE21BE00DE21BE00DE21BE00DE21BE00DF289C00E65A
      AA004A4A4A00848484004A4A4A00BA1B9F0093939300ABABAB0000000000D8D8
      D800C9C9C90095959500959595009595950095959500959595009A9A9A00C9C9
      C90074747400F9F9F90074747400919191001FD03D0063636300DEDEDE0068E8
      A3005AE6960021DE410021DE410021DE410021DE410021DE410028DF6A005AE6
      96004A4A4A00848484004A4A4A001BBA3600FF8452009494940039393900FF73
      4200FF522100FF522100FF522100EF000000AD000000FF522100FF522100FF00
      00004A4A4A00F7FFFF003939390094000000E868AD009494940039393900E65A
      AA00E23DA200E23DA200E23DA200D01FB20096168000E23DA200E23DA200DE21
      BE004A4A4A00F8FEF9003939390081136F00D8D8D8000000000057575700C9C9
      C900ABABAB00ABABAB00ABABAB00939393008C8C8C00ABABAB00ABABAB009595
      95007474740000000000575757008686860068E8A30094949400393939005AE6
      96003DE27D003DE27D003DE27D001FD03D0016962C003DE27D003DE27D0021DE
      41004A4A4A00FEF8FD003939390013812500FF522100FF845200FF522100FF84
      5200FF845200FF845200FF522100FF522100FF522100FF522100FF522100FF52
      2100FF000000FF522100FF5221007B000000E23DA200E868AD00E23DA200E868
      AD00E868AD00E868AD00E23DA200E23DA200E23DA200E23DA200E23DA200E23D
      A200DE21BE00E23DA200E23DA2006B105C00ABABAB00D8D8D800ABABAB00D8D8
      D800D8D8D800D8D8D800ABABAB00ABABAB00ABABAB00ABABAB00ABABAB00ABAB
      AB0095959500ABABAB00ABABAB00696969003DE27D0068E8A3003DE27D0068E8
      A30068E8A30068E8A3003DE27D003DE27D003DE27D003DE27D003DE27D003DE2
      7D0021DE41003DE27D003DE27D00106B1F000000000094000000FF522100FF52
      2100FF522100FF522100FF522100FF522100FF522100FF522100FF522100FF52
      2100FF522100FF0000007B000000000000000000000081136F00E23DA200E23D
      A200E23DA200E23DA200E23DA200E23DA200E23DA200E23DA200E23DA200E23D
      A200E23DA200DE21BE006B105C00000000000000000086868600ABABAB00ABAB
      AB00ABABAB00ABABAB00ABABAB00ABABAB00ABABAB00ABABAB00ABABAB00ABAB
      AB00ABABAB0095959500696969000000000000000000138125003DE27D003DE2
      7D003DE27D003DE27D003DE27D003DE27D003DE27D003DE27D003DE27D003DE2
      7D003DE27D0021DE4100106B1F0000000000FF52210008080800FF0000004A4A
      4A00313131001818180063636300848484008484840008080800313131003131
      310018181800FF522100FF52210094000000E23DA20008080800DE21BE004A4A
      4A00313131001818180063636300848484008484840008080800313131003131
      310018181800E23DA200E23DA20081136F00ABABAB0009090900959595007474
      74004646460023232300ABABAB00F9F9F900F9F9F90009090900464646004646
      460023232300ABABAB00ABABAB00868686003DE27D000808080021DE41004A4A
      4A00313131001818180063636300848484008484840008080800313131003131
      3100181818003DE27D003DE27D00138125000000000000000000FF5221005252
      52003131310031313100949494009C9C9C009C9C9C0052525200080808000808
      0800080808004A4A4A0000000000000000000000000000000000E23DA2005252
      52003131310031313100949494009C9C9C009C9C9C0052525200080808000808
      0800080808004A4A4A0000000000000000000000000000000000ABABAB008484
      8400464646004646460000000000000000000000000084848400090909000909
      09000909090074747400000000000000000000000000000000003DE27D005252
      52003131310031313100949494009C9C9C009C9C9C0052525200080808000808
      0800080808004A4A4A00000000000000000000000000000000004A4A4A007B7B
      7B00848484006B6B6B0063636300080808000808080031313100313131000808
      0800FF52210000000000000000000000000000000000000000004A4A4A007B7B
      7B00848484006B6B6B0063636300080808000808080031313100313131000808
      0800E23DA200000000000000000000000000000000000000000074747400E6E6
      E600F9F9F900C0C0C000ABABAB00090909000909090046464600464646000909
      0900ABABAB0000000000000000000000000000000000000000004A4A4A007B7B
      7B00848484006B6B6B0063636300080808000808080031313100313131000808
      08003DE27D000000000000000000000000000000000000000000000000004A4A
      4A00FF290000FF290000FF522100FF522100FF522100FF522100FF522100FF00
      0000000000000000000000000000000000000000000000000000000000004A4A
      4A00DE21A000DE21A000E23DA200E23DA200E23DA200E23DA200E23DA200DE21
      BE00000000000000000000000000000000000000000000000000000000007474
      74009595950095959500ABABAB00ABABAB00ABABAB00ABABAB00ABABAB009595
      9500000000000000000000000000000000000000000000000000000000004A4A
      4A0021DE5F0021DE5F003DE27D003DE27D003DE27D003DE27D003DE27D0021DE
      4100000000000000000000000000000000000000000000000000000000000000
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
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFF000000000000000000000000
      0000000000000000080008000000000000000000000000000000000000000000
      2000000000000000400400000000000000000000000000008001800100000000
      0000000000000000C383C00300000000C007C00700000000E00FE00F00000000
      FFFFFFFF00000000FFFFFFFF00000000FFFFFFFFFFFFFFFF0000000000000000
      0000000000000000080008000800080000000000000000000000000000000000
      0000200000002000000040040000400400000000000000008001800180018001
      0000000000000000C003C383C003C383C007C007C007C007E00FE00FE00FE00F
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000
      0000000000000000000008000800080000000000000000000000000000000000
      0000000020000000000000004004000000000000000000008001800180018001
      0000000000000000C003C003C383C003C007C007C007C007E00FE00FE00FE00F
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object PopupMenu1: TPopupMenu
    Left = 360
    Top = 88
    object N320: TMenuItem
      Caption = #26174#31034#20840#37096#36710#36742
      OnClick = N320Click
    end
    object N321: TMenuItem
      Caption = #26174#31034#31354#36710
      OnClick = N321Click
    end
    object N322: TMenuItem
      Caption = #26174#31034#37325#36710
      OnClick = N322Click
    end
  end
  object ImageList3: TImageList
    Left = 168
    Top = 264
    Bitmap = {
      494C01010A000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
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
      000000000000FEF6EA00FBCF9100F9B45200F8AF4700FAC37500FDE6C5000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AA9CC500533689002F0C70002F0C70005B3F8E00B6A9CD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEF4E600F9B85B00F8AA3B00F8AA3B00F8AA3B00F8AA3B00F8AC3F00FCDF
      B400000000000000000000000000000000000000000000000000000000000000
      0000A596C1002F0C70002F0C70002F0C70002F0C70002F0C7000310E7100B5A8
      CC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FAC88100F8AA3B00F8AA3B00F8AA3B00F8AA3B00F8AA3B00F8AA3B00F9B2
      4D00000000000000000000000000000000000000000000000000000000000000
      000042227D002F0C70002F0C70002F0C70002F0C70002F0C70002F0C70005538
      8A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F8B04900F8AA3B00F8AA3B00F8AA3B00F8AA3B00F8AA3B00F8AA3B00F8AA
      3B00000000000000000000000000000000000000000000000000000000000000
      00002F0C70002F0C70002F0C70002F0C70002F0C70002F0C70002F0C7000300D
      7100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F8AE4400F8AA3B00F8AA3B00F8AA3B00F8AA3B00F8AA3B00F8AA3B00F8AA
      3B00000000000000000000000000000000000000000000000000000000000000
      00002F0C70002F0C70002F0C70002F0C70002F0C70002F0C70002F0C7000300D
      7100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F9B85B00F8AA3B00F8AA3B00F8AA3B00F8AA3B00F8AA3B00F8AA3B00F8AB
      3E00000000000000000000000000000000000000000000000000000000000000
      000042227D002F0C70002F0C70002F0C70002F0C70002F0C70002F0C70005539
      8A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FCDFB500F8AA3B00F8AA3B00F8AA3B00F8AA3B00F8AA3B00F8AA3B00FAC3
      7500000000000000000000000000000000000000000000000000000000000000
      0000A596C1002F0C70002F0C70002F0C70002F0C70002F0C7000300D7100B6A9
      CD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FCD9A700F9B35000F8AA3B00F8AA3B00F8AD4200FAC47800FEF7
      EC00000000000000000000000000000000000000000000000000000000000000
      000000000000AA9CC50055388A002F0C70002F0C70005B3F8E00B7ABCE000000
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
      0000FBFBFF008E8EFF001515FF000000FF000000FF001515FF008E8EFF00FBFB
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000A7D7FF0036A3FF00008AFF00008AFF002B9EFF0096CFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A1A1A10033333300000000000000000032323200A1A1A1000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E3BFFF00C77EFF00BB63FF00BB63FF00C984FF00E7C8FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008181FF000000FF000000FF000000FF000000FF000000FF000000FF008181
      FF00000000000000000000000000000000000000000000000000000000000000
      0000A9D8FF00028BFF00008AFF00008AFF00008AFF00008AFF00008AFF008FCC
      FF00000000000000000000000000000000000000000000000000000000000000
      0000A2A2A200000000000000000000000000000000000000000000000000A2A2
      A200000000000000000000000000000000000000000000000000000000000000
      0000E2BCFF00BB63FF00BB63FF00BB63FF00BB63FF00BB63FF00BC64FF00E7C7
      FF00000000000000000000000000000000000000000000000000000000000000
      00001111FF000000FF000000FF000000FF000000FF000000FF000000FF001111
      FF00000000000000000000000000000000000000000000000000000000000000
      000030A0FF00008AFF00008AFF00008AFF00008AFF00008AFF00008AFF001795
      FF00000000000000000000000000000000000000000000000000000000000000
      00002C2C2C000000000000000000000000000000000000000000000000002C2C
      2C00000000000000000000000000000000000000000000000000000000000000
      0000C171FF00BB63FF00BB63FF00BB63FF00BB63FF00BB63FF00BB63FF00C77F
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000018AFF00008AFF00008AFF00008AFF00008AFF00008AFF00008AFF00008A
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BB63FF00BB63FF00BB63FF00BB63FF00BB63FF00BB63FF00BB63FF00BB64
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000008AFF00008AFF00008AFF00008AFF00008AFF00008AFF00008AFF00008A
      FF00000000000000000000000000000000000000000000000000000000000000
      0000010101000000000000000000000000000000000000000000000000000101
      0100000000000000000000000000000000000000000000000000000000000000
      0000BB63FF00BB63FF00BB63FF00BB63FF00BB63FF00BB63FF00BB63FF00BB64
      FF00000000000000000000000000000000000000000000000000000000000000
      00001212FF000000FF000000FF000000FF000000FF000000FF000000FF001212
      FF00000000000000000000000000000000000000000000000000000000000000
      0000259BFF00008AFF00008AFF00008AFF00008AFF00008AFF00008AFF000F91
      FF00000000000000000000000000000000000000000000000000000000000000
      00002E2E2E000000000000000000000000000000000000000000000000002E2E
      2E00000000000000000000000000000000000000000000000000000000000000
      0000C171FF00BB63FF00BB63FF00BB63FF00BB63FF00BB63FF00BB63FF00C880
      FF00000000000000000000000000000000000000000000000000000000000000
      00008282FF000000FF000000FF000000FF000000FF000000FF000000FF008282
      FF00000000000000000000000000000000000000000000000000000000000000
      000096CFFF00008AFF00008AFF00008AFF00008AFF00008AFF00008AFF007CC3
      FF00000000000000000000000000000000000000000000000000000000000000
      0000A2A2A200010101000000000000000000000000000000000001010100A2A2
      A200000000000000000000000000000000000000000000000000000000000000
      0000E2BCFF00BB63FF00BB63FF00BB63FF00BB63FF00BB63FF00BB64FF00E7C8
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FBFBFF008E8EFF001616FF000000FF000000FF001616FF008E8EFF00FBFB
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000009AD1FF001D97FF00008AFF00008AFF001292FF0088C8FF00F9FC
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000A3A3A30034343400000000000000000034343400A3A3A3000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E3BFFF00C77FFF00BB63FF00BB63FF00C984FF00E8C9FF000000
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
      000000000000FFA29800FF2F1900FF180000FF180000FF2F1900FFA298000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F197E300E32CC700DD00BB00DD00BB00E436C900F3A5E7000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EEEEED00D9DAD900D0D1CF00D0D1CF00D9DAD800EEEEED000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FDFFFD0093FF960020FF250000FF060000FF060020FF250093FF9600FDFF
      FD00000000000000000000000000000000000000000000000000000000000000
      0000FFA29800FF180000FF180000FF180000FF180000FF180000FF180000FFA2
      9800000000000000000000000000000000000000000000000000000000000000
      0000F091E200DD00BB00DD00BB00DD00BB00DD00BB00DD00BB00DD02BC00F3A4
      E700000000000000000000000000000000000000000000000000000000000000
      0000EEEEED00D0D1CF00D0D1CF00D0D1CF00D0D1CF00D0D1CF00D0D1CF00EEEE
      ED00000000000000000000000000000000000000000000000000000000000000
      000089FF8C0000FF060000FF060000FF060000FF060000FF060000FF060089FF
      8C00000000000000000000000000000000000000000000000000000000000000
      0000FF3B2700FF180000FF180000FF180000FF180000FF180000FF180000FF3B
      2700000000000000000000000000000000000000000000000000000000000000
      0000E017C100DD00BB00DD00BB00DD00BB00DD00BB00DD00BB00DD00BB00E32E
      C700000000000000000000000000000000000000000000000000000000000000
      0000D8D9D700D0D1CF00D0D1CF00D0D1CF00D0D1CF00D0D1CF00D0D1CF00D8D9
      D700000000000000000000000000000000000000000000000000000000000000
      000014FF1A0000FF060000FF060000FF060000FF060000FF060000FF060014FF
      1A00000000000000000000000000000000000000000000000000000000000000
      0000FF180000FF180000FF180000FF180000FF180000FF180000FF180000FF18
      0000000000000000000000000000000000000000000000000000000000000000
      0000DD00BB00DD00BB00DD00BB00DD00BB00DD00BB00DD00BB00DD00BB00DD01
      BB00000000000000000000000000000000000000000000000000000000000000
      0000D0D1CF00D0D1CF00D0D1CF00D0D1CF00D0D1CF00D0D1CF00D0D1CF00D0D1
      CF00000000000000000000000000000000000000000000000000000000000000
      000000FF060000FF060000FF060000FF060000FF060000FF060000FF060000FF
      0600000000000000000000000000000000000000000000000000000000000000
      0000FF180000FF180000FF180000FF180000FF180000FF180000FF180000FF18
      0000000000000000000000000000000000000000000000000000000000000000
      0000DD00BB00DD00BB00DD00BB00DD00BB00DD00BB00DD00BB00DD00BB00DD01
      BB00000000000000000000000000000000000000000000000000000000000000
      0000D0D1CF00D0D1CF00D0D1CF00D0D1CF00D0D1CF00D0D1CF00D0D1CF00D0D1
      CF00000000000000000000000000000000000000000000000000000000000000
      000000FF060000FF060000FF060000FF060000FF060000FF060000FF060000FF
      0600000000000000000000000000000000000000000000000000000000000000
      0000FF3B2700FF180000FF180000FF180000FF180000FF180000FF180000FF3B
      2700000000000000000000000000000000000000000000000000000000000000
      0000E017C100DD00BB00DD00BB00DD00BB00DD00BB00DD00BB00DD00BB00E32F
      C800000000000000000000000000000000000000000000000000000000000000
      0000D8D9D800D0D1CF00D0D1CF00D0D1CF00D0D1CF00D0D1CF00D0D1CF00D8D9
      D800000000000000000000000000000000000000000000000000000000000000
      000015FF1B0000FF060000FF060000FF060000FF060000FF060000FF060015FF
      1B00000000000000000000000000000000000000000000000000000000000000
      0000FFA29800FF180000FF180000FF180000FF180000FF180000FF180000FFA2
      9800000000000000000000000000000000000000000000000000000000000000
      0000F091E200DD00BB00DD00BB00DD00BB00DD00BB00DD00BB00DD01BB00F3A5
      E700000000000000000000000000000000000000000000000000000000000000
      0000EEEEED00D0D1CF00D0D1CF00D0D1CF00D0D1CF00D0D1CF00D0D1CF00EEEE
      ED00000000000000000000000000000000000000000000000000000000000000
      000089FF8C0000FF060000FF060000FF060000FF060000FF060000FF060089FF
      8C00000000000000000000000000000000000000000000000000000000000000
      000000000000FFA49A00FF321D00FF180000FF180000FF321D00FFA49A000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F197E300E32EC700DD00BB00DD00BB00E436C900F3A7E8000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EEEEEE00DADAD900D0D1CF00D0D1CF00DADAD900EEEEEE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FDFFFD0094FF970021FF260000FF060000FF060021FF260094FF9700FDFF
      FD00000000000000000000000000000000000000000000000000000000000000
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
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFF00000000FFFFFFFF00000000
      FFFFFFFF00000000FFFFFFFF00000000F81FF81F00000000F00FF00F00000000
      F00FF00F00000000F00FF00F00000000F00FF00F00000000F00FF00F00000000
      F00FF00F00000000F80FF81F00000000FFFFFFFF00000000FFFFFFFF00000000
      FFFFFFFF00000000FFFFFFFF00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF81FF81FF81FF00FF00FF00FF00F
      F00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00F
      F00FF00FF00FF00FF00FF80FF81FF81FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF81FF81FF81FF00FF00FF00FF00FF00F
      F00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00F
      F00FF00FF00FF00FF81FF81FF81FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object PopupMenu2: TPopupMenu
    Left = 400
    Top = 88
    object N324: TMenuItem
      Action = fun_SendControlInfo
    end
    object N325: TMenuItem
      Action = fun_SendBackCallTel
    end
    object N326: TMenuItem
      Action = fun_Polling_MCU
    end
    object N327: TMenuItem
      Caption = #21019#24314#32500#20462#21488#24080
      Visible = False
      OnClick = N327Click
    end
  end
  object TimerCheckUpdate: TTimer
    Enabled = False
    Interval = 150000
    OnTimer = TimerCheckUpdateTimer
    Left = 144
    Top = 188
  end
  object timerSendInfo: TTimer
    Enabled = False
    Interval = 60000
    OnTimer = timerSendInfoTimer
    Left = 184
    Top = 292
  end
  object timerScrollAlarm: TTimer
    Enabled = False
    Interval = 10
    OnTimer = timerScrollAlarmTimer
    Left = 282
    Top = 304
  end
end
