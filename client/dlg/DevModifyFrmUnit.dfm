object DevModifyFrm: TDevModifyFrm
  Left = 204
  Top = 216
  Width = 1008
  Height = 500
  Caption = #35774#22791#32500#20462#21488#24080
  Color = clBtnFace
  DragKind = dkDock
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 257
    Width = 1000
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object Panel2: TPanel
    Left = 0
    Top = 260
    Width = 1000
    Height = 213
    Align = alClient
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 998
      Height = 211
      Align = alClient
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnCellClick = DBGrid1CellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'NO'
          Title.Caption = #32534#21495
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CARNO'
          Title.Caption = #36710#29260#21495
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MAINTAINTIME'
          Title.Caption = #32500#20462#26102#38388
          Width = 119
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REASON'
          Title.Caption = #25925#38556#21407#22240
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RESULT'
          Title.Caption = #22788#29702#32467#26524
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'USERNAME'
          Title.Caption = #30331#35760#20154
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DEALTIME'
          Title.Caption = #30331#35760#26102#38388
          Width = 119
          Visible = True
        end>
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 1000
    Height = 257
    Align = alTop
    TabOrder = 1
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 743
      Height = 255
      Align = alClient
      TabOrder = 0
      object Label1: TLabel
        Left = 48
        Top = 28
        Width = 65
        Height = 13
        Caption = #32500#20462#36710#36742#65306
      end
      object Label2: TLabel
        Left = 328
        Top = 58
        Width = 65
        Height = 13
        Caption = #32500#20462#26102#38388#65306
      end
      object Label3: TLabel
        Left = 48
        Top = 145
        Width = 65
        Height = 13
        Caption = #22788#29702#32467#26524#65306
      end
      object Label4: TLabel
        Left = 60
        Top = 200
        Width = 52
        Height = 13
        Caption = #30331#35760#20154#65306
      end
      object Label5: TLabel
        Left = 330
        Top = 200
        Width = 65
        Height = 13
        Caption = #30331#35760#26102#38388#65306
      end
      object Label6: TLabel
        Left = 48
        Top = 84
        Width = 65
        Height = 13
        Caption = #25925#38556#21407#22240#65306
      end
      object Label7: TLabel
        Left = 48
        Top = 58
        Width = 65
        Height = 13
        Caption = #25925#38556#31867#22411#65306
      end
      object Label8: TLabel
        Left = 286
        Top = 28
        Width = 104
        Height = 13
        Caption = #21496#26426#22995#21517#21450#30005#35805#65306
      end
      object DateTimePicker1: TDateTimePicker
        Left = 397
        Top = 54
        Width = 89
        Height = 21
        Date = 40483.400328587970000000
        Time = 40483.400328587970000000
        TabOrder = 0
      end
      object DateTimePicker2: TDateTimePicker
        Left = 487
        Top = 54
        Width = 73
        Height = 21
        Date = 40483.400387361110000000
        Time = 40483.400387361110000000
        Kind = dtkTime
        TabOrder = 1
      end
      object Memo1: TMemo
        Left = 111
        Top = 139
        Width = 449
        Height = 49
        ScrollBars = ssVertical
        TabOrder = 2
      end
      object Edit1: TEdit
        Left = 112
        Top = 196
        Width = 121
        Height = 21
        Enabled = False
        ReadOnly = True
        TabOrder = 3
      end
      object DateTimePicker3: TDateTimePicker
        Left = 399
        Top = 196
        Width = 89
        Height = 21
        Date = 40483.401327754630000000
        Time = 40483.401327754630000000
        Enabled = False
        TabOrder = 4
      end
      object DateTimePicker4: TDateTimePicker
        Left = 487
        Top = 196
        Width = 73
        Height = 21
        Date = 40483.401360856480000000
        Time = 40483.401360856480000000
        Enabled = False
        Kind = dtkTime
        TabOrder = 5
      end
      object ToolBar1: TToolBar
        Left = 1
        Top = 230
        Width = 741
        Height = 24
        Align = alBottom
        ButtonHeight = 21
        ButtonWidth = 61
        Caption = 'ToolBar1'
        ShowCaptions = True
        TabOrder = 6
        object btnNew: TToolButton
          Left = 0
          Top = 2
          Caption = '  '#26032#24314'  '
          ImageIndex = 1
          OnClick = btnNewClick
        end
        object btnEdit: TToolButton
          Left = 61
          Top = 2
          Caption = '  '#32534#36753'  '
          Enabled = False
          ImageIndex = 2
        end
        object btnDelete: TToolButton
          Left = 122
          Top = 2
          Caption = #21024#38500
          Enabled = False
          ImageIndex = 6
          OnClick = btnDeleteClick
        end
        object btnCancel: TToolButton
          Left = 183
          Top = 2
          Caption = '  '#21462#28040'  '
          ImageIndex = 3
          OnClick = btnCancelClick
        end
        object btnSave: TToolButton
          Left = 244
          Top = 2
          Caption = '  '#20445#23384'  '
          ImageIndex = 4
          OnClick = btnSaveClick
        end
        object btnQuery: TToolButton
          Left = 305
          Top = 2
          Caption = #21047#26032
          ImageIndex = 8
          OnClick = btnQueryClick
        end
        object btnClose: TToolButton
          Left = 366
          Top = 2
          Caption = #36864#20986
          ImageIndex = 7
          OnClick = btnCloseClick
        end
      end
      object Memo2: TMemo
        Left = 111
        Top = 84
        Width = 449
        Height = 49
        ScrollBars = ssVertical
        TabOrder = 7
      end
      object ComboBox1: TComboBox
        Left = 112
        Top = 24
        Width = 145
        Height = 21
        ItemHeight = 13
        TabOrder = 8
        OnChange = ComboBox1Change
        OnKeyPress = ComboBox1KeyPress
        OnKeyUp = ComboBox1KeyUp
        OnSelect = ComboBox1Select
      end
      object editID: TEdit
        Left = -8
        Top = 40
        Width = 49
        Height = 21
        TabOrder = 9
        Visible = False
      end
      object editNO: TEdit
        Left = -8
        Top = 72
        Width = 49
        Height = 21
        TabOrder = 10
        Visible = False
      end
      object cbxType: TComboBox
        Left = 112
        Top = 54
        Width = 145
        Height = 21
        ItemHeight = 13
        TabOrder = 11
      end
      object Edit2: TEdit
        Left = 398
        Top = 24
        Width = 162
        Height = 21
        TabOrder = 12
      end
    end
    object Panel3: TPanel
      Left = 752
      Top = 1
      Width = 247
      Height = 255
      Align = alRight
      TabOrder = 1
      object SpeedButton1: TSpeedButton
        Left = 1
        Top = 3
        Width = 19
        Height = 18
        Caption = #12298
        Visible = False
        OnClick = SpeedButton1Click
      end
      object Label9: TLabel
        Left = 24
        Top = 60
        Width = 52
        Height = 13
        Caption = #36710#29260#21495#65306
      end
      object Label10: TLabel
        Left = 10
        Top = 108
        Width = 65
        Height = 13
        Caption = #32500#20462#26102#38388#65306
      end
      object Label11: TLabel
        Left = 56
        Top = 137
        Width = 14
        Height = 13
        Caption = '__'
      end
      object editQueryCarNo: TEdit
        Left = 80
        Top = 56
        Width = 121
        Height = 21
        TabOrder = 0
      end
      object datQueryBeginDate: TDateTimePicker
        Left = 80
        Top = 104
        Width = 89
        Height = 21
        Date = 40483.400328587970000000
        Time = 40483.400328587970000000
        TabOrder = 1
      end
      object datQueryBeginTime: TDateTimePicker
        Left = 168
        Top = 104
        Width = 73
        Height = 21
        Date = 40483.400387361110000000
        Time = 40483.400387361110000000
        Kind = dtkTime
        TabOrder = 2
      end
      object datQueryEndDate: TDateTimePicker
        Left = 80
        Top = 138
        Width = 89
        Height = 21
        Date = 40483.400328587970000000
        Time = 40483.400328587970000000
        TabOrder = 3
      end
      object datQueryEndTime: TDateTimePicker
        Left = 168
        Top = 137
        Width = 73
        Height = 21
        Date = 40483.400387361110000000
        Time = 40483.400387361110000000
        Kind = dtkTime
        TabOrder = 4
      end
      object btnOK: TBitBtn
        Left = 2
        Top = 229
        Width = 75
        Height = 25
        Caption = #26597#35810
        TabOrder = 5
        OnClick = btnOKClick
      end
    end
    object SplitterRight: TcxSplitter
      Left = 744
      Top = 1
      Width = 8
      Height = 255
      HotZoneClassName = 'TcxMediaPlayer9Style'
      HotZone.SizePercent = 35
      AlignSplitter = salRight
      Control = Panel3
    end
  end
  object aqStore: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 342
  end
  object DataSource1: TDataSource
    Left = 128
    Top = 334
  end
end
