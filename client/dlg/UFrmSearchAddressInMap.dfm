object FrmSearchAddressInMap: TFrmSearchAddressInMap
  Left = 27
  Top = 408
  Width = 1045
  Height = 165
  Caption = #26631#31614#26597#35810
  Color = clBtnFace
  DragKind = dkDock
  DragMode = dmAutomatic
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDefault
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter2: TSplitter
    Left = 274
    Top = 0
    Height = 131
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 274
    Height = 131
    Align = alLeft
    BevelInner = bvLowered
    BevelOuter = bvNone
    Color = 16382438
    TabOrder = 0
    object Label2: TLabel
      Left = 13
      Top = 52
      Width = 65
      Height = 13
      Caption = #26597#25214#20869#23481#65306
    end
    object Label1: TLabel
      Left = 13
      Top = 24
      Width = 65
      Height = 13
      Caption = #26597#25214#26041#24335#65306
      Visible = False
    end
    object Edit_Address: TEdit
      Left = 77
      Top = 47
      Width = 176
      Height = 21
      MaxLength = 30
      TabOrder = 0
      Text = 'Edit_Address'
      OnKeyPress = Edit_AddressKeyPress
    end
    object BitBtnSearchInAllLayers: TBitBtn
      Left = 166
      Top = 86
      Width = 87
      Height = 25
      Caption = #26597#35810
      Default = True
      TabOrder = 1
      OnClick = BitBtnSearchInAllLayersClick
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        77777000000070000000007777777000000070FFFFFFF07777700000000070F7
        7777F07777000000000070F77777F07770007000000070F77780008700077000
        000070F7700FFF0000777000000070F708FFFF0807777000000070F80E000F07
        08777000000070F0EFEFEF0770777000000070F0F0000F077077700000007000
        EFEFFF0770777000000077780000000708777000000077770077777807777000
        0000777770077700777770000000777777800087777770000000777777777777
        777770000000}
    end
    object RBLocatePart: TRadioButton
      Left = 77
      Top = 22
      Width = 87
      Height = 17
      Caption = #27169#31946#26597#25214
      Checked = True
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      TabStop = True
      Visible = False
      OnClick = RBLocatePartClick
    end
    object RBLocateAll: TRadioButton
      Left = 180
      Top = 22
      Width = 77
      Height = 17
      Caption = #20840#23383#21305#37197
      TabOrder = 3
      Visible = False
      OnClick = RBLocateAllClick
    end
  end
  object Panel4: TPanel
    Left = 277
    Top = 0
    Width = 760
    Height = 131
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel4'
    TabOrder = 1
    object PanelSearchResult: TPanel
      Left = 0
      Top = 0
      Width = 760
      Height = 22
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = #12288#26597#35810#32467#26524#65306
      Color = 14741473
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label3: TLabel
        Left = 288
        Top = 6
        Width = 59
        Height = 13
        Caption = #35814#32454#22320#21517':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object EditAddrContent: TEdit
        Left = 353
        Top = 1
        Width = 160
        Height = 21
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentColor = True
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Text = 'EditAddrContent'
        Visible = False
      end
    end
    object ListViewSearchResult: TListView
      Left = 0
      Top = 22
      Width = 760
      Height = 109
      Hint = #21452#20987#65292#22312#22320#22270#20013#26597#30475#20301#32622
      Align = alClient
      Columns = <
        item
          Caption = #24207#21495
          Width = 40
        end
        item
          Caption = #26631#31614#21517#31216
          Width = 300
        end
        item
          Caption = #32463#24230
          Width = 100
        end
        item
          Caption = #32428#24230
          Width = 100
        end>
      GridLines = True
      ReadOnly = True
      RowSelect = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      ViewStyle = vsReport
      OnDblClick = ListViewSearchResultDblClick
      OnSelectItem = ListViewSearchResultSelectItem
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 605
    Top = 56
    object N1: TMenuItem
      Caption = #20462#25913
    end
    object N2: TMenuItem
      Caption = #21024#38500
    end
  end
end
