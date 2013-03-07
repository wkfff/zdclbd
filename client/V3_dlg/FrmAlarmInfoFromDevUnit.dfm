object frmAlarmFromDev: TfrmAlarmFromDev
  Left = 214
  Top = 250
  Width = 1068
  Height = 320
  Caption = #25253#35686#20449#24687'('#32456#31471#19978#25253')'
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
  PixelsPerInch = 96
  TextHeight = 13
  object cxAreaAlarmList: TcxTreeList
    Left = 0
    Top = 0
    Width = 812
    Height = 286
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
    PopupMenu = PopupMenu1
    Styles.Selection = cxStyle2
    TabOrder = 0
    OnClick = cxAreaAlarmListClick
    OnCustomDrawCell = cxAreaAlarmListCustomDrawCell
    object alarm_type: TcxTreeListColumn
      Caption.Text = #25253#35686#31867#22411
      DataBinding.ValueType = 'String'
      Options.Editing = False
      Width = 131
      Position.ColIndex = 18
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object alarm_pos: TcxTreeListColumn
      Caption.Text = #25253#35686#22320#28857
      DataBinding.ValueType = 'String'
      Options.Editing = False
      Width = 149
      Position.ColIndex = 25
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object alarm_carNo: TcxTreeListColumn
      Caption.Text = #25253#35686#36710#36742
      DataBinding.ValueType = 'String'
      Options.Editing = False
      Width = 71
      Position.ColIndex = 17
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object alarm_time: TcxTreeListColumn
      Caption.Text = #25253#35686#26102#38388
      DataBinding.ValueType = 'String'
      Options.Editing = False
      Width = 116
      Position.ColIndex = 24
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object alarm_memo: TcxTreeListColumn
      Caption.Text = #35828#26126
      DataBinding.ValueType = 'String'
      Options.Editing = False
      Width = 162
      Position.ColIndex = 47
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object alarm_devId: TcxTreeListColumn
      Caption.Text = #32456#31471#35774#22791#21495
      DataBinding.ValueType = 'String'
      Options.Editing = False
      Width = 88
      Position.ColIndex = 55
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object alarm_dealFlag: TcxTreeListColumn
      Caption.Text = #22788#29702#29366#24577
      DataBinding.ValueType = 'String'
      Options.Editing = False
      Width = 600
      Position.ColIndex = 62
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object alarm_dealFlagId: TcxTreeListColumn
      Visible = False
      Caption.Text = #22788#29702#29366#24577'ID'
      DataBinding.ValueType = 'Integer'
      Position.ColIndex = 61
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object alarm_typeId: TcxTreeListColumn
      Visible = False
      Caption.Text = #31867#22411'ID'
      DataBinding.ValueType = 'Integer'
      Position.ColIndex = 77
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object alarm_id: TcxTreeListColumn
      Visible = False
      Caption.Text = 'alarmID'
      DataBinding.ValueType = 'Integer'
      Position.ColIndex = 82
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
  end
  object Memo1: TMemo
    Left = 812
    Top = 0
    Width = 248
    Height = 286
    Align = alRight
    BorderStyle = bsNone
    Color = 15000804
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
  end
  object PopupMenu1: TPopupMenu
    Left = 296
    Top = 88
    object menuDealAlarm: TMenuItem
      Caption = #25253#35686#20449#24687#22788#29702
      OnClick = menuDealAlarmClick
    end
    object N4: TMenuItem
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
    object N5: TMenuItem
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
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor]
      Color = clSilver
    end
  end
end
