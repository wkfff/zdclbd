inherited ControlTerminalFrm: TControlTerminalFrm
  Left = 736
  Top = 151
  Caption = #32456#31471#25511#21046
  ClientHeight = 548
  ClientWidth = 522
  Font.Charset = GB2312_CHARSET
  Font.Height = -13
  Font.Name = #23435#20307
  OldCreateOrder = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 522
    Height = 548
    inherited Panel2: TPanel
      Top = 510
      Width = 522
      inherited BitBtn1: TBitBtn
        Left = 155
        OnClick = BitBtn1Click
      end
      inherited BitBtn2: TBitBtn
        Left = 284
      end
    end
    inherited Panel3: TPanel
      Left = 383
      Width = 139
      Height = 510
      inherited ListView1: TListView
        Width = 137
        Height = 451
      end
      inherited Panel4: TPanel
        Width = 137
      end
      inherited Panel6: TPanel
        Top = 481
        Width = 137
        inherited BitBtnSel: TBitBtn
          Width = 66
        end
        inherited BitBtn3: TBitBtn
          Left = 70
          Width = 66
        end
      end
    end
    inherited Panel5: TPanel
      Width = 383
      Height = 510
      inherited Panel7: TPanel
        Width = 383
        Height = 33
        Caption = #32456#31471#25511#21046
      end
      inherited PanProgress: TPanel
        Top = 487
        Width = 383
        TabOrder = 7
        inherited ProgressBar1: TProgressBar
          Width = 379
        end
      end
      object GroupBox1: TGroupBox
        Left = 30
        Top = 37
        Width = 320
        Height = 365
        TabOrder = 8
        object Label1: TLabel
          Left = 19
          Top = 28
          Width = 47
          Height = 13
          Caption = #25320#21495'APN'
        end
        object Label2: TLabel
          Left = 19
          Top = 53
          Width = 65
          Height = 13
          Caption = #25320#21495#29992#25143#21517
        end
        object Label3: TLabel
          Left = 19
          Top = 78
          Width = 52
          Height = 13
          Caption = #25320#21495#23494#30721
        end
        object Label4: TLabel
          Left = 19
          Top = 102
          Width = 87
          Height = 13
          Caption = #22320#22336'(IP/'#22495#21517')'
        end
        object Label5: TLabel
          Left = 19
          Top = 127
          Width = 47
          Height = 13
          Caption = 'TCP'#31471#21475
        end
        object Label6: TLabel
          Left = 306
          Top = 66
          Width = 65
          Height = 13
          Caption = #35774#22791#31867#22411#65306
          Visible = False
        end
        object Label7: TLabel
          Left = 306
          Top = 91
          Width = 65
          Height = 13
          Caption = #21378#21830#26631#35782#65306
          Visible = False
        end
        object Label8: TLabel
          Left = 19
          Top = 202
          Width = 65
          Height = 13
          Caption = #30828#20214#29256#26412#21495
        end
        object Label9: TLabel
          Left = 19
          Top = 226
          Width = 65
          Height = 13
          Caption = #36719#20214#29256#26412#21495
        end
        object Label13: TLabel
          Left = 19
          Top = 177
          Width = 53
          Height = 13
          Caption = #21046#36896#21830'ID'
        end
        object Label11: TLabel
          Left = 19
          Top = 251
          Width = 73
          Height = 13
          Caption = #21319#32423'URL'#22320#22336
        end
        object Label12: TLabel
          Left = 19
          Top = 276
          Width = 130
          Height = 13
          Caption = #36830#25509#21040#21319#32423#26381#21153#22120#26102#38480
        end
        object Label10: TLabel
          Left = 19
          Top = 152
          Width = 47
          Height = 13
          Caption = 'UDP'#31471#21475
        end
        object Label14: TLabel
          Left = 19
          Top = 338
          Width = 91
          Height = 13
          Caption = #30417#31649#24179#21488#37492#26435#30721
        end
        object Edit88: TEdit
          Left = 297
          Top = 175
          Width = 121
          Height = 21
          Enabled = False
          MaxLength = 3
          TabOrder = 6
          Visible = False
          OnKeyPress = Edit5KeyPress
        end
        object Edit99: TEdit
          Left = 297
          Top = 200
          Width = 121
          Height = 21
          Enabled = False
          TabOrder = 7
          Visible = False
          OnKeyPress = Edit99KeyPress
        end
        object ComboBox1: TComboBox
          Left = 321
          Top = 62
          Width = 121
          Height = 21
          Enabled = False
          ItemHeight = 13
          TabOrder = 10
          Visible = False
          OnChange = ComboBox1Change
        end
        object ComboBox2: TComboBox
          Left = 321
          Top = 87
          Width = 121
          Height = 21
          Enabled = False
          ItemHeight = 13
          TabOrder = 12
          Visible = False
          OnChange = ComboBox2Change
        end
        object Edit6: TEdit
          Left = 395
          Top = 22
          Width = 49
          Height = 21
          Enabled = False
          TabOrder = 11
          Visible = False
        end
        object Edit7: TEdit
          Left = 395
          Top = 47
          Width = 49
          Height = 21
          Enabled = False
          TabOrder = 13
          Visible = False
        end
        object Edit1: TComboBox
          Left = 168
          Top = 24
          Width = 121
          Height = 21
          Enabled = False
          ItemHeight = 13
          TabOrder = 0
        end
        object Edit2: TComboBox
          Left = 168
          Top = 49
          Width = 121
          Height = 21
          Enabled = False
          ItemHeight = 13
          TabOrder = 1
        end
        object Edit3: TComboBox
          Left = 168
          Top = 74
          Width = 121
          Height = 21
          Enabled = False
          ItemHeight = 13
          TabOrder = 2
        end
        object Edit4: TComboBox
          Left = 168
          Top = 98
          Width = 121
          Height = 21
          Enabled = False
          ItemHeight = 13
          TabOrder = 3
        end
        object Edit5: TComboBox
          Left = 168
          Top = 123
          Width = 121
          Height = 21
          Enabled = False
          ItemHeight = 13
          TabOrder = 4
          OnExit = Edit5Exit
          OnKeyPress = Edit5KeyPress
        end
        object Edit13: TComboBox
          Left = 168
          Top = 173
          Width = 121
          Height = 21
          ItemHeight = 13
          TabOrder = 5
          OnExit = Edit13Exit
          OnKeyPress = Edit5KeyPress
        end
        object Edit111: TEdit
          Left = 296
          Top = 225
          Width = 121
          Height = 21
          TabOrder = 8
          Visible = False
        end
        object Edit127: TEdit
          Left = 296
          Top = 250
          Width = 121
          Height = 21
          TabOrder = 9
          Visible = False
        end
        object Edit8: TComboBox
          Left = 168
          Top = 198
          Width = 121
          Height = 21
          ItemHeight = 13
          TabOrder = 14
        end
        object Edit9: TComboBox
          Left = 168
          Top = 222
          Width = 121
          Height = 21
          ItemHeight = 13
          TabOrder = 15
        end
        object Edit11: TComboBox
          Left = 168
          Top = 247
          Width = 121
          Height = 21
          ItemHeight = 13
          TabOrder = 16
        end
        object Edit12: TComboBox
          Left = 168
          Top = 272
          Width = 121
          Height = 21
          ItemHeight = 13
          TabOrder = 17
          OnExit = Edit12Exit
          OnKeyPress = Edit5KeyPress
        end
        object RadioButton8: TRadioButton
          Left = 7
          Top = 307
          Width = 140
          Height = 17
          Caption = #20999#25442#21040#25351#23450#30417#31649#24179#21488
          Checked = True
          TabOrder = 18
          TabStop = True
          OnClick = RadioButton8Click
        end
        object RadioButton9: TRadioButton
          Left = 149
          Top = 307
          Width = 166
          Height = 17
          Caption = #20999#25442#22238#21040#21407#32570#30465#30417#25511#24179#21488
          TabOrder = 19
          OnClick = RadioButton8Click
        end
        object Edit10: TComboBox
          Left = 168
          Top = 148
          Width = 121
          Height = 21
          ItemHeight = 13
          TabOrder = 20
        end
        object Edit14: TComboBox
          Left = 168
          Top = 334
          Width = 121
          Height = 21
          Enabled = False
          ItemHeight = 13
          TabOrder = 21
          OnExit = Edit12Exit
        end
      end
      object RadioButton1: TRadioButton
        Left = 38
        Top = 411
        Width = 113
        Height = 17
        Caption = #32456#31471#20851#26426
        TabOrder = 2
        OnClick = RadioButton1Click
      end
      object RadioButton2: TRadioButton
        Left = 38
        Top = 435
        Width = 113
        Height = 17
        Caption = #32456#31471#22797#20301
        TabOrder = 3
        OnClick = RadioButton1Click
      end
      object RadioButton3: TRadioButton
        Left = 38
        Top = 459
        Width = 135
        Height = 17
        Caption = #32456#31471#24674#22797#20986#21378#35774#32622
        TabOrder = 4
        OnClick = RadioButton1Click
      end
      object RadioButton4: TRadioButton
        Left = 209
        Top = 411
        Width = 113
        Height = 17
        Caption = #20851#38381#25968#25454#36890#20449
        TabOrder = 5
        OnClick = RadioButton1Click
      end
      object RadioButton5: TRadioButton
        Left = 209
        Top = 435
        Width = 137
        Height = 17
        Caption = #20851#38381#25152#26377#26080#32447#36890#20449
        TabOrder = 6
        OnClick = RadioButton1Click
      end
      object RadioButton6: TRadioButton
        Left = 33
        Top = 36
        Width = 72
        Height = 17
        Caption = #26080#32447#21319#32423
        TabOrder = 1
        OnClick = RadioButton6Click
      end
      object RadioButton7: TRadioButton
        Left = 126
        Top = 36
        Width = 72
        Height = 17
        Caption = #36830#25509#25511#21046
        TabOrder = 9
        OnClick = RadioButton6Click
      end
    end
  end
end
