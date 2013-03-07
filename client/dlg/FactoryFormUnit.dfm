object FactoryForm: TFactoryForm
  Left = 385
  Top = 269
  Width = 332
  Height = 227
  Caption = #28155#21152'/'#20462#25913#24037#21378#24037#22320#20449#24687
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 324
    Height = 41
    Align = alTop
    Caption = #28155#21152'/'#20462#25913#24037#21378#24037#22320#20449#24687
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -21
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 324
    Height = 118
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 5
      Top = 38
      Width = 33
      Height = 13
      Caption = #31867#22411':'
    end
    object Panel4: TPanel
      Left = 1
      Top = 81
      Width = 322
      Height = 36
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      object Label2: TLabel
        Left = 174
        Top = 12
        Width = 33
        Height = 13
        Caption = #36317#31163':'
      end
      object Label3: TLabel
        Left = 4
        Top = 13
        Width = 33
        Height = 13
        Caption = #24037#21378':'
      end
      object ComboBoxFactory: TComboBox
        Left = 39
        Top = 8
        Width = 123
        Height = 21
        ItemHeight = 13
        TabOrder = 0
      end
      object EditDistance: TEdit
        Left = 209
        Top = 8
        Width = 105
        Height = 21
        TabOrder = 1
      end
    end
    object ButtonFont: TButton
      Left = 135
      Top = 60
      Width = 27
      Height = 20
      Caption = '...'
      TabOrder = 1
      OnClick = ButtonFontClick
    end
    object EditFont: TLabeledEdit
      Left = 40
      Top = 60
      Width = 95
      Height = 21
      EditLabel.Width = 33
      EditLabel.Height = 13
      EditLabel.Caption = #23383#20307':'
      LabelPosition = lpLeft
      ReadOnly = True
      TabOrder = 2
    end
    object EditName: TLabeledEdit
      Left = 40
      Top = 7
      Width = 275
      Height = 21
      EditLabel.Width = 33
      EditLabel.Height = 13
      EditLabel.Caption = #21517#31216':'
      LabelPosition = lpLeft
      TabOrder = 3
    end
    object EditX: TLabeledEdit
      Left = 210
      Top = 33
      Width = 105
      Height = 21
      Color = clInfoBk
      EditLabel.Width = 33
      EditLabel.Height = 13
      EditLabel.Caption = #32463#24230':'
      LabelPosition = lpLeft
      ReadOnly = True
      TabOrder = 4
    end
    object EditY: TLabeledEdit
      Left = 210
      Top = 60
      Width = 105
      Height = 21
      Color = clInfoBk
      EditLabel.Width = 33
      EditLabel.Height = 13
      EditLabel.Caption = #32428#24230':'
      LabelPosition = lpLeft
      ReadOnly = True
      TabOrder = 5
    end
    object ComboBoxType: TComboBox
      Left = 40
      Top = 33
      Width = 122
      Height = 21
      ItemHeight = 13
      TabOrder = 6
      Text = '0:'#24037#21378
      OnChange = ComboBoxTypeChange
      Items.Strings = (
        '0:'#24037#21378
        '1:'#24037#22320)
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 159
    Width = 324
    Height = 41
    Align = alBottom
    Color = clMoneyGreen
    TabOrder = 2
    object BitBtnOK: TBitBtn
      Left = 84
      Top = 8
      Width = 75
      Height = 25
      TabOrder = 0
      Kind = bkOK
    end
    object BitBtnDel: TBitBtn
      Left = 158
      Top = 8
      Width = 75
      Height = 25
      Caption = #21024#38500
      ModalResult = 2
      TabOrder = 2
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
    object BitBtnClose: TBitBtn
      Left = 232
      Top = 8
      Width = 75
      Height = 25
      Caption = #20851#38381'&C'
      TabOrder = 1
      Kind = bkClose
    end
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 280
    Top = 10
  end
end
