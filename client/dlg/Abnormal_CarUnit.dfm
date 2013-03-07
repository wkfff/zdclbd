object Abnormal_Car: TAbnormal_Car
  Left = 298
  Top = 181
  Width = 870
  Height = 246
  Caption = #24322#24120#36710#36742
  Color = clBtnFace
  DragKind = dkDock
  DragMode = dmAutomatic
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 191
    Top = 0
    Width = 4
    Height = 212
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 191
    Height = 212
    Align = alLeft
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 0
    object TreeView1: TTreeView
      Left = 0
      Top = 0
      Width = 191
      Height = 212
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
      OnChange = TreeView1Change
      OnClick = TreeView1Click
      OnContextPopup = TreeView1ContextPopup
    end
  end
  object PageControl1: TPageControl
    Left = 195
    Top = 0
    Width = 667
    Height = 212
    ActivePage = TabSheet1
    Align = alClient
    PopupMenu = Mainf.PopupMenu_funDev
    TabOrder = 1
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = #19981#22312#32447#36710#36742
      object cxNotOnLineList: TcxTreeList
        Left = 0
        Top = 0
        Width = 659
        Height = 184
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
        PopupMenu = Mainf.PopupMenu_funDev
        StateImages = Mainf.ImageList1
        TabOrder = 0
        OnClick = cxNotOnLineListClick
        OnDblClick = cxNotOnLineListDblClick
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
          Width = 142
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
          Caption.Text = #36710#36742#33258#32534#21495
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Width = 118
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object dev_SIMNO: TcxTreeListColumn
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
          Caption.Text = #21496#26426
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object dev_GroupName: TcxTreeListColumn
          Caption.Text = #25152#23646#20844#21496
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object dev_GroupTel: TcxTreeListColumn
          Caption.Text = #20844#21496#30005#35805
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Position.ColIndex = 4
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #35745#20215#22120#25925#38556
      ImageIndex = 1
      object cxTaximeterList: TcxTreeList
        Left = 0
        Top = 0
        Width = 659
        Height = 184
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
        PopupMenu = Mainf.PopupMenu_funDev
        StateImages = Mainf.ImageList1
        TabOrder = 0
        OnClick = cxTaximeterListClick
        OnDblClick = cxTaximeterListDblClick
        object cxTreeListColumn1: TcxTreeListColumn
          Caption.Text = #35774#22791'ID'
          DataBinding.ValueType = 'String'
          MinWidth = 50
          Options.Editing = False
          Width = 118
          Position.ColIndex = 6
          Position.RowIndex = 0
          Position.BandIndex = 2
        end
        object cxTreeListColumn2: TcxTreeListColumn
          Caption.Text = #36710#29260#21495
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Width = 142
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
          SortOrder = soAscending
        end
        object cxTreeListColumn3: TcxTreeListColumn
          Caption.Text = #32463#24230
          DataBinding.ValueType = 'String'
          MinWidth = 70
          Options.Editing = False
          Width = 70
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 2
        end
        object cxTreeListColumn4: TcxTreeListColumn
          Caption.Text = #32428#24230
          DataBinding.ValueType = 'String'
          MinWidth = 70
          Options.Editing = False
          Width = 70
          Position.ColIndex = 4
          Position.RowIndex = 0
          Position.BandIndex = 2
        end
        object cxTreeListColumn5: TcxTreeListColumn
          Caption.Text = #36895#24230
          DataBinding.ValueType = 'String'
          MinWidth = 50
          Options.Editing = False
          Width = 50
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 1
        end
        object cxTreeListColumn6: TcxTreeListColumn
          Caption.Text = 'GPS'#26102#38388
          DataBinding.ValueType = 'String'
          MinWidth = 120
          Options.Editing = False
          Width = 126
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 1
        end
        object cxTreeListColumn7: TcxTreeListColumn
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
        object cxTreeListColumn8: TcxTreeListColumn
          Caption.Text = #26041#21521
          DataBinding.ValueType = 'String'
          MinWidth = 50
          Options.Editing = False
          Width = 80
          Position.ColIndex = 7
          Position.RowIndex = 0
          Position.BandIndex = 1
        end
        object cxTreeListColumn9: TcxTreeListColumn
          Caption.Text = 'GPS'#29366#24577
          DataBinding.ValueType = 'String'
          MinWidth = 60
          Options.Editing = False
          Width = 64
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 1
        end
        object cxTreeListColumn10: TcxTreeListColumn
          Caption.Text = #29366#24577
          DataBinding.ValueType = 'String'
          MinWidth = 60
          Options.Editing = False
          Width = 60
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 1
        end
        object cxTreeListColumn11: TcxTreeListColumn
          Visible = False
          Caption.Text = #36319#36394
          DataBinding.ValueType = 'Boolean'
          MinWidth = 50
          Width = 50
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 2
        end
        object cxTreeListColumn12: TcxTreeListColumn
          Visible = False
          Caption.Text = #26174#31034#36712#36857
          DataBinding.ValueType = 'Boolean'
          MinWidth = 60
          Width = 60
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 2
        end
        object cxTreeListColumn13: TcxTreeListColumn
          Visible = False
          Caption.Text = #38544#34255
          DataBinding.ValueType = 'Boolean'
          Width = 53
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 2
        end
        object cxTreeListColumn14: TcxTreeListColumn
          Caption.Text = #36710#36742#33258#32534#21495
          DataBinding.ValueType = 'Integer'
          Options.Editing = False
          Width = 118
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumn15: TcxTreeListColumn
          Caption.Text = 'SIM'#21345#21495
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Width = 127
          Position.ColIndex = 5
          Position.RowIndex = 0
          Position.BandIndex = 2
        end
        object cxTreeListColumn16: TcxTreeListColumn
          Visible = False
          Caption.Text = #36716#21160#29366#24577
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Width = 62
          Position.ColIndex = 8
          Position.RowIndex = 0
          Position.BandIndex = 1
        end
        object cxTreeListColumn17: TcxTreeListColumn
          Caption.Text = #21496#26426
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTaximeterListcxTreeListColumn1: TcxTreeListColumn
          Caption.Text = #25152#23646#20844#21496
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTaximeterListcxTreeListColumn2: TcxTreeListColumn
          Caption.Text = #20844#21496#30005#35805
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Position.ColIndex = 4
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'LED'#25925#38556
      ImageIndex = 2
      object cxLEDList: TcxTreeList
        Left = 0
        Top = 0
        Width = 659
        Height = 184
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
        PopupMenu = Mainf.PopupMenu_funDev
        StateImages = Mainf.ImageList1
        TabOrder = 0
        OnClick = cxLEDListClick
        OnDblClick = cxLEDListDblClick
        object cxTreeListColumn18: TcxTreeListColumn
          Caption.Text = #35774#22791'ID'
          DataBinding.ValueType = 'String'
          MinWidth = 50
          Options.Editing = False
          Width = 118
          Position.ColIndex = 6
          Position.RowIndex = 0
          Position.BandIndex = 2
        end
        object cxTreeListColumn19: TcxTreeListColumn
          Caption.Text = #36710#29260#21495
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Width = 142
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
          SortOrder = soAscending
        end
        object cxTreeListColumn20: TcxTreeListColumn
          Caption.Text = #32463#24230
          DataBinding.ValueType = 'String'
          MinWidth = 70
          Options.Editing = False
          Width = 70
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 2
        end
        object cxTreeListColumn21: TcxTreeListColumn
          Caption.Text = #32428#24230
          DataBinding.ValueType = 'String'
          MinWidth = 70
          Options.Editing = False
          Width = 70
          Position.ColIndex = 4
          Position.RowIndex = 0
          Position.BandIndex = 2
        end
        object cxTreeListColumn22: TcxTreeListColumn
          Caption.Text = #36895#24230
          DataBinding.ValueType = 'String'
          MinWidth = 50
          Options.Editing = False
          Width = 50
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 1
        end
        object cxTreeListColumn23: TcxTreeListColumn
          Caption.Text = 'GPS'#26102#38388
          DataBinding.ValueType = 'String'
          MinWidth = 120
          Options.Editing = False
          Width = 126
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 1
        end
        object cxTreeListColumn24: TcxTreeListColumn
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
        object cxTreeListColumn25: TcxTreeListColumn
          Caption.Text = #26041#21521
          DataBinding.ValueType = 'String'
          MinWidth = 50
          Options.Editing = False
          Width = 80
          Position.ColIndex = 7
          Position.RowIndex = 0
          Position.BandIndex = 1
        end
        object cxTreeListColumn26: TcxTreeListColumn
          Caption.Text = 'GPS'#29366#24577
          DataBinding.ValueType = 'String'
          MinWidth = 60
          Options.Editing = False
          Width = 64
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 1
        end
        object cxTreeListColumn27: TcxTreeListColumn
          Caption.Text = #29366#24577
          DataBinding.ValueType = 'String'
          MinWidth = 60
          Options.Editing = False
          Width = 60
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 1
        end
        object cxTreeListColumn28: TcxTreeListColumn
          Visible = False
          Caption.Text = #36319#36394
          DataBinding.ValueType = 'Boolean'
          MinWidth = 50
          Width = 50
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 2
        end
        object cxTreeListColumn29: TcxTreeListColumn
          Visible = False
          Caption.Text = #26174#31034#36712#36857
          DataBinding.ValueType = 'Boolean'
          MinWidth = 60
          Width = 60
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 2
        end
        object cxTreeListColumn30: TcxTreeListColumn
          Visible = False
          Caption.Text = #38544#34255
          DataBinding.ValueType = 'Boolean'
          Width = 53
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 2
        end
        object cxTreeListColumn31: TcxTreeListColumn
          Caption.Text = #36710#36742#33258#32534#21495
          DataBinding.ValueType = 'Integer'
          Options.Editing = False
          Width = 118
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumn32: TcxTreeListColumn
          Caption.Text = 'SIM'#21345#21495
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Width = 127
          Position.ColIndex = 5
          Position.RowIndex = 0
          Position.BandIndex = 2
        end
        object cxTreeListColumn33: TcxTreeListColumn
          Visible = False
          Caption.Text = #36716#21160#29366#24577
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Width = 62
          Position.ColIndex = 8
          Position.RowIndex = 0
          Position.BandIndex = 1
        end
        object cxTreeListColumn34: TcxTreeListColumn
          Caption.Text = #21496#26426
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxLEDListcxTreeListColumn1: TcxTreeListColumn
          Caption.Text = #25152#23646#20844#21496
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxLEDListcxTreeListColumn2: TcxTreeListColumn
          Caption.Text = #20844#21496#30005#35805
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Position.ColIndex = 4
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = #39030#28783#25925#38556
      ImageIndex = 3
      object cxToplightList: TcxTreeList
        Left = 0
        Top = 0
        Width = 659
        Height = 184
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
        StateImages = Mainf.ImageList1
        TabOrder = 0
        OnClick = cxToplightListClick
        OnDblClick = cxToplightListDblClick
        object cxTreeListColumn35: TcxTreeListColumn
          Caption.Text = #35774#22791'ID'
          DataBinding.ValueType = 'String'
          MinWidth = 50
          Options.Editing = False
          Width = 118
          Position.ColIndex = 6
          Position.RowIndex = 0
          Position.BandIndex = 2
        end
        object cxTreeListColumn36: TcxTreeListColumn
          Caption.Text = #36710#29260#21495
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Width = 142
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
          SortOrder = soAscending
        end
        object cxTreeListColumn37: TcxTreeListColumn
          Caption.Text = #32463#24230
          DataBinding.ValueType = 'String'
          MinWidth = 70
          Options.Editing = False
          Width = 70
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 2
        end
        object cxTreeListColumn38: TcxTreeListColumn
          Caption.Text = #32428#24230
          DataBinding.ValueType = 'String'
          MinWidth = 70
          Options.Editing = False
          Width = 70
          Position.ColIndex = 4
          Position.RowIndex = 0
          Position.BandIndex = 2
        end
        object cxTreeListColumn39: TcxTreeListColumn
          Caption.Text = #36895#24230
          DataBinding.ValueType = 'String'
          MinWidth = 50
          Options.Editing = False
          Width = 50
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 1
        end
        object cxTreeListColumn40: TcxTreeListColumn
          Caption.Text = 'GPS'#26102#38388
          DataBinding.ValueType = 'String'
          MinWidth = 120
          Options.Editing = False
          Width = 126
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 1
        end
        object cxTreeListColumn41: TcxTreeListColumn
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
        object cxTreeListColumn42: TcxTreeListColumn
          Caption.Text = #26041#21521
          DataBinding.ValueType = 'String'
          MinWidth = 50
          Options.Editing = False
          Width = 80
          Position.ColIndex = 7
          Position.RowIndex = 0
          Position.BandIndex = 1
        end
        object cxTreeListColumn43: TcxTreeListColumn
          Caption.Text = 'GPS'#29366#24577
          DataBinding.ValueType = 'String'
          MinWidth = 60
          Options.Editing = False
          Width = 64
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 1
        end
        object cxTreeListColumn44: TcxTreeListColumn
          Caption.Text = #29366#24577
          DataBinding.ValueType = 'String'
          MinWidth = 60
          Options.Editing = False
          Width = 60
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 1
        end
        object cxTreeListColumn45: TcxTreeListColumn
          Visible = False
          Caption.Text = #36319#36394
          DataBinding.ValueType = 'Boolean'
          MinWidth = 50
          Width = 50
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 2
        end
        object cxTreeListColumn46: TcxTreeListColumn
          Visible = False
          Caption.Text = #26174#31034#36712#36857
          DataBinding.ValueType = 'Boolean'
          MinWidth = 60
          Width = 60
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 2
        end
        object cxTreeListColumn47: TcxTreeListColumn
          Visible = False
          Caption.Text = #38544#34255
          DataBinding.ValueType = 'Boolean'
          Width = 53
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 2
        end
        object cxTreeListColumn48: TcxTreeListColumn
          Caption.Text = #36710#36742#33258#32534#21495
          DataBinding.ValueType = 'Integer'
          Options.Editing = False
          Width = 118
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumn49: TcxTreeListColumn
          Caption.Text = 'SIM'#21345#21495
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Width = 127
          Position.ColIndex = 5
          Position.RowIndex = 0
          Position.BandIndex = 2
        end
        object cxTreeListColumn50: TcxTreeListColumn
          Visible = False
          Caption.Text = #36716#21160#29366#24577
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Width = 62
          Position.ColIndex = 8
          Position.RowIndex = 0
          Position.BandIndex = 1
        end
        object cxTreeListColumn51: TcxTreeListColumn
          Caption.Text = #21496#26426
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxToplightListcxTreeListColumn1: TcxTreeListColumn
          Caption.Text = #25152#23646#20844#21496
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxToplightListcxTreeListColumn2: TcxTreeListColumn
          Caption.Text = #20844#21496#30005#35805
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Position.ColIndex = 4
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'TSM'#25925#38556
      ImageIndex = 4
      object cxTSMList: TcxTreeList
        Left = 0
        Top = 0
        Width = 659
        Height = 184
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
        PopupMenu = Mainf.PopupMenu_funDev
        StateImages = Mainf.ImageList1
        TabOrder = 0
        OnClick = cxTSMListClick
        OnDblClick = cxTSMListDblClick
        object cxTreeListColumn52: TcxTreeListColumn
          Caption.Text = #35774#22791'ID'
          DataBinding.ValueType = 'String'
          MinWidth = 50
          Options.Editing = False
          Width = 118
          Position.ColIndex = 6
          Position.RowIndex = 0
          Position.BandIndex = 2
        end
        object cxTreeListColumn53: TcxTreeListColumn
          Caption.Text = #36710#29260#21495
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Width = 142
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
          SortOrder = soAscending
        end
        object cxTreeListColumn54: TcxTreeListColumn
          Caption.Text = #32463#24230
          DataBinding.ValueType = 'String'
          MinWidth = 70
          Options.Editing = False
          Width = 70
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 2
        end
        object cxTreeListColumn55: TcxTreeListColumn
          Caption.Text = #32428#24230
          DataBinding.ValueType = 'String'
          MinWidth = 70
          Options.Editing = False
          Width = 70
          Position.ColIndex = 4
          Position.RowIndex = 0
          Position.BandIndex = 2
        end
        object cxTreeListColumn56: TcxTreeListColumn
          Caption.Text = #36895#24230
          DataBinding.ValueType = 'String'
          MinWidth = 50
          Options.Editing = False
          Width = 50
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 1
        end
        object cxTreeListColumn57: TcxTreeListColumn
          Caption.Text = 'GPS'#26102#38388
          DataBinding.ValueType = 'String'
          MinWidth = 120
          Options.Editing = False
          Width = 126
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 1
        end
        object cxTreeListColumn58: TcxTreeListColumn
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
        object cxTreeListColumn59: TcxTreeListColumn
          Caption.Text = #26041#21521
          DataBinding.ValueType = 'String'
          MinWidth = 50
          Options.Editing = False
          Width = 80
          Position.ColIndex = 7
          Position.RowIndex = 0
          Position.BandIndex = 1
        end
        object cxTreeListColumn60: TcxTreeListColumn
          Caption.Text = 'GPS'#29366#24577
          DataBinding.ValueType = 'String'
          MinWidth = 60
          Options.Editing = False
          Width = 64
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 1
        end
        object cxTreeListColumn61: TcxTreeListColumn
          Caption.Text = #29366#24577
          DataBinding.ValueType = 'String'
          MinWidth = 60
          Options.Editing = False
          Width = 60
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 1
        end
        object cxTreeListColumn62: TcxTreeListColumn
          Visible = False
          Caption.Text = #36319#36394
          DataBinding.ValueType = 'Boolean'
          MinWidth = 50
          Width = 50
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 2
        end
        object cxTreeListColumn63: TcxTreeListColumn
          Visible = False
          Caption.Text = #26174#31034#36712#36857
          DataBinding.ValueType = 'Boolean'
          MinWidth = 60
          Width = 60
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 2
        end
        object cxTreeListColumn64: TcxTreeListColumn
          Visible = False
          Caption.Text = #38544#34255
          DataBinding.ValueType = 'Boolean'
          Width = 53
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 2
        end
        object cxTreeListColumn65: TcxTreeListColumn
          Caption.Text = #36710#36742#33258#32534#21495
          DataBinding.ValueType = 'Integer'
          Options.Editing = False
          Width = 118
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumn66: TcxTreeListColumn
          Caption.Text = 'SIM'#21345#21495
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Width = 127
          Position.ColIndex = 5
          Position.RowIndex = 0
          Position.BandIndex = 2
        end
        object cxTreeListColumn67: TcxTreeListColumn
          Visible = False
          Caption.Text = #36716#21160#29366#24577
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Width = 62
          Position.ColIndex = 8
          Position.RowIndex = 0
          Position.BandIndex = 1
        end
        object cxTreeListColumn68: TcxTreeListColumn
          Caption.Text = #21496#26426
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTSMListcxTreeListColumn1: TcxTreeListColumn
          Caption.Text = #25152#23646#20844#21496
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTSMListcxTreeListColumn2: TcxTreeListColumn
          Caption.Text = #20844#21496#30005#35805
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Position.ColIndex = 4
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
      end
    end
  end
end
