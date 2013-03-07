object OverSpeedLookFrm: TOverSpeedLookFrm
  Left = 70
  Top = 77
  Width = 888
  Height = 637
  Caption = #36229#36895#35760#24405
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel5: TPanel
    Left = 0
    Top = 569
    Width = 880
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 1
    object BitBtn2: TBitBtn
      Left = 608
      Top = 8
      Width = 75
      Height = 25
      Caption = #23548#20986
      TabOrder = 0
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 720
      Top = 8
      Width = 75
      Height = 25
      Caption = #36864#20986
      TabOrder = 1
      OnClick = BitBtn3Click
    end
  end
  object Panel6: TPanel
    Left = 0
    Top = 41
    Width = 880
    Height = 528
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel6'
    TabOrder = 2
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 185
      Height = 528
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object TreeView1: TTreeView
        Left = 0
        Top = 0
        Width = 185
        Height = 528
        Align = alClient
        BevelOuter = bvNone
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        Indent = 19
        ParentFont = False
        ReadOnly = True
        SortType = stText
        TabOrder = 0
        OnClick = TreeView1Click
      end
    end
    object Panel1: TPanel
      Left = 193
      Top = 0
      Width = 687
      Height = 528
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 687
        Height = 69
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object Label1: TLabel
          Left = 298
          Top = 14
          Width = 39
          Height = 13
          Caption = #26102#38388#65306
        end
        object Label3: TLabel
          Left = 24
          Top = 16
          Width = 52
          Height = 13
          Caption = #36710#29260#21495#30721
        end
        object DateTimePicker1: TDateTimePicker
          Left = 334
          Top = 8
          Width = 94
          Height = 21
          Date = 39623.501083831020000000
          Time = 39623.501083831020000000
          TabOrder = 0
        end
        object DateTimePicker2: TDateTimePicker
          Left = 430
          Top = 8
          Width = 78
          Height = 21
          Date = 39623.501155995370000000
          Time = 39623.501155995370000000
          Kind = dtkTime
          TabOrder = 1
        end
        object BitBtn1: TBitBtn
          Left = 528
          Top = 8
          Width = 65
          Height = 25
          Caption = #26597#35810
          TabOrder = 2
          OnClick = BitBtn1Click
        end
        object ComboBox2: TComboBox
          Left = 90
          Top = 10
          Width = 111
          Height = 21
          ItemHeight = 13
          TabOrder = 3
        end
        object DateTimePicker3: TDateTimePicker
          Left = 336
          Top = 39
          Width = 93
          Height = 21
          Date = 39628.702865486110000000
          Time = 39628.702865486110000000
          TabOrder = 4
        end
        object DateTimePicker4: TDateTimePicker
          Left = 430
          Top = 39
          Width = 80
          Height = 21
          Date = 39628.702961516200000000
          Time = 39628.702961516200000000
          Kind = dtkTime
          TabOrder = 5
        end
        object CheckBox1: TCheckBox
          Left = 608
          Top = 40
          Width = 65
          Height = 17
          Caption = #20840#37096
          Checked = True
          State = cbChecked
          TabOrder = 6
          OnClick = CheckBox1Click
        end
      end
      object OverSpeedList: TcxTreeList
        Left = 0
        Top = 69
        Width = 687
        Height = 459
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
        object carname: TcxTreeListColumn
          Caption.Text = #36710#29260#21495#30721
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Width = 133
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object Speed: TcxTreeListColumn
          Caption.Text = #36895#24230
          DataBinding.ValueType = 'String'
          MinWidth = 50
          Options.Editing = False
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
          SortOrder = soAscending
        end
        object Time: TcxTreeListColumn
          Caption.Text = #36229#36895#26102#38388
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Width = 214
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object longitude: TcxTreeListColumn
          Caption.Text = #32463#24230
          DataBinding.ValueType = 'String'
          Width = 149
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object latitude: TcxTreeListColumn
          Caption.Text = #32428#24230
          DataBinding.ValueType = 'String'
          Width = 187
          Position.ColIndex = 4
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
      end
    end
    object cxSplitter1: TcxSplitter
      Left = 185
      Top = 0
      Width = 8
      Height = 528
      Cursor = crHSplit
      HotZoneClassName = 'TcxSimpleStyle'
      HotZone.SizePercent = 31
      AutoSnap = True
      MinSize = 22
      ResizeUpdate = True
      Control = Panel4
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 880
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    Caption = #36229#36895#26597#35810
    Color = clGradientActiveCaption
    TabOrder = 0
  end
end
