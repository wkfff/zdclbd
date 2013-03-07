object FrmDevMonthSpeedTj: TFrmDevMonthSpeedTj
  Left = 252
  Top = 169
  Width = 870
  Height = 640
  Caption = #36710#36742#36895#24230#26354#32447
  Color = clBtnFace
  DragKind = dkDock
  DragMode = dmAutomatic
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 862
    Height = 72
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvSpace
    TabOrder = 0
    object Label11: TLabel
      Left = 311
      Top = 31
      Width = 219
      Height = 13
      Caption = #26597#35810#26102#27573#65306'                     -'
    end
    object Label5: TLabel
      Left = 323
      Top = 9
      Width = 52
      Height = 13
      Caption = #36710#29260#21495#65306
    end
    object Label1: TLabel
      Left = 512
      Top = 9
      Width = 65
      Height = 13
      Caption = #20849#26377#28857#25968#65306
    end
    object Label2: TLabel
      Left = 298
      Top = 53
      Width = 78
      Height = 13
      Caption = #25968#25454#24211#25991#20214#65306
    end
    object BitBtnDrawLineFromDbFile: TBitBtn
      Left = 223
      Top = 27
      Width = 119
      Height = 25
      Caption = #30011#26354#32447#22270
      TabOrder = 0
      Visible = False
      OnClick = BitBtnDrawLineFromDbFileClick
    end
    object BitBtnTjDay: TBitBtn
      Left = 223
      Top = 36
      Width = 119
      Height = 25
      Caption = #27599#26085#36229#36895#27425#25968#32479#35745
      TabOrder = 1
      Visible = False
      OnClick = BitBtnTjDayClick
    end
    object EditFromTime: TEdit
      Left = 373
      Top = 26
      Width = 146
      Height = 21
      TabOrder = 2
      Text = 'EditFromTime'
    end
    object EditToTime: TEdit
      Left = 538
      Top = 26
      Width = 146
      Height = 21
      TabOrder = 3
      Text = 'EditToTime'
    end
    object EditPointCnt: TEdit
      Left = 575
      Top = 4
      Width = 108
      Height = 21
      TabOrder = 4
      Text = 'EditPointCnt'
    end
    object BitBtnOpenDbFile: TBitBtn
      Left = 147
      Top = 19
      Width = 119
      Height = 25
      Hint = #25171#24320#26412#22320#24050#26377#25968#25454#25991#20214
      Caption = #25171#24320#26412#22320#25968#25454#25991#20214
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = BitBtnOpenDbFileClick
    end
    object EditDbFileName: TEdit
      Left = 373
      Top = 48
      Width = 457
      Height = 21
      TabOrder = 6
      Text = 'EditDbFileName'
    end
    object EditHisDisplayCarNo: TEdit
      Left = 373
      Top = 4
      Width = 119
      Height = 21
      ReadOnly = True
      TabOrder = 7
      Text = 'EditHisDisplayCarNo'
    end
    object BitBtn1: TBitBtn
      Left = 21
      Top = 19
      Width = 119
      Height = 25
      Hint = #20174#25968#25454#24211#36733#20837#25968#25454
      Caption = #36733#20837#25968#25454
      TabOrder = 8
      OnClick = BitBtn1Click
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 72
    Width = 862
    Height = 541
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #26354#32447#22270
      object Panel4: TPanel
        Left = 210
        Top = 0
        Width = 644
        Height = 513
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Panel4'
        TabOrder = 0
        object DBChart1: TDBChart
          Left = 0
          Top = 81
          Width = 644
          Height = 432
          AllowPanning = pmHorizontal
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          BackWall.Color = clWhite
          BackWall.Pen.Visible = False
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -19
          Title.Font.Name = #23435#20307
          Title.Font.Style = []
          Title.Text.Strings = (
            #36712#36857#26102#38388#36895#24230#26354#32447#22270)
          OnZoom = DBChart1Zoom
          BackColor = clWhite
          BottomAxis.Title.Caption = #26085#26399
          BottomAxis.Title.Font.Charset = GB2312_CHARSET
          BottomAxis.Title.Font.Color = clBlack
          BottomAxis.Title.Font.Height = -13
          BottomAxis.Title.Font.Name = #23435#20307
          BottomAxis.Title.Font.Style = []
          Frame.Visible = False
          LeftAxis.Automatic = False
          LeftAxis.AutomaticMaximum = False
          LeftAxis.AutomaticMinimum = False
          LeftAxis.ExactDateTime = False
          LeftAxis.Increment = 10.000000000000000000
          LeftAxis.LabelsFont.Charset = ANSI_CHARSET
          LeftAxis.LabelsFont.Color = clBlack
          LeftAxis.LabelsFont.Height = -11
          LeftAxis.LabelsFont.Name = #23435#20307
          LeftAxis.LabelsFont.Style = []
          LeftAxis.Maximum = 80.000000000000000000
          LeftAxis.Title.Caption = #36895#24230' km/h'
          LeftAxis.Title.Font.Charset = GB2312_CHARSET
          LeftAxis.Title.Font.Color = clBlack
          LeftAxis.Title.Font.Height = -13
          LeftAxis.Title.Font.Name = #23435#20307
          LeftAxis.Title.Font.Style = []
          Legend.Visible = False
          RightAxis.ExactDateTime = False
          RightAxis.Increment = 20.000000000000000000
          View3D = False
          Align = alClient
          BorderStyle = bsSingle
          Color = clWhite
          TabOrder = 0
          OnMouseMove = DBChart1MouseMove
          object LabelPage: TLabel
            Left = 10
            Top = 4
            Width = 63
            Height = 13
            Caption = 'LabelPage'
          end
          object LabelSelectPointInfo: TLabel
            Left = 104
            Top = 54
            Width = 140
            Height = 13
            Caption = 'LabelSelectPointInfo'
            Color = clYellow
            ParentColor = False
          end
          object Series1: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            DataSource = ADOQuery1
            SeriesColor = clRed
            ShowInLegend = False
            Title = #36895#24230#26354#32447#12288
            XLabelsSource = 'gpstime'
            LinePen.Color = clRed
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            YValues.ValueSource = 'Speed'
          end
          object Series2: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Style = smsValue
            Marks.Visible = False
            SeriesColor = 16768443
            ShowInLegend = False
            Title = #36895#24230#27491#24120#20540
            XLabelsSource = 'gpstime'
            LinePen.Color = clGreen
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
            object TeeFunction1: THighTeeFunction
              Period = 70.000000000000000000
            end
          end
        end
        object PanelControlLine: TPanel
          Left = 0
          Top = 55
          Width = 644
          Height = 26
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object BitBtnLeft: TBitBtn
            Left = 393
            Top = -11
            Width = 41
            Height = 22
            Caption = #24038#31227
            TabOrder = 1
            Visible = False
            OnClick = BitBtnLeftClick
          end
          object BitBtnZoomIn: TBitBtn
            Left = 8
            Top = 1
            Width = 45
            Height = 24
            Caption = #25918#22823
            TabOrder = 2
            OnClick = BitBtnZoomInClick
          end
          object BitBtnZoomOut: TBitBtn
            Left = 53
            Top = 1
            Width = 45
            Height = 24
            Caption = #32553#23567
            TabOrder = 3
            OnClick = BitBtnZoomOutClick
          end
          object BFirstPage: TBitBtn
            Left = 147
            Top = 1
            Width = 62
            Height = 24
            Caption = #31532#19968#39029
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            OnClick = BFirstPageClick
            Glyph.Data = {
              36010000424D3601000000000000760000002800000011000000100000000100
              040000000000C0000000C40E0000C40E00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333300000003333333333333333300000003033333333333333300000009033
              3333003333333000000090333330090333333000000090333009990333333000
              0000903009999900000000000000900999999999999900000000903009999900
              0000000000009033300999033333300000009033333009033333300000000033
              3333300333333000000003333333333333333000000033333333333333333000
              0000333333333333333330000000333333333333333330000000}
            NumGlyphs = 2
          end
          object ButtonZoomOld: TButton
            Left = 97
            Top = 1
            Width = 45
            Height = 24
            Caption = #24674#22797
            TabOrder = 8
            OnClick = ButtonZoomOldClick
          end
          object ButtonPrevious: TBitBtn
            Left = 208
            Top = 1
            Width = 62
            Height = 24
            Caption = #19978#19968#39029
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            OnClick = ButtonPreviousClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333333333333333333333333333333333333333333333333333333333
              3333333333333FF3333333333333003333333333333F77F33333333333009033
              333333333F7737F333333333009990333333333F773337FFFFFF330099999000
              00003F773333377777770099999999999990773FF33333FFFFF7330099999000
              000033773FF33777777733330099903333333333773FF7F33333333333009033
              33333333337737F3333333333333003333333333333377333333333333333333
              3333333333333333333333333333333333333333333333333333333333333333
              3333333333333333333333333333333333333333333333333333}
            NumGlyphs = 2
          end
          object ButtonNext: TBitBtn
            Left = 269
            Top = 1
            Width = 62
            Height = 24
            Caption = #19979#19968#39029
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
            OnClick = ButtonNextClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333333333333333333333333333333333333333333333333333333333
              3333333333333333333333333333333333333333333FF3333333333333003333
              3333333333773FF3333333333309003333333333337F773FF333333333099900
              33333FFFFF7F33773FF30000000999990033777777733333773F099999999999
              99007FFFFFFF33333F7700000009999900337777777F333F7733333333099900
              33333333337F3F77333333333309003333333333337F77333333333333003333
              3333333333773333333333333333333333333333333333333333333333333333
              3333333333333333333333333333333333333333333333333333}
            Layout = blGlyphRight
            NumGlyphs = 2
          end
          object BLastPage: TBitBtn
            Left = 330
            Top = 1
            Width = 62
            Height = 24
            Caption = #26368#21518#39029
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
            OnClick = BLastPageClick
            Glyph.Data = {
              36010000424D3601000000000000760000002800000011000000100000000100
              040000000000C0000000C40E0000C40E00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333300000003333333333333333300000003333333333333333300000003333
              3333333333330000000033333300333333300000000033333309003333309000
              0000333333099900333090000000000000099999003090000000099999999999
              9900900000000000000999990030900000003333330999003330900000003333
              3309003333309000000033333330033333309000000033333333333333303000
              0000333333333333333330000000333333333333333330000000}
            Layout = blGlyphRight
            NumGlyphs = 2
          end
          object BitBtnRigth: TBitBtn
            Left = 433
            Top = -11
            Width = 41
            Height = 22
            Caption = #21491#31227
            TabOrder = 0
            Visible = False
            OnClick = BitBtnRigthClick
          end
        end
        object PanelControlDrawL: TPanel
          Left = 0
          Top = 0
          Width = 644
          Height = 55
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
          object Label3: TLabel
            Left = 331
            Top = 8
            Width = 28
            Height = 13
            Caption = 'km/h'
            Visible = False
          end
          object CheckBoxDrawStandSpeed: TCheckBox
            Left = 145
            Top = 6
            Width = 116
            Height = 17
            Caption = #30011#20986#36895#24230#27491#24120#20540#65306
            TabOrder = 0
            Visible = False
          end
          object EditSpeedStand: TEdit
            Left = 259
            Top = 3
            Width = 71
            Height = 21
            TabOrder = 1
            Text = 'EditSpeedStand'
            Visible = False
          end
          object GroupBox1: TGroupBox
            Left = 8
            Top = 3
            Width = 508
            Height = 51
            TabOrder = 2
            object RadioButtonDrawPointInAPage: TRadioButton
              Left = 16
              Top = 9
              Width = 134
              Height = 17
              Caption = #19968#39029#20869#26174#31034#25152#26377#28857
              Checked = True
              TabOrder = 0
              TabStop = True
            end
            object RadioButtonDrawPointInMultiPages: TRadioButton
              Left = 15
              Top = 29
              Width = 151
              Height = 17
              Caption = #22810#39029#26174#31034#65292#27599#39029#28857#25968#65306
              TabOrder = 1
            end
            object EditAPageDrawCnt: TEdit
              Left = 159
              Top = 25
              Width = 59
              Height = 21
              TabOrder = 2
              Text = 'EditAPageDrawCnt'
            end
            object BitBtn4: TBitBtn
              Left = 311
              Top = 14
              Width = 88
              Height = 25
              Caption = #37325#30011#26354#32447
              TabOrder = 3
              OnClick = BitBtn4Click
            end
            object BitBtnPrintChart: TBitBtn
              Left = 398
              Top = 14
              Width = 88
              Height = 25
              Caption = #25171#21360#22270#24418
              Font.Charset = GB2312_CHARSET
              Font.Color = clNavy
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
              TabOrder = 4
              OnClick = BitBtnPrintChartClick
              Glyph.Data = {
                4E010000424D4E01000000000000760000002800000012000000120000000100
                040000000000D800000000000000000000001000000010000000000000000000
                BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                DDDDDD000000DDD00000000000DDDD000000DD0777777777070DDD000000D000
                000000000070DD000000D0777777FFF77000DD000000D077777799977070DD00
                0000D0000000000000770D000000D0777777777707070D000000DD0000000000
                70700D000000DDD0FFFFFFFF07070D000000DDDD0FCCCCCF0000DD000000DDDD
                0FFFFFFFF0DDDD000000DDDDD0FCCCCCF0DDDD000000DDDDD0FFFFFFFF0DDD00
                0000DDDDDD000000000DDD000000DDDDDDDDDDDDDDDDDD000000DDDDDDDDDDDD
                DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
            end
          end
        end
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 202
        Height = 513
        Align = alLeft
        DataSource = DataSource1
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'GpsTime'
            Title.Caption = #26102#38388
            Width = 123
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Speed'
            Title.Caption = #36895#24230
            Width = 38
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'onlineStr'
            Title.Caption = #26159#21542#22312#32447
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'locatestr'
            Title.Caption = #26159#21542#23450#20301
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'ID'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'IsLocate'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'IsOnline'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Addr'
            Title.Caption = #22320#22336
            Visible = False
          end>
      end
      object cxSplitter1: TcxSplitter
        Left = 202
        Top = 0
        Width = 8
        Height = 513
        HotZoneClassName = 'TcxMediaPlayer8Style'
        Control = DBGrid1
      end
    end
    object TabSheet2: TTabSheet
      Caption = #36229#36895#35760#24405
      ImageIndex = 1
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 0
        Width = 854
        Height = 513
        Align = alClient
        DataSource = DataSource2
        FooterColor = clWindow
        FooterFont.Charset = GB2312_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -13
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        FooterRowCount = 1
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        SumList.Active = True
        TabOrder = 0
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        Columns = <
          item
            EditButtons = <>
            FieldName = 'rq'
            Footer.Value = #21512#35745#65306
            Footer.ValueType = fvtStaticText
            Footers = <>
            Title.Caption = #26085#26399
          end
          item
            EditButtons = <>
            FieldName = 'cnt'
            Footer.FieldName = 'cnt'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #36229#36895#27425#25968
          end>
      end
      object BitBtn2: TBitBtn
        Left = 752
        Top = 8
        Width = 75
        Height = 25
        Caption = #25171#21360#34920#26684
        TabOrder = 1
        OnClick = BitBtn2Click
      end
    end
  end
  object BitBtnAnalyzeDataAgain: TBitBtn
    Left = 21
    Top = 43
    Width = 119
    Height = 25
    Caption = #37325#26032#20998#26512#25968#25454'&M'
    TabOrder = 2
    OnClick = BitBtnAnalyzeDataAgainClick
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 45
    Top = 164
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tab_tj ')
    Left = 45
    Top = 194
  end
  object ADOQueryDBGrid: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select iif(isOnline=0,'#39#19981#22312#32447#39','#39#22312#32447#39') as onlineStr,'
      
        ' iif(isLocate=0,'#39#19981#23450#20301#39','#39#23450#20301#39') as locatestr,* from tab_tj order by ' +
        'gpstime')
    Left = 40
    Top = 232
  end
  object DataSource1: TDataSource
    DataSet = ADOQueryDBGrid
    Left = 72
    Top = 232
  end
  object DataSource2: TDataSource
    DataSet = ADOQueryOverSpeedGrid
    Left = 76
    Top = 280
  end
  object ADOQueryOverSpeedGrid: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select rq,count(*) as cnt from tab_tj where speed>70 group by rq')
    Left = 44
    Top = 280
  end
  object PrintDBGridEh1: TPrintDBGridEh
    DBGridEh = DBGridEh1
    Options = [pghFitGridToPageWidth, pghColored]
    PageFooter.Font.Charset = GB2312_CHARSET
    PageFooter.Font.Color = clWindowText
    PageFooter.Font.Height = -13
    PageFooter.Font.Name = #23435#20307
    PageFooter.Font.Style = []
    PageHeader.Font.Charset = GB2312_CHARSET
    PageHeader.Font.Color = clWindowText
    PageHeader.Font.Height = -13
    PageHeader.Font.Name = #23435#20307
    PageHeader.Font.Style = []
    Units = MM
    Left = 112
    Top = 272
  end
end
