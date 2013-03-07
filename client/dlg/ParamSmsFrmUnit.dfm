object ParamSmsFrm: TParamSmsFrm
  Left = 175
  Top = 55
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #21442#25968#35774#32622
  ClientHeight = 454
  ClientWidth = 586
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 586
    Height = 46
    Align = alTop
    BevelInner = bvLowered
    Caption = #36890#36807#30701#20449#35774#32622#21442#25968
    Color = clMoneyGreen
    Font.Charset = GB2312_CHARSET
    Font.Color = clNavy
    Font.Height = -27
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label2: TLabel
      Left = 6
      Top = 25
      Width = 55
      Height = 16
      AutoSize = False
      Caption = #24403#21069#36710':'
      Font.Charset = GB2312_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object EditCar: TEdit
      Left = 54
      Top = 21
      Width = 121
      Height = 21
      Color = clInfoBk
      Enabled = False
      Font.Charset = GB2312_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'EditCar'
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 417
    Width = 586
    Height = 37
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 1
    object BitBtnSet: TBitBtn
      Left = 312
      Top = 6
      Width = 86
      Height = 25
      Caption = #35774#32622#21442#25968
      TabOrder = 0
      OnClick = BitBtnSetClick
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDD0000000DDDDDDDDDDDD0DDDD0000000DDDDDDD00DDDD0DDD0000000DDDD
        DD080DDDDD0DD0000000DDDDD0880DD0DDD0D0000000DD0008870DDD0DD0D000
        0000D08888770D0DD0DD00000000D07B7B7B0DD0D0DD00000000D0B7B7B70DD0
        D0DD00000000D0BBBBBB0DD0D0DD00000000D07777BB0D0DD0DD00000000DD00
        08770DDD0DD0D0000000DDDDD0870DD0DDD0D0000000DDDDDD080DDDDD0DD000
        0000DDDDDDD00DDDD0DDD0000000DDDDDDDDDDDD0DDDD0000000DDDDDDDDDDDD
        DDDDD0000000}
    end
    object BitBtn2: TBitBtn
      Left = 497
      Top = 6
      Width = 82
      Height = 25
      Cancel = True
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
      OnClick = BitBtn2Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      NumGlyphs = 2
    end
    object ProgressBar1: TProgressBar
      Left = 8
      Top = 11
      Width = 289
      Height = 16
      TabOrder = 2
      Visible = False
    end
    object BitBtn1: TBitBtn
      Left = 397
      Top = 6
      Width = 95
      Height = 25
      Cancel = True
      Caption = #20572#27490#35774#32622' &C'
      TabOrder = 3
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
    Left = 0
    Top = 46
    Width = 586
    Height = 371
    Align = alClient
    TabOrder = 2
    object Panel6: TPanel
      Left = 580
      Top = 358
      Width = 5
      Height = 12
      Align = alRight
      Caption = 'Panel6'
      TabOrder = 0
      object Panel7: TPanel
        Left = 1
        Top = 1
        Width = 3
        Height = 24
        Align = alTop
        Caption = #35774#32622#20197#19979#36710#36742':'
        TabOrder = 0
      end
      object ListView1: TListView
        Left = 1
        Top = 25
        Width = 3
        Height = 0
        Align = alClient
        Columns = <
          item
            Caption = #36710#29260#21495
            Width = 95
          end>
        GridLines = True
        ReadOnly = True
        RowSelect = True
        TabOrder = 1
        ViewStyle = vsReport
        OnClick = ListView1Click
      end
      object Panel8: TPanel
        Left = 1
        Top = -19
        Width = 3
        Height = 30
        Align = alBottom
        Caption = 'Panel8'
        TabOrder = 2
        object BitBtn4: TBitBtn
          Left = 56
          Top = 3
          Width = 53
          Height = 25
          Cancel = True
          Caption = #31227#38500
          TabOrder = 0
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
        object BitBtnSel: TBitBtn
          Left = 3
          Top = 3
          Width = 53
          Height = 25
          Caption = #37325#26032#36873#25321
          TabOrder = 1
          OnClick = BitBtnSelClick
        end
      end
    end
    object GroupBox3: TGroupBox
      Left = 1
      Top = 1
      Width = 584
      Height = 242
      Align = alTop
      Caption = #36890#35759#31867#21442#25968
      TabOrder = 1
      object CheckBox6: TCheckBox
        Left = 71
        Top = 25
        Width = 97
        Height = 17
        Caption = 'APN'#21442#25968
        TabOrder = 0
        OnClick = CheckBox1Click
      end
      object CheckBox7: TCheckBox
        Left = 71
        Top = 49
        Width = 137
        Height = 17
        Caption = #20027#20013#24515'IP'#22320#22336
        TabOrder = 1
        OnClick = CheckBox1Click
      end
      object CheckBox8: TCheckBox
        Left = 71
        Top = 73
        Width = 121
        Height = 17
        Caption = #20027#20013#24515#22495#21517
        TabOrder = 2
        OnClick = CheckBox1Click
      end
      object CheckBox9: TCheckBox
        Left = 71
        Top = 97
        Width = 121
        Height = 17
        Caption = #21103#20013#24515'IP'#22320#22336
        TabOrder = 3
        OnClick = CheckBox1Click
      end
      object CheckBox10: TCheckBox
        Left = 71
        Top = 121
        Width = 121
        Height = 17
        Caption = #21103#20013#24515#22495#21517
        TabOrder = 4
        OnClick = CheckBox1Click
      end
      object CheckBox11: TCheckBox
        Left = 71
        Top = 145
        Width = 113
        Height = 17
        Caption = #20027#20013#24515#31471#21475#21495
        TabOrder = 5
        OnClick = CheckBox1Click
      end
      object CheckBox12: TCheckBox
        Left = 71
        Top = 217
        Width = 121
        Height = 17
        Caption = #20013#24515#19979#21457#24515#36339#38388#38548
        TabOrder = 6
        OnClick = CheckBox1Click
      end
      object CheckBox13: TCheckBox
        Left = 71
        Top = 195
        Width = 137
        Height = 17
        Caption = #22495#21517#35299#26512#26381#21153#22120#30340'IP'
        TabOrder = 7
        OnClick = CheckBox1Click
      end
      object Edit6: TEdit
        Left = 208
        Top = 18
        Width = 185
        Height = 21
        TabOrder = 8
        Text = 'Edit6'
        OnChange = Edit6Change
      end
      object Edit7: TEdit
        Left = 208
        Top = 42
        Width = 185
        Height = 21
        TabOrder = 9
        Text = 'Edit7'
        OnChange = Edit7Change
        OnKeyPress = Edit7KeyPress
      end
      object Edit8: TEdit
        Left = 208
        Top = 66
        Width = 185
        Height = 21
        TabOrder = 10
        Text = 'Edit8'
        OnChange = Edit8Change
      end
      object Edit9: TEdit
        Left = 208
        Top = 90
        Width = 185
        Height = 21
        TabOrder = 11
        Text = 'Edit9'
        OnChange = Edit7Change
        OnKeyPress = Edit7KeyPress
      end
      object Edit10: TEdit
        Left = 208
        Top = 114
        Width = 185
        Height = 21
        TabOrder = 12
        Text = 'Edit10'
        OnChange = Edit8Change
      end
      object Edit11: TEdit
        Left = 208
        Top = 138
        Width = 185
        Height = 21
        TabOrder = 13
        Text = 'Edit11'
        OnChange = Edit11Change
        OnKeyPress = Edit1KeyPress
      end
      object Edit12: TEdit
        Left = 208
        Top = 214
        Width = 185
        Height = 21
        TabOrder = 14
        Text = 'Edit12'
        OnChange = Edit12Change
        OnKeyPress = Edit1KeyPress
      end
      object Edit13: TEdit
        Left = 208
        Top = 189
        Width = 185
        Height = 21
        TabOrder = 15
        Text = 'Edit13'
        OnChange = Edit7Change
        OnKeyPress = Edit7KeyPress
      end
      object CheckBox34: TCheckBox
        Left = 71
        Top = 169
        Width = 113
        Height = 17
        Caption = #21103#20013#24515#31471#21475#21495
        TabOrder = 16
        OnClick = CheckBox1Click
      end
      object Edit34: TEdit
        Left = 208
        Top = 162
        Width = 185
        Height = 21
        TabOrder = 17
        Text = 'Edit34'
        OnChange = Edit11Change
        OnKeyPress = Edit1KeyPress
      end
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 243
      Width = 584
      Height = 47
      Align = alTop
      Caption = #30005#35805#21495#30721#31867
      TabOrder = 2
      object CheckBox5: TCheckBox
        Left = 71
        Top = 22
        Width = 121
        Height = 17
        Caption = #25253#35686#30701#20449#20013#24515#21495#30721
        TabOrder = 0
        OnClick = CheckBox1Click
      end
      object Edit5: TEdit
        Left = 208
        Top = 18
        Width = 184
        Height = 21
        TabOrder = 1
        Text = 'Edit5'
        OnChange = Edit2Change
        OnKeyPress = Edit1KeyPress
      end
    end
    object GroupBox4: TGroupBox
      Left = 1
      Top = 290
      Width = 584
      Height = 68
      Align = alTop
      Caption = #36710#36733#32456#31471#31867#21442#25968
      TabOrder = 3
      object CheckBox14: TCheckBox
        Left = 72
        Top = 21
        Width = 121
        Height = 17
        Caption = #35774#32622#36710#36733#32456#31471'ID'#21495
        TabOrder = 0
        OnClick = CheckBox1Click
      end
      object CheckBox15: TCheckBox
        Left = 72
        Top = 42
        Width = 113
        Height = 17
        Caption = #36710#36733#32456#31471#23494#30721
        Enabled = False
        TabOrder = 1
        Visible = False
        OnClick = CheckBox1Click
      end
      object Edit14: TEdit
        Left = 206
        Top = 17
        Width = 193
        Height = 21
        TabOrder = 2
        Text = 'Edit14'
        OnChange = Edit14Change
        OnKeyPress = Edit1KeyPress
      end
      object Edit15: TEdit
        Left = 206
        Top = 39
        Width = 193
        Height = 21
        Enabled = False
        TabOrder = 3
        Text = 'Edit15'
        Visible = False
        OnChange = Edit15Change
        OnKeyPress = Edit1KeyPress
      end
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 98
    Top = 348
  end
end
