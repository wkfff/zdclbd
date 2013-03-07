object PictureAlarmFrm: TPictureAlarmFrm
  Left = 482
  Top = 453
  Width = 329
  Height = 209
  Caption = #32039#24613#25253#35686#29031#29255
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
  object PanelPic: TPanel
    Left = 0
    Top = 0
    Width = 242
    Height = 182
    Align = alClient
    Caption = #27491#22312#36733#20837#29031#29255'...'
    TabOrder = 0
    object Image1: TImage
      Left = 1
      Top = 1
      Width = 240
      Height = 180
      Align = alClient
      AutoSize = True
      Center = True
      Proportional = True
    end
  end
  object Panel2: TPanel
    Left = 250
    Top = 0
    Width = 71
    Height = 182
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    object LabeledEditCarNO: TLabeledEdit
      Left = 15
      Top = 26
      Width = 125
      Height = 21
      Color = clBtnFace
      EditLabel.Width = 46
      EditLabel.Height = 13
      EditLabel.Caption = #36710#29260#21495':'
      ReadOnly = True
      TabOrder = 0
    end
    object LabeledEditTime: TLabeledEdit
      Left = 15
      Top = 111
      Width = 125
      Height = 21
      Color = clBtnFace
      EditLabel.Width = 59
      EditLabel.Height = 13
      EditLabel.Caption = #25293#29031#26102#38388':'
      ReadOnly = True
      TabOrder = 1
    end
    object LabeledEditReason: TLabeledEdit
      Left = 15
      Top = 154
      Width = 125
      Height = 21
      Color = clBtnFace
      EditLabel.Width = 59
      EditLabel.Height = 13
      EditLabel.Caption = #25293#29031#21407#22240':'
      ReadOnly = True
      TabOrder = 2
    end
    object LabeledEditPostion: TLabeledEdit
      Left = 15
      Top = 68
      Width = 125
      Height = 21
      Color = clBtnFace
      EditLabel.Width = 59
      EditLabel.Height = 13
      EditLabel.Caption = #25293#29031#20301#32622':'
      ReadOnly = True
      TabOrder = 3
    end
    object cxPicList: TcxTreeList
      Left = 0
      Top = 0
      Width = 71
      Height = 182
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
      OptionsSelection.CellSelect = False
      OptionsView.GridLines = tlglBoth
      OptionsView.ShowRoot = False
      ParentFont = False
      PopupMenu = PopupMenu1
      StateImages = Mainf.ImageList1
      TabOrder = 4
      OnClick = cxPicListClick
      OnKeyUp = cxPicListKeyUp
      object cxCol_CarNo: TcxTreeListColumn
        Caption.Text = #36710#29260#21495
        DataBinding.ValueType = 'String'
        Width = 66
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object cxCol_PicTime: TcxTreeListColumn
        Caption.Text = #26102#38388
        DataBinding.ValueType = 'String'
        Width = 112
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 0
        SortOrder = soDescending
      end
      object cxCol_PicReason: TcxTreeListColumn
        Visible = False
        Caption.Text = #25293#29031#21407#22240
        DataBinding.ValueType = 'String'
        Width = 89
        Position.ColIndex = 2
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object cxCol_PicPosition: TcxTreeListColumn
        Caption.Text = #25293#29031#20301#32622
        DataBinding.ValueType = 'String'
        Width = 60
        Position.ColIndex = 3
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object cxCol_PicFileName: TcxTreeListColumn
        Caption.Text = #25991#20214#21517
        DataBinding.ValueType = 'String'
        Position.ColIndex = 4
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 242
    Top = 0
    Width = 8
    Height = 182
    HotZoneClassName = 'TcxSimpleStyle'
    HotZone.SizePercent = 50
    AlignSplitter = salRight
    Control = Panel2
  end
  object PopupMenu1: TPopupMenu
    Left = 282
    Top = 56
    object N3: TMenuItem
      Caption = #28165#38500#24403#21069#19968#26465
      OnClick = N3Click
    end
    object N1: TMenuItem
      Caption = #28165#38500#25152#26377#26174#31034
      OnClick = N1Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N2: TMenuItem
      Caption = #21482#26174#31034#26368#36817#19968#26465
      OnClick = N2Click
    end
  end
end
