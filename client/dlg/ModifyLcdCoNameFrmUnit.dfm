object ModifyLcdCoNameFrm: TModifyLcdCoNameFrm
  Left = 288
  Top = 300
  BorderStyle = bsDialog
  Caption = #20462#25913#26174#31034#23631#20027#30028#38754#20869#23481
  ClientHeight = 183
  ClientWidth = 309
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
  object Panel11111: TPanel
    Left = 0
    Top = 0
    Width = 309
    Height = 183
    Align = alClient
    TabOrder = 0
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 307
      Height = 34
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = #20462#25913#26174#31034#23631#20027#30028#38754#20869#23481
      Color = 15265488
      Font.Charset = GB2312_CHARSET
      Font.Color = 16512
      Font.Height = -16
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object Panel2: TPanel
      Left = 1
      Top = 35
      Width = 307
      Height = 106
      Align = alClient
      BevelInner = bvLowered
      BevelOuter = bvNone
      TabOrder = 1
      object Label1: TLabel
        Left = 28
        Top = 25
        Width = 117
        Height = 13
        Caption = #20027#30028#38754#26174#31034#30340#20869#23481#65306
      end
      object Label2: TLabel
        Left = 15
        Top = 80
        Width = 288
        Height = 13
        Caption = #65288#21487#35774#32622#20026#20844#21496#21517#31216#65292#26368#38271'12'#20010#27721#23383#25110'24'#20010#23383#31526#65289
        Font.Charset = GB2312_CHARSET
        Font.Color = clBackground
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object EditCoName: TEdit
        Left = 28
        Top = 46
        Width = 259
        Height = 21
        MaxLength = 24
        TabOrder = 0
        Text = 'EditCoName'
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 141
      Width = 307
      Height = 41
      Align = alBottom
      BevelInner = bvLowered
      BevelOuter = bvNone
      TabOrder = 2
      object BitBtnOk: TBitBtn
        Left = 70
        Top = 8
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
        Left = 153
        Top = 8
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
    end
  end
end
