inherited ParamAllFrm: TParamAllFrm
  Left = 305
  Top = 59
  BorderStyle = bsSingle
  ClientHeight = 581
  ClientWidth = 797
  Font.Charset = ANSI_CHARSET
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 797
    inherited Label2: TLabel
      Visible = False
    end
    inherited EditCar: TEdit
      Visible = False
    end
    inherited RzCheckBoxSelectAll: TRzCheckBox
      Width = 95
    end
  end
  inherited Panel2: TPanel
    Top = 544
    Width = 797
    inherited BitBtnSet: TBitBtn
      Left = 381
      Width = 106
      Caption = #35774#32622#21442#25968' &S'
    end
    inherited BitBtn2: TBitBtn
      Left = 487
      Width = 106
      Caption = #20572#27490#35774#32622' &C'
      ModalResult = 0
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
    end
    inherited ProgressBar1: TProgressBar
      Width = 359
    end
    object BitBtn1: TBitBtn
      Left = 593
      Top = 6
      Width = 86
      Height = 25
      Cancel = True
      Caption = #20851#38381
      TabOrder = 3
      OnClick = BitBtn1Click
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
  end
  inherited Panel3: TPanel
    Width = 797
    Height = 498
    inherited PageControl1: TPageControl
      Width = 643
      Height = 496
      inherited TabSheet2: TTabSheet
        inherited Label50: TLabel
          Left = 270
          Top = 360
        end
        inherited Label51: TLabel
          Left = 249
          Top = 10
        end
        inherited Label52: TLabel
          Left = 612
          Top = 359
        end
        inherited Label53: TLabel
          Top = 294
        end
        inherited Label54: TLabel
          Left = 704
          Top = 288
        end
        inherited Label55: TLabel
          Left = 270
          Top = 92
          Visible = True
        end
        inherited Label56: TLabel
          Top = 318
        end
        inherited Label57: TLabel
          Left = 270
          Top = 387
          Visible = True
        end
        inherited Label60: TLabel
          Top = 304
        end
        inherited Label3: TLabel
          Top = 390
        end
        inherited Label4: TLabel
          Top = 333
        end
        inherited Label5: TLabel
          Left = 642
          Top = 370
        end
        inherited Label6: TLabel
          Left = 270
          Top = 414
        end
        inherited Label7: TLabel
          Left = 270
          Top = 441
        end
        inherited Label8: TLabel
          Left = 612
          Top = 387
        end
        inherited Label9: TLabel
          Left = 612
          Top = 414
        end
        inherited Label23: TLabel
          Left = 270
          Top = 37
        end
        inherited Label24: TLabel
          Left = 154
          Top = 66
        end
        inherited Label59: TLabel
          Top = 362
        end
        inherited Label62: TLabel
          Top = 318
        end
        inherited Label76: TLabel
          Left = 270
          Top = 65
        end
        inherited Label78: TLabel
          Left = 270
          Top = 10
        end
        inherited Label79: TLabel
          Left = 270
          Top = 333
        end
        inherited Label81: TLabel
          Left = 612
          Top = 332
        end
        inherited Label89: TLabel
          Left = 612
          Top = 441
        end
        inherited RzCheckBoxSelectPageCommunication: TRzCheckBox
          Left = 542
          Top = 7
          Width = 85
          TabOrder = 28
        end
        inherited CheckBox35: TCheckBox
          TabOrder = 29
        end
        inherited CheckBox6: TCheckBox
          Left = 6
          Top = 116
          Width = 111
          TabOrder = 30
        end
        inherited CheckBox7: TCheckBox
          Left = 6
          Top = 197
          Width = 151
          TabOrder = 31
        end
        inherited CheckBox8: TCheckBox
          Left = 645
          TabOrder = 32
        end
        inherited CheckBox9: TCheckBox
          Left = 329
          Top = 197
          Width = 147
          TabOrder = 33
        end
        inherited CheckBox10: TCheckBox
          Left = 644
          TabOrder = 34
        end
        inherited CheckBox11: TCheckBox
          Left = 329
          Top = 143
          Width = 121
          TabOrder = 35
        end
        inherited CheckBox12: TCheckBox
          Left = 6
          Top = 8
          Width = 139
          TabOrder = 36
        end
        inherited CheckBox13: TCheckBox
          Left = 329
          Top = 35
          Width = 145
          TabOrder = 37
        end
        inherited Edit6: TEdit
          Left = 154
          Top = 114
          TabOrder = 7
        end
        inherited Edit7: TEdit
          Left = 154
          Top = 195
          TabOrder = 13
        end
        inherited Edit8: TEdit
          Left = 650
          TabOrder = 38
        end
        inherited Edit9: TEdit
          Left = 495
          Top = 195
          TabOrder = 14
        end
        inherited Edit82: TEdit
          Top = 100
          TabOrder = 39
        end
        inherited Edit11: TEdit
          Left = 495
          Top = 141
          TabOrder = 10
        end
        inherited Edit12: TEdit
          Left = 154
          Top = 6
          TabOrder = 0
        end
        inherited Edit13: TEdit
          Left = 495
          Top = 33
          TabOrder = 2
        end
        inherited CheckBox34: TCheckBox
          Left = 6
          Top = 35
          Width = 160
          TabOrder = 40
        end
        inherited Edit351: TEdit
          Left = 154
          Top = 356
          TabOrder = 21
        end
        inherited Edit34: TEdit
          Left = 154
          Top = 33
          TabOrder = 1
        end
        inherited Edit352: TEdit
          Left = 495
          Top = 356
          TabOrder = 22
        end
        inherited Edit353: TEdit
          Top = 290
          TabOrder = 41
        end
        inherited Edit354: TEdit
          Top = 290
          TabOrder = 42
        end
        inherited Edit355: TEdit
          Top = 314
          TabOrder = 43
        end
        inherited CheckBox14: TCheckBox
          Left = 6
          Top = 304
          Width = 139
          TabOrder = 87
        end
        inherited CheckBox15: TCheckBox
          Left = 329
          Top = 304
          Width = 121
          TabOrder = 45
        end
        inherited Edit59: TEdit
          Left = 154
          Top = 87
          TabOrder = 5
        end
        inherited Edit60: TEdit
          Left = 495
          Top = 87
          TabOrder = 6
        end
        inherited Edit356: TEdit
          Top = 314
          TabOrder = 90
        end
        inherited Edit357: TEdit
          Top = 329
          TabOrder = 47
        end
        inherited Edit358: TEdit
          Top = 329
          TabOrder = 48
        end
        inherited Edit14: TComboBox
          Left = 154
          Top = 302
          TabOrder = 17
        end
        inherited Edit15: TComboBox
          Left = 495
          Top = 302
          TabOrder = 18
        end
        inherited CheckBox59: TCheckBox
          Left = 6
          Top = 89
          Width = 148
          TabOrder = 49
        end
        inherited CheckBox60: TCheckBox
          Left = 329
          Top = 89
          Width = 130
          TabOrder = 50
        end
        inherited CheckBox61: TCheckBox
          Left = 6
          Top = 143
          Width = 118
          TabOrder = 51
        end
        inherited Edit61: TEdit
          Left = 154
          Top = 141
          TabOrder = 9
        end
        inherited CheckBox62: TCheckBox
          Left = 6
          Top = 170
          Width = 111
          TabOrder = 52
        end
        inherited Edit62: TEdit
          Left = 154
          Top = 168
          TabOrder = 11
        end
        inherited CheckBox63: TCheckBox
          Left = 329
          Top = 116
          Width = 113
          TabOrder = 53
        end
        inherited Edit63: TEdit
          Left = 495
          Top = 114
          TabOrder = 8
        end
        inherited CheckBox64: TCheckBox
          Left = 329
          Top = 170
          Width = 121
          TabOrder = 54
        end
        inherited Edit64: TEdit
          Left = 495
          Top = 168
          TabOrder = 12
        end
        inherited CheckBox65: TCheckBox
          Left = 6
          Top = 224
          Width = 119
          TabOrder = 55
        end
        inherited Edit65: TEdit
          Left = 154
          Top = 222
          TabOrder = 15
        end
        inherited CheckBox351: TCheckBox
          Left = 6
          Top = 358
          Width = 143
          TabOrder = 88
        end
        inherited CheckBox352: TCheckBox
          Left = 329
          Top = 358
          Width = 121
          TabOrder = 89
        end
        inherited CheckBox353: TCheckBox
          Top = 292
          TabOrder = 58
        end
        inherited CheckBox354: TCheckBox
          Top = 292
          TabOrder = 59
        end
        inherited CheckBox355: TCheckBox
          Top = 316
          TabOrder = 60
        end
        inherited CheckBox356: TCheckBox
          Top = 316
          TabOrder = 61
        end
        inherited CheckBox357: TCheckBox
          Top = 331
          TabOrder = 62
        end
        inherited CheckBox358: TCheckBox
          Top = 331
          TabOrder = 63
        end
        inherited CheckBox359: TCheckBox
          Top = 359
          TabOrder = 64
        end
        inherited Edit359: TEdit
          Top = 357
          TabOrder = 65
        end
        inherited CheckBox360: TCheckBox
          Top = 359
          TabOrder = 66
        end
        inherited Edit360: TEdit
          Top = 357
          TabOrder = 67
        end
        inherited CheckBox361: TCheckBox
          Left = 6
          Top = 385
          Width = 135
          TabOrder = 68
        end
        inherited Edit361: TEdit
          Left = 154
          Top = 383
          TabOrder = 23
        end
        inherited CheckBox362: TCheckBox
          Left = 6
          Top = 412
          Width = 159
          TabOrder = 69
        end
        inherited Edit362: TEdit
          Left = 154
          Top = 410
          TabOrder = 25
        end
        inherited CheckBox363: TCheckBox
          Left = 6
          Top = 439
          Width = 119
          TabOrder = 70
        end
        inherited Edit363: TEdit
          Left = 154
          Top = 437
          TabOrder = 27
        end
        inherited CheckBox364: TCheckBox
          Left = 329
          Top = 385
          Width = 129
          TabOrder = 71
        end
        inherited Edit364: TEdit
          Left = 495
          Top = 383
          TabOrder = 24
        end
        inherited CheckBox365: TCheckBox
          Left = 329
          Top = 412
          Width = 153
          TabOrder = 72
        end
        inherited Edit365: TEdit
          Left = 495
          Top = 410
          TabOrder = 26
        end
        inherited CheckBox81: TCheckBox
          Top = 78
          TabOrder = 73
        end
        inherited CheckBox82: TCheckBox
          Top = 103
          TabOrder = 74
        end
        inherited Edit81: TEdit
          Top = 75
          TabOrder = 75
        end
        inherited date81: TDateTimePicker
          TabOrder = 76
        end
        inherited time81: TDateTimePicker
          TabOrder = 77
        end
        inherited CheckBox83: TCheckBox
          Left = 651
          Top = 222
          TabOrder = 78
        end
        inherited Edit83: TEdit
          Top = 220
          TabOrder = 79
        end
        inherited CheckBox84: TCheckBox
          Left = 659
          TabOrder = 80
        end
        inherited Edit84: TEdit
          Left = 665
          TabOrder = 81
        end
        inherited CheckBox33: TCheckBox
          Left = 651
          Top = 245
          TabOrder = 82
        end
        inherited Edit33: TComboBox
          Top = 243
          TabOrder = 83
        end
        inherited CheckBox85: TCheckBox
          Left = 6
          Width = 160
          TabOrder = 84
        end
        inherited Edit85: TEdit
          Left = 154
          TabOrder = 3
        end
        inherited CheckBox86: TCheckBox
          Left = 329
          Top = 62
          Width = 145
          TabOrder = 85
        end
        inherited Edit86: TEdit
          Left = 495
          Top = 60
          TabOrder = 4
        end
        inherited CheckBox87: TCheckBox
          Left = 329
          Top = 224
          Width = 125
          TabOrder = 86
        end
        inherited Edit87: TEdit
          Left = 495
          Top = 222
          TabOrder = 16
        end
        inherited Edit90: TEdit
          Left = 154
          Top = 329
          TabOrder = 19
          OnChange = nil
          OnKeyPress = nil
        end
        inherited Edit91: TEdit
          Left = 495
          Top = 329
          TabOrder = 20
          OnChange = nil
          OnKeyPress = nil
        end
        inherited CheckBox90: TCheckBox
          Left = 6
          Top = 331
          Width = 111
        end
        inherited CheckBox91: TCheckBox
          Left = 329
          Top = 331
          Width = 105
        end
        inherited CheckBox98: TCheckBox
          Left = 329
          Top = 439
        end
        inherited Edit98: TEdit
          Left = 495
          Top = 437
        end
        inherited CheckBox102: TCheckBox
          Left = 6
          Top = 250
          Width = 144
        end
        inherited CheckBox103: TCheckBox
          Left = 329
          Top = 250
        end
        inherited Edit102: TEdit
          Left = 154
          Top = 248
        end
        inherited Edit103: TEdit
          Left = 495
          Top = 248
        end
        inherited CheckBox104: TCheckBox
          Left = 6
          Top = 277
        end
        inherited Edit104: TEdit
          Left = 154
          Top = 275
        end
        inherited CheckBox105: TCheckBox
          Left = 329
          Top = 277
        end
        inherited Edit105: TEdit
          Left = 495
          Top = 275
        end
      end
      inherited TabSheet3: TTabSheet
        inherited Label48: TLabel
          Left = 412
          Top = 243
        end
        inherited Label63: TLabel
          Left = 412
          Top = 278
        end
        inherited CheckBox2: TCheckBox
          Left = 94
          Top = 308
          Width = 112
          TabOrder = 21
        end
        inherited CheckBox3: TCheckBox
          Left = 94
          Top = 65
          Width = 112
          TabOrder = 12
        end
        inherited CheckBox4: TCheckBox
          Left = 94
          Top = 135
          Width = 162
          TabOrder = 14
        end
        inherited CheckBox5: TCheckBox
          Left = 94
          Top = 170
          Width = 186
          TabOrder = 15
        end
        inherited Edit2: TEdit
          Top = 306
          TabOrder = 9
        end
        inherited Edit3: TEdit
          Top = 63
          TabOrder = 1
        end
        inherited Edit4: TEdit
          Top = 133
          TabOrder = 3
        end
        inherited Edit5: TEdit
          Top = 168
          TabOrder = 4
        end
        inherited CheckBox36: TCheckBox
          Left = 438
          Top = 302
          TabOrder = 19
        end
        inherited CheckBox57: TCheckBox
          Left = 94
          Top = 205
          Width = 146
          TabOrder = 16
        end
        inherited CheckBox55: TCheckBox
          Left = 94
          Top = 240
          Width = 146
          TabOrder = 17
        end
        inherited Edit57: TComboBox
          Top = 203
          TabOrder = 6
        end
        inherited Edit36: TEdit
          Top = 300
          TabOrder = 20
        end
        inherited Edit55: TEdit
          Top = 238
          TabOrder = 7
        end
        inherited RzCheckBoxSelectPageCall: TRzCheckBox
          Left = 549
          Top = 3
          Width = 83
          TabOrder = 5
        end
        inherited CheckBox66: TCheckBox
          Left = 94
          Top = 30
          Width = 144
          TabOrder = 11
        end
        inherited Edit66: TEdit
          Top = 28
          TabOrder = 0
        end
        inherited CheckBox67: TCheckBox
          Left = 94
          Top = 100
          Width = 168
          TabOrder = 13
        end
        inherited Edit67: TEdit
          Top = 98
          TabOrder = 2
        end
        inherited CheckBox68: TCheckBox
          Left = 94
          Top = 275
          Width = 144
          TabOrder = 18
        end
        inherited Edit68: TEdit
          Top = 273
          TabOrder = 8
        end
        inherited CheckBox92: TCheckBox
          Left = 94
          Top = 343
          Width = 152
          TabOrder = 22
        end
        inherited Edit92: TEdit
          Top = 341
          TabOrder = 10
          OnChange = nil
        end
      end
      inherited TabSheet5: TTabSheet
        inherited RzCheckBoxSelectPagePic: TRzCheckBox
          Left = 513
          Width = 79
          Height = 19
        end
        inherited CheckBox69: TCheckBox
          Width = 115
        end
        inherited CheckBox70: TCheckBox
          Width = 99
        end
        inherited CheckBox71: TCheckBox
          Width = 99
        end
        inherited CheckBox72: TCheckBox
          Width = 99
        end
        inherited CheckBox73: TCheckBox
          Width = 99
        end
      end
      inherited TabSheet4: TTabSheet
        inherited Label37: TLabel
          Left = 222
          Top = 65
        end
        inherited Label58: TLabel
          Left = 222
          Top = 29
        end
        inherited Label25: TLabel
          Left = 222
          Top = 100
        end
        inherited Label26: TLabel
          Left = 222
          Top = 171
        end
        inherited Label64: TLabel
          Left = 222
          Top = 207
        end
        inherited Label65: TLabel
          Left = 222
          Top = 136
        end
        inherited Label91: TLabel
          Left = 222
          Top = 240
        end
        inherited Label109: TLabel
          Left = 507
          Top = 28
        end
        inherited Label92: TLabel
          Left = 507
          Top = 56
        end
        inherited CheckBox47: TCheckBox
          Left = 7
          Top = 63
        end
        inherited Edit421: TEdit
          Left = 139
          Top = 167
          TabOrder = 9
        end
        inherited Edit422: TEdit
          Left = 139
          Top = 96
        end
        inherited Edit47: TEdit
          Left = 139
          Top = 61
        end
        inherited CheckBox16: TCheckBox
          Left = 7
          Top = 27
        end
        inherited Edit16: TEdit
          Left = 139
          Top = 25
        end
        inherited RzCheckBoxSelectPageControl: TRzCheckBox
          Left = 553
          Top = 1
          Width = 78
        end
        inherited CheckBox423: TCheckBox
          Left = 7
          Top = 205
          TabOrder = 10
        end
        inherited Edit423: TEdit
          Left = 139
          Top = 203
          TabOrder = 11
        end
        inherited CheckBox424: TCheckBox
          Left = 7
          Top = 134
          TabOrder = 12
        end
        inherited Edit424: TEdit
          Left = 139
          Top = 132
          TabOrder = 8
        end
        inherited CheckBox421: TCheckBox
          Left = 7
          Top = 169
        end
        inherited CheckBox422: TCheckBox
          Left = 7
          Top = 98
        end
        inherited CheckBox101: TCheckBox
          Left = 6
          Top = 238
        end
        inherited Edit101: TEdit
          Left = 139
          Top = 236
        end
        inherited CheckBox106: TCheckBox
          Left = 295
          Top = 26
        end
        inherited Edit106: TEdit
          Left = 427
          Top = 24
        end
        inherited CheckBox107: TCheckBox
          Left = 295
          Top = 54
        end
        inherited Edit107: TEdit
          Left = 427
          Top = 52
        end
        inherited GroupBox11: TGroupBox
          Left = 293
          Top = 111
          Width = 300
        end
        inherited CheckBox108: TCheckBox
          Left = 303
          Top = 109
        end
        inherited CheckBox109: TCheckBox
          Left = 295
          Top = 83
        end
        inherited Edit109: TEdit
          Left = 427
          Top = 81
        end
      end
      inherited TabSheet7: TTabSheet
        inherited PageControl2: TPageControl
          Top = 3
          Height = 460
          inherited TabSheet8: TTabSheet
            inherited cxCheckListBox56: TcxCheckListBox
              Top = 5
            end
          end
          inherited TabSheet10: TTabSheet
            inherited cxCheckListBox2: TcxCheckListBox
              Top = 6
              Height = 421
            end
          end
          inherited TabSheet11: TTabSheet
            inherited cxCheckListBox3: TcxCheckListBox
              Top = 7
              Height = 421
            end
          end
          inherited TabSheet12: TTabSheet
            inherited cxCheckListBox4: TcxCheckListBox
              Top = 7
              Height = 422
            end
          end
          inherited TabSheet13: TTabSheet
            inherited Label97: TLabel
              Left = 201
            end
            inherited Label98: TLabel
              Left = 201
            end
            inherited rbTimeUnitSecond: TRadioButton
              Left = 299
            end
            inherited rbTimeUnitMinute: TRadioButton
              Left = 335
            end
            inherited Edit110: TEdit
              Left = 299
            end
          end
        end
      end
      inherited TabSheet6: TTabSheet
        inherited RzCheckBoxSelectPageNotice: TRzCheckBox
          Left = 528
        end
      end
      inherited TabSheet1: TTabSheet
        inherited GroupBox8: TGroupBox
          Top = 469
          Width = 635
          inherited Label70: TLabel
            Left = 306
          end
          inherited Label72: TLabel
            Left = 221
          end
          inherited Label73: TLabel
            Left = 257
          end
          inherited Label74: TLabel
            Left = 293
          end
          inherited Label75: TLabel
            Left = 330
          end
          inherited CheckBox27: TCheckBox
            Left = 39
          end
          inherited CheckBox1: TCheckBox
            Left = 40
          end
          inherited Edit1: TEdit
            Left = 184
          end
          inherited EditYear: TEdit
            Left = 184
          end
          inherited EditMonth: TEdit
            Left = 235
          end
          inherited EditDay: TEdit
            Left = 271
          end
          inherited EditHour: TEdit
            Left = 307
          end
        end
        inherited GroupBox7: TGroupBox
          Left = 3
          Top = 20
          Align = alNone
          inherited CheckBox74: TCheckBox
            Left = 8
          end
          inherited CheckBox75: TCheckBox
            Left = 8
            Top = 48
          end
          inherited CheckBox76: TCheckBox
            Left = 8
            Top = 74
          end
          inherited Edit74: TEdit
            Left = 102
          end
          inherited Edit76: TEdit
            Left = 102
            Top = 72
          end
          inherited Edit75: TEdit
            Left = 102
            Top = 46
          end
          inherited CheckBox88: TCheckBox
            Left = 8
            Top = 101
          end
          inherited Edit88: TEdit
            Left = 102
            Top = 99
          end
          inherited CheckBox89: TCheckBox
            Left = 8
            Top = 128
          end
          inherited Edit89: TComboBox
            Left = 102
            Top = 126
          end
        end
        inherited GroupBox1: TGroupBox
          Top = 543
          Width = 635
        end
        inherited GroupBox2: TGroupBox
          Top = 592
          Width = 635
          inherited Label68: TLabel
            Left = 580
          end
          inherited CheckBox30: TCheckBox
            Left = 329
          end
          inherited Edit30: TEdit
            Left = 457
          end
        end
        inherited GroupBox6: TGroupBox
          Left = 208
          Top = 20
          Width = 424
          Height = 161
          Align = alNone
          inherited CheckBox93: TCheckBox
            Left = 9
          end
          inherited Edit93: TEdit
            Left = 105
            Width = 89
            Enabled = False
          end
          inherited CheckBox94: TCheckBox
            Left = 235
          end
          inherited Edit94: TEdit
            Left = 346
            Top = 20
            Width = 71
          end
          inherited GroupBox9: TGroupBox
            Left = 9
            Width = 194
            inherited Edit10: TEdit
              Width = 71
            end
            inherited Edit37: TEdit
              Width = 71
            end
          end
          inherited CheckBox95: TCheckBox
            Left = 9
          end
          inherited GroupBox10: TGroupBox
            Left = 235
            Width = 182
            inherited Label87: TLabel
              Left = 13
            end
            inherited Label88: TLabel
              Left = 13
            end
            inherited Edit27: TEdit
              Left = 101
              Width = 71
            end
            inherited Edit35: TEdit
              Left = 101
              Width = 71
            end
          end
          inherited CheckBox96: TCheckBox
            Left = 243
          end
          inherited CheckBox97: TCheckBox
            Left = 222
          end
          inherited Edit97: TEdit
            Left = 351
            Width = 66
            Enabled = False
            MaxLength = 8
          end
          inherited date97: TDateTimePicker
            Left = 287
          end
          inherited CheckBox122: TCheckBox
            Left = 0
            Width = 141
          end
          inherited Edit122: TEdit
            Left = 141
            Top = 134
          end
        end
        inherited GroupBox12: TGroupBox
          Top = 316
        end
        inherited GroupBox13: TGroupBox
          Top = 190
          Width = 622
          inherited CheckBox117: TCheckBox
            Left = 7
          end
          inherited CheckBox118: TCheckBox
            Left = 7
          end
          inherited CheckBox119: TCheckBox
            Left = 7
          end
          inherited CheckBox120: TCheckBox
            Left = 7
          end
          inherited Edit117: TEdit
            Left = 122
            Width = 103
          end
          inherited Edit119: TEdit
            Left = 122
            Width = 103
          end
          inherited Edit120: TEdit
            Left = 122
            Width = 103
          end
          inherited Edit118: TEdit
            Left = 122
            Width = 103
          end
          inherited GroupBox14: TGroupBox
            Left = 240
            Width = 374
          end
          inherited CheckBox121: TCheckBox
            Left = 252
          end
        end
      end
    end
    object Panel6: TPanel
      Left = 644
      Top = 1
      Width = 152
      Height = 496
      Align = alClient
      Caption = 'Panel6'
      TabOrder = 1
      object Panel7: TPanel
        Left = 1
        Top = 1
        Width = 150
        Height = 24
        Align = alTop
        Caption = #35774#32622#20197#19979#36710#36742':'
        TabOrder = 0
      end
      object ListView1: TListView
        Left = 1
        Top = 25
        Width = 150
        Height = 440
        Align = alClient
        Columns = <
          item
            Caption = #36710#29260#21495
            Width = 103
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
        Top = 465
        Width = 150
        Height = 30
        Align = alBottom
        TabOrder = 2
        object BitBtn4: TBitBtn
          Left = 79
          Top = 3
          Width = 57
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
          Left = 10
          Top = 3
          Width = 66
          Height = 25
          Caption = #37325#26032#36873#25321
          TabOrder = 1
          OnClick = BitBtnSelClick
        end
      end
    end
  end
end
