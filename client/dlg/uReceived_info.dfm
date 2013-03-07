object Received_info: TReceived_info
  Left = 299
  Top = 321
  Width = 801
  Height = 206
  Caption = #20449#24687#25552#31034
  Color = clBtnFace
  DragKind = dkDock
  DragMode = dmAutomatic
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 692
    Top = 0
    Width = 101
    Height = 179
    Align = alRight
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 0
    object BitBtn_Clr: TBitBtn
      Left = 4
      Top = 40
      Width = 95
      Height = 25
      Caption = #20840#37096#28165#31354
      TabOrder = 0
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
    object BitBtn_List100: TBitBtn
      Left = 4
      Top = 80
      Width = 95
      Height = 25
      Caption = #21482#21015#26368#36817'10'#26465
      TabOrder = 1
      OnClick = BitBtn_List100Click
    end
    object BitBtn1: TBitBtn
      Left = 4
      Top = 119
      Width = 95
      Height = 25
      Caption = #21047#26032
      TabOrder = 2
      OnClick = BitBtn1Click
    end
    object CheckBox1: TCheckBox
      Left = 16
      Top = 8
      Width = 97
      Height = 17
      Caption = #33258#21160#21047#26032
      TabOrder = 3
      OnClick = CheckBox1Click
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 692
    Height = 179
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #19981#22312#32447#36710#36742
      object cxNotOnLineList: TcxTreeList
        Left = 0
        Top = 0
        Width = 684
        Height = 144
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
        PopupMenu = Mainf.PopupMenu2
        StateImages = Mainf.ImageList1
        TabOrder = 0
        OnClick = cxNotOnLineListClick
        OnDblClick = cxNotOnLineListDblClick
        OnFocusedNodeChanged = cxNotOnLineListFocusedNodeChanged
        object cxTreeListColumn1: TcxTreeListColumn
          Caption.Text = #36710#29260#21495
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Width = 105
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumn2: TcxTreeListColumn
          Caption.Text = #26102#38388
          DataBinding.ValueType = 'String'
          Width = 149
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
          SortOrder = soAscending
        end
        object cxNotOnLineListcxTreeListColumn2: TcxTreeListColumn
          Visible = False
          Caption.Text = #31867#22411
          DataBinding.ValueType = 'String'
          Position.ColIndex = 5
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumn3: TcxTreeListColumn
          Caption.Text = #20844#21496#21517#31216
          DataBinding.ValueType = 'String'
          Width = 150
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumn4: TcxTreeListColumn
          Caption.Text = #20844#21496#30005#35805
          DataBinding.ValueType = 'String'
          Width = 593
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxNotOnLineListcxTreeListColumn1: TcxTreeListColumn
          Visible = False
          DataBinding.ValueType = 'String'
          Position.ColIndex = 4
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #25925#38556#36710#36742
      ImageIndex = 1
      object Splitter1: TSplitter
        Left = 188
        Top = 0
        Width = 4
        Height = 151
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 188
        Height = 151
        Align = alLeft
        BevelOuter = bvNone
        Caption = 'Panel1'
        TabOrder = 0
        object TreeView1: TTreeView
          Left = 0
          Top = 0
          Width = 188
          Height = 151
          Align = alClient
          Color = 15792327
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          HideSelection = False
          Indent = 19
          ParentFont = False
          ParentShowHint = False
          PopupMenu = PopupMenu1
          ReadOnly = True
          RightClickSelect = True
          ShowHint = True
          TabOrder = 0
          OnChange = TreeView1Change
          OnClick = TreeView1Click
          OnContextPopup = TreeView1ContextPopup
        end
      end
      object Panel3: TPanel
        Left = 192
        Top = 0
        Width = 492
        Height = 151
        Align = alClient
        TabOrder = 1
        object ProgressBar1: TProgressBar
          Left = 1
          Top = 133
          Width = 490
          Height = 17
          Align = alBottom
          TabOrder = 0
          Visible = False
        end
        object cxInfoList: TcxTreeList
          Left = 1
          Top = 1
          Width = 490
          Height = 132
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
          PopupMenu = Mainf.PopupMenu2
          StateImages = Mainf.ImageList1
          TabOrder = 1
          OnClick = cxInfoListClick
          OnDblClick = cxInfoListDblClick
          OnFocusedNodeChanged = cxInfoListFocusedNodeChanged
          object cxCarNo: TcxTreeListColumn
            Caption.Text = #36710#29260#21495
            DataBinding.ValueType = 'String'
            Options.Editing = False
            Width = 105
            Position.ColIndex = 0
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
          object cxDateTime: TcxTreeListColumn
            Caption.Text = #26102#38388
            DataBinding.ValueType = 'String'
            Width = 149
            Position.ColIndex = 1
            Position.RowIndex = 0
            Position.BandIndex = 0
            SortOrder = soAscending
          end
          object cxType: TcxTreeListColumn
            Caption.Text = #31867#22411
            DataBinding.ValueType = 'String'
            Width = 150
            Position.ColIndex = 2
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
          object cxContent: TcxTreeListColumn
            Caption.Text = #20869#23481
            DataBinding.ValueType = 'String'
            Width = 593
            Position.ColIndex = 6
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
          object cxGroupName: TcxTreeListColumn
            Caption.Text = #20844#21496#21517#31216
            DataBinding.ValueType = 'String'
            Position.ColIndex = 3
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
          object cxGroupTel: TcxTreeListColumn
            Caption.Text = #20844#21496#30005#35805
            DataBinding.ValueType = 'String'
            Position.ColIndex = 4
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
          object cxATypeID: TcxTreeListColumn
            Visible = False
            DataBinding.ValueType = 'String'
            Position.ColIndex = 7
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
          object cxCount: TcxTreeListColumn
            Caption.Text = #25925#38556#25253#35686#27425#25968
            DataBinding.ValueType = 'String'
            Position.ColIndex = 5
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
        end
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 76
    Top = 80
    object N1: TMenuItem
      Caption = #35745#20215#22120#25925#38556
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = 'LED'#23631#25925#38556
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = 'TSM'#25925#38556
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #39030#28783#25925#38556
      OnClick = N4Click
    end
    object N5: TMenuItem
      Caption = #25152#26377#25925#38556
      Checked = True
      OnClick = N5Click
    end
  end
end
