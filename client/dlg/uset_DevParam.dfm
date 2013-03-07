object set_DevParam: Tset_DevParam
  Left = 273
  Top = 170
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #35774#32622#35774#22791#21442#25968
  ClientHeight = 461
  ClientWidth = 677
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 44
    Width = 677
    Height = 380
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 21
      Top = 10
      Width = 643
      Height = 209
      TabOrder = 0
      object Label1: TLabel
        Left = 564
        Top = 48
        Width = 49
        Height = 13
        Caption = '(1-255)'
        Font.Charset = GB2312_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 564
        Top = 24
        Width = 69
        Height = 13
        Caption = '(1-9999)'#31186
        Font.Charset = GB2312_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 564
        Top = 72
        Width = 62
        Height = 13
        Caption = '(1-255)'#31186
        Font.Charset = GB2312_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 564
        Top = 95
        Width = 56
        Height = 13
        Caption = '(1-9999)'
        Font.Charset = GB2312_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 564
        Top = 160
        Width = 56
        Height = 13
        Caption = '(10-255)'
        Font.Charset = GB2312_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 564
        Top = 136
        Width = 49
        Height = 13
        Caption = '(0-255)'
        Font.Charset = GB2312_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 42
        Top = 82
        Width = 28
        Height = 13
        Caption = 'DNS:'
      end
      object Edit1: TEdit
        Left = 153
        Top = 20
        Width = 149
        Height = 21
        Color = clBtnFace
        Enabled = False
        ReadOnly = True
        TabOrder = 0
        Text = 'Edit1'
      end
      object Edit2: TEdit
        Left = 153
        Top = 40
        Width = 149
        Height = 21
        Color = clBtnFace
        Enabled = False
        ReadOnly = True
        TabOrder = 1
        Text = 'Edit2'
      end
      object Edit3: TEdit
        Left = 78
        Top = 60
        Width = 224
        Height = 20
        Hint = #35831#36755#20837#20004#20010#22495#21517#65292#22495#21517#20043#38388#20197#8220','#8221#38548#24320
        Enabled = False
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        MaxLength = 51
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        Text = 'Edit3'
        OnChange = Edit3Change
      end
      object Edit5: TEdit
        Left = 153
        Top = 121
        Width = 149
        Height = 21
        Enabled = False
        MaxLength = 4
        TabOrder = 3
        Text = 'Edit5'
        OnChange = Edit3Change
        OnKeyPress = Edit5KeyPress
      end
      object Edit6: TEdit
        Left = 153
        Top = 141
        Width = 149
        Height = 21
        Enabled = False
        MaxLength = 15
        TabOrder = 4
        Text = 'Edit6'
        OnChange = Edit3Change
        OnKeyPress = Edit5KeyPress
      end
      object Edit7: TEdit
        Left = 182
        Top = 161
        Width = 120
        Height = 21
        Color = clBtnFace
        Enabled = False
        MaxLength = 15
        ReadOnly = True
        TabOrder = 5
        Text = 'Edit7'
        OnChange = Edit3Change
        OnKeyPress = Edit5KeyPress
      end
      object Edit9: TEdit
        Left = 475
        Top = 43
        Width = 87
        Height = 21
        Hint = #35831#36755#20837'1-255'#20043#38388#30340#25968#65281
        Enabled = False
        MaxLength = 3
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        Text = 'Edit9'
        OnChange = Edit3Change
        OnKeyPress = Edit5KeyPress
      end
      object Edit10: TEdit
        Left = 475
        Top = 66
        Width = 87
        Height = 21
        Hint = #35831#36755#20837'1-255'#20043#38388#30340#25968#65281
        Enabled = False
        MaxLength = 3
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        Text = 'Edit10'
        OnChange = Edit3Change
        OnKeyPress = Edit5KeyPress
      end
      object Edit11: TEdit
        Left = 475
        Top = 89
        Width = 87
        Height = 21
        Enabled = False
        MaxLength = 5
        TabOrder = 8
        Text = 'Edit11'
        OnChange = Edit3Change
        OnKeyPress = Edit5KeyPress
      end
      object Edit13: TEdit
        Left = 475
        Top = 135
        Width = 87
        Height = 21
        Hint = #35831#36755#20837'0-255'#20043#38388#30340#25968#65281
        Enabled = False
        MaxLength = 3
        ParentShowHint = False
        ShowHint = True
        TabOrder = 9
        Text = 'Edit13'
        OnChange = Edit3Change
        OnKeyPress = Edit5KeyPress
      end
      object Edit15: TEdit
        Left = 475
        Top = 181
        Width = 121
        Height = 21
        Enabled = False
        MaxLength = 19
        TabOrder = 10
        Text = 'Edit15'
        OnChange = Edit3Change
      end
      object Edit16: TEdit
        Left = 182
        Top = 182
        Width = 120
        Height = 21
        Color = clBtnFace
        Enabled = False
        ReadOnly = True
        TabOrder = 11
        Text = 'Edit16'
      end
      object ComboBox1: TComboBox
        Left = 475
        Top = 112
        Width = 87
        Height = 21
        Enabled = False
        ItemHeight = 13
        MaxLength = 5
        TabOrder = 12
        Text = 'ComboBox1'
        OnChange = Edit3Change
        OnKeyPress = ComboBox1KeyPress
        Items.Strings = (
          '1200'
          '2400'
          '4800'
          '9600'
          '19200')
      end
      object ComboBox2: TComboBox
        Left = 475
        Top = 213
        Width = 81
        Height = 21
        Enabled = False
        ItemHeight = 13
        MaxLength = 4
        TabOrder = 13
        Text = 'ComboBox2'
        Visible = False
        Items.Strings = (
          #33021
          #19981#33021)
      end
      object Edit4: TEdit
        Left = 153
        Top = 101
        Width = 149
        Height = 21
        Hint = #36755#20837#26684#24335#65306'XXX.XXX.XXX.XXX'
        Enabled = False
        MaxLength = 15
        ParentShowHint = False
        ShowHint = True
        TabOrder = 14
        Text = 'Edit4'
        OnExit = Edit4Exit
        OnKeyPress = Edit4KeyPress
      end
      object CheckBox1: TCheckBox
        Left = 23
        Top = 21
        Width = 94
        Height = 17
        Caption = #35774#22791'ID'#21495#65306
        Enabled = False
        TabOrder = 15
      end
      object CheckBox2: TCheckBox
        Left = 23
        Top = 41
        Width = 94
        Height = 17
        Caption = #36710#29260#21495#65306
        Enabled = False
        TabOrder = 16
      end
      object CheckBox3: TCheckBox
        Left = 23
        Top = 62
        Width = 53
        Height = 17
        Caption = #22495#21517#65306
        Enabled = False
        TabOrder = 17
        OnClick = CheckBox3Click
      end
      object CheckBox4: TCheckBox
        Left = 23
        Top = 103
        Width = 94
        Height = 17
        Caption = 'IP'#22320#22336#65306
        Enabled = False
        TabOrder = 18
        OnClick = CheckBox4Click
      end
      object CheckBox5: TCheckBox
        Left = 23
        Top = 124
        Width = 94
        Height = 17
        Caption = #31471#21475#65306
        Enabled = False
        TabOrder = 19
        OnClick = CheckBox5Click
      end
      object CheckBox6: TCheckBox
        Left = 23
        Top = 144
        Width = 94
        Height = 17
        Caption = 'SMS'#20013#24515#21495#65306
        Enabled = False
        TabOrder = 20
        OnClick = CheckBox6Click
      end
      object CheckBox7: TCheckBox
        Left = 23
        Top = 165
        Width = 157
        Height = 17
        Caption = 'SMS'#25509#25910#26381#21153#22120'SIM'#21345#21495#65306
        Enabled = False
        TabOrder = 21
        OnClick = CheckBox7Click
      end
      object CheckBox8: TCheckBox
        Left = 339
        Top = 22
        Width = 133
        Height = 17
        Caption = #20027#21160#22238#25253#26102#38388#38388#38548#65306
        Enabled = False
        TabOrder = 22
        OnClick = CheckBox8Click
      end
      object CheckBox9: TCheckBox
        Left = 339
        Top = 45
        Width = 106
        Height = 17
        Caption = #22238#25253#20449#24687#26465#25968#65306
        Enabled = False
        TabOrder = 23
        OnClick = CheckBox9Click
      end
      object CheckBox10: TCheckBox
        Left = 339
        Top = 68
        Width = 129
        Height = 17
        Caption = #25253#35686#22238#25253#26102#38388#38388#38548#65306
        Enabled = False
        TabOrder = 24
        OnClick = CheckBox10Click
      end
      object CheckBox11: TCheckBox
        Left = 339
        Top = 91
        Width = 129
        Height = 17
        Caption = #25253#35686#22238#25253#37325#21457#27425#25968#65306
        Enabled = False
        TabOrder = 25
        OnClick = CheckBox11Click
      end
      object CheckBox12: TCheckBox
        Left = 339
        Top = 115
        Width = 118
        Height = 17
        Caption = #22806#37096#20018#21475#27874#29305#29575#65306
        Enabled = False
        TabOrder = 26
        OnClick = CheckBox12Click
      end
      object CheckBox13: TCheckBox
        Left = 339
        Top = 138
        Width = 97
        Height = 17
        Caption = 'IO'#21021#22987#29366#24577#65306
        Enabled = False
        TabOrder = 27
        OnClick = CheckBox13Click
      end
      object CheckBox14: TCheckBox
        Left = 339
        Top = 161
        Width = 105
        Height = 17
        Caption = #24515#36339#26102#38388#65306
        Enabled = False
        TabOrder = 28
        OnClick = CheckBox14Click
      end
      object CheckBox15: TCheckBox
        Left = 339
        Top = 185
        Width = 97
        Height = 17
        Caption = 'APN('#25509#20837#28857')'#65306
        Enabled = False
        TabOrder = 29
        OnClick = CheckBox15Click
      end
      object CheckBox16: TCheckBox
        Left = 23
        Top = 186
        Width = 156
        Height = 17
        Caption = 'SMS'#21457#36865#26381#21153#22120'SIM'#21345#21495#65306
        Enabled = False
        TabOrder = 30
        OnClick = CheckBox16Click
      end
      object Edit8: TEdit
        Left = 475
        Top = 20
        Width = 87
        Height = 21
        Enabled = False
        MaxLength = 5
        TabOrder = 31
        Text = 'Edit8'
        OnChange = Edit3Change
        OnKeyPress = Edit5KeyPress
      end
      object Edit14: TEdit
        Left = 475
        Top = 158
        Width = 87
        Height = 21
        Enabled = False
        MaxLength = 3
        TabOrder = 32
        Text = 'Edit14'
        OnChange = Edit3Change
        OnKeyPress = Edit5KeyPress
      end
      object EditDns: TEdit
        Left = 78
        Top = 80
        Width = 224
        Height = 21
        Hint = #35831#36755#20837#20004#20010'DNS'#65292'DNS'#20043#38388#20197#8220','#8221#38548#24320
        Enabled = False
        MaxLength = 31
        ParentShowHint = False
        ShowHint = True
        TabOrder = 33
        Text = 'EditDns'
        OnKeyPress = EditDnsKeyPress
      end
    end
    object RB_Basic: TRadioButton
      Left = 28
      Top = 10
      Width = 76
      Height = 13
      Caption = #22522#26412#21442#25968
      Checked = True
      Enabled = False
      Font.Charset = GB2312_CHARSET
      Font.Color = clHighlight
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TabStop = True
      OnClick = RB_BasicClick
    end
    object GroupBox2: TGroupBox
      Left = 21
      Top = 225
      Width = 630
      Height = 82
      TabOrder = 2
      object Label3: TLabel
        Left = 162
        Top = 8
        Width = 449
        Height = 13
        Caption = #27880#65306#36755#20837#26684#24335#65306#22266#23450#30005#35805#21069#35831#21152#19978#21306#21495#65292#25163#26426#21495#30452#25509#20889#65292#21495#30721#20043#38388#20197#8220','#8221#38548#24320
        Font.Charset = GB2312_CHARSET
        Font.Color = 16512
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 367
        Top = 65
        Width = 254
        Height = 13
        Caption = '*'#22312#19994#21153#30005#35805#20013#65292#31532#19968#20010#30005#35805#23450#20026#22797#20301#30005#35805#12290
        Font.Charset = GB2312_CHARSET
        Font.Color = clGreen
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Edit_ListenTel: TEdit
        Left = 101
        Top = 22
        Width = 497
        Height = 21
        Hint = #22266#23450#30005#35805#21069#35831#21152#19978#21306#21495#65292#25163#26426#21495#30452#25509#20889#65292#30005#35805#21495#30721#20043#38388#20197#8220','#8221#38548#24320
        Enabled = False
        MaxLength = 100
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnChange = Edit_ListenTelChange
        OnKeyPress = Edit_ListenTelKeyPress
      end
      object Edit_WorkTel: TEdit
        Left = 101
        Top = 43
        Width = 497
        Height = 21
        Hint = #22266#23450#30005#35805#21069#35831#21152#19978#21306#21495#65292#25163#26426#21495#30452#25509#20889#65292#30005#35805#21495#30721#20043#38388#20197#8220','#8221#38548#24320
        Enabled = False
        MaxLength = 100
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        Text = 'Edit_WorkTel'
        OnChange = Edit_ListenTelChange
        OnKeyPress = Edit_ListenTelKeyPress
      end
      object CB_ListenTel: TCheckBox
        Left = 23
        Top = 25
        Width = 77
        Height = 17
        Caption = #30417#21548#30005#35805#65306
        Enabled = False
        TabOrder = 2
        OnClick = CB_ListenTelClick
      end
      object CB_WorkTel: TCheckBox
        Left = 23
        Top = 47
        Width = 74
        Height = 17
        Caption = #19994#21153#30005#35805#65306
        Enabled = False
        TabOrder = 3
        OnClick = CB_WorkTelClick
      end
    end
    object RB_else: TRadioButton
      Left = 28
      Top = 224
      Width = 114
      Height = 14
      Caption = #30417#21548#21450#19994#21153#30005#35805
      Enabled = False
      Font.Charset = GB2312_CHARSET
      Font.Color = clHighlight
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = RB_elseClick
    end
    object GroupBox3: TGroupBox
      Left = 21
      Top = 313
      Width = 631
      Height = 62
      TabOrder = 4
      object CB_num1: TCheckBox
        Left = 23
        Top = 17
        Width = 97
        Height = 17
        Caption = '1'#21495#25353#38190#30005#35805#65306
        TabOrder = 0
        OnClick = CB_num1Click
      end
      object CB_num2: TCheckBox
        Left = 23
        Top = 39
        Width = 97
        Height = 17
        Caption = '2'#21495#25353#38190#30005#35805#65306
        TabOrder = 1
        OnClick = CB_num2Click
      end
      object CB_num3: TCheckBox
        Left = 339
        Top = 17
        Width = 97
        Height = 17
        Caption = '3'#21495#25353#38190#30005#35805#65306
        TabOrder = 2
        OnClick = CB_num3Click
      end
      object CB_num4: TCheckBox
        Left = 339
        Top = 39
        Width = 97
        Height = 17
        Caption = '4'#21495#25353#38190#30005#35805#65306
        TabOrder = 3
        OnClick = CB_num4Click
      end
      object Edit_num1: TEdit
        Left = 128
        Top = 12
        Width = 155
        Height = 21
        Hint = #22266#23450#30005#35805#21069#35831#21152#21306#21495#65292#25163#26426#21495#30452#25509#20889
        Enabled = False
        MaxLength = 15
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        Text = 'Edit_num1'
        OnChange = Edit_num1Change
        OnKeyPress = Edit_num1KeyPress
      end
      object Edit_num2: TEdit
        Left = 128
        Top = 35
        Width = 155
        Height = 21
        Hint = #22266#23450#30005#35805#21069#35831#21152#21306#21495#65292#25163#26426#21495#30452#25509#20889
        Enabled = False
        MaxLength = 15
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        Text = 'Edit_num2'
        OnKeyPress = Edit_num1KeyPress
      end
      object Edit_num3: TEdit
        Left = 448
        Top = 12
        Width = 151
        Height = 21
        Hint = #22266#23450#30005#35805#21069#35831#21152#21306#21495#65292#25163#26426#21495#30452#25509#20889
        Enabled = False
        MaxLength = 15
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        Text = 'Edit_num3'
        OnKeyPress = Edit_num1KeyPress
      end
      object Edit_num4: TEdit
        Left = 448
        Top = 35
        Width = 151
        Height = 21
        Hint = #22266#23450#30005#35805#21069#35831#21152#21306#21495#65292#25163#26426#21495#30452#25509#20889
        Enabled = False
        MaxLength = 15
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        Text = 'Edit_num4'
        OnKeyPress = Edit_num1KeyPress
      end
    end
    object RB_KeyPressTelNum: TRadioButton
      Left = 28
      Top = 311
      Width = 78
      Height = 17
      Caption = #25353#38190#30005#35805
      Enabled = False
      Font.Charset = GB2312_CHARSET
      Font.Color = clHighlight
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = RB_KeyPressTelNumClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 424
    Width = 677
    Height = 37
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 1
    object BitBtn3: TBitBtn
      Left = 144
      Top = 8
      Width = 104
      Height = 25
      Caption = #20462#25913#21442#25968
      TabOrder = 0
      Visible = False
      OnClick = BitBtn3Click
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F0000000C40E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777700007777777777777777777700007777777777777777777700007777
        77777777777777770000777778888888880007770000777777888888809B9077
        000077777777788809B9B90700007777777777700B9B9B07000077777777770F
        F0B9B90700007777777770F8FF0B907700007777777708FF8FF0077700007777
        7770FF8FF8F0777700007777770B0FF8FF0777770000777770BBB0FF80777777
        000077777BBB0B0F07777777000077777BB0BBB077777777000077777B0BBB07
        7777777700007777777777777777777700007777777777777777777700007777
        77777777777777770000}
    end
    object BitBtn1: TBitBtn
      Left = 263
      Top = 8
      Width = 151
      Height = 25
      Caption = #35774#32622#36873#20013#30340#21442#25968
      Enabled = False
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
      Left = 427
      Top = 8
      Width = 104
      Height = 25
      Cancel = True
      Caption = #36864#20986
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
    object RadioButton_AllClear: TRadioButton
      Left = 5
      Top = 20
      Width = 70
      Height = 13
      Caption = #20840#37096#19981#36873
      Checked = True
      TabOrder = 3
      TabStop = True
      OnClick = RadioButton_AllClearClick
    end
    object RadioButton_AllSelect: TRadioButton
      Left = 5
      Top = 4
      Width = 73
      Height = 13
      Caption = #20840#37096#36873#20013
      TabOrder = 4
      OnClick = RadioButton_AllSelectClick
    end
  end
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 677
    Height = 44
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    Caption = #35774#32622#35774#22791#21442#25968
    Color = 15265488
    Font.Charset = GB2312_CHARSET
    Font.Color = 16512
    Font.Height = -19
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object Label17: TLabel
      Left = 11
      Top = 26
      Width = 49
      Height = 14
      Caption = 'Label17'
      Font.Charset = GB2312_CHARSET
      Font.Color = clRed
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Visible = False
    end
  end
end
