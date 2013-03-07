object FangWeiFrm: TFangWeiFrm
  Left = 531
  Top = 259
  Width = 440
  Height = 400
  BorderIcons = [biSystemMenu]
  Caption = #38450#20266#20449#24687
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 328
    Width = 432
    Height = 38
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 91
      Top = 8
      Width = 95
      Height = 25
      Caption = #21457#36865' &S'
      TabOrder = 0
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
      Left = 188
      Top = 8
      Width = 95
      Height = 25
      Cancel = True
      Caption = #21462#28040' &C'
      ModalResult = 2
      TabOrder = 1
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 432
    Height = 328
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Panel3: TPanel
      Left = 315
      Top = 0
      Width = 117
      Height = 328
      Align = alRight
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'Panel3'
      TabOrder = 0
      object ListView1: TListView
        Left = 1
        Top = 30
        Width = 115
        Height = 269
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
        Width = 115
        Height = 29
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = ' '#21457#36865#32473#20197#19979#36710#36742#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object Panel6: TPanel
        Left = 1
        Top = 299
        Width = 115
        Height = 28
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        object BitBtnSel: TBitBtn
          Left = 2
          Top = 2
          Width = 57
          Height = 25
          Hint = #37325#26032#36873#25321#36710#36742
          Caption = #37325#26032#36873#25321
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = BitBtnSelClick
        end
        object BitBtn3: TBitBtn
          Left = 58
          Top = 2
          Width = 57
          Height = 25
          Cancel = True
          Caption = #31227#38500
          TabOrder = 1
          OnClick = BitBtn3Click
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
    object Panel5: TPanel
      Left = 0
      Top = 0
      Width = 315
      Height = 328
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 315
        Height = 57
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = #20986#31199#36710#38450#20266#20449#24687
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object PanProgress: TPanel
        Left = 0
        Top = 305
        Width = 315
        Height = 23
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 2
        Visible = False
        object ProgressBar1: TProgressBar
          Left = 2
          Top = 2
          Width = 311
          Height = 19
          Align = alClient
          TabOrder = 0
        end
      end
      object GroupBox1: TGroupBox
        Left = -151
        Top = 80
        Width = 185
        Height = 105
        Caption = #23646#24615
        TabOrder = 1
        Visible = False
        object CheckBox3: TCheckBox
          Left = 0
          Top = 80
          Width = 121
          Height = 17
          Caption = #23494#25991
          TabOrder = 2
        end
        object RadioButton2: TRadioButton
          Left = 16
          Top = 56
          Width = 113
          Height = 17
          Caption = 'gz'#21387#32553
          TabOrder = 1
        end
        object RadioButton1: TRadioButton
          Left = 40
          Top = 16
          Width = 113
          Height = 17
          Caption = #25968#25454#26080#21387#32553
          Checked = True
          TabOrder = 0
          TabStop = True
        end
      end
      object GroupBox2: TGroupBox
        Left = 48
        Top = 80
        Width = 225
        Height = 81
        TabOrder = 3
        object Label1: TLabel
          Left = 19
          Top = 31
          Width = 60
          Height = 13
          Caption = #38450#20266#20449#24687#65306
        end
        object EditInfo: TEdit
          Left = 88
          Top = 28
          Width = 121
          Height = 21
          MaxLength = 4
          TabOrder = 0
        end
      end
      object GroupBox3: TGroupBox
        Left = 48
        Top = 168
        Width = 225
        Height = 121
        Enabled = False
        TabOrder = 4
        object Label2: TLabel
          Left = 19
          Top = 36
          Width = 60
          Height = 13
          Caption = #38450#20266#22270#29255#65306
        end
        object Bevel1: TBevel
          Left = 86
          Top = 32
          Width = 97
          Height = 81
        end
        object Image1: TImage
          Left = 87
          Top = 33
          Width = 95
          Height = 79
        end
        object BitBtn4: TBitBtn
          Left = 191
          Top = 93
          Width = 24
          Height = 20
          Caption = '...'
          TabOrder = 0
          OnClick = BitBtn4Click
        end
      end
      object CheckBox2: TCheckBox
        Left = 48
        Top = 168
        Width = 81
        Height = 17
        Caption = #38450#20266#22270#29255
        TabOrder = 5
        OnClick = CheckBox2Click
      end
      object CheckBox1: TCheckBox
        Left = 48
        Top = 80
        Width = 81
        Height = 17
        Caption = #38450#20266#20449#24687
        Checked = True
        State = cbChecked
        TabOrder = 6
        OnClick = CheckBox1Click
      end
    end
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 240
    Top = 216
  end
end
