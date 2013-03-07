object watch_car: Twatch_car
  Left = 245
  Top = 144
  Width = 1024
  Height = 224
  Caption = #36710#36742#21015#34920
  Color = clBtnFace
  DragKind = dkDock
  DragMode = dmAutomatic
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnEndDock = FormEndDock
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 191
    Top = 0
    Width = 4
    Height = 190
    Visible = False
  end
  object cxDeviceList: TcxTreeList
    Left = 195
    Top = 0
    Width = 821
    Height = 190
    Align = alClient
    Bands = <
      item
        Options.Moving = False
        Options.Sizing = False
      end>
    BufferedPaint = True
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    OptionsCustomizing.BandVertSizing = False
    OptionsCustomizing.ColumnVertSizing = False
    OptionsData.Deleting = False
    OptionsView.Bands = True
    OptionsView.GridLines = tlglBoth
    OptionsView.ShowRoot = False
    ParentFont = False
    Preview.LeftIndent = 1
    Preview.MaxLineCount = 1
    StateImages = Mainf.ImageList1
    Styles.Selection = cxStyle2
    Styles.BandContent = cxStyle4
    Styles.BandHeader = cxStyle3
    TabOrder = 0
    OnClick = cxDeviceListClick
    OnCustomDrawCell = cxDeviceListCustomDrawCell
    OnDblClick = cxDeviceListDblClick
    OnEditing = cxDeviceListEditing
    OnFocusedNodeChanged = cxDeviceListFocusedNodeChanged
    OnResize = cxDeviceListResize
    object dev_Id: TcxTreeListColumn
      Caption.Text = #35774#22791'ID'
      DataBinding.ValueType = 'String'
      MinWidth = 50
      Options.Editing = False
      Width = 95
      Position.ColIndex = 21
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object dev_carNo: TcxTreeListColumn
      Caption.Text = #36710#29260#21495
      DataBinding.ValueType = 'String'
      Options.Editing = False
      Width = 126
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
      SortOrder = soAscending
    end
    object dev_long: TcxTreeListColumn
      Visible = False
      Caption.Text = #32463#24230
      DataBinding.ValueType = 'String'
      MinWidth = 70
      Options.Editing = False
      Width = 70
      Position.ColIndex = 12
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object dev_lat: TcxTreeListColumn
      Visible = False
      Caption.Text = #32428#24230
      DataBinding.ValueType = 'String'
      MinWidth = 70
      Options.Editing = False
      Width = 70
      Position.ColIndex = 14
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object dev_speed: TcxTreeListColumn
      Caption.Text = #36895#24230
      DataBinding.ValueType = 'String'
      MinWidth = 40
      Options.Editing = False
      Width = 43
      Position.ColIndex = 8
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object dev_Gpstime: TcxTreeListColumn
      Caption.Text = 'GPS'#26102#38388
      DataBinding.ValueType = 'String'
      MinWidth = 120
      Options.Editing = False
      Width = 126
      Position.ColIndex = 9
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object dev_Altitude: TcxTreeListColumn
      Caption.Text = #28023#25300#39640#24230
      DataBinding.ValueType = 'String'
      MinWidth = 55
      Options.Editing = False
      Width = 70
      Position.ColIndex = 18
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object dev_angle: TcxTreeListColumn
      Caption.Text = #26041#21521
      DataBinding.ValueType = 'String'
      MinWidth = 45
      Options.Editing = False
      Width = 45
      Position.ColIndex = 11
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object switch_8: TcxTreeListColumn
      Caption.Text = 'GPS'#29366#24577
      DataBinding.ValueType = 'String'
      MinWidth = 50
      Options.Editing = False
      Width = 52
      Position.ColIndex = 3
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object switch_9: TcxTreeListColumn
      Caption.Text = #29366#24577
      DataBinding.ValueType = 'String'
      MinWidth = 45
      Options.Editing = False
      Width = 55
      Position.ColIndex = 4
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object dev_Track: TcxTreeListColumn
      Caption.Text = #36319#36394
      DataBinding.ValueType = 'Boolean'
      MinWidth = 30
      Width = 35
      Position.ColIndex = 13
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object dev_DrawTrack: TcxTreeListColumn
      Visible = False
      Caption.Text = #26174#31034#36712#36857
      DataBinding.ValueType = 'Boolean'
      MinWidth = 55
      Width = 56
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object dev_Hide: TcxTreeListColumn
      Caption.Text = #38544#34255
      DataBinding.ValueType = 'Boolean'
      MinWidth = 30
      Width = 35
      Position.ColIndex = 14
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object dev_Name: TcxTreeListColumn
      Caption.Text = #36710#36742#33258#32534#21495
      DataBinding.ValueType = 'String'
      MinWidth = 70
      Options.Editing = False
      Width = 89
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object dev_SIMNO: TcxTreeListColumn
      Caption.Text = 'SIM'#21345#21495
      DataBinding.ValueType = 'String'
      MinWidth = 50
      Options.Editing = False
      Width = 95
      Position.ColIndex = 20
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object dev_trun: TcxTreeListColumn
      Visible = False
      Caption.Text = #36716#21160#29366#24577
      DataBinding.ValueType = 'String'
      Options.Editing = False
      Width = 62
      Position.ColIndex = 8
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object dev_login_driver: TcxTreeListColumn
      Caption.Text = #24403#21069#21496#26426
      DataBinding.ValueType = 'String'
      Options.Editing = False
      Width = 93
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object dev_TerminalTypeName: TcxTreeListColumn
      Caption.Text = #32456#31471#31867#22411
      DataBinding.ValueType = 'String'
      Options.Editing = False
      Width = 65
      Position.ColIndex = 19
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object dev_ddsonline: TcxTreeListColumn
      Caption.Text = 'DDS'#22312#32447
      DataBinding.ValueType = 'String'
      Options.Editing = False
      Width = 56
      Position.ColIndex = 5
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object dev_dds_camara_excursion: TcxTreeListColumn
      Caption.Text = 'DDS'#25668#20687#22836
      DataBinding.ValueType = 'String'
      Options.Editing = False
      Width = 65
      Position.ColIndex = 6
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object dev_dds_alarm: TcxTreeListColumn
      Visible = False
      Caption.Text = #30130#21171#25253#35686
      DataBinding.ValueType = 'String'
      Width = 64
      Position.ColIndex = 7
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 191
    Height = 190
    Align = alLeft
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 1
    Visible = False
    object TreeView1: TTreeView
      Left = 0
      Top = 0
      Width = 191
      Height = 190
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
      Visible = False
      OnChange = TreeView1Change
      OnClick = TreeView1Click
      OnContextPopup = TreeView1ContextPopup
    end
  end
  object rbAll: TRadioButton
    Left = 208
    Top = 4
    Width = 53
    Height = 17
    Caption = #20840#37096
    Checked = True
    Color = 15134180
    ParentColor = False
    TabOrder = 2
    TabStop = True
    OnClick = rbAllClick
  end
  object rbOnline: TRadioButton
    Left = 261
    Top = 4
    Width = 53
    Height = 17
    Caption = #22312#32447
    Color = 15134180
    ParentColor = False
    TabOrder = 3
    OnClick = rbAllClick
  end
  object rbOffline: TRadioButton
    Left = 314
    Top = 4
    Width = 65
    Height = 17
    Caption = #19981#22312#32447
    Color = 15134180
    ParentColor = False
    TabOrder = 4
    OnClick = rbAllClick
  end
  object cxStyleRepository1: TcxStyleRepository
    object cxStyle1: TcxStyle
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15134180
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 18
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle4: TcxStyle
    end
    object cxStyle5: TcxStyle
    end
  end
  object cxStyleRepository2: TcxStyleRepository
    object cxStyle2: TcxStyle
      AssignedValues = [svColor]
      Color = 12566463
    end
  end
end
