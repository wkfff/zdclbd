object AccuseFrm: TAccuseFrm
  Left = 417
  Top = -12
  AutoScroll = False
  Caption = #25237#35785#22788#29702
  ClientHeight = 744
  ClientWidth = 835
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 428
    Height = 744
    Align = alClient
    TabOrder = 0
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 426
      Height = 72
      Align = alTop
      TabOrder = 0
      object Label23: TLabel
        Left = 13
        Top = 21
        Width = 36
        Height = 13
        Caption = #26102#38388#65306
      end
      object Label24: TLabel
        Left = 214
        Top = 16
        Width = 6
        Height = 13
        Caption = '_'
      end
      object btnQuery: TSpeedButton
        Left = 325
        Top = 43
        Width = 63
        Height = 23
        Caption = #26597#35810
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
        OnClick = btnQueryClick
      end
      object Label25: TLabel
        Left = 12
        Top = 47
        Width = 36
        Height = 13
        Caption = #29366#24577#65306
        Visible = False
      end
      object FromDate: TDateTimePicker
        Left = 48
        Top = 17
        Width = 89
        Height = 21
        Date = 40124.504011134260000000
        Time = 40124.504011134260000000
        TabOrder = 0
      end
      object FromTime: TDateTimePicker
        Left = 138
        Top = 17
        Width = 73
        Height = 21
        Date = 40124.000000000000000000
        Time = 40124.000000000000000000
        Kind = dtkTime
        TabOrder = 1
      end
      object ToDate: TDateTimePicker
        Left = 225
        Top = 17
        Width = 89
        Height = 21
        Date = 40124.505003796290000000
        Time = 40124.505003796290000000
        TabOrder = 2
      end
      object ToTime: TDateTimePicker
        Left = 315
        Top = 17
        Width = 73
        Height = 21
        Date = 40124.999988425930000000
        Time = 40124.999988425930000000
        Kind = dtkTime
        TabOrder = 3
      end
      object ComboBoxState: TComboBox
        Left = 48
        Top = 43
        Width = 89
        Height = 21
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 4
        Text = #25152#26377
        Visible = False
        Items.Strings = (
          #25152#26377
          #26032#24314
          #35843#26597#20013
          #22788#29702#20013
          #32467#26463)
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 73
      Width = 426
      Height = 670
      Align = alClient
      TabOrder = 1
      object DBGrid1: TDBGrid
        Left = 1
        Top = 1
        Width = 424
        Height = 668
        Align = alClient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentShowHint = False
        PopupMenu = PopupMenu1
        ReadOnly = True
        ShowHint = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = DBGrid1CellClick
        Columns = <
          item
            Expanded = False
            FieldName = 'Accuse_Id'
            Title.Caption = 'ID'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Accuse_No'
            Title.Caption = #25237#35785#21495
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Accuse_Type'
            Title.Caption = #25237#35785#31867#22411
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'accuse_typeStr'
            Title.Caption = #25237#35785#31867#22411
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Accuse_Time'
            Title.Caption = #25237#35785#26102#38388
            Width = 119
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Accuse_Carno'
            Title.Caption = #36710#29260#21495
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TAXIRUNID'
            Title.Caption = #33829#36816'ID'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'case_HappenTime'
            Title.Caption = #21457#29983#26102#38388
            Width = 149
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'case_HappenAddr'
            Title.Caption = #21457#29983#22320#28857
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Accuse_Reason'
            Title.Caption = #25237#35785#21407#22240
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'passengerName'
            Title.Caption = #20056#23458#22995#21517
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PassengerTelNum'
            Title.Caption = #20056#23458#30005#35805
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PassengerMemo'
            Title.Caption = #20056#23458#22791#27880
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RecordId'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'User_Id'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'DealState'
            Title.Caption = #29366#24577
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'dealstateStr'
            Title.Caption = #29366#24577
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DealContent'
            Title.Caption = #35843#26597#24773#20917
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DealDepartment'
            Title.Caption = #35843#26597#37096#38376
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DealMan'
            Title.Caption = #35843#26597#20154#21592
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DealManTel'
            Title.Caption = #35843#26597#20154#21592#30005#35805
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DealTime'
            Title.Caption = #35843#26597#26102#38388
            Width = 149
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Check_Result'
            Title.Caption = #22788#29702#32467#26524
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Check_man'
            Title.Caption = #22788#29702#20154#21592
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Check_Idea'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'driver_name'
            Title.Caption = #21496#26426#22995#21517
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'driver_id'
            Visible = False
          end>
      end
    end
  end
  object Panel2: TPanel
    Left = 436
    Top = 0
    Width = 399
    Height = 744
    Align = alRight
    TabOrder = 1
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 397
      Height = 40
      Align = alTop
      TabOrder = 0
      object ToolBar1: TToolBar
        Left = 1
        Top = 1
        Width = 395
        Height = 38
        Align = alClient
        ButtonHeight = 36
        ButtonWidth = 43
        Caption = 'ToolBar1'
        Images = ImageList1
        ShowCaptions = True
        TabOrder = 0
        object btnNew: TToolButton
          Left = 0
          Top = 2
          Caption = '  '#26032#24314'  '
          ImageIndex = 1
          OnClick = btnNewClick
        end
        object btnEdit: TToolButton
          Left = 43
          Top = 2
          Caption = '  '#32534#36753'  '
          Enabled = False
          ImageIndex = 2
          OnClick = btnEditClick
        end
        object btnDelete: TToolButton
          Left = 86
          Top = 2
          Caption = #21024#38500
          Enabled = False
          ImageIndex = 6
          OnClick = btnDeleteClick
        end
        object btnCancel: TToolButton
          Left = 129
          Top = 2
          Caption = '  '#21462#28040'  '
          ImageIndex = 3
          OnClick = btnCancelClick
        end
        object btnSave: TToolButton
          Left = 172
          Top = 2
          Caption = '  '#20445#23384'  '
          ImageIndex = 4
          OnClick = btnSaveClick
        end
        object btnRefresh: TToolButton
          Left = 215
          Top = 2
          Caption = '  '#21047#26032'  '
          ImageIndex = 5
          OnClick = btnRefreshClick
        end
        object btnClose: TToolButton
          Left = 258
          Top = 2
          Caption = #36864#20986
          ImageIndex = 7
          OnClick = btnCloseClick
        end
        object btnSubmit: TToolButton
          Left = 301
          Top = 2
          Caption = #25552#20132
          DropdownMenu = PopupMenu2
          Enabled = False
          ImageIndex = 0
          Style = tbsDropDown
          OnClick = btnSubmitClick
        end
      end
    end
    object Panel6: TPanel
      Left = 1
      Top = 41
      Width = 397
      Height = 702
      Align = alClient
      TabOrder = 1
      object PanelNew: TPanel
        Left = 1
        Top = 1
        Width = 395
        Height = 344
        Align = alTop
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 0
        object Label2: TLabel
          Left = 58
          Top = 25
          Width = 36
          Height = 13
          Caption = #31867#22411#65306
        end
        object Label4: TLabel
          Left = 16
          Top = 53
          Width = 72
          Height = 13
          Caption = #25237#35785#36710#29260#21495#65306
        end
        object Label6: TLabel
          Left = 29
          Top = 80
          Width = 60
          Height = 13
          Caption = #21457#29983#26102#38388#65306
        end
        object Label7: TLabel
          Left = 29
          Top = 104
          Width = 60
          Height = 13
          Caption = #21457#29983#22320#28857#65306
        end
        object Label8: TLabel
          Left = 29
          Top = 166
          Width = 60
          Height = 13
          Caption = #25237#35785#20107#30001#65306
        end
        object Label9: TLabel
          Left = 29
          Top = 236
          Width = 60
          Height = 13
          Caption = #20056#23458#22995#21517#65306
        end
        object Label10: TLabel
          Left = 29
          Top = 262
          Width = 60
          Height = 13
          Caption = #20056#23458#30005#35805#65306
        end
        object Label11: TLabel
          Left = 57
          Top = 285
          Width = 36
          Height = 13
          Caption = #22791#27880#65306
        end
        object Label26: TLabel
          Left = 278
          Top = 53
          Width = 36
          Height = 13
          Caption = #29366#24577#65306
        end
        object Label28: TLabel
          Left = 183
          Top = 25
          Width = 6
          Height = 13
          Caption = '*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label29: TLabel
          Left = 256
          Top = 80
          Width = 6
          Height = 13
          Caption = '*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label30: TLabel
          Left = 257
          Top = 53
          Width = 6
          Height = 13
          Caption = '*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label42: TLabel
          Left = 266
          Top = 80
          Width = 48
          Height = 13
          Caption = #33829#36816#21495#65306
        end
        object lblDriverName: TLabel
          Left = 251
          Top = 25
          Width = 60
          Height = 13
          Caption = #21496#26426#22995#21517#65306
        end
        object ComboBoxType: TComboBox
          Left = 93
          Top = 21
          Width = 89
          Height = 21
          ItemHeight = 13
          ItemIndex = 1
          TabOrder = 0
          Text = #30005#35805#25237#35785
          Items.Strings = (
            #35780#20215#22120#25237#35785
            #30005#35805#25237#35785
            #20056#23458#25237#35785
            #21496#26426#25237#35785)
        end
        object EditAccuse_Carno_old: TEdit
          Left = -1
          Top = 73
          Width = 28
          Height = 21
          DragCursor = crIBeam
          MaxLength = 20
          TabOrder = 1
          Visible = False
        end
        object Datecase_HappenDate: TDateTimePicker
          Left = 93
          Top = 76
          Width = 84
          Height = 21
          Date = 40123.500831516200000000
          Time = 40123.500831516200000000
          TabOrder = 2
        end
        object Datecase_HappenTime: TDateTimePicker
          Left = 181
          Top = 76
          Width = 73
          Height = 21
          Date = 40123.502228541660000000
          Time = 40123.502228541660000000
          Kind = dtkTime
          TabOrder = 3
        end
        object Memocase_HappenAddr: TMemo
          Left = 93
          Top = 104
          Width = 249
          Height = 58
          MaxLength = 100
          ScrollBars = ssVertical
          TabOrder = 4
        end
        object MemoAccuse_Reason: TMemo
          Left = 93
          Top = 166
          Width = 249
          Height = 62
          MaxLength = 100
          ScrollBars = ssVertical
          TabOrder = 5
        end
        object EditpassengerName: TEdit
          Left = 93
          Top = 232
          Width = 121
          Height = 21
          MaxLength = 20
          TabOrder = 6
        end
        object EditPassengerTelNum: TEdit
          Left = 93
          Top = 258
          Width = 121
          Height = 21
          MaxLength = 20
          TabOrder = 7
          OnKeyPress = EditPassengerTelNumKeyPress
        end
        object MemoPassengerMemo: TMemo
          Left = 93
          Top = 285
          Width = 249
          Height = 49
          Lines.Strings = (
            '')
          MaxLength = 50
          ScrollBars = ssVertical
          TabOrder = 8
        end
        object EditState: TEdit
          Left = 316
          Top = 49
          Width = 67
          Height = 21
          Enabled = False
          TabOrder = 9
        end
        object editRunDataID: TEdit
          Left = 316
          Top = 76
          Width = 67
          Height = 21
          TabOrder = 10
          OnKeyPress = editRunDataIDKeyPress
        end
        object edtDriverName: TEdit
          Left = 316
          Top = 21
          Width = 67
          Height = 21
          TabOrder = 11
        end
        object EditAccuse_Carno: TComboBox
          Left = 93
          Top = 49
          Width = 161
          Height = 21
          ItemHeight = 13
          TabOrder = 12
          OnChange = EditAccuse_CarnoChange
          OnKeyPress = EditAccuse_CarnoKeyPress
          OnKeyUp = EditAccuse_CarnoKeyUp
          OnSelect = EditAccuse_CarnoSelect
        end
      end
      object PanelDeal: TPanel
        Left = 1
        Top = 345
        Width = 395
        Height = 248
        Align = alClient
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 1
        object Label14: TLabel
          Left = 29
          Top = 17
          Width = 60
          Height = 13
          Caption = #35843#26597#20154#21592#65306
        end
        object Label15: TLabel
          Left = 1
          Top = 43
          Width = 84
          Height = 13
          Caption = #35843#26597#20154#21592#30005#35805#65306
        end
        object Label16: TLabel
          Left = 1
          Top = 69
          Width = 84
          Height = 13
          Caption = #35843#26597#20154#21592#37096#38376#65306
        end
        object Label17: TLabel
          Left = 29
          Top = 95
          Width = 60
          Height = 13
          Caption = #35843#26597#26102#38388#65306
        end
        object Label18: TLabel
          Left = 29
          Top = 118
          Width = 60
          Height = 13
          Caption = #35843#26597#24773#20917#65306
        end
        object Label21: TLabel
          Left = 13
          Top = -8
          Width = 132
          Height = 13
          Caption = '______________________'
        end
        object Label27: TLabel
          Left = 14
          Top = 184
          Width = 75
          Height = 13
          Caption = #22788#29702#20154#24847#35265#65306' '
        end
        object Label35: TLabel
          Left = 217
          Top = 16
          Width = 6
          Height = 13
          Caption = '*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label36: TLabel
          Left = 217
          Top = 42
          Width = 6
          Height = 13
          Caption = '*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label37: TLabel
          Left = 217
          Top = 69
          Width = 6
          Height = 13
          Caption = '*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label38: TLabel
          Left = 268
          Top = 92
          Width = 6
          Height = 13
          Caption = '*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label39: TLabel
          Left = 344
          Top = 116
          Width = 6
          Height = 13
          Caption = '*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object EditDealMan: TEdit
          Left = 93
          Top = 13
          Width = 121
          Height = 21
          Cursor = crIBeam
          MaxLength = 50
          TabOrder = 0
        end
        object MemoDealContent: TMemo
          Left = 93
          Top = 118
          Width = 249
          Height = 62
          MaxLength = 100
          ScrollBars = ssVertical
          TabOrder = 5
        end
        object EditDealManTel: TEdit
          Left = 93
          Top = 39
          Width = 121
          Height = 21
          MaxLength = 50
          TabOrder = 1
          OnKeyPress = EditPassengerTelNumKeyPress
        end
        object EditDealDepartment: TEdit
          Left = 93
          Top = 65
          Width = 121
          Height = 21
          MaxLength = 50
          TabOrder = 2
        end
        object DateDealDate: TDateTimePicker
          Left = 93
          Top = 91
          Width = 89
          Height = 21
          Date = 40123.577385335650000000
          Time = 40123.577385335650000000
          TabOrder = 3
        end
        object DateDealTime: TDateTimePicker
          Left = 183
          Top = 91
          Width = 81
          Height = 21
          Date = 40123.577507766200000000
          Time = 40123.577507766200000000
          Kind = dtkTime
          TabOrder = 4
        end
        object MemoDealIdea: TMemo
          Left = 93
          Top = 184
          Width = 249
          Height = 57
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 6
        end
      end
      object PanelCheck: TPanel
        Left = 1
        Top = 593
        Width = 395
        Height = 108
        Align = alBottom
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 2
        object Label19: TLabel
          Left = 29
          Top = 9
          Width = 60
          Height = 13
          Caption = #22788#29702#32467#26524#65306
        end
        object Label20: TLabel
          Left = 29
          Top = 77
          Width = 60
          Height = 13
          Caption = #22788#29702#20154#21592#65306
        end
        object Label22: TLabel
          Left = 13
          Top = -11
          Width = 132
          Height = 13
          Caption = '______________________'
        end
        object Label40: TLabel
          Left = 345
          Top = 10
          Width = 6
          Height = 13
          Caption = '*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label41: TLabel
          Left = 217
          Top = 76
          Width = 6
          Height = 13
          Caption = '*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object MemoCheck_Result: TMemo
          Left = 93
          Top = 7
          Width = 249
          Height = 62
          Cursor = crIBeam
          MaxLength = 50
          ScrollBars = ssVertical
          TabOrder = 0
        end
        object EditCheck_man: TEdit
          Left = 93
          Top = 73
          Width = 121
          Height = 21
          MaxLength = 50
          TabOrder = 1
        end
        object chkIntegral: TCheckBox
          Left = 269
          Top = 75
          Width = 78
          Height = 17
          Caption = #25187#38500#31215#20998
          TabOrder = 2
        end
      end
    end
  end
  object cxSplitter2: TcxSplitter
    Left = 428
    Top = 0
    Width = 8
    Height = 744
    Cursor = crHSplit
    HotZoneClassName = 'TcxSimpleStyle'
    HotZone.SizePercent = 31
    AlignSplitter = salRight
    AutoSnap = True
    MinSize = 22
    ResizeUpdate = True
    Control = Panel2
  end
  object PopupMenu1: TPopupMenu
    Left = 201
    Top = 184
    object N1: TMenuItem
      Caption = #26032#24314
      ShortCut = 16449
      OnClick = btnNewClick
    end
    object N2: TMenuItem
      Caption = #32534#36753
      ShortCut = 16453
      OnClick = btnEditClick
    end
    object N7: TMenuItem
      Caption = #21024#38500
      ShortCut = 16452
      OnClick = btnDeleteClick
    end
    object N3: TMenuItem
      Caption = #21462#28040
      ShortCut = 16451
      OnClick = btnCancelClick
    end
    object N4: TMenuItem
      Caption = #20445#23384
      ShortCut = 16467
      OnClick = btnSaveClick
    end
    object N5: TMenuItem
      Caption = #21047#26032
      ShortCut = 16466
      OnClick = btnRefreshClick
    end
  end
  object DataSource1: TDataSource
    Left = 81
    Top = 145
  end
  object PopupMenu2: TPopupMenu
    Left = 758
    Top = 58
    object N6: TMenuItem
      Caption = #25552#20132
      OnClick = N6Click
    end
    object N8: TMenuItem
      Caption = #36864#22238
      OnClick = N8Click
    end
  end
  object ImageList1: TImageList
    Left = 579
    Top = 202
    Bitmap = {
      494C010108000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BFBFBF00BFBFBF007F7F7F007F7F7F007F7F7F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000000000000000000000000000000000000000FF000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF007F7F7F000000000000000000000000007F7F7F007F7F7F007F7F
      7F00000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000000000000000000000000000000000000000FF000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000000000007F7F
      7F007F7F7F000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BFBFBF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F0000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      00000000000000000000000000000000000000000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BFBFBF007F7F7F000000
      0000000000000000000000008000000080000000800000000000000000000000
      00007F7F7F007F7F7F000000000000000000000000007F7F7F000000FF000000
      FF0000000000000000000000FF000000FF000000FF0000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF0000000000000000000000000000000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BFBFBF00000000000000
      0000000000000000800000008000000080000000800000008000000000000000
      0000000000007F7F7F0000000000000000007F7F7F000000FF00000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF0000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000800000008000000080000000800000008000000000000000
      0000000000007F7F7F0000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000000000000000FF00000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      000000000000BFBFBF0000008000000080000000800000008000000000000000
      000000000000BFBFBF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      00000000FF000000FF00000000000000000000000000FF000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      00000000FF000000FF00000000000000000000000000FFFFFF007F7F7F000000
      00000000000000000000BFBFBF00BFBFBF000000800000000000000000000000
      00007F7F7F00BFBFBF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      00000000FF000000FF00000000000000000000000000FF000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      00000000FF000000FF0000000000000000000000000000000000BFBFBF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BFBFBF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F000000
      FF0000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF0000000000000000000000000000000000FF000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00BFBF
      BF0000000000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F000000FF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF0000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00BFBFBF007F7F7F000000000000000000000000007F7F7F00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00BFBFBF00BFBFBF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000808000000000000000000000000000FFFF0000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF0000FFFF0000000000000000000000
      000000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000FFFF000000000000FFFF00FFFFFF000000
      0000FFFFFF00000000000000000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFFFF000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000800000008000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFF
      FF0000FFFF00000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000000000000000000000FF
      FF0000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000080000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFFFF0000FF
      FF0000000000000000000000000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      800000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      000000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000
      000000808000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      0000008080000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      00000080800000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00000000000000000000FFFF0000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000000000FF
      FF00000000000080800000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF00000000000000FFFF00FFFFFF0000FFFF000000000000FFFF000000
      0000008080000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000000
      000000FFFF000000000000808000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      0000FFFF0000FFFF00000000000000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF000000000000FFFF0000808000008080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF0000FFFF0000FFFF0000000000000000000000000000000000000000
      0000008080000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000000000FFFFFF00FFFFFF000000000000000000FFFF
      FF0000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00008080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF0000000000000000000000000000000000000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000FFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008080000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF00424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFC8FFF8F83F
      F9FFFFB8FFF8E00FF0FFCFBF81FFC007F0FFCFBC81FC8003E07FFFBCFFFC8003
      C07FDFBFFFFF0001843FCF7CFFFC00011E3FE6FCF7FC0001FE1FF37FE7FF0001
      FF1F33BC80130001FF8F33BC80138003FFC787BFE7FF8003FFE3FFB8F7F8C007
      FFF8FFC8FFF8E00FFFFFFFFFFFFFF83FFFFFFFFFFC00847FFFFF8017FC0000EF
      FFFFFFF7200031BFFFFFFE63000039FFFCFFFC030000993FFC3FF8030000CA1F
      FC0FF0030000F40F0003F00300009C070000E003000096030003C0030000CB01
      FC0F8003E000FF80FC3F0003F800F7C0FCFF0003F000FFE0FFFF01E3E001EFF0
      FFFF83E3C403FFF8FFFFC7E3EC07FFFC00000000000000000000000000000000
      000000000000}
  end
  object TimerClose: TTimer
    Enabled = False
    Interval = 1
    OnTimer = TimerCloseTimer
    Left = 149
    Top = 257
  end
  object TimerShow: TTimer
    Enabled = False
    Interval = 1
    OnTimer = TimerShowTimer
    Left = 157
    Top = 297
  end
end
