object BaseFrm: TBaseFrm
  Left = 479
  Top = 187
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 373
  ClientWidth = 432
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 432
    Height = 373
    Align = alClient
    BevelOuter = bvNone
    Color = 16382438
    TabOrder = 0
    object Panel2: TPanel
      Left = 0
      Top = 335
      Width = 432
      Height = 38
      Align = alBottom
      BevelInner = bvLowered
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 0
      object BitBtn1: TBitBtn
        Left = 99
        Top = 8
        Width = 95
        Height = 25
        Caption = #21457#36865' &S'
        TabOrder = 0
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
      object BitBtn2: TBitBtn
        Left = 212
        Top = 8
        Width = 95
        Height = 25
        Cancel = True
        Caption = #21462#28040' &C'
        ModalResult = 2
        TabOrder = 1
        OnClick = BitBtn2Click
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
    end
    object Panel3: TPanel
      Left = 315
      Top = 0
      Width = 117
      Height = 335
      Align = alRight
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'Panel3'
      ParentColor = True
      TabOrder = 1
      object ListView1: TListView
        Left = 1
        Top = 30
        Width = 115
        Height = 276
        Align = alClient
        Columns = <
          item
            AutoSize = True
            Caption = #36710#29260#21495
          end>
        GridLines = True
        MultiSelect = True
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
      end
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 115
        Height = 29
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = ' '#21457#36865#32473#20197#19979#36710#36742#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentColor = True
        ParentFont = False
        TabOrder = 1
      end
      object Panel6: TPanel
        Left = 1
        Top = 306
        Width = 115
        Height = 28
        Align = alBottom
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 2
        object BitBtnSel: TBitBtn
          Left = 2
          Top = 2
          Width = 57
          Height = 25
          Hint = #37325#26032#36873#25321#36710#36742
          Caption = #37325#26032#36873#25321
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = BitBtnSelClick
        end
        object BitBtn3: TBitBtn
          Left = 58
          Top = 2
          Width = 57
          Height = 25
          Cancel = True
          Caption = #31227#38500
          TabOrder = 1
          OnClick = BitBtn3Click
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
      end
    end
    object Panel5: TPanel
      Left = 0
      Top = 0
      Width = 315
      Height = 335
      Align = alClient
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 2
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 315
        Height = 49
        Align = alTop
        BevelInner = bvSpace
        BevelOuter = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = True
        ParentFont = False
        TabOrder = 0
      end
      object PanProgress: TPanel
        Left = 0
        Top = 312
        Width = 315
        Height = 23
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 1
        Visible = False
        object ProgressBar1: TProgressBar
          Left = 2
          Top = 2
          Width = 311
          Height = 19
          Align = alClient
          TabOrder = 0
        end
      end
    end
  end
end
