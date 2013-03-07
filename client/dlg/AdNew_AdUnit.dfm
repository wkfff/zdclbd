object AdNew_AdFrm: TAdNew_AdFrm
  Left = 15
  Top = 56
  BorderStyle = bsDialog
  Caption = #24191#21578#28155#21152' '
  ClientHeight = 655
  ClientWidth = 994
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 108
    Top = 370
    Width = 13
    Height = 13
    Caption = #20998
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 994
    Height = 0
    Align = alTop
    Caption = #24191#21578#36873#25321
    Font.Charset = ANSI_CHARSET
    Font.Color = clGreen
    Font.Height = -21
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 994
    Height = 615
    Align = alClient
    Caption = 'Panel3'
    TabOrder = 1
    object Panel2: TPanel
      Left = 836
      Top = 1
      Width = 157
      Height = 613
      Align = alRight
      TabOrder = 0
      object SpeedButton6: TSpeedButton
        Left = 8
        Top = 584
        Width = 84
        Height = 27
        Caption = #36873#25321#36710#36742
        OnClick = SpeedButton6Click
      end
      object ListView2: TListView
        Left = 1
        Top = 197
        Width = 155
        Height = 380
        Align = alTop
        Columns = <
          item
            Caption = #36710#29260#21495#30721
            Width = 100
          end>
        GridLines = True
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
        OnDblClick = ListView2DblClick
      end
      object ListView3: TListView
        Left = 1
        Top = 1
        Width = 155
        Height = 152
        Align = alTop
        Columns = <
          item
            Caption = #36710#29260#21495#30721
            Width = 80
          end
          item
            Caption = #36710#36742'ID'#21495
            Width = 0
          end
          item
            Caption = #21457#36865#29366#24577
            Width = 100
          end
          item
            Caption = #32534#21495
            Width = 100
          end>
        GridLines = True
        ReadOnly = True
        RowSelect = True
        TabOrder = 1
        ViewStyle = vsReport
      end
      object Panel9: TPanel
        Left = 1
        Top = 153
        Width = 155
        Height = 44
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        object SpeedButton5: TSpeedButton
          Left = 8
          Top = 7
          Width = 90
          Height = 27
          Caption = #21024#38500#36710#26426#24191#21578
          OnClick = SpeedButton5Click
        end
        object CheckBox2: TCheckBox
          Left = 106
          Top = 17
          Width = 47
          Height = 17
          Caption = #20840#37096
          TabOrder = 0
        end
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 827
      Height = 613
      Align = alClient
      Caption = 'Panel4'
      TabOrder = 1
      object ListView4: TListView
        Left = 194
        Top = 385
        Width = 591
        Height = 72
        Columns = <
          item
            Caption = 'ledID'
            Width = 100
          end
          item
            Caption = 'cmdid'
            Width = 100
          end
          item
            Caption = #36710#36742'ID '
            Width = 100
          end
          item
            Caption = #21024#38500#32467#26524
            Width = 100
          end
          item
            Caption = #21457#36865#24635#20010#25968
            Width = 100
          end>
        GridLines = True
        ReadOnly = True
        RowSelect = True
        TabOrder = 4
        ViewStyle = vsReport
        Visible = False
      end
      object ListView1: TListView
        Left = 137
        Top = 264
        Width = 584
        Height = 73
        Columns = <
          item
            Caption = #21629#20196'ID'#21495
            Width = 100
          end
          item
            Caption = #36710#36742'ID'#21495
            Width = 100
          end
          item
            Caption = #21024#38500#31867#22411
            Width = 100
          end
          item
            Caption = #21024#38500#32467#26524
            Width = 100
          end>
        GridLines = True
        ReadOnly = True
        RowSelect = True
        TabOrder = 2
        ViewStyle = vsReport
        Visible = False
      end
      object AdInfoList: TcxTreeList
        Left = 1
        Top = 177
        Width = 825
        Height = 414
        Align = alClient
        Bands = <
          item
            Caption.AlignHorz = taCenter
            Caption.Text = #22522#26412#20449#24687
          end>
        BufferedPaint = True
        OptionsData.Deleting = False
        OptionsSelection.MultiSelect = True
        OptionsView.GridLines = tlglBoth
        OptionsView.ShowRoot = False
        TabOrder = 0
        OnChange = AdInfoListChange
        OnClick = AdInfoListClick
        OnEditing = AdInfoListEditing
        object adinfoSend: TcxTreeListColumn
          Caption.Text = #36873#25321
          DataBinding.ValueType = 'Boolean'
          Width = 80
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object cxID: TcxTreeListColumn
          Caption.Text = #33258#21160#32534#21495
          DataBinding.ValueType = 'Integer'
          Options.Editing = False
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
          SortOrder = soAscending
        end
        object LedMemo: TcxTreeListColumn
          Caption.Text = #24191#21578#20869#23481
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Width = 200
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object DataType: TcxTreeListColumn
          Caption.Text = #25968#25454#31867#22411
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Width = 124
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object DataSpeed: TcxTreeListColumn
          Caption.Text = #36895#24230#32423#21035
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Width = 126
          Position.ColIndex = 4
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object InType: TcxTreeListColumn
          Caption.Text = #36827#20837#26041#24335
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Width = 123
          Position.ColIndex = 5
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object ExitType: TcxTreeListColumn
          Caption.Text = #36864#20986#26041#24335
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Width = 125
          Position.ColIndex = 6
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object x: TcxTreeListColumn
          Visible = False
          Caption.Text = 'X'
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Position.ColIndex = 10
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object y: TcxTreeListColumn
          Visible = False
          Caption.Text = 'Y'
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Position.ColIndex = 10
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object StopTime: TcxTreeListColumn
          Caption.Text = #20572#30041#26102#38388
          DataBinding.ValueType = 'Integer'
          Options.Editing = False
          Width = 126
          Position.ColIndex = 7
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object Font: TcxTreeListColumn
          Caption.Text = #23383#20307
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Width = 123
          Position.ColIndex = 8
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object IsDisTime: TcxTreeListColumn
          Caption.Text = #26102#38388#26631
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Width = 125
          Position.ColIndex = 9
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object ExTend: TcxTreeListColumn
          Visible = False
          Caption.Text = #25193#23637
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Position.ColIndex = 10
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object RunTime: TcxTreeListColumn
          Caption.Text = #25237#25918#26102#38388
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Width = 124
          Position.ColIndex = 10
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object EndTime: TcxTreeListColumn
          Caption.Text = #32467#26463#26102#38388
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Width = 125
          Position.ColIndex = 11
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object CusTerm: TcxTreeListColumn
          Caption.Text = #23458#25143
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Width = 125
          Position.ColIndex = 12
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object custermper: TcxTreeListColumn
          Caption.Text = #32852#31995#20154
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Width = 124
          Position.ColIndex = 13
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object custermtel: TcxTreeListColumn
          Caption.Text = #32852#31995#30005#35805
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Width = 125
          Position.ColIndex = 14
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object memo: TcxTreeListColumn
          Caption.Text = #22791#27880
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Width = 125
          Position.ColIndex = 15
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
        object AdInfoSendState: TcxTreeListColumn
          Visible = False
          Caption.Text = #21457#36865#29366#24577
          DataBinding.ValueType = 'String'
          Options.Editing = False
          Width = 117
          Position.ColIndex = 15
          Position.RowIndex = 0
          Position.BandIndex = 0
        end
      end
      object Panel5: TPanel
        Left = 1
        Top = 1
        Width = 825
        Height = 168
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Panel5'
        TabOrder = 1
        object GroupBox1: TGroupBox
          Left = 0
          Top = 0
          Width = 825
          Height = 177
          Align = alTop
          Caption = #26174#31034#23631#26041#24335
          TabOrder = 0
          object Label10: TLabel
            Left = 327
            Top = 43
            Width = 52
            Height = 13
            Caption = #36895#24230#32423#21035
          end
          object Label8: TLabel
            Left = 183
            Top = 43
            Width = 26
            Height = 13
            Caption = #23383#20307
          end
          object Label9: TLabel
            Left = 183
            Top = 17
            Width = 26
            Height = 13
            Caption = #26684#24335
          end
          object Label1: TLabel
            Left = 8
            Top = 19
            Width = 52
            Height = 13
            Caption = #36827#20837#26041#24335
          end
          object Label4: TLabel
            Left = 8
            Top = 43
            Width = 52
            Height = 13
            Caption = #36864#20986#26041#24335
          end
          object Label7: TLabel
            Left = 495
            Top = 15
            Width = 52
            Height = 13
            Caption = #26102#38388#26631#31034
          end
          object Label6: TLabel
            Left = 327
            Top = 15
            Width = 52
            Height = 13
            Caption = #20572#30041#26102#38388
          end
          object Label3: TLabel
            Left = 420
            Top = 15
            Width = 13
            Height = 13
            Caption = #20998
          end
          object Label5: TLabel
            Left = 464
            Top = 15
            Width = 13
            Height = 13
            Caption = #31186
          end
          object Label14: TLabel
            Left = 324
            Top = 175
            Width = 39
            Height = 13
            Caption = #23631#26631#21495
            Visible = False
          end
          object Label11: TLabel
            Left = 396
            Top = 167
            Width = 7
            Height = 13
            Caption = 'X'
            Visible = False
          end
          object Label12: TLabel
            Left = 456
            Top = 167
            Width = 7
            Height = 13
            Caption = 'Y'
            Visible = False
          end
          object Label13: TLabel
            Left = 8
            Top = 67
            Width = 52
            Height = 13
            Caption = #24191#21578#20869#23481
          end
          object Label16: TLabel
            Left = 644
            Top = 43
            Width = 52
            Height = 13
            Caption = #20844#21496#23458#25143
          end
          object Label17: TLabel
            Left = 645
            Top = 15
            Width = 52
            Height = 13
            Caption = #32852#31995#30005#35805
          end
          object Label18: TLabel
            Left = 9
            Top = 89
            Width = 52
            Height = 13
            Caption = #22791#27880#20449#24687
          end
          object Label19: TLabel
            Left = 506
            Top = 46
            Width = 39
            Height = 13
            Caption = #32852#31995#20154
          end
          object Label15: TLabel
            Left = 335
            Top = 172
            Width = 52
            Height = 13
            Caption = #32467#26463#26102#38388
            Visible = False
          end
          object a: TLabel
            Left = 335
            Top = 172
            Width = 52
            Height = 13
            Caption = #25237#25918#26102#38388
            Visible = False
          end
          object Edit2: TEdit
            Left = 446
            Top = 172
            Width = 46
            Height = 21
            TabOrder = 0
            Text = '0'
            Visible = False
          end
          object Edit1: TEdit
            Left = 433
            Top = 170
            Width = 49
            Height = 21
            TabOrder = 1
            Text = '0'
            Visible = False
          end
          object ComboBox3: TComboBox
            Left = 385
            Top = 39
            Width = 86
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 2
            TabOrder = 2
            Text = #19977#32423
            Items.Strings = (
              #19968#32423
              #20108#32423
              #19977#32423
              #22235#32423
              #20116#32423
              #20845#32423
              #19971#32423
              #20843#32423)
          end
          object ComboBox6: TComboBox
            Left = 212
            Top = 40
            Width = 92
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 3
            Text = #31616#20307
            Items.Strings = (
              #31616#20307)
          end
          object ComboBox8: TComboBox
            Left = 213
            Top = 13
            Width = 91
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 4
            Text = #25991#26412
            Items.Strings = (
              #25991#26412
              #22270#29255)
          end
          object ComboBox1: TComboBox
            Left = 65
            Top = 13
            Width = 102
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 5
            Text = #20174#21491#21040#24038
            OnChange = ComboBox1Change
            Items.Strings = (
              #20174#21491#21040#24038
              #20174#24038#21040#21491
              #20174#19978#21040#19979
              #20174#19979#21040#19978
              #25972#23631#36827#20837)
          end
          object ComboBox2: TComboBox
            Left = 65
            Top = 39
            Width = 102
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 6
            Text = #20174#21491#21040#24038
            Items.Strings = (
              #20174#21491#21040#24038
              #20174#24038#21040#21491
              #20174#19978#21040#19979
              #20174#19979#21040#19978
              #25972#23631#36864#20986)
          end
          object ComboBox7: TComboBox
            Left = 554
            Top = 11
            Width = 82
            Height = 21
            ItemHeight = 13
            ItemIndex = 1
            TabOrder = 7
            Text = #19981#26174#31034#26102#38388
            Items.Strings = (
              #26174#31034#26102#38388
              #19981#26174#31034#26102#38388)
          end
          object Edit3: TEdit
            Left = 387
            Top = 11
            Width = 32
            Height = 21
            TabOrder = 8
            Text = '0'
          end
          object Edit4: TEdit
            Left = 435
            Top = 11
            Width = 27
            Height = 21
            TabOrder = 9
            Text = '0'
          end
          object ComboBox4: TComboBox
            Left = 451
            Top = 171
            Width = 116
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 10
            Text = #19968#21495#23631
            Visible = False
            Items.Strings = (
              #19968#21495#23631
              #20108#21495#23631
              #19977#21495#23631)
          end
          object LedMemo1: TEdit
            Left = 64
            Top = 64
            Width = 410
            Height = 21
            TabOrder = 11
            Text = 'LedMemo1'
          end
          object CusTerm1: TEdit
            Left = 700
            Top = 37
            Width = 106
            Height = 21
            TabOrder = 12
            Text = 'CusTerm1'
          end
          object custermTel1: TEdit
            Left = 552
            Top = 42
            Width = 81
            Height = 21
            TabOrder = 13
            Text = 'custermTel'
          end
          object custermPer1: TEdit
            Left = 700
            Top = 10
            Width = 105
            Height = 21
            TabOrder = 14
            Text = 'custermPer1'
          end
          object Panel8: TPanel
            Left = 8
            Top = 172
            Width = 529
            Height = 46
            BevelOuter = bvLowered
            Color = clMedGray
            TabOrder = 15
            Visible = False
            object Image1: TImage
              Left = 3
              Top = 3
              Width = 522
              Height = 40
              OnDblClick = Image1DblClick
            end
          end
          object DateTimePicker1: TDateTimePicker
            Left = 395
            Top = 166
            Width = 116
            Height = 21
            Date = 39583.636253425920000000
            Time = 39583.636253425920000000
            TabOrder = 16
            Visible = False
          end
          object DateTimePicker2: TDateTimePicker
            Left = 395
            Top = 169
            Width = 116
            Height = 21
            Date = 39583.636421979160000000
            Time = 39583.636421979160000000
            TabOrder = 17
            Visible = False
          end
          object Memo1: TMemo
            Left = 63
            Top = 91
            Width = 412
            Height = 73
            Lines.Strings = (
              '')
            ScrollBars = ssVertical
            TabOrder = 18
          end
          object GroupBox2: TGroupBox
            Left = 649
            Top = 68
            Width = 159
            Height = 96
            TabOrder = 19
            object Label21: TLabel
              Left = 15
              Top = 17
              Width = 52
              Height = 13
              Caption = #26102#38388#38271#24230
            end
            object Label22: TLabel
              Left = 12
              Top = 41
              Width = 52
              Height = 13
              Caption = #20108#23631#38388#38548
            end
            object Label23: TLabel
              Left = 136
              Top = 15
              Width = 13
              Height = 13
              Caption = #31186
            end
            object Label24: TLabel
              Left = 136
              Top = 40
              Width = 13
              Height = 13
              Caption = #31186
            end
            object Edit5: TEdit
              Left = 77
              Top = 14
              Width = 53
              Height = 21
              Color = clCaptionText
              TabOrder = 0
              Text = '60'
            end
            object Edit6: TEdit
              Left = 78
              Top = 38
              Width = 53
              Height = 21
              TabOrder = 1
              Text = '10'
            end
            object RzBitBtn2: TRzBitBtn
              Left = 9
              Top = 68
              Width = 65
              Height = 22
              Caption = #21457#36865
              TabOrder = 2
              OnClick = RzBitBtn2Click
              Glyph.Data = {
                36060000424D3606000000000000360400002800000020000000100000000100
                08000000000000020000630B0000630B00000001000000000000000000003300
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
                E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8180C
                E8E8E8E8E8E8E8E8E8E8E8E8E8E8E2DFE8E8E8E8E8E8E8E8E8E8E8E8E8181212
                0CE8E8E8E8E8E8E8E8E8E8E8E8E28181DFE8E8E8E8E8E8E8E8E8E8E818121212
                120CE8E8E8E8E8E8E8E8E8E8E281818181DFE8E8E8E8E8E8E8E8E81812121212
                12120CE8E8E8E8E8E8E8E8E2818181818181DFE8E8E8E8E8E8E8E81812120C18
                1212120CE8E8E8E8E8E8E8E28181DFE2818181DFE8E8E8E8E8E8E818120CE8E8
                181212120CE8E8E8E8E8E8E281DFE8E8E2818181DFE8E8E8E8E8E8180CE8E8E8
                E8181212120CE8E8E8E8E8E2DFE8E8E8E8E2818181DFE8E8E8E8E8E8E8E8E8E8
                E8E8181212120CE8E8E8E8E8E8E8E8E8E8E8E2818181DFE8E8E8E8E8E8E8E8E8
                E8E8E8181212120CE8E8E8E8E8E8E8E8E8E8E8E2818181DFE8E8E8E8E8E8E8E8
                E8E8E8E81812120CE8E8E8E8E8E8E8E8E8E8E8E8E28181DFE8E8E8E8E8E8E8E8
                E8E8E8E8E818120CE8E8E8E8E8E8E8E8E8E8E8E8E8E281DFE8E8E8E8E8E8E8E8
                E8E8E8E8E8E8180CE8E8E8E8E8E8E8E8E8E8E8E8E8E8E2DFE8E8E8E8E8E8E8E8
                E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
              NumGlyphs = 2
            end
          end
          object CheckBox1: TCheckBox
            Left = 654
            Top = 67
            Width = 110
            Height = 13
            Caption = #35774#32622#23631#24403#21069#26102#38388
            TabOrder = 20
            OnClick = CheckBox1Click
          end
          object GroupBox3: TGroupBox
            Left = 488
            Top = 68
            Width = 159
            Height = 96
            Enabled = False
            TabOrder = 21
            object Label25: TLabel
              Left = 39
              Top = 24
              Width = 26
              Height = 13
              Caption = #21518#23631
            end
            object Label26: TLabel
              Left = 40
              Top = 49
              Width = 26
              Height = 13
              Caption = #21069#23631
            end
            object ComboBox5: TComboBox
              Left = 76
              Top = 16
              Width = 69
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              ItemIndex = 0
              TabOrder = 0
              Text = #20851#26426
              Items.Strings = (
                #20851#26426
                #24320#26426
                '')
            end
            object ComboBox9: TComboBox
              Left = 77
              Top = 44
              Width = 70
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              ItemIndex = 0
              TabOrder = 1
              Text = #20851#26426
              Items.Strings = (
                #20851#26426
                #24320#26426
                '')
            end
            object RzBitBtn3: TRzBitBtn
              Left = 8
              Top = 68
              Width = 65
              Height = 22
              Caption = #21457#36865
              TabOrder = 2
              OnClick = RzBitBtn3Click
              Glyph.Data = {
                36060000424D3606000000000000360400002800000020000000100000000100
                08000000000000020000630B0000630B00000001000000000000000000003300
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
                E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8180C
                E8E8E8E8E8E8E8E8E8E8E8E8E8E8E2DFE8E8E8E8E8E8E8E8E8E8E8E8E8181212
                0CE8E8E8E8E8E8E8E8E8E8E8E8E28181DFE8E8E8E8E8E8E8E8E8E8E818121212
                120CE8E8E8E8E8E8E8E8E8E8E281818181DFE8E8E8E8E8E8E8E8E81812121212
                12120CE8E8E8E8E8E8E8E8E2818181818181DFE8E8E8E8E8E8E8E81812120C18
                1212120CE8E8E8E8E8E8E8E28181DFE2818181DFE8E8E8E8E8E8E818120CE8E8
                181212120CE8E8E8E8E8E8E281DFE8E8E2818181DFE8E8E8E8E8E8180CE8E8E8
                E8181212120CE8E8E8E8E8E2DFE8E8E8E8E2818181DFE8E8E8E8E8E8E8E8E8E8
                E8E8181212120CE8E8E8E8E8E8E8E8E8E8E8E2818181DFE8E8E8E8E8E8E8E8E8
                E8E8E8181212120CE8E8E8E8E8E8E8E8E8E8E8E2818181DFE8E8E8E8E8E8E8E8
                E8E8E8E81812120CE8E8E8E8E8E8E8E8E8E8E8E8E28181DFE8E8E8E8E8E8E8E8
                E8E8E8E8E818120CE8E8E8E8E8E8E8E8E8E8E8E8E8E281DFE8E8E8E8E8E8E8E8
                E8E8E8E8E8E8180CE8E8E8E8E8E8E8E8E8E8E8E8E8E8E2DFE8E8E8E8E8E8E8E8
                E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
              NumGlyphs = 2
            end
          end
          object RzCheckBox1: TRzCheckBox
            Left = 495
            Top = 65
            Width = 60
            Height = 17
            Caption = #23631#25511#21046
            State = cbUnchecked
            TabOrder = 22
            OnClick = RzCheckBox1Click
          end
          object Edit7: TEdit
            Left = 7
            Top = 104
            Width = 33
            Height = 21
            TabOrder = 23
          end
          object Edit8: TEdit
            Left = 7
            Top = 128
            Width = 34
            Height = 21
            TabOrder = 24
          end
          object RzBitBtn4: TRzBitBtn
            Left = 7
            Top = 148
            Width = 33
            Height = 16
            TabOrder = 25
            OnClick = RzBitBtn4Click
            Glyph.Data = {
              36060000424D3606000000000000360400002800000020000000100000000100
              08000000000000020000E30E0000E30E00000001000000000000000000003300
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
              E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8121212
              12121212121212E8E8E8E8E8E881818181818181818181E8E8E8E8E812181818
              1818121812121212E8E8E8E881E2E2E2E2E281E281818181E8E8E8E8121E1818
              1818181218121212E8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E812181E18
              1818181812181212E8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E8121E181E
              1818181818121812E8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E8121E1E18
              1E18181818181212E8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E8128D1E1E
              181E181818181812E8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E8128D8D1E
              1E181E1818181812E8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E8121212
              12121212121212E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
              E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
              E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
              E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
            NumGlyphs = 2
          end
        end
      end
      object cxSplitter2: TcxSplitter
        Left = 1
        Top = 169
        Width = 825
        Height = 8
        HotZoneClassName = 'TcxSimpleStyle'
        AlignSplitter = salTop
        Control = Panel5
        Color = clBtnFace
        ShowHint = False
        ParentColor = False
        ParentShowHint = False
      end
      object Panel7: TPanel
        Left = 1
        Top = 591
        Width = 825
        Height = 21
        Align = alBottom
        TabOrder = 5
        object Label20: TLabel
          Left = 640
          Top = 3
          Width = 49
          Height = 13
          Caption = 'Label20'
          Font.Charset = ANSI_CHARSET
          Font.Color = clGreen
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object ProgressBar1: TProgressBar
          Left = 1
          Top = 1
          Width = 574
          Height = 19
          Align = alLeft
          TabOrder = 0
        end
      end
    end
    object cxSplitter1: TcxSplitter
      Left = 828
      Top = 1
      Width = 8
      Height = 613
      HotZoneClassName = 'TcxSimpleStyle'
      AlignSplitter = salRight
      Control = Panel2
      Color = clBtnFace
      ShowHint = False
      ParentColor = False
      ParentShowHint = False
    end
  end
  object Panel6: TPanel
    Left = 0
    Top = 615
    Width = 994
    Height = 40
    Align = alBottom
    TabOrder = 2
    object SpeedButton3: TSpeedButton
      Left = 714
      Top = -25
      Width = 73
      Height = 22
      Caption = #20462#25913#24191#21578
      Visible = False
      OnClick = SpeedButton3Click
    end
    object SpeedButton2: TSpeedButton
      Left = 118
      Top = 50
      Width = 73
      Height = 22
      Caption = #21024#38500#24191#21578
      Visible = False
      OnClick = SpeedButton2Click
    end
    object SpeedButton1: TSpeedButton
      Left = 210
      Top = 47
      Width = 73
      Height = 22
      Caption = #28155#21152#24191#21578
      Visible = False
      OnClick = SpeedButton1Click
    end
    object SpeedButton4: TSpeedButton
      Left = 913
      Top = 7
      Width = 73
      Height = 25
      Caption = #36864#20986
      Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        1000030000000002000000000000000000000000000000000000007C0000E003
        00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        AD351F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7CA101
        6002AA291F7C1F7C1F7CAD358619C001210AAD351F7C1F7C1F7C1F7C1F7C8212
        60021F7C1F7C1F7C4212C31AC31A810E6733C001AE311F7C1F7C1F7CE109C31A
        C0011F7C1F7CC309AA472733010E8709AA43A21282091F7C1F7C1F7C831E6002
        A81D1F7C1F7C1F7C1F7C1F7C1F7C1F7C2212893FA10E830D0006600660022002
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C4316E31EA10E810E810A20028609
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C70391F7C2212052FA212610EAB2D1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C831E621670391F7C2633A216A212AB2D1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7CA5260427AB2D1F7CE52EC31AA2168105E005610A
        E0011F7C1F7C1F7C1F7C1F7CC10947378209A209831AC31EC31AC316810A810A
        610AAD351F7C1F7C1F7C1F7C1F7CCA474733683767332627420EA0011F7C831A
        A10EAB2D1F7C1F7C1F7C1F7C1F7C8A3F641A020E1F7C1F7CC00185151F7CC005
        A21285151F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7CA4224737E31EA71D210A
        8006850D1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C693FCB4B263386191F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7CA522C2091F7C1F7C
        1F7C1F7C1F7C}
      OnClick = SpeedButton4Click
    end
    object SpeedButton7: TSpeedButton
      Left = 486
      Top = 11
      Width = 79
      Height = 25
      Caption = #21457#36865#26174#31034
      Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        1000030000000002000000000000000000000000000000000000007C0000E003
        00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C104210421F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000000010421F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00001F7C000010421F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C18630000000018631F7C0000104210421863
        1F7C1F7C1F7C1F7C1F7C1F7C0000000018631F7C1F7C1F7C1863000000001042
        10421F7C1F7C1F7C1F7C000018631F7C1F7C1F7C1F7C1F7C1F7C1F7C18630000
        104210421F7C1F7C10421F7C1F7C1F7C1F001F001F001F001F001F7C1F7C1863
        000010421863104218631F7C1F7C1F7C1F7C10421F001F001F7C1F7C1F7C1F7C
        18630000104210421F7C1F7C1F7C1F7C1F7C10421F001F001F7C1F7C1F7C1F7C
        1F7C0000104210421F7C1F7C1F7C1F7C1F7C10421F001F001F7C1F7C1F7C1F7C
        1F7C0000104210421F7C1F7C1F7C1F7C10421F001F001F001F7C1F7C1F7C1F7C
        1F7C0000104210421F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        186300001F7C1F7C10421F7C1F7C1F7C1F7C10421F001F001F7C1F7C1F7C1F7C
        000010421F7C1F7C10421F7C1F7C1F7C1F7C1F001F001F001F7C1F7C1F7C1863
        00001F7C1F7C1F7C1F7C104210421F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C10421042104210421042104210421F7C1F7C
        1F7C1F7C1F7C}
      OnClick = SpeedButton7Click
    end
    object BitBtnSend: TBitBtn
      Left = 402
      Top = 11
      Width = 82
      Height = 26
      Caption = #21457#36865#23384#20648
      TabOrder = 0
      OnClick = BitBtnSendClick
      Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        1000030000000002000000000000000000000000000000000000007C0000E003
        00001F0000001F7C1F7C1F7CC618C618C618C618C618C618C618C618C618C618
        1F7C1F7C1F7C1F7C1F7CC6181042D65A7B6F7B6F7B6F7B6F7B6F7B6F3967C618
        C028E05D1F7C1F7CC618DE7B2925D65A9C739C739C739C739C739C73734EC028
        E05D8049E05DC618104229258C319C739C73DE7BDE7BDE7BDE7B734EC028E05D
        E97E80491F7CC6189C739C739C739C739C739C73DE7BDE7B734EC028E05DE97E
        80491F7C1F7CC6189C739C739C739C739C739C739C73734EC028E05DE97E8049
        1F7C1F7C1F7CC6189C739C73D67E317E39679C73734EC028E05DE97E8049C618
        1F7C1F7C1F7CC6189C739C73317E317E317E734EC028E05DE97E80493967C618
        1F7C1F7C1F7CC6189C73317E317E317EAD352039E05DE97E80499C73B17EC618
        1F7C1F7C1F7CC618D67E317E7B6FD67EAD35DA7FE97E804939673967D67EC618
        1F7C1F7C1F7CC618D67E7B6F7B6FD67EAD352104DA7F317E317ED67EB17EC618
        1F7C1F7C1F7CC6189C737B6F7B6F317E317EAD35B17E1863317E317E357EC618
        1F7C1F7C1F7CC6189C737B6F7B6F7B6F7B6F7B6F7B6FD67E317E317E1863C618
        1F7C1F7C1F7CC6189C737B6F7B6F7B6F7B6F7B6F7B6F7B6FD67ED67E9C73C618
        1F7C1F7C1F7CC618DE7B9C739C739C739C739C739C739C739C739C739C73C618
        1F7C1F7C1F7CC618C618C618C618C618C618C618C618C618C618C618C618C618
        1F7C1F7C1F7C}
    end
    object BitBtn1: TBitBtn
      Left = 653
      Top = 9
      Width = 79
      Height = 25
      Caption = #21462#28040#21457#36865
      TabOrder = 1
      OnClick = BitBtn1Click
      Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        1000030000000002000000000000000000000000000000000000007C0000E003
        00001F0000001F7C1F7C1F7C0000000000001F7C1F7C1F7C1F7C000000001F7C
        1F7C1F7C1F7C1F7C1F7C00006260005C005C00001F7C1F7C0000005C005C0000
        1F7C1F7C1F7C1F7C1F7C0000E66C6B79287100001F7C000041608C7DAC7D8464
        00001F7C1F7C1F7C1F7C000029758C79AC7D0771000041606A79AC7DAC7DE66C
        00001F7C1F7C1F7C1F7C0000E66C6A796A798C7D07716A798C798C7D6B796364
        00001F7C1F7C1F7C1F7C1F7C0000E66C49754A756B798C794A758C7928716364
        00001F7C1F7C1F7C1F7C1F7C1F7C0000E66C297549754A758C79287163640000
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00002871077128712871287163640000
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000771E66C07710771287107710000
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00002975A568C66CE66C077107716260
        00001F7C1F7C1F7C1F7C1F7C1F7C0000C668C668A568C668C668C668E76C0771
        416000001F7C1F7C1F7C1F7C1F7C0000C668C6688364846429750771C668C66C
        C66C416000001F7C1F7C1F7C00004975E66C6260C668E76C0000A568E76CC668
        0771416000001F7C1F7C1F7C00002975077107710771C668000000008364E66C
        E76CA56800001F7C1F7C1F7C1F7C000029752871287100001F7C1F7C00000000
        000000001F7C1F7C1F7C1F7C1F7C1F7C0000000000001F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C}
    end
    object BitBtn2: TBitBtn
      Left = 2
      Top = 10
      Width = 73
      Height = 25
      Caption = #28155#21152#24191#21578
      TabOrder = 2
      OnClick = BitBtn2Click
      Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        1000030000000002000000000000000000000000000000000000007C0000E003
        00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000EF3D
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7CEF3D1F7C1F7C0000EF3D
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7CEF3D0000000000001F7C0000EF3D
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7CEF3D1F7C1F7C00001F7C0000EF3D
        EF3DEF3DEF3D1F7C1F7C1F7C1F7CEF3D0000000000001F7C00001F7C00000000
        0000000000001F7C1F7C1F7C1F7CEF3DFF7FFF7F00001F7C00001F7C1F7C1F7C
        1F7C1F7C00001F7C1F7C00000000EF3DFF7FFF7F00001F7C0000000000000000
        00001F7C00001F7C1F7CEF3D1F7CEF3DFF7FFF7F00001F7C1F7C1F7C1F7C1F7C
        0000EF3DEF3D00000000000000000000FF7FFF7F000000000000000000001F7C
        00001F7C1F7CEF3DFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000EF3D
        EF3D1F7C1F7CEF3DFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00001F7C
        1F7C1F7C1F7CEF3DEF3DEF3DEF3DEF3DFF7FFF7F0000EF3DEF3DEF3DEF3D1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7CEF3DFF7FFF7F00001F7C00001F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7CEF3DFF7FFF7F0000EF3DEF3D1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7CEF3DFF7FFF7F00001F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7CEF3DEF3DEF3DEF3D1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C}
    end
    object BitBtn3: TBitBtn
      Left = 75
      Top = 10
      Width = 70
      Height = 25
      Caption = #21024#38500#24191#21578
      TabOrder = 3
      OnClick = BitBtn3Click
      Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        1000030000000002000000000000000000000000000000000000007C0000E003
        00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C00001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        00001F7C1F7C1F7C0000007C00001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        007C1F7C1F7C1F7C007C007C007C00001F7C1F7C1F7C1F7C1F7C1F7C1F7C0000
        1F7C1F7C1F7C1F7C007C007C007C007C1F7C1F7C1F7C1F7C1F7C1F7C0000007C
        1F7C1F7C1F7C1F7C1F7C007C007C007C00001F7C1F7C1F7C1F7C0000007C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C007C007C007C00001F7C1F7C0000007C007C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C007C007C007C00000000007C007C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C007C007C007C007C007C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000007C007C007C00001F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000007C007C007C007C007C00001F7C1F7C
        1F7C1F7C1F7C1F7C1F7C00000000007C007C007C1F7C1F7C007C007C00001F7C
        1F7C1F7C1F7C1F7C0000007C007C007C007C1F7C1F7C1F7C1F7C007C007C0000
        1F7C1F7C1F7C1F7C007C007C007C007C1F7C1F7C1F7C1F7C1F7C1F7C007C007C
        00001F7C1F7C1F7C007C007C007C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        007C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C}
    end
    object BitBtn4: TBitBtn
      Left = 208
      Top = 9
      Width = 63
      Height = 25
      Caption = #21462#28040
      TabOrder = 4
      OnClick = BitBtn4Click
      Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        1000030000000002000000000000000000000000000000000000007C0000E003
        00001F0000001F7C000000000000000000000000000000000000000000000000
        00001F7C1F7CCE39104210421042104210421042104210421042104210421042
        292500001F7C10421F7CFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1F7C
        1042292500001042D5561042104210421042104200001042CE39104210421F7C
        10422925000010421F7C1F7C1F7C1F7C1F7CE03D1F7C00001F7C1F7C1F7CD556
        10422925000010421F7C1F7C1F7C1F7C1F7CE03DFF7F2C6700001F7CE0011F7C
        1042292500001042FF7FFF7FFF7FFF7FE03DFF7FF27F45662C670000FF7FFF7F
        1042292500001F7C10421F7CD5561F7CE03DFF7F4566F27F45662C6700001F7C
        D5564A2900001F7C1F7C10421042E03DFF7F4566F27F45662C7F45662C670000
        104210421F7C1F7C1F7C1F7C1F7C0F00FF7FF27F4566E57FE03D2C7F2C67E03D
        00001F7C1F7C1F7C1F7C1F7C0F005F320F00E03DE07FE03D2C7F2C6700000000
        1F7C1F7C1F7C1F7C1F7C1F7C0F003F675F320F00E03D2C7F000000001F7C1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C0F005F321F000F00000000001F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C0F005F320000000000001F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C0F005F3200001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C0F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C}
    end
    object BitBtn5: TBitBtn
      Left = 270
      Top = 8
      Width = 61
      Height = 25
      Caption = #30830#23450
      TabOrder = 5
      OnClick = BitBtn5Click
      Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        1000030000000002000000000000000000000000000000000000007C0000E003
        00001F0000001F7C203520352035203520352035203520352035203520352035
        20357B6F1F7C8049C514E0591F7C1F7C1F7C1F7C1F7C7A6B7A6B7A6BDD77957F
        C514C0241F7C8049C87EE059175F1F7C1F7C1F7C1F7C1F7C7A6B7A6B7A6B957F
        C87EC0241F7C80490C7FE059D65A175F175F175F1F7C1F7C1F7C1F7C7A6B957F
        C87EC0241F7C80490C7FE059D65AD65AD65A175F1F7C1F7C1F7C1F7C175F957F
        C87EC0241F7C80490C7FE0595146744ED65AD65A175F1F7C175F175FD65A957F
        C87EC0241F7C80490C7FE05951465146744E744ED65A175F175FD65AD65A957F
        C87EC0241F7C8049517FE059E059E059E059E059E059E059E059E059E059517F
        C87EC0241F7C8049517F517F517F517F517F517F517F517F517F517F517F957F
        C87EC0241F7C8049517FE059A07EE059E059E059E059E059E059E059C87E517F
        C87EC0241F7C80490C7FE0599C7380497B6FDD77DD77D65AD65ADD77E059517F
        0C7FC0241F7C8049517FE0597B6F80497B6F7A6B7A6BEF3DEF3DDD778049517F
        0C7FC0241F7C8049C87EE0597B6F80497B6F7A6B7A6BAD3551467A6B8049517F
        0C7FC0241F7C8049517FE0597B6F80495A6B9C737A6BC514C514DD778049517F
        0C7FC0241F7C8049957FE0597A6BE0599C735A6B5A6B5A6B7B6F1F7C8049957F
        20351F7C1F7C7B6F104210421042104210421042104210421042104210421042
        7B6F7B6F1F7C}
    end
    object CheckBox3: TCheckBox
      Left = 758
      Top = 12
      Width = 127
      Height = 17
      Caption = #26597#30475#24191#21578#25152#21457#36710#36742
      TabOrder = 6
    end
    object BitBtn6: TBitBtn
      Left = 147
      Top = 10
      Width = 61
      Height = 25
      Caption = #20462#25913
      TabOrder = 7
      OnClick = BitBtn6Click
      Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        1000030000000002000000000000000000000000000000000000007C0000E003
        00001F0000001F7C1F7C1F7CC618C618C618C618C618C618C618C618C618C618
        1F7C1F7C1F7C1F7C1F7CC6181042D65A7B6F7B6F7B6F7B6F7B6F7B6F3967C618
        C028E05D1F7C1F7CC618DE7B2925D65A9C739C739C739C739C739C73734EC028
        E05D8049E05DC618104229258C319C739C73DE7BDE7BDE7BDE7B734EC028E05D
        E97E80491F7CC6189C739C739C739C739C739C73DE7BDE7B734EC028E05DE97E
        80491F7C1F7CC6189C739C739C739C739C739C739C73734EC028E05DE97E8049
        1F7C1F7C1F7CC6189C739C73D67E317E39679C73734EC028E05DE97E8049C618
        1F7C1F7C1F7CC6189C739C73317E317E317E734EC028E05DE97E80493967C618
        1F7C1F7C1F7CC6189C73317E317E317EAD352039E05DE97E80499C73B17EC618
        1F7C1F7C1F7CC618D67E317E7B6FD67EAD35DA7FE97E804939673967D67EC618
        1F7C1F7C1F7CC618D67E7B6F7B6FD67EAD352104DA7F317E317ED67EB17EC618
        1F7C1F7C1F7CC6189C737B6F7B6F317E317EAD35B17E1863317E317E357EC618
        1F7C1F7C1F7CC6189C737B6F7B6F7B6F7B6F7B6F7B6FD67E317E317E1863C618
        1F7C1F7C1F7CC6189C737B6F7B6F7B6F7B6F7B6F7B6F7B6FD67ED67E9C73C618
        1F7C1F7C1F7CC618DE7B9C739C739C739C739C739C739C739C739C739C73C618
        1F7C1F7C1F7CC618C618C618C618C618C618C618C618C618C618C618C618C618
        1F7C1F7C1F7C}
    end
    object RzBitBtn1: TRzBitBtn
      Left = 566
      Top = 10
      Width = 85
      Caption = #23384#20648#26174#31034
      TabOrder = 8
      OnClick = RzBitBtn1Click
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
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E80B0B0B0B0B
        0B0B0B0B0B0B0B0B0BE8E88181818181818181818181818181E8E80BD7D7D7D7
        D7D7D7D7D7D7D7D70BE8E881E8E8E8E8E8E8E8E8E8E8E8E881E8E80BD7D7D7D7
        D7D7D7818181D7D70BE8E881E8E8E8E8E8E8E8E2E2E2E8E881E8E80BD7D7D7D7
        D7D7D7D7D7D7D7D70BE8E881E8E8E8E8E8E8E8E8E8E8E8E881E8E80BD7D7D7D7
        D7D7D7515151D7D70BE8E881E8E8E8E8E8E8E8818181E8E881E8E80BD7D78181
        81D7D7515151D7D70BE8E881E8E8E2E2E2E8E8818181E8E881E8E80BD7D7D7D7
        D7D7D7515151D7D70BE8E881E8E8E8E8E8E8E8818181E8E881E8E80BD7D7C1C1
        C1D7D7D7D7D7D7D70BE8E881E8E8818181E8E8E8E8E8E8E881E8E80BD7D7C1C1
        C1D7D7D7D7D7D7D70BE8E881E8E8818181E8E8E8E8E8E8E881E8E80BD7D7C1C1
        C1D7D7D7D7D7D7D70BE8E881E8E8818181E8E8E8E8E8E8E881E8E80BD7D7D7D7
        D7D7D7D7D7D7D7D70BE8E881E8E8E8E8E8E8E8E8E8E8E8E881E8E80B0B0B0B0B
        0B0B0B0B0B0B0B0B0BE8E88181818181818181818181818181E8E80B0B0B0B0B
        0B0B0B0B0B0B0B0B0BE8E88181818181818181818181818181E8E8890B0B0B0B
        0B0B0B0B0B0B0B0B89E8E8AC818181818181818181818181ACE8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
      NumGlyphs = 2
    end
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Filter = 'Bitmaps (*.bmp)|*.bmp'
    Left = 576
    Top = 208
  end
  object Timer2: TTimer
    Enabled = False
    OnTimer = Timer2Timer
    Left = 257
    Top = 257
  end
end
