object SendDelAdInfoForm: TSendDelAdInfoForm
  Left = 154
  Top = 98
  Width = 870
  Height = 640
  Caption = #21024#38500#24191#21578#36873#25321
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 862
    Height = 41
    Align = alTop
    Caption = #21024#38500#24191#21578#36873#25321
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -29
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 862
    Height = 531
    Align = alClient
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 627
      Top = 1
      Width = 5
      Height = 529
      Align = alRight
    end
    object Panel5: TPanel
      Left = 632
      Top = 1
      Width = 229
      Height = 529
      Align = alRight
      Caption = 'Panel5'
      TabOrder = 0
      object DevList: TcxTreeList
        Left = 1
        Top = 1
        Width = 227
        Height = 499
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
        object cxCarNO: TcxTreeListColumn
          Caption.Text = #36710#29260#21495
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Width = 105
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
          SortOrder = soDescending
        end
        object cxDevID: TcxTreeListColumn
          Caption.Text = #36710#26426'ID'#21495
          DataBinding.ValueType = 'String'
          MinWidth = 50
          Options.Editing = False
          Width = 99
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
      end
      object Panel7: TPanel
        Left = 1
        Top = 500
        Width = 227
        Height = 28
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object BitBtnDelSelectDev: TBitBtn
          Left = 40
          Top = 2
          Width = 137
          Height = 25
          Caption = #21024#38500#36873#20013#30340#36710#36742
          TabOrder = 0
          OnClick = BitBtnDelSelectDevClick
        end
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 626
      Height = 529
      Align = alClient
      Caption = 'Panel4'
      TabOrder = 1
      object AdInfoList: TcxTreeList
        Left = 1
        Top = 1
        Width = 624
        Height = 499
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
        OnClick = AdInfoListClick
        object cxID: TcxTreeListColumn
          Caption.Text = #33258#21160#32534#21495
          DataBinding.ValueType = 'Integer'
          Options.Editing = False
          Width = 79
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
          SortOrder = soDescending
        end
        object cxadMemo: TcxTreeListColumn
          Caption.Text = #24191#21578#20869#23481
          DataBinding.ValueType = 'String'
          MinWidth = 50
          Options.Editing = False
          Width = 301
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxbeginTime: TcxTreeListColumn
          Caption.Text = #25237#25918#26102#38388
          DataBinding.ValueType = 'DateTime'
          Options.Editing = False
          Width = 99
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxendTime: TcxTreeListColumn
          Caption.Text = #21040#26399#26102#38388
          DataBinding.ValueType = 'DateTime'
          Width = 124
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxcustomerName: TcxTreeListColumn
          Caption.Text = #23458#25143#21517#31216
          DataBinding.ValueType = 'String'
          Width = 140
          Position.ColIndex = 4
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxlinkName: TcxTreeListColumn
          Caption.Text = #32852#31995#20154
          DataBinding.ValueType = 'String'
          Width = 75
          Position.ColIndex = 5
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTel: TcxTreeListColumn
          Caption.Text = #32852#31995#30005#35805
          DataBinding.ValueType = 'String'
          Position.ColIndex = 6
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxMemo: TcxTreeListColumn
          Caption.Text = #22791#27880
          DataBinding.ValueType = 'String'
          Position.ColIndex = 7
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
      end
      object Panel6: TPanel
        Left = 1
        Top = 500
        Width = 624
        Height = 28
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object Label1: TLabel
          Left = 8
          Top = 8
          Width = 85
          Height = 13
          Caption = #24403#21069#36873#25321#24191#21578':'
        end
        object EditCurrentAdInfo: TEdit
          Left = 96
          Top = 4
          Width = 521
          Height = 21
          Color = clBtnFace
          TabOrder = 0
          Text = 'EditCurrentAdInfo'
        end
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 572
    Width = 862
    Height = 41
    Align = alBottom
    TabOrder = 2
    object BitBtnQueryOverAd: TBitBtn
      Left = 12
      Top = 8
      Width = 121
      Height = 25
      Caption = #26597#35810#25152#26377#36807#26399#24191#21578
      TabOrder = 0
      OnClick = BitBtnQueryOverAdClick
    end
    object BitBtnQueryNotOverAd: TBitBtn
      Left = 132
      Top = 8
      Width = 145
      Height = 25
      Caption = #26597#35810#25152#26377#27809#26377#36807#26399#24191#21578
      TabOrder = 1
    end
    object BitBtnQueryAllAd: TBitBtn
      Left = 276
      Top = 8
      Width = 89
      Height = 25
      Caption = #26597#35810#25152#26377#24191#21578
      TabOrder = 2
      OnClick = BitBtnQueryAllAdClick
    end
    object BitBtnSend: TBitBtn
      Left = 696
      Top = 8
      Width = 75
      Height = 25
      Caption = #21457#36865
      TabOrder = 3
      OnClick = BitBtnSendClick
    end
    object BitBtnClose: TBitBtn
      Left = 770
      Top = 8
      Width = 75
      Height = 25
      Caption = #20851#38381'&C'
      TabOrder = 4
      Kind = bkClose
    end
  end
end
