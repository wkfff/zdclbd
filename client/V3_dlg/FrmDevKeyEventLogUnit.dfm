object frmDevKeyEventLog: TfrmDevKeyEventLog
  Left = 192
  Top = 284
  Width = 928
  Height = 480
  Caption = #36710#36742#20851#38190#20107#20214#26085#24535
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
  object cxTreeList1: TcxTreeList
    Left = 0
    Top = 0
    Width = 920
    Height = 446
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
    object cxAlarmSuperviseListcxTreeListColumn4: TcxTreeListColumn
      Caption.Text = #36710#29260#21495
      DataBinding.ValueType = 'String'
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxAlarmSuperviseListcxTreeListColumn5: TcxTreeListColumn
      Caption.Text = #35774#22791#21495
      DataBinding.ValueType = 'String'
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxAlarmSuperviseListcxTreeListColumn1: TcxTreeListColumn
      Caption.Text = #26085#24535#26631#39064
      DataBinding.ValueType = 'String'
      Width = 112
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxAlarmSuperviseListcxTreeListColumn2: TcxTreeListColumn
      Caption.Text = #26085#24535#20869#23481
      DataBinding.ValueType = 'String'
      Width = 476
      Position.ColIndex = 3
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxAlarmSuperviseListcxTreeListColumn3: TcxTreeListColumn
      Caption.Text = #35760#24405#26102#38388
      DataBinding.ValueType = 'String'
      Width = 121
      Position.ColIndex = 4
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 200
    Top = 136
    object N1: TMenuItem
      Caption = #28165#31354#26085#24535
      OnClick = N1Click
    end
  end
end
