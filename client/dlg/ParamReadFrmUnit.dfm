inherited ParamReadFrm: TParamReadFrm
  Left = 309
  Top = 81
  BorderStyle = bsSingle
  Caption = #35835#21462#21442#25968
  ClientHeight = 577
  ClientWidth = 626
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 626
    Height = 44
    Caption = #35835#21462#21442#25968
    inherited Label61: TLabel
      Left = 379
      Top = 5
    end
    inherited RzCheckBoxSelectAll: TRzCheckBox
      Left = 510
      Top = 18
      Width = 95
    end
    object CheckBoxSystemParam: TCheckBox
      Left = 574
      Top = 1
      Width = 87
      Height = 17
      Caption = #25968#25454#24211#21442#25968
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Visible = False
      OnClick = CheckBoxSystemParamClick
    end
  end
  inherited Panel2: TPanel
    Top = 540
    Width = 626
    object Label90: TLabel [0]
      Left = 10
      Top = 12
      Width = 73
      Height = 13
      Caption = #27491#22312#35835#21462'...'
      Font.Charset = GB2312_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    inherited ProgressBar1: TProgressBar [1]
      Left = 109
      Width = 284
    end
    object BitBtnSaveReadedParam: TBitBtn [2]
      Left = 275
      Top = 30
      Width = 89
      Height = 25
      Caption = #20445#23384#21442#25968#20540' '
      TabOrder = 3
      OnClick = BitBtnSaveReadedParamClick
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
        FF0052100000D69C6B0052100000FFFFFF00FFD6A500FFD6A500FFD6A500FFD6
        A500FFD6A50052100000B57B4A00AD73420000000000FF00FF00FF00FF005210
        0000D69C6B00EFAD840052100000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFD6A50052100000C68C5A009C63310000000000FF00FF00FF00FF005210
        0000EFAD8400EFAD840052100000632100006321000063210000632100006321
        00006321000052100000C68C5A00AD73420000000000FF00FF00FF00FF005210
        0000FFBD9400FFBD9400D69C6B00D69C6B00D69C6B00D69C6B00D69C6B00D69C
        6B00D69C6B00D69C6B00D69C6B00BD7B520000000000FF00FF00FF00FF005210
        0000F7BD8C00FFBD9400FFBD9400FFBD9400FFBD9400FFBD9400FFBD9400FFBD
        9400FFBD9400FFBD9400F7BD8C00AD73420000000000FF00FF00FF00FF005210
        0000F7BD8C008C5221008C5221008C5221008C5221008C5221008C5221008C52
        21008C5221008C522100945A2900BD7B520000000000FF00FF00FF00FF005210
        0000FFCE9C0052100000FFFFFF00FFD6AD00FFD6AD00FFD6AD00FFD6AD00FFD6
        AD00FFD6AD00FFD6AD00945A2900C6845A0000000000FF00FF00FF00FF005210
        0000FFDEAD0052100000FFFFFF00FFFFF700FFFFF700FFFFF700FFFFF700FFFF
        F700FFFFF700FFD6AD008C4A2100CE94630000000000FF00FF00FF00FF005210
        0000FFEFBD0052100000FFFFFF00FFFFF700FFFFF700FFFFF700FFFFF700FFFF
        F700FFFFF700FFD6AD008C4A2100DE9C730000000000FF00FF00FF00FF005210
        0000FFF7C60052100000FFFFFF00FFFFF700FFFFF700FFFFF700FFFFF700FFFF
        F700FFFFF700FFD6AD00844A18007B39080000000000FF00FF00FF00FF005210
        0000FFFFF70052100000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFCEA500844A1800FFCEA50000000000FF00FF00FF00FF00FF00
        FF00521000005210000052100000521000005210000052100000521000005210
        000052100000521000005210000052100000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    inherited BitBtnSet: TBitBtn [3]
      Left = 412
      Caption = #35835#21462#21442#25968
    end
    inherited BitBtn2: TBitBtn [4]
      Left = 444
      Top = 30
      Caption = #20572#27490#35835#21462
      Visible = False
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
    object BitBtn1: TBitBtn
      Left = 525
      Top = 6
      Width = 73
      Height = 25
      Cancel = True
      Caption = #20851#38381
      TabOrder = 4
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
    Top = 44
    Width = 626
    Height = 496
    inherited PageControl1: TPageControl
      Height = 494
      Align = alClient
      inherited TabSheet2: TTabSheet
        inherited Label50: TLabel
          Top = 324
        end
        inherited Label51: TLabel
          Top = 26
        end
        inherited Label52: TLabel
          Top = 325
        end
        inherited Label53: TLabel
          Top = 301
        end
        inherited Label54: TLabel
          Top = 301
        end
        inherited Label55: TLabel
          Top = 325
        end
        inherited Label56: TLabel
          Top = 325
        end
        inherited Label57: TLabel
          Left = 636
          Top = 345
        end
        inherited Label60: TLabel
          Top = 335
        end
        inherited Label3: TLabel
          Top = 360
        end
        inherited Label4: TLabel
          Top = 363
        end
        inherited Label5: TLabel
          Top = 351
        end
        inherited Label6: TLabel
          Top = 379
        end
        inherited Label7: TLabel
          Top = 406
        end
        inherited Label8: TLabel
          Top = 352
        end
        inherited Label9: TLabel
          Top = 379
        end
        inherited Label23: TLabel
          Top = 54
        end
        inherited Label24: TLabel
          Top = 109
        end
        inherited Label59: TLabel
          Top = 332
        end
        inherited Label62: TLabel
          Top = 325
        end
        inherited Label76: TLabel
          Top = 83
        end
        inherited Label78: TLabel
          Top = 26
        end
        inherited Label79: TLabel
          Top = 297
        end
        inherited Label81: TLabel
          Top = 298
        end
        inherited Label89: TLabel
          Top = 406
        end
        inherited RzCheckBoxSelectPageCommunication: TRzCheckBox
          Left = 502
          Top = 4
          Width = 98
          Height = 18
        end
        inherited CheckBox35: TCheckBox
          Top = 272
        end
        inherited CheckBox6: TCheckBox
          Top = 130
        end
        inherited CheckBox7: TCheckBox
          Top = 211
        end
        inherited CheckBox9: TCheckBox
          Top = 211
          Width = 131
        end
        inherited CheckBox10: TCheckBox
          Top = 240
        end
        inherited CheckBox11: TCheckBox
          Top = 157
        end
        inherited CheckBox12: TCheckBox
          Top = 24
        end
        inherited CheckBox13: TCheckBox
          Top = 51
        end
        inherited Edit6: TEdit
          Top = 128
        end
        inherited Edit7: TEdit
          Top = 209
        end
        inherited Edit9: TEdit
          Top = 209
        end
        inherited Edit82: TEdit
          Top = 96
        end
        inherited Edit11: TEdit
          Top = 155
        end
        inherited Edit12: TEdit
          Top = 22
        end
        inherited Edit13: TEdit
          Top = 49
        end
        inherited CheckBox34: TCheckBox
          Top = 51
        end
        inherited Edit351: TEdit
          Top = 321
        end
        inherited Edit34: TEdit
          Top = 49
        end
        inherited Edit352: TEdit
          Top = 321
        end
        inherited Edit353: TEdit
          Top = 297
        end
        inherited Edit354: TEdit
          Top = 297
        end
        inherited Edit355: TEdit
          Top = 321
        end
        inherited CheckBox14: TCheckBox
          Top = 268
        end
        inherited CheckBox15: TCheckBox
          Top = 268
        end
        inherited Edit59: TEdit
          Top = 103
        end
        inherited Edit60: TEdit
          Top = 103
        end
        inherited Edit356: TEdit
          Top = 321
        end
        inherited Edit357: TEdit
          Top = 328
        end
        inherited Edit358: TEdit
          Top = 331
        end
        inherited Edit14: TComboBox
          Top = 266
        end
        inherited Edit15: TComboBox
          Top = 266
        end
        inherited CheckBox59: TCheckBox
          Top = 105
        end
        inherited CheckBox60: TCheckBox
          Top = 105
        end
        inherited CheckBox61: TCheckBox
          Top = 157
          Width = 120
        end
        inherited Edit61: TEdit
          Top = 155
        end
        inherited CheckBox62: TCheckBox
          Top = 184
        end
        inherited Edit62: TEdit
          Top = 182
        end
        inherited CheckBox63: TCheckBox
          Top = 130
        end
        inherited Edit63: TEdit
          Top = 128
        end
        inherited CheckBox64: TCheckBox
          Top = 184
        end
        inherited Edit64: TEdit
          Top = 182
        end
        inherited CheckBox65: TCheckBox
          Top = 238
        end
        inherited Edit65: TEdit
          Top = 236
        end
        inherited CheckBox351: TCheckBox
          Top = 323
        end
        inherited CheckBox352: TCheckBox
          Top = 323
        end
        inherited CheckBox353: TCheckBox
          Top = 299
        end
        inherited CheckBox354: TCheckBox
          Top = 299
        end
        inherited CheckBox355: TCheckBox
          Top = 323
        end
        inherited CheckBox356: TCheckBox
          Top = 323
        end
        inherited CheckBox357: TCheckBox
          Top = 330
        end
        inherited CheckBox358: TCheckBox
          Top = 334
        end
        inherited CheckBox359: TCheckBox
          Top = 358
        end
        inherited Edit359: TEdit
          Top = 356
        end
        inherited CheckBox360: TCheckBox
          Top = 362
        end
        inherited Edit360: TEdit
          Top = 359
        end
        inherited CheckBox361: TCheckBox
          Top = 350
        end
        inherited Edit361: TEdit
          Top = 348
        end
        inherited CheckBox362: TCheckBox
          Top = 377
        end
        inherited Edit362: TEdit
          Top = 375
        end
        inherited CheckBox363: TCheckBox
          Top = 404
        end
        inherited Edit363: TEdit
          Top = 402
        end
        inherited CheckBox364: TCheckBox
          Top = 350
        end
        inherited Edit364: TEdit
          Top = 348
        end
        inherited CheckBox365: TCheckBox
          Top = 377
        end
        inherited Edit365: TEdit
          Top = 375
        end
        inherited CheckBox81: TCheckBox
          Top = 74
        end
        inherited CheckBox82: TCheckBox
          Top = 99
        end
        inherited Edit81: TEdit
          Top = 71
        end
        inherited date81: TDateTimePicker
          Top = 72
        end
        inherited time81: TDateTimePicker
          Top = 72
        end
        inherited CheckBox83: TCheckBox
          Top = 225
        end
        inherited Edit83: TEdit
          Top = 223
        end
        inherited CheckBox84: TCheckBox
          Top = 250
        end
        inherited Edit84: TEdit
          Top = 248
        end
        inherited CheckBox33: TCheckBox
          Top = 250
        end
        inherited Edit33: TComboBox
          Top = 248
        end
        inherited CheckBox85: TCheckBox
          Top = 78
        end
        inherited Edit85: TEdit
          Top = 76
        end
        inherited CheckBox86: TCheckBox
          Top = 78
        end
        inherited Edit86: TEdit
          Top = 76
        end
        inherited CheckBox87: TCheckBox
          Top = 238
        end
        inherited Edit87: TEdit
          Top = 236
        end
        inherited Edit90: TEdit
          Top = 293
        end
        inherited Edit91: TEdit
          Top = 294
        end
        inherited CheckBox90: TCheckBox
          Top = 295
        end
        inherited CheckBox91: TCheckBox
          Top = 296
        end
        inherited CheckBox98: TCheckBox
          Top = 404
        end
        inherited Edit98: TEdit
          Top = 402
        end
      end
      inherited TabSheet3: TTabSheet
        inherited Label48: TLabel
          Left = 421
        end
        inherited Label63: TLabel
          Left = 421
        end
        inherited Edit55: TEdit
          MaxLength = 10
        end
        inherited RzCheckBoxSelectPageCall: TRzCheckBox
          Left = 520
          Top = 8
          Width = 89
        end
      end
      inherited TabSheet5: TTabSheet
        inherited RzCheckBoxSelectPagePic: TRzCheckBox
          Left = 528
          Top = 8
          Width = 86
        end
      end
      inherited TabSheet4: TTabSheet
        inherited Label10: TLabel
          Left = 62
          Top = 278
        end
        inherited Label11: TLabel
          Left = 62
          Top = 297
        end
        inherited Label12: TLabel
          Left = 62
          Top = 318
        end
        inherited Label13: TLabel
          Left = 249
          Top = 275
        end
        inherited Label14: TLabel
          Left = 249
          Top = 296
        end
        inherited Label15: TLabel
          Left = 249
          Top = 317
        end
        inherited Label19: TLabel
          Left = 73
          Top = 421
        end
        inherited Label20: TLabel
          Left = 73
          Top = 445
        end
        inherited Label21: TLabel
          Left = 230
          Top = 417
        end
        inherited Label22: TLabel
          Left = 230
          Top = 446
        end
        inherited Label37: TLabel
          Left = 355
          Top = 66
        end
        inherited Label49: TLabel
          Left = 181
          Top = 472
        end
        inherited Label58: TLabel
          Left = 355
          Top = 36
        end
        inherited Label25: TLabel
          Left = 355
          Top = 158
        end
        inherited Label26: TLabel
          Left = 355
          Top = 95
        end
        inherited Label64: TLabel
          Left = 355
          Top = 191
        end
        inherited Label65: TLabel
          Left = 355
          Top = 125
        end
        inherited Label91: TLabel
          Left = 355
          Top = 221
        end
        inherited CheckBox39: TCheckBox
          Left = 41
          Top = 347
        end
        inherited CheckBox37: TCheckBox
          Left = 41
          Top = 254
        end
        inherited CheckBox40: TCheckBox
          Left = 41
          Top = 372
        end
        inherited CheckBox41: TCheckBox
          Left = 41
          Top = 398
        end
        inherited CheckBox42: TCheckBox
          Left = 458
          Top = 377
        end
        inherited CheckBox47: TCheckBox
          Left = 100
          Top = 64
        end
        inherited CheckBox58: TCheckBox
          Left = 11
          Top = 469
        end
        inherited Edit371: TEdit
          Left = 179
          Top = 272
        end
        inherited Edit372: TEdit
          Left = 179
          Top = 291
        end
        inherited Edit373: TEdit
          Left = 179
          Top = 312
        end
        inherited Edit39: TComboBox
          Left = 153
          Top = 343
        end
        inherited edit40: TComboBox
          Left = 169
          Top = 369
        end
        inherited Edit411: TEdit
          Left = 161
          Top = 414
        end
        inherited Edit412: TEdit
          Left = 161
          Top = 438
        end
        inherited Edit421: TEdit
          Left = 228
          Top = 154
        end
        inherited Edit422: TEdit
          Left = 228
          Top = 91
        end
        inherited Edit47: TEdit
          Left = 228
          Top = 62
        end
        inherited Edit581: TEdit
          Left = 103
          Top = 467
        end
        inherited Edit582: TEdit
          Left = 210
          Top = 467
        end
        inherited CheckBox16: TCheckBox
          Left = 100
          Top = 34
        end
        inherited Edit16: TEdit
          Left = 228
          Top = 32
        end
        inherited RzCheckBoxSelectPageControl: TRzCheckBox
          Left = 528
          Top = 8
          Width = 85
        end
        inherited CheckBox423: TCheckBox
          Left = 100
          Top = 189
        end
        inherited Edit423: TEdit
          Left = 228
          Top = 187
        end
        inherited CheckBox424: TCheckBox
          Left = 100
          Top = 123
        end
        inherited Edit424: TEdit
          Left = 228
          Top = 121
        end
        inherited CheckBox421: TCheckBox
          Left = 100
          Top = 156
        end
        inherited CheckBox422: TCheckBox
          Left = 100
          Top = 93
        end
        inherited CheckBox101: TCheckBox
          Left = 100
          Top = 219
        end
        inherited Edit101: TEdit
          Left = 228
          Top = 217
        end
      end
      inherited TabSheet6: TTabSheet
        inherited RzCheckBoxSelectPageNotice: TRzCheckBox
          Left = 528
        end
      end
      inherited TabSheet1: TTabSheet
        inherited GroupBox8: TGroupBox
          Top = 265
          inherited Label70: TLabel
            Top = 19
          end
          inherited CheckBox27: TCheckBox
            Top = 46
          end
          inherited CheckBox1: TCheckBox
            Top = 18
          end
          inherited Edit1: TEdit
            Top = 16
          end
          inherited Date27: TDateTimePicker
            Left = 363
          end
          inherited Time27: TDateTimePicker
            Left = 467
          end
        end
        inherited GroupBox7: TGroupBox
          inherited CheckBox76: TCheckBox
            Top = 43
          end
          inherited Edit76: TEdit
            Top = 41
          end
          inherited RzCheckBoxSelectPageElse: TRzCheckBox
            Left = 520
            Top = 13
            Width = 87
          end
        end
        inherited GroupBox1: TGroupBox
          Top = 339
        end
        inherited GroupBox2: TGroupBox
          Top = 388
          inherited Label68: TLabel
            Left = 582
          end
          inherited CheckBox30: TCheckBox
            Left = 331
          end
          inherited Edit30: TEdit
            Left = 459
          end
        end
        inherited GroupBox6: TGroupBox
          inherited Edit97: TEdit
            Left = 157
            Width = 112
          end
          inherited date97: TDateTimePicker
            Left = 81
            Top = 150
            Visible = False
          end
        end
      end
    end
  end
  inherited Timer1: TTimer
    Left = 418
    Top = 108
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 60000
    OnTimer = Timer2Timer
    Left = 325
    Top = 299
  end
end
