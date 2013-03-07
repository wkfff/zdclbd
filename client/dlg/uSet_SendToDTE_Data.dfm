object set_SendToDTE_Data: Tset_SendToDTE_Data
  Left = 191
  Top = 311
  BorderStyle = bsDialog
  Caption = #21521#36830#25509#30340#20854#20182#35774#22791#21457#36865#25968#25454
  ClientHeight = 238
  ClientWidth = 364
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 259
    Top = 0
    Height = 197
    Beveled = True
  end
  object Panel_Basic: TPanel
    Left = 0
    Top = 0
    Width = 259
    Height = 197
    Align = alLeft
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 22
      Top = 14
      Width = 65
      Height = 13
      Caption = #25968#25454#20869#23481#65306
    end
    object Memo1: TMemo
      Left = 21
      Top = 33
      Width = 228
      Height = 152
      Lines.Strings = (
        'Memo1')
      MaxLength = 200
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 262
    Top = 0
    Width = 102
    Height = 197
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    Caption = 'Panel3'
    TabOrder = 1
    object ListView1: TListView
      Left = 1
      Top = 30
      Width = 100
      Height = 138
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
      Width = 100
      Height = 29
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = #21457#36865#32473#20197#19979#36710#36742#65306
      Color = 13893373
      TabOrder = 1
    end
    object Panel6: TPanel
      Left = 1
      Top = 168
      Width = 100
      Height = 28
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object BitBtn3: TBitBtn
        Left = 4
        Top = 2
        Width = 89
        Height = 25
        Caption = #21024#38500#26576#36710#36742
        TabOrder = 0
        OnClick = BitBtn3Click
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 197
    Width = 364
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 92
      Top = 10
      Width = 91
      Height = 25
      Caption = #21457#36865
      TabOrder = 1
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
    object BitBtn2: TBitBtn
      Left = 182
      Top = 10
      Width = 91
      Height = 25
      Cancel = True
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 0
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
