object see_clxx: Tsee_clxx
  Left = 414
  Top = 99
  BorderStyle = bsSingle
  Caption = #36710#36742#20449#24687#26597#30475
  ClientHeight = 564
  ClientWidth = 908
  Color = clBtnFace
  DragKind = dkDock
  DragMode = dmAutomatic
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 908
    Height = 564
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 169
      Height = 564
      ActivePage = TabSheet1
      Align = alLeft
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = #36710#36742#20998#32452
        object TreeView1: TTreeView
          Left = 0
          Top = 0
          Width = 161
          Height = 536
          Align = alClient
          Indent = 19
          ReadOnly = True
          RowSelect = True
          SortType = stText
          TabOrder = 0
          OnClick = TreeView1Click
        end
      end
    end
    object PageControl2: TPageControl
      Left = 177
      Top = 0
      Width = 731
      Height = 564
      ActivePage = TabSheet2
      Align = alClient
      TabOrder = 1
      object TabSheet2: TTabSheet
        Caption = #36710#36742#20449#24687
        object Panel6: TPanel
          Left = 0
          Top = 0
          Width = 723
          Height = 81
          Align = alTop
          BevelInner = bvLowered
          BevelOuter = bvNone
          Color = 15461336
          TabOrder = 0
          object Label1: TLabel
            Left = 43
            Top = 16
            Width = 81
            Height = 13
            AutoSize = False
            Caption = #36710#29260#21495#30721#65306
          end
          object Label2: TLabel
            Left = 247
            Top = 16
            Width = 60
            Height = 13
            Caption = 'SIM'#21345#21495#65306
          end
          object ComboB_Cph: TComboBox
            Left = 110
            Top = 12
            Width = 101
            Height = 21
            ItemHeight = 13
            Sorted = True
            TabOrder = 0
            Text = 'ComboB_Cph'
            OnChange = ComboB_CphChange
          end
          object ComboB_SimNum: TComboBox
            Left = 309
            Top = 12
            Width = 128
            Height = 21
            ItemHeight = 13
            Sorted = True
            TabOrder = 1
            Text = 'ComboB_SimNum'
            OnChange = ComboB_CphChange
          end
          object RadioGroupOnline: TRadioGroup
            Left = 42
            Top = 34
            Width = 201
            Height = 35
            Caption = #22312#32447
            Columns = 3
            ItemIndex = 0
            Items.Strings = (
              #20840#37096
              #22312#32447
              #19981#22312#32447)
            TabOrder = 2
            OnClick = RadioGroupOnlineClick
          end
          object RadioGroupISlocate: TRadioGroup
            Left = 256
            Top = 34
            Width = 208
            Height = 35
            Caption = #23450#20301
            Columns = 3
            ItemIndex = 0
            Items.Strings = (
              #20840#37096
              #23450#20301
              #19981#23450#20301)
            TabOrder = 3
            OnClick = RadioGroupOnlineClick
          end
          object BitBtnPrint: TRzBitBtn
            Left = 520
            Top = 32
            Width = 70
            Caption = #23548#20986
            Color = 15462370
            HotTrack = True
            TabOrder = 4
            OnClick = BitBtnPrintClick
            Glyph.Data = {
              36060000424D3606000000000000360400002800000020000000100000000100
              08000000000000020000A30E0000A30E00000001000000000000000000003300
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
              E8E8E8E809E8E8E8E8E8E8E8E8E8E8E8E8E8E8E881E8E8E8E8E8E8E8E8E8E8E8
              E8E8E8E80909E8E8E8E8E8E8E8E8E8E8E8E8E8E88181E8E8E8E8E8E8E8090909
              09090909090909E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
              E8E8E8E80909E8E8E8E8E8E8E8E8E8E8E8E8E8E88181E8E8E8E8E8E8E8E8E8E8
              E8E8E8E809E8E8E8E8E8E8E8E8E8E8E8E8E8E8E881E8E8E8E8E8E8E8E8E8E8E8
              E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E85E5E5E5E5E5E
              5EE8E8A378787878787881818181818181E8E8818181818181815ED7D7D7D7D7
              5EE8E8A3D5D5D5D5D57881E8E8E8E8E881E8E881ACACACACAC815ED7D7D7D7D7
              5EE8E8A3D5D5D5D5D57881E8E8E8E8E881E8E881ACACACACAC815ED7D7D7D7D7
              5EE8E8A3D5D5D5D5D57881E8E8E8E8E881E8E881ACACACACAC815ED7D7D7D7D7
              5EE8E8A3D5D5D5D5D57881E8E8E8E8E881E8E881ACACACACAC815ED7D75E5E5E
              5EE8E8A3D5D5A3A3A3A381E8E881818181E8E881ACAC818181815ED7D75EE35E
              E8E8E8A3D5D5A3D678E881E8E881E381E8E8E881ACAC81AC81E85ED7D75E5EE8
              E8E8E8A3D5D5A378E8E881E8E88181E8E8E8E881ACAC8181E8E85E5E5E5EE8E8
              E8E8E8A3A3A3A3E8E8E881818181E8E8E8E8E881818181E8E8E8}
            NumGlyphs = 2
          end
          object BitBtn3: TRzBitBtn
            Left = 616
            Top = 32
            Width = 70
            Caption = #36864#20986
            Color = 15461336
            HotTrack = True
            TabOrder = 5
            OnClick = BitBtn3Click
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
        end
        object DevList: TcxTreeList
          Left = 0
          Top = 81
          Width = 723
          Height = 455
          Align = alClient
          Bands = <
            item
              Caption.AlignHorz = taCenter
              Caption.Text = #22522#26412#20449#24687
            end>
          BufferedPaint = True
          OptionsData.Editing = False
          OptionsData.Deleting = False
          OptionsView.GridLines = tlglBoth
          OptionsView.ShowRoot = False
          StateImages = Mainf.ImageList1
          TabOrder = 1
          OnClick = DevListClick
          object Dev_Id: TcxTreeListColumn
            Caption.Text = #35774#22791'ID'
            DataBinding.ValueType = 'String'
            MinWidth = 50
            Options.Editing = False
            Width = 130
            Position.ColIndex = 0
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
          object Dev_CarNo: TcxTreeListColumn
            Caption.Text = #36710#29260#21495
            DataBinding.ValueType = 'String'
            Options.Editing = False
            Width = 74
            Position.ColIndex = 1
            Position.RowIndex = 0
            Position.BandIndex = 0
            SortOrder = soAscending
          end
          object Dev_Name: TcxTreeListColumn
            Visible = False
            Caption.Text = #35774#22791#21517#31216
            DataBinding.ValueType = 'String'
            Options.Editing = False
            Width = 93
            Position.ColIndex = 3
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
          object Dev_SimNo: TcxTreeListColumn
            Caption.Text = 'SIM'#21345#21495
            DataBinding.ValueType = 'String'
            Options.Editing = False
            Width = 102
            Position.ColIndex = 5
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
          object Dev_ConnType: TcxTreeListColumn
            Caption.Text = #21496#26426#22995#21517
            DataBinding.ValueType = 'String'
            Options.Editing = False
            Width = 70
            Position.ColIndex = 3
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
          object Dev_SetupTime: TcxTreeListColumn
            Caption.Text = #35774#22791#23433#35013#26085#26399
            DataBinding.ValueType = 'String'
            Width = 102
            Position.ColIndex = 11
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
          object Dev_GroupName: TcxTreeListColumn
            Caption.Text = #32452#21517
            DataBinding.ValueType = 'String'
            Position.ColIndex = 12
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
          object Dev_isOnline: TcxTreeListColumn
            Caption.Text = #22312#32447
            DataBinding.ValueType = 'String'
            Width = 67
            Position.ColIndex = 13
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
          object ISlocote: TcxTreeListColumn
            Caption.Text = #23450#20301
            DataBinding.ValueType = 'String'
            Position.ColIndex = 14
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
          object Dev_GpsDateTime: TcxTreeListColumn
            Caption.Text = 'GPS'#26102#38388
            DataBinding.ValueType = 'String'
            Width = 148
            Position.ColIndex = 15
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
          object Dev_CarCpColor: TcxTreeListColumn
            Caption.Text = #36710#29260#39068#33394
            DataBinding.ValueType = 'String'
            Width = 67
            Position.ColIndex = 7
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
          object Dev_CarTypeName: TcxTreeListColumn
            Caption.Text = #36710#22411#21517#31216
            DataBinding.ValueType = 'String'
            Width = 91
            Position.ColIndex = 8
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
          object Dev_CarShipName: TcxTreeListColumn
            Caption.Text = #36710#33337#21517#31216
            DataBinding.ValueType = 'String'
            Position.ColIndex = 10
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
          object dev_TerminalTypeName: TcxTreeListColumn
            Caption.Text = #32456#31471#31867#22411
            DataBinding.ValueType = 'String'
            Position.ColIndex = 2
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
          object dev_carMemo: TcxTreeListColumn
            Caption.Text = #36710#36742#22791#27880
            DataBinding.ValueType = 'String'
            Options.Editing = False
            Width = 180
            Position.ColIndex = 16
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
        end
      end
    end
    object cxSplitter1: TcxSplitter
      Left = 169
      Top = 0
      Width = 8
      Height = 564
      HotZoneClassName = 'TcxSimpleStyle'
      HotZone.SizePercent = 31
      Control = PageControl1
    end
  end
end
