object FrmAlarmCar: TFrmAlarmCar
  Left = 133
  Top = 347
  Width = 1010
  Height = 251
  Caption = #25253#35686#20449#24687'('#24179#21488#25253#21578')'
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1002
    Height = 217
    ActivePage = TabSheet7
    Align = alClient
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    MultiLine = True
    ParentFont = False
    TabOrder = 0
    object TabSheet_AlarmList: TTabSheet
      Hint = #25253#35686#36710
      Caption = #21496#26426#25353#38190#25253#35686
      Font.Charset = GB2312_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ImageIndex = 1
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      object Splitter_Alarm: TSplitter
        Left = 599
        Top = 0
        Height = 190
        Align = alRight
        Beveled = True
      end
      object cxAlarmList: TcxTreeList
        Left = 0
        Top = 0
        Width = 599
        Height = 190
        Align = alClient
        Bands = <
          item
            Caption.Text = 'Band1'
          end>
        BufferedPaint = True
        Font.Charset = GB2312_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        OptionsData.Editing = False
        OptionsView.GridLines = tlglBoth
        OptionsView.ShowRoot = False
        ParentFont = False
        TabOrder = 0
        OnClick = cxAlarmListClick
        OnDblClick = cxAlarmListDblClick
        OnFocusedNodeChanged = cxAlarmListFocusedNodeChanged
        object alarm_ID: TcxTreeListColumn
          Visible = False
          Caption.Text = #35774#22791'ID'
          DataBinding.ValueType = 'String'
          MinWidth = 80
          Width = 91
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object alarm_carNo: TcxTreeListColumn
          Caption.Text = #36710#29260#21495
          DataBinding.ValueType = 'String'
          MinWidth = 80
          Width = 112
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object alarm_startTime: TcxTreeListColumn
          Caption.Text = #25253#35686#26102#38388
          DataBinding.ValueType = 'DateTime'
          MinWidth = 150
          Width = 151
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
          SortOrder = soDescending
        end
        object alarm_stop: TcxTreeListColumn
          Visible = False
          Caption.Text = #35299#38500#26102#38388
          DataBinding.ValueType = 'String'
          MinWidth = 100
          Width = 150
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object alarm_count: TcxTreeListColumn
          Caption.Text = #36830#32493#25253#35686#27425#25968
          DataBinding.ValueType = 'Integer'
          Width = 97
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object alarm_long: TcxTreeListColumn
          Caption.Text = #32463#24230
          DataBinding.ValueType = 'String'
          MinWidth = 100
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object alarm_lat: TcxTreeListColumn
          Caption.Text = #32428#24230
          DataBinding.ValueType = 'String'
          MinWidth = 100
          Width = 101
          Position.ColIndex = 4
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
      end
      object cxStopAlarmList: TcxTreeList
        Left = 602
        Top = 0
        Width = 392
        Height = 190
        Align = alRight
        Bands = <
          item
            Caption.AlignVert = vaCenter
            Caption.Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00344446333334
              44433333FFFF333333FFFF33000033AAA43333332A4333338833F33333883F33
              00003332A46333332A4333333383F33333383F3300003332A2433336A6633333
              33833F333383F33300003333AA463362A433333333383F333833F33300003333
              6AA4462A46333333333833FF833F33330000333332AA22246333333333338333
              33F3333300003333336AAA22646333333333383333F8FF33000033444466AA43
              6A43333338FFF8833F383F330000336AA246A2436A43333338833F833F383F33
              000033336A24AA442A433333333833F33FF83F330000333333A2AA2AA4333333
              333383333333F3330000333333322AAA4333333333333833333F333300003333
              333322A4333333333333338333F333330000333333344A433333333333333338
              3F333333000033333336A24333333333333333833F333333000033333336AA43
              33333333333333833F3333330000333333336663333333333333333888333333
              0000}
            Caption.Text = ' '#24050#35299#38500#25253#35686#36710#36742
          end>
        BufferedPaint = True
        Font.Charset = GB2312_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        OptionsData.Editing = False
        OptionsView.Bands = True
        OptionsView.GridLines = tlglBoth
        OptionsView.ShowRoot = False
        ParentFont = False
        PopupMenu = PopupMenu_DelStopAlarmList
        TabOrder = 1
        object cxTreeListColumn1: TcxTreeListColumn
          Visible = False
          Caption.Text = #35774#22791'ID'
          DataBinding.ValueType = 'String'
          MinWidth = 70
          Width = 87
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
          SortOrder = soAscending
        end
        object cxTreeListColumn2: TcxTreeListColumn
          Caption.Text = #36710#29260#21495
          DataBinding.ValueType = 'String'
          MinWidth = 80
          Width = 109
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumn3: TcxTreeListColumn
          Caption.Text = #25253#35686#26102#38388
          DataBinding.ValueType = 'DateTime'
          MinWidth = 150
          Width = 150
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumn4: TcxTreeListColumn
          Caption.Text = #35299#38500#26102#38388
          DataBinding.ValueType = 'String'
          MinWidth = 150
          Width = 151
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object stopAlarm_count: TcxTreeListColumn
          Caption.Text = #36830#25509#25253#35686#27425#25968
          DataBinding.ValueType = 'Integer'
          Width = 96
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumn5: TcxTreeListColumn
          Caption.Text = #32463#24230
          DataBinding.ValueType = 'String'
          MinWidth = 100
          Width = 105
          Position.ColIndex = 4
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumn6: TcxTreeListColumn
          Caption.Text = #32428#24230
          DataBinding.ValueType = 'String'
          MinWidth = 100
          Width = 103
          Position.ColIndex = 5
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = #32858#38598#25253#35686
      ImageIndex = 5
      object Splitter4: TSplitter
        Left = 332
        Top = 0
        Height = 190
        Align = alRight
      end
      object AssembleWarringList: TcxTreeList
        Left = 0
        Top = 0
        Width = 332
        Height = 190
        Align = alClient
        Bands = <
          item
            Caption.Text = 'Band1'
          end>
        BufferedPaint = True
        OptionsData.Editing = False
        OptionsView.GridLines = tlglBoth
        OptionsView.ShowRoot = False
        PopupMenu = PopupMenu1
        StateImages = Mainf.ImageList1
        TabOrder = 0
        OnClick = AssembleWarringListClick
        OnCustomDrawCell = OutTownListCustomDrawCell
        OnDblClick = cxAlarmListDblClick
        OnEditValueChanged = OutTownListEditValueChanged
        object cxTreeListColumn23: TcxTreeListColumn
          Caption.Text = #21306#22495'ID'
          DataBinding.ValueType = 'String'
          Width = 56
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumn19: TcxTreeListColumn
          Caption.Text = #21306#22495#21517#31216
          DataBinding.ValueType = 'String'
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumn20: TcxTreeListColumn
          Caption.Text = #21306#22495#31867#22411
          DataBinding.ValueType = 'String'
          MinWidth = 70
          Width = 108
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumn21: TcxTreeListColumn
          Caption.Text = #38480#23450#25968#37327
          DataBinding.ValueType = 'String'
          Width = 80
          Position.ColIndex = 4
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumn22: TcxTreeListColumn
          Caption.Text = #32858#38598#36710#36742#25968
          DataBinding.ValueType = 'String'
          Width = 80
          Position.ColIndex = 5
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
      end
      object cxTreeList2: TcxTreeList
        Left = 335
        Top = 0
        Width = 659
        Height = 190
        Align = alRight
        Bands = <
          item
            Caption.Glyph.Data = {
              5A020000424D5A02000000000000F20000002800000012000000120000000100
              08000000000068010000120B0000120B00002F0000002F00000000000000FFFF
              FF00FF00FF00BA4C0A00C8703B00DCA48200E3B69B00D08A4C00FCEEE100FBE3
              CC00F9F6F300FBF9F700C27B0000CE953300E6C997008ADCFF0081D6FF0079CD
              FF0074C7FF006EC2FF004199E40062B9FF003187D3002E7EC7004092DE0055A6
              F00058ABF4005CAFFC0068B9FF002070BE002B7DCF0024507C004E9FEE002548
              69007583910000499500405E7E000042920000306900788EAB0044608F000024
              6A00133A87002C498D00D5D5D500BFBFBF00ACACAC0002020202020202020202
              0202020202020202000002021F29292929262E2E2E2D2D2D2D2C2C0200000228
              23111E101225210604030303030303020000022A150F11100F132B0909090909
              090903020000022A10110F1C1B10172708080808080903020000022A121A1212
              202B192B0B0B0B08080903020000022A13181320122B24220101010B08090302
              0000022B1D14121E122B01010101010B0A090302000002022A1D1216132B0E0D
              0C0C0C0C0C0C030200000202052B131D2B060403030303030303070200000202
              04012B2B01010108090309090903020200000202030101010101010809030808
              0903020200000202030C0C0C0C0C0C0C0C030B08090302020000020207030303
              0303030303070108090302020000020202020203010101010101010809030202
              00000202020202030C0C0C0C0C0C0C0C0C030202000002020202020703030303
              030303030307020200000202020202020202020202020202020202020000}
            Caption.Text = #32858#38598#36710#36742
          end>
        BufferedPaint = True
        OptionsData.Editing = False
        OptionsView.Bands = True
        OptionsView.GridLines = tlglBoth
        OptionsView.ShowRoot = False
        PopupMenu = PopupMenu3
        TabOrder = 1
        OnClick = cxAlarmListClick
        OnDblClick = cxAlarmListDblClick
        object cxTreeListColumn34: TcxTreeListColumn
          Visible = False
          Caption.Text = #35774#22791'ID'
          DataBinding.ValueType = 'String'
          MinWidth = 80
          Width = 97
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumn35: TcxTreeListColumn
          Caption.Text = #36710#29260#21495
          DataBinding.ValueType = 'String'
          MinWidth = 70
          Width = 108
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumn41: TcxTreeListColumn
          Caption.Text = #21496#26426
          DataBinding.ValueType = 'String'
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumn38: TcxTreeListColumn
          Caption.Text = #32463#24230
          DataBinding.ValueType = 'String'
          MinWidth = 50
          Width = 131
          Position.ColIndex = 7
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumn39: TcxTreeListColumn
          Caption.Text = #32428#24230
          DataBinding.ValueType = 'String'
          MinWidth = 80
          Width = 131
          Position.ColIndex = 8
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumn40: TcxTreeListColumn
          Caption.Text = #36895#24230
          DataBinding.ValueType = 'String'
          Position.ColIndex = 6
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeList2cxTreeListColumn1: TcxTreeListColumn
          Caption.Text = #20844#21496#21517#31216
          DataBinding.ValueType = 'String'
          Position.ColIndex = 4
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeList2cxTreeListColumn2: TcxTreeListColumn
          Caption.Text = #20844#21496#30005#35805
          DataBinding.ValueType = 'String'
          Position.ColIndex = 5
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeList2cxTreeListColumn3: TcxTreeListColumn
          Visible = False
          DataBinding.ValueType = 'String'
          Position.ColIndex = 8
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
      end
    end
    object TabSheet_OutCAreaList: TTabSheet
      Caption = #39542#20986#22260#26639#25253#35686
      object Splitter1: TSplitter
        Left = 326
        Top = 0
        Height = 190
        Align = alRight
      end
      object cxOutCAreaList: TcxTreeList
        Left = 0
        Top = 0
        Width = 326
        Height = 190
        Align = alClient
        Bands = <
          item
            Caption.Text = 'Band1'
          end>
        BufferedPaint = True
        OptionsData.Editing = False
        OptionsView.GridLines = tlglBoth
        OptionsView.ShowRoot = False
        PopupMenu = PopupMenu_DelOutCAreaList
        TabOrder = 0
        OnClick = cxAlarmListClick
        OnDblClick = cxAlarmListDblClick
        OnEditValueChanged = cxOutCAreaListEditValueChanged
        object Outdev_Id: TcxTreeListColumn
          Visible = False
          Caption.Text = #35774#22791'ID'
          DataBinding.ValueType = 'String'
          MinWidth = 80
          Options.Editing = False
          Width = 80
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object Outdev_carNo: TcxTreeListColumn
          Caption.Text = #36710#29260#21495
          DataBinding.ValueType = 'String'
          MinWidth = 70
          Options.Editing = False
          Width = 92
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object Outdev_StartTime: TcxTreeListColumn
          Caption.Text = #24320#22987#26102#38388
          DataBinding.ValueType = 'String'
          MinWidth = 100
          Options.Editing = False
          Width = 129
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
          SortOrder = soDescending
        end
        object Outdev_endTime: TcxTreeListColumn
          Visible = False
          Caption.Text = #32467#26463#26102#38388
          DataBinding.ValueType = 'String'
          MinWidth = 100
          Options.Editing = False
          Width = 143
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object Outdev_ConfineAreaID: TcxTreeListColumn
          Caption.Text = #21306#22495#21517#31216
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Width = 73
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxOutCAreaListcxTreeListColumn1: TcxTreeListColumn
          Caption.Text = #25552#31034
          DataBinding.ValueType = 'Boolean'
          Width = 43
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
      end
      object cxOutCAreaList_History: TcxTreeList
        Left = 329
        Top = 0
        Width = 665
        Height = 190
        Align = alRight
        Bands = <
          item
            Caption.Glyph.Data = {
              AA030000424DAA03000000000000360000002800000011000000110000000100
              18000000000074030000C40E0000C40E00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FF00000000000000FF00FF000000000000FF00FF
              000000000000FF00FF000000000000FF00FF000000000000FF00FF000000FF00
              FF00000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FF00FF00FFFF00FF00000000
              0000848484848484848484848484000000848484848484FF00FFFF00FFFF00FF
              FF00FF000000FF00FF00000000000000C6C6C6C6C6C600000000000000000000
              0000C6C6C6000000000000848484FF00FFFF00FFFF00FFFF00FFFF00FF000000
              0000FF0000000000000000840000840000840000FF0000000000FF0000840000
              0000848484FF00FFFF00FF000000FF00FF00000000FF00FF0000000000000084
              00008400008400008400008400000000000000000000000000FF00FFFF00FF00
              0000FF00FF00FF00FFFF00FF008400008400FFFF00848484FFFF00FFFF00FFFF
              0000000000FF0000FF00000000848484FF00FFFF00FFFF00FF00000000FF00FF
              FF00FF00000000000000FF0000FF0000FF00000000000000000000C6C6C60000
              00000000848484000000FF00FF00000000FF00FFFF00FF0000FF0000FF000000
              0000000000840000840000840000FF0000000000FF000084000000000000FF00
              FF00FF00FFFF00FFFF00FF000000000000000000000000000084000084000084
              000084000084000000000000000000FF00FFFF00FF00000000FF00FFFF00FFFF
              00FFFF00FF000084000084FFFF00848484FFFF00FFFF00FFFF000000000000FF
              0000FF000000FF00FF00000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              00000000FF0000FF0000FF000000FF00FFFF00FFFF00FF000000FF00FF00FF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FF00000000FF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
              0000FF00FF00000000FF00FF000000000000FF00FF000000000000FF00FF0000
              00000000FF00FF000000000000FF00FF000000000000FF00FF00FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FF00}
            Caption.Text = ' '#36234#30028#25253#35686#21382#21490#35760#24405
          end>
        BufferedPaint = True
        OptionsData.Editing = False
        OptionsView.Bands = True
        OptionsView.GridLines = tlglBoth
        OptionsView.ShowRoot = False
        PopupMenu = PopupMenu_DelOutCAreaList
        TabOrder = 1
        OnClick = cxAlarmListClick
        OnDblClick = cxAlarmListDblClick
        object cxTreeListColumn7: TcxTreeListColumn
          Visible = False
          Caption.Text = #35774#22791'ID'
          DataBinding.ValueType = 'String'
          MinWidth = 80
          Width = 106
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumn8: TcxTreeListColumn
          Caption.Text = #36710#29260#21495
          DataBinding.ValueType = 'String'
          MinWidth = 70
          Width = 85
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumn9: TcxTreeListColumn
          Caption.Text = #24320#22987#26102#38388
          DataBinding.ValueType = 'String'
          MinWidth = 100
          Width = 148
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumn10: TcxTreeListColumn
          Caption.Text = #32467#26463#26102#38388
          DataBinding.ValueType = 'String'
          MinWidth = 100
          Width = 148
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 0
          SortOrder = soDescending
        end
        object cxTreeListColumn14: TcxTreeListColumn
          Caption.Text = #21306#22495#21517#31216
          DataBinding.ValueType = 'String'
          MinWidth = 50
          Width = 84
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumn15: TcxTreeListColumn
          Caption.Text = #31227#21040#21382#21490#35760#24405#21015#34920#30340#21407#22240
          DataBinding.ValueType = 'String'
          MinWidth = 80
          Width = 233
          Position.ColIndex = 4
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
      end
    end
    object TabSheet_InCAreaList: TTabSheet
      Caption = #39542#20837#22260#26639#25253#35686
      ImageIndex = 2
      object Splitter2: TSplitter
        Left = 332
        Top = 0
        Height = 190
        Align = alRight
      end
      object cxInCAreaList: TcxTreeList
        Left = 0
        Top = 0
        Width = 332
        Height = 190
        Align = alClient
        Bands = <
          item
            Caption.Text = 'Band1'
          end>
        BufferedPaint = True
        OptionsData.Editing = False
        OptionsView.GridLines = tlglBoth
        OptionsView.ShowRoot = False
        TabOrder = 0
        OnClick = cxAlarmListClick
        OnDblClick = cxAlarmListDblClick
        OnFocusedNodeChanged = cxInCAreaListFocusedNodeChanged
        object InArea_Id: TcxTreeListColumn
          Visible = False
          Caption.Text = #35774#22791'ID'
          DataBinding.ValueType = 'String'
          MinWidth = 80
          Width = 80
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object InArea_CarNo: TcxTreeListColumn
          Caption.Text = #36710#29260#21495
          DataBinding.ValueType = 'String'
          MinWidth = 70
          Width = 101
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object InArea_StartTime: TcxTreeListColumn
          Caption.Text = #24320#22987#26102#38388
          DataBinding.ValueType = 'String'
          MinWidth = 100
          Width = 122
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
          SortOrder = soDescending
        end
        object InArea_EndTime: TcxTreeListColumn
          Visible = False
          Caption.Text = #32467#26463#26102#38388
          DataBinding.ValueType = 'String'
          MinWidth = 100
          Width = 143
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object InArea_ConfineAreaID: TcxTreeListColumn
          Caption.Text = #21306#22495#21517#31216
          DataBinding.ValueType = 'String'
          Width = 79
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
      end
      object cxInCAreaList_History: TcxTreeList
        Left = 335
        Top = 0
        Width = 659
        Height = 190
        Align = alRight
        Bands = <
          item
            Caption.Glyph.Data = {
              5A020000424D5A02000000000000F20000002800000012000000120000000100
              08000000000068010000120B0000120B00002F0000002F00000000000000FFFF
              FF00FF00FF00BA4C0A00C8703B00DCA48200E3B69B00D08A4C00FCEEE100FBE3
              CC00F9F6F300FBF9F700C27B0000CE953300E6C997008ADCFF0081D6FF0079CD
              FF0074C7FF006EC2FF004199E40062B9FF003187D3002E7EC7004092DE0055A6
              F00058ABF4005CAFFC0068B9FF002070BE002B7DCF0024507C004E9FEE002548
              69007583910000499500405E7E000042920000306900788EAB0044608F000024
              6A00133A87002C498D00D5D5D500BFBFBF00ACACAC0002020202020202020202
              0202020202020202000002021F29292929262E2E2E2D2D2D2D2C2C0200000228
              23111E101225210604030303030303020000022A150F11100F132B0909090909
              090903020000022A10110F1C1B10172708080808080903020000022A121A1212
              202B192B0B0B0B08080903020000022A13181320122B24220101010B08090302
              0000022B1D14121E122B01010101010B0A090302000002022A1D1216132B0E0D
              0C0C0C0C0C0C030200000202052B131D2B060403030303030303070200000202
              04012B2B01010108090309090903020200000202030101010101010809030808
              0903020200000202030C0C0C0C0C0C0C0C030B08090302020000020207030303
              0303030303070108090302020000020202020203010101010101010809030202
              00000202020202030C0C0C0C0C0C0C0C0C030202000002020202020703030303
              030303030307020200000202020202020202020202020202020202020000}
            Caption.Text = #39542#20837#21306#22495#25253#35686#21382#21490#35760#24405
          end>
        BufferedPaint = True
        OptionsData.Editing = False
        OptionsView.Bands = True
        OptionsView.GridLines = tlglBoth
        OptionsView.ShowRoot = False
        PopupMenu = PopupMenu_DelInCAreaList
        TabOrder = 1
        OnClick = cxAlarmListClick
        OnDblClick = cxAlarmListDblClick
        object cxTreeListColumn24: TcxTreeListColumn
          Visible = False
          Caption.Text = #35774#22791'ID'
          DataBinding.ValueType = 'String'
          MinWidth = 80
          Width = 97
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumn25: TcxTreeListColumn
          Caption.Text = #36710#29260#21495
          DataBinding.ValueType = 'String'
          MinWidth = 70
          Width = 89
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumn26: TcxTreeListColumn
          Caption.Text = #24320#22987#26102#38388
          DataBinding.ValueType = 'String'
          MinWidth = 100
          Width = 124
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
          SortOrder = soDescending
        end
        object cxTreeListColumn27: TcxTreeListColumn
          Caption.Text = #32467#26463#26102#38388
          DataBinding.ValueType = 'String'
          MinWidth = 100
          Width = 124
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumn28: TcxTreeListColumn
          Caption.Text = #21306#22495'ID'#21495
          DataBinding.ValueType = 'String'
          MinWidth = 50
          Width = 78
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumn29: TcxTreeListColumn
          Caption.Text = #31227#21040#21382#21490#35760#24405#21015#34920#30340#21407#22240
          DataBinding.ValueType = 'String'
          MinWidth = 80
          Width = 224
          Position.ColIndex = 4
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = #20986#22478#30041#21488
      ImageIndex = 4
      object Splitter3: TSplitter
        Left = 332
        Top = 0
        Height = 190
        Align = alRight
      end
      object OutTownList: TcxTreeList
        Left = 0
        Top = 0
        Width = 332
        Height = 190
        Align = alClient
        Bands = <
          item
            Caption.Text = 'Band1'
          end>
        BufferedPaint = True
        OptionsData.Editing = False
        OptionsView.GridLines = tlglBoth
        OptionsView.ShowRoot = False
        PopupMenu = PopupMenu1
        StateImages = Mainf.ImageList1
        TabOrder = 0
        OnClick = cxAlarmListClick
        OnCustomDrawCell = OutTownListCustomDrawCell
        OnDblClick = cxAlarmListDblClick
        OnEditValueChanged = OutTownListEditValueChanged
        object dev_id: TcxTreeListColumn
          Visible = False
          Caption.Text = #35774#22791'ID'
          DataBinding.ValueType = 'String'
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object car_no: TcxTreeListColumn
          Caption.Text = #36710#29260#21495
          DataBinding.ValueType = 'String'
          MinWidth = 70
          Width = 108
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object OutToTownTime: TcxTreeListColumn
          Caption.Text = #20986#22478#26102#38388
          DataBinding.ValueType = 'String'
          Width = 149
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object GoToTownTime: TcxTreeListColumn
          Caption.Text = #36827#22478#26102#38388
          DataBinding.ValueType = 'String'
          MinWidth = 100
          Width = 149
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object long: TcxTreeListColumn
          Caption.Text = #32463#24230
          DataBinding.ValueType = 'String'
          Width = 128
          Position.ColIndex = 4
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object lat: TcxTreeListColumn
          Caption.Text = #32428#24230
          DataBinding.ValueType = 'String'
          Width = 131
          Position.ColIndex = 5
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object speed: TcxTreeListColumn
          Caption.Text = #36895#24230
          DataBinding.ValueType = 'Integer'
          Position.ColIndex = 6
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object receiveTime: TcxTreeListColumn
          Caption.Text = #25910#21040#26102#38388
          DataBinding.ValueType = 'String'
          Width = 149
          Position.ColIndex = 6
          Position.RowIndex = 0
          Position.BandIndex = 0
          SortOrder = soDescending
        end
        object OutTownListcxTreeListColumn1: TcxTreeListColumn
          Caption.Text = #25552#31034
          DataBinding.ValueType = 'Boolean'
          Width = 50
          Position.ColIndex = 8
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
      end
      object HistoryDevList: TcxTreeList
        Left = 335
        Top = 0
        Width = 659
        Height = 190
        Align = alRight
        Bands = <
          item
            Caption.Glyph.Data = {
              5A020000424D5A02000000000000F20000002800000012000000120000000100
              08000000000068010000120B0000120B00002F0000002F00000000000000FFFF
              FF00FF00FF00BA4C0A00C8703B00DCA48200E3B69B00D08A4C00FCEEE100FBE3
              CC00F9F6F300FBF9F700C27B0000CE953300E6C997008ADCFF0081D6FF0079CD
              FF0074C7FF006EC2FF004199E40062B9FF003187D3002E7EC7004092DE0055A6
              F00058ABF4005CAFFC0068B9FF002070BE002B7DCF0024507C004E9FEE002548
              69007583910000499500405E7E000042920000306900788EAB0044608F000024
              6A00133A87002C498D00D5D5D500BFBFBF00ACACAC0002020202020202020202
              0202020202020202000002021F29292929262E2E2E2D2D2D2D2C2C0200000228
              23111E101225210604030303030303020000022A150F11100F132B0909090909
              090903020000022A10110F1C1B10172708080808080903020000022A121A1212
              202B192B0B0B0B08080903020000022A13181320122B24220101010B08090302
              0000022B1D14121E122B01010101010B0A090302000002022A1D1216132B0E0D
              0C0C0C0C0C0C030200000202052B131D2B060403030303030303070200000202
              04012B2B01010108090309090903020200000202030101010101010809030808
              0903020200000202030C0C0C0C0C0C0C0C030B08090302020000020207030303
              0303030303070108090302020000020202020203010101010101010809030202
              00000202020202030C0C0C0C0C0C0C0C0C030202000002020202020703030303
              030303030307020200000202020202020202020202020202020202020000}
            Caption.Text = #20986#22478#21382#21490#35760#24405
          end>
        BufferedPaint = True
        OptionsData.Editing = False
        OptionsView.Bands = True
        OptionsView.GridLines = tlglBoth
        OptionsView.ShowRoot = False
        PopupMenu = PopupMenu2
        TabOrder = 1
        OnClick = cxAlarmListClick
        OnDblClick = cxAlarmListDblClick
        object cxTreeListColumn11: TcxTreeListColumn
          Visible = False
          Caption.Text = #35774#22791'ID'
          DataBinding.ValueType = 'String'
          MinWidth = 80
          Width = 97
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumn12: TcxTreeListColumn
          Caption.Text = #36710#29260#21495
          DataBinding.ValueType = 'String'
          MinWidth = 70
          Width = 108
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumn13: TcxTreeListColumn
          Caption.Text = #20986#22478#26102#38388
          DataBinding.ValueType = 'String'
          MinWidth = 149
          Width = 149
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
          SortOrder = soDescending
        end
        object cxTreeListColumn16: TcxTreeListColumn
          Caption.Text = #36827#22478#26102#38388
          DataBinding.ValueType = 'String'
          MinWidth = 100
          Width = 149
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumn17: TcxTreeListColumn
          Caption.Text = #32463#24230
          DataBinding.ValueType = 'String'
          MinWidth = 50
          Width = 131
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumn18: TcxTreeListColumn
          Caption.Text = #32428#24230
          DataBinding.ValueType = 'String'
          MinWidth = 80
          Width = 131
          Position.ColIndex = 4
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object HistoryDevListcxTreeListColumn1: TcxTreeListColumn
          Caption.Text = #36895#24230
          DataBinding.ValueType = 'Integer'
          Position.ColIndex = 6
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object HistoryDevListcxTreeListColumn2: TcxTreeListColumn
          Caption.Text = #25910#21040#26102#38388
          DataBinding.ValueType = 'String'
          Width = 149
          Position.ColIndex = 7
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #32456#31471#25253#35686
      ImageIndex = 6
      object cxOtherKindsAlarmList: TcxTreeList
        Left = 0
        Top = 0
        Width = 994
        Height = 190
        Align = alClient
        Bands = <
          item
            Caption.Text = 'Band1'
          end>
        BufferedPaint = True
        OptionsData.Editing = False
        OptionsView.GridLines = tlglBoth
        OptionsView.ShowRoot = False
        TabOrder = 0
        OnClick = cxAlarmListClick
        OnDblClick = cxAlarmListDblClick
        object cxTreeListColumnOtherList_DevId: TcxTreeListColumn
          Visible = False
          Caption.Text = #35774#22791'ID'
          DataBinding.ValueType = 'String'
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumnOtherList_CarNo: TcxTreeListColumn
          Caption.Text = #36710#29260#21495
          DataBinding.ValueType = 'String'
          MinWidth = 70
          Width = 108
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumnOtherList_AlarmType: TcxTreeListColumn
          Caption.Text = #25253#35686#31867#22411
          DataBinding.ValueType = 'String'
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumnOtherList_GpsTime: TcxTreeListColumn
          Caption.Text = 'GPS'#26102#38388
          DataBinding.ValueType = 'DateTime'
          MinWidth = 100
          Width = 152
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumnOtherList_longitude: TcxTreeListColumn
          Caption.Text = #32463#24230
          DataBinding.ValueType = 'String'
          Width = 128
          Position.ColIndex = 4
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumnOtherList_latitude: TcxTreeListColumn
          Caption.Text = #32428#24230
          DataBinding.ValueType = 'String'
          Width = 131
          Position.ColIndex = 5
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumnOtherList_Speed: TcxTreeListColumn
          Caption.Text = #36895#24230
          DataBinding.ValueType = 'Integer'
          Width = 145
          Position.ColIndex = 6
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumnOtherList_Time: TcxTreeListColumn
          Caption.Text = #25910#21040#26102#38388
          DataBinding.ValueType = 'String'
          Width = 149
          Position.ColIndex = 6
          Position.RowIndex = 0
          Position.BandIndex = 0
          SortOrder = soDescending
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = #30097#20284#19978#35775
      ImageIndex = 6
      object Splitter5: TSplitter
        Left = 667
        Top = 0
        Height = 190
        Align = alRight
      end
      object SuspectedPetitionsWarringList: TcxTreeList
        Left = 0
        Top = 0
        Width = 667
        Height = 190
        Align = alClient
        Bands = <
          item
            Caption.Text = 'Band1'
          end>
        BufferedPaint = True
        OptionsData.Editing = False
        OptionsView.GridLines = tlglBoth
        OptionsView.ShowRoot = False
        PopupMenu = PopupMenu1
        StateImages = Mainf.ImageList1
        TabOrder = 0
        OnClick = SuspectedPetitionsWarringListClick
        OnCustomDrawCell = OutTownListCustomDrawCell
        OnDblClick = cxAlarmListDblClick
        OnEditValueChanged = OutTownListEditValueChanged
        object cxTreeListColumn30: TcxTreeListColumn
          Caption.Text = #21306#22495'ID'
          DataBinding.ValueType = 'String'
          Width = 56
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumn31: TcxTreeListColumn
          Caption.Text = #21306#22495#21517#31216
          DataBinding.ValueType = 'String'
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumn32: TcxTreeListColumn
          Caption.Text = #21306#22495#31867#22411
          DataBinding.ValueType = 'String'
          MinWidth = 70
          Width = 108
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeList1cxTreeListColumn1: TcxTreeListColumn
          Caption.Text = #38480#23450#25968#37327
          DataBinding.ValueType = 'String'
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeList1cxTreeListColumn2: TcxTreeListColumn
          Caption.Text = #38480#23450#36710#36742#36895#24230
          DataBinding.ValueType = 'String'
          Position.ColIndex = 4
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeList1cxTreeListColumn3: TcxTreeListColumn
          Caption.Text = #38480#23450#20572#30041#26102#38388
          DataBinding.ValueType = 'String'
          Position.ColIndex = 5
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeList1cxTreeListColumn4: TcxTreeListColumn
          Caption.Text = #24403#21069#36710#36742#25968
          DataBinding.ValueType = 'String'
          Position.ColIndex = 6
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
      end
      object cxTreeList3: TcxTreeList
        Left = 670
        Top = 0
        Width = 324
        Height = 190
        Align = alRight
        Bands = <
          item
            Caption.Glyph.Data = {
              5A020000424D5A02000000000000F20000002800000012000000120000000100
              08000000000068010000120B0000120B00002F0000002F00000000000000FFFF
              FF00FF00FF00BA4C0A00C8703B00DCA48200E3B69B00D08A4C00FCEEE100FBE3
              CC00F9F6F300FBF9F700C27B0000CE953300E6C997008ADCFF0081D6FF0079CD
              FF0074C7FF006EC2FF004199E40062B9FF003187D3002E7EC7004092DE0055A6
              F00058ABF4005CAFFC0068B9FF002070BE002B7DCF0024507C004E9FEE002548
              69007583910000499500405E7E000042920000306900788EAB0044608F000024
              6A00133A87002C498D00D5D5D500BFBFBF00ACACAC0002020202020202020202
              0202020202020202000002021F29292929262E2E2E2D2D2D2D2C2C0200000228
              23111E101225210604030303030303020000022A150F11100F132B0909090909
              090903020000022A10110F1C1B10172708080808080903020000022A121A1212
              202B192B0B0B0B08080903020000022A13181320122B24220101010B08090302
              0000022B1D14121E122B01010101010B0A090302000002022A1D1216132B0E0D
              0C0C0C0C0C0C030200000202052B131D2B060403030303030303070200000202
              04012B2B01010108090309090903020200000202030101010101010809030808
              0903020200000202030C0C0C0C0C0C0C0C030B08090302020000020207030303
              0303030303070108090302020000020202020203010101010101010809030202
              00000202020202030C0C0C0C0C0C0C0C0C030202000002020202020703030303
              030303030307020200000202020202020202020202020202020202020000}
            Caption.Text = #30097#20284#19978#35775#36710#36742
          end>
        BufferedPaint = True
        OptionsData.Editing = False
        OptionsView.Bands = True
        OptionsView.GridLines = tlglBoth
        OptionsView.ShowRoot = False
        PopupMenu = PopupMenu3
        TabOrder = 1
        OnClick = cxAlarmListClick
        OnDblClick = cxAlarmListDblClick
        object cxTreeListColumn37: TcxTreeListColumn
          Visible = False
          Caption.Text = #35774#22791'ID'
          DataBinding.ValueType = 'String'
          MinWidth = 80
          Width = 97
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumn42: TcxTreeListColumn
          Caption.Text = #36710#29260#21495
          DataBinding.ValueType = 'String'
          MinWidth = 70
          Width = 108
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumn43: TcxTreeListColumn
          Caption.Text = #21496#26426
          DataBinding.ValueType = 'String'
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumn44: TcxTreeListColumn
          Caption.Text = #32463#24230
          DataBinding.ValueType = 'String'
          MinWidth = 50
          Width = 131
          Position.ColIndex = 8
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumn45: TcxTreeListColumn
          Caption.Text = #32428#24230
          DataBinding.ValueType = 'String'
          MinWidth = 80
          Width = 131
          Position.ColIndex = 10
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumn46: TcxTreeListColumn
          Caption.Text = #36895#24230
          DataBinding.ValueType = 'String'
          Position.ColIndex = 7
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumn47: TcxTreeListColumn
          Caption.Text = #20844#21496#21517#31216
          DataBinding.ValueType = 'String'
          Position.ColIndex = 4
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumn48: TcxTreeListColumn
          Caption.Text = #20844#21496#30005#35805
          DataBinding.ValueType = 'String'
          Position.ColIndex = 5
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeList3cxTreeListColumn1: TcxTreeListColumn
          Caption.Text = #20302#36895#25345#32493#26102#38388
          DataBinding.ValueType = 'String'
          Position.ColIndex = 6
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = #30005#23376#22260#26639#25253#35686
      ImageIndex = 7
      object cxAreaAlarmList: TcxTreeList
        Left = 0
        Top = 0
        Width = 994
        Height = 190
        Align = alClient
        Bands = <
          item
          end>
        BufferedPaint = True
        OptionsCustomizing.BandMoving = False
        OptionsCustomizing.BandVertSizing = False
        OptionsCustomizing.ColumnVertSizing = False
        OptionsData.Editing = False
        OptionsData.Deleting = False
        OptionsView.GridLines = tlglBoth
        OptionsView.ShowRoot = False
        PopupMenu = PopupMenu_AreaAlarmUpload
        TabOrder = 0
        object areaAlarm_Type: TcxTreeListColumn
          Caption.Text = #25253#35686#31867#22411
          DataBinding.ValueType = 'String'
          Width = 150
          Position.ColIndex = 17
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object areaAlarm_areaName: TcxTreeListColumn
          Caption.Text = #25253#35686#21306#22495#25110#36335#32447
          DataBinding.ValueType = 'String'
          Width = 213
          Position.ColIndex = 23
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object areaAlarm_CarNo: TcxTreeListColumn
          Caption.Text = #25253#35686#36710#36742
          DataBinding.ValueType = 'String'
          Width = 92
          Position.ColIndex = 31
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object areaAlarm_Time: TcxTreeListColumn
          Caption.Text = #25253#35686#26102#38388
          DataBinding.ValueType = 'String'
          Width = 138
          Position.ColIndex = 37
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object areaAlarm_Memo: TcxTreeListColumn
          Caption.Text = #22791#27880
          DataBinding.ValueType = 'String'
          Width = 365
          Position.ColIndex = 45
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
      end
    end
    object TabSheet6: TTabSheet
      Caption = #20851#38190#28857#30417#25511#25253#35686
      ImageIndex = 8
      object cxTreeList1: TcxTreeList
        Left = 0
        Top = 0
        Width = 994
        Height = 190
        Align = alClient
        Bands = <
          item
          end>
        BufferedPaint = True
        OptionsCustomizing.BandMoving = False
        OptionsCustomizing.BandVertSizing = False
        OptionsCustomizing.ColumnVertSizing = False
        OptionsData.Editing = False
        OptionsData.Deleting = False
        OptionsView.GridLines = tlglBoth
        OptionsView.ShowRoot = False
        TabOrder = 0
        object cxTreeListColumn49: TcxTreeListColumn
          Caption.Text = #25253#35686#31867#22411
          DataBinding.ValueType = 'String'
          Width = 120
          Position.ColIndex = 31
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumn50: TcxTreeListColumn
          Caption.Text = #25253#35686#36710#36742
          DataBinding.ValueType = 'String'
          Width = 97
          Position.ColIndex = 37
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumn51: TcxTreeListColumn
          Caption.Text = #25253#35686#26102#38388
          DataBinding.ValueType = 'String'
          Width = 122
          Position.ColIndex = 41
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeList1cxTreeListColumn5: TcxTreeListColumn
          Caption.Text = #22791#27880
          DataBinding.ValueType = 'String'
          Width = 452
          Position.ColIndex = 42
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
      end
    end
    object TabSheet7: TTabSheet
      Caption = #22320#29702#26629#26639#38450#30423#25253#35686
      ImageIndex = 9
      object cxTreeList4: TcxTreeList
        Left = 0
        Top = 0
        Width = 994
        Height = 190
        Align = alClient
        Bands = <
          item
          end>
        BufferedPaint = True
        OptionsCustomizing.BandMoving = False
        OptionsCustomizing.BandVertSizing = False
        OptionsCustomizing.ColumnVertSizing = False
        OptionsData.Editing = False
        OptionsData.Deleting = False
        OptionsView.GridLines = tlglBoth
        OptionsView.ShowRoot = False
        PopupMenu = PopupMenu_AccoffMoveAlarm
        Styles.Selection = cxStyle1
        TabOrder = 0
        OnCustomDrawCell = cxTreeList4CustomDrawCell
        object cxTreeListColumn36: TcxTreeListColumn
          Caption.Text = #25253#35686#36710#36742
          DataBinding.ValueType = 'String'
          Width = 97
          Position.ColIndex = 37
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumn52: TcxTreeListColumn
          Caption.Text = #25253#35686#26102#38388
          DataBinding.ValueType = 'String'
          Width = 122
          Position.ColIndex = 41
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumn53: TcxTreeListColumn
          Caption.Text = #22791#27880
          DataBinding.ValueType = 'String'
          Width = 340
          Position.ColIndex = 42
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeList4cxTreeListColumn1: TcxTreeListColumn
          Caption.Text = #22788#29702#29366#24577
          DataBinding.ValueType = 'String'
          Width = 430
          Position.ColIndex = 43
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeList4cxTreeListColumn2: TcxTreeListColumn
          Visible = False
          Caption.Text = 'dealFlagId'
          DataBinding.ValueType = 'String'
          Position.ColIndex = 44
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeList4cxTreeListColumn3: TcxTreeListColumn
          Visible = False
          Caption.Text = 'typeId'
          DataBinding.ValueType = 'String'
          Position.ColIndex = 45
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeList4cxTreeListColumn4: TcxTreeListColumn
          Visible = False
          Caption.Text = 'alarminfoId'
          DataBinding.ValueType = 'String'
          Position.ColIndex = 46
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
      end
    end
  end
  object PopupMenu_DelStopAlarmList: TPopupMenu
    Left = 416
    Top = 131
    object N1: TMenuItem
      Action = Del_StopAlarmDevs
    end
    object N7: TMenuItem
      Caption = #30331#35760#25253#35686#22788#29702#21488#24080
    end
  end
  object ActionList1: TActionList
    Images = Mainf.ImageList1
    Left = 452
    Top = 59
    object Del_StopAlarmDevs: TAction
      Caption = #21024#38500#25152#26377
      Hint = #21024#38500#25152#26377#24050#35299#38500#25253#35686#36710#36742
      ImageIndex = 0
      OnExecute = Del_StopAlarmDevsExecute
    end
    object Del_OutCAreaDevs: TAction
      Caption = #21024#38500#25152#26377#36234#30028#35760#24405
      ImageIndex = 0
      OnExecute = Del_OutCAreaDevsExecute
    end
    object Del_InCAreaDevs: TAction
      Caption = #21024#38500#25152#26377#36234#30028#35760#24405
      ImageIndex = 0
      OnExecute = Del_InCAreaDevsExecute
    end
    object NotShowOutPop: TAction
      Caption = #19981#25552#31034#25110#25552#31034#39542#20986#25253#35686
      ImageIndex = 5
      OnExecute = NotShowOutPopExecute
    end
    object NotShowAllOutPop: TAction
      Caption = #19981#25552#31034#25152#26377#39542#20986#25253#35686
      OnExecute = NotShowAllOutPopExecute
    end
  end
  object PopupMenu_DelOutCAreaList: TPopupMenu
    Left = 452
    Top = 131
    object N4: TMenuItem
      Action = NotShowOutPop
    end
    object N2: TMenuItem
      Action = NotShowAllOutPop
    end
  end
  object PopupMenu_DelInCAreaList: TPopupMenu
    Images = Mainf.ImageList1
    Left = 500
    Top = 130
    object N3: TMenuItem
      Action = Del_InCAreaDevs
      Caption = #21024#38500#25152#26377#39542#20837#25253#35686#35760#24405
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 276
    Top = 87
    object N5: TMenuItem
      Caption = #25105#30693#36947#20102
      OnClick = N5Click
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 540
    Top = 127
    object N6: TMenuItem
      Caption = #21024#38500#25152#26377#20986#22478#21382#21490#35760#24405
      OnClick = N6Click
    end
  end
  object PopupMenu3: TPopupMenu
    Left = 604
    Top = 103
    object N8: TMenuItem
      Caption = #23548#20986#32858#38598#36710#36742
      OnClick = N8Click
    end
  end
  object PopupMenu_AreaAlarmUpload: TPopupMenu
    Left = 724
    Top = 87
    object N9: TMenuItem
      Caption = #21024#38500#25152#26377#30005#23376#22260#26639#25253#35686#35760#24405
      OnClick = N9Click
    end
  end
  object PopupMenu_AccoffMoveAlarm: TPopupMenu
    Left = 840
    Top = 120
    object menuDealAlarm: TMenuItem
      Caption = #25253#35686#20449#24687#22788#29702
      OnClick = menuDealAlarmClick
    end
    object MenuItem1: TMenuItem
      Caption = '-'
    end
    object menuDelNotConfirmedAlarm: TMenuItem
      Caption = #21024#38500#26410#30830#35748#25253#35686#20449#24687
      OnClick = menuDelNotConfirmedAlarmClick
    end
    object menuDelAllNotConfirmedAlarm: TMenuItem
      Caption = #21024#38500#25152#26377#26410#30830#35748#25253#35686#20449#24687
      OnClick = menuDelAllNotConfirmedAlarmClick
    end
    object MenuItem2: TMenuItem
      Caption = '-'
    end
    object menuDelDealedAlarm: TMenuItem
      Caption = #21024#38500#24050#22788#29702#23436#27605#25253#35686#20449#24687
      OnClick = menuDelDealedAlarmClick
    end
    object menuDelAllDealedAlarm: TMenuItem
      Caption = #21024#38500#25152#26377#24050#22788#29702#23436#27605#25253#35686#20449#24687
      OnClick = menuDelAllDealedAlarmClick
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = clSilver
    end
  end
end
