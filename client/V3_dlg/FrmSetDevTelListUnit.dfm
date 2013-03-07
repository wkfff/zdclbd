object frmSetDevTelList: TfrmSetDevTelList
  Left = 460
  Top = 176
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #35774#32622#30005#35805#26412
  ClientHeight = 380
  ClientWidth = 574
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel4: TPanel
    Left = 436
    Top = 0
    Width = 138
    Height = 380
    Align = alRight
    Caption = 'Panel4'
    Color = 16382438
    TabOrder = 0
    object Panel8: TPanel
      Left = 1
      Top = 346
      Width = 136
      Height = 33
      Align = alBottom
      ParentColor = True
      TabOrder = 0
      object BitBtn5: TBitBtn
        Left = 68
        Top = 4
        Width = 62
        Height = 25
        Caption = #31227#38500
        TabOrder = 0
        OnClick = BitBtn5Click
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
      object BitBtnSel: TBitBtn
        Left = 5
        Top = 4
        Width = 62
        Height = 25
        Caption = #37325#26032#36873#25321
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
        OnClick = BitBtnSelClick
      end
    end
    object ListView1: TListView
      Left = 1
      Top = 25
      Width = 136
      Height = 321
      Align = alClient
      Columns = <
        item
          Caption = #36710#29260#21495
          Width = 103
        end>
      FlatScrollBars = True
      GridLines = True
      ReadOnly = True
      RowSelect = True
      TabOrder = 1
      ViewStyle = vsReport
      OnClick = ListView1Click
    end
    object Panel7: TPanel
      Left = 1
      Top = 1
      Width = 136
      Height = 24
      Align = alTop
      Caption = #35774#32622#20197#19979#36710#36742':'
      ParentColor = True
      TabOrder = 2
    end
  end
  object Panel111: TPanel
    Left = 0
    Top = 0
    Width = 436
    Height = 380
    Align = alClient
    Caption = 'Panel111'
    Color = 16382438
    TabOrder = 1
    object Panel2: TPanel
      Left = 1
      Top = 43
      Width = 434
      Height = 262
      Align = alClient
      BevelInner = bvLowered
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 0
      object Panel5: TPanel
        Left = 1
        Top = 237
        Width = 432
        Height = 24
        Align = alBottom
        Caption = 'Panel5'
        TabOrder = 0
        Visible = False
        object ProgressBar1: TProgressBar
          Left = 1
          Top = 1
          Width = 430
          Height = 22
          Align = alClient
          TabOrder = 0
        end
      end
      object rzListView: TRzListView
        Left = 1
        Top = 1
        Width = 432
        Height = 236
        Align = alClient
        Checkboxes = True
        Columns = <
          item
            Caption = #24207#21495
            Width = 53
          end
          item
            Caption = #32852#31995#20154
            Width = 105
          end
          item
            Caption = #30005#35805#21495#30721
            Width = 135
          end
          item
            Caption = #30005#35805#31867#22411
            Width = 135
          end
          item
            Caption = #30005#35805'ID'
            MaxWidth = 1
            Width = 0
          end>
        GridLines = True
        RowSelect = True
        TabOrder = 1
        ViewStyle = vsReport
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 434
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
    end
    object Panel1: TPanel
      Left = 1
      Top = 347
      Width = 434
      Height = 32
      Align = alBottom
      BevelInner = bvLowered
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 2
      object btnSend: TBitBtn
        Left = 266
        Top = 4
        Width = 75
        Height = 25
        Caption = #21457#36865
        TabOrder = 0
        OnClick = btnSendClick
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
      object btnCancel: TBitBtn
        Left = 349
        Top = 4
        Width = 75
        Height = 25
        Cancel = True
        Caption = #21462#28040
        ModalResult = 2
        TabOrder = 1
        OnClick = btnCancelClick
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
      object btnAdd: TBitBtn
        Left = 3
        Top = 4
        Width = 56
        Height = 25
        Caption = #22686#21152
        TabOrder = 2
        OnClick = btnAddClick
      end
      object btnModify: TBitBtn
        Left = 61
        Top = 4
        Width = 56
        Height = 25
        Caption = #20462#25913
        TabOrder = 3
        OnClick = btnModifyClick
      end
      object btnDel: TBitBtn
        Left = 119
        Top = 4
        Width = 56
        Height = 25
        Caption = #21024#38500
        TabOrder = 4
        OnClick = btnDelClick
      end
    end
    object rbgSetOption: TRzRadioGroup
      Left = 1
      Top = 305
      Width = 434
      Height = 42
      Align = alBottom
      Alignment = taCenter
      BorderInner = fsGroove
      BorderOuter = fsFlat
      Caption = #35774#32622#31867#22411
      Color = 16382438
      Columns = 6
      ItemIndex = 2
      Items.Strings = (
        #21024#38500#32456#31471#25152#26377#30005#35805#26412'    '
        #26356#26032#30005#35805#26412'   '
        #36861#21152#30005#35805#26412'   '
        #20462#25913#30005#35805#26412)
      TabOrder = 3
    end
  end
end
