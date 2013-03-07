object set_CarTrack: Tset_CarTrack
  Left = 486
  Top = 150
  Width = 745
  Height = 525
  Caption = #36710#36742#34892#39542#36712#36857#35774#32622
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 737
    Height = 491
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 165
      Top = 0
      Height = 491
      Beveled = True
    end
    object TreeView1: TTreeView
      Left = 0
      Top = 0
      Width = 165
      Height = 491
      Align = alLeft
      Indent = 19
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      OnClick = TreeView1Click
    end
    object Panel2: TPanel
      Left = 168
      Top = 0
      Width = 569
      Height = 491
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel2'
      TabOrder = 1
      object Splitter2: TSplitter
        Left = 0
        Top = 321
        Width = 569
        Height = 4
        Cursor = crVSplit
        Align = alBottom
        Beveled = True
      end
      object Panel3: TPanel
        Left = 0
        Top = 325
        Width = 569
        Height = 102
        Align = alBottom
        BevelInner = bvLowered
        BevelOuter = bvNone
        TabOrder = 0
        object Label1: TLabel
          Left = 24
          Top = 12
          Width = 39
          Height = 13
          Caption = #36710#29260#21495
        end
        object Label2: TLabel
          Left = 24
          Top = 34
          Width = 39
          Height = 13
          Caption = #35774#22791#21517
        end
        object Label3: TLabel
          Left = 24
          Top = 56
          Width = 47
          Height = 13
          Caption = 'SIM'#21345#21495
        end
        object Label4: TLabel
          Left = 217
          Top = 13
          Width = 40
          Height = 13
          Caption = #35774#22791'ID'
        end
        object Label5: TLabel
          Left = 217
          Top = 35
          Width = 26
          Height = 13
          Caption = #21496#26426
        end
        object Label6: TLabel
          Left = 217
          Top = 56
          Width = 52
          Height = 13
          Caption = #36710#36742#22791#27880
        end
        object Label8: TLabel
          Left = 147
          Top = 81
          Width = 78
          Height = 13
          Caption = #36712#36857#32447#39068#33394#65306
        end
        object Shape_TrackColor: TShape
          Left = 221
          Top = 77
          Width = 47
          Height = 21
          Cursor = crHandPoint
          Hint = #28857#20987#35774#32622#39068#33394
          Brush.Color = clBtnFace
          ParentShowHint = False
          ShowHint = True
          OnMouseDown = Shape_TrackColorMouseDown
        end
        object Label10: TLabel
          Left = 280
          Top = 80
          Width = 99
          Height = 13
          Caption = '<- '#28857#20987#35774#32622#39068#33394
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Edit_CarNo: TEdit
          Left = 78
          Top = 5
          Width = 99
          Height = 21
          Color = clScrollBar
          ReadOnly = True
          TabOrder = 0
          Text = 'Edit_CarNo'
        end
        object Edit_Disp: TEdit
          Left = 78
          Top = 27
          Width = 99
          Height = 21
          Color = clScrollBar
          ReadOnly = True
          TabOrder = 1
          Text = 'Edit_Disp'
        end
        object Edit_SimNo: TEdit
          Left = 78
          Top = 49
          Width = 99
          Height = 21
          Color = clScrollBar
          ReadOnly = True
          TabOrder = 2
          Text = 'Edit_SimNo'
        end
        object Edit_DevID: TEdit
          Left = 274
          Top = 5
          Width = 110
          Height = 21
          Color = clScrollBar
          ReadOnly = True
          TabOrder = 3
          Text = 'Edit_DevID'
        end
        object Edit_GrpName: TEdit
          Left = 274
          Top = 27
          Width = 110
          Height = 21
          Color = clScrollBar
          ReadOnly = True
          TabOrder = 4
          Text = 'Edit_GrpName'
        end
        object Edit_CarMemo: TEdit
          Left = 274
          Top = 49
          Width = 166
          Height = 21
          Color = clScrollBar
          ReadOnly = True
          TabOrder = 5
          Text = 'Edit_CarMemo'
        end
        object CheckBox_ShowTrack: TCheckBox
          Left = 25
          Top = 79
          Width = 97
          Height = 17
          Caption = #26174#31034#34892#39542#36712#36857
          TabOrder = 6
          OnClick = CheckBox_ShowTrackClick
        end
      end
      object DevList: TcxTreeList
        Left = 0
        Top = 0
        Width = 569
        Height = 321
        Align = alClient
        Bands = <
          item
            Caption.AlignHorz = taCenter
            Caption.Text = #22522#26412#20449#24687
          end>
        BufferedPaint = True
        OptionsData.Editing = False
        OptionsData.Deleting = False
        OptionsView.GridLines = tlglBoth
        OptionsView.ShowRoot = False
        TabOrder = 1
        OnClick = DevListClick
        OnFocusedNodeChanged = DevListFocusedNodeChanged
        object Dev_Id: TcxTreeListColumn
          Visible = False
          Caption.Text = #35774#22791'ID'
          DataBinding.ValueType = 'String'
          MinWidth = 50
          Options.Editing = False
          Width = 76
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
          SortOrder = soAscending
        end
        object Dev_CarNo: TcxTreeListColumn
          Caption.Text = #36710#29260#21495
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Width = 88
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object Dev_Name: TcxTreeListColumn
          Caption.Text = #35774#22791#21517#31216
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Width = 120
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object Dev_SimNo: TcxTreeListColumn
          Caption.Text = 'SIM'#21345#21495
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Width = 119
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object Dev_ConnType: TcxTreeListColumn
          Caption.Text = #21496#26426
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Width = 82
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object Dev_Memo: TcxTreeListColumn
          Caption.Text = #36710#36742#22791#27880
          DataBinding.ValueType = 'String'
          Width = 119
          Position.ColIndex = 4
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 427
        Width = 569
        Height = 64
        Align = alBottom
        BevelInner = bvLowered
        BevelOuter = bvNone
        TabOrder = 2
        object GroupBox1: TGroupBox
          Left = 24
          Top = 27
          Width = 394
          Height = 30
          TabOrder = 0
          object Label9: TLabel
            Left = 3
            Top = 12
            Width = 144
            Height = 13
            Caption = #25152#26377#36710#36742'  '#36712#36857#32447#39068#33394#65306
          end
          object Shape_all: TShape
            Left = 223
            Top = 8
            Width = 28
            Height = 18
            Cursor = crHandPoint
            Hint = #28857#20987#35774#32622#39068#33394
            Brush.Color = clRed
            ParentShowHint = False
            ShowHint = True
            OnMouseDown = Shape_allMouseDown
          end
          object RadioButton4: TRadioButton
            Left = 149
            Top = 10
            Width = 72
            Height = 17
            Caption = #20840#35774#32622#20026
            TabOrder = 0
            OnClick = RadioButton4Click
          end
          object RadioButton5: TRadioButton
            Left = 317
            Top = 9
            Width = 64
            Height = 17
            Caption = #33258#23450#20041
            Checked = True
            TabOrder = 1
            TabStop = True
          end
        end
        object GroupBox2: TGroupBox
          Left = 24
          Top = 2
          Width = 394
          Height = 32
          TabOrder = 1
          object Label7: TLabel
            Left = 4
            Top = 13
            Width = 143
            Height = 13
            Caption = #25152#26377#36710#36742#34892#39542#36712#36857#35774#32622#65306
          end
          object RadioButton1: TRadioButton
            Left = 149
            Top = 12
            Width = 63
            Height = 17
            Caption = #37117#26174#31034
            TabOrder = 0
            OnClick = RadioButton1Click
          end
          object RadioButton2: TRadioButton
            Left = 227
            Top = 12
            Width = 76
            Height = 17
            Caption = #37117#19981#26174#31034
            TabOrder = 1
            OnClick = RadioButton2Click
          end
          object RadioButton3: TRadioButton
            Left = 317
            Top = 12
            Width = 69
            Height = 17
            Caption = #33258#23450#20041
            Checked = True
            TabOrder = 2
            TabStop = True
          end
        end
        object Panel5: TPanel
          Left = 462
          Top = 1
          Width = 106
          Height = 62
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 2
          object BitBtn3: TBitBtn
            Left = 7
            Top = 20
            Width = 98
            Height = 25
            Cancel = True
            Caption = #36820#22238
            TabOrder = 0
            OnClick = BitBtn3Click
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777700777777
              77777770E07777777777770EE0777777777700EEE0000000000070EEE0888077
              777770EEE0888077777770EEE0888077777770EEE0888077777770EEE0888077
              707770EEE0888077007770EEE0888070000070EEE0888077007770EEE0888077
              707770EE08888077777770E08888807777777000000000777777}
          end
        end
      end
    end
  end
end
