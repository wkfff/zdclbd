inherited ReadMeterParamFrm: TReadMeterParamFrm
  Left = 343
  Top = 29
  Caption = #35745#20215#22120#21442#25968
  ClientHeight = 623
  ClientWidth = 659
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 659
    Height = 623
    inherited Panel2: TPanel
      Top = 585
      Width = 659
      inherited BitBtn1: TBitBtn
        Left = 156
        Caption = #35835#21462#21442#25968
        OnClick = BitBtn1Click
      end
      inherited BitBtn2: TBitBtn
        Left = 462
        Caption = #21462#28040
      end
      object BitBtn5: TBitBtn
        Left = 257
        Top = 8
        Width = 95
        Height = 25
        Caption = #35774#32622#21442#25968
        TabOrder = 2
        OnClick = BitBtn5Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
          000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
          00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
          F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
          0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
          FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
          FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
          0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
          00333377737FFFFF773333303300000003333337337777777333}
        NumGlyphs = 2
      end
      object BitBtn6: TBitBtn
        Left = 40
        Top = 8
        Width = 75
        Height = 25
        Caption = 'BitBtn6'
        TabOrder = 3
        Visible = False
        OnClick = BitBtn6Click
      end
      object BitBtn7: TBitBtn
        Left = 359
        Top = 8
        Width = 95
        Height = 25
        Caption = #21442#25968#21478#23384#20026
        TabOrder = 4
      end
    end
    inherited Panel3: TPanel
      Left = 542
      Height = 585
      Visible = False
      inherited ListView1: TListView
        Height = 526
      end
      inherited Panel6: TPanel
        Top = 556
      end
    end
    inherited Panel5: TPanel
      Width = 542
      Height = 585
      inherited Panel7: TPanel
        Width = 542
        Caption = #35745#20215#22120#21442#25968
        object Edit20: TEdit
          Left = 24
          Top = 16
          Width = 121
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object CheckBox1: TCheckBox
          Left = 408
          Top = 16
          Width = 97
          Height = 17
          Caption = #21335#20140#36890#29992
          TabOrder = 1
          OnClick = CheckBox1Click
        end
      end
      inherited PanProgress: TPanel
        Top = 562
        Width = 542
        inherited ProgressBar1: TProgressBar
          Width = 538
        end
      end
      object Panel8: TPanel
        Left = 0
        Top = 521
        Width = 542
        Height = 41
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 2
        object Label21: TLabel
          Left = 87
          Top = 16
          Width = 60
          Height = 13
          Caption = #21442#25968#25991#20214#65306
        end
        object editFilePath: TEdit
          Left = 152
          Top = 12
          Width = 347
          Height = 21
          TabOrder = 0
        end
        object BitBtn4: TBitBtn
          Left = 502
          Top = 10
          Width = 29
          Height = 25
          Caption = '...'
          TabOrder = 1
          OnClick = BitBtn4Click
        end
      end
      object PageControl1: TPageControl
        Left = 0
        Top = 49
        Width = 542
        Height = 472
        ActivePage = TabSheet1
        Align = alClient
        TabOrder = 3
        object TabSheet1: TTabSheet
          Caption = #22522#30784#21442#25968
          object Label6: TLabel
            Left = 56
            Top = 225
            Width = 108
            Height = 13
            Caption = #22812#38388#20108#27425#31354#36148#21333#20215#65306
          end
          object Label27: TLabel
            Left = 197
            Top = 24
            Width = 12
            Height = 13
            Caption = #24180
          end
          object Label28: TLabel
            Left = 257
            Top = 24
            Width = 12
            Height = 13
            Caption = #26085
          end
          object Label29: TLabel
            Left = 227
            Top = 24
            Width = 12
            Height = 13
            Caption = #26376
          end
          object Label30: TLabel
            Left = 288
            Top = 24
            Width = 12
            Height = 13
            Caption = #26102
          end
          object Label1: TLabel
            Left = 80
            Top = 24
            Width = 84
            Height = 13
            Caption = #21442#25968#21551#21160#26102#38388#65306
          end
          object Label2: TLabel
            Left = 80
            Top = 58
            Width = 84
            Height = 13
            Caption = #30333#22825#24448#36820#21333#20215#65306
          end
          object Label20: TLabel
            Left = 80
            Top = 92
            Width = 84
            Height = 13
            Caption = #30333#22825#21333#31243#21333#20215#65306
          end
          object Label3: TLabel
            Left = 80
            Top = 126
            Width = 84
            Height = 13
            Caption = #22812#38388#24448#36820#21333#20215#65306
          end
          object Label4: TLabel
            Left = 80
            Top = 159
            Width = 84
            Height = 13
            Caption = #22812#38388#21333#31243#21333#20215#65306
          end
          object Label5: TLabel
            Left = 56
            Top = 192
            Width = 108
            Height = 13
            Caption = #30333#22825#20108#27425#31354#36148#21333#20215#65306
          end
          object Label7: TLabel
            Left = 92
            Top = 258
            Width = 72
            Height = 13
            Caption = #30333#22825#36215#27493#20215#65306
          end
          object Label8: TLabel
            Left = 92
            Top = 291
            Width = 72
            Height = 13
            Caption = #22812#38388#36215#27493#20215#65306
          end
          object Label9: TLabel
            Left = 92
            Top = 323
            Width = 72
            Height = 13
            Caption = #32493#31243#20844#37324#25968#65306
          end
          object Label10: TLabel
            Left = 92
            Top = 355
            Width = 72
            Height = 13
            Caption = #21551#31243#20844#37324#25968#65306
          end
          object Label11: TLabel
            Left = 104
            Top = 386
            Width = 60
            Height = 13
            Caption = #21333#31243#20844#37324#65306
          end
          object Label12: TLabel
            Left = 80
            Top = 417
            Width = 84
            Height = 13
            Caption = #20108#27425#31354#36148#20844#37324#65306
          end
          object Label13: TLabel
            Left = 326
            Top = 24
            Width = 108
            Height = 13
            Caption = #30333#22825#31561#24453#26102#38388#21333#20215#65306
          end
          object Label14: TLabel
            Left = 326
            Top = 58
            Width = 108
            Height = 13
            Caption = #22812#38388#31561#24453#26102#38388#21333#20215#65306
          end
          object Label15: TLabel
            Left = 350
            Top = 92
            Width = 84
            Height = 13
            Caption = #20813#36153#31561#20505#26102#38388#65306
          end
          object Label16: TLabel
            Left = 375
            Top = 126
            Width = 60
            Height = 13
            Caption = #21152#20215#26102#38388#65306
          end
          object Label17: TLabel
            Left = 351
            Top = 159
            Width = 84
            Height = 13
            Caption = #22812#38388#24320#22987#26102#38388#65306
          end
          object Label18: TLabel
            Left = 351
            Top = 192
            Width = 84
            Height = 13
            Caption = #22812#38388#32467#26463#26102#38388#65306
          end
          object Label19: TLabel
            Left = 387
            Top = 225
            Width = 48
            Height = 13
            Caption = #38468#21152#36153#65306
          end
          object BeginDate: TDateTimePicker
            Left = 299
            Top = 221
            Width = 81
            Height = 21
            Date = 36526.482428923620000000
            Time = 36526.482428923620000000
            TabOrder = 0
            Visible = False
          end
          object beginTime: TEdit
            Left = 269
            Top = 20
            Width = 18
            Height = 21
            Hint = #21442#25968#21551#21160#26102#38388#26102
            MaxLength = 2
            ReadOnly = True
            TabOrder = 1
            Text = '00'
          end
          object Edit1: TEdit
            Left = 166
            Top = 54
            Width = 121
            Height = 21
            Hint = #30333#22825#24448#36820#21333#20215
            MaxLength = 5
            ReadOnly = True
            TabOrder = 2
            Text = '0.0'
          end
          object Edit2: TEdit
            Left = 166
            Top = 88
            Width = 121
            Height = 21
            Hint = #30333#22825#21333#31243#21333#20215
            MaxLength = 5
            ReadOnly = True
            TabOrder = 3
            Text = '0.0'
          end
          object Edit3: TEdit
            Left = 166
            Top = 155
            Width = 121
            Height = 21
            Hint = #22812#38388#21333#31243#21333#20215
            MaxLength = 5
            ReadOnly = True
            TabOrder = 4
            Text = '0.0'
          end
          object Edit4: TEdit
            Left = 166
            Top = 188
            Width = 121
            Height = 21
            Hint = #30333#22825#20108#27425#31354#36148#21333#20215
            MaxLength = 5
            ReadOnly = True
            TabOrder = 5
            Text = '0.0'
          end
          object Edit5: TEdit
            Left = 166
            Top = 221
            Width = 121
            Height = 21
            Hint = #22812#38388#20108#27425#31354#36148#21333#20215
            MaxLength = 5
            ReadOnly = True
            TabOrder = 6
            Text = '0.0'
          end
          object Edit6: TEdit
            Left = 166
            Top = 254
            Width = 121
            Height = 21
            Hint = #30333#22825#36215#27493#20215
            MaxLength = 5
            ReadOnly = True
            TabOrder = 7
            Text = '0.0'
          end
          object Edit7: TEdit
            Left = 166
            Top = 287
            Width = 121
            Height = 21
            Hint = #22812#38388#36215#27493#20215
            MaxLength = 5
            ReadOnly = True
            TabOrder = 8
            Text = '0.0'
          end
          object Edit8: TEdit
            Left = 166
            Top = 319
            Width = 121
            Height = 21
            Hint = #32493#31243#20844#37324#25968
            MaxLength = 5
            ReadOnly = True
            TabOrder = 9
            Text = '0.0'
          end
          object Edit9: TEdit
            Left = 166
            Top = 351
            Width = 121
            Height = 21
            Hint = #21551#31243#20844#37324#25968
            MaxLength = 5
            ReadOnly = True
            TabOrder = 10
            Text = '0.0'
          end
          object Edit10: TEdit
            Left = 166
            Top = 382
            Width = 121
            Height = 21
            Hint = #21333#31243#20844#37324
            MaxLength = 5
            ReadOnly = True
            TabOrder = 11
            Text = '0.0'
          end
          object Edit11: TEdit
            Left = 166
            Top = 413
            Width = 121
            Height = 21
            Hint = #20108#27425#31354#36148#20844#37324
            MaxLength = 5
            ReadOnly = True
            TabOrder = 12
            Text = '0.0'
          end
          object Edit12: TEdit
            Left = 434
            Top = 20
            Width = 121
            Height = 21
            Hint = #30333#22825#31561#24453#26102#38388#21333#20215
            MaxLength = 5
            ReadOnly = True
            TabOrder = 13
            Text = '0.0'
          end
          object Edit13: TEdit
            Left = 434
            Top = 54
            Width = 121
            Height = 21
            Hint = #22812#38388#31561#24453#26102#38388#21333#20215
            MaxLength = 5
            ReadOnly = True
            TabOrder = 14
            Text = '0.0'
          end
          object Edit14: TEdit
            Left = 434
            Top = 88
            Width = 121
            Height = 21
            Hint = #20813#36153#31561#20505#26102#38388
            MaxLength = 5
            ReadOnly = True
            TabOrder = 15
            Text = '0.0'
          end
          object Edit15: TEdit
            Left = 434
            Top = 122
            Width = 121
            Height = 21
            Hint = #21152#20215#26102#38388
            MaxLength = 5
            ReadOnly = True
            TabOrder = 16
            Text = '0.0'
          end
          object Edit16: TEdit
            Left = 434
            Top = 155
            Width = 121
            Height = 21
            Hint = #22812#38388#24320#22987#26102#38388
            MaxLength = 5
            ReadOnly = True
            TabOrder = 17
            Text = '0:0'
          end
          object Edit17: TEdit
            Left = 434
            Top = 188
            Width = 121
            Height = 21
            Hint = #22812#38388#32467#26463#26102#38388
            MaxLength = 5
            ReadOnly = True
            TabOrder = 18
            Text = '0:0'
          end
          object Edit18: TEdit
            Left = 434
            Top = 221
            Width = 121
            Height = 21
            Hint = #38468#21152#36153
            MaxLength = 5
            ReadOnly = True
            TabOrder = 19
            Text = '0.0'
          end
          object Edit19: TEdit
            Left = 166
            Top = 122
            Width = 121
            Height = 21
            Hint = #22812#38388#24448#36820#21333#20215
            MaxLength = 5
            ReadOnly = True
            TabOrder = 20
            Text = '0.0'
          end
          object Edit26: TEdit
            Left = 166
            Top = 20
            Width = 30
            Height = 21
            Hint = #21442#25968#21551#21160#26102#38388#24180
            ReadOnly = True
            TabOrder = 21
            Text = '0000'
          end
          object Edit27: TEdit
            Left = 210
            Top = 20
            Width = 18
            Height = 21
            Hint = #21442#25968#21551#21160#26102#38388#26376
            ReadOnly = True
            TabOrder = 22
            Text = '00'
          end
          object Edit28: TEdit
            Left = 239
            Top = 20
            Width = 18
            Height = 21
            Hint = #21442#25968#21551#21160#26102#38388#26085
            ReadOnly = True
            TabOrder = 23
            Text = '00'
          end
        end
        object TabSheet2: TTabSheet
          Caption = #25193#23637#21442#25968
          ImageIndex = 1
          object Label22: TLabel
            Left = 125
            Top = 28
            Width = 132
            Height = 13
            Caption = #24403#22825#25968#25454#28165#38646#24320#22987#26102#38388#65306
          end
          object Label23: TLabel
            Left = 4
            Top = 54
            Width = 84
            Height = 13
            Caption = #21462#28040#20813#31561#37324#31243#65306
          end
          object Label24: TLabel
            Left = 197
            Top = 54
            Width = 60
            Height = 13
            Caption = #20999#25442#36895#24230#65306
          end
          object Label25: TLabel
            Left = 28
            Top = 81
            Width = 60
            Height = 13
            Caption = #20914#31243#26102#38388#65306
          end
          object Label26: TLabel
            Left = 197
            Top = 81
            Width = 60
            Height = 13
            Caption = #20914#25269#37324#31243#65306
          end
          object Label31: TLabel
            Left = 13
            Top = 107
            Width = 75
            Height = 13
            Caption = #25171#21360#20559#31227#37327#65306' '
          end
          object Label32: TLabel
            Left = 182
            Top = 107
            Width = 75
            Height = 13
            Caption = #20256#24863#22120#26497#25968#65306' '
          end
          object Edit21: TEdit
            Left = 259
            Top = 24
            Width = 73
            Height = 21
            Hint = #24403#22825#25968#25454#28165#38646#24320#22987#26102#38388
            TabOrder = 0
            Text = '0:0'
          end
          object Edit22: TEdit
            Left = 92
            Top = 50
            Width = 73
            Height = 21
            Hint = #21462#28040#20813#31561#37324#31243
            TabOrder = 1
            Text = '0.0'
          end
          object Edit23: TEdit
            Left = 259
            Top = 50
            Width = 73
            Height = 21
            Hint = #20999#25442#36895#24230
            TabOrder = 2
            Text = '0.0'
          end
          object Edit24: TEdit
            Left = 92
            Top = 77
            Width = 73
            Height = 21
            Hint = #20914#31243#26102#38388
            TabOrder = 3
            Text = '0.0'
          end
          object Edit25: TEdit
            Left = 259
            Top = 77
            Width = 73
            Height = 21
            Hint = #20914#25269#37324#31243
            TabOrder = 4
            Text = '0.0'
          end
          object RadioGroup9: TRadioGroup
            Left = 224
            Top = 0
            Width = 310
            Height = 444
            Align = alRight
            Caption = #37197#32622
            ItemIndex = 0
            Items.Strings = (
              #20813#31561#20498#35745#26102#12289#19978#20986#32440#12289#22235#23631#26174#31034#12289'PFC8583'#26102#38047#33455#29255
              #20813#31561#20498#35745#26102#12289#19978#20986#32440#12289#22235#23631#26174#31034#12289'PFC8563'#26102#38047#33455#29255
              #20813#31561#20498#35745#26102#12289#19978#20986#32440#12289#20116#23631#26174#31034#12289'PFC8583'#26102#38047#33455#29255
              #20813#31561#20498#35745#26102#12289#19978#20986#32440#12289#20116#23631#26174#31034#12289'PFC8563'#26102#38047#33455#29255
              #20813#31561#20498#35745#26102#12289#21069#20986#32440#12289#22235#23631#26174#31034#12289'PFC8583'#26102#38047#33455#29255
              #20813#31561#20498#35745#26102#12289#21069#20986#32440#12289#22235#23631#26174#31034#12289'PFC8563'#26102#38047#33455#29255
              #20813#31561#20498#35745#26102#12289#21069#20986#32440#12289#20116#23631#26174#31034#12289'PFC8583'#26102#38047#33455#29255
              #20813#31561#20498#35745#26102#12289#21069#20986#32440#12289#20116#23631#26174#31034#12289'PFC8563'#26102#38047#33455#29255
              #20813#31561#27491#35745#26102#12289#19978#20986#32440#12289#22235#23631#26174#31034#12289'PFC8583'#26102#38047#33455#29255
              #20813#31561#27491#35745#26102#12289#19978#20986#32440#12289#22235#23631#26174#31034#12289'PFC8563'#26102#38047#33455#29255
              #20813#31561#27491#35745#26102#12289#19978#20986#32440#12289#20116#23631#26174#31034#12289'PFC8583'#26102#38047#33455#29255
              #20813#31561#27491#35745#26102#12289#19978#20986#32440#12289#20116#23631#26174#31034#12289'PFC8563'#26102#38047#33455#29255
              #20813#31561#27491#35745#26102#12289#21069#20986#32440#12289#22235#23631#26174#31034#12289'PFC8583'#26102#38047#33455#29255
              #20813#31561#27491#35745#26102#12289#21069#20986#32440#12289#22235#23631#26174#31034#12289'PFC8563'#26102#38047#33455#29255
              #20813#31561#27491#35745#26102#12289#21069#20986#32440#12289#20116#23631#26174#31034#12289'PFC8583'#26102#38047#33455#29255
              #20813#31561#27491#35745#26102#12289#21069#20986#32440#12289#20116#23631#26174#31034#12289'PFC8563'#26102#38047#33455#29255)
            TabOrder = 5
          end
          object Edit29: TEdit
            Left = 92
            Top = 103
            Width = 73
            Height = 21
            Hint = #25171#21360#20559#31227#37327
            MaxLength = 2
            ReadOnly = True
            TabOrder = 6
            Text = '0'
          end
          object RadioGroup1: TRadioGroup
            Left = 19
            Top = 134
            Width = 150
            Height = 33
            Caption = #20914#31243
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              #20914'  '#31243' '
              #19981#20914#31243)
            TabOrder = 7
          end
          object RadioGroup2: TRadioGroup
            Left = 179
            Top = 134
            Width = 150
            Height = 33
            Caption = #31561#20505
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              #33258#21160
              #25163#21160)
            TabOrder = 8
          end
          object RadioGroup3: TRadioGroup
            Left = 19
            Top = 171
            Width = 150
            Height = 33
            Caption = #21333#31243
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              #33258#21160
              #25163#21160)
            TabOrder = 9
          end
          object RadioGroup4: TRadioGroup
            Left = 179
            Top = 171
            Width = 150
            Height = 33
            Caption = #25171#21360
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              #33258#21160
              #25163#21160)
            TabOrder = 10
          end
          object Edit30: TEdit
            Left = 259
            Top = 103
            Width = 73
            Height = 21
            Hint = #20256#24863#22120#26497#25968
            MaxLength = 2
            ReadOnly = True
            TabOrder = 11
            Text = '0'
          end
          object RadioGroup5: TRadioGroup
            Left = 19
            Top = 213
            Width = 150
            Height = 33
            Caption = #19968#21345#36890
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              #24320'  '#36890' '
              #20851'  '#38381)
            TabOrder = 12
          end
          object RadioGroup6: TRadioGroup
            Left = 179
            Top = 213
            Width = 150
            Height = 33
            Caption = 'GPS'
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              #24320'  '#36890' '
              #20851'  '#38381)
            TabOrder = 13
          end
          object RadioGroup7: TRadioGroup
            Left = 81
            Top = 256
            Width = 217
            Height = 33
            Caption = #26368#22823#33829#36816#25968#25454
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              #35206#30422#21382#21490#25968#25454'   '
              #20572' '#27490' '#33829' '#36816)
            TabOrder = 14
          end
          object RadioGroup8: TRadioGroup
            Left = 81
            Top = 297
            Width = 217
            Height = 118
            Caption = #25968#25454#36827#21046
            ItemIndex = 0
            Items.Strings = (
              #26174#31034#22235#33293#20116#20837#21040#20998
              #26174#31034#22235#33293#20116#20837#21040#35282
              #26174#31034#22235#33293#20116#20837#21040#20803
              #22235#33293#20845#20837#20116#22855#36827)
            TabOrder = 15
          end
        end
      end
    end
  end
end
