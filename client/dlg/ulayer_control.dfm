object layer_control: Tlayer_control
  Left = 219
  Top = 169
  Width = 470
  Height = 368
  BorderIcons = [biSystemMenu]
  Caption = #22270#23618#25511#21046
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 462
    Height = 341
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 12
      Width = 39
      Height = 13
      Caption = #22270#23618#65306
    end
    object Label4: TLabel
      Left = 275
      Top = 12
      Width = 65
      Height = 13
      Caption = #22270#23618#23646#24615#65306
    end
    object ListBox1: TListBox
      Left = 8
      Top = 29
      Width = 257
      Height = 244
      ItemHeight = 13
      MultiSelect = True
      TabOrder = 0
      OnClick = ListBox1Click
    end
    object GroupBox1: TGroupBox
      Left = 274
      Top = 181
      Width = 178
      Height = 91
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object Label2: TLabel
        Left = 43
        Top = 45
        Width = 48
        Height = 12
        Caption = #26368#22823#27604#20363
      end
      object Label3: TLabel
        Left = 43
        Top = 21
        Width = 48
        Height = 12
        Caption = #26368#23567#27604#20363
      end
      object Label5: TLabel
        Left = 44
        Top = 69
        Width = 49
        Height = 18
        AutoSize = False
        Caption = #24403#21069#27604#20363
      end
      object Edit1: TEdit
        Left = 102
        Top = 16
        Width = 61
        Height = 20
        TabOrder = 1
        Text = 'Edit1'
        OnChange = ComboBox1Change
        OnExit = Edit1Exit
        OnKeyPress = Edit1KeyPress
      end
      object Edit2: TEdit
        Left = 102
        Top = 40
        Width = 61
        Height = 20
        TabOrder = 2
        Text = 'Edit2'
        OnChange = ComboBox1Change
        OnExit = Edit2Exit
        OnKeyPress = Edit1KeyPress
      end
      object CheckBox5: TCheckBox
        Left = 8
        Top = -2
        Width = 71
        Height = 17
        Caption = #32454#33410#24573#30053
        TabOrder = 0
        OnClick = CheckBox5Click
        OnExit = CheckBox5Exit
      end
      object Edit3: TEdit
        Left = 102
        Top = 64
        Width = 61
        Height = 20
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 3
        Text = 'Edit3'
      end
    end
    object GroupBox2: TGroupBox
      Left = 9
      Top = 274
      Width = 172
      Height = 41
      TabOrder = 3
      object BitBtn1: TBitBtn
        Left = 6
        Top = 11
        Width = 79
        Height = 24
        Caption = #19978#31227
        TabOrder = 0
        OnClick = BitBtn1Click
        Glyph.Data = {
          26040000424D2604000000000000360000002800000012000000120000000100
          180000000000F0030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4080FF40
          80FF4080FF4080FF4080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4080FF4080FF4080FF4080FF
          4080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF4080FF4080FF4080FF4080FF4080FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF4080FF4080FF4080FF4080FF4080FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4080FF40
          80FF4080FF4080FF4080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4080FF4080FF4080FF4080FF
          4080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF4080FF4080FF4080FF4080FF4080FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF4080FF4080FF4080FF4080FF4080FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4080FF40
          80FF4080FF4080FF4080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFF4080FF4080FF4080FF4080FF4080FF4080FF4080FF
          4080FF4080FF4080FF4080FFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFF4080FF4080FF4080FF4080FF4080FF4080FF4080FF4080FF4080
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF4080FF4080FF4080FF4080FF4080FF4080FF4080FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4080FF40
          80FF4080FF4080FF4080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4080FF4080FF4080FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4080FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000}
      end
      object BitBtn2: TBitBtn
        Left = 84
        Top = 11
        Width = 79
        Height = 24
        Caption = #19979#31227
        TabOrder = 1
        OnClick = BitBtn2Click
        Glyph.Data = {
          26040000424D2604000000000000360000002800000012000000120000000100
          180000000000F0030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF008000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF008000008000008000
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF008000008000008000008000008000FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF008000008000008000008000008000008000008000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFF00800000800000800000
          8000008000008000008000008000008000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFF008000008000008000008000008000008000008000
          008000008000008000008000FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF008000008000008000008000008000FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF008000008000008000008000008000FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00800000
          8000008000008000008000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF008000008000008000008000
          008000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF008000008000008000008000008000FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF008000008000008000008000008000FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00800000
          8000008000008000008000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF008000008000008000008000
          008000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF008000008000008000008000008000FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000}
      end
    end
    object GroupBox4: TGroupBox
      Left = 274
      Top = 24
      Width = 178
      Height = 141
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object Shape_Color: TShape
        Left = 129
        Top = 81
        Width = 24
        Height = 18
      end
      object Label6: TLabel
        Left = 24
        Top = 86
        Width = 48
        Height = 12
        Caption = #26631#27880#23383#20307
      end
      object CheckBox2: TCheckBox
        Left = 8
        Top = 26
        Width = 73
        Height = 17
        Caption = #21487#20197#36873#20013
        TabOrder = 1
        OnClick = ComboBox1Change
        OnExit = CheckBox2Exit
      end
      object CheckBox1: TCheckBox
        Left = 8
        Top = 10
        Width = 97
        Height = 17
        Caption = #21487#35265
        TabOrder = 0
        OnClick = ComboBox1Change
        OnExit = CheckBox1Exit
      end
      object CheckBox3: TCheckBox
        Left = 8
        Top = 42
        Width = 103
        Height = 17
        Caption = #22270#20803#32454#33410#24573#30053
        TabOrder = 2
        OnClick = ComboBox1Change
        OnExit = CheckBox3Exit
      end
      object CheckBox4: TCheckBox
        Left = 8
        Top = 59
        Width = 73
        Height = 17
        Caption = #26174#31034#26631#27880
        TabOrder = 3
        OnClick = CheckBox4Click
        OnExit = CheckBox4Exit
      end
      object ComboBox1: TComboBox
        Left = 76
        Top = 59
        Width = 97
        Height = 20
        ItemHeight = 12
        TabOrder = 4
        Text = 'ComboBox1'
        Visible = False
        OnChange = ComboBox1Change
        OnExit = ComboBox1Exit
      end
      object EditFont: TEdit
        Left = 24
        Top = 102
        Width = 145
        Height = 20
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 5
        Text = 'EditFont'
      end
      object BitBtnFont: TBitBtn
        Left = 77
        Top = 80
        Width = 49
        Height = 20
        Caption = #23383#20307
        TabOrder = 6
        OnClick = BitBtnFontClick
      end
    end
    object GroupBox3: TGroupBox
      Left = 274
      Top = 275
      Width = 178
      Height = 41
      TabOrder = 4
      object BitBtn3: TBitBtn
        Left = 7
        Top = 11
        Width = 83
        Height = 24
        Caption = #30830#23450
        Default = True
        TabOrder = 0
        OnClick = BitBtn3Click
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
      object BitBtn4: TBitBtn
        Left = 89
        Top = 11
        Width = 83
        Height = 24
        Cancel = True
        Caption = #21462#28040
        TabOrder = 1
        OnClick = BitBtn4Click
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
    object StatusBar1: TStatusBar
      Left = 1
      Top = 321
      Width = 460
      Height = 19
      Panels = <
        item
          Width = 150
        end>
    end
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 216
    Top = 248
  end
end
