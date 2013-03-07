object Frm_AreaToDev: TFrm_AreaToDev
  Left = 229
  Top = 209
  Width = 997
  Height = 239
  Caption = #35774#32622#21040#36710#26426#20013#30340#21306#22495'/'#36335#32447
  Color = clBtnFace
  DragKind = dkDock
  DragMode = dmAutomatic
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RzPageControl1: TRzPageControl
    Left = 0
    Top = 0
    Width = 989
    Height = 164
    ActivePage = TabSheet4
    Align = alClient
    TabIndex = 3
    TabOrder = 0
    OnChange = RzPageControl1Change
    FixedDimension = 19
    object TabSheet1: TRzTabSheet
      Caption = #22278#24418
      object SplitterBottom: TcxSplitter
        Left = 680
        Top = 0
        Width = 8
        Height = 141
        HotZoneClassName = 'TcxMediaPlayer9Style'
        HotZone.SizePercent = 50
        AlignSplitter = salRight
        Control = Panel1
      end
      object Panel1: TPanel
        Left = 688
        Top = 0
        Width = 297
        Height = 141
        Align = alRight
        Caption = 'Panel1'
        TabOrder = 1
        object ListView4: TListView
          Left = 1
          Top = 1
          Width = 295
          Height = 139
          Align = alClient
          Columns = <
            item
              Caption = #35774#22791'ID'#21495
              Width = 100
            end
            item
              Caption = #36710#29260#21495#30721
              Width = 80
            end>
          GridLines = True
          ReadOnly = True
          RowSelect = True
          TabOrder = 0
          ViewStyle = vsReport
        end
      end
      object ListView1: TListView
        Left = 0
        Top = 0
        Width = 680
        Height = 141
        Align = alClient
        Columns = <
          item
            Caption = 'ID'
            MaxWidth = 1
            MinWidth = 1
            Width = 1
          end
          item
            Caption = #21306#22495#32534#21495
            Width = 70
          end
          item
            Caption = #21306#22495#21517#31216
            Width = 80
          end
          item
            Caption = #25253#35686#31867#22411
            MaxWidth = 1
            MinWidth = 1
            Width = 1
          end
          item
            Caption = #26368#39640#36895#24230
            Width = 80
          end
          item
            Caption = #36229#36895#25345#32493#26102#38388
            Width = 100
          end
          item
            Caption = #22278#24515
            Width = 180
          end
          item
            Caption = #21322#24452
            Width = 100
          end>
        GridLines = True
        ReadOnly = True
        RowSelect = True
        PopupMenu = PopupMenu1
        TabOrder = 2
        ViewStyle = vsReport
        OnClick = ListView1Click
        OnDblClick = ListView1DblClick
      end
    end
    object TabSheet2: TRzTabSheet
      Caption = #30697#24418
      object ListView2: TListView
        Left = 0
        Top = 0
        Width = 664
        Height = 141
        Align = alClient
        Columns = <
          item
            Caption = 'ID'
            MaxWidth = 1
            MinWidth = 1
            Width = 1
          end
          item
            Caption = #21306#22495#32534#21495
            Width = 70
          end
          item
            Caption = #21306#22495#21517#31216
            Width = 80
          end
          item
            Caption = #25253#35686#31867#22411
            MaxWidth = 1
            MinWidth = 1
            Width = 1
          end
          item
            Caption = #26368#39640#36895#24230
            Width = 80
          end
          item
            Caption = #36229#36895#25345#32493#26102#38388
            Width = 100
          end
          item
            Caption = #24038#19978#35282#28857#20449#24687
            Width = 120
          end
          item
            Caption = #21491#19979#35282#28857#20449#24687
            Width = 120
          end>
        GridLines = True
        ReadOnly = True
        RowSelect = True
        PopupMenu = PopupMenu2
        TabOrder = 0
        ViewStyle = vsReport
        OnClick = ListView2Click
        OnDblClick = ListView2DblClick
      end
      object cxSplitter1: TcxSplitter
        Left = 664
        Top = 0
        Width = 8
        Height = 141
        HotZoneClassName = 'TcxMediaPlayer9Style'
        HotZone.SizePercent = 50
        AlignSplitter = salRight
        Control = Panel2
      end
      object Panel2: TPanel
        Left = 672
        Top = 0
        Width = 313
        Height = 141
        Align = alRight
        BevelInner = bvLowered
        TabOrder = 2
        object ListView5: TListView
          Left = 2
          Top = 2
          Width = 309
          Height = 137
          Align = alClient
          Columns = <
            item
              Caption = #35774#22791'ID'#21495
              Width = 100
            end
            item
              Caption = #36710#29260#21495#30721
              Width = 80
            end>
          GridLines = True
          ReadOnly = True
          RowSelect = True
          TabOrder = 0
          ViewStyle = vsReport
        end
      end
    end
    object TabSheet3: TRzTabSheet
      Caption = #19981#35268#21017#22270#24418
      object ListView3: TListView
        Left = 0
        Top = 0
        Width = 696
        Height = 141
        Align = alClient
        Columns = <
          item
            Caption = 'ID'
            MaxWidth = 1
            MinWidth = 1
            Width = 1
          end
          item
            Caption = #21306#22495#32534#21495
            Width = 70
          end
          item
            Caption = #21306#22495#21517#31216
            Width = 80
          end
          item
            Caption = #25253#35686#31867#22411
            MaxWidth = 1
            MinWidth = 1
            Width = 1
          end
          item
            Caption = #26368#39640#36895#24230
            Width = 80
          end
          item
            Caption = #36229#36895#25345#32493#26102#38388
            Width = 100
          end
          item
            Caption = #28857#20449#24687
            Width = 70
          end>
        GridLines = True
        ReadOnly = True
        RowSelect = True
        PopupMenu = PopupMenu3
        TabOrder = 0
        ViewStyle = vsReport
        OnClick = ListView3Click
        OnDblClick = ListView3DblClick
      end
      object Panel3: TPanel
        Left = 704
        Top = 0
        Width = 281
        Height = 141
        Align = alRight
        BevelInner = bvLowered
        TabOrder = 1
        object ListView6: TListView
          Left = 2
          Top = 2
          Width = 277
          Height = 137
          Align = alClient
          Columns = <
            item
              Caption = #35774#22791'ID'#21495
              Width = 100
            end
            item
              Caption = #36710#29260#21495#30721
              Width = 80
            end>
          GridLines = True
          ReadOnly = True
          RowSelect = True
          TabOrder = 0
          ViewStyle = vsReport
        end
      end
      object cxSplitter2: TcxSplitter
        Left = 696
        Top = 0
        Width = 8
        Height = 141
        HotZoneClassName = 'TcxMediaPlayer9Style'
        HotZone.SizePercent = 50
        AlignSplitter = salRight
        Control = Panel3
      end
    end
    object TabSheet4: TRzTabSheet
      Caption = #36335#32447
      object Panel4: TPanel
        Left = 704
        Top = 0
        Width = 281
        Height = 141
        Align = alRight
        BevelInner = bvLowered
        TabOrder = 0
        object ListView7: TListView
          Left = 2
          Top = 2
          Width = 277
          Height = 137
          Align = alClient
          Columns = <
            item
              Caption = #35774#22791'ID'#21495
              Width = 100
            end
            item
              Caption = #36710#29260#21495#30721
              Width = 80
            end>
          GridLines = True
          ReadOnly = True
          RowSelect = True
          TabOrder = 0
          ViewStyle = vsReport
        end
      end
      object cxSplitter3: TcxSplitter
        Left = 696
        Top = 0
        Width = 8
        Height = 141
        HotZoneClassName = 'TcxMediaPlayer9Style'
        HotZone.SizePercent = 50
        AlignSplitter = salRight
        Control = Panel4
      end
      object ListView8: TListView
        Left = 0
        Top = 0
        Width = 696
        Height = 141
        Align = alClient
        Columns = <
          item
            Caption = 'ID'
            MaxWidth = 1
            MinWidth = 1
            Width = 1
          end
          item
            Caption = #36335#32447#32534#21495
            Width = 70
          end
          item
            Caption = #36335#32447#21517#31216
            Width = 80
          end
          item
            Caption = #36335#27573#25968
            Width = 70
          end>
        GridLines = True
        ReadOnly = True
        RowSelect = True
        PopupMenu = PopupMenu4
        TabOrder = 2
        ViewStyle = vsReport
        OnClick = ListView8Click
        OnDblClick = ListView8DblClick
      end
    end
  end
  object RzPanel1: TRzPanel
    Left = 0
    Top = 164
    Width = 989
    Height = 41
    Align = alBottom
    BorderOuter = fsStatus
    TabOrder = 1
    Visible = False
    object RzBitBtn2: TRzBitBtn
      Left = 136
      Top = 8
      Width = 89
      Caption = #21024#38500
      TabOrder = 0
      OnClick = RzBitBtn2Click
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000830B0000830B00000001000000000000000000003300
        00006600000099000000CC000000FF0000000033000033330000663300009933
        0000CC330000FF33000000660000336600006666000099660000CC660000FF66
        000000990000339900006699000099990000CC990000FF99000000CC000033CC
        000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
        0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
        330000333300333333006633330099333300CC333300FF333300006633003366
        33006666330099663300CC663300FF6633000099330033993300669933009999
        3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
        330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
        66006600660099006600CC006600FF0066000033660033336600663366009933
        6600CC336600FF33660000666600336666006666660099666600CC666600FF66
        660000996600339966006699660099996600CC996600FF99660000CC660033CC
        660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
        6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
        990000339900333399006633990099339900CC339900FF339900006699003366
        99006666990099669900CC669900FF6699000099990033999900669999009999
        9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
        990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
        CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
        CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
        CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
        CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
        CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
        FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
        FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
        FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
        FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
        000000808000800000008000800080800000C0C0C00080808000191919004C4C
        4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
        6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E809090909
        0909090909090909E8E8E8E8818181818181818181818181E8E8E8E809101010
        1010101010101009E8E8E8E881ACACACACACACACACACAC81E8E8E8E809101010
        1010101010101009E8E8E8E881ACACACACACACACACACAC81E8E8E8E809090909
        0909090909090909E8E8E8E8818181818181818181818181E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
      NumGlyphs = 2
    end
    object RzBitBtn1: TRzBitBtn
      Left = 24
      Top = 8
      Width = 81
      Caption = #22686#21152
      TabOrder = 1
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000830B0000830B00000001000000000000000000003300
        00006600000099000000CC000000FF0000000033000033330000663300009933
        0000CC330000FF33000000660000336600006666000099660000CC660000FF66
        000000990000339900006699000099990000CC990000FF99000000CC000033CC
        000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
        0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
        330000333300333333006633330099333300CC333300FF333300006633003366
        33006666330099663300CC663300FF6633000099330033993300669933009999
        3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
        330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
        66006600660099006600CC006600FF0066000033660033336600663366009933
        6600CC336600FF33660000666600336666006666660099666600CC666600FF66
        660000996600339966006699660099996600CC996600FF99660000CC660033CC
        660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
        6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
        990000339900333399006633990099339900CC339900FF339900006699003366
        99006666990099669900CC669900FF6699000099990033999900669999009999
        9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
        990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
        CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
        CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
        CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
        CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
        CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
        FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
        FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
        FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
        FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
        000000808000800000008000800080800000C0C0C00080808000191919004C4C
        4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
        6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
        09090909E8E8E8E8E8E8E8E8E8E8E8E881818181E8E8E8E8E8E8E8E8E8E8E8E8
        09101009E8E8E8E8E8E8E8E8E8E8E8E881ACAC81E8E8E8E8E8E8E8E8E8E8E8E8
        09101009E8E8E8E8E8E8E8E8E8E8E8E881ACAC81E8E8E8E8E8E8E8E8E8E8E8E8
        09101009E8E8E8E8E8E8E8E8E8E8E8E881ACAC81E8E8E8E8E8E8E8E809090909
        0910100909090909E8E8E8E88181818181ACAC8181818181E8E8E8E809101010
        1010101010101009E8E8E8E881ACACACACACACACACACAC81E8E8E8E809101010
        1010101010101009E8E8E8E881ACACACACACACACACACAC81E8E8E8E809090909
        0910100909090909E8E8E8E88181818181ACAC8181818181E8E8E8E8E8E8E8E8
        09101009E8E8E8E8E8E8E8E8E8E8E8E881ACAC81E8E8E8E8E8E8E8E8E8E8E8E8
        09101009E8E8E8E8E8E8E8E8E8E8E8E881ACAC81E8E8E8E8E8E8E8E8E8E8E8E8
        09101009E8E8E8E8E8E8E8E8E8E8E8E881ACAC81E8E8E8E8E8E8E8E8E8E8E8E8
        09090909E8E8E8E8E8E8E8E8E8E8E8E881818181E8E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
      NumGlyphs = 2
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 273
    Top = 84
    object N1: TMenuItem
      Caption = #21024#38500#21306#22495
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object N3: TMenuItem
      Caption = #36873#25321#36710#36742
      OnClick = N3Click
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = Timer1Timer
    Left = 521
    Top = 108
  end
  object PopupMenu2: TPopupMenu
    Left = 321
    Top = 88
    object MenuItem1: TMenuItem
      Caption = #21024#38500#21306#22495
      OnClick = MenuItem1Click
    end
    object MenuItem2: TMenuItem
      Caption = '-'
    end
    object MenuItem3: TMenuItem
      Caption = #36873#25321#36710#36742
      OnClick = MenuItem3Click
    end
  end
  object PopupMenu3: TPopupMenu
    Left = 401
    Top = 84
    object MenuItem4: TMenuItem
      Caption = #21024#38500#21306#22495
      OnClick = MenuItem4Click
    end
    object MenuItem5: TMenuItem
      Caption = '-'
    end
    object MenuItem6: TMenuItem
      Caption = #36873#25321#36710#36742
      OnClick = MenuItem6Click
    end
  end
  object PopupMenu4: TPopupMenu
    Left = 489
    Top = 80
    object N4: TMenuItem
      Caption = #21024#38500#36335#32447
      OnClick = N4Click
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object N6: TMenuItem
      Caption = #36873#25321#36710#36742
      OnClick = N6Click
    end
  end
end
