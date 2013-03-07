object frmDriverInfo: TfrmDriverInfo
  Left = 309
  Top = 427
  Width = 905
  Height = 227
  Caption = #39550#39542#21592#36523#20221#20449#24687#37319#38598#19978#25253#21015#34920
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
    Width = 897
    Height = 193
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
    PopupMenu = PopupMenu1
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
    object cxTreeList1cxTreeListColumn2: TcxTreeListColumn
      Caption.Text = #39550#39542#21592#22995#21517
      DataBinding.ValueType = 'String'
      Options.Editing = False
      Width = 125
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxTreeList1cxTreeListColumn3: TcxTreeListColumn
      Caption.Text = #20174#19994#36164#26684#35777#32534#30721
      DataBinding.ValueType = 'String'
      Options.Editing = False
      Width = 159
      Position.ColIndex = 4
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxTreeList1cxTreeListColumn4: TcxTreeListColumn
      Caption.Text = #21457#35777#26426#26500#21517#31216
      DataBinding.ValueType = 'String'
      Options.Editing = False
      Width = 338
      Position.ColIndex = 5
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxTreeList1cxTreeListColumn5: TcxTreeListColumn
      Caption.Text = #39550#39542#21592#36523#20221#35777#32534#30721
      DataBinding.ValueType = 'String'
      Options.Editing = False
      Width = 153
      Position.ColIndex = 3
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxTreeList1cxTreeListColumn6: TcxTreeListColumn
      Caption.Text = #19978#25253#36710#36742
      DataBinding.ValueType = 'String'
      Options.Editing = False
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 248
    Top = 64
    object N1: TMenuItem
      Caption = #21024#38500#25152#26377#19978#25253#20449#24687
      OnClick = N1Click
    end
  end
end
