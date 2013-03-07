object ZDCLJKFrm: TZDCLJKFrm
  Left = 440
  Top = 155
  Width = 836
  Height = 517
  Caption = #37325#28857#36710#36742#30417#25511
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel_Map: TPanel
    Left = 0
    Top = 0
    Width = 648
    Height = 483
    Align = alClient
    AutoSize = True
    Caption = 'Panel_Map'
    PopupMenu = PopupMenu_funDev
    TabOrder = 0
    OnCanResize = Panel_MapCanResize
    object Panel_BirdEyeSet: TPanel
      Left = 1
      Top = 1
      Width = 176
      Height = 151
      Caption = 'Panel_BirdEyeSet'
      TabOrder = 0
      Visible = False
      object Panel_birdEye: TPanel
        Left = 1
        Top = 23
        Width = 174
        Height = 127
        Align = alClient
        BevelOuter = bvNone
        Caption = '`'
        TabOrder = 0
      end
      object TrackBarOutlook: TTrackBar
        Left = 1
        Top = 1
        Width = 174
        Height = 22
        Align = alTop
        Min = 1
        PageSize = 1
        Position = 3
        TabOrder = 1
      end
    end
    object Panel_data_display: TPanel
      Left = 73
      Top = 161
      Width = 187
      Height = 171
      Cursor = crArrow
      Caption = 'Panel_data_display'
      TabOrder = 1
      Visible = False
    end
    object Button1: TButton
      Left = 408
      Top = 408
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 2
    end
    object WebBrowser1: TWebBrowser
      Left = 1
      Top = 1
      Width = 646
      Height = 481
      Align = alClient
      PopupMenu = Mainf.PopupMenu_funDev
      TabOrder = 3
      OnDocumentComplete = WebBrowser1DocumentComplete
      ControlData = {
        4C000000C4420000B63100000000000000000000000000000000000000000000
        000000004C000000000000000000000001000000E0D057007335CF11AE690800
        2B2E12620A000000000000004C0000000114020000000000C000000000000046
        8000000000000000000000000000000000000000000000000000000000000000
        00000000000000000100000000000000000000000000000000000000}
    end
  end
  object PageControl1: TPageControl
    Left = 656
    Top = 0
    Width = 172
    Height = 483
    ActivePage = TabSheet1
    Align = alRight
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #29366#24577
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      object DeviceStateList: TValueListEditor
        Left = 0
        Top = 0
        Width = 164
        Height = 455
        Align = alClient
        DefaultRowHeight = 17
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect, goThumbTracking]
        Strings.Strings = (
          #23450#20301#29366#24577'='
          #35199#32463#19996#32463'='
          #21335#32428#21271#32428'='
          'ACC'#29366#24577'='
          #36816#33829#29366#24577'='
          #31354#36710#37325#36710'='
          #32463#32428#24230#29366#24577'='
          #36710#36742#27833#36335'='
          #36710#36742#30005#36335'='
          #36710#38376#29366#24577'='
          'GPS'#27169#22359'='
          'GPS'#22825#32447'='
          'GPS'#22825#32447#30701#36335'='
          #32039#24613#25253#35686'='
          #36229#36895#25253#35686'='
          #30130#21171#39550#39542#25253#35686'='
          #39044#35686'='
          #32456#31471#20027#30005#28304#27424#21387#25253#35686'='
          #32456#31471#20027#30005#28304#25481#30005#25253#35686'='
          #32456#31471'LCD'#25110#26174#31034#22120'='
          'TTS'#27169#22359'='
          #25668#20687#22836'='
          #24403#22825#32047#35745#39550#39542#36229#26102#25253#35686'='
          #36229#26102#20572#36710#25253#35686'='
          #36827#20986#21306#22495#25253#35686'='
          #36827#20986#36335#32447#25253#35686'='
          #36335#27573#34892#39542#26102#38388'='
          #36335#32447#20559#31163#25253#35686'='
          #36710#36742'VSS='
          #36710#36742#27833#37327'='
          #36710#36742#34987#30423#25253#35686'='
          #36710#36742#38750#27861#28857#28779#25253#35686'='
          #36710#36742#38750#27861#20301#31227#25253#35686'='
          #30896#25758#20391#32763#25253#35686#25253#35686'='
          #27833#37327'='
          #37324#31243'='
          'SIM'#21345'='
          'GPS'#26085#26399'='
          'GPS'#26102#38388'=')
        TabOrder = 0
        TitleCaptions.Strings = (
          #29366#24577#21517#31216
          #29366#24577)
        OnDrawCell = DeviceStateListDrawCell
        ColWidths = (
          79
          62)
      end
    end
  end
  object SplitterRight: TcxSplitter
    Left = 648
    Top = 0
    Width = 8
    Height = 483
    HotZoneClassName = 'TcxMediaPlayer9Style'
    HotZone.SizePercent = 10
    AlignSplitter = salRight
    Control = PageControl1
  end
  object Timer1: TTimer
    Interval = 3000
    OnTimer = Timer1Timer
    Left = 370
    Top = 192
  end
  object PopupMenu_funDev: TPopupMenu
    AutoHotkeys = maManual
    OwnerDraw = True
    Left = 464
    Top = 327
    object N5: TMenuItem
      Caption = #23450#20301
    end
    object N17: TMenuItem
      Caption = #30417#25511#21442#25968
      OnClick = N17Click
    end
    object N282: TMenuItem
      Caption = '-'
    end
    object N62: TMenuItem
      Caption = #25293#29031
      OnClick = N62Click
    end
    object N125: TMenuItem
      Caption = #27833#36335#30005#36335#25511#21046
      OnClick = N125Click
    end
    object N4: TMenuItem
      Caption = #21457#36865#22238#25320#30005#35805
      OnClick = N4Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object N91: TMenuItem
      Caption = #32456#31471#25511#21046
      OnClick = N91Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object N2: TMenuItem
      Caption = #21457#36865#20449#24687
      OnClick = N2Click
    end
  end
  object ActionList1: TActionList
    Left = 114
    Top = 400
    object Hot_zoom_out: TAction
      Category = #22320#22270#24037#20855
      Caption = 'Hot_zoom_out'
    end
    object Hot_zoom_in: TAction
      Category = #22320#22270#24037#20855
      Caption = 'Hot_zoom_in'
    end
  end
end
