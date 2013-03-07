object UserDefinedTextForm: TUserDefinedTextForm
  Left = 556
  Top = 192
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #29992#25143#33258#23450#20041#26631#31614
  ClientHeight = 220
  ClientWidth = 313
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 313
    Height = 34
    Align = alTop
    Caption = #29992#25143#33258#23450#20041#26631#31614
    Color = clGradientActiveCaption
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 34
    Width = 313
    Height = 152
    Align = alClient
    TabOrder = 1
    object EditName: TLabeledEdit
      Left = 40
      Top = 11
      Width = 121
      Height = 21
      EditLabel.Width = 33
      EditLabel.Height = 13
      EditLabel.Caption = #21517#31216':'
      LabelPosition = lpLeft
      TabOrder = 0
    end
    object EditX: TLabeledEdit
      Left = 199
      Top = 11
      Width = 105
      Height = 21
      Color = clInfoBk
      EditLabel.Width = 33
      EditLabel.Height = 13
      EditLabel.Caption = #32463#24230':'
      LabelPosition = lpLeft
      ReadOnly = True
      TabOrder = 1
    end
    object EditY: TLabeledEdit
      Left = 199
      Top = 42
      Width = 105
      Height = 21
      Color = clInfoBk
      EditLabel.Width = 33
      EditLabel.Height = 13
      EditLabel.Caption = #32428#24230':'
      LabelPosition = lpLeft
      ReadOnly = True
      TabOrder = 2
    end
    object EditFont: TLabeledEdit
      Left = 40
      Top = 44
      Width = 95
      Height = 21
      EditLabel.Width = 33
      EditLabel.Height = 13
      EditLabel.Caption = #23383#20307':'
      LabelPosition = lpLeft
      TabOrder = 3
    end
    object EditType: TLabeledEdit
      Left = 121
      Top = 5
      Width = 55
      Height = 21
      Color = clInfoBk
      EditLabel.Width = 33
      EditLabel.Height = 13
      EditLabel.Caption = #26679#24335':'
      LabelPosition = lpLeft
      ReadOnly = True
      TabOrder = 4
      Visible = False
    end
    object ButtonFont: TButton
      Left = 135
      Top = 44
      Width = 27
      Height = 20
      Caption = '...'
      TabOrder = 5
      OnClick = ButtonFontClick
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 73
      Width = 297
      Height = 74
      TabOrder = 6
      object Label3: TLabel
        Left = 8
        Top = 20
        Width = 52
        Height = 13
        Caption = #26368#23567#27604#20363
      end
      object Label2: TLabel
        Left = 8
        Top = 46
        Width = 52
        Height = 13
        Caption = #26368#22823#27604#20363
      end
      object Label5: TLabel
        Left = 157
        Top = 19
        Width = 53
        Height = 18
        AutoSize = False
        Caption = #24403#21069#27604#20363
      end
      object Edit1: TEdit
        Left = 63
        Top = 15
        Width = 90
        Height = 21
        TabOrder = 0
        Text = 'Edit1'
        OnKeyPress = Edit1KeyPress
      end
      object Edit2: TEdit
        Left = 62
        Top = 42
        Width = 91
        Height = 21
        TabOrder = 1
        Text = 'Edit2'
        OnKeyPress = Edit1KeyPress
      end
      object Edit3: TEdit
        Left = 213
        Top = 15
        Width = 75
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 2
        Text = 'Edit3'
      end
      object editIDStr: TEdit
        Left = 208
        Top = 48
        Width = 73
        Height = 21
        TabOrder = 3
        Visible = False
      end
    end
    object CheckBox1: TCheckBox
      Left = 16
      Top = 70
      Width = 97
      Height = 17
      Caption = #32454#33410#24573#30053
      TabOrder = 7
      OnClick = CheckBox1Click
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 186
    Width = 313
    Height = 34
    Align = alBottom
    Color = clMoneyGreen
    TabOrder = 2
    object BitBtnOK: TBitBtn
      Left = 84
      Top = 5
      Width = 75
      Height = 25
      TabOrder = 0
      Kind = bkOK
    end
    object BitBtnDel: TBitBtn
      Left = 158
      Top = 5
      Width = 75
      Height = 25
      Caption = #21024#38500
      ModalResult = 2
      TabOrder = 2
      OnClick = BitBtnDelClick
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
      Top = 5
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
    Left = 208
    Top = 90
  end
end
