object frmInfo: TfrmInfo
  Left = 258
  Top = 208
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #28857#25773#20449#24687#21015#34920
  ClientHeight = 402
  ClientWidth = 723
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 723
    Height = 402
    Align = alClient
    TabOrder = 0
    object cxTreeList1: TcxTreeList
      Left = 1
      Top = 1
      Width = 721
      Height = 359
      Align = alClient
      Bands = <
        item
        end>
      BufferedPaint = False
      OptionsData.Editing = False
      OptionsData.Deleting = False
      OptionsView.GridLines = tlglBoth
      OptionsView.ShowRoot = False
      TabOrder = 0
      OnCustomDrawCell = cxTreeList1CustomDrawCell
      object cxTreeList1cxTreeListColumn1: TcxTreeListColumn
        Visible = False
        Caption.Text = 'ID'
        DataBinding.ValueType = 'String'
        Width = 92
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
        SortOrder = soAscending
      end
      object cxTreeList1cxTreeListColumn2: TcxTreeListColumn
        Caption.Text = #20449#24687#31867#22411
        DataBinding.ValueType = 'String'
        Width = 73
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object cxTreeList1cxTreeListColumn3: TcxTreeListColumn
        Caption.Text = #20449#24687#20869#23481
        DataBinding.ValueType = 'String'
        Width = 286
        Position.ColIndex = 2
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object cxTreeList1cxTreeListColumn4: TcxTreeListColumn
        Caption.Text = #39044#35745#21457#36865#26102#38388
        DataBinding.ValueType = 'String'
        Width = 90
        Position.ColIndex = 3
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object cxTreeList1cxTreeListColumn5: TcxTreeListColumn
        Caption.Text = #22791#27880
        DataBinding.ValueType = 'String'
        Width = 124
        Position.ColIndex = 4
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object cxTreeList1cxTreeListColumn6: TcxTreeListColumn
        Caption.Text = #20449#24687#29366#24577
        DataBinding.ValueType = 'String'
        Width = 138
        Position.ColIndex = 5
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 360
      Width = 721
      Height = 41
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 16382438
      TabOrder = 1
      object btnAdd: TRzBitBtn
        Left = 16
        Top = 8
        Width = 59
        Caption = #26032#22686
        HotTrack = True
        TabOrder = 0
        OnClick = btnAddClick
        ImageIndex = 17
        Images = Mainf.ImageList1
      end
      object btnEdit: TRzBitBtn
        Left = 95
        Top = 8
        Width = 59
        Caption = #20462#25913
        HotTrack = True
        TabOrder = 1
        OnClick = btnEditClick
        ImageIndex = 18
        Images = Mainf.ImageList1
      end
      object btnDel: TRzBitBtn
        Left = 174
        Top = 8
        Width = 59
        Caption = #21024#38500
        HotTrack = True
        TabOrder = 2
        OnClick = btnDelClick
        ImageIndex = 19
        Images = Mainf.ImageList1
      end
      object btnClose: TRzBitBtn
        Left = 644
        Top = 8
        Width = 62
        Caption = #20851#38381
        HotTrack = True
        TabOrder = 3
        OnClick = btnCloseClick
        ImageIndex = 20
        Images = Mainf.ImageList1
      end
    end
  end
end
