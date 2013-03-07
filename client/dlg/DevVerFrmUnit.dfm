object DevExtendVerFrm: TDevExtendVerFrm
  Left = 449
  Top = 304
  Width = 517
  Height = 270
  Caption = 'DevExtendVerFrm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cxList: TcxTreeList
    Left = 0
    Top = 0
    Width = 509
    Height = 243
    Align = alClient
    Bands = <
      item
        Caption.AlignHorz = taCenter
      end>
    BufferedPaint = True
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    OptionsData.Deleting = False
    OptionsView.GridLines = tlglBoth
    OptionsView.ShowRoot = False
    ParentFont = False
    StateImages = Mainf.ImageList1
    TabOrder = 0
    object ColDevName: TcxTreeListColumn
      Caption.Text = #35774#22791#21517
      DataBinding.ValueType = 'String'
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object ColDevState: TcxTreeListColumn
      Caption.Text = #29366#24577
      DataBinding.ValueType = 'String'
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object ColDevVer: TcxTreeListColumn
      Caption.Text = #29256#26412
      DataBinding.ValueType = 'String'
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
  end
end
