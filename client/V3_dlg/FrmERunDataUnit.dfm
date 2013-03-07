object frmERunData: TfrmERunData
  Left = 341
  Top = 377
  Width = 779
  Height = 213
  Caption = #30005#23376#36816#21333#19978#25253#21015#34920
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
    Width = 771
    Height = 179
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
      Width = 76
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxTreeList1cxTreeListColumn2: TcxTreeListColumn
      Caption.Text = #19978#20256#36710#36742
      DataBinding.ValueType = 'String'
      Options.Editing = False
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxTreeList1cxTreeListColumn3: TcxTreeListColumn
      Caption.Text = #30005#23376#36816#21333#20869#23481
      DataBinding.ValueType = 'String'
      Options.Editing = False
      Width = 385
      Position.ColIndex = 6
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 216
    Top = 64
    object N1: TMenuItem
      Caption = #21024#38500#25152#26377#19978#25253#30340#30005#23376#36816#21333
      OnClick = N1Click
    end
  end
end
