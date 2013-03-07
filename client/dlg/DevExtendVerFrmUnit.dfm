object DevExtendVerFrm: TDevExtendVerFrm
  Left = 449
  Top = 304
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #36710#26426#21450#22806#35774#29256#26412
  ClientHeight = 273
  ClientWidth = 400
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cxList: TcxTreeList
    Left = 0
    Top = 41
    Width = 400
    Height = 232
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
    OptionsData.Editing = False
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
      Width = 192
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 400
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 12
      Width = 52
      Height = 13
      Caption = #36710#29260#21495#65306
    end
    object EditCarNo: TEdit
      Left = 64
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'EditCarNo'
    end
  end
end
