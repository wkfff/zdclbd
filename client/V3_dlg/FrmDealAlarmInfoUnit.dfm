object frmDealDevAlarmInfo: TfrmDealDevAlarmInfo
  Left = 400
  Top = 303
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #25253#35686#20449#24687#22788#29702
  ClientHeight = 279
  ClientWidth = 419
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 40
    Width = 419
    Height = 239
    Align = alClient
    BevelOuter = bvNone
    Color = 16382438
    TabOrder = 0
    object Notebook1: TNotebook
      Left = 0
      Top = 0
      Width = 419
      Height = 239
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      PageIndex = 1
      ParentFont = False
      TabOrder = 0
      object TPage
        Left = 0
        Top = 0
        Caption = 'AlarmConfirm'
        object Label1: TLabel
          Left = 26
          Top = 24
          Width = 126
          Height = 23
          Caption = #36710#36742#21487#33021#21457#29983
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4227327
          Font.Height = -21
          Font.Name = #21326#25991#26999#20307
          Font.Style = []
          ParentFont = False
        end
        object Memo1: TMemo
          Left = 28
          Top = 64
          Width = 361
          Height = 97
          BevelInner = bvNone
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          BorderStyle = bsNone
          Color = 15197408
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4227327
          Font.Height = -21
          Font.Name = #21326#25991#26999#20307
          Font.Style = [fsBold]
          Lines.Strings = (
            #22914#26524#24744#30830#35748#24403#21069#25253#35686#30495#23454#65292#28857#20987#19979#26041
            #25253#35686#30830#35748#25353#38062#65292#24182#32487#32493#36827#34892#30456#20851#22788#29702
            '('#22914#30417#21548#12289#25293#29031#12289#35299#38500#25253#35686#12289#19979#21457#25253
            #25991#20449#24687')')
          ParentBiDiMode = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object RzButton1: TRzButton
          Left = 315
          Top = 200
          FrameColor = 7617536
          Caption = #25253#35686#30830#35748
          Color = 15791348
          HotTrack = True
          TabOrder = 1
          OnClick = RzButton1Click
        end
        object edtAlarmType: TEdit
          Left = 156
          Top = 21
          Width = 233
          Height = 29
          Color = clMenuBar
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -19
          Font.Name = #21326#25991#26999#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Text = #32039#24613#25253#35686
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'AlarmDeal'
        object RzButton2: TRzButton
          Left = 246
          Top = 205
          Width = 155
          Caption = #22788#29702#32467#26463#65292#30331#35760#22788#29702#24773#20917
          HotTrack = True
          TabOrder = 0
          OnClick = RzButton2Click
        end
        object CheckBox1: TCheckBox
          Left = 20
          Top = 25
          Width = 85
          Height = 17
          Caption = #36710#36742#30417#21548
          TabOrder = 1
          OnClick = CheckBox1Click
        end
        object CheckBox2: TCheckBox
          Left = 20
          Top = 65
          Width = 60
          Height = 15
          Caption = #25293#29031
          TabOrder = 2
          OnClick = CheckBox2Click
        end
        object CheckBox4: TCheckBox
          Left = 20
          Top = 107
          Width = 85
          Height = 15
          Caption = #25253#25991#19979#21457
          TabOrder = 3
          OnClick = CheckBox4Click
        end
        object memoText: TMemo
          Left = 20
          Top = 130
          Width = 381
          Height = 61
          Color = clInfoBk
          Enabled = False
          ScrollBars = ssVertical
          TabOrder = 4
        end
        object btnMonitorCar: TRzButton
          Left = 128
          Top = 21
          FrameColor = 7617536
          Caption = #30417#21548#36710#36742
          Color = 15791348
          Enabled = False
          HotTrack = True
          TabOrder = 5
          OnClick = btnMonitorCarClick
        end
        object btnTakePhoto: TRzButton
          Left = 128
          Top = 60
          FrameColor = 7617536
          Caption = #25293#29031
          Color = 15791348
          Enabled = False
          HotTrack = True
          TabOrder = 6
          OnClick = btnTakePhotoClick
        end
        object btnSendText: TRzButton
          Left = 128
          Top = 102
          FrameColor = 7617536
          Caption = #19979#21457#25253#25991
          Color = 15791348
          Enabled = False
          HotTrack = True
          TabOrder = 7
          OnClick = btnSendTextClick
        end
        object btnRemoveAlarm: TRzButton
          Left = 128
          Top = 205
          Caption = #35299#38500#25253#35686
          Enabled = False
          HotTrack = True
          TabOrder = 8
          OnClick = btnRemoveAlarmClick
        end
        object CheckBox3: TCheckBox
          Left = 20
          Top = 209
          Width = 73
          Height = 17
          Caption = #25253#35686#35299#38500
          TabOrder = 9
          OnClick = CheckBox3Click
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'AlarmDealReg'
        object Label6: TLabel
          Left = 9
          Top = 49
          Width = 60
          Height = 13
          Caption = #25253#35686#22320#28857#65306
        end
        object Label7: TLabel
          Left = 9
          Top = 76
          Width = 60
          Height = 13
          Caption = #22788#29702#36807#31243#65306
        end
        object Label8: TLabel
          Left = 9
          Top = 143
          Width = 60
          Height = 13
          Caption = #22788#29702#32467#26524#65306
        end
        object Label9: TLabel
          Left = 23
          Top = 25
          Width = 48
          Height = 13
          Caption = #25253#35686#20154#65306
        end
        object Label10: TLabel
          Left = 202
          Top = 25
          Width = 72
          Height = 13
          Caption = #25253#35686#20154#30005#35805#65306
        end
        object edtAlarmPos: TEdit
          Left = 72
          Top = 48
          Width = 333
          Height = 21
          MaxLength = 100
          TabOrder = 2
        end
        object edtAlarmPerson: TEdit
          Left = 72
          Top = 21
          Width = 121
          Height = 21
          MaxLength = 20
          TabOrder = 0
        end
        object edtAlarmTel: TEdit
          Left = 274
          Top = 21
          Width = 131
          Height = 21
          MaxLength = 20
          TabOrder = 1
        end
        object memoAlarmDealProc: TMemo
          Left = 72
          Top = 76
          Width = 333
          Height = 57
          MaxLength = 500
          ScrollBars = ssVertical
          TabOrder = 3
        end
        object memoAlarmDealResult: TMemo
          Left = 72
          Top = 141
          Width = 333
          Height = 43
          MaxLength = 200
          ScrollBars = ssVertical
          TabOrder = 4
        end
        object RzButton3: TRzButton
          Left = 295
          Top = 198
          Width = 110
          Height = 26
          Caption = #22788#29702#24773#20917#30331#35760#32467#26463
          HotTrack = True
          TabOrder = 5
          OnClick = RzButton3Click
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 419
    Height = 40
    Align = alTop
    Color = 16382438
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clSilver
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Label2: TLabel
      Left = 32
      Top = 12
      Width = 72
      Height = 16
      AutoSize = False
      Caption = #25253#35686#36710#36742
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 12615680
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edtCarNo: TEdit
      Left = 104
      Top = 9
      Width = 121
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
  end
end
