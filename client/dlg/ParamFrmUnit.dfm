object ParamFrm: TParamFrm
  Left = 272
  Top = 44
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  Caption = #21442#25968#35774#32622
  ClientHeight = 585
  ClientWidth = 662
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 662
    Height = 46
    Align = alTop
    BevelInner = bvSpace
    Caption = #21442#25968#35774#32622
    Color = 15987670
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
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
    object Label61: TLabel
      Left = 467
      Top = 29
      Width = 168
      Height = 12
      Caption = #27880#65306#32043#33394#39033#21442#25968#38656#36710#36733#35774#22791#25903#25345
      Font.Charset = ANSI_CHARSET
      Font.Color = clPurple
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Visible = False
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
      TabOrder = 1
      Text = 'EditCar'
    end
    object RzCheckBoxSelectAll: TRzCheckBox
      Left = 564
      Top = 10
      Width = 71
      Height = 17
      Caption = #20840#37096#36873#20013
      Font.Charset = GB2312_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      State = cbUnchecked
      TabOrder = 0
      Visible = False
      OnClick = RzCheckBoxSelectAllClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 548
    Width = 662
    Height = 37
    Align = alBottom
    BevelInner = bvLowered
    Color = 15987670
    TabOrder = 2
    object BitBtnSet: TBitBtn
      Left = 516
      Top = 6
      Width = 89
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
      Left = 611
      Top = 6
      Width = 89
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
      Width = 501
      Height = 16
      TabOrder = 2
      Visible = False
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 46
    Width = 662
    Height = 502
    Align = alClient
    Color = 15987670
    TabOrder = 1
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 656
      Height = 500
      ActivePage = TabSheet7
      Align = alLeft
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object TabSheet2: TTabSheet
        Caption = #36890#35759#31867#21442#25968
        ImageIndex = 1
        object Label50: TLabel
          Left = 287
          Top = 308
          Width = 13
          Height = 13
          Caption = #31186
        end
        object Label51: TLabel
          Left = 266
          Top = 15
          Width = 13
          Height = 13
          Caption = #31186
        end
        object Label52: TLabel
          Left = 669
          Top = 312
          Width = 13
          Height = 13
          Caption = #31859
        end
        object Label53: TLabel
          Left = 862
          Top = 358
          Width = 13
          Height = 13
          Caption = #31186
          Visible = False
        end
        object Label54: TLabel
          Left = 836
          Top = 309
          Width = 13
          Height = 13
          Caption = #31859
          Visible = False
        end
        object Label55: TLabel
          Left = 841
          Top = 382
          Width = 13
          Height = 13
          Caption = #31186
          Visible = False
        end
        object Label56: TLabel
          Left = 836
          Top = 334
          Width = 13
          Height = 13
          Caption = #31859
          Visible = False
        end
        object Label57: TLabel
          Left = 866
          Top = 179
          Width = 13
          Height = 13
          Caption = #31186
          Visible = False
        end
        object Label60: TLabel
          Left = 1193
          Top = 179
          Width = 13
          Height = 13
          Caption = #31859
          Visible = False
        end
        object Label3: TLabel
          Left = 890
          Top = 202
          Width = 13
          Height = 13
          Caption = #31186
          Visible = False
        end
        object Label4: TLabel
          Left = 1193
          Top = 204
          Width = 13
          Height = 13
          Caption = #31859
          Visible = False
        end
        object Label5: TLabel
          Left = 287
          Top = 358
          Width = 13
          Height = 13
          Caption = #31186
        end
        object Label6: TLabel
          Left = 287
          Top = 382
          Width = 13
          Height = 13
          Caption = #31186
        end
        object Label7: TLabel
          Left = 287
          Top = 409
          Width = 41
          Height = 13
          Caption = #24230'<180'
        end
        object Label8: TLabel
          Left = 629
          Top = 360
          Width = 13
          Height = 13
          Caption = #31859
        end
        object Label9: TLabel
          Left = 629
          Top = 385
          Width = 13
          Height = 13
          Caption = #31859
        end
        object Label23: TLabel
          Left = 287
          Top = 39
          Width = 13
          Height = 13
          Caption = #31186
        end
        object Label24: TLabel
          Left = 287
          Top = 87
          Width = 13
          Height = 13
          Caption = #31186
        end
        object Label59: TLabel
          Left = 890
          Top = 179
          Width = 13
          Height = 13
          Caption = #31186
          Visible = False
        end
        object Label62: TLabel
          Left = 862
          Top = 382
          Width = 13
          Height = 13
          Caption = #31186
          Visible = False
        end
        object Label76: TLabel
          Left = 287
          Top = 64
          Width = 13
          Height = 13
          Caption = #31186
        end
        object Label78: TLabel
          Left = 287
          Top = 15
          Width = 13
          Height = 13
          Caption = #31186
        end
        object Label79: TLabel
          Left = 287
          Top = 335
          Width = 13
          Height = 13
          Caption = #31186
        end
        object Label81: TLabel
          Left = 669
          Top = 335
          Width = 13
          Height = 13
          Caption = #31859
        end
        object Label89: TLabel
          Left = 629
          Top = 409
          Width = 13
          Height = 13
          Caption = #31859
        end
        object RzCheckBoxSelectPageCommunication: TRzCheckBox
          Left = 520
          Top = 0
          Width = 72
          Height = 17
          Caption = #36873#20013#26412#39029
          State = cbUnchecked
          TabOrder = 58
          OnClick = RzCheckBoxSelectPageCommunicationClick
        end
        object CheckBox35: TCheckBox
          Left = 686
          Top = 284
          Width = 97
          Height = 17
          Caption = #27719#25253#38388#38548':'
          Font.Charset = GB2312_CHARSET
          Font.Color = clPurple
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 59
          Visible = False
          OnClick = CheckBox35Click
        end
        object CheckBox6: TCheckBox
          Left = 4
          Top = 110
          Width = 97
          Height = 17
          Caption = #20027#26381#21153#22120'APN'
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 14
          OnClick = CheckBox1Click
        end
        object CheckBox7: TCheckBox
          Left = 4
          Top = 183
          Width = 137
          Height = 17
          Caption = #20027#26381#21153'IP('#22495#21517')'
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 20
          OnClick = CheckBox1Click
        end
        object CheckBox8: TCheckBox
          Left = 662
          Top = 222
          Width = 121
          Height = 17
          Caption = #20027#26381#21153#22495#21517
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 60
          Visible = False
          OnClick = CheckBox1Click
        end
        object CheckBox9: TCheckBox
          Left = 335
          Top = 183
          Width = 121
          Height = 17
          Caption = #22791#20221#26381#21153'IP('#22495#21517')'
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 28
          OnClick = CheckBox1Click
        end
        object CheckBox10: TCheckBox
          Left = 661
          Top = 238
          Width = 121
          Height = 17
          Caption = #22791#20221#26381#21153#22495#21517
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 61
          Visible = False
          OnClick = CheckBox1Click
        end
        object CheckBox11: TCheckBox
          Left = 335
          Top = 134
          Width = 113
          Height = 17
          Caption = #22791#20221#26381#21153#22120#29992#25143
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 24
          OnClick = CheckBox1Click
        end
        object CheckBox12: TCheckBox
          Left = 4
          Top = 13
          Width = 125
          Height = 17
          Caption = #32456#31471#24515#36339#21457#36865#38388#38548
          Font.Charset = GB2312_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = CheckBox1Click
        end
        object CheckBox13: TCheckBox
          Left = 335
          Top = 37
          Width = 137
          Height = 17
          Caption = 'TCP'#28040#24687#37325#20256#27425#25968
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = CheckBox1Click
        end
        object Edit6: TEdit
          Left = 172
          Top = 106
          Width = 112
          Height = 21
          Hint = #20027#26381#21153#22120'APN'
          TabOrder = 15
          Text = 'Edit6'
          OnChange = Edit6Change
        end
        object Edit7: TEdit
          Left = 172
          Top = 178
          Width = 112
          Height = 21
          Hint = #20027#26381#21153'IP('#22495#21517')'
          TabOrder = 21
          Text = 'Edit7'
        end
        object Edit8: TEdit
          Left = 651
          Top = 223
          Width = 112
          Height = 21
          TabOrder = 62
          Text = 'Edit8'
          Visible = False
          OnChange = Edit8Change
        end
        object Edit9: TEdit
          Left = 515
          Top = 181
          Width = 112
          Height = 21
          Hint = #22791#20221#26381#21153'IP('#22495#21517')'
          TabOrder = 29
          Text = 'Edit9'
        end
        object Edit82: TEdit
          Left = 720
          Top = 108
          Width = 112
          Height = 21
          Hint = 'MCU'#32500#25252#23494#30721
          TabOrder = 63
          Text = 'Edit82'
          Visible = False
          OnChange = Edit8Change
        end
        object Edit11: TEdit
          Left = 515
          Top = 132
          Width = 112
          Height = 21
          Hint = #22791#20221#26381#21153#22120#29992#25143
          TabOrder = 25
          Text = 'Edit11'
        end
        object Edit12: TEdit
          Left = 172
          Top = 11
          Width = 112
          Height = 21
          Hint = #35831#36755#20837#22823#20110'60'#30340#25968#20540
          MaxLength = 8
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Text = 'Edit12'
          OnChange = Edit60Change
          OnKeyPress = Edit1KeyPress
        end
        object Edit13: TEdit
          Left = 515
          Top = 35
          Width = 112
          Height = 21
          Hint = 'TCP'#28040#24687#37325#20256#27425#25968
          MaxLength = 8
          TabOrder = 5
          Text = 'Edit13'
          OnChange = Edit60Change
          OnKeyPress = Edit1KeyPress
        end
        object CheckBox34: TCheckBox
          Left = 4
          Top = 37
          Width = 146
          Height = 17
          Caption = 'TCP'#28040#24687#24212#31572#36229#26102#26102#38388
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = CheckBox1Click
        end
        object Edit351: TEdit
          Left = 172
          Top = 304
          Width = 112
          Height = 21
          Hint = #26410#30331#24405#27719#25253#26102#38388
          MaxLength = 8
          ParentShowHint = False
          ShowHint = True
          TabOrder = 39
          Text = 'Edit351'
          OnChange = Edit60Change
          OnKeyPress = Edit1KeyPress
        end
        object Edit34: TEdit
          Left = 172
          Top = 35
          Width = 112
          Height = 21
          Hint = 'TCP'#28040#24687#24212#31572#36229#26102#26102#38388
          MaxLength = 8
          TabOrder = 3
          Text = 'Edit34'
          OnChange = Edit60Change
          OnKeyPress = Edit1KeyPress
        end
        object Edit352: TEdit
          Left = 515
          Top = 308
          Width = 112
          Height = 21
          Hint = #26410#30331#24405#27719#25253#36317#31163
          MaxLength = 8
          ParentShowHint = False
          ShowHint = True
          TabOrder = 49
          Text = 'Edit352'
          OnChange = Edit60Change
          OnKeyPress = Edit1KeyPress
        end
        object Edit353: TEdit
          Left = 747
          Top = 354
          Width = 112
          Height = 21
          Hint = 'ACC OFF'#27719#25253#26102#38388
          MaxLength = 8
          ParentShowHint = False
          ShowHint = True
          TabOrder = 64
          Text = 'Edit353'
          Visible = False
          OnChange = Edit11Change
          OnKeyPress = Edit1KeyPress
        end
        object Edit354: TEdit
          Left = 722
          Top = 306
          Width = 112
          Height = 21
          Hint = 'ACC OFF'#27719#25253#36317#31163
          MaxLength = 8
          ParentShowHint = False
          ShowHint = True
          TabOrder = 65
          Text = 'Edit354'
          Visible = False
          OnChange = Edit11Change
          OnKeyPress = Edit1KeyPress
        end
        object Edit355: TEdit
          Left = 747
          Top = 378
          Width = 112
          Height = 21
          Hint = 'ACC ON'#27719#25253#26102#38388
          MaxLength = 8
          ParentShowHint = False
          ShowHint = True
          TabOrder = 66
          Text = 'Edit355'
          Visible = False
          OnChange = Edit11Change
          OnKeyPress = Edit1KeyPress
        end
        object CheckBox14: TCheckBox
          Left = 4
          Top = 286
          Width = 125
          Height = 17
          Caption = #20301#32622#27719#25253#31574#30053
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 34
          OnClick = CheckBox1Click
        end
        object CheckBox15: TCheckBox
          Left = 335
          Top = 285
          Width = 113
          Height = 17
          Caption = #20301#32622#27719#25253#26041#26696
          TabOrder = 36
          OnClick = CheckBox1Click
        end
        object Edit59: TEdit
          Left = 172
          Top = 83
          Width = 112
          Height = 21
          Hint = 'SMS'#28040#24687#24212#31572#36229#26102#26102#38388
          MaxLength = 8
          TabOrder = 11
          Text = 'Edit59'
          OnChange = Edit60Change
          OnKeyPress = Edit1KeyPress
        end
        object Edit60: TEdit
          Left = 515
          Top = 84
          Width = 112
          Height = 21
          Hint = 'SMS'#28040#24687#37325#20256#27425#25968
          MaxLength = 8
          TabOrder = 13
          Text = 'Edit60'
          OnChange = Edit60Change
          OnKeyPress = Edit1KeyPress
        end
        object Edit356: TEdit
          Left = 722
          Top = 330
          Width = 112
          Height = 21
          Hint = 'ACC ON'#27719#25253#36317#31163
          MaxLength = 8
          ParentShowHint = False
          ShowHint = True
          TabOrder = 67
          Text = 'Edit356'
          Visible = False
          OnChange = Edit11Change
          OnKeyPress = Edit1KeyPress
        end
        object Edit357: TEdit
          Left = 775
          Top = 175
          Width = 112
          Height = 21
          Hint = #31354#36710#27719#25253#26102#38388
          MaxLength = 8
          ParentShowHint = False
          ShowHint = True
          TabOrder = 68
          Text = 'Edit357'
          Visible = False
          OnChange = Edit11Change
          OnKeyPress = Edit1KeyPress
        end
        object Edit358: TEdit
          Left = 1079
          Top = 175
          Width = 112
          Height = 21
          Hint = #31354#36710#27719#25253#36317#31163
          MaxLength = 8
          ParentShowHint = False
          ShowHint = True
          TabOrder = 69
          Text = 'Edit358'
          Visible = False
          OnChange = Edit11Change
          OnKeyPress = Edit1KeyPress
        end
        object Edit14: TComboBox
          Left = 172
          Top = 280
          Width = 112
          Height = 21
          Hint = #20301#32622#27719#25253#31574#30053
          ItemHeight = 13
          TabOrder = 35
          OnKeyPress = Edit32KeyPress
          Items.Strings = (
            #23450#26102#27719#25253
            #23450#36317#27719#25253
            #23450#26102'+'#23450#36317#27719#25253)
        end
        object Edit15: TComboBox
          Left = 515
          Top = 283
          Width = 112
          Height = 21
          Hint = #20301#32622#27719#25253#26041#26696
          ItemHeight = 13
          TabOrder = 37
          OnKeyPress = Edit32KeyPress
          Items.Strings = (
            #26681#25454'ACC'#29366#24577
            #26681#25454#30331#24405#29366#24577'+ACC'#29366#24577
            '')
        end
        object CheckBox59: TCheckBox
          Left = 4
          Top = 87
          Width = 145
          Height = 17
          Caption = 'SMS'#28040#24687#24212#31572#36229#26102#26102#38388
          TabOrder = 10
          OnClick = CheckBox1Click
        end
        object CheckBox60: TCheckBox
          Left = 335
          Top = 86
          Width = 122
          Height = 17
          Caption = 'SMS'#28040#24687#37325#20256#27425#25968
          TabOrder = 12
          OnClick = CheckBox1Click
        end
        object CheckBox61: TCheckBox
          Left = 4
          Top = 134
          Width = 97
          Height = 17
          Caption = #20027#26381#21153#22120#29992#25143#21517
          TabOrder = 16
          OnClick = CheckBox1Click
        end
        object Edit61: TEdit
          Left = 172
          Top = 130
          Width = 112
          Height = 21
          Hint = #20027#26381#21153#22120#29992#25143
          TabOrder = 17
          Text = 'Edit61'
        end
        object CheckBox62: TCheckBox
          Left = 4
          Top = 159
          Width = 97
          Height = 17
          Caption = #20027#26381#21153#22120#23494#30721
          TabOrder = 18
          OnClick = CheckBox1Click
        end
        object Edit62: TEdit
          Left = 172
          Top = 154
          Width = 112
          Height = 21
          Hint = #20027#26381#21153#22120#23494#30721
          TabOrder = 19
          Text = 'Edit62'
        end
        object CheckBox63: TCheckBox
          Left = 335
          Top = 110
          Width = 105
          Height = 17
          Caption = #22791#20221#26381#21153#22120'APN'
          TabOrder = 22
          OnClick = CheckBox1Click
        end
        object Edit63: TEdit
          Left = 515
          Top = 108
          Width = 112
          Height = 21
          Hint = #22791#20221#26381#21153#22120'APN'
          TabOrder = 23
          Text = 'Edit63'
          OnChange = Edit6Change
        end
        object CheckBox64: TCheckBox
          Left = 335
          Top = 159
          Width = 113
          Height = 17
          Caption = #22791#20221#26381#21153#22120#23494#30721
          TabOrder = 26
          OnClick = CheckBox1Click
        end
        object Edit64: TEdit
          Left = 515
          Top = 157
          Width = 112
          Height = 21
          Hint = #22791#20221#26381#21153#22120#23494#30721
          TabOrder = 27
          Text = 'Edit64'
        end
        object CheckBox65: TCheckBox
          Left = 4
          Top = 207
          Width = 105
          Height = 17
          Caption = #26381#21153#22120'TCP'#31471#21475
          TabOrder = 30
          OnClick = CheckBox1Click
        end
        object Edit65: TEdit
          Left = 172
          Top = 204
          Width = 112
          Height = 21
          Hint = #26381#21153#22120'TCP'#31471#21475
          TabOrder = 31
          Text = 'Edit65'
          OnChange = Edit11Change
          OnKeyPress = Edit1KeyPress
        end
        object CheckBox351: TCheckBox
          Left = 4
          Top = 310
          Width = 137
          Height = 17
          Caption = #26410#30331#24405#27719#25253#26102#38388
          TabOrder = 38
          OnClick = CheckBox1Click
        end
        object CheckBox352: TCheckBox
          Left = 335
          Top = 310
          Width = 113
          Height = 17
          Caption = #26410#30331#24405#27719#25253#36317#31163
          TabOrder = 48
          OnClick = CheckBox1Click
        end
        object CheckBox353: TCheckBox
          Left = 680
          Top = 356
          Width = 129
          Height = 17
          Caption = 'ACC OFF'#27719#25253#26102#38388
          Font.Charset = GB2312_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 70
          Visible = False
          OnClick = CheckBox1Click
        end
        object CheckBox354: TCheckBox
          Left = 666
          Top = 308
          Width = 129
          Height = 17
          Caption = 'ACC OFF'#27719#25253#36317#31163
          Font.Charset = GB2312_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 71
          Visible = False
          OnClick = CheckBox1Click
        end
        object CheckBox355: TCheckBox
          Left = 678
          Top = 380
          Width = 121
          Height = 17
          Caption = 'ACC ON'#27719#25253#26102#38388
          Font.Charset = GB2312_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 72
          Visible = False
          OnClick = CheckBox1Click
        end
        object CheckBox356: TCheckBox
          Left = 666
          Top = 332
          Width = 121
          Height = 17
          Caption = 'ACC ON'#27719#25253#36317#31163
          Font.Charset = GB2312_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 73
          Visible = False
          OnClick = CheckBox1Click
        end
        object CheckBox357: TCheckBox
          Left = 667
          Top = 177
          Width = 97
          Height = 17
          Caption = #31354#36710#27719#25253#26102#38388
          TabOrder = 74
          Visible = False
          OnClick = CheckBox1Click
        end
        object CheckBox358: TCheckBox
          Left = 926
          Top = 177
          Width = 97
          Height = 17
          Caption = #31354#36710#27719#25253#36317#31163
          TabOrder = 75
          Visible = False
          OnClick = CheckBox1Click
        end
        object CheckBox359: TCheckBox
          Left = 667
          Top = 202
          Width = 97
          Height = 17
          Caption = #37325#36710#27719#25253#26102#38388
          TabOrder = 76
          Visible = False
          OnClick = CheckBox1Click
        end
        object Edit359: TEdit
          Left = 775
          Top = 198
          Width = 112
          Height = 21
          Hint = #37325#36710#27719#25253#26102#38388
          MaxLength = 8
          TabOrder = 77
          Text = 'Edit359'
          Visible = False
          OnChange = Edit11Change
          OnKeyPress = Edit1KeyPress
        end
        object CheckBox360: TCheckBox
          Left = 926
          Top = 202
          Width = 97
          Height = 17
          Caption = #37325#36710#27719#25253#36317#31163
          TabOrder = 78
          Visible = False
          OnClick = CheckBox1Click
        end
        object Edit360: TEdit
          Left = 1079
          Top = 200
          Width = 112
          Height = 21
          Hint = #37325#36710#27719#25253#36317#31163
          MaxLength = 8
          TabOrder = 79
          Text = 'Edit360'
          Visible = False
          OnChange = Edit11Change
          OnKeyPress = Edit1KeyPress
        end
        object CheckBox361: TCheckBox
          Left = 4
          Top = 358
          Width = 121
          Height = 17
          Caption = #20241#30496#26102#27719#25253#26102#38388
          TabOrder = 40
          OnClick = CheckBox1Click
        end
        object Edit361: TEdit
          Left = 172
          Top = 354
          Width = 112
          Height = 21
          Hint = #20241#30496#26102#27719#25253#26102#38388
          MaxLength = 8
          TabOrder = 41
          Text = 'Edit361'
          OnChange = Edit60Change
          OnKeyPress = Edit1KeyPress
        end
        object CheckBox362: TCheckBox
          Left = 4
          Top = 383
          Width = 145
          Height = 17
          Caption = #32039#24613#25253#35686#26102#27719#25253#26102#38388
          TabOrder = 42
          OnClick = CheckBox1Click
        end
        object Edit362: TEdit
          Left = 172
          Top = 378
          Width = 112
          Height = 21
          Hint = #32039#24613#25253#35686#26102#27719#25253#26102#38388
          MaxLength = 8
          TabOrder = 43
          Text = 'Edit362'
          OnChange = Edit60Change
          OnKeyPress = Edit1KeyPress
        end
        object CheckBox363: TCheckBox
          Left = 4
          Top = 407
          Width = 105
          Height = 17
          Caption = #25296#28857#34917#20256#35282#24230
          TabOrder = 54
          OnClick = CheckBox1Click
        end
        object Edit363: TEdit
          Left = 172
          Top = 405
          Width = 112
          Height = 21
          Hint = #25296#28857#34917#20256#35282#24230
          MaxLength = 8
          TabOrder = 55
          Text = 'Edit363'
          OnChange = Edit363Change
          OnKeyPress = Edit1KeyPress
        end
        object CheckBox364: TCheckBox
          Left = 335
          Top = 358
          Width = 121
          Height = 17
          Caption = #20241#30496#26102#27719#25253#36317#31163
          TabOrder = 50
          OnClick = CheckBox1Click
        end
        object Edit364: TEdit
          Left = 515
          Top = 356
          Width = 112
          Height = 21
          Hint = #20241#30496#26102#27719#25253#36317#31163
          MaxLength = 8
          TabOrder = 51
          Text = 'Edit364'
          OnChange = Edit60Change
          OnKeyPress = Edit1KeyPress
        end
        object CheckBox365: TCheckBox
          Left = 335
          Top = 383
          Width = 145
          Height = 17
          Caption = #32039#24613#25253#35686#26102#27719#25253#36317#31163
          TabOrder = 52
          OnClick = CheckBox1Click
        end
        object Edit365: TEdit
          Left = 515
          Top = 381
          Width = 112
          Height = 21
          Hint = #32039#24613#25253#35686#26102#27719#25253#36317#31163
          MaxLength = 8
          TabOrder = 53
          Text = 'Edit365'
          OnChange = Edit60Change
          OnKeyPress = Edit1KeyPress
        end
        object CheckBox81: TCheckBox
          Left = 672
          Top = 46
          Width = 111
          Height = 17
          Caption = #22791#20221#26381#21153#22120#31471#21475
          Font.Charset = GB2312_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 80
          Visible = False
          OnClick = CheckBox1Click
        end
        object CheckBox82: TCheckBox
          Left = 664
          Top = 111
          Width = 105
          Height = 17
          Caption = 'MCU'#32500#25252#23494#30721
          Font.Charset = GB2312_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 81
          Visible = False
          OnClick = CheckBox1Click
        end
        object Edit81: TEdit
          Left = 728
          Top = 43
          Width = 112
          Height = 21
          Hint = #22791#20221#26381#21153#22120#31471#21475
          TabOrder = 82
          Text = 'Edit81'
          Visible = False
          OnKeyPress = Edit1KeyPress
        end
        object date81: TDateTimePicker
          Left = 670
          Top = 76
          Width = 95
          Height = 21
          Date = 40061.545456261570000000
          Time = 40061.545456261570000000
          TabOrder = 83
          Visible = False
        end
        object time81: TDateTimePicker
          Left = 683
          Top = 76
          Width = 82
          Height = 21
          Date = 40061.545648680560000000
          Time = 40061.545648680560000000
          Kind = dtkTime
          TabOrder = 84
          Visible = False
        end
        object CheckBox83: TCheckBox
          Left = 664
          Top = 134
          Width = 97
          Height = 17
          Caption = 'MCU'#32534#21495
          Font.Charset = GB2312_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 85
          Visible = False
          OnClick = CheckBox1Click
        end
        object Edit83: TEdit
          Left = 720
          Top = 132
          Width = 112
          Height = 21
          Hint = 'MCU'#32534#21495
          MaxLength = 10
          TabOrder = 86
          Text = 'Edit83'
          Visible = False
          OnKeyPress = Edit1KeyPress
        end
        object CheckBox84: TCheckBox
          Left = 672
          Top = 245
          Width = 97
          Height = 17
          Caption = 'DNS'
          TabOrder = 87
          Visible = False
          OnClick = CheckBox1Click
        end
        object Edit84: TEdit
          Left = 678
          Top = 243
          Width = 112
          Height = 21
          Hint = 'DNS'
          TabOrder = 88
          Visible = False
          OnKeyPress = Edit1KeyPress
        end
        object CheckBox33: TCheckBox
          Left = 664
          Top = 157
          Width = 97
          Height = 17
          Caption = #31354#37325#36710#26816#27979
          Font.Charset = GB2312_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 89
          Visible = False
          OnClick = CheckBox1Click
        end
        object Edit33: TComboBox
          Left = 721
          Top = 155
          Width = 113
          Height = 21
          ItemHeight = 13
          TabOrder = 90
          Visible = False
          Items.Strings = (
            #20018#21475#26816#27979
            #37325#36710#26102#20302#30005#24179
            #37325#36710#26102#39640#30005#24179)
        end
        object CheckBox85: TCheckBox
          Left = 4
          Top = 62
          Width = 146
          Height = 17
          Caption = 'UDP'#28040#24687#24212#31572#36229#26102#26102#38388
          TabOrder = 6
          OnClick = CheckBox1Click
        end
        object Edit85: TEdit
          Left = 172
          Top = 60
          Width = 112
          Height = 21
          TabOrder = 7
          Text = 'Edit85'
          OnChange = Edit60Change
          OnKeyPress = Edit1KeyPress
        end
        object CheckBox86: TCheckBox
          Left = 335
          Top = 61
          Width = 137
          Height = 17
          Caption = 'UDP'#28040#24687#37325#20256#27425#25968
          TabOrder = 8
          OnClick = CheckBox1Click
        end
        object Edit86: TEdit
          Left = 515
          Top = 59
          Width = 112
          Height = 21
          TabOrder = 9
          Text = 'Edit86'
          OnChange = Edit60Change
          OnKeyPress = Edit1KeyPress
        end
        object CheckBox87: TCheckBox
          Left = 335
          Top = 207
          Width = 117
          Height = 17
          Caption = #26381#21153#22120'UDP'#31471#21475
          TabOrder = 32
          OnClick = CheckBox1Click
        end
        object Edit87: TEdit
          Left = 515
          Top = 205
          Width = 112
          Height = 21
          TabOrder = 33
          Text = 'Edit87'
          OnChange = Edit11Change
          OnKeyPress = Edit1KeyPress
        end
        object Edit90: TEdit
          Left = 172
          Top = 331
          Width = 112
          Height = 21
          TabOrder = 45
          Text = 'Edit90'
          OnChange = Edit60Change
          OnKeyPress = Edit1KeyPress
        end
        object Edit91: TEdit
          Left = 515
          Top = 331
          Width = 112
          Height = 21
          TabOrder = 47
          Text = 'Edit91'
          OnChange = Edit60Change
          OnKeyPress = Edit1KeyPress
        end
        object CheckBox90: TCheckBox
          Left = 4
          Top = 333
          Width = 97
          Height = 17
          Caption = #32570#30465#27719#25253#26102#38388
          TabOrder = 44
          OnClick = CheckBox1Click
        end
        object CheckBox91: TCheckBox
          Left = 335
          Top = 333
          Width = 97
          Height = 17
          Caption = #32570#30465#27719#25253#36317#31163
          TabOrder = 46
          OnClick = CheckBox1Click
        end
        object CheckBox98: TCheckBox
          Left = 335
          Top = 407
          Width = 97
          Height = 17
          Caption = #30005#23376#22260#26639#21322#24452
          TabOrder = 56
          OnClick = CheckBox1Click
        end
        object Edit98: TEdit
          Left = 515
          Top = 405
          Width = 112
          Height = 21
          TabOrder = 57
          Text = 'Edit98'
          OnChange = Edit11Change
          OnKeyPress = Edit1KeyPress
        end
        object CheckBox102: TCheckBox
          Left = 4
          Top = 234
          Width = 171
          Height = 17
          Caption = 'IC'#21345#35748#35777#20027#26381#21153'IP('#22495#21517')'
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 91
          OnClick = CheckBox1Click
        end
        object CheckBox103: TCheckBox
          Left = 335
          Top = 234
          Width = 175
          Height = 17
          Caption = 'IC'#21345#35748#35777#22791#20221#26381#21153'IP('#22495#21517')'
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 92
          OnClick = CheckBox1Click
        end
        object Edit102: TEdit
          Left = 172
          Top = 229
          Width = 112
          Height = 21
          Hint = #20027#26381#21153'IP('#22495#21517')'
          TabOrder = 93
          Text = 'Edit102'
        end
        object Edit103: TEdit
          Left = 515
          Top = 232
          Width = 112
          Height = 21
          Hint = #22791#20221#26381#21153'IP('#22495#21517')'
          TabOrder = 94
          Text = 'Edit103'
        end
        object CheckBox104: TCheckBox
          Left = 4
          Top = 258
          Width = 105
          Height = 17
          Caption = #26381#21153#22120'TCP'#31471#21475
          TabOrder = 95
          OnClick = CheckBox1Click
        end
        object Edit104: TEdit
          Left = 172
          Top = 255
          Width = 112
          Height = 21
          Hint = #26381#21153#22120'TCP'#31471#21475
          TabOrder = 96
          Text = 'Edit104'
          OnChange = Edit11Change
          OnKeyPress = Edit1KeyPress
        end
        object CheckBox105: TCheckBox
          Left = 335
          Top = 258
          Width = 117
          Height = 17
          Caption = #26381#21153#22120'UDP'#31471#21475
          TabOrder = 97
          OnClick = CheckBox1Click
        end
        object Edit105: TEdit
          Left = 515
          Top = 256
          Width = 112
          Height = 21
          TabOrder = 98
          Text = 'Edit105'
          OnChange = Edit11Change
          OnKeyPress = Edit1KeyPress
        end
      end
      object TabSheet3: TTabSheet
        Caption = #30005#35805#31867
        ImageIndex = 2
        object Label48: TLabel
          Left = 415
          Top = 228
          Width = 13
          Height = 13
          Caption = #31186
        end
        object Label63: TLabel
          Left = 415
          Top = 262
          Width = 13
          Height = 13
          Caption = #31186
        end
        object CheckBox2: TCheckBox
          Left = 118
          Top = 293
          Width = 97
          Height = 17
          Caption = #30417#21548#21495#30721
          TabOrder = 19
          OnClick = CheckBox1Click
        end
        object CheckBox3: TCheckBox
          Left = 118
          Top = 56
          Width = 97
          Height = 17
          Caption = #22797#20301#30005#35805#21495#30721
          TabOrder = 3
          OnClick = CheckBox1Click
        end
        object CheckBox4: TCheckBox
          Left = 118
          Top = 123
          Width = 147
          Height = 17
          Caption = #30417#25511#24179#21488'SMS'#30005#35805#21495#30721
          TabOrder = 7
          OnClick = CheckBox1Click
        end
        object CheckBox5: TCheckBox
          Left = 118
          Top = 157
          Width = 171
          Height = 17
          Caption = #25509#25910#32456#31471'SMS'#25991#26412#25253#35686#21495#30721
          TabOrder = 9
          OnClick = CheckBox1Click
        end
        object Edit2: TEdit
          Left = 288
          Top = 293
          Width = 121
          Height = 21
          Hint = #30417#21548#21495#30721
          TabOrder = 20
          Text = 'Edit2'
          OnChange = Edit2Change
          OnKeyPress = Edit1KeyPress
        end
        object Edit3: TEdit
          Left = 288
          Top = 54
          Width = 121
          Height = 21
          Hint = #22797#20301#30005#35805#21495#30721
          TabOrder = 4
          Text = 'Edit3'
          OnChange = Edit2Change
          OnKeyPress = Edit1KeyPress
        end
        object Edit4: TEdit
          Left = 288
          Top = 122
          Width = 121
          Height = 21
          Hint = #30417#25511#24179#21488'SMS'#30005#35805#21495#30721
          TabOrder = 8
          Text = 'Edit4'
          OnChange = Edit2Change
          OnKeyPress = Edit1KeyPress
        end
        object Edit5: TEdit
          Left = 288
          Top = 156
          Width = 121
          Height = 21
          Hint = #25509#25910#32456#31471'SMS'#25991#26412#25253#35686#21495#30721
          TabOrder = 10
          Text = 'Edit5'
          OnChange = Edit2Change
          OnKeyPress = Edit1KeyPress
        end
        object CheckBox36: TCheckBox
          Left = 422
          Top = 292
          Width = 97
          Height = 17
          Caption = #30005#35805#30701#21495#38271#24230
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 17
          Visible = False
          OnClick = CheckBox1Click
        end
        object CheckBox57: TCheckBox
          Left = 118
          Top = 191
          Width = 131
          Height = 17
          Caption = #32456#31471#30005#35805#25509#21548#31574#30053
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 11
          OnClick = CheckBox1Click
        end
        object CheckBox55: TCheckBox
          Left = 118
          Top = 225
          Width = 131
          Height = 17
          Caption = #27599#27425#26368#38271#36890#35805#26102#38388
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 13
          OnClick = CheckBox1Click
        end
        object Edit57: TComboBox
          Left = 288
          Top = 190
          Width = 121
          Height = 21
          Hint = #32456#31471#30005#35805#25509#21548#31574#30053
          ItemHeight = 13
          TabOrder = 12
          OnKeyPress = Edit32KeyPress
          Items.Strings = (
            '0-'#33258#21160#25509#21548
            '1-ACC ON'#26102#33258#21160#25509#21548#65292'OFF'#26102#25163#21160#25509#21548)
        end
        object Edit36: TEdit
          Left = 520
          Top = 284
          Width = 121
          Height = 21
          Hint = #30005#35805#30701#21495#38271#24230
          MaxLength = 8
          TabOrder = 18
          Text = 'Edit36'
          Visible = False
          OnChange = Edit2Change
          OnKeyPress = Edit1KeyPress
        end
        object Edit55: TEdit
          Left = 288
          Top = 224
          Width = 121
          Height = 21
          Hint = #27599#27425#26368#38271#36890#35805#26102#38388
          MaxLength = 8
          TabOrder = 14
          Text = 'Edit55'
          OnChange = Edit60Change
          OnKeyPress = Edit1KeyPress
        end
        object RzCheckBoxSelectPageCall: TRzCheckBox
          Left = 536
          Top = 0
          Width = 72
          Height = 17
          Caption = #36873#20013#26412#39029
          State = cbUnchecked
          TabOrder = 0
          OnClick = RzCheckBoxSelectPageCommunicationClick
        end
        object CheckBox66: TCheckBox
          Left = 118
          Top = 22
          Width = 129
          Height = 17
          Caption = #30417#25511#24179#21488#30005#35805#21495#30721
          TabOrder = 1
          OnClick = CheckBox1Click
        end
        object Edit66: TEdit
          Left = 288
          Top = 20
          Width = 121
          Height = 21
          Hint = #30417#25511#24179#21488#30005#35805#21495#30721
          TabOrder = 2
          Text = 'Edit66'
        end
        object CheckBox67: TCheckBox
          Left = 118
          Top = 90
          Width = 153
          Height = 17
          Caption = #24674#22797#20986#21378#35774#32622#30005#35805#21495#30721
          TabOrder = 5
          OnClick = CheckBox1Click
        end
        object Edit67: TEdit
          Left = 288
          Top = 88
          Width = 121
          Height = 21
          Hint = #24674#22797#20986#21378#35774#32622#30005#35805#21495#30721
          TabOrder = 6
          Text = 'Edit67'
          OnKeyPress = Edit1KeyPress
        end
        object CheckBox68: TCheckBox
          Left = 118
          Top = 259
          Width = 129
          Height = 17
          Caption = #24403#26376#26368#38271#36890#35805#26102#38388
          TabOrder = 15
          OnClick = CheckBox1Click
        end
        object Edit68: TEdit
          Left = 288
          Top = 258
          Width = 121
          Height = 21
          Hint = #24403#26376#26368#38271#36890#35805#26102#38388
          MaxLength = 8
          TabOrder = 16
          Text = 'Edit68'
          OnChange = Edit60Change
          OnKeyPress = Edit1KeyPress
        end
        object CheckBox92: TCheckBox
          Left = 120
          Top = 327
          Width = 132
          Height = 17
          Caption = #30417#25511#24179#21488#29305#26435#21495#30721
          TabOrder = 21
          OnClick = CheckBox1Click
        end
        object Edit92: TEdit
          Left = 288
          Top = 327
          Width = 121
          Height = 21
          TabOrder = 22
          Text = 'Edit92'
          OnChange = Edit2Change
          OnKeyPress = Edit1KeyPress
        end
      end
      object TabSheet5: TTabSheet
        Caption = #29031#29255#31867
        ImageIndex = 4
        object Label1: TLabel
          Left = 212
          Top = 306
          Width = 13
          Height = 13
          Caption = #21040
          Visible = False
        end
        object Label16: TLabel
          Left = 30
          Top = 426
          Width = 78
          Height = 13
          Caption = #25293#29031#25668#20687#22836#65306
          Visible = False
        end
        object Label17: TLabel
          Left = 30
          Top = 450
          Width = 65
          Height = 13
          Caption = #25293#29031#38388#38548#65306
          Visible = False
        end
        object Label18: TLabel
          Left = 289
          Top = 461
          Width = 89
          Height = 13
          Caption = #31186'(30'#65374'65535)'
          Visible = False
        end
        object Label38: TLabel
          Left = 30
          Top = 403
          Width = 65
          Height = 13
          Caption = #25293#29031#36873#39033#65306
          Visible = False
        end
        object Label39: TLabel
          Left = 318
          Top = 312
          Width = 78
          Height = 13
          Caption = #25293#29031#25668#20687#22836#65306
          Visible = False
        end
        object Label40: TLabel
          Left = 318
          Top = 337
          Width = 65
          Height = 13
          Caption = #25293#29031#38388#38548#65306
          Visible = False
        end
        object Label41: TLabel
          Left = 577
          Top = 334
          Width = 89
          Height = 13
          Caption = #31186'(30'#65374'65535)'
          Visible = False
        end
        object Label42: TLabel
          Left = 318
          Top = 287
          Width = 65
          Height = 13
          Caption = #25293#29031#36873#39033#65306
          Visible = False
        end
        object Label43: TLabel
          Left = 599
          Top = 260
          Width = 55
          Height = 13
          Caption = '0'#65374'65535'
          Visible = False
        end
        object Label44: TLabel
          Left = 318
          Top = 412
          Width = 78
          Height = 13
          Caption = #25293#29031#25668#20687#22836#65306
          Visible = False
        end
        object Label45: TLabel
          Left = 318
          Top = 436
          Width = 65
          Height = 13
          Caption = #25293#29031#38388#38548#65306
          Visible = False
        end
        object Label46: TLabel
          Left = 577
          Top = 436
          Width = 89
          Height = 13
          Caption = #31186'(30'#65374'65535)'
          Visible = False
        end
        object Label47: TLabel
          Left = 478
          Top = 449
          Width = 117
          Height = 13
          Caption = #32039#24613#25293#29031#25293#29031#36873#39033#65306
          Visible = False
        end
        object Label77: TLabel
          Left = 400
          Top = 46
          Width = 81
          Height = 13
          Caption = '1'#65374'10, 1'#26368#22909
        end
        object Label80: TLabel
          Left = 400
          Top = 76
          Width = 41
          Height = 13
          Caption = '0'#65374'255'
        end
        object Label82: TLabel
          Left = 400
          Top = 107
          Width = 41
          Height = 13
          Caption = '0'#65374'127'
        end
        object Label83: TLabel
          Left = 400
          Top = 138
          Width = 41
          Height = 13
          Caption = '0'#65374'127'
        end
        object Label84: TLabel
          Left = 400
          Top = 168
          Width = 41
          Height = 13
          Caption = '0'#65374'255'
        end
        object CheckBox17: TCheckBox
          Left = -1
          Top = 331
          Width = 97
          Height = 17
          Caption = #26159#21542#32763#29260#25293#29031
          TabOrder = 31
          Visible = False
          OnClick = CheckBox1Click
        end
        object CheckBox18: TCheckBox
          Left = -1
          Top = 356
          Width = 97
          Height = 17
          Caption = #26159#21542#20851#38376#25293#29031
          TabOrder = 33
          Visible = False
          OnClick = CheckBox1Click
        end
        object CheckBox19: TCheckBox
          Left = 287
          Top = 364
          Width = 130
          Height = 17
          Caption = #32039#24613#25293#29031#25293#29031#36873#39033#65306
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 35
          Visible = False
          OnClick = CheckBox1Click
        end
        object CheckBox20: TCheckBox
          Left = 7
          Top = 235
          Width = 121
          Height = 17
          Caption = #20027#29031#29255#26381#21153#22120#22320#22336
          TabOrder = 4
          Visible = False
          OnClick = CheckBox1Click
        end
        object CheckBox21: TCheckBox
          Left = 7
          Top = 259
          Width = 121
          Height = 17
          Caption = #20027#29031#29255#26381#21153#22120#22495#21517
          TabOrder = 8
          Visible = False
          OnClick = CheckBox1Click
        end
        object CheckBox22: TCheckBox
          Left = 369
          Top = 209
          Width = 129
          Height = 17
          Caption = #21103#29031#29255#26381#21153#22120#22320#22336
          TabOrder = 3
          Visible = False
          OnClick = CheckBox1Click
        end
        object CheckBox23: TCheckBox
          Left = 369
          Top = 234
          Width = 129
          Height = 17
          Caption = #21103#29031#29255#26381#21153#22120#22495#21517
          TabOrder = 7
          Visible = False
          OnClick = CheckBox1Click
        end
        object CheckBox24: TCheckBox
          Left = 7
          Top = 284
          Width = 121
          Height = 17
          Caption = #29031#29255#26381#21153#22120#31471#21475#21495
          TabOrder = 11
          Visible = False
          OnClick = CheckBox1Click
        end
        object CheckBox25: TCheckBox
          Left = -1
          Top = 306
          Width = 151
          Height = 17
          Caption = #23384#20648#32763#29260#29031#29255#30340#26102#38388#27573
          TabOrder = 28
          Visible = False
          OnClick = CheckBox1Click
        end
        object Edit20: TEdit
          Left = 137
          Top = 230
          Width = 155
          Height = 21
          TabOrder = 2
          Text = 'Edit20'
          Visible = False
          OnChange = Edit7Change
          OnKeyPress = Edit7KeyPress
        end
        object Edit21: TEdit
          Left = 137
          Top = 255
          Width = 155
          Height = 21
          TabOrder = 6
          Text = 'Edit21'
          Visible = False
        end
        object Edit22: TEdit
          Left = 496
          Top = 204
          Width = 155
          Height = 21
          TabOrder = 1
          Text = 'Edit22'
          Visible = False
          OnChange = Edit7Change
          OnKeyPress = Edit7KeyPress
        end
        object Edit23: TEdit
          Left = 496
          Top = 229
          Width = 155
          Height = 21
          TabOrder = 5
          Text = 'Edit23'
          Visible = False
        end
        object Edit24: TEdit
          Left = 137
          Top = 280
          Width = 155
          Height = 21
          TabOrder = 10
          Text = 'Edit24'
          Visible = False
          OnChange = Edit11Change
          OnKeyPress = Edit1KeyPress
        end
        object Edit25: TEdit
          Left = 149
          Top = 302
          Width = 59
          Height = 21
          TabOrder = 27
          Text = 'Edit25'
          Visible = False
          OnChange = Edit25Change
          OnKeyPress = Edit1KeyPress
        end
        object Edit17: TComboBox
          Left = 129
          Top = 327
          Width = 155
          Height = 21
          ItemHeight = 13
          TabOrder = 29
          Text = 'Edit17'
          Visible = False
          Items.Strings = (
            '0-'#19981#25293#29031
            '1-'#25293#29031#23384#20648
            '2-'#25293#29031#19978#20256)
        end
        object Edit18: TComboBox
          Left = 129
          Top = 352
          Width = 155
          Height = 21
          ItemHeight = 13
          TabOrder = 32
          Text = 'Edit18'
          Visible = False
          Items.Strings = (
            '0-'#19981#25293#29031
            '1-'#25293#29031#23384#20648
            '2-'#25293#29031#19978#20256)
        end
        object Edit19: TComboBox
          Left = 417
          Top = 359
          Width = 155
          Height = 21
          ItemHeight = 13
          TabOrder = 34
          Text = 'Edit19'
          Visible = False
          Items.Strings = (
            '0-'#19981#25293#29031
            '1-'#25293#29031#23384#20648
            '2-'#25293#29031#19978#20256)
        end
        object Edit252: TEdit
          Left = 230
          Top = 300
          Width = 54
          Height = 21
          TabOrder = 26
          Text = 'Edit252'
          Visible = False
          OnChange = Edit25Change
          OnKeyPress = Edit1KeyPress
        end
        object CheckBox38: TCheckBox
          Left = -1
          Top = 386
          Width = 111
          Height = 14
          Caption = #30130#21171#39550#39542#25293#29031
          Font.Charset = GB2312_CHARSET
          Font.Color = clPurple
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 37
          Visible = False
          OnClick = CheckBox38Click
        end
        object CheckBox48: TCheckBox
          Left = 287
          Top = 266
          Width = 112
          Height = 17
          Caption = #36229#36895#25253#35686#25293#29031
          Font.Charset = GB2312_CHARSET
          Font.Color = clPurple
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 23
          Visible = False
          OnClick = CheckBox48Click
        end
        object CheckBox49: TCheckBox
          Left = 369
          Top = 260
          Width = 133
          Height = 17
          Caption = #21103#29031#29255#26381#21153#31471#21475#21495
          Font.Charset = GB2312_CHARSET
          Font.Color = clPurple
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 12
          Visible = False
          OnClick = CheckBox1Click
        end
        object CheckBox54: TCheckBox
          Left = 287
          Top = 385
          Width = 97
          Height = 17
          Caption = #32039#24613#25253#35686#25293#29031
          Font.Charset = GB2312_CHARSET
          Font.Color = clPurple
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 36
          Visible = False
          OnClick = CheckBox54Click
        end
        object Edit382: TEdit
          Left = 129
          Top = 447
          Width = 155
          Height = 21
          TabOrder = 42
          Text = 'Edit382'
          Visible = False
          OnExit = Edit382Exit
          OnKeyPress = Edit1KeyPress
        end
        object Edit482: TEdit
          Left = 417
          Top = 329
          Width = 155
          Height = 21
          TabOrder = 30
          Text = 'Edit482'
          Visible = False
          OnExit = Edit382Exit
          OnKeyPress = Edit1KeyPress
        end
        object Edit49: TEdit
          Left = 496
          Top = 255
          Width = 103
          Height = 21
          TabOrder = 9
          Text = 'Edit49'
          Visible = False
          OnChange = Edit11Change
          OnKeyPress = Edit1KeyPress
        end
        object Edit542: TEdit
          Left = 417
          Top = 432
          Width = 155
          Height = 21
          TabOrder = 41
          Text = 'Edit542'
          Visible = False
          OnExit = Edit382Exit
          OnKeyPress = Edit1KeyPress
        end
        object Edit381: TComboBox
          Left = 129
          Top = 394
          Width = 155
          Height = 21
          ItemHeight = 13
          TabOrder = 38
          Visible = False
          Items.Strings = (
            '0-'#19981#25293#29031
            '1-'#25293#29031#23384#20648
            '2-'#25293#29031#19978#20256)
        end
        object edit481: TComboBox
          Left = 417
          Top = 278
          Width = 155
          Height = 21
          ItemHeight = 13
          TabOrder = 24
          Visible = False
          Items.Strings = (
            '0-'#19981#25293#29031
            '1-'#25293#29031#23384#20648
            '2-'#25293#29031#19978#20256)
        end
        object edit541: TComboBox
          Left = 486
          Top = 464
          Width = 145
          Height = 21
          ItemHeight = 13
          TabOrder = 43
          Visible = False
          Items.Strings = (
            '0-'#19981#25293#29031
            '1-'#25293#29031#23384#20648
            '2-'#25293#29031#19978#20256)
        end
        object GroupBox3: TGroupBox
          Left = 129
          Top = 415
          Width = 155
          Height = 29
          TabOrder = 40
          Visible = False
          object cxCheckBoxPljsPIc1: TcxCheckBox
            Left = 0
            Top = 6
            Caption = '0'#21495
            TabOrder = 0
            Visible = False
            Width = 42
          end
          object cxCheckBoxPljsPIc2: TcxCheckBox
            Left = 38
            Top = 6
            Caption = '1'#21495
            TabOrder = 1
            Visible = False
            Width = 42
          end
          object cxCheckBoxPljsPIc3: TcxCheckBox
            Left = 76
            Top = 6
            Caption = '2'#21495
            TabOrder = 2
            Visible = False
            Width = 42
          end
          object cxCheckBoxPljsPIc4: TcxCheckBox
            Left = 113
            Top = 6
            Caption = '3'#21495
            TabOrder = 3
            Visible = False
            Width = 42
          end
        end
        object GroupBox4: TGroupBox
          Left = 417
          Top = 299
          Width = 155
          Height = 29
          TabOrder = 25
          Visible = False
          object cxCheckBoxOverSpeedPic1: TcxCheckBox
            Left = 1
            Top = 7
            Caption = '0'#21495
            TabOrder = 0
            Visible = False
            Width = 42
          end
          object cxCheckBoxOverSpeedPic2: TcxCheckBox
            Left = 38
            Top = 7
            Caption = '1'#21495
            TabOrder = 1
            Visible = False
            Width = 42
          end
          object cxCheckBoxOverSpeedPic3: TcxCheckBox
            Left = 75
            Top = 7
            Caption = '2'#21495
            TabOrder = 2
            Visible = False
            Width = 42
          end
          object cxCheckBoxOverSpeedPic4: TcxCheckBox
            Left = 113
            Top = 7
            Caption = '3'#21495
            TabOrder = 3
            Visible = False
            Width = 42
          end
        end
        object GroupBox5: TGroupBox
          Left = 417
          Top = 400
          Width = 155
          Height = 29
          TabOrder = 39
          Visible = False
          object cxCheckBoxAlarmPic1: TcxCheckBox
            Left = 1
            Top = 7
            Caption = '0'#21495
            TabOrder = 0
            Visible = False
            Width = 42
          end
          object cxCheckBoxAlarmPic2: TcxCheckBox
            Left = 40
            Top = 7
            Caption = '1'#21495
            TabOrder = 1
            Visible = False
            Width = 42
          end
          object cxCheckBoxAlarmPic3: TcxCheckBox
            Left = 76
            Top = 7
            Caption = '2'#21495
            TabOrder = 2
            Visible = False
            Width = 42
          end
          object cxCheckBoxAlarmPic4: TcxCheckBox
            Left = 113
            Top = 7
            Caption = '3'#21495
            TabOrder = 3
            Visible = False
            Width = 42
          end
        end
        object RzCheckBoxSelectPagePic: TRzCheckBox
          Left = 560
          Top = 0
          Width = 72
          Height = 17
          Caption = #36873#20013#26412#39029
          State = cbUnchecked
          TabOrder = 0
          OnClick = RzCheckBoxSelectPageCommunicationClick
        end
        object CheckBox69: TCheckBox
          Left = 152
          Top = 44
          Width = 113
          Height = 17
          Caption = #22270#20687'/'#35270#39057#36136#37327
          TabOrder = 13
          OnClick = CheckBox1Click
        end
        object Edit69: TEdit
          Left = 272
          Top = 42
          Width = 121
          Height = 21
          Hint = #22270#20687'/'#35270#39057#36136#37327
          MaxLength = 8
          TabOrder = 14
          Text = 'Edit69'
          OnChange = Edit69Change
          OnKeyPress = Edit1KeyPress
        end
        object CheckBox70: TCheckBox
          Left = 152
          Top = 74
          Width = 97
          Height = 17
          Caption = #20142#24230
          TabOrder = 15
          OnClick = CheckBox1Click
        end
        object CheckBox71: TCheckBox
          Left = 152
          Top = 105
          Width = 97
          Height = 17
          Caption = #23545#27604#24230
          TabOrder = 17
          OnClick = CheckBox1Click
        end
        object CheckBox72: TCheckBox
          Left = 152
          Top = 136
          Width = 97
          Height = 17
          Caption = #39281#21644#24230
          TabOrder = 19
          OnClick = CheckBox1Click
        end
        object CheckBox73: TCheckBox
          Left = 152
          Top = 166
          Width = 97
          Height = 17
          Caption = #33394#24230
          TabOrder = 21
          OnClick = CheckBox1Click
        end
        object Edit70: TEdit
          Left = 272
          Top = 72
          Width = 121
          Height = 21
          Hint = #20142#24230
          MaxLength = 8
          TabOrder = 16
          Text = 'Edit70'
          OnChange = Edit12Change
          OnKeyPress = Edit1KeyPress
        end
        object Edit71: TEdit
          Left = 272
          Top = 103
          Width = 121
          Height = 21
          Hint = #23545#27604#24230
          MaxLength = 8
          TabOrder = 18
          Text = 'Edit71'
          OnChange = Edit71Change
          OnKeyPress = Edit1KeyPress
        end
        object Edit72: TEdit
          Left = 272
          Top = 134
          Width = 121
          Height = 21
          Hint = #39281#21644#24230
          MaxLength = 8
          TabOrder = 20
          Text = 'Edit72'
          OnChange = Edit71Change
          OnKeyPress = Edit1KeyPress
        end
        object Edit73: TEdit
          Left = 272
          Top = 164
          Width = 121
          Height = 21
          Hint = #33394#24230
          MaxLength = 8
          TabOrder = 22
          Text = 'Edit73'
          OnChange = Edit12Change
          OnKeyPress = Edit1KeyPress
        end
      end
      object TabSheet4: TTabSheet
        Caption = #25511#21046#31867
        ImageIndex = 3
        object Label10: TLabel
          Left = 26
          Top = 344
          Width = 119
          Height = 13
          Caption = #20851#38381'LCD'#35843#24230#23631#26102#38388':'
          Visible = False
        end
        object Label11: TLabel
          Left = 26
          Top = 363
          Width = 111
          Height = 13
          Caption = #36827#20837#19968#32423#20241#30496#26102#38388':'
          Visible = False
        end
        object Label12: TLabel
          Left = 26
          Top = 384
          Width = 111
          Height = 13
          Caption = #36827#20837#28145#24230#20241#30496#26102#38388':'
          Visible = False
        end
        object Label13: TLabel
          Left = 213
          Top = 341
          Width = 111
          Height = 13
          Caption = #20998#38047#65292'0'#34920#31034#19981#20851#38381
          Visible = False
        end
        object Label14: TLabel
          Left = 213
          Top = 362
          Width = 111
          Height = 13
          Caption = #20998#38047#65292'0'#34920#31034#19981#21551#29992
          Visible = False
        end
        object Label15: TLabel
          Left = 213
          Top = 383
          Width = 111
          Height = 13
          Caption = #20998#38047#65292'0'#34920#31034#19981#21551#29992
          Visible = False
        end
        object Label19: TLabel
          Left = 373
          Top = 375
          Width = 91
          Height = 13
          Caption = #23450#26102#23384#20648#38388#38548#65306
          Visible = False
        end
        object Label20: TLabel
          Left = 373
          Top = 399
          Width = 91
          Height = 13
          Caption = #23450#36317#23384#20648#38388#38548#65306
          Visible = False
        end
        object Label21: TLabel
          Left = 530
          Top = 371
          Width = 150
          Height = 13
          Caption = #31186#65292'0'#34920#31034#19981#20351#29992#35813#39033#25511#21046
          Visible = False
        end
        object Label22: TLabel
          Left = 530
          Top = 400
          Width = 150
          Height = 13
          Caption = #31859#65292'0'#34920#31034#19981#20351#29992#35813#39033#25511#21046
          Visible = False
        end
        object Label37: TLabel
          Left = 228
          Top = 57
          Width = 13
          Height = 13
          Caption = #31186
        end
        object Label49: TLabel
          Left = 535
          Top = 459
          Width = 13
          Height = 13
          Caption = #21040
          Visible = False
        end
        object Label58: TLabel
          Left = 228
          Top = 21
          Width = 59
          Height = 13
          Caption = #20844#37324'/'#23567#26102
        end
        object Label25: TLabel
          Left = 228
          Top = 92
          Width = 13
          Height = 13
          Caption = #31186
        end
        object Label26: TLabel
          Left = 228
          Top = 163
          Width = 13
          Height = 13
          Caption = #31186
        end
        object Label64: TLabel
          Left = 228
          Top = 199
          Width = 13
          Height = 13
          Caption = #31186
        end
        object Label65: TLabel
          Left = 228
          Top = 128
          Width = 13
          Height = 13
          Caption = #31186
        end
        object Label91: TLabel
          Left = 228
          Top = 232
          Width = 59
          Height = 13
          Caption = #20844#37324'/'#23567#26102
        end
        object Label90: TLabel
          Left = 518
          Top = 20
          Width = 127
          Height = 13
          Caption = '(1'#34920#31034'10'#20844#37324'/'#23567#26102') '
        end
        object Label92: TLabel
          Left = 518
          Top = 48
          Width = 13
          Height = 13
          Caption = #31186
        end
        object CheckBox39: TCheckBox
          Left = 5
          Top = 413
          Width = 137
          Height = 17
          Caption = #31354#37325#36710#26816#27979#21442#25968
          Font.Charset = GB2312_CHARSET
          Font.Color = clPurple
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 21
          Visible = False
          OnClick = CheckBox1Click
        end
        object CheckBox37: TCheckBox
          Left = 5
          Top = 320
          Width = 109
          Height = 17
          Caption = #21151#32791#25511#21046#21442#25968
          Font.Charset = GB2312_CHARSET
          Font.Color = clPurple
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 13
          Visible = False
          OnClick = CheckBox37Click
        end
        object CheckBox40: TCheckBox
          Left = 5
          Top = 438
          Width = 137
          Height = 17
          Caption = #24320#20851#20449#21495#26377#25928#30005#24179
          Font.Charset = GB2312_CHARSET
          Font.Color = clPurple
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 24
          Visible = False
          OnClick = CheckBox1Click
        end
        object CheckBox41: TCheckBox
          Left = 341
          Top = 352
          Width = 131
          Height = 17
          Caption = #30450#21306#36712#36857#25968#25454#23384#20648
          Font.Charset = GB2312_CHARSET
          Font.Color = clPurple
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 15
          Visible = False
          OnClick = CheckBox41Click
        end
        object CheckBox42: TCheckBox
          Left = 341
          Top = 427
          Width = 117
          Height = 17
          Caption = #30130#21171#39550#39542#21442#25968
          Font.Charset = GB2312_CHARSET
          Font.Color = clPurple
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 22
          Visible = False
          OnClick = CheckBox42Click
        end
        object CheckBox47: TCheckBox
          Left = 13
          Top = 55
          Width = 112
          Height = 17
          Caption = #36229#36895#25345#32493#26102#38388
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = CheckBox1Click
        end
        object CheckBox58: TCheckBox
          Left = 365
          Top = 456
          Width = 97
          Height = 17
          Caption = #22812#38388#26102#27573
          Font.Charset = GB2312_CHARSET
          Font.Color = clPurple
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 27
          Visible = False
          OnClick = CheckBox58Click
        end
        object Edit371: TEdit
          Left = 143
          Top = 338
          Width = 66
          Height = 21
          Hint = '0~65535'
          MaxLength = 5
          ParentShowHint = False
          ShowHint = True
          TabOrder = 14
          Text = 'Edit371'
          Visible = False
          OnChange = Edit11Change
          OnKeyPress = Edit1KeyPress
        end
        object Edit372: TEdit
          Left = 143
          Top = 357
          Width = 66
          Height = 21
          Hint = '0~65535'
          MaxLength = 5
          ParentShowHint = False
          ShowHint = True
          TabOrder = 16
          Text = 'Edit372'
          Visible = False
          OnChange = Edit11Change
          OnKeyPress = Edit1KeyPress
        end
        object Edit373: TEdit
          Left = 143
          Top = 378
          Width = 66
          Height = 21
          Hint = '0~65535'
          MaxLength = 5
          ParentShowHint = False
          ShowHint = True
          TabOrder = 18
          Text = 'Edit373'
          Visible = False
          OnChange = Edit11Change
          OnKeyPress = Edit1KeyPress
        end
        object Edit39: TComboBox
          Left = 117
          Top = 409
          Width = 224
          Height = 21
          ItemHeight = 13
          TabOrder = 20
          Visible = False
          Items.Strings = (
            '0 - '#24320#20851#20449#21495#26816#27979#65292#37325#36710#26102#20302#30005#24179
            '1 - '#24320#20851#20449#21495#26816#27979#65292#37325#36710#26102#39640#30005#24179
            '2 -  '#20351#29992#20018#21475#25968#25454#26469#26816#27979)
        end
        object edit40: TComboBox
          Left = 133
          Top = 435
          Width = 145
          Height = 21
          ItemHeight = 13
          TabOrder = 23
          Visible = False
          Items.Strings = (
            '0'#65306#21160#20316#26102#20302#30005#24179
            '1'#65306#21160#20316#26102#39640#30005#24179)
        end
        object Edit411: TEdit
          Left = 461
          Top = 368
          Width = 67
          Height = 21
          Hint = '0~65535'
          MaxLength = 5
          ParentShowHint = False
          ShowHint = True
          TabOrder = 17
          Text = 'Edit411'
          Visible = False
          OnChange = Edit11Change
          OnKeyPress = Edit1KeyPress
        end
        object Edit412: TEdit
          Left = 461
          Top = 392
          Width = 68
          Height = 21
          Hint = '0~65535'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 19
          Text = 'Edit412'
          Visible = False
          OnChange = Edit11Change
          OnKeyPress = Edit1KeyPress
        end
        object Edit421: TEdit
          Left = 145
          Top = 159
          Width = 78
          Height = 21
          Hint = #26368#23567#20241#24687#26102#38388'0~65535'
          MaxLength = 8
          ParentShowHint = False
          ShowHint = True
          TabOrder = 8
          Text = 'Edit421'
          OnChange = Edit60Change
          OnKeyPress = Edit1KeyPress
        end
        object Edit422: TEdit
          Left = 145
          Top = 88
          Width = 78
          Height = 21
          Hint = #36830#32493#39550#39542#26102#38388'0~65535'
          MaxLength = 8
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          Text = 'Edit422'
          OnChange = Edit60Change
          OnKeyPress = Edit1KeyPress
        end
        object Edit47: TEdit
          Left = 145
          Top = 53
          Width = 78
          Height = 21
          Hint = #36229#36895#25345#32493#26102#38388'0'#65374'255'
          MaxLength = 8
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          Text = 'Edit47'
          OnChange = Edit60Change
          OnKeyPress = Edit1KeyPress
        end
        object Edit581: TEdit
          Left = 457
          Top = 454
          Width = 59
          Height = 21
          Hint = '0'#65374'23'
          MaxLength = 2
          ParentShowHint = False
          ShowHint = True
          TabOrder = 25
          Text = 'Edit581'
          Visible = False
          OnChange = Edit25Change
          OnKeyPress = Edit1KeyPress
        end
        object Edit582: TEdit
          Left = 564
          Top = 454
          Width = 59
          Height = 21
          Hint = '0'#65374'23'
          MaxLength = 2
          ParentShowHint = False
          ShowHint = True
          TabOrder = 26
          Text = 'Edit582'
          Visible = False
          OnChange = Edit25Change
          OnKeyPress = Edit1KeyPress
        end
        object CheckBox16: TCheckBox
          Left = 13
          Top = 19
          Width = 73
          Height = 17
          Caption = #26368#39640#36895#24230
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = CheckBox1Click
        end
        object Edit16: TEdit
          Left = 145
          Top = 17
          Width = 77
          Height = 21
          Hint = #26368#39640#36895#24230
          MaxLength = 8
          TabOrder = 2
          Text = 'Edit16'
          OnChange = Edit60Change
          OnKeyPress = Edit1KeyPress
        end
        object RzCheckBoxSelectPageControl: TRzCheckBox
          Left = 560
          Top = 0
          Width = 72
          Height = 17
          Caption = #36873#20013#26412#39029
          State = cbUnchecked
          TabOrder = 0
          OnClick = RzCheckBoxSelectPageCommunicationClick
        end
        object CheckBox423: TCheckBox
          Left = 13
          Top = 197
          Width = 97
          Height = 17
          Caption = #26368#38271#20572#36710#26102#38388
          TabOrder = 9
          OnClick = CheckBox1Click
        end
        object Edit423: TEdit
          Left = 145
          Top = 195
          Width = 78
          Height = 21
          Hint = #26368#38271#20572#36710#26102#38388
          MaxLength = 8
          TabOrder = 10
          Text = 'Edit423'
          OnChange = Edit60Change
          OnKeyPress = Edit1KeyPress
        end
        object CheckBox424: TCheckBox
          Left = 13
          Top = 126
          Width = 129
          Height = 17
          Caption = #24403#22825#32047#35745#39550#39542#26102#38388
          TabOrder = 11
          OnClick = CheckBox1Click
        end
        object Edit424: TEdit
          Left = 145
          Top = 124
          Width = 78
          Height = 21
          Hint = #24403#22825#32047#35745#39550#39542#26102#38388
          MaxLength = 8
          TabOrder = 12
          Text = 'Edit424'
          OnChange = Edit60Change
          OnKeyPress = Edit1KeyPress
        end
        object CheckBox421: TCheckBox
          Left = 13
          Top = 161
          Width = 97
          Height = 17
          Caption = #26368#23567#20241#24687#26102#38388
          TabOrder = 7
          OnClick = CheckBox1Click
        end
        object CheckBox422: TCheckBox
          Left = 13
          Top = 90
          Width = 97
          Height = 17
          Caption = #36830#32493#39550#39542#26102#38388
          TabOrder = 5
          OnClick = CheckBox1Click
        end
        object CheckBox101: TCheckBox
          Left = 12
          Top = 230
          Width = 127
          Height = 17
          Caption = 'DDS'#24037#20316#26368#23567#36895#24230
          Color = 15987670
          ParentColor = False
          TabOrder = 28
          OnClick = CheckBox1Click
        end
        object Edit101: TEdit
          Left = 145
          Top = 228
          Width = 78
          Height = 21
          Hint = #26368#38271#20572#36710#26102#38388
          MaxLength = 8
          TabOrder = 29
          Text = 'Edit101'
          OnChange = Edit60Change
          OnKeyPress = Edit1KeyPress
        end
        object CheckBox106: TCheckBox
          Left = 306
          Top = 18
          Width = 130
          Height = 17
          Caption = #36229#36895#25253#35686#39044#35686#24046#20540
          TabOrder = 30
          OnClick = CheckBox1Click
        end
        object Edit106: TEdit
          Left = 438
          Top = 16
          Width = 78
          Height = 21
          Hint = #26368#38271#20572#36710#26102#38388
          MaxLength = 8
          TabOrder = 31
          Text = 'Edit106'
          OnChange = Edit60Change
          OnKeyPress = Edit1KeyPress
        end
        object CheckBox107: TCheckBox
          Left = 306
          Top = 46
          Width = 131
          Height = 17
          Caption = #30130#21171#39550#39542#39044#35686#24046#20540'  '
          TabOrder = 32
          OnClick = CheckBox1Click
        end
        object Edit107: TEdit
          Left = 438
          Top = 44
          Width = 78
          Height = 21
          Hint = #26368#38271#20572#36710#26102#38388
          MaxLength = 8
          TabOrder = 33
          Text = 'Edit107'
          OnChange = Edit60Change
          OnKeyPress = Edit1KeyPress
        end
        object GroupBox11: TGroupBox
          Left = 304
          Top = 103
          Width = 329
          Height = 73
          TabOrder = 34
          object Label93: TLabel
            Left = 19
            Top = 22
            Width = 59
            Height = 13
            Caption = #30896#25758#26102#38388' '
          end
          object Label94: TLabel
            Left = 19
            Top = 50
            Width = 72
            Height = 13
            Caption = #30896#25758#21152#36895#24230' '
          end
          object Label95: TLabel
            Left = 214
            Top = 22
            Width = 80
            Height = 13
            Caption = '('#21333#20301'4'#27627#31186') '
          end
          object Label96: TLabel
            Left = 214
            Top = 48
            Width = 75
            Height = 13
            Caption = '('#21333#20301'0.1g) '
          end
          object Edit41: TEdit
            Left = 134
            Top = 18
            Width = 78
            Height = 21
            TabOrder = 0
            Text = 'Edit41'
          end
          object Edit42: TEdit
            Left = 134
            Top = 46
            Width = 78
            Height = 21
            TabOrder = 1
            Text = 'Edit42'
          end
        end
        object CheckBox108: TCheckBox
          Left = 314
          Top = 101
          Width = 98
          Height = 17
          Caption = #30896#25758#25253#35686#21442#25968'  '
          TabOrder = 35
        end
        object CheckBox109: TCheckBox
          Left = 306
          Top = 75
          Width = 107
          Height = 17
          Caption = #20391#32763#25253#35686#35282#24230'  '
          TabOrder = 36
        end
        object Edit109: TEdit
          Left = 438
          Top = 73
          Width = 78
          Height = 21
          Hint = #26368#38271#20572#36710#26102#38388
          MaxLength = 8
          TabOrder = 37
          Text = 'Edit109'
          OnChange = Edit60Change
          OnKeyPress = Edit1KeyPress
        end
      end
      object TabSheet7: TTabSheet
        Caption = #25253#35686'/'#25511#21046#24320#20851#35774#32622
        ImageIndex = 6
        object PageControl2: TPageControl
          Left = 1
          Top = 2
          Width = 639
          Height = 465
          ActivePage = TabSheet14
          TabOrder = 0
          object TabSheet8: TTabSheet
            Caption = #21151#33021#23631#34109#26631#24535
            object cxCheckListBox56: TcxCheckListBox
              Left = 12
              Top = 3
              Width = 181
              Height = 421
              Hint = #21151#33021#23631#34109#26631#24535
              Items = <
                item
                  Text = #32039#24613#25253#35686
                end
                item
                  Text = #36229#36895#25253#35686
                end
                item
                  Text = #30130#21171#39550#39542
                end
                item
                  Text = #39044#35686
                end
                item
                  Text = 'GNSS'#27169#22359#21457#29983#25925#38556
                end
                item
                  Text = 'GNSS'#22825#32447#26410#25509#25110#34987#21098#26029
                end
                item
                  Text = 'GNSS'#22825#32447#30701#36335
                end
                item
                  Text = #32456#31471#20027#30005#28304#27424#21387
                end
                item
                  Text = #32456#31471#20027#30005#28304#25481#30005
                end
                item
                  Text = #32456#31471'LCD'#25110#26174#31034#22120#25925#38556
                end
                item
                  Text = 'TTS'#27169#22359#25925#38556
                end
                item
                  Text = #25668#20687#22836#25925#38556
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end
                item
                  Text = #24403#22825#32047#35745#39550#39542#36229#26102
                end
                item
                  Text = #36229#26102#20572#36710
                end
                item
                  Text = #36827#20986#21306#22495
                end
                item
                  Text = #36827#20986#36335#32447
                end
                item
                  Text = #36335#27573#34892#39542#26102#38388#19981#36275'/'#36807#38271
                end
                item
                  Text = #36335#32447#20559#31163#25253#35686
                end
                item
                  Text = #36710#36742'VSS'#25925#38556
                end
                item
                  Text = #36710#36742#27833#37327#24322#24120
                end
                item
                  Text = #36710#36742#34987#30423'('#36890#36807#36710#36742#38450#30423#22120')'
                end
                item
                  Text = #36710#36742#38750#27861#28857#28779
                end
                item
                  Text = #36710#36742#38750#27861#20301#31227
                end
                item
                  Text = #30896#25758#20391#32763#25253#35686
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end>
              TabOrder = 1
            end
            object BitBtnSelectDevFunction: TBitBtn
              Left = 431
              Top = 21
              Width = 66
              Height = 21
              Caption = #20840#36873
              TabOrder = 2
              OnClick = BitBtnSelectDevFunctionClick
            end
            object CheckBox56: TCheckBox
              Left = 400
              Top = 0
              Width = 97
              Height = 17
              Caption = #21151#33021#23631#34109#26631#24535
              Font.Charset = GB2312_CHARSET
              Font.Color = clPurple
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnClick = CheckBox56Click
            end
          end
          object TabSheet9: TTabSheet
            Caption = #25253#35686#21457#36865#25991#26412
            ImageIndex = 1
            object cxCheckListBox1: TcxCheckListBox
              Left = 12
              Top = 6
              Width = 181
              Height = 421
              Hint = #25253#35686#21457#36865#25991#26412
              Items = <
                item
                  Text = #32039#24613#25253#35686
                end
                item
                  Text = #36229#36895#25253#35686
                end
                item
                  Text = #30130#21171#39550#39542
                end
                item
                  Text = #39044#35686
                end
                item
                  Text = 'GNSS'#27169#22359#21457#29983#25925#38556
                end
                item
                  Text = 'GNSS'#22825#32447#26410#25509#25110#34987#21098#26029
                end
                item
                  Text = 'GNSS'#22825#32447#30701#36335
                end
                item
                  Text = #32456#31471#20027#30005#28304#27424#21387
                end
                item
                  Text = #32456#31471#20027#30005#28304#25481#30005
                end
                item
                  Text = #32456#31471'LCD'#25110#26174#31034#22120#25925#38556
                end
                item
                  Text = 'TTS'#27169#22359#25925#38556
                end
                item
                  Text = #25668#20687#22836#25925#38556
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end
                item
                  Text = #24403#22825#32047#35745#39550#39542#36229#26102
                end
                item
                  Text = #36229#26102#20572#36710
                end
                item
                  Text = #36827#20986#21306#22495
                end
                item
                  Text = #36827#20986#36335#32447
                end
                item
                  Text = #36335#27573#34892#39542#26102#38388#19981#36275'/'#36807#38271
                end
                item
                  Text = #31105#34892#36335#27573#34892#39542
                end
                item
                  Text = #36710#36742'VSS'#25925#38556
                end
                item
                  Text = #36710#36742#27833#37327#24322#24120
                end
                item
                  Text = #36710#36742#34987#30423'('#36890#36807#36710#36742#38450#30423#22120')'
                end
                item
                  Text = #36710#36742#38750#27861#28857#28779
                end
                item
                  Text = #36710#36742#38750#27861#20301#31227
                end
                item
                  Text = #30896#25758#20391#32763#25253#35686
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end>
              TabOrder = 1
            end
            object BitBtn3: TBitBtn
              Left = 431
              Top = 21
              Width = 66
              Height = 21
              Caption = #20840#36873
              TabOrder = 2
              OnClick = BitBtn3Click
            end
            object CheckBox77: TCheckBox
              Left = 400
              Top = 0
              Width = 97
              Height = 17
              Caption = #25253#35686#21457#36865#25991#26412
              Font.Charset = GB2312_CHARSET
              Font.Color = clPurple
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnClick = CheckBox77Click
            end
          end
          object TabSheet10: TTabSheet
            Caption = #25253#35686#25293#25668#24320#20851
            ImageIndex = 2
            object cxCheckListBox2: TcxCheckListBox
              Left = 12
              Top = 2
              Width = 181
              Height = 435
              Hint = #25253#35686#25293#25668#24320#20851
              Items = <
                item
                  Text = #32039#24613#25253#35686
                end
                item
                  Text = #36229#36895#25253#35686
                end
                item
                  Text = #30130#21171#39550#39542
                end
                item
                  Text = #39044#35686
                end
                item
                  Text = 'GNSS'#27169#22359#21457#29983#25925#38556
                end
                item
                  Text = 'GNSS'#22825#32447#26410#25509#25110#34987#21098#26029
                end
                item
                  Text = 'GNSS'#22825#32447#30701#36335
                end
                item
                  Text = #32456#31471#20027#30005#28304#27424#21387
                end
                item
                  Text = #32456#31471#20027#30005#28304#25481#30005
                end
                item
                  Text = #32456#31471'LCD'#25110#26174#31034#22120#25925#38556
                end
                item
                  Text = 'TTS'#27169#22359#25925#38556
                end
                item
                  Text = #25668#20687#22836#25925#38556
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end
                item
                  Text = #24403#22825#32047#35745#39550#39542#36229#26102
                end
                item
                  Text = #36229#26102#20572#36710
                end
                item
                  Text = #36827#20986#21306#22495
                end
                item
                  Text = #36827#20986#36335#32447
                end
                item
                  Text = #36335#27573#34892#39542#26102#38388#19981#36275'/'#36807#38271
                end
                item
                  Text = #31105#34892#36335#27573#34892#39542
                end
                item
                  Text = #36710#36742'VSS'#25925#38556
                end
                item
                  Text = #36710#36742#27833#37327#24322#24120
                end
                item
                  Text = #36710#36742#34987#30423'('#36890#36807#36710#36742#38450#30423#22120')'
                end
                item
                  Text = #36710#36742#38750#27861#28857#28779
                end
                item
                  Text = #36710#36742#38750#27861#20301#31227
                end
                item
                  Text = #30896#25758#20391#32763#25253#35686
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end>
              TabOrder = 1
            end
            object BitBtn5: TBitBtn
              Left = 431
              Top = 21
              Width = 66
              Height = 21
              Caption = #20840#36873
              TabOrder = 2
              OnClick = BitBtn5Click
            end
            object CheckBox78: TCheckBox
              Left = 400
              Top = 0
              Width = 97
              Height = 17
              Caption = #25253#35686#25293#25668#24320#20851
              Font.Charset = GB2312_CHARSET
              Font.Color = clPurple
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnClick = CheckBox78Click
            end
          end
          object TabSheet11: TTabSheet
            Caption = #25253#35686#25293#25668#23384#20648
            ImageIndex = 3
            object cxCheckListBox3: TcxCheckListBox
              Left = 12
              Top = 2
              Width = 181
              Height = 435
              Hint = #25253#35686#25293#25668#23384#20648
              Items = <
                item
                  Text = #32039#24613#25253#35686
                end
                item
                  Text = #36229#36895#25253#35686
                end
                item
                  Text = #30130#21171#39550#39542
                end
                item
                  Text = #39044#35686
                end
                item
                  Text = 'GNSS'#27169#22359#21457#29983#25925#38556
                end
                item
                  Text = 'GNSS'#22825#32447#26410#25509#25110#34987#21098#26029
                end
                item
                  Text = 'GNSS'#22825#32447#30701#36335
                end
                item
                  Text = #32456#31471#20027#30005#28304#27424#21387
                end
                item
                  Text = #32456#31471#20027#30005#28304#25481#30005
                end
                item
                  Text = #32456#31471'LCD'#25110#26174#31034#22120#25925#38556
                end
                item
                  Text = 'TTS'#27169#22359#25925#38556
                end
                item
                  Text = #25668#20687#22836#25925#38556
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end
                item
                  Text = #24403#22825#32047#35745#39550#39542#36229#26102
                end
                item
                  Text = #36229#26102#20572#36710
                end
                item
                  Text = #36827#20986#21306#22495
                end
                item
                  Text = #36827#20986#36335#32447
                end
                item
                  Text = #36335#27573#34892#39542#26102#38388#19981#36275'/'#36807#38271
                end
                item
                  Text = #31105#34892#36335#27573#34892#39542
                end
                item
                  Text = #36710#36742'VSS'#25925#38556
                end
                item
                  Text = #36710#36742#27833#37327#24322#24120
                end
                item
                  Text = #36710#36742#34987#30423'('#36890#36807#36710#36742#38450#30423#22120')'
                end
                item
                  Text = #36710#36742#38750#27861#28857#28779
                end
                item
                  Text = #36710#36742#38750#27861#20301#31227
                end
                item
                  Text = #30896#25758#20391#32763#25253#35686
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end>
              TabOrder = 1
            end
            object BitBtn6: TBitBtn
              Left = 431
              Top = 21
              Width = 66
              Height = 21
              Caption = #20840#36873
              TabOrder = 2
              OnClick = BitBtn6Click
            end
            object CheckBox79: TCheckBox
              Left = 400
              Top = 0
              Width = 97
              Height = 17
              Caption = #25253#35686#25293#25668#23384#20648
              Font.Charset = GB2312_CHARSET
              Font.Color = clPurple
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnClick = CheckBox79Click
            end
          end
          object TabSheet12: TTabSheet
            Caption = #20851#38190#25253#35686#26631#24535
            ImageIndex = 4
            object cxCheckListBox4: TcxCheckListBox
              Left = 12
              Top = 4
              Width = 181
              Height = 424
              Hint = #20851#38190#25253#35686#26631#24535
              Items = <
                item
                  Text = #32039#24613#25253#35686
                end
                item
                  Text = #36229#36895#25253#35686
                end
                item
                  Text = #30130#21171#39550#39542
                end
                item
                  Text = #39044#35686
                end
                item
                  Text = 'GNSS'#27169#22359#21457#29983#25925#38556
                end
                item
                  Text = 'GNSS'#22825#32447#26410#25509#25110#34987#21098#26029
                end
                item
                  Text = 'GNSS'#22825#32447#30701#36335
                end
                item
                  Text = #32456#31471#20027#30005#28304#27424#21387
                end
                item
                  Text = #32456#31471#20027#30005#28304#25481#30005
                end
                item
                  Text = #32456#31471'LCD'#25110#26174#31034#22120#25925#38556
                end
                item
                  Text = 'TTS'#27169#22359#25925#38556
                end
                item
                  Text = #25668#20687#22836#25925#38556
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end
                item
                  Text = #24403#22825#32047#35745#39550#39542#36229#26102
                end
                item
                  Text = #36229#26102#20572#36710
                end
                item
                  Text = #36827#20986#21306#22495'/'#36335#32447
                end
                item
                  Text = #36827#20986#36335#32447
                end
                item
                  Text = #36335#27573#34892#39542#26102#38388#19981#36275'/'#36807#38271
                end
                item
                  Text = #31105#34892#36335#27573#34892#39542
                end
                item
                  Text = #36710#36742'VSS'#25925#38556
                end
                item
                  Text = #36710#36742#27833#37327#24322#24120
                end
                item
                  Text = #36710#36742#34987#30423'('#36890#36807#36710#36742#38450#30423#22120')'
                end
                item
                  Text = #36710#36742#38750#27861#28857#28779
                end
                item
                  Text = #36710#36742#38750#27861#20301#31227
                end
                item
                  Text = #30896#25758#20391#32763#25253#35686
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end>
              TabOrder = 1
            end
            object BitBtn7: TBitBtn
              Left = 431
              Top = 21
              Width = 66
              Height = 21
              Caption = #20840#36873
              TabOrder = 2
              OnClick = BitBtn7Click
            end
            object CheckBox80: TCheckBox
              Left = 400
              Top = 0
              Width = 97
              Height = 17
              Caption = #20851#38190#25253#35686#26631#24535
              Font.Charset = GB2312_CHARSET
              Font.Color = clPurple
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnClick = CheckBox80Click
            end
          end
          object TabSheet13: TTabSheet
            Caption = #23450#26102#25293#29031#25511#21046
            ImageIndex = 5
            object Label97: TLabel
              Left = 192
              Top = 11
              Width = 98
              Height = 13
              Caption = #23450#26102#26102#38388#21333#20301#65306' '
            end
            object Label98: TLabel
              Left = 192
              Top = 35
              Width = 98
              Height = 13
              Caption = #23450#26102#26102#38388#38388#38548#65306' '
            end
            object cxCheckListBox5: TcxCheckListBox
              Left = 8
              Top = 8
              Width = 177
              Height = 225
              Items = <
                item
                  Text = #25668#20687#36890#36947'1'#23450#26102#25293#29031
                end
                item
                  Text = #25668#20687#36890#36947'2'#23450#26102#25293#29031
                end
                item
                  Text = #25668#20687#36890#36947'3'#23450#26102#25293#29031
                end
                item
                  Text = #25668#20687#36890#36947'4'#23450#26102#25293#29031
                end
                item
                  Text = #25668#20687#36890#36947'5'#23450#26102#25293#29031
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end
                item
                  Text = #25668#20687#36890#36947'1'#23450#26102#25293#29031#21518#19978#20256
                end
                item
                  Text = #25668#20687#36890#36947'2'#23450#26102#25293#29031#21518#19978#20256
                end
                item
                  Text = #25668#20687#36890#36947'3'#23450#26102#25293#29031#21518#19978#20256
                end
                item
                  Text = #25668#20687#36890#36947'4'#23450#26102#25293#29031#21518#19978#20256
                end
                item
                  Text = #25668#20687#36890#36947'5'#23450#26102#25293#29031#21518#19978#20256
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end>
              TabOrder = 0
            end
            object CheckBox110: TCheckBox
              Left = 520
              Top = 8
              Width = 104
              Height = 17
              Caption = #23450#26102#25293#29031#25511#21046'  '
              TabOrder = 1
              OnClick = CheckBox110Click
            end
            object rbTimeUnitSecond: TRadioButton
              Left = 290
              Top = 9
              Width = 36
              Height = 17
              Caption = #31186
              Checked = True
              TabOrder = 2
              TabStop = True
            end
            object rbTimeUnitMinute: TRadioButton
              Left = 326
              Top = 9
              Width = 53
              Height = 17
              Caption = #20998#38047' '
              TabOrder = 3
            end
            object Edit38: TEdit
              Left = 290
              Top = 32
              Width = 79
              Height = 21
              TabOrder = 4
              Text = 'Edit38'
            end
          end
          object TabSheet14: TTabSheet
            Caption = #23450#36317#25293#29031#25511#21046
            ImageIndex = 6
            object Label99: TLabel
              Left = 192
              Top = 11
              Width = 98
              Height = 13
              Caption = #23450#36317#36317#31163#21333#20301#65306' '
            end
            object Label100: TLabel
              Left = 192
              Top = 35
              Width = 98
              Height = 13
              Caption = #23450#36317#36317#31163#38388#38548#65306' '
            end
            object cxCheckListBox6: TcxCheckListBox
              Left = 8
              Top = 8
              Width = 177
              Height = 225
              Items = <
                item
                  Text = #25668#20687#36890#36947'1'#23450#36317#25293#29031
                end
                item
                  Text = #25668#20687#36890#36947'2'#23450#36317#25293#29031
                end
                item
                  Text = #25668#20687#36890#36947'3'#23450#36317#25293#29031
                end
                item
                  Text = #25668#20687#36890#36947'4'#23450#36317#25293#29031
                end
                item
                  Text = #25668#20687#36890#36947'5'#23450#36317#25293#29031
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end
                item
                  Text = #25668#20687#36890#36947'1'#23450#36317#25293#29031#21518#19978#20256
                end
                item
                  Text = #25668#20687#36890#36947'2'#23450#36317#25293#29031#21518#19978#20256
                end
                item
                  Text = #25668#20687#36890#36947'3'#23450#36317#25293#29031#21518#19978#20256
                end
                item
                  Text = #25668#20687#36890#36947'4'#23450#36317#25293#29031#21518#19978#20256
                end
                item
                  Text = #25668#20687#36890#36947'5'#23450#36317#25293#29031#21518#19978#20256
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end
                item
                  Enabled = False
                  Text = #20445#30041
                end>
              TabOrder = 0
            end
            object CheckBox111: TCheckBox
              Left = 520
              Top = 8
              Width = 104
              Height = 17
              Caption = #23450#36317#25293#29031#25511#21046'  '
              TabOrder = 1
              OnClick = CheckBox111Click
            end
            object rbDisUnitMeter: TRadioButton
              Left = 290
              Top = 9
              Width = 36
              Height = 17
              Caption = #31859
              Checked = True
              TabOrder = 2
              TabStop = True
            end
            object rbDisUnitKilometer: TRadioButton
              Left = 326
              Top = 9
              Width = 53
              Height = 17
              Caption = #20844#37324
              TabOrder = 3
            end
            object Edit43: TEdit
              Left = 290
              Top = 32
              Width = 79
              Height = 21
              TabOrder = 4
              Text = 'Edit43'
            end
          end
        end
      end
      object TabSheet6: TTabSheet
        Caption = #35270#39057#26381#21153
        ImageIndex = 5
        TabVisible = False
        object Label27: TLabel
          Left = 24
          Top = 288
          Width = 91
          Height = 13
          Caption = #25991#26412#32534#30721#26041#24335#65306
          Visible = False
        end
        object Label28: TLabel
          Left = 63
          Top = 312
          Width = 52
          Height = 13
          Caption = #25552#31034#35821#65306
          Visible = False
        end
        object Label29: TLabel
          Left = 312
          Top = 284
          Width = 91
          Height = 13
          Caption = #25991#26412#32534#30721#26041#24335#65306
          Visible = False
        end
        object Label30: TLabel
          Left = 351
          Top = 308
          Width = 52
          Height = 13
          Caption = #25552#31034#35821#65306
          Visible = False
        end
        object Label31: TLabel
          Left = 50
          Top = 428
          Width = 65
          Height = 13
          Caption = #25552#31034#38388#38548#65306
          Visible = False
        end
        object Label32: TLabel
          Left = 248
          Top = 428
          Width = 98
          Height = 13
          Caption = #31186#65292'0'#34920#31034#19981#25552#31034
          Visible = False
        end
        object Label33: TLabel
          Left = 63
          Top = 452
          Width = 52
          Height = 13
          Caption = #25552#31034#35821#65306
          Visible = False
        end
        object Label34: TLabel
          Left = 346
          Top = 425
          Width = 65
          Height = 13
          Caption = #25552#31034#38388#38548#65306
          Visible = False
        end
        object Label35: TLabel
          Left = 536
          Top = 425
          Width = 98
          Height = 13
          Caption = #31186#65292'0'#34920#31034#19981#25552#31034
          Visible = False
        end
        object Label36: TLabel
          Left = 359
          Top = 449
          Width = 52
          Height = 13
          Caption = #25552#31034#35821#65306
          Visible = False
        end
        object CheckBox43: TCheckBox
          Left = -8
          Top = 266
          Width = 123
          Height = 17
          Caption = #36827#20837#37325#36710#25552#31034#35821
          Font.Charset = GB2312_CHARSET
          Font.Color = clPurple
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 14
          Visible = False
          OnClick = CheckBox43Click
        end
        object Edit431: TComboBox
          Left = 116
          Top = 280
          Width = 145
          Height = 21
          ItemHeight = 13
          TabOrder = 16
          Visible = False
          Items.Strings = (
            '0-GB2312'
            '1-GBK '
            '2-BIG5 '
            '3-UNICODE')
        end
        object Edit432: TEdit
          Left = 116
          Top = 309
          Width = 233
          Height = 21
          MaxLength = 200
          TabOrder = 18
          Text = 'Edit432'
          Visible = False
        end
        object CheckBox44: TCheckBox
          Left = 280
          Top = 263
          Width = 121
          Height = 17
          Caption = #36827#20837#31354#36710#25552#31034#35821
          Font.Charset = GB2312_CHARSET
          Font.Color = clPurple
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 13
          Visible = False
          OnClick = CheckBox44Click
        end
        object CheckBox45: TCheckBox
          Left = -8
          Top = 403
          Width = 116
          Height = 17
          Caption = #30130#21171#39550#39542#25552#37266
          Font.Charset = GB2312_CHARSET
          Font.Color = clPurple
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 20
          Visible = False
          OnClick = CheckBox45Click
        end
        object CheckBox46: TCheckBox
          Left = 288
          Top = 395
          Width = 116
          Height = 17
          Caption = #36229#36895#39550#39542#25552#37266
          Font.Charset = GB2312_CHARSET
          Font.Color = clPurple
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 19
          Visible = False
          OnClick = CheckBox46Click
        end
        object Edit441: TComboBox
          Left = 404
          Top = 276
          Width = 145
          Height = 21
          ItemHeight = 13
          TabOrder = 15
          Visible = False
          Items.Strings = (
            '0-GB2312'
            '1-GBK '
            '2-BIG5 '
            '3-UNICODE')
        end
        object Edit442: TEdit
          Left = 404
          Top = 305
          Width = 233
          Height = 21
          MaxLength = 200
          TabOrder = 17
          Text = 'Edit442'
          Visible = False
        end
        object Edit451: TEdit
          Left = 116
          Top = 421
          Width = 121
          Height = 21
          Hint = '0'#65374'255'
          MaxLength = 3
          TabOrder = 22
          Text = 'Edit451'
          Visible = False
          OnChange = Edit12Change
          OnKeyPress = Edit1KeyPress
        end
        object Edit452: TEdit
          Left = 116
          Top = 449
          Width = 233
          Height = 21
          MaxLength = 50
          TabOrder = 24
          Text = 'Edit452'
          Visible = False
        end
        object Edit461: TEdit
          Left = 412
          Top = 419
          Width = 121
          Height = 21
          Hint = '0'#65374'255'
          MaxLength = 3
          TabOrder = 21
          Text = 'Edit461'
          Visible = False
          OnChange = Edit12Change
          OnKeyPress = Edit1KeyPress
        end
        object Edit462: TEdit
          Left = 412
          Top = 445
          Width = 233
          Height = 21
          MaxLength = 50
          TabOrder = 23
          Text = 'Edit462'
          Visible = False
        end
        object RzCheckBoxSelectPageNotice: TRzCheckBox
          Left = 560
          Top = 0
          Width = 72
          Height = 17
          Caption = #36873#20013#26412#39029
          State = cbUnchecked
          TabOrder = 0
          Visible = False
          OnClick = RzCheckBoxSelectPageCommunicationClick
        end
        object CheckBox32: TCheckBox
          Left = 104
          Top = 54
          Width = 153
          Height = 17
          Caption = #35270#39057#26381#21153#22120#21327#35758#27169#24335
          Font.Charset = GB2312_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Visible = False
          OnClick = CheckBox1Click
        end
        object Edit32: TComboBox
          Left = 304
          Top = 52
          Width = 121
          Height = 21
          Hint = #35270#39057#26381#21153#22120#21327#35758#27169#24335
          Font.Charset = GB2312_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 2
          Visible = False
          OnKeyPress = Edit32KeyPress
          Items.Strings = (
            'TCP'
            'UDP')
        end
        object CheckBox99: TCheckBox
          Left = 104
          Top = 83
          Width = 121
          Height = 17
          Caption = #35270#39057#26381#21153#22120' APN'
          Font.Charset = GB2312_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          Visible = False
          OnClick = CheckBox1Click
        end
        object Edit99: TEdit
          Left = 304
          Top = 81
          Width = 121
          Height = 21
          Hint = #35270#39057#26381#21153#22120' APN'
          Font.Charset = GB2312_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          Text = 'Edit99'
          Visible = False
        end
        object CheckBox50: TCheckBox
          Left = 104
          Top = 112
          Width = 209
          Height = 17
          Caption = #35270#39057#26381#21153#22120#26080#32447#36890#20449#25320#21495#29992#25143#21517
          Font.Charset = GB2312_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          Visible = False
          OnClick = CheckBox1Click
        end
        object Edit50: TEdit
          Left = 304
          Top = 110
          Width = 121
          Height = 21
          Hint = #35270#39057#26381#21153#22120#26080#32447#36890#20449#25320#21495#29992#25143#21517
          Font.Charset = GB2312_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          Text = 'Edit50'
          Visible = False
        end
        object CheckBox51: TCheckBox
          Left = 104
          Top = 141
          Width = 193
          Height = 17
          Caption = #35270#39057#26381#21153#22120#26080#32447#36890#20449#25320#21495#23494#30721
          Font.Charset = GB2312_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          Visible = False
          OnClick = CheckBox1Click
        end
        object Edit51: TEdit
          Left = 304
          Top = 139
          Width = 121
          Height = 21
          Hint = #35270#39057#26381#21153#22120#26080#32447#36890#20449#25320#21495#23494#30721
          Font.Charset = GB2312_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          Text = 'Edit51'
          Visible = False
        end
        object CheckBox52: TCheckBox
          Left = 104
          Top = 170
          Width = 113
          Height = 17
          Caption = #35270#39057#26381#21153#22120#22320#22336
          Font.Charset = GB2312_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 9
          Visible = False
          OnClick = CheckBox1Click
        end
        object Edit52: TEdit
          Left = 304
          Top = 168
          Width = 121
          Height = 21
          Hint = #35270#39057#26381#21153#22120#22320#22336
          Font.Charset = GB2312_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 10
          Text = 'Edit52'
          Visible = False
        end
        object CheckBox53: TCheckBox
          Left = 104
          Top = 198
          Width = 121
          Height = 17
          Caption = #35270#39057#26381#21153#22120#31471#21475' '
          Font.Charset = GB2312_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 11
          Visible = False
          OnClick = CheckBox1Click
        end
        object Edit53: TEdit
          Left = 304
          Top = 196
          Width = 121
          Height = 21
          Hint = #35270#39057#26381#21153#22120#31471#21475' '
          Font.Charset = GB2312_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          MaxLength = 4
          ParentFont = False
          TabOrder = 12
          Text = 'Edit53'
          Visible = False
          OnKeyPress = Edit1KeyPress
        end
      end
      object TabSheet1: TTabSheet
        Caption = #20854#23427
        object GroupBox8: TGroupBox
          Left = 0
          Top = 271
          Width = 648
          Height = 74
          Align = alBottom
          Caption = #35745#20215#22120
          Font.Charset = GB2312_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Visible = False
          object Label70: TLabel
            Left = 314
            Top = 17
            Width = 34
            Height = 13
            Caption = '0'#65374'99'
            Visible = False
          end
          object Label72: TLabel
            Left = 224
            Top = 48
            Width = 13
            Height = 13
            Caption = #24180
            Visible = False
          end
          object Label73: TLabel
            Left = 260
            Top = 48
            Width = 13
            Height = 13
            Caption = #26376
            Visible = False
          end
          object Label74: TLabel
            Left = 296
            Top = 48
            Width = 13
            Height = 13
            Caption = #26085
            Visible = False
          end
          object Label75: TLabel
            Left = 333
            Top = 48
            Width = 13
            Height = 13
            Caption = #26102
            Visible = False
          end
          object CheckBox27: TCheckBox
            Left = 42
            Top = 48
            Width = 138
            Height = 17
            Caption = #35745#20215#22120#33829#36816#26102#38388#38480#21046
            TabOrder = 4
            Visible = False
            OnClick = CheckBox27Click
          end
          object CheckBox1: TCheckBox
            Left = 43
            Top = 16
            Width = 145
            Height = 17
            Caption = #35745#20215#22120#33829#36816#27425#25968#38480#21046' '
            TabOrder = 1
            Visible = False
            OnClick = CheckBox1Click
          end
          object Edit1: TEdit
            Left = 187
            Top = 14
            Width = 121
            Height = 21
            Hint = #35745#20215#22120#33829#36816#27425#25968#38480#21046' '
            MaxLength = 2
            TabOrder = 0
            Text = 'Edit1'
            Visible = False
            OnKeyPress = Edit1KeyPress
          end
          object Date27: TDateTimePicker
            Left = 411
            Top = 46
            Width = 97
            Height = 21
            Date = 40138.665446678240000000
            Time = 40138.665446678240000000
            TabOrder = 2
            Visible = False
          end
          object Time27: TDateTimePicker
            Left = 515
            Top = 46
            Width = 89
            Height = 21
            Date = 40138.625000000000000000
            Time = 40138.625000000000000000
            Kind = dtkTime
            TabOrder = 3
            Visible = False
          end
          object EditYear: TEdit
            Left = 187
            Top = 44
            Width = 35
            Height = 21
            Hint = #35745#20215#22120#33829#36816#26102#38388#38480#21046#24180
            MaxLength = 4
            TabOrder = 5
            Text = '0000'
            Visible = False
            OnKeyPress = Edit1KeyPress
          end
          object EditMonth: TEdit
            Left = 238
            Top = 44
            Width = 20
            Height = 21
            Hint = #35745#20215#22120#33829#36816#26102#38388#38480#21046#26376
            MaxLength = 2
            TabOrder = 6
            Text = '00'
            Visible = False
            OnKeyPress = Edit1KeyPress
          end
          object EditDay: TEdit
            Left = 274
            Top = 44
            Width = 20
            Height = 21
            Hint = #35745#20215#22120#33829#36816#26102#38388#38480#21046#26085
            MaxLength = 2
            TabOrder = 7
            Text = '00'
            Visible = False
            OnKeyPress = Edit1KeyPress
          end
          object EditHour: TEdit
            Left = 310
            Top = 44
            Width = 20
            Height = 21
            Hint = #35745#20215#22120#33829#36816#26102#38388#38480#21046#26102
            MaxLength = 2
            TabOrder = 8
            Text = '00'
            Visible = False
            OnKeyPress = Edit1KeyPress
          end
        end
        object GroupBox7: TGroupBox
          Left = 0
          Top = 0
          Width = 648
          Height = 102
          Align = alTop
          Caption = #36710#36742#20449#24687
          TabOrder = 0
          object CheckBox74: TCheckBox
            Left = 44
            Top = 16
            Width = 97
            Height = 17
            Caption = #36710#36742#37324#31243#34920
            TabOrder = 1
            OnClick = CheckBox1Click
          end
          object CheckBox75: TCheckBox
            Left = 44
            Top = 44
            Width = 97
            Height = 17
            Caption = #30465#22495'ID'
            TabOrder = 3
            OnClick = CheckBox1Click
          end
          object CheckBox76: TCheckBox
            Left = 344
            Top = 44
            Width = 97
            Height = 17
            Caption = #24066#22495'ID'
            TabOrder = 5
            OnClick = CheckBox1Click
          end
          object Edit74: TEdit
            Left = 148
            Top = 14
            Width = 121
            Height = 21
            Hint = #36710#36742#37324#31243#34920
            MaxLength = 8
            TabOrder = 2
            Text = 'Edit74'
            OnChange = Edit60Change
            OnKeyPress = Edit1KeyPress
          end
          object Edit76: TEdit
            Left = 428
            Top = 42
            Width = 121
            Height = 21
            Hint = #24066#22495'ID'
            MaxLength = 8
            TabOrder = 6
            Text = 'Edit76'
            OnChange = Edit11Change
            OnKeyPress = Edit1KeyPress
          end
          object Edit75: TEdit
            Left = 148
            Top = 42
            Width = 121
            Height = 21
            Hint = #30465#22495'ID'
            MaxLength = 8
            TabOrder = 4
            Text = 'Edit75'
            OnChange = Edit11Change
            OnKeyPress = Edit1KeyPress
          end
          object RzCheckBoxSelectPageElse: TRzCheckBox
            Left = 532
            Top = 9
            Width = 72
            Height = 17
            Caption = #36873#20013#26412#39029
            State = cbUnchecked
            TabOrder = 0
            OnClick = RzCheckBoxSelectPageElseClick
          end
          object CheckBox88: TCheckBox
            Left = 44
            Top = 72
            Width = 97
            Height = 17
            Caption = #36710#29260#21495
            TabOrder = 7
            OnClick = CheckBox1Click
          end
          object Edit88: TEdit
            Left = 148
            Top = 70
            Width = 121
            Height = 21
            TabOrder = 8
            Text = 'Edit88'
          end
          object CheckBox89: TCheckBox
            Left = 344
            Top = 72
            Width = 97
            Height = 17
            Caption = #36710#29260#39068#33394
            TabOrder = 9
            OnClick = CheckBox1Click
          end
          object Edit89: TComboBox
            Left = 428
            Top = 70
            Width = 121
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 10
            Items.Strings = (
              #34013#29260
              #40644#29260
              #40657#29260
              #30333#29260
              #20854#20182)
          end
        end
        object GroupBox1: TGroupBox
          Left = 0
          Top = 345
          Width = 648
          Height = 49
          Align = alBottom
          Caption = 'MCU'#24405#38899
          Font.Charset = GB2312_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Visible = False
          object Label66: TLabel
            Left = 586
            Top = 23
            Width = 13
            Height = 13
            Caption = #20998
            Visible = False
          end
          object CheckBox100: TCheckBox
            Left = 10
            Top = 19
            Width = 97
            Height = 17
            Caption = 'MCU'#24405#38899#27169#24335
            TabOrder = 0
            Visible = False
            OnClick = CheckBox1Click
          end
          object CheckBox28: TCheckBox
            Left = 298
            Top = 21
            Width = 153
            Height = 17
            Caption = 'MCU'#24405#38899#25991#20214#26368#22823#26102#38271
            TabOrder = 2
            Visible = False
            OnClick = CheckBox1Click
          end
          object Edit100: TComboBox
            Left = 122
            Top = 17
            Width = 145
            Height = 21
            Hint = 'MCU'#24405#38899#27169#24335
            ItemHeight = 13
            TabOrder = 1
            Visible = False
            OnKeyPress = Edit32KeyPress
            Items.Strings = (
              #20840#31243#24405#38899
              #32763#29260#24405#38899)
          end
          object Edit28: TEdit
            Left = 458
            Top = 19
            Width = 121
            Height = 21
            Hint = 'MCU'#24405#38899#25991#20214#26368#22823#26102#38271
            MaxLength = 3
            TabOrder = 3
            Text = 'Edit28'
            Visible = False
            OnKeyPress = Edit1KeyPress
          end
        end
        object GroupBox2: TGroupBox
          Left = 0
          Top = 394
          Width = 648
          Height = 78
          Align = alBottom
          Caption = #20854#20182
          Font.Charset = GB2312_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          Visible = False
          object Label67: TLabel
            Left = 259
            Top = 20
            Width = 13
            Height = 13
            Caption = #31186
            Visible = False
          end
          object Label68: TLabel
            Left = 540
            Top = 20
            Width = 13
            Height = 13
            Caption = #31186
            Visible = False
          end
          object Label69: TLabel
            Left = 335
            Top = 52
            Width = 13
            Height = 13
            Caption = #31186
            Visible = False
          end
          object Label71: TLabel
            Left = 533
            Top = 37
            Width = 68
            Height = 13
            Caption = '0-9; 0'#26368#23567
            Visible = False
          end
          object CheckBox29: TCheckBox
            Left = 8
            Top = 18
            Width = 129
            Height = 17
            Caption = 'LCD'#24515#36339#26102#38388#38388#38548
            TabOrder = 0
            Visible = False
            OnClick = CheckBox1Click
          end
          object CheckBox30: TCheckBox
            Left = 289
            Top = 18
            Width = 129
            Height = 17
            Caption = 'LED'#24515#36339#26102#38388#38388#38548
            TabOrder = 2
            Visible = False
            OnClick = CheckBox1Click
          end
          object Edit29: TEdit
            Left = 136
            Top = 16
            Width = 121
            Height = 21
            Hint = 'LCD'#24515#36339#26102#38388#38388#38548
            MaxLength = 2
            TabOrder = 1
            Text = 'Edit29'
            Visible = False
            OnKeyPress = Edit1KeyPress
          end
          object Edit30: TEdit
            Left = 417
            Top = 16
            Width = 121
            Height = 21
            Hint = 'LED'#24515#36339#26102#38388#38388#38548
            MaxLength = 2
            TabOrder = 3
            Text = 'Edit30'
            Visible = False
            OnKeyPress = Edit1KeyPress
          end
          object CheckBox31: TCheckBox
            Left = 8
            Top = 50
            Width = 201
            Height = 17
            Caption = 'ACC OFF'#21518#36827#20837#20241#30496#27169#24335#30340#26102#38388
            TabOrder = 4
            Visible = False
            OnClick = CheckBox1Click
          end
          object Edit31: TEdit
            Left = 208
            Top = 48
            Width = 121
            Height = 21
            Hint = 'ACC OFF'#21518#36827#20837#20241#30496#27169#24335#30340#26102#38388
            MaxLength = 4
            TabOrder = 5
            Text = 'Edit31'
            Visible = False
            OnKeyPress = Edit1KeyPress
          end
          object CheckBox26: TCheckBox
            Left = 317
            Top = 35
            Width = 97
            Height = 17
            Caption = 'TTS'#25773#25253#38899#37327
            TabOrder = 6
            Visible = False
            OnClick = CheckBox1Click
          end
          object Edit26: TEdit
            Left = 408
            Top = 33
            Width = 121
            Height = 21
            Hint = 'TTS'#25773#25253#38899#37327
            MaxLength = 1
            TabOrder = 7
            Text = 'Edit26'
            Visible = False
            OnKeyPress = Edit1KeyPress
          end
        end
        object GroupBox6: TGroupBox
          Left = 0
          Top = 102
          Width = 648
          Height = 165
          Align = alTop
          Caption = 'GPS'#21151#33021#21442#25968
          TabOrder = 4
          object CheckBox93: TCheckBox
            Left = 44
            Top = 22
            Width = 76
            Height = 17
            Caption = 'SIM'#21345#21495
            TabOrder = 0
            OnClick = CheckBox1Click
          end
          object Edit93: TEdit
            Left = 148
            Top = 18
            Width = 121
            Height = 21
            MaxLength = 12
            TabOrder = 1
            Text = 'Edit93'
            OnKeyPress = Edit1KeyPress
          end
          object CheckBox94: TCheckBox
            Left = 344
            Top = 22
            Width = 105
            Height = 18
            Caption = #32456#31471#32500#25252#23494#30721
            TabOrder = 2
            OnClick = CheckBox1Click
          end
          object Edit94: TEdit
            Left = 448
            Top = 18
            Width = 121
            Height = 21
            MaxLength = 8
            TabOrder = 3
            Text = 'Edit94'
            OnKeyPress = Edit1KeyPress
          end
          object GroupBox9: TGroupBox
            Left = 44
            Top = 47
            Width = 225
            Height = 80
            TabOrder = 4
            object Label85: TLabel
              Left = 7
              Top = 23
              Width = 104
              Height = 13
              Caption = #36827#20837#19968#32423#20241#30496#26102#38388
            end
            object Label86: TLabel
              Left = 7
              Top = 49
              Width = 104
              Height = 13
              Caption = #36827#20837#28145#24230#20241#30496#26102#38388
            end
            object Edit10: TEdit
              Left = 114
              Top = 45
              Width = 102
              Height = 21
              TabOrder = 0
              Text = 'Edit10'
              OnChange = Edit60Change
              OnKeyPress = Edit1KeyPress
            end
            object Edit37: TEdit
              Left = 114
              Top = 19
              Width = 102
              Height = 21
              TabOrder = 1
              Text = 'Edit37'
              OnChange = Edit60Change
              OnKeyPress = Edit1KeyPress
            end
          end
          object CheckBox95: TCheckBox
            Left = 44
            Top = 44
            Width = 97
            Height = 17
            Caption = #21151#32791#25511#21046#21442#25968
            TabOrder = 5
            OnClick = CheckBox1Click
          end
          object GroupBox10: TGroupBox
            Left = 344
            Top = 47
            Width = 198
            Height = 80
            TabOrder = 6
            object Label87: TLabel
              Left = 19
              Top = 23
              Width = 52
              Height = 13
              Caption = #25293#29031#27425#25968
            end
            object Label88: TLabel
              Left = 19
              Top = 49
              Width = 52
              Height = 13
              Caption = #25293#29031#38388#38548
            end
            object Edit27: TEdit
              Left = 75
              Top = 16
              Width = 99
              Height = 21
              TabOrder = 0
              Text = 'Edit27'
              OnChange = Edit27Change
              OnKeyPress = Edit1KeyPress
            end
            object Edit35: TEdit
              Left = 75
              Top = 48
              Width = 99
              Height = 21
              TabOrder = 1
              Text = 'Edit35'
              OnChange = Edit35Change
              OnKeyPress = Edit1KeyPress
            end
          end
          object CheckBox96: TCheckBox
            Left = 344
            Top = 44
            Width = 124
            Height = 17
            Caption = #25253#35686#25293#29031#25511#21046#21442#25968
            TabOrder = 7
            OnClick = CheckBox1Click
          end
          object CheckBox97: TCheckBox
            Left = 44
            Top = 136
            Width = 69
            Height = 17
            Caption = #32456#31471'ID'
            TabOrder = 8
            OnClick = CheckBox1Click
          end
          object Edit97: TEdit
            Left = 192
            Top = 134
            Width = 77
            Height = 21
            Hint = #32456#31471#29983#20135#27969#27700#21495
            ParentShowHint = False
            ShowHint = False
            TabOrder = 9
            Text = 'Edit97'
            OnKeyPress = Edit1KeyPress
          end
          object date97: TDateTimePicker
            Left = 124
            Top = 134
            Width = 66
            Height = 21
            Hint = #32456#31471#29983#20135#26085#26399
            Date = 40774.639504293980000000
            Format = 'yyMMdd'
            Time = 40774.639504293980000000
            MaxDate = 73050.000000000000000000
            MinDate = 36526.000000000000000000
            ParentShowHint = False
            ShowHint = False
            TabOrder = 10
          end
        end
      end
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 474
    Top = 20
  end
end
