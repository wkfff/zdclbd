object frmSrvRunInfo: TfrmSrvRunInfo
  Left = 345
  Top = 235
  Width = 928
  Height = 480
  Caption = #24179#21488#26381#21153#22120#36816#34892#29366#24577
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
  OnCreate = FormCreate
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
    BufferedPaint = False
    OptionsCustomizing.BandVertSizing = False
    OptionsCustomizing.ColumnVertSizing = False
    OptionsData.Editing = False
    OptionsData.Deleting = False
    OptionsView.GridLines = tlglBoth
    OptionsView.ShowRoot = False
    StateImages = Mainf.ImageList1
    TabOrder = 0
    object cxTreeList1cxTreeListColumn1: TcxTreeListColumn
      Visible = False
      Caption.Text = #26381#21153#22120#31867#22411'ID'
      DataBinding.ValueType = 'String'
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxTreeList1cxTreeListColumn2: TcxTreeListColumn
      Caption.Text = #26381#21153#21517
      DataBinding.ValueType = 'String'
      Width = 176
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxTreeList1cxTreeListColumn3: TcxTreeListColumn
      Caption.Text = #26381#21153#36816#34892#26102#38388'( '#31186' )'
      DataBinding.ValueType = 'String'
      Width = 144
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxTreeList1cxTreeListColumn4: TcxTreeListColumn
      Caption.Text = #26381#21153#36816#34892#29366#24577
      DataBinding.ValueType = 'String'
      Position.ColIndex = 3
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxTreeList1cxTreeListColumn5: TcxTreeListColumn
      Caption.Text = #31995#32479'CPU'#21344#29992#29575'( % )'
      DataBinding.ValueType = 'String'
      Width = 119
      Position.ColIndex = 4
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxTreeList1cxTreeListColumn6: TcxTreeListColumn
      Caption.Text = #31995#32479#20869#23384#22823#23567'( K )'
      DataBinding.ValueType = 'String'
      Width = 110
      Position.ColIndex = 5
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxTreeList1cxTreeListColumn7: TcxTreeListColumn
      Caption.Text = #31995#32479#20351#29992#20869#23384'( K )'
      DataBinding.ValueType = 'String'
      Width = 109
      Position.ColIndex = 6
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object cxTreeList1cxTreeListColumn8: TcxTreeListColumn
      Caption.Text = #31995#32479#20869#23384#20351#29992#29575'( % )'
      DataBinding.ValueType = 'String'
      Width = 119
      Position.ColIndex = 7
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
  end
end
