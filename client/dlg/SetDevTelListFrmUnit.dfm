object SetDevTelListFrm: TSetDevTelListFrm
  Left = 363
  Top = 259
  BorderStyle = bsDialog
  Caption = #35774#32622#30005#35805#26412
  ClientHeight = 338
  ClientWidth = 475
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel111: TPanel
    Left = 0
    Top = 0
    Width = 475
    Height = 338
    Align = alClient
    Caption = 'Panel111'
    Color = 16382438
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 43
      Width = 473
      Height = 262
      Align = alClient
      BevelInner = bvLowered
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 0
      object cxDevTelList: TcxTreeList
        Left = 1
        Top = 1
        Width = 471
        Height = 260
        Align = alClient
        Bands = <
          item
            Caption.AlignHorz = taCenter
            Caption.Text = #36710#26426#30005#35805#26412
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
        PopupMenu = PopupMenu1
        TabOrder = 0
        object Tel_Id: TcxTreeListColumn
          Caption.Text = #24207#21495
          DataBinding.ValueType = 'Integer'
          Options.Editing = False
          Width = 61
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
          SortOrder = soAscending
        end
        object Tel_No: TcxTreeListColumn
          Caption.Text = #30005#35805#21495#30721
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Width = 105
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object Tel_Name: TcxTreeListColumn
          Caption.Text = #30005#35805#25317#26377#20154
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Width = 94
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object Tel_Type: TcxTreeListColumn
          Caption.Text = #30005#35805#31867#22411
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Width = 184
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object Telid: TcxTreeListColumn
          Visible = False
          Caption.Text = #30005#35805'ID'
          DataBinding.ValueType = 'String'
          Position.ColIndex = 4
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 473
      Height = 42
      Align = alTop
      BevelInner = bvSpace
      BevelOuter = bvLowered
      Caption = #35774#32622#30005#35805#26412
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = True
      ParentFont = False
      TabOrder = 1
      object Label1: TLabel
        Left = 8
        Top = 25
        Width = 65
        Height = 13
        Caption = #36710#26426#36710#36742#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = 16512
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object EditCarNO: TEdit
        Left = 72
        Top = 19
        Width = 105
        Height = 21
        Font.Charset = GB2312_CHARSET
        Font.Color = 16512
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = 'EditCarNO'
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 305
      Width = 473
      Height = 32
      Align = alBottom
      BevelInner = bvLowered
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 2
      object BitBtnOk: TBitBtn
        Left = 289
        Top = 4
        Width = 84
        Height = 25
        Caption = #30830#23450
        TabOrder = 0
        OnClick = BitBtn1Click
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
      object BitBtnCancel: TBitBtn
        Left = 372
        Top = 4
        Width = 84
        Height = 25
        Cancel = True
        Caption = #21462#28040
        ModalResult = 2
        TabOrder = 1
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333000033338833333333333333333F333333333333
          0000333911833333983333333388F333333F3333000033391118333911833333
          38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
          911118111118333338F3338F833338F3000033333911111111833333338F3338
          3333F8330000333333911111183333333338F333333F83330000333333311111
          8333333333338F3333383333000033333339111183333333333338F333833333
          00003333339111118333333333333833338F3333000033333911181118333333
          33338333338F333300003333911183911183333333383338F338F33300003333
          9118333911183333338F33838F338F33000033333913333391113333338FF833
          38F338F300003333333333333919333333388333338FFF830000333333333333
          3333333333333333333888330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
      object BitBtn1: TBitBtn
        Left = 3
        Top = 4
        Width = 65
        Height = 25
        Action = AddTel
        Caption = #22686#21152
        TabOrder = 2
      end
      object BitBtn2: TBitBtn
        Left = 67
        Top = 4
        Width = 65
        Height = 25
        Action = ModifyTel
        Caption = #20462#25913
        TabOrder = 3
      end
      object BitBtn3: TBitBtn
        Left = 131
        Top = 4
        Width = 65
        Height = 25
        Action = DelTel
        Caption = #21024#38500
        TabOrder = 4
      end
      object BitBtn4: TBitBtn
        Left = 195
        Top = 4
        Width = 65
        Height = 25
        Action = ClrTel
        Caption = #28165#38500
        TabOrder = 5
        Visible = False
      end
    end
  end
  object ActionList1: TActionList
    Left = 440
    Top = 8
    object AddTel: TAction
      Caption = #22686#21152#19968#20010#30005#35805#20449#24687
      OnExecute = AddTelExecute
    end
    object ModifyTel: TAction
      Caption = #20462#25913#30005#35805#20449#24687
      OnExecute = ModifyTelExecute
    end
    object DelTel: TAction
      Caption = #21024#38500#36873#25321#30340#30005#35805#20449#24687
      OnExecute = DelTelExecute
    end
    object ClrTel: TAction
      Caption = #28165#38500#30005#35805#26412
      OnExecute = ClrTelExecute
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 408
    Top = 8
    object N1: TMenuItem
      Action = AddTel
    end
    object N2: TMenuItem
      Action = ModifyTel
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object N3: TMenuItem
      Action = DelTel
    end
    object N4: TMenuItem
      Action = ClrTel
    end
  end
end
