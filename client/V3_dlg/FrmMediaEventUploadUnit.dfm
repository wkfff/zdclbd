object frmMediaEventUpload: TfrmMediaEventUpload
  Left = 200
  Top = 342
  Width = 928
  Height = 214
  Caption = #22810#23186#20307#20107#20214#20449#24687#19978#20256
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
    Height = 180
    Align = alClient
    Bands = <
      item
      end>
    BufferedPaint = False
    OptionsCustomizing.BandVertSizing = False
    OptionsCustomizing.ColumnVertSizing = False
    OptionsData.Editing = False
    OptionsData.Deleting = False
    OptionsView.GridLines = tlglBoth
    OptionsView.ShowRoot = False
    TabOrder = 0
    object cxTreeList1cxTreeListColumn1: TcxTreeListColumn
      Caption.Text = #24207#21495
      DataBinding.ValueType = 'String'
      Options.Editing = False
      Width = 64
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxTreeList1cxTreeListColumn7: TcxTreeListColumn
      Caption.Text = #36710#29260#21495
      DataBinding.ValueType = 'String'
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxTreeList1cxTreeListColumn2: TcxTreeListColumn
      Caption.Text = #22810#23186#20307#25968#25454'ID'
      DataBinding.ValueType = 'String'
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxTreeList1cxTreeListColumn3: TcxTreeListColumn
      Caption.Text = #22810#23186#20307#31867#22411
      DataBinding.ValueType = 'String'
      Width = 123
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxTreeList1cxTreeListColumn4: TcxTreeListColumn
      Caption.Text = #22810#23186#20307#26684#24335#32534#30721
      DataBinding.ValueType = 'String'
      Width = 121
      Position.ColIndex = 3
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxTreeList1cxTreeListColumn5: TcxTreeListColumn
      Caption.Text = #20107#20214#39033#32534#30721
      DataBinding.ValueType = 'String'
      Width = 154
      Position.ColIndex = 4
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxTreeList1cxTreeListColumn6: TcxTreeListColumn
      Caption.Text = #36890#36947'ID'
      DataBinding.ValueType = 'String'
      Position.ColIndex = 5
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxTreeList1cxTreeListColumn8: TcxTreeListColumn
      Caption.Text = #19978#20256#26102#38388
      DataBinding.ValueType = 'String'
      Width = 112
      Position.ColIndex = 7
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 560
    Top = 112
    object N1: TMenuItem
      Caption = #21024#38500#21015#34920#20013#25152#26377#22810#23186#20307#20107#20214#20449#24687
      OnClick = N1Click
    end
  end
end
