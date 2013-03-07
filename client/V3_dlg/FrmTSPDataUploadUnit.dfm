object frmTSPDataUpload: TfrmTSPDataUpload
  Left = 192
  Top = 186
  Width = 928
  Height = 480
  Caption = #32456#31471#36879#20256#25968#25454
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
    PopupMenu = PopupMenu1
    TabOrder = 0
    object cxAlarmSuperviseListcxTreeListColumn1: TcxTreeListColumn
      Caption.Text = #36879#20256#31867#22411
      DataBinding.ValueType = 'String'
      Width = 112
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxAlarmSuperviseListcxTreeListColumn2: TcxTreeListColumn
      Caption.Text = #36879#20256#25968#25454#20869#23481
      DataBinding.ValueType = 'String'
      Width = 476
      Position.ColIndex = 3
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxAlarmSuperviseListcxTreeListColumn3: TcxTreeListColumn
      Caption.Text = #19978#20256#26102#38388
      DataBinding.ValueType = 'String'
      Width = 121
      Position.ColIndex = 4
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
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
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 200
    Top = 120
    object N1: TMenuItem
      Caption = #28165#31354#21015#34920
      OnClick = N1Click
    end
  end
end
