object dlgSendSimpleText: TdlgSendSimpleText
  Left = 651
  Top = 297
  Width = 280
  Height = 189
  Caption = #21457#36865#19981#21516#24847#21407#22240
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 272
    Height = 155
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object Panel2: TPanel
      Left = 2
      Top = 2
      Width = 268
      Height = 18
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 0
      object Label1: TLabel
        Left = 2
        Top = 2
        Width = 264
        Height = 14
        Align = alClient
        Caption = #21407#22240#65306
      end
    end
    object Panel3: TPanel
      Left = 2
      Top = 113
      Width = 268
      Height = 40
      Align = alBottom
      BevelInner = bvLowered
      TabOrder = 1
      object btnSend: TBitBtn
        Left = 48
        Top = 8
        Width = 75
        Height = 25
        Caption = #21457#36865
        Default = True
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
      object btnDissend: TBitBtn
        Left = 152
        Top = 8
        Width = 75
        Height = 25
        Caption = #19981#21457#36865
        TabOrder = 1
        Kind = bkCancel
      end
    end
    object Panel4: TPanel
      Left = 2
      Top = 20
      Width = 268
      Height = 93
      Align = alClient
      TabOrder = 2
      object mmoReason: TMemo
        Left = 1
        Top = 1
        Width = 266
        Height = 91
        Align = alClient
        TabOrder = 0
      end
    end
  end
end
