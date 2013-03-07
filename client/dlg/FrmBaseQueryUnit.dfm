object frmBaseQuery: TfrmBaseQuery
  Left = 195
  Top = 180
  Width = 829
  Height = 480
  Caption = #26597#35810
  Color = clBtnFace
  DragKind = dkDock
  DragMode = dmAutomatic
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
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 821
    Height = 446
    Align = alClient
    BorderOuter = fsNone
    BorderSides = [sdLeft, sdTop, sdRight]
    Color = 15527913
    GradientColorStyle = gcsCustom
    GradientColorStart = 15988216
    GradientColorStop = 13750737
    GradientDirection = gdVerticalEnd
    TabOrder = 0
    VisualStyle = vsGradient
    object RzPanel2: TRzPanel
      Left = 0
      Top = 0
      Width = 190
      Height = 446
      Align = alLeft
      BorderOuter = fsNone
      BorderSides = [sdLeft, sdTop, sdRight]
      TabOrder = 0
      Transparent = True
      object pnlSelGroupName: TRzPanel
        Left = 0
        Top = 415
        Width = 190
        Height = 31
        Align = alBottom
        BorderOuter = fsGroove
        BorderSides = [sdTop, sdRight]
        TabOrder = 0
        Transparent = True
      end
      object TreeView1: TTreeView
        Left = 0
        Top = 0
        Width = 190
        Height = 415
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
        TabOrder = 1
        OnClick = TreeView1Click
      end
    end
    object cxSplitter1: TcxSplitter
      Left = 190
      Top = 0
      Width = 8
      Height = 446
      HotZoneClassName = 'TcxSimpleStyle'
      Control = RzPanel2
    end
    object RzPanel4: TRzPanel
      Left = 198
      Top = 0
      Width = 623
      Height = 446
      Align = alClient
      BorderOuter = fsNone
      TabOrder = 2
      Transparent = True
      object RzPanel5: TRzPanel
        Left = 0
        Top = 0
        Width = 623
        Height = 54
        Align = alTop
        BorderOuter = fsGroove
        BorderSides = [sdBottom]
        TabOrder = 0
        Transparent = True
        object RzLabel1: TRzLabel
          Left = 8
          Top = 8
          Width = 48
          Height = 13
          Caption = #36710#29260#21495#65306
          Transparent = True
        end
        object RzLabel2: TRzLabel
          Left = 160
          Top = 8
          Width = 36
          Height = 13
          Caption = #26102#38388#65306
          Transparent = True
        end
        object RzLabel3: TRzLabel
          Left = 174
          Top = 32
          Width = 25
          Height = 13
          Caption = '  ~  '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          Layout = tlCenter
        end
        object cbxCarNo: TRzComboBox
          Left = 56
          Top = 4
          Width = 95
          Height = 21
          Ctl3D = False
          FrameVisible = True
          ItemHeight = 13
          ParentCtl3D = False
          Sorted = True
          TabOrder = 0
          OnExit = cbxCarNoExit
        end
        object RzDateTimePicker1: TRzDateTimePicker
          Left = 200
          Top = 4
          Width = 81
          Height = 21
          Date = 41270.465658275460000000
          Format = 'yyyy-MM-dd'
          Time = 41270.465658275460000000
          TabOrder = 1
          FrameVisible = True
        end
        object RzDateTimePicker2: TRzDateTimePicker
          Left = 281
          Top = 4
          Width = 69
          Height = 21
          Date = 41270.000000000000000000
          Format = 'HH:mm:ss'
          Time = 41270.000000000000000000
          Kind = dtkTime
          TabOrder = 2
          FrameVisible = True
        end
        object RzDateTimePicker3: TRzDateTimePicker
          Left = 200
          Top = 28
          Width = 81
          Height = 21
          Date = 41270.465658275460000000
          Format = 'yyyy-MM-dd'
          Time = 41270.465658275460000000
          TabOrder = 3
          FrameVisible = True
        end
        object RzDateTimePicker4: TRzDateTimePicker
          Left = 281
          Top = 28
          Width = 69
          Height = 21
          Date = 41270.465658275460000000
          Format = 'HH:mm:ss'
          Time = 41270.465658275460000000
          Kind = dtkTime
          TabOrder = 4
          FrameVisible = True
        end
        object btnQuery: TRzBitBtn
          Left = 376
          Top = 8
          Width = 67
          FrameColor = 7617536
          Caption = #26597#35810
          Color = 15791348
          HotTrack = True
          TabOrder = 5
          OnClick = btnQueryClick
          Glyph.Data = {
            36060000424D3606000000000000360400002800000020000000100000000100
            08000000000000020000330B0000330B00000001000000000000000000003300
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
            0000000000000000000000000000000000000000000000000000E8ACDEE3E8E8
            E8E8E8E8E8E8E8E8E8E8E8ACDEE3E8E8E8E8E8E8E8E8E8E8E8E8AC807A81E3E8
            E8E8E8E8E8E8E8E8E8E8ACE28181E3E8E8E8E8E8E8E8E8E8E8E8E8CEA37A81E3
            E8E8E8E8E8E8E8E8E8E8E8ACE28181E3E8E8E8E8E8E8E8E8E8E8E8D0CEA37A81
            E3E8E8E8E8E8E8E8E8E8E8E3ACE28181E3E8E8E8E8E8E8E8E8E8E8E8D0CEA37A
            81E3E8E8E8E8E8E8E8E8E8E8E3ACE28181E3E8E8E8E8E8E8E8E8E8E8E8D0CEA3
            7AACAD82828288E3E8E8E8E8E8E3ACE281ACE3818181E2E3E8E8E8E8E8E8D0CE
            E28288E6B3E6E682EBE8E8E8E8E8E3ACE281E2ACACACAC81E3E8E8E8E8E8E8E3
            8289B3B3B3D7D7D782E3E8E8E8E8E8E381E3ACACACE3E3E381E3E8E8E8E8E8AD
            88B3E6B3B3D7D7D7E688E8E8E8E8E8E3E2ACACACACE3E3E3ACE2E8E8E8E8E888
            89E6E6B3B3B3D7D7E682E8E8E8E8E8E2E3ACACACACACE3E3AC81E8E8E8E8E882
            E6E6E6E6B3B3B3B3B382E8E8E8E8E881ACACACACACACACACAC81E8E8E8E8E888
            E6B3E6E6E6B3B3B3E682E8E8E8E8E8E2ACACACACACACACACAC81E8E8E8E8E8AD
            88D7D7E6E6E6E6B38888E8E8E8E8E8E3E2E3E3ACACACACACE2E2E8E8E8E8E8E3
            82EBD7B3E6E6E68982E3E8E8E8E8E8E381E3E3ACACACACE381E3E8E8E8E8E8E8
            AD82ADE6E6E68882ADE8E8E8E8E8E8E8E381E3ACACACE281E3E8E8E8E8E8E8E8
            E8E38882828282E3E8E8E8E8E8E8E8E8E8E3E281818181E3E8E8}
          NumGlyphs = 2
        end
        object RzBitBtn2: TRzBitBtn
          Left = 464
          Top = 8
          Width = 67
          FrameColor = 7617536
          Caption = #36864#20986
          Color = 15791348
          HotTrack = True
          TabOrder = 6
          OnClick = RzBitBtn2Click
          Glyph.Data = {
            36060000424D3606000000000000360400002800000020000000100000000100
            08000000000000020000730B0000730B00000001000000000000000000003300
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
            EEE8E8E8E8E8E8E8E8E8E8E8E8E8E8E8EEE8E8E8E8E8E8E8E8E8E8E8E8EEE3AC
            E3EEE8E8E8E8E8E8E8E8E8E8E8EEE8ACE3EEE8E8E8E8E8E8E8E8E8EEE3E28257
            57E2ACE3EEE8E8E8E8E8E8EEE8E2818181E2ACE8EEE8E8E8E8E8E382578282D7
            578181E2E3E8E8E8E8E8E881818181D7818181E2E8E8E8E8E8E857828989ADD7
            57797979EEE8E8E8E8E88181DEDEACD781818181EEE8E8E8E8E857898989ADD7
            57AAAAA2D7ADE8E8E8E881DEDEDEACD781DEDE81D7ACE8E8E8E857898989ADD7
            57AACEA3AD10E8E8E8E881DEDEDEACD781DEAC81AC81E8E8E8E85789825EADD7
            57ABCFE21110E8E8E8E881DE8181ACD781ACACE28181E8E8E8E8578957D7ADD7
            57ABDE101010101010E881DE56D7ACD781ACDE818181818181E857898257ADD7
            57E810101010101010E881DE8156ACD781E381818181818181E857898989ADD7
            57E882101010101010E881DEDEDEACD781E381818181818181E857898989ADD7
            57ACEE821110E8E8E8E881DEDEDEACD781ACEE818181E8E8E8E857898989ADD7
            57ABE8AB8910E8E8E8E881DEDEDEACD781ACE3ACDE81E8E8E8E857828989ADD7
            57ACE8A3E889E8E8E8E88181DEDEACD781ACE381E8DEE8E8E8E8E8DE5E8288D7
            57A2A2A2E8E8E8E8E8E8E8DE8181DED781818181E8E8E8E8E8E8E8E8E8AC8257
            57E8E8E8E8E8E8E8E8E8E8E8E8AC818181E8E8E8E8E8E8E8E8E8}
          NumGlyphs = 2
        end
        object RzBitBtn3: TRzBitBtn
          Left = 544
          Top = 8
          FrameColor = 7617536
          Caption = #23548#20986
          Color = 15791348
          HotTrack = True
          TabOrder = 7
          OnClick = RzBitBtn3Click
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
            FFFFFFCFCFCFCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
            CCCCCCCCCCCCCCCFCFCFFFFFFFFFFFFFFFFFFFBB8825B67E0EB47B09B47A07B4
            7A08B47B08B47A08B47A08B47B08B47A08B47B09B67E0EBB8825FFFFFFFFFFFF
            FFFFFFB67E0EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFB67E0EFFFFFFFFFFFFFFFFFFB57B09FFFFFFFFFFFFFFFFFFFF
            FFFFD7BFA4FFFFFFFFFFFFD7BFA4FFFFFFFFFFFFFFFFFFB47B09FFFFFFFFFFFF
            FFFFFFB67B08FFFFFFD5BB9CD6BC9CD8BEA0D9C1A3D8BFA1D8BFA1D9C1A3D7BE
            9FD5BC9CFFFFFFB47B08FFFFFFFFFFFFFFFFFFBC7B07FFFFFFFFFFF8FFFFF8FF
            FFFDD9BC9EFFFFFCFFFFFCD7BC9DFFFFFBFFFFF7FFFFFFB47B08DCDCDCCCCCCC
            CCCCCCCC7C06FFFFFFFFFFF8FFFFF7FFFFFBE2BE9EFFFFF6FFFFF5D7BB98FFFF
            F3FFFDEFFFFFFFB47B084A9C69058235007F31007C2D00762400741F00742000
            76234B9454E2BC9AD9B996D8BB97D6B893D4B58FFFFFFFB47B08078234FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF007827FFFFEFFFFDE9D7B890FFFB
            E6FFF8E2FFFFFFB47B08027F31FFFFFF008C3640C16F43C27100903D00923F00
            9543007A2BFFFEE9FFFAE2D7B58CFFF8DFFFF5DAFFFFFFB47B08017F30FFFFFF
            008D36B6E6C9009141BBE9CC00913EBAECCD007A29F1BA8CE3B785DEB787DFB5
            82DDB27DFFFFFFB57B09017F30FFFFFFFFFFFF00903CB6E3C800913EFFFFFFFF
            FFFF00782257CCFF49C8FFE3B57E46C6FF44C4FFFFFFFFB57C09017F30FFFFFF
            008D35A8DBC03BAD702BA66455B783FFFFFF007925FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFB67E0E027F31FFFFFF1798582AA065F3FAF77EC6A2189859A4
            D9C0007E31C77D08B97C08B67B08B67B08B67C09B67E0EBD8C27068234FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF008238FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF5BAC79068134027F31017F30007F2F017F2F027F3106
            823557AD7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        end
      end
      object RzPanel6: TRzPanel
        Left = 0
        Top = 414
        Width = 623
        Height = 32
        Align = alBottom
        BorderOuter = fsGroove
        TabOrder = 1
        Transparent = True
        object lblTotalCount: TLabel
          Left = 537
          Top = 2
          Width = 84
          Height = 28
          Align = alRight
          Alignment = taRightJustify
          AutoSize = False
          Caption = '  '#20849'0'#26465#35760#24405
          Transparent = True
          Layout = tlCenter
        end
        object Label6: TLabel
          Left = 202
          Top = 10
          Width = 12
          Height = 13
          Caption = #31532
          Transparent = True
        end
        object Label8: TLabel
          Left = 250
          Top = 10
          Width = 42
          Height = 13
          Caption = #39029#65292#20849'  '
          Transparent = True
        end
        object Label9: TLabel
          Left = 325
          Top = 10
          Width = 12
          Height = 13
          Caption = #39029
          Transparent = True
        end
        object edtCurrPageNo: TRzEdit
          Left = 218
          Top = 7
          Width = 29
          Height = 17
          Hint = #25353#22238#36710#38190#36339#36716#21040#25351#23450#39029
          Text = '0'
          Alignment = taRightJustify
          AutoSize = False
          FrameVisible = True
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnKeyPress = edtCurrPageNoKeyPress
          OnKeyUp = edtCurrPageNoKeyUp
        end
        object edtTotalPageCount: TRzEdit
          Left = 293
          Top = 7
          Width = 29
          Height = 17
          Text = '0'
          Alignment = taRightJustify
          AutoSize = False
          Color = clInfoBk
          FrameVisible = True
          ReadOnly = True
          TabOrder = 1
        end
        object btnPageFirst: TRzBitBtn
          Left = 63
          Top = 5
          Width = 33
          Height = 22
          Hint = #31532#19968#39029
          HotTrack = True
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = btnPageFirstClick
          Glyph.Data = {
            36060000424D3606000000000000360400002800000020000000100000000100
            08000000000000020000630D0000630D00000001000000000000000000003300
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
            E80909E8E80909E8E8E8E8E8E8E8E8E8E88181E8E88181E8E8E8E8E8E8E8E8E8
            091009E8091009E8E8E8E8E8E8E8E8E881AC81E881AC81E8E8E8E8E8E8E8E809
            10100909101009E8E8E8E8E8E8E8E881ACAC8181ACAC81E8E8E8E8E8E8E80910
            101009101010090909E8E8E8E8E881ACACAC81ACACAC818181E8E8E8E8091010
            100910101010101009E8E8E8E881ACACAC81ACACACACACAC81E8E8E809101010
            091010101010101009E8E8E881ACACAC81ACACACACACACAC81E8E80910101009
            101010101010101009E8E881ACACAC81ACACACACACACACAC81E8E8E809101010
            091010101010101009E8E8E881ACACAC81ACACACACACACAC81E8E8E8E8091010
            100910101010101009E8E8E8E881ACACAC81ACACACACACAC81E8E8E8E8E80910
            101009101010090909E8E8E8E8E881ACACAC81ACACAC818181E8E8E8E8E8E809
            10100909101009E8E8E8E8E8E8E8E881ACAC8181ACAC81E8E8E8E8E8E8E8E8E8
            091009E8091009E8E8E8E8E8E8E8E8E881AC81E881AC81E8E8E8E8E8E8E8E8E8
            E80909E8E80909E8E8E8E8E8E8E8E8E8E88181E8E88181E8E8E8E8E8E8E8E8E8
            E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
          NumGlyphs = 2
        end
        object btnPagePrevious: TRzBitBtn
          Left = 98
          Top = 5
          Width = 33
          Height = 22
          Hint = #21069#19968#39029
          HotTrack = True
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = btnPagePreviousClick
          Glyph.Data = {
            36060000424D3606000000000000360400002800000020000000100000000100
            08000000000000020000630D0000630D00000001000000000000000000003300
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
            E8E8E80909E8E8E8E8E8E8E8E8E8E8E8E8E8E88181E8E8E8E8E8E8E8E8E8E8E8
            E8E8091009E8E8E8E8E8E8E8E8E8E8E8E8E881AC81E8E8E8E8E8E8E8E8E8E8E8
            E809101009E8E8E8E8E8E8E8E8E8E8E8E881ACAC81E8E8E8E8E8E8E8E8E8E8E8
            09101010090909E8E8E8E8E8E8E8E8E881ACACAC818181E8E8E8E8E8E8E8E809
            10101010101009E8E8E8E8E8E8E8E881ACACACACACAC81E8E8E8E8E8E8E80910
            10101010101009E8E8E8E8E8E8E881ACACACACACACAC81E8E8E8E8E8E8091010
            10101010101009E8E8E8E8E8E881ACACACACACACACAC81E8E8E8E8E8E8E80910
            10101010101009E8E8E8E8E8E8E881ACACACACACACAC81E8E8E8E8E8E8E8E809
            10101010101009E8E8E8E8E8E8E8E881ACACACACACAC81E8E8E8E8E8E8E8E8E8
            09101010090909E8E8E8E8E8E8E8E8E881ACACAC818181E8E8E8E8E8E8E8E8E8
            E809101009E8E8E8E8E8E8E8E8E8E8E8E881ACAC81E8E8E8E8E8E8E8E8E8E8E8
            E8E8091009E8E8E8E8E8E8E8E8E8E8E8E8E881AC81E8E8E8E8E8E8E8E8E8E8E8
            E8E8E80909E8E8E8E8E8E8E8E8E8E8E8E8E8E88181E8E8E8E8E8E8E8E8E8E8E8
            E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
          NumGlyphs = 2
        end
        object btnPageNext: TRzBitBtn
          Left = 133
          Top = 5
          Width = 33
          Height = 22
          Hint = #19979#19968#39029
          HotTrack = True
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          OnClick = btnPageNextClick
          Glyph.Data = {
            36060000424D3606000000000000360400002800000020000000100000000100
            08000000000000020000630D0000630D00000001000000000000000000003300
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
            E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E809
            09E8E8E8E8E8E8E8E8E8E8E8E8E8E88181E8E8E8E8E8E8E8E8E8E8E8E8E8E809
            1009E8E8E8E8E8E8E8E8E8E8E8E8E881AC81E8E8E8E8E8E8E8E8E8E8E8E8E809
            101009E8E8E8E8E8E8E8E8E8E8E8E881ACAC81E8E8E8E8E8E8E8E8E8E8090909
            10101009E8E8E8E8E8E8E8E8E8818181ACACAC81E8E8E8E8E8E8E8E8E8091010
            1010101009E8E8E8E8E8E8E8E881ACACACACACAC81E8E8E8E8E8E8E8E8091010
            101010101009E8E8E8E8E8E8E881ACACACACACACAC81E8E8E8E8E8E8E8091010
            10101010101009E8E8E8E8E8E881ACACACACACACACAC81E8E8E8E8E8E8091010
            101010101009E8E8E8E8E8E8E881ACACACACACACAC81E8E8E8E8E8E8E8091010
            1010101009E8E8E8E8E8E8E8E881ACACACACACAC81E8E8E8E8E8E8E8E8090909
            10101009E8E8E8E8E8E8E8E8E8818181ACACAC81E8E8E8E8E8E8E8E8E8E8E809
            101009E8E8E8E8E8E8E8E8E8E8E8E881ACAC81E8E8E8E8E8E8E8E8E8E8E8E809
            1009E8E8E8E8E8E8E8E8E8E8E8E8E881AC81E8E8E8E8E8E8E8E8E8E8E8E8E809
            09E8E8E8E8E8E8E8E8E8E8E8E8E8E88181E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
            E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
          NumGlyphs = 2
        end
        object btnPageLast: TRzBitBtn
          Left = 168
          Top = 5
          Width = 33
          Height = 22
          Hint = #26368#21518#19968#39029
          HotTrack = True
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          OnClick = btnPageLastClick
          Glyph.Data = {
            36060000424D3606000000000000360400002800000020000000100000000100
            08000000000000020000630D0000630D00000001000000000000000000003300
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
            E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E80909E8
            E80909E8E8E8E8E8E8E8E8E8E88181E8E88181E8E8E8E8E8E8E8E8E8E8091009
            E8091009E8E8E8E8E8E8E8E8E881AC81E881AC81E8E8E8E8E8E8E8E8E8091010
            0909101009E8E8E8E8E8E8E8E881ACAC8181ACAC81E8E8E8E8E8E80909091010
            100910101009E8E8E8E8E8818181ACACAC81ACACAC81E8E8E8E8E80910101010
            10100910101009E8E8E8E881ACACACACACAC81ACACAC81E8E8E8E80910101010
            1010100910101009E8E8E881ACACACACACACAC81ACACAC81E8E8E80910101010
            101010100910101009E8E881ACACACACACACACAC81ACACAC81E8E80910101010
            1010100910101009E8E8E881ACACACACACACAC81ACACAC81E8E8E80910101010
            10100910101009E8E8E8E881ACACACACACAC81ACACAC81E8E8E8E80909091010
            100910101009E8E8E8E8E8818181ACACAC81ACACAC81E8E8E8E8E8E8E8091010
            0909101009E8E8E8E8E8E8E8E881ACAC8181ACAC81E8E8E8E8E8E8E8E8091009
            E8091009E8E8E8E8E8E8E8E8E881AC81E881AC81E8E8E8E8E8E8E8E8E80909E8
            E80909E8E8E8E8E8E8E8E8E8E88181E8E88181E8E8E8E8E8E8E8E8E8E8E8E8E8
            E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
          NumGlyphs = 2
        end
        object cbxPageSize: TRzComboBox
          Left = 12
          Top = 6
          Width = 45
          Height = 21
          Style = csDropDownList
          Ctl3D = False
          FrameVisible = True
          ItemHeight = 13
          ParentCtl3D = False
          TabOrder = 6
          Text = '20'
          OnChange = cbxPageSizeChange
          Items.Strings = (
            '20'
            '30'
            '40'
            '50')
          ItemIndex = 0
        end
      end
      object RzPanel7: TRzPanel
        Left = 0
        Top = 54
        Width = 623
        Height = 360
        Align = alClient
        BorderOuter = fsNone
        TabOrder = 2
        Transparent = True
        object cxTreeList1: TcxTreeList
          Left = 0
          Top = 0
          Width = 623
          Height = 360
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
          Styles.Selection = cxStyle1
          TabOrder = 0
        end
      end
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 9609325
    end
  end
end
