inherited frmQueryDevUploadMileage: TfrmQueryDevUploadMileage
  Left = 110
  Width = 1206
  Caption = #26597#35810#36710#36742#34892#39542#37324#31243#21450#27833#32791
  PixelsPerInch = 96
  TextHeight = 13
  inherited RzPanel1: TRzPanel
    Width = 1198
    inherited RzPanel4: TRzPanel
      Width = 1000
      inherited RzPanel5: TRzPanel
        Width = 1000
        Height = 62
        inherited RzLabel1: TRzLabel
          Left = 19
          Top = 10
          Width = 51
          Caption = #36710#29260#21495#65306' '
        end
        inherited RzLabel2: TRzLabel
          Left = 196
          Top = 10
          Width = 63
          Caption = #26597#35810#26102#38388#65306' '
        end
        inherited RzLabel3: TRzLabel
          Left = 233
          Top = 40
        end
        object RzLabel4: TRzLabel [3]
          Left = 7
          Top = 37
          Width = 63
          Height = 13
          Caption = #26597#35810#26041#24335#65306' '
          Transparent = True
        end
        inherited cbxCarNo: TRzComboBox
          Left = 70
          Top = 6
        end
        inherited RzDateTimePicker1: TRzDateTimePicker
          Left = 259
          Top = 6
        end
        inherited RzDateTimePicker2: TRzDateTimePicker
          Left = 340
          Top = 6
        end
        inherited RzDateTimePicker3: TRzDateTimePicker
          Left = 259
          Top = 33
        end
        inherited RzDateTimePicker4: TRzDateTimePicker
          Left = 340
          Top = 33
        end
        inherited btnQuery: TRzBitBtn
          Left = 418
          Top = 4
        end
        inherited RzBitBtn2: TRzBitBtn
          Left = 495
          Top = 4
        end
        inherited RzBitBtn3: TRzBitBtn
          Left = 418
          Top = 32
          Width = 67
        end
        object cbxQueryFlag: TRzComboBox
          Left = 70
          Top = 33
          Width = 95
          Height = 21
          ItemHeight = 13
          TabOrder = 8
          Text = #24635#35745
          OnChange = cbxQueryFlagChange
          Items.Strings = (
            #24635#35745
            #25353#26102
            #25353#22825
            #25353#26376)
          ItemIndex = 0
        end
      end
      inherited RzPanel6: TRzPanel
        Width = 1000
        inherited lblTotalCount: TLabel
          Left = 914
        end
      end
      inherited RzPanel7: TRzPanel
        Top = 62
        Width = 1000
        Height = 352
        inherited cxTreeList1: TcxTreeList
          Width = 1000
          Height = 352
          Bands = <
            item
              Caption.AlignHorz = taCenter
              Caption.Text = #36710#36742#20449#24687
            end
            item
              Caption.AlignHorz = taCenter
              Caption.Text = #34892#39542#37324#31243'('#20844#37324')'
            end
            item
              Caption.AlignHorz = taCenter
              Caption.Text = #27833#32791'('#21319')'
            end>
          OptionsView.Bands = True
          object cxTreeList1cxTreeListColumn5: TcxTreeListColumn
            Caption.Text = #24207#21495
            DataBinding.ValueType = 'String'
            Options.Editing = False
            Width = 33
            Position.ColIndex = 0
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
          object cxTreeList1cxTreeListColumn1: TcxTreeListColumn
            Caption.Text = 'GPS'#35774#22791#21495
            DataBinding.ValueType = 'String'
            Options.Editing = False
            Width = 75
            Position.ColIndex = 1
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
          object cxTreeList1cxTreeListColumn2: TcxTreeListColumn
            Caption.Text = #36710#29260#21495
            DataBinding.ValueType = 'String'
            Options.Editing = False
            Width = 74
            Position.ColIndex = 3
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
          object cxTreeList1cxTreeListColumn3: TcxTreeListColumn
            Caption.Text = #24635#37324#31243
            DataBinding.ValueType = 'String'
            Options.Editing = False
            Width = 65
            Position.ColIndex = 10
            Position.RowIndex = 0
            Position.BandIndex = 1
          end
          object cxTreeList1cxTreeListColumn4: TcxTreeListColumn
            Caption.Text = #26102#38388
            DataBinding.ValueType = 'String'
            Options.Editing = False
            Width = 249
            Position.ColIndex = 14
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
          object cxTreeList1cxTreeListColumn6: TcxTreeListColumn
            Caption.Text = #31354#39542#37324#31243
            DataBinding.ValueType = 'String'
            Width = 65
            Position.ColIndex = 8
            Position.RowIndex = 0
            Position.BandIndex = 1
          end
          object cxTreeList1cxTreeListColumn7: TcxTreeListColumn
            Caption.Text = #37325#36733#37324#31243
            DataBinding.ValueType = 'String'
            Width = 65
            Position.ColIndex = 9
            Position.RowIndex = 0
            Position.BandIndex = 1
          end
          object cxTreeList1cxTreeListColumn8: TcxTreeListColumn
            Caption.Text = #31354#39542#27833#32791
            DataBinding.ValueType = 'String'
            Width = 65
            Position.ColIndex = 11
            Position.RowIndex = 0
            Position.BandIndex = 2
          end
          object cxTreeList1cxTreeListColumn9: TcxTreeListColumn
            Caption.Text = #37325#36733#27833#32791
            DataBinding.ValueType = 'String'
            Width = 65
            Position.ColIndex = 12
            Position.RowIndex = 0
            Position.BandIndex = 2
          end
          object cxTreeList1cxTreeListColumn10: TcxTreeListColumn
            Caption.Text = #24635#27833#32791
            DataBinding.ValueType = 'String'
            Width = 65
            Position.ColIndex = 13
            Position.RowIndex = 0
            Position.BandIndex = 2
          end
          object cxTreeList1cxTreeListColumn11: TcxTreeListColumn
            Caption.Text = #25152#22312#20998#32452
            DataBinding.ValueType = 'String'
            Position.ColIndex = 7
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
        end
      end
    end
  end
end
