inherited LedParamFrm: TLedParamFrm
  Left = 318
  Top = 133
  Caption = #35745#20215#22120#21442#25968#35774#32622
  ClientHeight = 606
  ClientWidth = 758
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 758
    Height = 606
    inherited Panel2: TPanel
      Top = 568
      Width = 758
      inherited BitBtn1: TBitBtn
        Left = 155
        Width = 94
        OnClick = BitBtn1Click
      end
      inherited BitBtn2: TBitBtn
        Left = 380
      end
      object BitBtn4: TBitBtn
        Left = 480
        Top = 8
        Width = 95
        Height = 25
        Caption = #21442#25968#21478#23384#20026
        TabOrder = 2
        OnClick = BitBtn4Click
      end
      object BitBtn5: TBitBtn
        Left = 264
        Top = 8
        Width = 105
        Height = 25
        Caption = #21457#36865#25991#20214#21442#25968
        TabOrder = 3
        OnClick = BitBtn5Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
          FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
          00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
          F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
          00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
          F033777777777337F73309999990FFF0033377777777FFF77333099999000000
          3333777777777777333333399033333333333337773333333333333903333333
          3333333773333333333333303333333333333337333333333333}
        NumGlyphs = 2
      end
    end
    inherited Panel3: TPanel
      Left = 641
      Height = 568
      inherited ListView1: TListView
        Height = 509
        OnClick = ListView1Click
      end
      inherited Panel6: TPanel
        Top = 539
      end
    end
    inherited Panel5: TPanel
      Width = 641
      Height = 568
      inherited Panel7: TPanel
        Width = 641
        Caption = #35745#20215#22120#21442#25968#35774#32622
      end
      inherited PanProgress: TPanel
        Top = 545
        Width = 641
        inherited ProgressBar1: TProgressBar
          Width = 637
        end
      end
      object Panel8: TPanel
        Left = 0
        Top = 515
        Width = 641
        Height = 30
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        object Label28: TLabel
          Left = 112
          Top = 8
          Width = 60
          Height = 13
          Caption = #21442#25968#25991#20214#65306
        end
        object SpeedButton1: TSpeedButton
          Left = 544
          Top = 3
          Width = 23
          Height = 22
          Caption = '...'
          OnClick = SpeedButton1Click
        end
        object GroupBox1: TGroupBox
          Left = 600
          Top = 0
          Width = 105
          Height = 47
          Caption = #23646#24615
          TabOrder = 0
          Visible = False
          object CheckBox3: TCheckBox
            Left = 0
            Top = 8
            Width = 121
            Height = 17
            Caption = #23494#25991
            TabOrder = 0
          end
          object RadioButton1: TRadioButton
            Left = 0
            Top = 32
            Width = 113
            Height = 17
            Caption = #25968#25454#26080#21387#32553
            Checked = True
            TabOrder = 1
            TabStop = True
          end
          object RadioButton2: TRadioButton
            Left = 0
            Top = 16
            Width = 113
            Height = 17
            Caption = 'gz'#21387#32553
            TabOrder = 2
          end
        end
        object editFilePath: TEdit
          Left = 176
          Top = 4
          Width = 361
          Height = 21
          TabOrder = 1
        end
      end
      object PageControl1: TPageControl
        Left = 0
        Top = 49
        Width = 641
        Height = 466
        ActivePage = TabSheet1
        Align = alClient
        TabOrder = 3
        object TabSheet1: TTabSheet
          Caption = #22522#30784#21442#25968
          object Label1: TLabel
            Left = 91
            Top = 29
            Width = 87
            Height = 13
            Caption = #21442#25968#21551#21160#26102#38388#65306' '
          end
          object Label2: TLabel
            Left = 91
            Top = 58
            Width = 87
            Height = 13
            Caption = #30333#22825#24448#36820#21333#20215#65306' '
          end
          object Label3: TLabel
            Left = 91
            Top = 88
            Width = 87
            Height = 13
            Caption = #22812#38388#24448#36820#21333#20215#65306' '
          end
          object Label4: TLabel
            Left = 91
            Top = 147
            Width = 87
            Height = 13
            Caption = #22812#38388#21333#31243#21333#20215#65306' '
          end
          object Label5: TLabel
            Left = 67
            Top = 177
            Width = 111
            Height = 13
            Caption = #30333#22825#20108#27425#31354#36148#21333#20215#65306' '
          end
          object Label6: TLabel
            Left = 67
            Top = 207
            Width = 111
            Height = 13
            Caption = #22812#38388#20108#27425#31354#36148#21333#20215#65306' '
          end
          object Label7: TLabel
            Left = 103
            Top = 236
            Width = 75
            Height = 13
            Caption = #30333#22825#36215#27493#20215#65306' '
          end
          object Label8: TLabel
            Left = 103
            Top = 265
            Width = 75
            Height = 13
            Caption = #22812#38388#36215#27493#20215#65306' '
          end
          object Label9: TLabel
            Left = 103
            Top = 294
            Width = 75
            Height = 13
            Caption = #32493#31243#20844#37324#25968#65306' '
          end
          object Label10: TLabel
            Left = 103
            Top = 324
            Width = 75
            Height = 13
            Caption = #21551#31243#20844#37324#25968#65306' '
          end
          object Label11: TLabel
            Left = 115
            Top = 354
            Width = 63
            Height = 13
            Caption = #21333#31243#20844#37324#65306' '
          end
          object Label12: TLabel
            Left = 91
            Top = 382
            Width = 87
            Height = 13
            Caption = #20108#27425#31354#36148#20844#37324#65306' '
          end
          object Label13: TLabel
            Left = 367
            Top = 53
            Width = 111
            Height = 13
            Caption = #30333#22825#31561#24453#26102#38388#21333#20215#65306' '
          end
          object Label14: TLabel
            Left = 367
            Top = 82
            Width = 111
            Height = 13
            Caption = #22812#38388#31561#24453#26102#38388#21333#20215#65306' '
          end
          object Label15: TLabel
            Left = 391
            Top = 111
            Width = 87
            Height = 13
            Caption = #20813#36153#31561#20505#26102#38388#65306' '
          end
          object Label16: TLabel
            Left = 415
            Top = 140
            Width = 63
            Height = 13
            Caption = #21152#20215#26102#38388#65306' '
          end
          object Label17: TLabel
            Left = 391
            Top = 169
            Width = 87
            Height = 13
            Caption = #22812#38388#24320#22987#26102#38388#65306' '
          end
          object Label18: TLabel
            Left = 391
            Top = 198
            Width = 87
            Height = 13
            Caption = #22812#38388#32467#26463#26102#38388#65306' '
          end
          object Label19: TLabel
            Left = 427
            Top = 226
            Width = 51
            Height = 13
            Caption = #38468#21152#36153#65306' '
          end
          object Label20: TLabel
            Left = 91
            Top = 118
            Width = 87
            Height = 13
            Caption = #30333#22825#21333#31243#21333#20215#65306' '
          end
          object Label29: TLabel
            Left = 213
            Top = 29
            Width = 12
            Height = 13
            Caption = #24180
          end
          object Label30: TLabel
            Left = 248
            Top = 29
            Width = 12
            Height = 13
            Caption = #26376
          end
          object Label31: TLabel
            Left = 282
            Top = 29
            Width = 12
            Height = 13
            Caption = #26085
          end
          object Label32: TLabel
            Left = 317
            Top = 29
            Width = 12
            Height = 13
            Caption = #26102
          end
          object BeginDate: TDateTimePicker
            Left = 460
            Top = 15
            Width = 85
            Height = 21
            Hint = #21442#25968#21551#21160#26102#38388
            Date = 40144.482428923620000000
            Time = 40144.482428923620000000
            TabOrder = 0
            Visible = False
          end
          object beginTime: TEdit
            Left = 296
            Top = 25
            Width = 18
            Height = 21
            Hint = #21442#25968#21551#21160#26102#38388
            MaxLength = 2
            TabOrder = 4
            Text = '0'
            OnKeyPress = Edit1KeyPress
            OnKeyUp = beginTimeKeyUp
          end
          object Edit1: TEdit
            Left = 180
            Top = 54
            Width = 121
            Height = 21
            Hint = #30333#22825#24448#36820#21333#20215
            MaxLength = 5
            TabOrder = 5
            Text = '00.00'
            OnKeyPress = Edit1KeyPress
            OnKeyUp = Edit1KeyUp
          end
          object Edit2: TEdit
            Left = 180
            Top = 84
            Width = 121
            Height = 21
            Hint = #22812#38388#24448#36820#21333#20215
            MaxLength = 5
            TabOrder = 6
            Text = '00.00'
            OnKeyPress = Edit1KeyPress
            OnKeyUp = Edit2KeyUp
          end
          object Edit3: TEdit
            Left = 180
            Top = 143
            Width = 121
            Height = 21
            Hint = #22812#38388#21333#31243#21333#20215
            MaxLength = 5
            TabOrder = 8
            Text = '00.00'
            OnKeyPress = Edit1KeyPress
            OnKeyUp = Edit3KeyUp
          end
          object Edit4: TEdit
            Left = 180
            Top = 173
            Width = 121
            Height = 21
            Hint = #30333#22825#20108#27425#31354#36148#21333#20215
            MaxLength = 5
            TabOrder = 9
            Text = '00.00'
            OnKeyPress = Edit1KeyPress
            OnKeyUp = Edit4KeyUp
          end
          object Edit5: TEdit
            Left = 180
            Top = 203
            Width = 121
            Height = 21
            Hint = #22812#38388#20108#27425#31354#36148#21333#20215
            MaxLength = 5
            TabOrder = 10
            Text = '00.00'
            OnKeyPress = Edit1KeyPress
            OnKeyUp = Edit5KeyUp
          end
          object Edit6: TEdit
            Left = 180
            Top = 232
            Width = 121
            Height = 21
            Hint = #30333#22825#36215#27493#20215
            MaxLength = 5
            TabOrder = 11
            Text = '00.00'
            OnKeyPress = Edit1KeyPress
            OnKeyUp = Edit6KeyUp
          end
          object Edit7: TEdit
            Left = 180
            Top = 261
            Width = 121
            Height = 21
            Hint = #22812#38388#36215#27493#20215
            MaxLength = 5
            TabOrder = 12
            Text = '00.00'
            OnKeyPress = Edit1KeyPress
            OnKeyUp = Edit7KeyUp
          end
          object Edit8: TEdit
            Left = 180
            Top = 290
            Width = 121
            Height = 21
            Hint = #32493#31243#20844#37324#25968
            MaxLength = 5
            TabOrder = 13
            Text = '00.00'
            OnKeyPress = Edit1KeyPress
            OnKeyUp = Edit8KeyUp
          end
          object Edit9: TEdit
            Left = 180
            Top = 320
            Width = 121
            Height = 21
            Hint = #21551#31243#20844#37324#25968
            MaxLength = 5
            TabOrder = 14
            Text = '00.00'
            OnKeyPress = Edit1KeyPress
            OnKeyUp = Edit9KeyUp
          end
          object Edit10: TEdit
            Left = 180
            Top = 350
            Width = 121
            Height = 21
            Hint = #21333#31243#20844#37324
            MaxLength = 5
            TabOrder = 15
            Text = '00.00'
            OnKeyPress = Edit1KeyPress
            OnKeyUp = Edit10KeyUp
          end
          object Edit11: TEdit
            Left = 180
            Top = 378
            Width = 121
            Height = 21
            Hint = #20108#27425#31354#36148#20844#37324
            MaxLength = 5
            TabOrder = 16
            Text = '00.00'
            OnKeyPress = Edit1KeyPress
            OnKeyUp = Edit11KeyUp
          end
          object Edit12: TEdit
            Left = 480
            Top = 49
            Width = 121
            Height = 21
            Hint = #30333#22825#31561#20505#26102#38388#21333#20215
            MaxLength = 5
            TabOrder = 17
            Text = '00.00'
            OnKeyPress = Edit1KeyPress
            OnKeyUp = Edit12KeyUp
          end
          object Edit13: TEdit
            Left = 480
            Top = 78
            Width = 121
            Height = 21
            Hint = #22812#38388#31561#20505#26102#38388#21333#20215
            MaxLength = 5
            TabOrder = 18
            Text = '00.00'
            OnKeyPress = Edit1KeyPress
            OnKeyUp = Edit13KeyUp
          end
          object Edit14: TEdit
            Left = 480
            Top = 107
            Width = 121
            Height = 21
            Hint = #20813#36153#31561#20505#26102#38388
            MaxLength = 5
            TabOrder = 19
            Text = '00.00'
            OnKeyPress = Edit1KeyPress
            OnKeyUp = Edit14KeyUp
          end
          object Edit15: TEdit
            Left = 480
            Top = 136
            Width = 121
            Height = 21
            Hint = #21152#20215#26102#38388
            MaxLength = 5
            TabOrder = 20
            Text = '00.00'
            OnKeyPress = Edit1KeyPress
            OnKeyUp = Edit15KeyUp
          end
          object Edit16: TEdit
            Left = 480
            Top = 165
            Width = 121
            Height = 21
            Hint = #22812#38388#24320#22987#26102#38388
            MaxLength = 5
            TabOrder = 21
            Text = '00:00'
            OnKeyPress = Edit1KeyPress
            OnKeyUp = Edit16KeyUp
          end
          object Edit17: TEdit
            Left = 480
            Top = 194
            Width = 121
            Height = 21
            Hint = #22812#38388#32467#26463#26102#38388
            MaxLength = 5
            TabOrder = 22
            Text = '00:00'
            OnKeyPress = Edit1KeyPress
            OnKeyUp = Edit17KeyUp
          end
          object Edit18: TEdit
            Left = 480
            Top = 222
            Width = 121
            Height = 21
            Hint = #38468#21152#36153
            MaxLength = 5
            TabOrder = 23
            Text = '00.00'
            OnKeyPress = Edit1KeyPress
            OnKeyUp = Edit18KeyUp
          end
          object Edit19: TEdit
            Left = 180
            Top = 114
            Width = 121
            Height = 21
            Hint = #30333#22825#21333#31243#21333#20215
            MaxLength = 5
            TabOrder = 7
            Text = '00.00'
            OnKeyPress = Edit1KeyPress
            OnKeyUp = Edit19KeyUp
          end
          object editYear: TEdit
            Left = 180
            Top = 25
            Width = 30
            Height = 21
            TabOrder = 1
            Text = '0000'
            OnKeyPress = Edit1KeyPress
          end
          object editMonth: TEdit
            Left = 228
            Top = 25
            Width = 18
            Height = 21
            TabOrder = 2
            Text = '00'
            OnKeyPress = Edit1KeyPress
            OnKeyUp = editMonthKeyUp
          end
          object editDay: TEdit
            Left = 261
            Top = 25
            Width = 18
            Height = 21
            TabOrder = 3
            Text = '00'
            OnKeyPress = Edit1KeyPress
            OnKeyUp = editDayKeyUp
          end
        end
        object TabSheet2: TTabSheet
          Caption = #25193#23637#21442#25968
          ImageIndex = 1
          object Label21: TLabel
            Left = 110
            Top = 27
            Width = 135
            Height = 13
            Caption = #24403#22825#25968#25454#28165#38646#24320#22987#26102#38388#65306' '
          end
          object Label22: TLabel
            Left = 1
            Top = 56
            Width = 87
            Height = 13
            Caption = #21462#28040#20813#31561#37324#31243#65306' '
          end
          object Label23: TLabel
            Left = 182
            Top = 56
            Width = 63
            Height = 13
            Caption = #20999#25442#36895#24230#65306' '
          end
          object Label24: TLabel
            Left = 25
            Top = 82
            Width = 63
            Height = 13
            Caption = #20914#31243#26102#38388#65306' '
          end
          object Label25: TLabel
            Left = 182
            Top = 82
            Width = 63
            Height = 13
            Caption = #20914#25269#37324#31243#65306' '
          end
          object Label26: TLabel
            Left = 13
            Top = 109
            Width = 75
            Height = 13
            Caption = #25171#21360#20559#31227#37327#65306' '
          end
          object Label27: TLabel
            Left = 170
            Top = 109
            Width = 75
            Height = 13
            Caption = #20256#24863#22120#26497#25968#65306' '
          end
          object Edit20: TEdit
            Left = 243
            Top = 23
            Width = 73
            Height = 21
            Hint = #24403#22825#25968#25454#28165#38646#24320#22987#26102#38388
            TabOrder = 0
            Text = '00:00'
          end
          object Edit21: TEdit
            Left = 86
            Top = 52
            Width = 73
            Height = 21
            Hint = #21462#28040#20813#31561#37324#31243
            TabOrder = 1
            Text = '00.00'
          end
          object Edit22: TEdit
            Left = 242
            Top = 52
            Width = 73
            Height = 21
            Hint = #20999#25442#36895#24230
            TabOrder = 2
            Text = '00.00'
          end
          object Edit23: TEdit
            Left = 86
            Top = 78
            Width = 73
            Height = 21
            Hint = #20914#31243#26102#38388
            TabOrder = 3
            Text = '00.00'
          end
          object Edit24: TEdit
            Left = 242
            Top = 78
            Width = 73
            Height = 21
            Hint = #20914#25269#37324#31243
            TabOrder = 4
            Text = '00.00'
          end
          object Edit25: TEdit
            Left = 86
            Top = 105
            Width = 73
            Height = 21
            Hint = #25171#21360#20559#31227#37327
            MaxLength = 2
            TabOrder = 5
            Text = '0'
            OnKeyPress = Edit25KeyPress
          end
          object RadioGroup1: TRadioGroup
            Left = 5
            Top = 131
            Width = 150
            Height = 33
            Caption = #20914#31243
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              #20914'  '#31243' '
              #19981#20914#31243)
            TabOrder = 6
          end
          object RadioGroup2: TRadioGroup
            Left = 165
            Top = 131
            Width = 150
            Height = 33
            Caption = #31561#20505
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              #33258#21160
              #25163#21160)
            TabOrder = 7
          end
          object RadioGroup3: TRadioGroup
            Left = 5
            Top = 176
            Width = 150
            Height = 33
            Caption = #21333#31243
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              #33258#21160
              #25163#21160)
            TabOrder = 8
          end
          object RadioGroup4: TRadioGroup
            Left = 165
            Top = 176
            Width = 150
            Height = 33
            Caption = #25171#21360
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              #33258#21160
              #25163#21160)
            TabOrder = 9
          end
          object Edit26: TEdit
            Left = 242
            Top = 105
            Width = 73
            Height = 21
            Hint = #20256#24863#22120#26497#25968
            MaxLength = 2
            TabOrder = 10
            Text = '0'
            OnKeyPress = Edit25KeyPress
          end
          object RadioGroup5: TRadioGroup
            Left = 5
            Top = 218
            Width = 150
            Height = 33
            Caption = #19968#21345#36890
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              #24320'  '#36890' '
              #20851'  '#38381)
            TabOrder = 11
          end
          object RadioGroup6: TRadioGroup
            Left = 165
            Top = 218
            Width = 150
            Height = 33
            Caption = 'GPS'
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              #24320'  '#36890' '
              #20851'  '#38381)
            TabOrder = 12
          end
          object RadioGroup7: TRadioGroup
            Left = 62
            Top = 259
            Width = 217
            Height = 33
            Caption = #26368#22823#33829#36816#25968#25454
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              #35206#30422#21382#21490#25968#25454'   '
              #20572' '#27490' '#33829' '#36816)
            TabOrder = 13
          end
          object RadioGroup8: TRadioGroup
            Left = 62
            Top = 299
            Width = 217
            Height = 118
            Caption = #25968#25454#36827#21046
            ItemIndex = 0
            Items.Strings = (
              #26174#31034#22235#33293#20116#20837#21040#20998
              #26174#31034#22235#33293#20116#20837#21040#35282
              #26174#31034#22235#33293#20116#20837#21040#20803
              #22235#33293#20845#20837#20116#22855#36827)
            TabOrder = 14
          end
          object RadioGroup9: TRadioGroup
            Left = 323
            Top = 0
            Width = 310
            Height = 438
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
            TabOrder = 15
          end
        end
      end
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 568
    Top = 550
  end
end
