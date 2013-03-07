object SetUpdateDevFrm: TSetUpdateDevFrm
  Left = 316
  Top = 279
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #21319#32423#36710#26426#22266#20214
  ClientHeight = 213
  ClientWidth = 303
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 303
    Height = 213
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 34
      Width = 301
      Height = 145
      Align = alClient
      Caption = 'Panel2'
      TabOrder = 0
      object Panel5: TPanel
        Left = 116
        Top = 1
        Width = 184
        Height = 143
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Panel5'
        TabOrder = 1
        object Memo1: TMemo
          Left = 0
          Top = 29
          Width = 184
          Height = 114
          Hint = 
            #21319#32423#30340#36164#28304#22320#22336#13':IP'#22320#22336':'#31471#21475#21495':APN:'#13#20363#22914#65306#13'    :211.0.10.1:8006:CMNET:'#13#13#27492#22320#22336#35831#21521#36710#36733#35774 +
            #22791#21378#21830#33719#21462
          Align = alClient
          Lines.Strings = (
            'Memo1')
          MaxLength = 199
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
        object Panel6: TPanel
          Left = 0
          Top = 0
          Width = 184
          Height = 29
          Hint = #21319#32423#30340#36164#28304#22320#22336'   '#20363#22914#65306'211.0.10.1:8006'#25110'ftp://updata.com'#12290#27492#22320#22336#35831#21521#36710#36733#35774#22791#21378#21830#33719#21462
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvLowered
          Caption = '  '#21319#32423#30340#36164#28304#22320#22336
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
      end
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 115
        Height = 143
        Align = alLeft
        BevelInner = bvLowered
        TabOrder = 0
        object RadioGroup1: TRadioGroup
          Left = 5
          Top = 3
          Width = 105
          Height = 95
          Caption = #21319#32423#36873#25321
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemIndex = 0
          Items.Strings = (
            '0.'#21319#32423#20027#26426
            '1.'#21319#32423#35843#24230#23631)
          ParentFont = False
          TabOrder = 0
        end
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 301
      Height = 33
      Align = alTop
      BevelInner = bvLowered
      Caption = #21319#32423#36710#26426#22266#20214
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object Panel7: TPanel
      Left = 1
      Top = 179
      Width = 301
      Height = 33
      Align = alBottom
      BevelInner = bvLowered
      TabOrder = 2
      object BitBtnOk: TBitBtn
        Left = 65
        Top = 4
        Width = 84
        Height = 25
        Caption = #30830#23450
        TabOrder = 0
        OnClick = BitBtnOkClick
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
        Left = 148
        Top = 4
        Width = 84
        Height = 25
        Caption = #21462#28040
        ModalResult = 2
        TabOrder = 1
        OnClick = BitBtnCancelClick
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
end
