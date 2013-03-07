inherited frmQuerySetCarRunState: TfrmQuerySetCarRunState
  Left = 165
  Top = 167
  Width = 1134
  Caption = #26597#35810#36710#36742#37325#36733#36816#34892#35745#21010
  PixelsPerInch = 96
  TextHeight = 13
  inherited RzPanel1: TRzPanel
    Width = 1126
    inherited RzPanel2: TRzPanel
      Width = 168
      inherited pnlSelGroupName: TRzPanel
        Width = 168
      end
      inherited TreeView1: TTreeView
        Width = 168
      end
    end
    inherited cxSplitter1: TcxSplitter
      Left = 168
    end
    inherited RzPanel4: TRzPanel
      Left = 176
      Width = 950
      inherited RzPanel5: TRzPanel
        Width = 950
        Height = 64
        inherited RzLabel1: TRzLabel
          Top = 10
        end
        inherited RzLabel2: TRzLabel
          Left = 165
          Top = 10
          Width = 63
          Caption = #22987#21457#26102#38388#65306' '
        end
        inherited RzLabel3: TRzLabel
          Left = 165
          Top = 39
          Width = 66
          Caption = #21040#36798#26102#38388#65306'  '
          Font.Style = []
        end
        inherited cbxCarNo: TRzComboBox
          Top = 6
        end
        inherited RzDateTimePicker1: TRzDateTimePicker
          Left = 230
          Top = 6
        end
        inherited RzDateTimePicker2: TRzDateTimePicker
          Left = 311
          Top = 6
        end
        inherited RzDateTimePicker3: TRzDateTimePicker
          Left = 230
          Top = 35
        end
        inherited RzDateTimePicker4: TRzDateTimePicker
          Left = 311
          Top = 35
        end
        inherited btnQuery: TRzBitBtn
          Left = 407
          Top = 4
        end
        inherited RzBitBtn2: TRzBitBtn
          Left = 495
          Top = 4
        end
        inherited RzBitBtn3: TRzBitBtn
          Left = 407
          Top = 33
          Width = 67
        end
      end
      inherited RzPanel6: TRzPanel
        Width = 950
        inherited lblTotalCount: TLabel
          Left = 864
        end
      end
      inherited RzPanel7: TRzPanel
        Top = 64
        Width = 950
        Height = 350
        inherited cxTreeList1: TcxTreeList
          Width = 950
          Height = 350
          PopupMenu = PopupMenu1
          object cxTreeList1cxTreeListColumn1: TcxTreeListColumn
            Caption.Text = 'ID'
            DataBinding.ValueType = 'String'
            Width = 28
            Position.ColIndex = 4
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
          object cxTreeList1cxTreeListColumn11: TcxTreeListColumn
            Caption.Text = #24207#21495
            DataBinding.ValueType = 'String'
            Width = 32
            Position.ColIndex = 5
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
          object cxTreeList1cxTreeListColumn12: TcxTreeListColumn
            Caption.Text = #36710#29260#21495
            DataBinding.ValueType = 'String'
            Width = 60
            Position.ColIndex = 6
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
          object cxTreeList1cxTreeListColumn13: TcxTreeListColumn
            Caption.Text = #35774#22791#21495
            DataBinding.ValueType = 'String'
            Width = 78
            Position.ColIndex = 7
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
          object cxTreeList1cxTreeListColumn14: TcxTreeListColumn
            Caption.Text = #25152#22312#20998#32452
            DataBinding.ValueType = 'String'
            Width = 96
            Position.ColIndex = 10
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
          object cxTreeList1cxTreeListColumn2: TcxTreeListColumn
            Caption.Text = #22987#21457#26102#38388
            DataBinding.ValueType = 'String'
            Width = 104
            Position.ColIndex = 11
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
          object cxTreeList1cxTreeListColumn3: TcxTreeListColumn
            Caption.Text = #21040#36798#26102#38388
            DataBinding.ValueType = 'String'
            Width = 104
            Position.ColIndex = 13
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
          object cxTreeList1cxTreeListColumn4: TcxTreeListColumn
            Caption.Text = #22987#21457#22320
            DataBinding.ValueType = 'String'
            Width = 110
            Position.ColIndex = 14
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
          object cxTreeList1cxTreeListColumn5: TcxTreeListColumn
            Caption.Text = #30446#30340#22320
            DataBinding.ValueType = 'String'
            Width = 110
            Position.ColIndex = 15
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
          object cxTreeList1cxTreeListColumn6: TcxTreeListColumn
            Caption.Text = #22791#27880
            DataBinding.ValueType = 'String'
            Width = 110
            Position.ColIndex = 16
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
          object cxTreeList1cxTreeListColumn7: TcxTreeListColumn
            Caption.Text = #26368#21518#20462#25913#20154
            DataBinding.ValueType = 'String'
            Width = 68
            Position.ColIndex = 17
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
          object cxTreeList1cxTreeListColumn8: TcxTreeListColumn
            Caption.Text = #26368#21518#20462#25913#26102#38388
            DataBinding.ValueType = 'String'
            Width = 118
            Position.ColIndex = 18
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
          object cxTreeList1cxTreeListColumn9: TcxTreeListColumn
            Caption.Text = #21019#24314#20154
            DataBinding.ValueType = 'String'
            Width = 46
            Position.ColIndex = 19
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
          object cxTreeList1cxTreeListColumn10: TcxTreeListColumn
            Caption.Text = #21019#24314#26102#38388
            DataBinding.ValueType = 'String'
            Width = 118
            Position.ColIndex = 20
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
        end
      end
    end
  end
  object PopupMenu1: TPopupMenu [1]
    Left = 560
    Top = 190
    object N1: TMenuItem
      Caption = #20462#25913'(&E)'
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #21024#38500'(&D)'
      OnClick = N2Click
    end
  end
end
