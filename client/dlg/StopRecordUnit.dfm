object StopRecordForm: TStopRecordForm
  Left = 234
  Top = 222
  Width = 872
  Height = 628
  Caption = #20572#36710#20449#24687#26597#30475
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel5: TPanel
    Left = 0
    Top = 0
    Width = 864
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    Caption = #20572#36710#20449#24687#26597#30475
    Color = 11009763
    Font.Charset = GB2312_CHARSET
    Font.Color = clNavy
    Font.Height = -24
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Panel6: TPanel
    Left = 0
    Top = 41
    Width = 864
    Height = 32
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 10
      Width = 65
      Height = 17
      AutoSize = False
      Caption = #36710#29260#21495#30721#65306
    end
    object Label2: TLabel
      Left = 194
      Top = 10
      Width = 53
      Height = 13
      Caption = #26102#38388' '#20174':'
    end
    object Label3: TLabel
      Left = 432
      Top = 10
      Width = 13
      Height = 13
      Caption = #21040
    end
    object ComboboxCarNO: TComboBox
      Left = 64
      Top = 6
      Width = 121
      Height = 21
      ItemHeight = 13
      Sorted = True
      TabOrder = 0
      Text = 'ComboboxCarNO'
    end
    object fromDate: TDateTimePicker
      Left = 251
      Top = 6
      Width = 97
      Height = 21
      Date = 39441.354952615740000000
      Time = 39441.354952615740000000
      TabOrder = 1
    end
    object fromTime: TDateTimePicker
      Left = 349
      Top = 6
      Width = 82
      Height = 21
      Date = 39441.355168356480000000
      Time = 39441.355168356480000000
      Kind = dtkTime
      TabOrder = 2
    end
    object toDate: TDateTimePicker
      Left = 448
      Top = 6
      Width = 94
      Height = 21
      Date = 39441.355506724540000000
      Time = 39441.355506724540000000
      TabOrder = 3
    end
    object toTime: TDateTimePicker
      Left = 548
      Top = 6
      Width = 80
      Height = 21
      Date = 39441.356138414350000000
      Time = 39441.356138414350000000
      Kind = dtkTime
      TabOrder = 4
    end
    object BitBtnQuery: TBitBtn
      Left = 660
      Top = 3
      Width = 75
      Height = 25
      Caption = #26597#35810'&Q'
      TabOrder = 5
      OnClick = BitBtnQueryClick
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 570
    Width = 864
    Height = 31
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 2
    object Panel2: TPanel
      Left = 670
      Top = 1
      Width = 193
      Height = 29
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object BitBtnPrint: TBitBtn
        Left = 8
        Top = 2
        Width = 81
        Height = 25
        Caption = #25171#21360
        TabOrder = 0
        OnClick = BitBtnPrintClick
      end
      object BitBtn3: TBitBtn
        Left = 97
        Top = 2
        Width = 88
        Height = 25
        Cancel = True
        Caption = #36864#20986
        ModalResult = 2
        TabOrder = 1
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
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 73
    Width = 305
    Height = 497
    Align = alLeft
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = ANSI_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    TabOrder = 3
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnCellClick = DBGridEh1CellClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'CAR_NO'
        Footers = <>
        Title.Caption = #36710#29260#21495
        Width = 103
      end
      item
        EditButtons = <>
        FieldName = 'StopTime'
        Footers = <>
        Title.Caption = #20572#36710#26102#38388
        Width = 156
      end>
  end
  object DBGridEh2: TDBGridEh
    Left = 305
    Top = 73
    Width = 559
    Height = 497
    Align = alClient
    DataSource = DataSource2
    FooterColor = clWindow
    FooterFont.Charset = ANSI_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    TabOrder = 4
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'sTime'
        Footers = <>
        Title.Caption = #26102#38388
        Width = 172
      end
      item
        EditButtons = <>
        FieldName = 'Speed'
        Footers = <>
        Title.Caption = #36895#24230
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'Longitude'
        Footers = <>
        Title.Caption = #32463#24230
        Width = 135
      end
      item
        EditButtons = <>
        FieldName = 'Latitude'
        Footers = <>
        Title.Caption = #32428#24230
        Width = 146
      end
      item
        EditButtons = <>
        FieldName = 'IsPosition'
        Footers = <>
        Title.Caption = #26159#21542#21049#36710
      end>
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = ClientDataSet1AfterScroll
    Left = 72
    Top = 192
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = ClientDataSet1
    Left = 120
    Top = 240
  end
  object DataSource2: TDataSource
    AutoEdit = False
    DataSet = ClientDataSet2
    Left = 536
    Top = 208
  end
  object ClientDataSet2: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 504
    Top = 376
  end
  object PrintDBGridEh2: TPrintDBGridEh
    DBGridEh = DBGridEh2
    Options = []
    PageFooter.Font.Charset = DEFAULT_CHARSET
    PageFooter.Font.Color = clWindowText
    PageFooter.Font.Height = -11
    PageFooter.Font.Name = 'MS Sans Serif'
    PageFooter.Font.Style = []
    PageHeader.CenterText.Strings = (
      #20572#36710#20449#24687)
    PageHeader.Font.Charset = ANSI_CHARSET
    PageHeader.Font.Color = clWindowText
    PageHeader.Font.Height = -19
    PageHeader.Font.Name = #23435#20307
    PageHeader.Font.Style = []
    Units = MM
    Left = 416
    Top = 328
  end
end
