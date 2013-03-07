object ReadDevTelListFrm: TReadDevTelListFrm
  Left = 187
  Top = 204
  BorderStyle = bsDialog
  Caption = #35835#21462#21040#36710#26426#23384#20648#30340#30005#35805#26412
  ClientHeight = 552
  ClientWidth = 807
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel111: TPanel
    Left = 0
    Top = 0
    Width = 807
    Height = 552
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel111'
    TabOrder = 0
    object Panel6: TPanel
      Left = 395
      Top = 46
      Width = 412
      Height = 506
      Align = alClient
      Caption = 'Panel6'
      TabOrder = 0
      object Panel2: TPanel
        Left = 1
        Top = 1
        Width = 410
        Height = 472
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object cxDevTelList: TcxTreeList
          Left = 0
          Top = 0
          Width = 410
          Height = 458
          Align = alClient
          Bands = <
            item
              Caption.Text = ' '#31995#32479#20013#30340#30005#35805#26412':'
              Width = 407
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
          Styles.BandHeader = cxStyle2
          TabOrder = 0
          object Tel_Id: TcxTreeListColumn
            Caption.Text = #24207#21495
            DataBinding.ValueType = 'Integer'
            Options.Editing = False
            Width = 50
            Position.ColIndex = 0
            Position.RowIndex = 0
            Position.BandIndex = 0
            SortOrder = soAscending
          end
          object Tel_No: TcxTreeListColumn
            Caption.Text = #30005#35805#21495#30721
            DataBinding.ValueType = 'String'
            Options.Editing = False
            Width = 103
            Position.ColIndex = 1
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
          object Tel_Name: TcxTreeListColumn
            Caption.Text = #30005#35805#25317#26377#20154
            DataBinding.ValueType = 'String'
            Options.Editing = False
            Width = 87
            Position.ColIndex = 2
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
          object Tel_Type: TcxTreeListColumn
            Caption.Text = #30005#35805#31867#22411
            DataBinding.ValueType = 'String'
            Options.Editing = False
            Width = 167
            Position.ColIndex = 3
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
        end
        object PanelProgress: TPanel
          Left = 0
          Top = 458
          Width = 410
          Height = 14
          Align = alBottom
          TabOrder = 1
          Visible = False
          object ProgressBar1: TProgressBar
            Left = 1
            Top = 1
            Width = 408
            Height = 12
            Align = alClient
            TabOrder = 0
          end
        end
      end
      object Panel1: TPanel
        Left = 1
        Top = 473
        Width = 410
        Height = 32
        Align = alBottom
        BevelInner = bvLowered
        BevelOuter = bvNone
        TabOrder = 1
        object BitBtnOk: TBitBtn
          Left = 254
          Top = 4
          Width = 74
          Height = 25
          Hint = #23558#30005#35805#26412#35774#32622#32473#36710#26426
          Caption = #35774#32622
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
          Left = 327
          Top = 4
          Width = 74
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
          Width = 59
          Height = 25
          Action = AddTel
          Caption = #22686#21152
          TabOrder = 2
        end
        object BitBtn2: TBitBtn
          Left = 61
          Top = 4
          Width = 59
          Height = 25
          Action = ModifyTel
          Caption = #20462#25913
          TabOrder = 3
        end
        object BitBtn3: TBitBtn
          Left = 119
          Top = 4
          Width = 59
          Height = 25
          Action = DelTel
          Caption = #21024#38500
          TabOrder = 4
        end
        object BitBtn4: TBitBtn
          Left = 177
          Top = 4
          Width = 59
          Height = 25
          Action = ClrTel
          Caption = #28165#38500
          TabOrder = 5
        end
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 807
      Height = 46
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = #35835#21462#21040#36710#26426#23384#20648#30340#30005#35805#26412
      Color = 12609027
      Font.Charset = GB2312_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object Label1: TLabel
        Left = 8
        Top = 25
        Width = 52
        Height = 13
        Caption = #36710#29260#21495#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object EditCarNO: TEdit
        Left = 55
        Top = 19
        Width = 105
        Height = 21
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = 'EditCarNO'
      end
    end
    object Panel5: TPanel
      Left = 0
      Top = 46
      Width = 360
      Height = 506
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'Panel5'
      TabOrder = 2
      object cxReadedList: TcxTreeList
        Left = 0
        Top = 0
        Width = 360
        Height = 506
        Align = alClient
        Bands = <
          item
            Caption.Text = ' '#35835#21462#21040#36710#26426#23384#20648#30340#30005#35805#26412':'
            Width = 431
          end>
        BufferedPaint = True
        Font.Charset = GB2312_CHARSET
        Font.Color = clPurple
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
        Styles.BandHeader = cxStyle1
        TabOrder = 0
        object cxTreeListColumn1: TcxTreeListColumn
          Caption.Text = #24207#21495
          DataBinding.ValueType = 'Integer'
          Options.Editing = False
          Width = 48
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
          SortOrder = soAscending
        end
        object cxTreeListColumn2: TcxTreeListColumn
          Caption.Text = #30005#35805#21495#30721
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Width = 96
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumn3: TcxTreeListColumn
          Caption.Text = #30005#35805#25317#26377#20154
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Width = 89
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxTreeListColumn4: TcxTreeListColumn
          Caption.Text = #30005#35805#31867#22411
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Width = 198
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
      end
    end
    object Panel4: TPanel
      Left = 360
      Top = 46
      Width = 35
      Height = 506
      Align = alLeft
      TabOrder = 3
      object BitBtn_AddAllList: TBitBtn
        Left = 2
        Top = 233
        Width = 30
        Height = 30
        Caption = '>>'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = BitBtn_AddAllListClick
      end
      object BitBtn_AddSelect: TBitBtn
        Left = 2
        Top = 169
        Width = 30
        Height = 30
        Caption = '>'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = BitBtn_AddSelectClick
      end
    end
  end
  object ActionList1: TActionList
    Left = 568
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
    object ReloadOldTel: TAction
      Caption = #37325#26032#36733#20837#31995#32479#20013#30340#30005#35805#26412
      OnExecute = ReloadOldTelExecute
    end
    object SaveReadedTelListToDB: TAction
      Category = #35835#20986#30340
      Caption = #20445#23384#35835#21462#30340#30005#35805#26412#21040#25968#25454#24211
      OnExecute = SaveReadedTelListToDBExecute
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 536
    Top = 8
    object N6: TMenuItem
      Action = ReloadOldTel
    end
    object N7: TMenuItem
      Caption = '-'
    end
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
  object cxStyleRepository1: TcxStyleRepository
    Left = 680
    Top = 8
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #23435#20307
      Font.Style = []
      TextColor = 5263440
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 9157775
      Font.Charset = GB2312_CHARSET
      Font.Color = clSilver
      Font.Height = -16
      Font.Name = #23435#20307
      Font.Style = []
      TextColor = clWhite
    end
  end
end
