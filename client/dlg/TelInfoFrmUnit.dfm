object TelInfoFrm: TTelInfoFrm
  Left = 284
  Top = 299
  Width = 287
  Height = 218
  Caption = #30005#35805#20449#24687
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
  object PanelControl: TPanel
    Left = 0
    Top = 0
    Width = 279
    Height = 39
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    Caption = #28155#21152#19968#20010#30005#35805
    Font.Charset = GB2312_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 39
    Width = 279
    Height = 104
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 38
      Top = 48
      Width = 52
      Height = 13
      Caption = #30005#35805#21495#30721
    end
    object Label2: TLabel
      Left = 28
      Top = -2
      Width = 40
      Height = 13
      Caption = #30005#35805'ID'
      Visible = False
    end
    object Label3: TLabel
      Left = 51
      Top = 17
      Width = 39
      Height = 13
      Caption = #32852#31995#20154
    end
    object Label4: TLabel
      Left = 38
      Top = 78
      Width = 52
      Height = 13
      Caption = #30005#35805#31867#22411
    end
    object EditTelId: TEdit
      Left = 97
      Top = -8
      Width = 146
      Height = 21
      Color = clSilver
      Enabled = False
      TabOrder = 0
      Text = 'EditTelId'
      Visible = False
    end
    object EditTelNo: TEdit
      Left = 97
      Top = 44
      Width = 146
      Height = 21
      MaxLength = 20
      TabOrder = 2
      Text = 'EditTelNo'
      OnKeyPress = EditTelNoKeyPress
    end
    object EditTelName: TEdit
      Left = 97
      Top = 13
      Width = 146
      Height = 21
      MaxLength = 10
      TabOrder = 1
      Text = 'EditTelName'
    end
    object ComboBoxTelType: TComboBox
      Left = 97
      Top = 74
      Width = 146
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 3
      Text = #21628#20837
      Items.Strings = (
        #21628#20837
        #21628#20986
        #21628#20837'/'#21628#20986)
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 143
    Width = 279
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 2
    object BitBtnSave: TBitBtn
      Left = 58
      Top = 8
      Width = 79
      Height = 25
      Caption = #20445#23384
      TabOrder = 0
      OnClick = BitBtnSaveClick
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777700007777777777777777777700007777777777777777777700007777
        770088888888880000007777770007FFFFFFF0000000777797000F7FFFFFF000
        00007777197007FFFFFFF0000000919191970F7FFFFF700000001919191977F7
        F7F7F0000000999991970F7F7F7F700000007777197000000000000000007777
        970000000000000000007777770008888888800000007777770087787F7F7800
        0000777777008778F788F80000007777770087787F8878000000777777808888
        8888880800007777777777777777777700007777777777777777777700007777
        77777777777777770000}
    end
    object BitBtnCancel: TBitBtn
      Left = 143
      Top = 8
      Width = 78
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
