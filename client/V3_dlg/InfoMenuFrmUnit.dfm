inherited InfoMenuFrm: TInfoMenuFrm
  Left = 427
  Top = 184
  Caption = #20449#24687#28857#25773#33756#21333
  ClientHeight = 457
  ClientWidth = 582
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 582
    Height = 457
    inherited Panel2: TPanel
      Top = 419
      Width = 582
      inherited BitBtn1: TBitBtn
        Left = 392
        Width = 76
        OnClick = BitBtn1Click
      end
      inherited BitBtn2: TBitBtn
        Left = 489
        Width = 76
      end
      object BitBtn4: TBitBtn
        Left = 11
        Top = 8
        Width = 53
        Height = 25
        Caption = #22686#21152
        TabOrder = 2
        OnClick = BitBtn4Click
      end
      object BitBtn5: TBitBtn
        Left = 64
        Top = 8
        Width = 53
        Height = 25
        Caption = #20462#25913
        TabOrder = 3
        OnClick = BitBtn5Click
      end
      object BitBtn6: TBitBtn
        Left = 117
        Top = 8
        Width = 53
        Height = 25
        Caption = #21024#38500
        TabOrder = 4
        OnClick = BitBtn6Click
      end
    end
    inherited Panel3: TPanel
      Left = 448
      Width = 134
      Height = 419
      inherited ListView1: TListView
        Width = 132
        Height = 360
        OnClick = ListView1Click
      end
      inherited Panel4: TPanel
        Width = 132
      end
      inherited Panel6: TPanel
        Top = 390
        Width = 132
        inherited BitBtnSel: TBitBtn
          Width = 64
        end
        inherited BitBtn3: TBitBtn
          Left = 66
          Width = 64
        end
      end
    end
    inherited Panel5: TPanel
      Width = 448
      Height = 419
      inherited Panel7: TPanel
        Width = 448
        Caption = #20449#24687#28857#25773#33756#21333
      end
      inherited PanProgress: TPanel
        Top = 396
        Width = 448
        inherited ProgressBar1: TProgressBar
          Width = 444
        end
      end
      object cxDevEventList: TcxTreeList
        Left = 0
        Top = 49
        Width = 448
        Height = 347
        Align = alClient
        Bands = <
          item
            Caption.AlignHorz = taCenter
            Caption.Text = #36710#26426#20449#24687#33756#21333#21015#34920
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
