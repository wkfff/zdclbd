object PictureFrm: TPictureFrm
  Left = 253
  Top = 160
  Width = 1024
  Height = 400
  Caption = #29031#29255
  Color = 16382438
  DragKind = dkDock
  DragMode = dmAutomatic
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter2: TSplitter
    Left = 185
    Top = 0
    Width = 5
    Height = 366
  end
  object Panel4: TPanel
    Left = 190
    Top = 0
    Width = 826
    Height = 366
    Align = alClient
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 180
      Top = 0
      Width = 5
      Height = 366
    end
    object Panel5: TPanel
      Left = 0
      Top = 0
      Width = 180
      Height = 366
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'Panel1'
      ParentColor = True
      TabOrder = 0
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 180
        Height = 19
        Align = alTop
        Caption = #24050#25910#21462#29031#29255
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentColor = True
        ParentFont = False
        TabOrder = 0
      end
      object cxPicList: TcxTreeList
        Left = 0
        Top = 19
        Width = 180
        Height = 347
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
        StateImages = Mainf.ImageList1
        TabOrder = 1
        OnChange = cxPicListChange
        object cxDeviceListcxTreeListColumn1: TcxTreeListColumn
          Caption.Text = #36710#29260#21495
          DataBinding.ValueType = 'String'
          Width = 66
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxDeviceListcxTreeListColumn2: TcxTreeListColumn
          Caption.Text = 'GPS'#26102#38388
          DataBinding.ValueType = 'String'
          Width = 149
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
          SortOrder = soDescending
        end
        object cxDeviceListcxTreeListColumn3: TcxTreeListColumn
          Caption.Text = #25293#29031#21407#22240
          DataBinding.ValueType = 'String'
          Width = 89
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxDeviceListcxTreeListColumn4: TcxTreeListColumn
          Caption.Text = #25293#29031#20301#32622
          DataBinding.ValueType = 'String'
          Width = 60
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxPicListcxTreeListColumn1: TcxTreeListColumn
          Caption.Text = #25991#20214#21517
          DataBinding.ValueType = 'String'
          Position.ColIndex = 4
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxPicListcxTreeListColumn2: TcxTreeListColumn
          Caption.Text = #19978#20256#26102#38388
          DataBinding.ValueType = 'String'
          Width = 149
          Position.ColIndex = 5
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
      end
    end
    object Panel7: TPanel
      Left = 185
      Top = 0
      Width = 641
      Height = 366
      Align = alClient
      ParentColor = True
      TabOrder = 1
      object PanelButton: TPanel
        Left = 499
        Top = 1
        Width = 141
        Height = 364
        Align = alRight
        BevelInner = bvRaised
        BevelOuter = bvLowered
        ParentColor = True
        TabOrder = 0
        object Label1: TLabel
          Left = 2
          Top = 342
          Width = 137
          Height = 20
          Align = alBottom
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Panel8: TPanel
          Left = 2
          Top = 2
          Width = 137
          Height = 125
          Align = alTop
          BevelOuter = bvNone
          ParentColor = True
          TabOrder = 0
          object BitBtnPrev: TBitBtn
            Left = -1
            Top = 1
            Width = 136
            Height = 25
            Caption = #19978#19968#24352
            TabOrder = 3
            OnClick = BitBtnPrevClick
          end
          object BitBtnNext: TBitBtn
            Left = -1
            Top = 25
            Width = 136
            Height = 25
            Caption = #19979#19968#24352
            TabOrder = 4
            OnClick = BitBtnNextClick
          end
          object BitBtnReflash: TBitBtn
            Left = -1
            Top = 98
            Width = 136
            Height = 25
            Caption = #21047#26032
            TabOrder = 2
            Visible = False
            OnClick = BitBtnReflashClick
          end
          object BitBtnDel: TBitBtn
            Left = -1
            Top = 49
            Width = 136
            Height = 25
            Caption = #21024#38500
            TabOrder = 1
            OnClick = BitBtnDelClick
          end
          object BitBtnDelAll: TBitBtn
            Left = -1
            Top = 73
            Width = 136
            Height = 25
            Caption = #20840#37096#21024#38500
            TabOrder = 0
            OnClick = BitBtnDelAllClick
          end
        end
      end
      object PanelPictureInfo: TPanel
        Left = 359
        Top = 1
        Width = 140
        Height = 364
        Align = alRight
        ParentColor = True
        TabOrder = 1
        object LabeledEditCarNO: TLabeledEdit
          Left = -1
          Top = 18
          Width = 139
          Height = 21
          Color = clBtnFace
          EditLabel.Width = 46
          EditLabel.Height = 13
          EditLabel.Caption = #36710#29260#21495':'
          ReadOnly = True
          TabOrder = 0
        end
        object LabeledEditTime: TLabeledEdit
          Left = -1
          Top = 55
          Width = 139
          Height = 21
          Color = clBtnFace
          EditLabel.Width = 59
          EditLabel.Height = 13
          EditLabel.Caption = #25293#29031#26102#38388':'
          ReadOnly = True
          TabOrder = 1
        end
        object LabeledEditReason: TLabeledEdit
          Left = -1
          Top = 92
          Width = 139
          Height = 21
          Color = clBtnFace
          EditLabel.Width = 59
          EditLabel.Height = 13
          EditLabel.Caption = #25293#29031#21407#22240':'
          ReadOnly = True
          TabOrder = 2
        end
        object LabeledEditPostion: TLabeledEdit
          Left = -1
          Top = 129
          Width = 139
          Height = 21
          Color = clBtnFace
          EditLabel.Width = 59
          EditLabel.Height = 13
          EditLabel.Caption = #25293#29031#20301#32622':'
          ReadOnly = True
          TabOrder = 3
        end
      end
      object Panel10: TPanel
        Left = 1
        Top = 1
        Width = 358
        Height = 364
        Align = alClient
        ParentColor = True
        TabOrder = 2
        OnResize = Panel10Resize
        object Image1: TImage
          Left = 1
          Top = 1
          Width = 395
          Height = 16
          AutoSize = True
          Center = True
          Proportional = True
          Visible = False
        end
        object RzBorder1: TRzBorder
          Left = 320
          Top = 25
          Width = 37
          Height = 287
          BorderOuter = fsNone
          Align = alRight
        end
        object RzBorder3: TRzBorder
          Left = 1
          Top = 1
          Width = 356
          Height = 24
          BorderOuter = fsNone
          Align = alTop
        end
        object RzBorder4: TRzBorder
          Left = 1
          Top = 25
          Width = 37
          Height = 287
          BorderOuter = fsNone
          Align = alLeft
        end
        object Panel12: TPanel
          Left = 1
          Top = 360
          Width = 356
          Height = 3
          Align = alBottom
          ParentColor = True
          TabOrder = 0
          Visible = False
          OnResize = Panel12Resize
          object Edit1: TEdit
            Left = 1
            Top = 0
            Width = 145
            Height = 21
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 0
          end
        end
        object Image321: TImage32
          Left = 38
          Top = 25
          Width = 282
          Height = 287
          Align = alClient
          AutoSize = True
          Bitmap.ResamplerClassName = 'TNearestResampler'
          BitmapAlign = baCenter
          Color = 16773091
          ParentColor = False
          Scale = 1.000000000000000000
          ScaleMode = smStretch
          TabOrder = 1
        end
        object RzPanel1: TRzPanel
          Left = 1
          Top = 312
          Width = 356
          Height = 48
          Align = alBottom
          BorderOuter = fsNone
          TabOrder = 2
          Transparent = True
          object Panel13: TPanel
            Left = 0
            Top = 31
            Width = 356
            Height = 17
            Align = alBottom
            BevelOuter = bvLowered
            TabOrder = 0
            object Label2: TLabel
              Left = 1
              Top = 1
              Width = 26
              Height = 15
              Align = alLeft
              Caption = #24038#36716
              Color = 16051419
              ParentColor = False
            end
            object Label3: TLabel
              Left = 329
              Top = 1
              Width = 26
              Height = 15
              Align = alRight
              Caption = #21491#36716
              Color = 16051419
              ParentColor = False
            end
            object angle: TGaugeBar
              Left = 27
              Top = 1
              Width = 302
              Height = 15
              Align = alClient
              Color = 16051419
              Backgnd = bgPattern
              Max = 180
              Min = -180
              ShowHandleGrip = True
              Style = rbsMac
              Position = 0
              OnChange = angleChange
            end
          end
        end
      end
    end
  end
  object Panel9: TPanel
    Left = 0
    Top = 0
    Width = 185
    Height = 366
    Align = alLeft
    Caption = 'Panel9'
    ParentColor = True
    TabOrder = 1
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 183
      Height = 364
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel1'
      ParentColor = True
      TabOrder = 0
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 183
        Height = 17
        Align = alTop
        BevelOuter = bvNone
        Caption = #26410#25910#21462#29031#29255
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentColor = True
        ParentFont = False
        TabOrder = 0
      end
      object NotReceivePictureList: TListView
        Left = 0
        Top = 17
        Width = 183
        Height = 325
        Align = alClient
        Columns = <
          item
            Caption = 'ID'
            Width = 55
          end
          item
            Caption = #36710#29260#21495
            Width = 80
          end
          item
            Caption = #25509#25910#26102#38388
            Width = 149
          end>
        GridLines = True
        ReadOnly = True
        RowSelect = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        ViewStyle = vsReport
      end
      object Panel3: TPanel
        Left = 0
        Top = 342
        Width = 183
        Height = 22
        Align = alBottom
        ParentColor = True
        TabOrder = 2
        object ProgressBar1: TProgressBar
          Left = 1
          Top = 1
          Width = 124
          Height = 20
          Align = alClient
          TabOrder = 0
        end
        object Panel11: TPanel
          Left = 125
          Top = 1
          Width = 57
          Height = 20
          Align = alRight
          ParentColor = True
          TabOrder = 1
          object BitBtnReceive: TBitBtn
            Left = 0
            Top = -2
            Width = 57
            Height = 22
            Caption = #25910#21462
            TabOrder = 0
            OnClick = BitBtnReceiveClick
          end
          object BitBtnCancel: TBitBtn
            Left = -1
            Top = -2
            Width = 57
            Height = 22
            Caption = #21462#28040
            TabOrder = 1
            Visible = False
            OnClick = BitBtnCancelClick
          end
        end
      end
    end
  end
end
