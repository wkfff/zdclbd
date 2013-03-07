object QueryPicsByTimeFrm: TQueryPicsByTimeFrm
  Left = 639
  Top = 321
  Width = 639
  Height = 263
  BorderIcons = [biSystemMenu]
  Caption = #29031#29255
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 631
    Height = 229
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Panel2: TPanel
      Left = 402
      Top = 0
      Width = 229
      Height = 188
      Align = alRight
      BevelOuter = bvLowered
      TabOrder = 0
      object Image1: TImage
        Left = 1
        Top = 1
        Width = 227
        Height = 186
        Align = alClient
        AutoSize = True
        Center = True
        Proportional = True
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 188
      Width = 631
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object BitBtn1: TBitBtn
        Left = 248
        Top = 8
        Width = 75
        Height = 25
        Caption = #30830#23450
        TabOrder = 0
        Kind = bkOK
      end
    end
    object cxPicList: TcxTreeList
      Left = 0
      Top = 0
      Width = 402
      Height = 188
      Align = alClient
      Bands = <
        item
          Caption.AlignHorz = taCenter
          Caption.Text = #22522#26412#20449#24687
        end>
      BufferedPaint = True
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      OptionsData.Editing = False
      OptionsData.Deleting = False
      OptionsView.GridLines = tlglBoth
      OptionsView.ShowRoot = False
      ParentFont = False
      StateImages = Mainf.ImageList1
      TabOrder = 2
      OnClick = cxPicListClick
      object cxDeviceListcxTreeListColumn1: TcxTreeListColumn
        Caption.Text = #36710#29260#21495
        DataBinding.ValueType = 'String'
        Width = 66
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object cxDeviceListcxTreeListColumn2: TcxTreeListColumn
        Caption.Text = 'GPS'#26102#38388
        DataBinding.ValueType = 'String'
        Width = 149
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 0
        SortOrder = soDescending
      end
      object cxPicListcxTreeListColumn1: TcxTreeListColumn
        Caption.Text = #19978#20256#26102#38388
        DataBinding.ValueType = 'String'
        Width = 149
        Position.ColIndex = 4
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
    end
  end
end
