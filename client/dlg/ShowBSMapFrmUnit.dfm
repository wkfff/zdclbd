object ShowBSMapFrm: TShowBSMapFrm
  Left = 0
  Top = 210
  Width = 1024
  Height = 500
  Caption = #23548#33322#22320#22270
  Color = clBtnFace
  DragKind = dkDock
  DragMode = dmAutomatic
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 185
    Height = 466
    Align = alLeft
    TabOrder = 0
    object Panel3: TPanel
      Left = 0
      Top = 296
      Width = 185
      Height = 313
      Caption = 'Panel3'
      TabOrder = 0
      Visible = False
      object Label1: TLabel
        Left = 8
        Top = 124
        Width = 81
        Height = 13
        AutoSize = False
        Caption = #21047#26032#36710#36742#25968#65306
      end
      object edtURL: TEdit
        Left = 0
        Top = 48
        Width = 181
        Height = 21
        TabOrder = 0
        Text = 'http://'
      end
      object BitBtn1: TBitBtn
        Left = 0
        Top = 64
        Width = 75
        Height = 25
        Caption = #25171#24320
        TabOrder = 1
        OnClick = BitBtn1Click
      end
      object BitBtn2: TBitBtn
        Left = 72
        Top = 96
        Width = 89
        Height = 25
        Caption = #22320#22270#21047#26032#26102#38388
        TabOrder = 2
        OnClick = BitBtn2Click
      end
      object edtInterval: TEdit
        Left = 8
        Top = 98
        Width = 57
        Height = 21
        TabOrder = 3
        Text = '10000'
      end
      object edtDevCount: TEdit
        Left = 88
        Top = 120
        Width = 81
        Height = 21
        TabOrder = 4
        Text = '100'
      end
      object BitBtn3: TBitBtn
        Left = 8
        Top = 192
        Width = 81
        Height = 25
        Caption = #28165#38500#22320#22270#36710#36742
        TabOrder = 5
        OnClick = BitBtn3Click
      end
      object BitBtn4: TBitBtn
        Left = 8
        Top = 280
        Width = 113
        Height = 25
        Caption = #26681#25454#32463#32428#24230#30011#32447#36335
        TabOrder = 6
        OnClick = BitBtn4Click
      end
      object Memo1: TMemo
        Left = 0
        Top = 160
        Width = 177
        Height = 153
        ScrollBars = ssVertical
        TabOrder = 7
        Visible = False
      end
      object BitBtn5: TBitBtn
        Left = 96
        Top = 64
        Width = 75
        Height = 25
        Caption = #20572#27490#21047#26032
        TabOrder = 8
        OnClick = BitBtn5Click
      end
      object Button1: TButton
        Left = 8
        Top = 248
        Width = 75
        Height = 25
        Caption = 'Button1'
        TabOrder = 9
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 8
        Top = 216
        Width = 97
        Height = 25
        Caption = #21152#36733#33258#23450#20041#26631#31614
        TabOrder = 10
        OnClick = Button2Click
      end
      object BitBtn7: TBitBtn
        Left = 104
        Top = 248
        Width = 75
        Height = 25
        Caption = 'BitBtn7'
        TabOrder = 11
        OnClick = BitBtn7Click
      end
    end
    object PanelDeviceList: TPanel
      Left = 1
      Top = 1
      Width = 183
      Height = 464
      Align = alClient
      BevelWidth = 2
      Caption = 'PanelMapList'
      TabOrder = 1
      object Panel4: TPanel
        Left = 2
        Top = 433
        Width = 179
        Height = 29
        Align = alBottom
        BevelOuter = bvLowered
        TabOrder = 0
        object CheckBoxIsShowFile: TCheckBox
          Left = 5
          Top = 2
          Width = 132
          Height = 17
          Caption = #26174#31034#22320#22270#25991#20214
          TabOrder = 0
        end
        object BitBtnCloseMapManager: TBitBtn
          Left = 193
          Top = 0
          Width = 41
          Height = 20
          Caption = #20851'  '#38381
          TabOrder = 1
        end
        object StatusBar1: TStatusBar
          Left = 1
          Top = 1
          Width = 177
          Height = 27
          Align = alClient
          Panels = <
            item
              Width = 50
            end>
        end
      end
      object PanelMapName: TPanel
        Left = 2
        Top = 2
        Width = 179
        Height = 19
        Align = alTop
        BevelOuter = bvLowered
        Caption = 'PanelMapName'
        TabOrder = 1
      end
      object TreeViewMap: TTreeView
        Left = 2
        Top = 21
        Width = 179
        Height = 412
        Align = alClient
        Images = Mainf.ImageList2
        Indent = 19
        PopupMenu = Mainf.PopupMenuMapSet
        ReadOnly = True
        StateImages = Mainf.ImageList2
        TabOrder = 2
        OnContextPopup = TreeViewMapContextPopup
        OnDblClick = TreeViewMapDblClick
      end
    end
  end
  object SplitterRight: TcxSplitter
    Left = 185
    Top = 0
    Width = 8
    Height = 466
    HotZoneClassName = 'TcxSimpleStyle'
    HotZone.SizePercent = 10
    Control = Panel1
  end
  object Panel2: TPanel
    Left = 193
    Top = 0
    Width = 823
    Height = 466
    Align = alClient
    TabOrder = 2
    OnCanResize = Panel2CanResize
    object WebBrowser1: TWebBrowser
      Left = 1
      Top = 1
      Width = 821
      Height = 464
      Align = alClient
      PopupMenu = Mainf.PopupMenu_funDev
      TabOrder = 0
      OnDocumentComplete = WebBrowser1DocumentComplete
      ControlData = {
        4C000000DA540000F52F00000000000000000000000000000000000000000000
        000000004C000000000000000000000001000000E0D057007335CF11AE690800
        2B2E12620A000000000000004C0000000114020000000000C000000000000046
        8000000000000000000000000000000000000000000000000000000000000000
        00000000000000000100000000000000000000000000000000000000}
    end
    object Button3: TButton
      Left = 496
      Top = 40
      Width = 75
      Height = 25
      Caption = 'Button3'
      TabOrder = 1
      Visible = False
      OnClick = Button3Click
    end
    object Edit1: TEdit
      Left = 24
      Top = 40
      Width = 425
      Height = 21
      TabOrder = 2
      Text = 'Edit1'
      Visible = False
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = Timer1Timer
    Left = 152
    Top = 80
  end
  object PopupMenu1: TPopupMenu
    Left = 136
    Top = 288
    object N1: TMenuItem
      Caption = #25918#22823
    end
    object N2: TMenuItem
      Caption = #32553#23567
    end
  end
end
