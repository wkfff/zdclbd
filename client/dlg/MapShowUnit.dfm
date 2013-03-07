object MapShowFrm: TMapShowFrm
  Left = 442
  Top = 41
  Width = 696
  Height = 569
  Caption = #22320#22270#31383#21475
  Color = clBtnFace
  DragKind = dkDock
  DragMode = dmAutomatic
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnMouseWheelDown = FormMouseWheelDown
  OnMouseWheelUp = FormMouseWheelUp
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel_Map: TPanel
    Left = 0
    Top = 26
    Width = 688
    Height = 509
    Align = alClient
    AutoSize = True
    Caption = 'Panel_Map'
    TabOrder = 0
    OnResize = Panel_MapResize
    object Panel_BirdEyeSet: TPanel
      Left = 0
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
      Left = 72
      Top = 161
      Width = 187
      Height = 171
      Cursor = crArrow
      Caption = 'Panel_data_display'
      TabOrder = 1
      Visible = False
    end
  end
  object CoolBarMapTool: TCoolBar
    Left = 0
    Top = 0
    Width = 688
    Height = 26
    Bands = <
      item
        Control = ToolBar_MapTools
        ImageIndex = -1
        MinHeight = 26
        Width = 684
      end>
    object ToolBar_MapTools: TToolBar
      Left = 9
      Top = 0
      Width = 504
      Height = 26
      Align = alLeft
      AutoSize = True
      ButtonHeight = 26
      ButtonWidth = 26
      EdgeBorders = []
      Flat = True
      Images = Mainf.ImageList2
      TabOrder = 0
      Transparent = True
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Action = Mainf.tool_not_select
        AutoSize = True
        Grouped = True
        ParentShowHint = False
        ShowHint = True
        Style = tbsCheck
      end
      object ToolButton3: TToolButton
        Left = 23
        Top = 0
        Action = Mainf.tool_zoom_out
        AutoSize = True
        Grouped = True
        ParentShowHint = False
        ShowHint = True
        Style = tbsCheck
      end
      object ToolButton2: TToolButton
        Left = 46
        Top = 0
        Action = Mainf.tool_zoom_in
        AutoSize = True
        Grouped = True
        ParentShowHint = False
        ShowHint = True
        Style = tbsCheck
      end
      object ToolButton4: TToolButton
        Left = 69
        Top = 0
        Action = Mainf.tool_move
        AutoSize = True
        Grouped = True
        ParentShowHint = False
        ShowHint = True
        Style = tbsCheck
      end
      object ToolButton11: TToolButton
        Left = 92
        Top = 0
        Action = Mainf.tool_distance
        AutoSize = True
        Grouped = True
        ParentShowHint = False
        ShowHint = True
        Style = tbsCheck
      end
      object ToolButton10: TToolButton
        Left = 115
        Top = 0
        Action = Mainf.tool_locate
        AutoSize = True
        Grouped = True
        ParentShowHint = False
        ShowHint = True
        Style = tbsCheck
      end
      object ToolButton9: TToolButton
        Left = 138
        Top = 0
        Action = Mainf.tool_UserDefinedtext
        AutoSize = True
        Grouped = True
        ParentShowHint = False
        ShowHint = True
        Style = tbsCheck
      end
      object ToolButton35: TToolButton
        Left = 161
        Top = 0
        Action = Mainf.tool_RectSelect
        AutoSize = True
        Grouped = True
        ParentShowHint = False
        ShowHint = True
        Style = tbsCheck
      end
      object ToolButton5: TToolButton
        Left = 184
        Top = 0
        Action = Mainf.tool_SetConfineAlarmArea
        AutoSize = True
        Grouped = True
        ParentShowHint = False
        ShowHint = True
        Style = tbsCheck
      end
      object ToolButton15: TToolButton
        Left = 207
        Top = 0
        Hint = #28155#21152#31449#21488#20449#24687
        Caption = #31449#21488#28155#21152
        Grouped = True
        ImageIndex = 44
        ParentShowHint = False
        ShowHint = True
        Style = tbsCheck
        Visible = False
      end
      object ToolButton7: TToolButton
        Left = 233
        Top = 0
        Action = Mainf.tool_select_point
      end
      object ToolButton16: TToolButton
        Left = 259
        Top = 0
        Action = Mainf.tool_SetAreaAlarmToDev_Circle
        Grouped = True
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton17: TToolButton
        Left = 285
        Top = 0
        Action = Mainf.tool_SetAreaAlarmToDev_Rect
        Grouped = True
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton18: TToolButton
        Left = 311
        Top = 0
        Action = Mainf.tool_SetAreaAlarmToDev_Polygon
        Grouped = True
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton20: TToolButton
        Left = 337
        Top = 0
        Action = Mainf.tool_SetRunWay
        Grouped = True
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton19: TToolButton
        Left = 363
        Top = 0
        Action = Mainf.tool_FindThing
        AutoSize = True
        Grouped = True
        ParentShowHint = False
        ShowHint = True
        Style = tbsCheck
      end
      object ToolButton13: TToolButton
        Left = 386
        Top = 0
        Action = Mainf.tool_SeekCar
        AutoSize = True
        Grouped = True
        ParentShowHint = False
        ShowHint = True
        Style = tbsCheck
      end
      object ToolButton8: TToolButton
        Left = 409
        Top = 0
        Action = Mainf.map_openLayer
        AutoSize = True
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton14: TToolButton
        Left = 432
        Top = 0
        Action = Mainf.map_CloseLayer
        AutoSize = True
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton12: TToolButton
        Left = 455
        Top = 0
        Action = Mainf.tool_layer_control
        AutoSize = True
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton6: TToolButton
        Left = 478
        Top = 0
        Action = Mainf.Map_Manage
        ParentShowHint = False
        ShowHint = True
        Style = tbsCheck
      end
    end
  end
  object PanelDeviceList: TPanel
    Left = 449
    Top = 39
    Width = 239
    Height = 344
    BevelWidth = 2
    Caption = 'PanelMapList'
    TabOrder = 2
    Visible = False
    object Panel1: TPanel
      Left = 2
      Top = 300
      Width = 235
      Height = 42
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
        OnClick = CheckBoxIsShowFileClick
      end
      object BitBtnCloseMapManager: TBitBtn
        Left = 193
        Top = 0
        Width = 41
        Height = 20
        Caption = #20851'  '#38381
        TabOrder = 1
        OnClick = SpeedButton1Click
      end
      object StatusBar1: TStatusBar
        Left = 1
        Top = 20
        Width = 233
        Height = 21
        Panels = <
          item
            Width = 50
          end>
      end
    end
    object PanelMapName: TPanel
      Left = 2
      Top = 2
      Width = 235
      Height = 19
      Align = alTop
      BevelOuter = bvLowered
      Caption = 'PanelMapName'
      TabOrder = 1
      object Image4: TImage
        Left = 203
        Top = 1
        Width = 30
        Height = 19
        AutoSize = True
        Picture.Data = {
          07544269746D6170CA030000424DCA030000000000006A010000280000001E00
          000013000000010008000000000060020000120B0000120B00004D0000004D00
          000000000000FFFFFF00E9AC7300E9A15700E9A86800E9A96C00E9AB6F00E9A1
          5600E9A25700F8C17B00FCC78200E9AB5400EFB05800FFD38A00FFD48D00FFD7
          9500E19D2600D99A2700D7982700D6972700E4A22B00E6A32D00E9A83200EBAB
          3800FFD07E00FFD07F00FFD99600FFDC9E00FFDC9F00FFDDA000FFDDA100FFDE
          A200E7A83200E9AD3300E9AA3500EBAF3900F0B34200F1B54500F0B84600F3BC
          5200F6C05500F9C55B00FFDEA100FFEDCB00FFF0D300FFF3DC00FFF6E500C993
          1900CF971B00E9AD3200F0B94800F4BF5200F9C65B00F7C96600FAD37200F7D6
          8600C0900F00FBDE9100F9DE9700FBE6AC00E2B32400E2B42700E5B72B00E7BB
          3200EABF3900EDC34100FBE4A100FCEAB300FEEEBE00FEF0C400F1CF5600F3D4
          6500FBE59500FCE9A200F6DB7600FFF4B100FFF59B0034343434343434343434
          3434343434343434343434343434343434342525000003070707070707070707
          0707070707070707070707070707070707073425000003413434343434343434
          3434343434343434343434343434343434340C25000003402424242424242424
          2424242424242424242424242424242525272903000003411717171717171717
          1717171717171717171717171717171717172803000003401616161616161616
          16161616161616161616161616161616162233030000033F1414141414141430
          38383830143038383830141414141414141526030000073F1010101010101038
          01010138303801010138101010101010101023070000073E111111111111112F
          3801010138010101382F111111111111111121070000073D1313131313131313
          2F380101010101382F13131313131313131331070000033C1212121212121212
          122F38010101382F1212121212121212121221030000033D1212121212121313
          132F38010101382F1313121312121212121221030000083C2020202020202021
          3038010101010138302020202020202020203208000008463535353535353511
          3801010138010101381135353535353535353608000004473737373737373738
          01010138113801010138373737373737373739040000054A3A3A3A3A3A3A3A0B
          3838380B3A0B3838380B3A3A3A3A3A3A3A3A4205000006483B3B3B3B3B3B3B3B
          3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B4306000002484444444343444344
          434443444344434443444344434444444444450200000B494B452B2B2B2B2B2B
          2B2B2B2B2B2B2B2B2B2B2B2B2B2B444B4B4B4B0B0000}
      end
      object SpeedButton1: TSpeedButton
        Left = 203
        Top = 1
        Width = 30
        Height = 17
        Flat = True
        OnClick = SpeedButton1Click
      end
    end
    object TreeViewMap: TTreeView
      Left = 2
      Top = 21
      Width = 235
      Height = 279
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
