object QueryCarPictureFrm: TQueryCarPictureFrm
  Left = 192
  Top = 289
  Width = 1051
  Height = 374
  Caption = #26597#35810#22810#23186#20307#20449#24687
  Color = 16382438
  DragKind = dkDock
  DragMode = dmAutomatic
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 321
    Width = 1043
    Height = 19
    Align = alBottom
    ParentColor = True
    TabOrder = 0
    object ProgressBar1: TProgressBar
      Left = 1
      Top = 1
      Width = 1041
      Height = 17
      Align = alClient
      TabOrder = 0
    end
  end
  object PageControl1: TPageControl
    Left = 211
    Top = 0
    Width = 832
    Height = 321
    ActivePage = TabSheet1
    Align = alClient
    MultiLine = True
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #26597#35810#22810#23186#20307#20449#24687
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 824
        Height = 35
        Align = alTop
        ParentColor = True
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 12
          Width = 46
          Height = 13
          Caption = #36710#29260#21495':'
        end
        object Label2: TLabel
          Left = 212
          Top = 12
          Width = 26
          Height = 13
          Caption = #26102#38388
        end
        object Label3: TLabel
          Left = 435
          Top = 12
          Width = 7
          Height = 13
          Caption = '-'
        end
        object ComboBox1: TComboBox
          Left = 56
          Top = 8
          Width = 129
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          Sorted = True
          TabOrder = 0
        end
        object DateTimePicker1: TDateTimePicker
          Left = 244
          Top = 8
          Width = 97
          Height = 21
          Date = 39094.584243125000000000
          Time = 39094.584243125000000000
          TabOrder = 1
        end
        object DateTimePicker2: TDateTimePicker
          Left = 340
          Top = 8
          Width = 89
          Height = 21
          Date = 39094.584861435190000000
          Time = 39094.584861435190000000
          Kind = dtkTime
          TabOrder = 2
        end
        object DateTimePicker4: TDateTimePicker
          Left = 543
          Top = 8
          Width = 89
          Height = 21
          Date = 39094.584861435190000000
          Time = 39094.584861435190000000
          Kind = dtkTime
          TabOrder = 3
        end
        object DateTimePicker3: TDateTimePicker
          Left = 447
          Top = 8
          Width = 97
          Height = 21
          Date = 39094.584243125000000000
          Time = 39094.584243125000000000
          TabOrder = 4
        end
        object Panel5: TPanel
          Left = 653
          Top = 1
          Width = 170
          Height = 33
          Align = alRight
          BevelOuter = bvNone
          ParentColor = True
          TabOrder = 5
          object BitBtnQuery: TBitBtn
            Left = 5
            Top = 4
            Width = 73
            Height = 24
            Caption = #26597#35810
            TabOrder = 1
            OnClick = BitBtnQueryClick
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333333333333333330000333333333333333333333333F33333333333
              00003333344333333333333333388F3333333333000033334224333333333333
              338338F3333333330000333422224333333333333833338F3333333300003342
              222224333333333383333338F3333333000034222A22224333333338F338F333
              8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
              33333338F83338F338F33333000033A33333A222433333338333338F338F3333
              0000333333333A222433333333333338F338F33300003333333333A222433333
              333333338F338F33000033333333333A222433333333333338F338F300003333
              33333333A222433333333333338F338F00003333333333333A22433333333333
              3338F38F000033333333333333A223333333333333338F830000333333333333
              333A333333333333333338330000333333333333333333333333333333333333
              0000}
            NumGlyphs = 2
          end
          object BitBtnClose: TBitBtn
            Left = 87
            Top = 4
            Width = 73
            Height = 24
            Caption = #36864#20986
            TabOrder = 0
            OnClick = BitBtnCloseClick
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777700777777
              77777770E07777777777770EE0777777777700EEE0000000000070EEE0888077
              777770EEE0888077777770EEE0888077777770EEE0888077777770EEE0888077
              707770EEE0888077007770EEE0888070000070EEE0888077007770EEE0888077
              707770EE08888077777770E08888807777777000000000777777}
          end
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 35
        Width = 824
        Height = 258
        Align = alClient
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 1
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 494
          Height = 258
          Align = alLeft
          ParentColor = True
          TabOrder = 0
          object cxPicList: TcxTreeList
            Left = 1
            Top = 1
            Width = 492
            Height = 256
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
            OptionsView.GridLines = tlglBoth
            OptionsView.ShowRoot = False
            ParentFont = False
            PopupMenu = PopupMenu1
            StateImages = Mainf.ImageList1
            TabOrder = 0
            OnChange = cxPicListChange
            OnClick = cxPicListClick
            OnFocusedNodeChanged = cxPicListFocusedNodeChanged
            object cxDeviceListcxTreeListColumn1: TcxTreeListColumn
              Caption.Text = #32534#21495
              DataBinding.ValueType = 'Integer'
              Width = 60
              Position.ColIndex = 1
              Position.RowIndex = 0
              Position.BandIndex = 0
            end
            object cxDeviceListcxTreeListColumn2: TcxTreeListColumn
              Visible = False
              Caption.Text = 'GPS'#26102#38388
              DataBinding.ValueType = 'String'
              Width = 122
              Position.ColIndex = 13
              Position.RowIndex = 0
              Position.BandIndex = 0
              SortOrder = soAscending
            end
            object cxDeviceListcxTreeListColumn3: TcxTreeListColumn
              Caption.Text = #21407#22240
              DataBinding.ValueType = 'String'
              Position.ColIndex = 17
              Position.RowIndex = 0
              Position.BandIndex = 0
            end
            object cxDeviceListcxTreeListColumn4: TcxTreeListColumn
              Caption.Text = #25293#29031#20301#32622
              DataBinding.ValueType = 'String'
              Width = 60
              Position.ColIndex = 19
              Position.RowIndex = 0
              Position.BandIndex = 0
            end
            object cxPicListcxTreeListColumn2: TcxTreeListColumn
              Caption.Text = #19978#20256#26102#38388
              DataBinding.ValueType = 'String'
              Width = 121
              Position.ColIndex = 16
              Position.RowIndex = 0
              Position.BandIndex = 0
            end
            object cxPicListcxTreeListColumn1: TcxTreeListColumn
              Visible = False
              Caption.Text = #25991#20214#21517
              DataBinding.ValueType = 'String'
              Width = 800
              Position.ColIndex = 14
              Position.RowIndex = 0
              Position.BandIndex = 0
            end
            object cxPicListcxTreeListColumn3: TcxTreeListColumn
              Caption.Text = #36710#29260#21495
              DataBinding.ValueType = 'String'
              Options.Editing = False
              Width = 74
              Position.ColIndex = 9
              Position.RowIndex = 0
              Position.BandIndex = 0
            end
            object cxPicListcxTreeListColumn4: TcxTreeListColumn
              Caption.Text = #31867#22411
              DataBinding.ValueType = 'String'
              Width = 73
              Position.ColIndex = 0
              Position.RowIndex = 0
              Position.BandIndex = 0
            end
            object cxPicListcxTreeListColumn5: TcxTreeListColumn
              Visible = False
              Caption.Text = #25991#20214#21517
              DataBinding.ValueType = 'String'
              Position.ColIndex = 8
              Position.RowIndex = 0
              Position.BandIndex = 0
            end
          end
        end
        object Panel6: TPanel
          Left = 502
          Top = 0
          Width = 322
          Height = 258
          Align = alClient
          ParentColor = True
          TabOrder = 1
          object Notebook1: TNotebook
            Left = 1
            Top = 1
            Width = 320
            Height = 256
            Align = alClient
            PageIndex = 1
            TabOrder = 0
            object TPage
              Left = 0
              Top = 0
              Caption = 'pic'
              object Image1: TImage
                Left = 0
                Top = 0
                Width = 302
                Height = 256
                Align = alClient
                Proportional = True
              end
            end
            object TPage
              Left = 0
              Top = 0
              Caption = 'audio'
              object Panel9: TPanel
                Left = 0
                Top = 191
                Width = 320
                Height = 65
                Align = alBottom
                BevelOuter = bvNone
                ParentColor = True
                TabOrder = 0
                object BitBtnPlay: TRzBitBtn
                  Left = 27
                  Top = 21
                  Width = 58
                  Height = 28
                  FrameColor = 7617536
                  Caption = #25773#25918
                  HotTrack = True
                  ParentColor = True
                  TabOrder = 0
                  OnClick = BitBtnPlayClick
                  Glyph.Data = {
                    36060000424D3606000000000000360400002800000020000000100000000100
                    08000000000000020000530B0000530B00000001000000000000000000003300
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
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E809
                    09E8E8E8E8E8E8E8E8E8E8E8E8E8E88181E8E8E8E8E8E8E8E8E8E8E8E8E8E809
                    1009E8E8E8E8E8E8E8E8E8E8E8E8E881AC81E8E8E8E8E8E8E8E8E8E8E8E8E809
                    101009E8E8E8E8E8E8E8E8E8E8E8E881ACAC81E8E8E8E8E8E8E8E8E8E8E8E809
                    10101009E8E8E8E8E8E8E8E8E8E8E881ACACAC81E8E8E8E8E8E8E8E8E8E8E809
                    1010101009E8E8E8E8E8E8E8E8E8E881ACACACAC81E8E8E8E8E8E8E8E8E8E809
                    101010101009E8E8E8E8E8E8E8E8E881ACACACACAC81E8E8E8E8E8E8E8E8E809
                    1010101009E8E8E8E8E8E8E8E8E8E881ACACACAC81E8E8E8E8E8E8E8E8E8E809
                    10101009E8E8E8E8E8E8E8E8E8E8E881ACACAC81E8E8E8E8E8E8E8E8E8E8E809
                    101009E8E8E8E8E8E8E8E8E8E8E8E881ACAC81E8E8E8E8E8E8E8E8E8E8E8E809
                    1009E8E8E8E8E8E8E8E8E8E8E8E8E881AC81E8E8E8E8E8E8E8E8E8E8E8E8E809
                    09E8E8E8E8E8E8E8E8E8E8E8E8E8E88181E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                  NumGlyphs = 2
                end
                object BitBtnPause: TRzBitBtn
                  Left = 89
                  Top = 21
                  Width = 58
                  Height = 28
                  FrameColor = 7617536
                  Caption = #26242#20572
                  HotTrack = True
                  ParentColor = True
                  TabOrder = 1
                  OnClick = BitBtnPauseClick
                  Glyph.Data = {
                    36060000424D3606000000000000360400002800000020000000100000000100
                    08000000000000020000530B0000530B00000001000000000000000000003300
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
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8090909
                    09E8E809090909E8E8E8E8E8E881818181E8E881818181E8E8E8E8E8E8091010
                    09E8E809101009E8E8E8E8E8E881ACAC81E8E881ACAC81E8E8E8E8E8E8091010
                    09E8E809101009E8E8E8E8E8E881ACAC81E8E881ACAC81E8E8E8E8E8E8091010
                    09E8E809101009E8E8E8E8E8E881ACAC81E8E881ACAC81E8E8E8E8E8E8091010
                    09E8E809101009E8E8E8E8E8E881ACAC81E8E881ACAC81E8E8E8E8E8E8091010
                    09E8E809101009E8E8E8E8E8E881ACAC81E8E881ACAC81E8E8E8E8E8E8091010
                    09E8E809101009E8E8E8E8E8E881ACAC81E8E881ACAC81E8E8E8E8E8E8091010
                    09E8E809101009E8E8E8E8E8E881ACAC81E8E881ACAC81E8E8E8E8E8E8091010
                    09E8E809101009E8E8E8E8E8E881ACAC81E8E881ACAC81E8E8E8E8E8E8090909
                    09E8E809090909E8E8E8E8E8E881818181E8E881818181E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                  NumGlyphs = 2
                end
                object BitBtnFastForward: TRzBitBtn
                  Left = 151
                  Top = 21
                  Width = 58
                  Height = 28
                  FrameColor = 7617536
                  Caption = #24555#36827
                  HotTrack = True
                  ParentColor = True
                  TabOrder = 2
                  OnClick = BitBtnFastForwardClick
                  Glyph.Data = {
                    36060000424D3606000000000000360400002800000020000000100000000100
                    08000000000000020000530B0000530B00000001000000000000000000003300
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
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E80909E8E8E8
                    E8E80909E8E8E8E8E8E8E88181E8E8E8E8E88181E8E8E8E8E8E8E8091009E8E8
                    E8E8091009E8E8E8E8E8E881AC81E8E8E8E881AC81E8E8E8E8E8E809101009E8
                    E8E809101009E8E8E8E8E881ACAC81E8E8E881ACAC81E8E8E8E8E80910101009
                    E8E80910101009E8E8E8E881ACACAC81E8E881ACACAC81E8E8E8E80910101010
                    09E8091010101009E8E8E881ACACACAC81E881ACACACAC81E8E8E80910101010
                    100909101010101009E8E881ACACACACAC8181ACACACACAC81E8E80910101010
                    09E8091010101009E8E8E881ACACACAC81E881ACACACAC81E8E8E80910101009
                    E8E80910101009E8E8E8E881ACACAC81E8E881ACACAC81E8E8E8E809101009E8
                    E8E809101009E8E8E8E8E881ACAC81E8E8E881ACAC81E8E8E8E8E8091009E8E8
                    E8E8091009E8E8E8E8E8E881AC81E8E8E8E881AC81E8E8E8E8E8E80909E8E8E8
                    E8E80909E8E8E8E8E8E8E88181E8E8E8E8E88181E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                  NumGlyphs = 2
                end
                object BitBtnStop: TRzBitBtn
                  Left = 213
                  Top = 21
                  Width = 58
                  Height = 28
                  FrameColor = 7617536
                  Caption = #20572#27490
                  HotTrack = True
                  ParentColor = True
                  TabOrder = 3
                  OnClick = BitBtnStopClick
                  Glyph.Data = {
                    36060000424D3606000000000000360400002800000020000000100000000100
                    08000000000000020000430B0000430B00000001000000000000000000003300
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
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8090909
                    09090909090909E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8091010
                    10101010101009E8E8E8E8E8E881ACACACACACACACAC81E8E8E8E8E8E8091010
                    10101010101009E8E8E8E8E8E881ACACACACACACACAC81E8E8E8E8E8E8091010
                    10101010101009E8E8E8E8E8E881ACACACACACACACAC81E8E8E8E8E8E8091010
                    10101010101009E8E8E8E8E8E881ACACACACACACACAC81E8E8E8E8E8E8091010
                    10101010101009E8E8E8E8E8E881ACACACACACACACAC81E8E8E8E8E8E8091010
                    10101010101009E8E8E8E8E8E881ACACACACACACACAC81E8E8E8E8E8E8091010
                    10101010101009E8E8E8E8E8E881ACACACACACACACAC81E8E8E8E8E8E8091010
                    10101010101009E8E8E8E8E8E881ACACACACACACACAC81E8E8E8E8E8E8090909
                    09090909090909E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                    E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                  NumGlyphs = 2
                end
              end
              object Panel8: TPanel
                Left = 0
                Top = 138
                Width = 320
                Height = 53
                Align = alBottom
                BevelOuter = bvNone
                ParentColor = True
                TabOrder = 1
                object lblProcess: TLabel
                  Left = 0
                  Top = 40
                  Width = 320
                  Height = 13
                  Align = alBottom
                  Alignment = taRightJustify
                  Font.Charset = ANSI_CHARSET
                  Font.Color = 4210816
                  Font.Height = -13
                  Font.Name = #23435#20307
                  Font.Style = []
                  ParentFont = False
                end
                object TrackBarPlay: TRzTrackBar
                  Left = 0
                  Top = 0
                  Width = 320
                  Height = 40
                  Position = 0
                  ThumbStyle = tsMixer
                  TickStyle = tkOwnerDraw
                  TrackFrame = fsFlat
                  TrackWidth = 6
                  Align = alClient
                  Color = 16382438
                  Enabled = False
                  ParentColor = False
                  TabOrder = 0
                  OnMouseDown = TrackBarPlayMouseDown
                  OnMouseMove = TrackBarPlayMouseMove
                  OnMouseUp = TrackBarPlayMouseUp
                end
              end
              object Panel10: TPanel
                Left = 0
                Top = 0
                Width = 320
                Height = 138
                Align = alClient
                BevelOuter = bvNone
                Caption = #38899#39057#25991#20214
                Font.Charset = GB2312_CHARSET
                Font.Color = 16384
                Font.Height = -13
                Font.Name = #21326#25991#26999#20307
                Font.Style = [fsBold]
                ParentColor = True
                ParentFont = False
                TabOrder = 2
              end
              object WindowsMediaPlayer: TWindowsMediaPlayer
                Left = 99
                Top = -81
                Width = 245
                Height = 240
                TabOrder = 3
                Visible = False
                ControlData = {
                  000300000800000000000500000000000000F03F030000000000050000000000
                  0000000008000200000000000300010000000B00FFFF0300000000000B00FFFF
                  08000200000000000300320000000B00000008000A000000660075006C006C00
                  00000B0000000B0000000B00FFFF0B00FFFF0B00000008000200000000000800
                  020000000000080002000000000008000200000000000B00000052190000CE18
                  0000}
              end
            end
            object TPage
              Left = 0
              Top = 0
              Caption = 'video'
              object Panel11: TPanel
                Left = 0
                Top = 0
                Width = 320
                Height = 256
                Align = alClient
                Caption = #35270#39057#25991#20214
                ParentColor = True
                TabOrder = 0
                object VideoWindow1: TVideoWindow
                  Left = 1
                  Top = 1
                  Width = 318
                  Height = 201
                  Mode = vmVMR
                  FilterGraph = FilterGraph1
                  VMROptions.Mode = vmrWindowed
                  VMROptions.Preferences = [vpForceOverlays, vpForceMixer, vpPreferAGPMemWhenMixing]
                  Color = clBlack
                  Align = alClient
                  OnDblClick = VideoWindow1DblClick
                end
                object Panel12: TPanel
                  Left = 1
                  Top = 202
                  Width = 318
                  Height = 53
                  Align = alBottom
                  BevelInner = bvLowered
                  TabOrder = 1
                  object ToolBar: TToolBar
                    Left = 2
                    Top = 2
                    Width = 314
                    Height = 24
                    AutoSize = True
                    Caption = 'ToolBar'
                    Flat = True
                    Images = ImageList
                    TabOrder = 0
                    Transparent = False
                    object btPlay: TToolButton
                      Left = 0
                      Top = 0
                      Hint = #25773#25918
                      AutoSize = True
                      Caption = 'btPlay'
                      Grouped = True
                      ImageIndex = 3
                      Style = tbsCheck
                      OnClick = btPlayClick
                    end
                    object btPause: TToolButton
                      Left = 23
                      Top = 0
                      Hint = #26242#20572
                      AutoSize = True
                      Caption = 'btPause'
                      Grouped = True
                      ImageIndex = 2
                      Style = tbsCheck
                      OnClick = btPauseClick
                    end
                    object ToolButton1: TToolButton
                      Left = 46
                      Top = 0
                      Width = 8
                      Caption = 'ToolButton1'
                      ImageIndex = 5
                      Style = tbsSeparator
                    end
                    object btFullScreen: TToolButton
                      Left = 54
                      Top = 0
                      Hint = #20840#23631
                      AutoSize = True
                      Caption = 'btFullScreen'
                      ImageIndex = 8
                      OnClick = btFullScreenClick
                    end
                    object SoundLevel: TTrackBar
                      Left = 77
                      Top = 0
                      Width = 102
                      Height = 22
                      Max = 10000
                      Frequency = 1000
                      TabOrder = 0
                      OnChange = SoundLevelChange
                    end
                    object lblPlayProgress: TRzLabel
                      Left = 179
                      Top = 0
                      Width = 56
                      Height = 13
                      Caption = #25773#25918#36827#24230
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clTeal
                      Font.Height = -13
                      Font.Name = #23435#20307
                      Font.Style = [fsBold]
                      ParentFont = False
                      Rotation = roFlat
                    end
                  end
                  object TrackBar: TDSTrackBar
                    Left = 2
                    Top = 26
                    Width = 314
                    Height = 25
                    Align = alBottom
                    Frequency = 60
                    TabOrder = 1
                    FilterGraph = FilterGraph1
                    OnTimer = TrackBarTimer
                  end
                end
              end
            end
          end
        end
        object cxSplitter2: TcxSplitter
          Left = 494
          Top = 0
          Width = 8
          Height = 258
          HotZoneClassName = 'TcxSimpleStyle'
          Control = Panel4
        end
      end
    end
  end
  object Panel7: TPanel
    Left = 0
    Top = 0
    Width = 203
    Height = 321
    Align = alLeft
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 2
    object PageControl2: TPageControl
      Left = 0
      Top = 0
      Width = 203
      Height = 288
      ActivePage = TabSheet2
      Align = alClient
      TabOrder = 0
      object TabSheet2: TTabSheet
        Caption = #36710#36742
        object TreeView1: TTreeView
          Left = 0
          Top = 0
          Width = 195
          Height = 260
          Align = alClient
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Indent = 19
          ParentFont = False
          ReadOnly = True
          SortType = stText
          TabOrder = 0
          OnClick = TreeView1Click
        end
      end
    end
    object PanelSelectGroupName: TPanel
      Left = 0
      Top = 288
      Width = 203
      Height = 33
      Align = alBottom
      BevelInner = bvLowered
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = True
      ParentFont = False
      TabOrder = 1
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 203
    Top = 0
    Width = 8
    Height = 321
    HotZoneClassName = 'TcxSimpleStyle'
    Control = Panel7
  end
  object PopupMenu1: TPopupMenu
    Left = 447
    Top = 275
    object N1: TMenuItem
      Caption = #22810#23186#20307#25968#25454#21478#23384#20026
      OnClick = N1Click
    end
  end
  object SaveDialog1: TSaveDialog
    OnTypeChange = SaveDialog1TypeChange
    Left = 487
    Top = 275
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 10
    OnTimer = Timer1Timer
    Left = 760
    Top = 84
  end
  object ImageList: TImageList
    Left = 680
    Top = 176
    Bitmap = {
      494C01010A000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFF00000000FFFFFFFF00000000
      F00FFFFF00000000F81FFFFF00000000FC3FFFBE000000008001FF9E00000000
      8001FF8E000000009FF9CC86000000009FF9CC82000000009FF9CC8600000000
      9FF9FF8E000000009FF9FF9E000000009FF9FFBE000000008001FFFF00000000
      8001FFFF00000000FFFFFFFF00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFF003
      FFFFFFFFFFFFF003E003FFFFFFFFFFFFE003EF7FDEF9F003E003E73FCE79F003
      E003E31FC639FFFFE003E10FC219F003E003E007C009F003E003E10FC219FFFF
      E003E31FC639F003E003E73FCE79F003E003EF7FDEF9FFFFE003FFFFFFFF8003
      FFFFFFFFFFFF8003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFF1C7F3FF9F7BFEF7F1C7F1FF9E73FCE7F1C7F0FF
      9C63F8C7F1C7F07F9843F087F1C7F03F9003E007F1C7F01F9843F087F1C7F01F
      9C63F8C7F1C7F03F9E73FCE7F1C7F07F9F7BFEF7F1C7F0FFFFFFFFFFF1C7F1FF
      FFFFFFFFFFFFF3FFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object FilterGraph1: TFilterGraph
    GraphEdit = True
    LinearVolume = True
    Left = 761
    Top = 125
  end
end
