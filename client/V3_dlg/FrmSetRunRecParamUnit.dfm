inherited frmSetRunRecParam: TfrmSetRunRecParam
  Left = 138
  Top = 201
  Caption = #34892#39542#35760#24405#21442#25968#19979#20256
  ClientHeight = 379
  ClientWidth = 607
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 607
    Height = 379
    inherited Panel2: TPanel
      Top = 341
      Width = 607
      inherited BitBtn1: TBitBtn
        Left = 182
        Width = 73
        OnClick = BitBtn1Click
      end
      inherited BitBtn2: TBitBtn
        Left = 303
        Width = 73
      end
    end
    inherited Panel3: TPanel
      Left = 470
      Width = 137
      Height = 341
      inherited ListView1: TListView
        Width = 135
        Height = 282
      end
      inherited Panel4: TPanel
        Width = 135
      end
      inherited Panel6: TPanel
        Top = 312
        Width = 135
        inherited BitBtnSel: TBitBtn
          Left = 4
          Width = 64
        end
        inherited BitBtn3: TBitBtn
          Left = 68
          Width = 64
        end
      end
    end
    inherited Panel5: TPanel
      Width = 470
      Height = 341
      object Label19: TLabel [0]
        Left = 325
        Top = 49
        Width = 63
        Height = 13
        Caption = #21327#35758#26631#20934#65306' '
      end
      inherited Panel7: TPanel
        Width = 470
        Height = 41
        Caption = #34892#39542#35760#24405#21442#25968#19979#20256
        Font.Style = [fsBold]
      end
      inherited PanProgress: TPanel
        Top = 318
        Width = 470
        inherited ProgressBar1: TProgressBar
          Width = 466
        end
      end
      object GroupBox1: TGroupBox
        Left = 7
        Top = 68
        Width = 458
        Height = 249
        Caption = #34892#39542#35760#24405#21442#25968
        TabOrder = 2
        object Notebook1: TNotebook
          Left = 2
          Top = 15
          Width = 454
          Height = 232
          Align = alClient
          PageIndex = 1
          TabOrder = 0
          object TPage
            Left = 0
            Top = 0
            Caption = 'old'
            object Label14: TLabel
              Left = 27
              Top = 98
              Width = 78
              Height = 13
              AutoSize = False
              Caption = #36710#36742'VIN'#21495
            end
            object Label15: TLabel
              Left = 27
              Top = 122
              Width = 78
              Height = 13
              AutoSize = False
              Caption = #36710#29260#21495#30721
            end
            object Label16: TLabel
              Left = 27
              Top = 146
              Width = 78
              Height = 13
              AutoSize = False
              Caption = #36710#29260#20998#31867
            end
            object Label17: TLabel
              Left = 28
              Top = 29
              Width = 90
              Height = 13
              Caption = #39550#39542#21592#20195#30721'          '
            end
            object Label18: TLabel
              Left = 28
              Top = 53
              Width = 90
              Height = 13
              Caption = #39550#39542#35777#21495#30721'          '
            end
            object chkSetTime_Old: TCheckBox
              Left = 4
              Top = 176
              Width = 130
              Height = 17
              Caption = #35774#32622#35760#24405#20202#26102#38047
              TabOrder = 0
              OnClick = chkSetTime_OldClick
            end
            object chkSetCarInfo_Old: TCheckBox
              Left = 4
              Top = 77
              Width = 129
              Height = 17
              Caption = #35774#32622#36710#36742#20449#24687
              TabOrder = 1
              OnClick = chkSetCarInfo_OldClick
            end
            object edtVIN_Old: TEdit
              Left = 137
              Top = 94
              Width = 146
              Height = 21
              Color = clBtnFace
              MaxLength = 17
              TabOrder = 2
              OnKeyPress = edtVINKeyPress
            end
            object edtCarNo_Old: TEdit
              Left = 137
              Top = 118
              Width = 146
              Height = 21
              Color = clBtnFace
              MaxLength = 12
              TabOrder = 3
            end
            object cbxCarType_Old: TComboBox
              Left = 137
              Top = 142
              Width = 146
              Height = 21
              Style = csDropDownList
              Color = clBtnFace
              ItemHeight = 13
              ItemIndex = 0
              TabOrder = 4
              Text = #22823#22411#27773#36710#21495#29260
              Items.Strings = (
                #22823#22411#27773#36710#21495#29260
                #25346#36710#21495#29260
                #23567#22411#27773#36710#21495#29260
                #20351#39302#27773#36710#21495#29260
                #39046#39302#27773#36710#21495#29260
                #28207#28595#20837#20986#22659#36710#21495#29260
                #25945#32451#27773#36710#21495#29260
                #35686#29992#27773#36710#21495#29260)
            end
            object dtRunRecDate_Old: TDateTimePicker
              Left = 137
              Top = 174
              Width = 79
              Height = 21
              Date = 40834.429970520830000000
              Time = 40834.429970520830000000
              Color = clBtnFace
              Enabled = False
              TabOrder = 5
            end
            object dtRunRecTime_Old: TDateTimePicker
              Left = 215
              Top = 174
              Width = 68
              Height = 21
              Date = 40732.429970520830000000
              Time = 40732.429970520830000000
              Color = clBtnFace
              Enabled = False
              Kind = dtkTime
              TabOrder = 6
            end
            object chkSetDriverInfo_old: TCheckBox
              Left = 4
              Top = 5
              Width = 125
              Height = 17
              Caption = #35774#32622#39550#39542#21592#20449#24687
              TabOrder = 7
              OnClick = chkSetDriverInfo_oldClick
            end
            object chkSetCarProperty_Old: TCheckBox
              Left = 4
              Top = 204
              Width = 139
              Height = 17
              Caption = #35774#32622#36710#36742#29305#24449#31995#25968
              TabOrder = 8
              OnClick = chkSetCarProperty_OldClick
            end
            object edtDriverNo_old: TEdit
              Left = 137
              Top = 25
              Width = 146
              Height = 21
              Color = clBtnFace
              MaxLength = 8
              TabOrder = 9
              OnKeyPress = editPluseKeyPress
            end
            object edtDriverLicense_Old: TEdit
              Left = 137
              Top = 49
              Width = 146
              Height = 21
              Color = clBtnFace
              MaxLength = 18
              TabOrder = 10
            end
            object edtCarProperty_old: TEdit
              Left = 137
              Top = 202
              Width = 146
              Height = 21
              Color = clBtnFace
              MaxLength = 8
              TabOrder = 11
              OnKeyPress = editPluseKeyPress
            end
          end
          object TPage
            Left = 0
            Top = 0
            Caption = 'new'
            object Label3: TLabel
              Left = 30
              Top = 30
              Width = 65
              Height = 13
              AutoSize = False
              Caption = #36710#36742'VIN'#21495
            end
            object Label4: TLabel
              Left = 30
              Top = 54
              Width = 65
              Height = 13
              AutoSize = False
              Caption = #36710#29260#21495#30721
            end
            object Label5: TLabel
              Left = 30
              Top = 78
              Width = 65
              Height = 13
              AutoSize = False
              Caption = #36710#29260#20998#31867
            end
            object Label2: TLabel
              Left = 331
              Top = 55
              Width = 20
              Height = 13
              Caption = 'D1  '
            end
            object Label1: TLabel
              Left = 331
              Top = 80
              Width = 20
              Height = 13
              Caption = 'D2  '
            end
            object Label6: TLabel
              Left = 331
              Top = 105
              Width = 20
              Height = 13
              Caption = 'D3  '
            end
            object Label7: TLabel
              Left = 331
              Top = 130
              Width = 20
              Height = 13
              Caption = 'D4  '
            end
            object Label8: TLabel
              Left = 331
              Top = 155
              Width = 20
              Height = 13
              Caption = 'D5  '
            end
            object Label9: TLabel
              Left = 331
              Top = 180
              Width = 20
              Height = 13
              Caption = 'D6  '
            end
            object Label10: TLabel
              Left = 331
              Top = 30
              Width = 26
              Height = 13
              Caption = 'D0    '
            end
            object Label11: TLabel
              Left = 331
              Top = 205
              Width = 20
              Height = 13
              Caption = 'D7  '
            end
            object Label12: TLabel
              Left = 219
              Top = 200
              Width = 112
              Height = 13
              AutoSize = False
              Caption = '('#21333#20301#65306'0.1'#20844#37324')'
            end
            object Label13: TLabel
              Left = 219
              Top = 170
              Width = 113
              Height = 13
              AutoSize = False
              Caption = '('#19981#33021#22823#20110'65535)'
            end
            object CheckBox3: TCheckBox
              Left = 10
              Top = 138
              Width = 126
              Height = 17
              Caption = #35774#32622#35760#24405#20202#26102#38388
              TabOrder = 0
              OnClick = CheckBox3Click
            end
            object CheckBox2: TCheckBox
              Left = 10
              Top = 9
              Width = 116
              Height = 17
              Caption = #35774#32622#36710#36742#20449#24687
              TabOrder = 1
              OnClick = CheckBox2Click
            end
            object edtVIN: TEdit
              Left = 106
              Top = 26
              Width = 148
              Height = 21
              Color = clBtnFace
              Enabled = False
              MaxLength = 17
              TabOrder = 2
              OnKeyPress = edtVINKeyPress
            end
            object edtCarNo: TEdit
              Left = 106
              Top = 50
              Width = 148
              Height = 21
              Color = clBtnFace
              Enabled = False
              MaxLength = 12
              TabOrder = 3
            end
            object date: TDateTimePicker
              Left = 151
              Top = 136
              Width = 79
              Height = 21
              Date = 40834.429970520830000000
              Time = 40834.429970520830000000
              Color = clBtnFace
              Enabled = False
              TabOrder = 4
            end
            object time: TDateTimePicker
              Left = 231
              Top = 136
              Width = 68
              Height = 21
              Date = 40732.429970520830000000
              Time = 40732.429970520830000000
              Color = clBtnFace
              Enabled = False
              Kind = dtkTime
              TabOrder = 5
            end
            object cbxCarType: TComboBox
              Left = 106
              Top = 74
              Width = 148
              Height = 21
              Style = csDropDownList
              Color = clBtnFace
              Enabled = False
              ItemHeight = 13
              ItemIndex = 0
              TabOrder = 6
              Text = #22823#22411#27773#36710#21495#29260
              Items.Strings = (
                #22823#22411#27773#36710#21495#29260
                #25346#36710#21495#29260
                #23567#22411#27773#36710#21495#29260
                #20351#39302#27773#36710#21495#29260
                #39046#39302#27773#36710#21495#29260
                #28207#28595#20837#20986#22659#36710#21495#29260
                #25945#32451#27773#36710#21495#29260
                #35686#29992#27773#36710#21495#29260)
            end
            object CheckBox1: TCheckBox
              Left = 10
              Top = 108
              Width = 132
              Height = 17
              Caption = #35774#32622#21021#27425#23433#35013#26102#38388
              TabOrder = 7
              OnClick = CheckBox1Click
            end
            object installDate: TDateTimePicker
              Left = 151
              Top = 106
              Width = 79
              Height = 21
              Date = 40834.429970520830000000
              Time = 40834.429970520830000000
              Color = clBtnFace
              Enabled = False
              TabOrder = 8
            end
            object installTime: TDateTimePicker
              Left = 231
              Top = 106
              Width = 68
              Height = 21
              Date = 40732.429970520830000000
              Time = 40732.429970520830000000
              Color = clBtnFace
              Enabled = False
              Kind = dtkTime
              TabOrder = 9
            end
            object CheckBox4: TCheckBox
              Left = 314
              Top = 9
              Width = 166
              Height = 17
              Caption = #35774#32622#29366#24577#37327#37197#32622#20449#24687
              TabOrder = 10
              OnClick = CheckBox4Click
            end
            object CheckBox5: TCheckBox
              Left = 10
              Top = 168
              Width = 147
              Height = 17
              Caption = #35774#32622#35760#24405#20202#33033#20914#31995#25968
              TabOrder = 11
              OnClick = CheckBox5Click
            end
            object CheckBox6: TCheckBox
              Left = 10
              Top = 198
              Width = 118
              Height = 17
              Caption = #35774#32622#36215#22987#37324#31243
              TabOrder = 12
              OnClick = CheckBox6Click
            end
            object editPluse: TEdit
              Left = 158
              Top = 166
              Width = 59
              Height = 21
              Color = clBtnFace
              Enabled = False
              MaxLength = 5
              TabOrder = 13
              OnKeyPress = editPluseKeyPress
            end
            object EditInitMileage: TEdit
              Left = 158
              Top = 196
              Width = 59
              Height = 21
              Color = clBtnFace
              Enabled = False
              MaxLength = 8
              TabOrder = 14
              OnKeyPress = editPluseKeyPress
            end
            object EditD0: TEdit
              Left = 357
              Top = 26
              Width = 83
              Height = 21
              Color = clBtnFace
              Enabled = False
              MaxLength = 10
              TabOrder = 15
            end
            object EditD4: TEdit
              Left = 357
              Top = 126
              Width = 83
              Height = 21
              Color = clBtnFace
              Enabled = False
              MaxLength = 10
              TabOrder = 16
              Text = #36828#20809
            end
            object EditD1: TEdit
              Left = 357
              Top = 51
              Width = 83
              Height = 21
              Color = clBtnFace
              Enabled = False
              MaxLength = 10
              TabOrder = 17
            end
            object EditD2: TEdit
              Left = 357
              Top = 76
              Width = 83
              Height = 21
              Color = clBtnFace
              Enabled = False
              MaxLength = 10
              TabOrder = 18
            end
            object EditD3: TEdit
              Left = 357
              Top = 101
              Width = 83
              Height = 21
              Color = clBtnFace
              Enabled = False
              MaxLength = 10
              TabOrder = 19
              Text = #36817#20809
            end
            object EditD5: TEdit
              Left = 357
              Top = 151
              Width = 83
              Height = 21
              Color = clBtnFace
              Enabled = False
              MaxLength = 10
              TabOrder = 20
              Text = #21491#36716#21521
            end
            object EditD6: TEdit
              Left = 357
              Top = 176
              Width = 83
              Height = 21
              Color = clBtnFace
              Enabled = False
              MaxLength = 10
              TabOrder = 21
              Text = #24038#36716#21521
            end
            object EditD7: TEdit
              Left = 357
              Top = 201
              Width = 83
              Height = 21
              Color = clBtnFace
              Enabled = False
              MaxLength = 10
              TabOrder = 22
              Text = #21046#21160
            end
          end
        end
      end
      object RzComboBox1: TRzComboBox
        Left = 389
        Top = 45
        Width = 73
        Height = 21
        Style = csDropDownList
        Ctl3D = False
        FrameVisible = True
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 3
        Text = '2012'#29256
        OnChange = RzComboBox1Change
        Items.Strings = (
          '2003'#29256
          '2012'#29256)
        ItemIndex = 1
      end
    end
  end
end
