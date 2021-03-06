object ConfineAreaListFrm: TConfineAreaListFrm
  Left = 222
  Top = 272
  Width = 1003
  Height = 207
  Caption = #30005#23376#22260#26639
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
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 385
    Top = 0
    Height = 173
  end
  object cxAreaList: TcxTreeList
    Left = 0
    Top = 0
    Width = 385
    Height = 173
    Align = alLeft
    Bands = <
      item
        Caption.Text = 'Band1'
      end>
    BufferedPaint = True
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    Images = ImageList1
    OptionsData.Editing = False
    OptionsData.Deleting = False
    OptionsView.GridLines = tlglBoth
    OptionsView.ShowRoot = False
    ParentFont = False
    PopupMenu = PopupMenu_Area
    TabOrder = 0
    OnClick = cxAreaListClick
    OnDblClick = Area_SetExecute
    OnEditValueChanged = cxAreaListEditValueChanged
    OnFocusedNodeChanged = cxAreaListFocusedNodeChanged
    object area_Id: TcxTreeListColumn
      Caption.Text = #21306#22495'ID'
      DataBinding.ValueType = 'Integer'
      Options.Editing = False
      Width = 62
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object area_Name: TcxTreeListColumn
      Caption.Text = #21306#22495#21517#31216
      DataBinding.ValueType = 'String'
      Options.Editing = False
      Width = 73
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object area_color: TcxTreeListColumn
      PropertiesClassName = 'TcxColorComboBoxProperties'
      Properties.AllowSelectColor = True
      Properties.CustomColors = <>
      Properties.ShowDescriptions = False
      Properties.OnSelectCustomColor = area_colorPropertiesSelectCustomColor
      Caption.Text = #39068#33394
      DataBinding.ValueType = 'Variant'
      Options.Editing = False
      Width = 66
      Position.ColIndex = 3
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object area_Isdraw: TcxTreeListColumn
      Caption.Text = #26159#21542#30011#20986
      DataBinding.ValueType = 'Boolean'
      Width = 67
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object area_Type: TcxTreeListColumn
      Caption.Text = #25253#35686#31867#22411
      DataBinding.ValueType = 'String'
      Options.Editing = False
      Width = 114
      Position.ColIndex = 4
      Position.RowIndex = 0
      Position.BandIndex = 0
      SortOrder = soDescending
    end
  end
  object Panel1: TPanel
    Left = 388
    Top = 0
    Width = 475
    Height = 173
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object cxDeviceList: TcxTreeList
      Left = 0
      Top = 20
      Width = 475
      Height = 153
      Align = alClient
      Bands = <
        item
          Caption.AlignHorz = taCenter
          Caption.Text = #22522#26412#20449#24687
          Width = 93
        end>
      BufferedPaint = True
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      OptionsData.Editing = False
      OptionsData.Deleting = False
      OptionsView.GridLines = tlglBoth
      OptionsView.ShowRoot = False
      ParentFont = False
      PopupMenu = PopupMenu_Dev
      StateImages = Mainf.ImageList1
      TabOrder = 0
      OnClick = cxDeviceListClick
      OnDblClick = cxDeviceListDblClick
      OnEditing = cxDeviceListEditing
      OnEditValueChanged = cxDeviceListEditValueChanged
      OnFocusedNodeChanged = cxDeviceListFocusedNodeChanged
      object dev_Id: TcxTreeListColumn
        Visible = False
        Caption.Text = #35774#22791'ID'
        DataBinding.ValueType = 'String'
        MinWidth = 50
        Options.Editing = False
        Width = 101
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object dev_carNo: TcxTreeListColumn
        Caption.Text = #36710#29260#21495
        DataBinding.ValueType = 'String'
        MinWidth = 100
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
        Position.ColIndex = 2
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object dev_lat: TcxTreeListColumn
        Caption.Text = #32428#24230
        DataBinding.ValueType = 'String'
        MinWidth = 70
        Options.Editing = False
        Width = 70
        Position.ColIndex = 3
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object dev_speed: TcxTreeListColumn
        Caption.Text = #36895#24230
        DataBinding.ValueType = 'String'
        MinWidth = 50
        Options.Editing = False
        Width = 50
        Position.ColIndex = 4
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object dev_Gpstime: TcxTreeListColumn
        Caption.Text = 'GPS'#26102#38388
        DataBinding.ValueType = 'String'
        MinWidth = 120
        Options.Editing = False
        Width = 120
        Position.ColIndex = 6
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object dev_Altitude: TcxTreeListColumn
        Visible = False
        Caption.Text = #28023#25300#39640#24230
        DataBinding.ValueType = 'Float'
        MinWidth = 50
        Options.Editing = False
        Width = 80
        Position.ColIndex = 5
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object dev_angle: TcxTreeListColumn
        Visible = False
        Caption.Text = #35282#24230
        DataBinding.ValueType = 'Float'
        MinWidth = 50
        Options.Editing = False
        Width = 80
        Position.ColIndex = 5
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object switch_8: TcxTreeListColumn
        Caption.Text = 'GPS'#29366#24577
        DataBinding.ValueType = 'String'
        MinWidth = 60
        Options.Editing = False
        Width = 60
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object switch_9: TcxTreeListColumn
        Caption.Text = #29366#24577
        DataBinding.ValueType = 'String'
        MinWidth = 60
        Options.Editing = False
        Width = 60
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object dev_Track: TcxTreeListColumn
        Visible = False
        Caption.Text = #36319#36394
        DataBinding.ValueType = 'Boolean'
        MinWidth = 50
        Width = 50
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object dev_DrawTrack: TcxTreeListColumn
        Visible = False
        Caption.Text = #26174#31034#36712#36857
        DataBinding.ValueType = 'Boolean'
        MinWidth = 60
        Width = 60
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
    end
    object Panel_CurArea: TPanel
      Left = 0
      Top = 0
      Width = 475
      Height = 20
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = #24403#21069#21306#22495#30340#38480#23450#36710#36742
      Color = 15792327
      TabOrder = 1
      object Label1: TLabel
        Left = 24
        Top = 5
        Width = 65
        Height = 13
        Caption = #21306#22495#39068#33394#65306
      end
      object Shape_CurrAreaColor: TShape
        Left = 86
        Top = 2
        Width = 24
        Height = 18
      end
    end
  end
  object Panel2: TPanel
    Left = 863
    Top = 0
    Width = 132
    Height = 173
    Align = alRight
    BevelOuter = bvLowered
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 1
      Top = 69
      Width = 130
      Height = 23
      Action = Area_addDev
      Caption = #28155#21152#38480#23450#36710#36742
      TabOrder = 0
    end
    object BitBtn3: TBitBtn
      Left = 1
      Top = 1
      Width = 130
      Height = 23
      Action = Area_Set
      Caption = #26356#25913#21306#22495#23646#24615
      TabOrder = 2
    end
    object BitBtn4: TBitBtn
      Left = 1
      Top = 91
      Width = 130
      Height = 23
      Action = Dev_del
      Caption = #21024#38500#38480#23450#36710#36742
      TabOrder = 3
    end
    object BitBtn5: TBitBtn
      Left = 1
      Top = 113
      Width = 130
      Height = 23
      Action = Dev_DelAll
      Caption = #21024#38500#25152#26377#38480#23450#36710#36742
      TabOrder = 4
    end
    object BitBtn2: TBitBtn
      Left = 1
      Top = 23
      Width = 130
      Height = 23
      Action = Area_del
      Caption = #21024#38500#24403#21069#21306#22495
      TabOrder = 1
    end
    object BitBtn6: TBitBtn
      Left = 1
      Top = 45
      Width = 130
      Height = 23
      Action = Area_Clear
      Caption = #21024#38500#25152#26377#30005#23376#22260#26639
      TabOrder = 5
    end
    object BitBtn7: TBitBtn
      Left = 1
      Top = 136
      Width = 130
      Height = 23
      Action = area_Save
      Caption = #20445#23384#35774#32622
      TabOrder = 6
    end
  end
  object PopupMenu_Area: TPopupMenu
    Left = 216
    Top = 80
    object N4: TMenuItem
      Action = Area_addDev
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object N1: TMenuItem
      Action = Area_Set
    end
    object N3: TMenuItem
      Action = Area_del
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object N6: TMenuItem
      Action = Area_Clear
    end
    object N8: TMenuItem
      Action = Area_SaveToServer
      Visible = False
    end
    object s1: TMenuItem
      Caption = #35774#32622#21306#22495#21040#36710#26426
      Visible = False
      OnClick = s1Click
    end
  end
  object ActionList1: TActionList
    Left = 176
    Top = 88
    object Area_addDev: TAction
      Category = 'areaSet'
      Caption = #21521#24403#21069#21306#22495#28155#21152#38480#23450#36710#36742
      Hint = #22312#24403#21069#21306#22495#20013#28155#21152#38480#23450#36710#36742
      OnExecute = Area_addDevExecute
    end
    object Area_Set: TAction
      Category = 'areaSet'
      Caption = #26356#25913#24403#21069#21306#22495#23646#24615
      Hint = #26356#25913#24403#21069#21306#22495#23646#24615
      OnExecute = Area_SetExecute
    end
    object Area_del: TAction
      Category = 'areaSet'
      Caption = #21024#38500#24403#21069#21306#22495
      OnExecute = Area_delExecute
    end
    object Dev_del: TAction
      Category = 'DevSet'
      Caption = #21024#38500#24403#21069#38480#23450#36710#36742
      Hint = #20174#24403#21069#21306#22495#20013#21024#38500#38480#23450#36710#36742
      OnExecute = Dev_delExecute
    end
    object Dev_DelAll: TAction
      Category = 'DevSet'
      Caption = #21024#38500#25152#26377#38480#23450#36710#36742
      Hint = #23558#24403#21069#21306#22495#30340#25152#26377#38480#23450#36710#36742#21024#38500
      OnExecute = Dev_DelAllExecute
    end
    object Area_Clear: TAction
      Category = 'areaSet'
      Caption = #21024#38500#25152#26377#30005#23376#22260#26639#21306#22495
      Hint = #21024#38500#25152#26377#30005#23376#22260#26639#21306#22495
      OnExecute = Area_ClearExecute
    end
    object Area_SaveToServer: TAction
      Category = 'areaSet'
      Caption = #21306#22495#35774#32622#19978#20256#26381#21153#22120
      OnExecute = Area_SaveToServerExecute
    end
    object area_Save: TAction
      Category = 'areaSet'
      Caption = #20445#23384#35774#32622
      OnExecute = area_SaveExecute
    end
  end
  object PopupMenu_Dev: TPopupMenu
    Left = 329
    Top = 56
    object Devdel1: TMenuItem
      Action = Dev_del
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object DevDelAll1: TMenuItem
      Action = Dev_DelAll
    end
  end
  object ImageList1: TImageList
    Left = 304
    Top = 80
    Bitmap = {
      494C010103000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFA518000000000052FF8400006B21000094310000000000FF9C00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008C8C8C000000
      0000000000000000000000F7420000D639000094310000000000000000000000
      0000636363000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000C8C8C800F6F6F60000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5B5B5008C8C8C00B5B5B5000000
      0000FFFFFF00006321008CFFAD005AFF840000CE4200005A2100DEFFFF000000
      00008C8C8C0063636300B5B5B500636363000000000000000000000000000000
      0000000000000000000000000000CEDEFF008CB5FF0084ADFF003984FF003984
      FF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000A3A3A300D5D5D50000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5B5B500000000008C8C8C000000
      0000C6FFD600C6FFD6008CFFAD005AFF840000CE420000CE420000CE42000000
      00008C8C8C00000000008C8C8C00636363000000000000000000000000000000
      00000000000000000000000000008CB5FF00BDD6FF00BDD6FF0094BDFF003984
      FF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5B5B5008C8C8C00B5B5B5000000
      000000000000C6FFD6008CFFAD005AFF840000CE420000CE4200000000000000
      00008C8C8C008C8C8C00B5B5B500636363000000000000000000000000000000
      000000000000000000008CB5FF00D6E7FF00D6E7FF00D6E7FF00B5CEFF00639C
      FF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5B5B500000000008C8C8C000000
      0000FFEFCE00101010008CFFAD008CFFAD0000CE420010101000FFDE94000000
      00008C8C8C00000000008C8C8C00636363000000000000000000000000000000
      000000000000528CFF00E7E7E700D6E7FF00D6E7FF00D6E7FF00BDD6FF00639C
      FF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5B5B5008C8C8C00B5B5B5000000
      0000FFEFCE00FFEFCE00101010001010100010101000FFDE9400FFDE94000000
      00008C8C8C008C8C8C00B5B5B500636363000000000000000000000000000000
      0000186BFF00F7F7F700D6E7FF00A5C6FF00D6E7FF00D6E7FF00A5C6FF00528C
      FF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5B5B500000000008C8C8C000000
      0000FFFFFF001010100094BDFF0094BDFF0094BDFF0010101000FFDE94000000
      00008C8C8C00000000008C8C8C00636363000000000000000000000000000000
      0000FFFFFF000000000000000000A5C6FF00185A8400A5C6FF00185A7B00639C
      FF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5B5B5008C8C8C00B5B5B5000000
      0000FFFFFF0010101000DEEFFF00DEEFFF0094BDFF0010101000FFDE94000000
      00008C8C8C008C8C8C00B5B5B500636363000000000000000000000000000000
      0000000000000000000000000000A5C6FF00185A8400A5C6FF0018526B00639C
      FF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5B5B500000000008C8C8C000000
      0000FFFFFF00BDBDBD00DEEFFF00DEEFFF0094BDFF0010101000FFDE94000000
      00008C8C8C00000000008C8C8C00636363000000000000000000000000000000
      0000000000000000000000000000D6E7FF00185A8400A5C6FF0010425A00639C
      FF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5B5B500B5B5B5009C9C9C000000
      0000FFFFFF00E7E7E700A5A5A5001010100010101000FFDE9400FFDE94000000
      00008C8C8C006363630063636300636363000000000000000000000000000000
      0000000000000000000000000000D6E7FF00184A6B008CB5FF0010395A00528C
      FF0000000000000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B5B5B5009C9C
      9C0000000000FFFFFF00FFFFFF00FFF7D600FFDE9400FFDE9400000000008C8C
      8C00636363000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000104A63008CB5FF00000000000000
      000000000000000000000000000000000000FFFFFF0000000000C8C8C800F6F6
      F600000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B5B5
      B5009C9C9C0000000000000000000000000000000000000000008C8C8C006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000A3A3A300D5D5
      D50000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B5B5B500B5B5B5009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00E00FFFFF00000000C007FFFF00000000
      0000FE0F000000000000FC07000000000000FC07000000000000F80700000000
      0000F007000000000000E007000000000000E007000000000000E40700000000
      0000FC07000000000000FC07000000000000FE0F00000000C007FF3F00000000
      E00FFFFF00000000F01FFFFF0000000000000000000000000000000000000000
      000000000000}
  end
end
