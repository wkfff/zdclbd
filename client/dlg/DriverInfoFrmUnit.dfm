object DriverInfoFrm: TDriverInfoFrm
  Left = 178
  Top = 95
  Width = 1010
  Height = 601
  Caption = #21496#26426#20449#24687#26597#30475
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1002
    Height = 535
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 182
      Height = 535
      ActivePage = TabSheet1
      Align = alLeft
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = #36710#36742
        object TreeView1: TTreeView
          Left = 0
          Top = 0
          Width = 174
          Height = 507
          Align = alClient
          Indent = 19
          ReadOnly = True
          RowSelect = True
          TabOrder = 0
          OnClick = TreeView1Click
        end
      end
    end
    object PageControl2: TPageControl
      Left = 190
      Top = 0
      Width = 812
      Height = 535
      ActivePage = TabSheet2
      Align = alClient
      TabOrder = 1
      object TabSheet2: TTabSheet
        Caption = #21496#26426#20449#24687
        object DriverList: TcxTreeList
          Left = 0
          Top = 73
          Width = 804
          Height = 434
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
          TabOrder = 0
          OnClick = DriverListClick
          object DriverNO: TcxTreeListColumn
            Caption.Text = #21496#26426#32534#21495
            DataBinding.ValueType = 'String'
            Options.Editing = False
            Position.ColIndex = 0
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
          object Name: TcxTreeListColumn
            Caption.Text = #22995#21517
            DataBinding.ValueType = 'String'
            MinWidth = 50
            Options.Editing = False
            Position.ColIndex = 1
            Position.RowIndex = 0
            Position.BandIndex = 0
            SortOrder = soAscending
          end
          object CarNO: TcxTreeListColumn
            Caption.Text = #36710#29260#21495
            DataBinding.ValueType = 'String'
            Options.Editing = False
            Width = 120
            Position.ColIndex = 2
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
          object TEL: TcxTreeListColumn
            Caption.Text = #30005#35805
            DataBinding.ValueType = 'String'
            Width = 150
            Position.ColIndex = 3
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
          object IdentityCard: TcxTreeListColumn
            Visible = False
            Caption.Text = #36523#20221#35777#21495
            DataBinding.ValueType = 'String'
            Width = 143
            Position.ColIndex = 6
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
          object Address: TcxTreeListColumn
            Visible = False
            Caption.Text = #22320#22336
            DataBinding.ValueType = 'String'
            Width = 267
            Position.ColIndex = 4
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
          object isMain: TcxTreeListColumn
            Visible = False
            Caption.Text = #20027'/'#21103
            DataBinding.ValueType = 'String'
            Position.ColIndex = 3
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
          object id: TcxTreeListColumn
            Visible = False
            Caption.Text = #32534#21495
            DataBinding.ValueType = 'String'
            Position.ColIndex = 5
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
          object CarID: TcxTreeListColumn
            Visible = False
            Caption.Text = #36710#36742#32534#21495
            DataBinding.ValueType = 'String'
            Position.ColIndex = 5
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
          object DevID: TcxTreeListColumn
            Visible = False
            Caption.Text = #36710#26426#32534#21495
            DataBinding.ValueType = 'String'
            Position.ColIndex = 4
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
          object GroupID: TcxTreeListColumn
            Visible = False
            Caption.Text = #32452#21495
            DataBinding.ValueType = 'String'
            Position.ColIndex = 4
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
        end
        object Panel6: TPanel
          Left = 0
          Top = 0
          Width = 804
          Height = 73
          Align = alTop
          BevelInner = bvLowered
          BevelOuter = bvNone
          TabOrder = 1
          object Label1: TLabel
            Left = 32
            Top = 18
            Width = 65
            Height = 17
            AutoSize = False
            Caption = #36710#29260#21495#30721#65306
          end
          object Label2: TLabel
            Left = 240
            Top = 20
            Width = 65
            Height = 13
            AutoSize = False
            Caption = #21496#26426#22995#21517#65306
          end
          object Label6: TLabel
            Left = 254
            Top = 48
            Width = 8
            Height = 16
            Font.Charset = ANSI_CHARSET
            Font.Color = clRed
            Font.Height = -16
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object Label5: TLabel
            Left = 192
            Top = 50
            Width = 52
            Height = 13
            Caption = #24403#21069#36710#38431
          end
          object Label4: TLabel
            Left = 95
            Top = 48
            Width = 8
            Height = 16
            Font.Charset = ANSI_CHARSET
            Font.Color = clRed
            Font.Height = -16
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object Label3: TLabel
            Left = 33
            Top = 50
            Width = 52
            Height = 13
            Caption = #21496#26426#24635#25968
          end
          object ComboB_Cph: TComboBox
            Left = 96
            Top = 16
            Width = 101
            Height = 21
            ItemHeight = 13
            Sorted = True
            TabOrder = 0
            Text = 'ComboB_Cph'
            OnChange = ComboB_CphChange
          end
          object ComboB_SimNum: TComboBox
            Left = 304
            Top = 16
            Width = 128
            Height = 21
            ItemHeight = 13
            Sorted = True
            TabOrder = 1
            Text = 'ComboB_SimNum'
            OnChange = ComboB_SimNumChange
          end
          object BitBtnPrint: TBitBtn
            Left = 584
            Top = 18
            Width = 81
            Height = 25
            Caption = #23548#20986
            TabOrder = 2
            OnClick = BitBtnPrintClick
          end
          object BitBtn3: TBitBtn
            Left = 673
            Top = 18
            Width = 88
            Height = 25
            Cancel = True
            Caption = #36864#20986
            TabOrder = 3
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
    object cxSplitter1: TcxSplitter
      Left = 182
      Top = 0
      Width = 8
      Height = 535
      HotZoneClassName = 'TcxSimpleStyle'
      HotZone.SizePercent = 31
      Control = PageControl1
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 535
    Width = 1002
    Height = 39
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Label7: TLabel
      Left = 200
      Top = 16
      Width = 52
      Height = 13
      Caption = #21496#26426#22995#21517
    end
    object Label8: TLabel
      Left = 392
      Top = 16
      Width = 52
      Height = 13
      Caption = #30005#35805#21495#30721
    end
    object BitBtn1: TBitBtn
      Left = 719
      Top = 8
      Width = 75
      Height = 24
      Caption = #20462#25913
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 895
      Top = 7
      Width = 75
      Height = 25
      Caption = #20445#23384
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object Edit1: TEdit
      Left = 256
      Top = 11
      Width = 121
      Height = 21
      Color = clMenu
      TabOrder = 2
    end
    object Edit2: TEdit
      Left = 456
      Top = 11
      Width = 121
      Height = 21
      Color = clMenu
      TabOrder = 3
    end
    object BitBtn4: TBitBtn
      Left = 809
      Top = 7
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 4
      OnClick = BitBtn4Click
    end
  end
end
