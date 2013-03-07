object frmAlarmSuperviseList: TfrmAlarmSuperviseList
  Left = 42
  Top = 240
  Width = 1327
  Height = 367
  Caption = #25253#35686#30563#21150#21015#34920
  Color = clBtnFace
  DragKind = dkDock
  DragMode = dmAutomatic
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object cxAlarmSuperviseList: TcxTreeList
    Left = 0
    Top = 0
    Width = 1319
    Height = 333
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
    OptionsSelection.CellSelect = False
    OptionsView.GridLines = tlglBoth
    OptionsView.ShowRoot = False
    PopupMenu = PopupMenu1
    Styles.Selection = cxStyle3
    Styles.ContentEven = cxStyle2
    TabOrder = 0
    object cxAreaAlarmListcxTreeListColumn1: TcxTreeListColumn
      Visible = False
      Caption.Text = #25253#35686#30563#21150'ID'
      DataBinding.ValueType = 'Integer'
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxAreaAlarmListcxTreeListColumn2: TcxTreeListColumn
      Caption.Text = #25253#35686#20449#24687#26469#28304
      DataBinding.ValueType = 'String'
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxAreaAlarmListcxTreeListColumn3: TcxTreeListColumn
      Caption.Text = #25253#35686#31867#22411
      DataBinding.ValueType = 'String'
      Width = 86
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxAreaAlarmListcxTreeListColumn4: TcxTreeListColumn
      Caption.Text = #30563#21150#32423#21035
      DataBinding.ValueType = 'String'
      Width = 78
      Position.ColIndex = 5
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxAreaAlarmListcxTreeListColumn5: TcxTreeListColumn
      Caption.Text = #30563#21150#25253#35686#36710#36742
      DataBinding.ValueType = 'String'
      Width = 92
      Position.ColIndex = 6
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxAreaAlarmListcxTreeListColumn6: TcxTreeListColumn
      Caption.Text = #30563#21150#20154
      DataBinding.ValueType = 'String'
      Width = 61
      Position.ColIndex = 8
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxAreaAlarmListcxTreeListColumn7: TcxTreeListColumn
      Caption.Text = #30563#21150#20154#30005#35805
      DataBinding.ValueType = 'String'
      Width = 89
      Position.ColIndex = 9
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxAreaAlarmListcxTreeListColumn8: TcxTreeListColumn
      Caption.Text = #30563#21150#20154'Email'
      DataBinding.ValueType = 'String'
      Width = 159
      Position.ColIndex = 10
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxAreaAlarmListcxTreeListColumn9: TcxTreeListColumn
      Caption.Text = #22788#29702#29366#24577
      DataBinding.ValueType = 'String'
      Width = 120
      Position.ColIndex = 11
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxAreaAlarmListcxTreeListColumn10: TcxTreeListColumn
      Visible = False
      Caption.Text = #22788#29702#29366#24577'ID'
      DataBinding.ValueType = 'Integer'
      Position.ColIndex = 9
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxAlarmSuperviseListcxTreeListColumn1: TcxTreeListColumn
      Caption.Text = #36710#29260#39068#33394
      DataBinding.ValueType = 'String'
      Width = 64
      Position.ColIndex = 7
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxAlarmSuperviseListcxTreeListColumn2: TcxTreeListColumn
      Caption.Text = #25509#25910#26102#38388
      DataBinding.ValueType = 'String'
      Width = 107
      Position.ColIndex = 13
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxAlarmSuperviseListcxTreeListColumn3: TcxTreeListColumn
      Caption.Text = #25253#35686#26102#38388
      DataBinding.ValueType = 'String'
      Width = 115
      Position.ColIndex = 3
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxAlarmSuperviseListcxTreeListColumn4: TcxTreeListColumn
      Caption.Text = #30563#21150#25130#27490#26102#38388
      DataBinding.ValueType = 'String'
      Width = 109
      Position.ColIndex = 4
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 312
    Top = 168
    object N1: TMenuItem
      Caption = #27719#25253#30563#21150#22788#29702#32467#26524
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object N3: TMenuItem
      Caption = #21024#38500#35813#26465#30563#21150#25253#35686#20449#24687
      OnClick = N3Click
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = clSilver
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor]
      Color = 15465212
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor]
      Color = 9211020
    end
  end
end
