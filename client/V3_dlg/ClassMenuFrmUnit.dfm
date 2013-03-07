inherited ClassMenuFrm: TClassMenuFrm
  Caption = #36710#26426#21608#36793#20449#24687#20998#31867#33756#21333
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited Panel2: TPanel
      inherited BitBtn1: TBitBtn
        Left = 299
        OnClick = BitBtn1Click
      end
      inherited BitBtn2: TBitBtn
        Left = 396
      end
      object BitBtn6: TBitBtn
        Left = 132
        Top = 8
        Width = 65
        Height = 25
        Caption = #21024#38500
        TabOrder = 2
        OnClick = BitBtn6Click
      end
      object BitBtn5: TBitBtn
        Left = 67
        Top = 8
        Width = 65
        Height = 25
        Caption = #20462#25913
        TabOrder = 3
        OnClick = BitBtn5Click
      end
      object BitBtn4: TBitBtn
        Left = 3
        Top = 8
        Width = 65
        Height = 25
        Caption = #22686#21152
        TabOrder = 4
        OnClick = BitBtn4Click
      end
    end
    inherited Panel5: TPanel
      inherited Panel7: TPanel
        Caption = #21608#36793#20449#24687#20998#31867#33756#21333
      end
      object cxDevEventList: TcxTreeList
        Left = 0
        Top = 49
        Width = 315
        Height = 263
        Align = alClient
        Bands = <
          item
            Caption.AlignHorz = taCenter
            Caption.Text = #36710#26426#21608#36793#20449#24687#20998#31867#33756#21333#21015#34920
            Width = 444
          end>
        BufferedPaint = True
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        OptionsData.Editing = False
        OptionsData.Deleting = False
        OptionsSelection.HideFocusRect = False
        OptionsView.Bands = True
        OptionsView.GridLines = tlglBoth
        OptionsView.ShowRoot = False
        ParentFont = False
        TabOrder = 2
        object Info_Id: TcxTreeListColumn
          Caption.Text = #24207#21495
          DataBinding.ValueType = 'Integer'
          Options.Editing = False
          Width = 49
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
          SortOrder = soAscending
        end
        object Info_No: TcxTreeListColumn
          Caption.Text = #20449#24687#31867#22411
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object Info_info: TcxTreeListColumn
          Caption.Text = #20449#24687#21517#31216
          DataBinding.ValueType = 'String'
          Width = 295
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object Infoid: TcxTreeListColumn
          Visible = False
          DataBinding.ValueType = 'String'
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
      end
    end
  end
end
