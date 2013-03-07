object SeeEmergncyAlarmDetailFrm: TSeeEmergncyAlarmDetailFrm
  Left = 405
  Top = 304
  Width = 381
  Height = 320
  Caption = #26597#30475#32039#24613#25253#35686#35814#32454#24773#20917
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 373
    Height = 54
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 10
      Top = 4
      Width = 57
      Height = 25
      Action = Pic_Previous
    end
    object Label1: TLabel
      Left = 279
      Top = 14
      Width = 52
      Height = 13
      Caption = #36710#29260#21495#65306
    end
    object SpeedButton2: TSpeedButton
      Left = 66
      Top = 4
      Width = 57
      Height = 25
      Action = Pic_Next
    end
    object Label3: TLabel
      Left = 118
      Top = 36
      Width = 13
      Height = 13
      Caption = #31186
    end
    object CheckBoxShowPicTimerPlay: TCheckBox
      Left = 7
      Top = 36
      Width = 73
      Height = 14
      Caption = #24187#28783#25773#25918
      TabOrder = 1
      OnClick = CheckBoxShowPicTimerPlayClick
    end
    object EditCarNo: TEdit
      Left = 276
      Top = 29
      Width = 88
      Height = 21
      Color = clYellow
      ReadOnly = True
      TabOrder = 2
      Text = 'EditCarNo'
    end
    object BitBtn1: TBitBtn
      Left = 157
      Top = 2
      Width = 97
      Height = 25
      Action = Action_ShowStartAddr
      Caption = #26597#30475#25253#35686#22320#28857
      TabOrder = 3
    end
    object BitBtn2: TBitBtn
      Left = 157
      Top = 26
      Width = 97
      Height = 25
      Action = Action_ShowRemoveAddr
      Caption = #26597#30475#35299#38500#22320#28857
      TabOrder = 4
    end
    object EditPicShowInterval: TEdit
      Left = 83
      Top = 31
      Width = 33
      Height = 21
      TabOrder = 0
      Text = 'EditPicShowInterval'
      OnChange = EditPicShowIntervalChange
      OnKeyPress = EditPicShowIntervalKeyPress
    end
  end
  object Panel2: TPanel
    Left = 242
    Top = 54
    Width = 131
    Height = 182
    Align = alRight
    BevelOuter = bvLowered
    TabOrder = 1
    object cxPicList: TcxTreeList
      Left = 1
      Top = 1
      Width = 129
      Height = 180
      Align = alClient
      Bands = <
        item
          Caption.AlignHorz = taCenter
          Caption.Text = #22522#26412#20449#24687
        end>
      BufferedPaint = True
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      OptionsData.Editing = False
      OptionsData.Deleting = False
      OptionsSelection.CellSelect = False
      OptionsView.GridLines = tlglBoth
      OptionsView.ShowRoot = False
      ParentFont = False
      StateImages = Mainf.ImageList1
      TabOrder = 0
      OnChange = cxPicListClick
      OnClick = cxPicListClick
      object cxCol_CarNo: TcxTreeListColumn
        Visible = False
        Caption.Text = #36710#29260#21495
        DataBinding.ValueType = 'String'
        Width = 66
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object cxCol_PicTime: TcxTreeListColumn
        Caption.Text = #26102#38388
        DataBinding.ValueType = 'String'
        Width = 112
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 0
        SortOrder = soDescending
      end
      object cxCol_PicReason: TcxTreeListColumn
        Caption.Text = #25293#29031#21407#22240
        DataBinding.ValueType = 'String'
        Width = 89
        Position.ColIndex = 2
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object cxCol_PicPosition: TcxTreeListColumn
        Caption.Text = #25293#29031#20301#32622
        DataBinding.ValueType = 'String'
        Width = 60
        Position.ColIndex = 3
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object cxCol_PicFileName: TcxTreeListColumn
        Caption.Text = #25991#20214#21517
        DataBinding.ValueType = 'String'
        Position.ColIndex = 4
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
    end
  end
  object PanelPic: TPanel
    Left = 0
    Top = 54
    Width = 242
    Height = 182
    Align = alClient
    BevelOuter = bvLowered
    Caption = #26080#29031#29255
    TabOrder = 2
    object Image1: TImage
      Left = 1
      Top = 1
      Width = 240
      Height = 180
      Align = alClient
      AutoSize = True
      Center = True
      Proportional = True
    end
  end
  object PanelRecordInfo: TPanel
    Left = 0
    Top = 236
    Width = 373
    Height = 57
    Align = alBottom
    BevelOuter = bvLowered
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object GroupBoxRecordInfo: TGroupBox
      Left = 1
      Top = 1
      Width = 371
      Height = 6
      Align = alClient
      Caption = #24405#38899
      Font.Charset = GB2312_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label22: TLabel
        Left = 95
        Top = 8
        Width = 59
        Height = 13
        Caption = #25773#25918#36827#24230':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object EditRecordFile: TEdit
        Left = 208
        Top = 0
        Width = 241
        Height = 21
        TabOrder = 0
        Text = 'EditRecordFile'
        Visible = False
      end
      object MediaPlayer1: TMediaPlayer
        Left = 4
        Top = 22
        Width = 85
        Height = 23
        VisibleButtons = [btPlay, btPause, btStop]
        AutoEnable = False
        TabOrder = 1
        OnClick = MediaPlayer1Click
      end
      object ProgressBarPlaySound: TProgressBar
        Left = 96
        Top = 27
        Width = 265
        Height = 16
        Smooth = True
        TabOrder = 2
      end
    end
    object GroupBoxDownFtpRecordFile: TGroupBox
      Left = 1
      Top = 7
      Width = 371
      Height = 49
      Align = alBottom
      TabOrder = 1
      object BitBtnDownFtpRecordFile: TBitBtn
        Left = 8
        Top = 14
        Width = 98
        Height = 25
        Caption = #19979#36733#24405#38899#25991#20214
        TabOrder = 0
        OnClick = BitBtnDownFtpRecordFileClick
      end
      object ProgressBarDownFtpRecordFile: TProgressBar
        Left = 115
        Top = 19
        Width = 208
        Height = 16
        Smooth = True
        TabOrder = 1
      end
    end
  end
  object PanelLoadPic: TPanel
    Left = 24
    Top = 128
    Width = 202
    Height = 49
    BevelInner = bvSpace
    BevelOuter = bvSpace
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    object Label2: TLabel
      Left = 16
      Top = 8
      Width = 99
      Height = 13
      Caption = #27491#22312#36733#20837#29031#29255'...'
    end
    object ProgressBarLoadPic: TProgressBar
      Left = 2
      Top = 31
      Width = 198
      Height = 16
      Align = alBottom
      Smooth = True
      TabOrder = 0
    end
  end
  object ActionList1: TActionList
    Left = 56
    Top = 88
    object Action_ShowStartAddr: TAction
      Category = #22320#22270#19978#26597#30475
      Caption = #26597#30475#25253#35686#22320#28857
      Hint = #22320#22270#19978#26597#30475#25253#35686#22320#28857
      OnExecute = Action_ShowStartAddrExecute
    end
    object Action_ShowRemoveAddr: TAction
      Category = #22320#22270#19978#26597#30475
      Caption = #26597#30475#35299#38500#22320#28857
      Hint = #22320#22270#19978#26597#30475#35299#38500#25253#35686#22320#28857
      OnExecute = Action_ShowRemoveAddrExecute
    end
    object Pic_Previous: TAction
      Category = 'pic'
      Caption = #19978#19968#24352
      OnExecute = Pic_PreviousExecute
    end
    object Pic_Next: TAction
      Category = 'pic'
      Caption = #19979#19968#24352
      OnExecute = Pic_NextExecute
    end
  end
  object TimerMedia: TTimer
    Enabled = False
    OnTimer = TimerMediaTimer
    Left = 104
    Top = 88
  end
  object TimerPicPlay: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = TimerPicPlayTimer
    Left = 32
    Top = 88
  end
end
