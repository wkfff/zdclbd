object QueryPictureListFrm: TQueryPictureListFrm
  Left = 257
  Top = 279
  Width = 928
  Height = 198
  Caption = #29031#29255#26816#32034#21015#34920
  Color = clBtnFace
  DragKind = dkDock
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 920
    Height = 164
    Align = alClient
    BevelOuter = bvNone
    Caption = #183
    TabOrder = 0
    object Panel2: TPanel
      Left = 814
      Top = 0
      Width = 106
      Height = 164
      Align = alRight
      Color = 16382438
      TabOrder = 0
      object BitBtn_List100: TBitBtn
        Left = 10
        Top = 80
        Width = 90
        Height = 25
        Caption = #21482#21015#26368#36817'10'#26465
        TabOrder = 0
        OnClick = BitBtn_List100Click
      end
      object BitBtn_Clr: TBitBtn
        Left = 10
        Top = 40
        Width = 90
        Height = 25
        Caption = #20840#37096#28165#31354
        TabOrder = 1
        OnClick = BitBtn_ClrClick
        Glyph.Data = {
          66010000424D6601000000000000760000002800000014000000140000000100
          040000000000F0000000C40E0000C40E00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777700007777777777777777777700007777777777777777777700007777
          77777777777777770000777778888888880007770000777777888888809B9077
          000077777777788809B9B90700007777777777700B9B9B07000077777777770F
          F0B9B90700007777777770F8FF0B907700007777777708FF8FF0077700007777
          7770FF8FF8F0777700007777770B0FF8FF0777770000777770BBB0FF80777777
          000077777BBB0B0F07777777000077777BB0BBB077777777000077777B0BBB07
          7777777700007777777777777777777700007777777777777777777700007777
          77777777777777770000}
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 814
      Height = 164
      Align = alClient
      TabOrder = 1
      object EventListView: TListView
        Left = 1
        Top = 1
        Width = 658
        Height = 162
        Columns = <
          item
            Caption = 'ID'
            Width = 100
          end
          item
            Caption = #36710#29260#21495
            Width = 80
          end
          item
            Caption = #31867#22411
            Width = 80
          end
          item
            Caption = #25991#20214#32534#21495
            Width = 100
          end
          item
            Caption = #29031#29255'/'#38899#39057#29983#25104#26102#38388
            Width = 149
          end
          item
            Caption = #31867#22411'ID'
            Width = 0
          end
          item
            Caption = #26816#32034#21407#22240
            Width = 200
          end
          item
            Caption = #25509#25910#26102#38388
            Width = 149
          end>
        GridLines = True
        ReadOnly = True
        RowSelect = True
        ParentShowHint = False
        PopupMenu = PopupMenu1
        ShowHint = True
        TabOrder = 0
        ViewStyle = vsReport
        Visible = False
        OnColumnClick = EventListViewColumnClick
      end
      object cxTreeList1: TcxTreeList
        Left = 1
        Top = 1
        Width = 812
        Height = 162
        Align = alClient
        Bands = <
          item
          end>
        BufferedPaint = False
        OptionsData.Editing = False
        OptionsData.Deleting = False
        OptionsView.GridLines = tlglBoth
        OptionsView.ShowRoot = False
        PopupMenu = PopupMenu1
        TabOrder = 1
        object cxTreeList1cxTreeListColumn1: TcxTreeListColumn
          Caption.Text = #35774#22791#21495
          DataBinding.ValueType = 'String'
          Width = 91
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeList1cxTreeListColumn2: TcxTreeListColumn
          Caption.Text = #36710#29260#21495
          DataBinding.ValueType = 'String'
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeList1cxTreeListColumn3: TcxTreeListColumn
          Visible = False
          Caption.Text = #31867#22411
          DataBinding.ValueType = 'String'
          Width = 67
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeList1cxTreeListColumn7: TcxTreeListColumn
          Visible = False
          Caption.Text = #25293#25668#20301#32622
          DataBinding.ValueType = 'String'
          Width = 142
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeList1cxTreeListColumn4: TcxTreeListColumn
          Caption.Text = #29031#29255#24320#22987#26102#38388
          DataBinding.ValueType = 'String'
          Width = 131
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeList1cxTreeListColumn5: TcxTreeListColumn
          Caption.Text = #26816#32034#21407#22240
          DataBinding.ValueType = 'String'
          Width = 125
          Position.ColIndex = 5
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeList1cxTreeListColumn6: TcxTreeListColumn
          Caption.Text = #25509#25910#26102#38388
          DataBinding.ValueType = 'String'
          Width = 133
          Position.ColIndex = 6
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeList1cxTreeListColumn8: TcxTreeListColumn
          Visible = False
          Caption.Text = 'MediaType'
          DataBinding.ValueType = 'Integer'
          Position.ColIndex = 7
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeList1cxTreeListColumn9: TcxTreeListColumn
          Visible = False
          Caption.Text = #36890#36947
          DataBinding.ValueType = 'Integer'
          Position.ColIndex = 4
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeList1cxTreeListColumn10: TcxTreeListColumn
          Visible = False
          Caption.Text = 'Reason'
          DataBinding.ValueType = 'Integer'
          Position.ColIndex = 9
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeList1cxTreeListColumn11: TcxTreeListColumn
          Caption.Text = #36890#36947
          DataBinding.ValueType = 'String'
          Position.ColIndex = 9
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeList1cxTreeListColumn12: TcxTreeListColumn
          Visible = False
          Caption.Text = 'MediaId'
          DataBinding.ValueType = 'Variant'
          Position.ColIndex = 11
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 272
    Top = 56
    object N1: TMenuItem
      Caption = #19978#20256#25351#23450#26102#38388#27573#30340#22810#23186#20307#25991#20214
      ImageIndex = 11
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #19978#20256#21333#26465#22810#23186#20307#25991#20214
      OnClick = N2Click
    end
  end
end
