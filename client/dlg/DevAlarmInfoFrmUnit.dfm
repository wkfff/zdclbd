object DevAlarmInfoFrm: TDevAlarmInfoFrm
  Left = 22
  Top = 216
  Width = 1259
  Height = 500
  Caption = #25253#35686#22788#29702#21488#24080
  Color = clBtnFace
  DragKind = dkDock
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 283
    Width = 1251
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object Panel2: TPanel
    Left = 0
    Top = 286
    Width = 1251
    Height = 187
    Align = alClient
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 1249
      Height = 185
      Align = alClient
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = PopupMenu1
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
          FieldName = 'NO'
          Title.Caption = #32534#21495
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CARNO'
          Title.Caption = #36710#29260#21495
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BEGINDATETIME'
          Title.Caption = #25253#35686#24320#22987#26102#38388
          Width = 119
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ENDDATETIME'
          Title.Caption = #25253#35686#32467#26463#26102#38388
          Width = 119
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ADDRESS'
          Title.Caption = #25253#35686#21457#29983#22320
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PERSON'
          Title.Caption = #25253#35686#20154
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TEL'
          Title.Caption = #25253#35686#20154#30005#35805
          Width = 70
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
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DEALTIME'
          Title.Caption = #30331#35760#26102#38388
          Width = 119
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'Histroy'
          Title.Caption = #22788#29702#36807#31243
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PhotoIDs'
          Title.Caption = #29031#29255'IDs'
          Visible = False
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 1251
    Height = 283
    Align = alTop
    TabOrder = 1
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 994
      Height = 281
      Align = alClient
      TabOrder = 0
      object ToolBar1: TToolBar
        Left = 1
        Top = 256
        Width = 992
        Height = 24
        Align = alBottom
        ButtonHeight = 21
        ButtonWidth = 43
        Caption = 'ToolBar1'
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
        end
        object btnDelete: TToolButton
          Left = 86
          Top = 2
          Caption = #21024#38500
          Enabled = False
          ImageIndex = 6
          Visible = False
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
        object btnQuery: TToolButton
          Left = 215
          Top = 2
          Caption = #21047#26032
          ImageIndex = 1
          OnClick = btnQueryClick
        end
        object btnClose: TToolButton
          Left = 258
          Top = 2
          Caption = #36864#20986
          ImageIndex = 7
          OnClick = btnCloseClick
        end
      end
      object Panel5: TPanel
        Left = 1
        Top = 1
        Width = 479
        Height = 255
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        object Label1: TLabel
          Left = 23
          Top = 12
          Width = 60
          Height = 13
          Caption = #25253#35686#36710#36742#65306
        end
        object Label2: TLabel
          Left = 23
          Top = 43
          Width = 60
          Height = 13
          Caption = #25253#35686#26102#38388#65306
        end
        object Label3: TLabel
          Left = 23
          Top = 143
          Width = 60
          Height = 13
          Caption = #22788#29702#32467#26524#65306
        end
        object Label4: TLabel
          Left = 35
          Top = 232
          Width = 48
          Height = 13
          Caption = #30331#35760#20154#65306
        end
        object Label5: TLabel
          Left = 238
          Top = 232
          Width = 60
          Height = 13
          Caption = #30331#35760#26102#38388#65306
        end
        object Label6: TLabel
          Left = 255
          Top = 43
          Width = 6
          Height = 13
          Caption = '--'
        end
        object Label7: TLabel
          Left = 35
          Top = 74
          Width = 48
          Height = 13
          Caption = #25253#35686#20154#65306
        end
        object Label8: TLabel
          Left = 266
          Top = 74
          Width = 72
          Height = 13
          Caption = #25253#35686#20154#30005#35805#65306
        end
        object Label9: TLabel
          Left = 11
          Top = 100
          Width = 72
          Height = 13
          Caption = #25253#35686#21457#29983#22320#65306
        end
        object Label13: TLabel
          Left = 23
          Top = 187
          Width = 60
          Height = 13
          Caption = #22788#29702#36807#31243#65306
        end
        object DateTimePicker1: TDateTimePicker
          Left = 86
          Top = 39
          Width = 89
          Height = 21
          Date = 40483.400328587970000000
          Time = 40483.400328587970000000
          TabOrder = 0
        end
        object DateTimePicker2: TDateTimePicker
          Left = 176
          Top = 39
          Width = 73
          Height = 21
          Date = 40483.400387361110000000
          Time = 40483.400387361110000000
          Kind = dtkTime
          TabOrder = 1
        end
        object Memo1: TMemo
          Left = 86
          Top = 143
          Width = 383
          Height = 33
          ScrollBars = ssVertical
          TabOrder = 2
        end
        object Edit1: TEdit
          Left = 86
          Top = 228
          Width = 121
          Height = 21
          Enabled = False
          ReadOnly = True
          TabOrder = 3
        end
        object DateTimePicker3: TDateTimePicker
          Left = 307
          Top = 228
          Width = 89
          Height = 21
          Date = 40483.401327754630000000
          Time = 40483.401327754630000000
          Enabled = False
          TabOrder = 4
        end
        object DateTimePicker4: TDateTimePicker
          Left = 397
          Top = 228
          Width = 73
          Height = 21
          Date = 40483.401360856480000000
          Time = 40483.401360856480000000
          Enabled = False
          Kind = dtkTime
          TabOrder = 5
        end
        object ComboBox1: TComboBox
          Left = 86
          Top = 8
          Width = 145
          Height = 21
          ItemHeight = 13
          TabOrder = 6
          OnChange = ComboBox1Change
          OnKeyPress = ComboBox1KeyPress
          OnKeyUp = ComboBox1KeyUp
          OnSelect = ComboBox1Select
        end
        object DateTimePicker5: TDateTimePicker
          Left = 266
          Top = 39
          Width = 89
          Height = 21
          Date = 40483.400328587970000000
          Time = 40483.400328587970000000
          TabOrder = 7
        end
        object DateTimePicker6: TDateTimePicker
          Left = 356
          Top = 39
          Width = 73
          Height = 21
          Date = 40483.400387361110000000
          Time = 40483.400387361110000000
          Kind = dtkTime
          TabOrder = 8
        end
        object Edit2: TEdit
          Left = 86
          Top = 70
          Width = 121
          Height = 21
          TabOrder = 9
        end
        object Edit3: TEdit
          Left = 347
          Top = 70
          Width = 121
          Height = 21
          TabOrder = 10
        end
        object Memo2: TMemo
          Left = 86
          Top = 100
          Width = 383
          Height = 33
          ScrollBars = ssVertical
          TabOrder = 11
        end
        object editID: TEdit
          Left = 239
          Top = 8
          Width = 58
          Height = 21
          TabOrder = 12
          Text = 'editID'
          Visible = False
        end
        object editNO: TEdit
          Left = 303
          Top = 8
          Width = 50
          Height = 21
          TabOrder = 13
          Text = 'editNO'
          Visible = False
        end
        object Memo3: TMemo
          Left = 86
          Top = 187
          Width = 383
          Height = 33
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 14
        end
      end
      object Panel6: TPanel
        Left = 480
        Top = 1
        Width = 513
        Height = 255
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
        object GroupBox1: TGroupBox
          Left = 0
          Top = 0
          Width = 513
          Height = 255
          Align = alClient
          Caption = #29031#29255
          TabOrder = 0
          object Splitter2: TSplitter
            Left = 169
            Top = 15
            Height = 238
          end
          object Splitter3: TSplitter
            Left = 349
            Top = 15
            Height = 238
            Align = alRight
          end
          object Panel7: TPanel
            Left = 2
            Top = 15
            Width = 167
            Height = 238
            Align = alLeft
            Caption = #26080#29031#29255
            TabOrder = 0
            object Image1: TImage
              Left = 1
              Top = 1
              Width = 165
              Height = 236
              Align = alClient
            end
          end
          object Panel8: TPanel
            Left = 172
            Top = 15
            Width = 177
            Height = 238
            Align = alClient
            Caption = #26080#29031#29255
            TabOrder = 1
            object Image2: TImage
              Left = 1
              Top = 1
              Width = 175
              Height = 236
              Align = alClient
            end
          end
          object Panel9: TPanel
            Left = 352
            Top = 15
            Width = 159
            Height = 238
            Align = alRight
            Caption = #26080#29031#29255
            TabOrder = 2
            object Image3: TImage
              Left = 1
              Top = 1
              Width = 157
              Height = 236
              Align = alClient
            end
          end
        end
      end
    end
    object SplitterRight: TcxSplitter
      Left = 995
      Top = 1
      Width = 8
      Height = 281
      HotZoneClassName = 'TcxMediaPlayer9Style'
      HotZone.SizePercent = 35
      AlignSplitter = salRight
      Control = Panel4
    end
    object Panel4: TPanel
      Left = 1003
      Top = 1
      Width = 247
      Height = 281
      Align = alRight
      TabOrder = 2
      object SpeedButton1: TSpeedButton
        Left = 1
        Top = 3
        Width = 19
        Height = 18
        Caption = #12298
        Visible = False
      end
      object Label10: TLabel
        Left = 24
        Top = 78
        Width = 48
        Height = 13
        Caption = #36710#29260#21495#65306
      end
      object Label11: TLabel
        Left = 10
        Top = 126
        Width = 60
        Height = 13
        Caption = #25253#35686#26102#38388#65306
      end
      object Label12: TLabel
        Left = 56
        Top = 155
        Width = 12
        Height = 13
        Caption = '__'
      end
      object editQueryCarNo: TEdit
        Left = 80
        Top = 74
        Width = 121
        Height = 21
        TabOrder = 0
      end
      object datQueryBeginDate: TDateTimePicker
        Left = 80
        Top = 122
        Width = 89
        Height = 21
        Date = 40483.400328587970000000
        Time = 40483.400328587970000000
        TabOrder = 1
      end
      object datQueryBeginTime: TDateTimePicker
        Left = 168
        Top = 122
        Width = 73
        Height = 21
        Date = 40483.400387361110000000
        Time = 40483.400387361110000000
        Kind = dtkTime
        TabOrder = 2
      end
      object datQueryEndDate: TDateTimePicker
        Left = 80
        Top = 156
        Width = 89
        Height = 21
        Date = 40483.400328587970000000
        Time = 40483.400328587970000000
        TabOrder = 3
      end
      object datQueryEndTime: TDateTimePicker
        Left = 168
        Top = 155
        Width = 73
        Height = 21
        Date = 40483.400387361110000000
        Time = 40483.400387361110000000
        Kind = dtkTime
        TabOrder = 4
      end
      object btnOK: TBitBtn
        Left = 2
        Top = 253
        Width = 75
        Height = 25
        Caption = #26597#35810
        TabOrder = 5
        OnClick = btnOKClick
      end
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
  object PopupMenu1: TPopupMenu
    Left = 328
    Top = 366
    object N1: TMenuItem
      Caption = #25552#21462#29031#29255
      OnClick = N1Click
    end
  end
end
