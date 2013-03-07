object ledAdUnitFrm: TledAdUnitFrm
  Left = 94
  Top = 117
  BorderStyle = bsSingle
  Caption = #24191#21578#20869#23481
  ClientHeight = 538
  ClientWidth = 849
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 849
    Height = 477
    Align = alClient
    Caption = #24191#21578#20869#23481
    TabOrder = 0
    object AdInfoList: TcxTreeList
      Left = 2
      Top = 15
      Width = 663
      Height = 460
      Align = alClient
      Bands = <
        item
          Caption.AlignHorz = taCenter
          Caption.Text = #22522#26412#20449#24687
        end>
      BufferedPaint = True
      OptionsData.Deleting = False
      OptionsView.GridLines = tlglBoth
      OptionsView.ShowRoot = False
      TabOrder = 0
      OnClick = AdInfoListClick
      OnEditing = AdInfoListEditing
      object SendChose: TcxTreeListColumn
        Caption.Text = #36873#25321
        DataBinding.ValueType = 'Boolean'
        Width = 54
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object cxID: TcxTreeListColumn
        Caption.Text = #32534#21495
        DataBinding.ValueType = 'Integer'
        Options.Editing = False
        Width = 67
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 0
        SortOrder = soAscending
      end
      object LedMemo: TcxTreeListColumn
        Caption.Text = #24191#21578#20869#23481
        DataBinding.ValueType = 'String'
        Options.Editing = False
        Width = 264
        Position.ColIndex = 2
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object DataType: TcxTreeListColumn
        Caption.Text = #25968#25454#31867#22411
        DataBinding.ValueType = 'String'
        Options.Editing = False
        Width = 62
        Position.ColIndex = 3
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object DataSpeed: TcxTreeListColumn
        Caption.Text = #36895#24230#32423#21035
        DataBinding.ValueType = 'String'
        MinWidth = 50
        Options.Editing = False
        Width = 76
        Position.ColIndex = 4
        Position.RowIndex = 0
        Position.BandIndex = 0
        SortOrder = soAscending
      end
      object InType: TcxTreeListColumn
        Caption.Text = #36827#20837#26041#24335
        DataBinding.ValueType = 'String'
        Options.Editing = False
        Width = 127
        Position.ColIndex = 5
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object ExitType: TcxTreeListColumn
        Caption.Text = #36864#20986#26041#24335
        DataBinding.ValueType = 'String'
        Options.Editing = False
        Width = 111
        Position.ColIndex = 6
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object x: TcxTreeListColumn
        Visible = False
        Caption.Text = 'X'
        DataBinding.ValueType = 'String'
        Options.Editing = False
        Width = 124
        Position.ColIndex = 9
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object y: TcxTreeListColumn
        Visible = False
        Caption.Text = 'Y'
        DataBinding.ValueType = 'String'
        Options.Editing = False
        Width = 67
        Position.ColIndex = 9
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object StopTime: TcxTreeListColumn
        Caption.Text = #20572#30041#26102#38388
        DataBinding.ValueType = 'Integer'
        Options.Editing = False
        Width = 115
        Position.ColIndex = 7
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object Font: TcxTreeListColumn
        Caption.Text = #23383#20307
        DataBinding.ValueType = 'String'
        Options.Editing = False
        Width = 79
        Position.ColIndex = 8
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object IsDisTime: TcxTreeListColumn
        Caption.Text = #26102#38388#26631
        DataBinding.ValueType = 'String'
        Options.Editing = False
        Width = 112
        Position.ColIndex = 9
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object ExTend: TcxTreeListColumn
        Visible = False
        Caption.Text = #25193#23637
        DataBinding.ValueType = 'String'
        Options.Editing = False
        Width = 107
        Position.ColIndex = 9
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object RunTime: TcxTreeListColumn
        Caption.Text = #25237#25918#26102#38388
        DataBinding.ValueType = 'DateTime'
        Options.Editing = False
        Width = 130
        Position.ColIndex = 10
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object EndTime: TcxTreeListColumn
        Caption.Text = #32467#26463#26102#38388
        DataBinding.ValueType = 'DateTime'
        Options.Editing = False
        Width = 106
        Position.ColIndex = 11
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object CusTerm: TcxTreeListColumn
        Caption.Text = #23458#25143
        DataBinding.ValueType = 'String'
        Options.Editing = False
        Width = 58
        Position.ColIndex = 12
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object custermper: TcxTreeListColumn
        Caption.Text = #32852#31995#20154
        DataBinding.ValueType = 'String'
        Options.Editing = False
        Width = 47
        Position.ColIndex = 13
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object custermtel: TcxTreeListColumn
        Caption.Text = #23458#25143#30005#35805
        DataBinding.ValueType = 'String'
        Options.Editing = False
        Width = 94
        Position.ColIndex = 14
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object memo: TcxTreeListColumn
        Caption.Text = #22791#27880
        DataBinding.ValueType = 'String'
        Options.Editing = False
        Width = 60
        Position.ColIndex = 15
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
    end
    object cxSplitter2: TcxSplitter
      Left = 665
      Top = 15
      Width = 8
      Height = 460
      HotZoneClassName = 'TcxSimpleStyle'
      AlignSplitter = salRight
      Control = Panel1
      Color = clBtnFace
      ShowHint = False
      ParentColor = False
      ParentShowHint = False
    end
    object Panel1: TPanel
      Left = 673
      Top = 15
      Width = 174
      Height = 460
      Align = alRight
      Caption = 'Panel1'
      TabOrder = 2
      object ListView2: TListView
        Left = 1
        Top = 1
        Width = 172
        Height = 428
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
      end
      object Button1: TButton
        Left = 8
        Top = 432
        Width = 75
        Height = 25
        Caption = #37325#26032#36873#25321
        TabOrder = 1
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 88
        Top = 432
        Width = 75
        Height = 25
        Caption = #21457#36865#35835#21462
        TabOrder = 2
        OnClick = Button2Click
      end
    end
  end
  object ComboBox1: TComboBox
    Left = 40
    Top = 384
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    Visible = False
  end
  object Panel2: TPanel
    Left = 0
    Top = 477
    Width = 849
    Height = 61
    Align = alBottom
    TabOrder = 2
    object SpeedButton1: TSpeedButton
      Left = 176
      Top = 28
      Width = 93
      Height = 27
      Caption = #21457#36865#21024#38500
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 689
      Top = 28
      Width = 84
      Height = 28
      Caption = #36864#20986
      OnClick = SpeedButton2Click
    end
    object SpeedButton3: TSpeedButton
      Left = 312
      Top = 28
      Width = 93
      Height = 27
      Caption = #21462#28040#21457#36865
      OnClick = SpeedButton3Click
    end
    object Label1: TLabel
      Left = 504
      Top = 8
      Width = 42
      Height = 13
      Caption = 'Label1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object CheckBox1: TCheckBox
      Left = 24
      Top = 37
      Width = 89
      Height = 15
      Caption = #20840#37096#21024#38500
      TabOrder = 0
      OnClick = CheckBox1Click
    end
    object ProgressBar1: TProgressBar
      Left = 6
      Top = 3
      Width = 471
      Height = 22
      TabOrder = 1
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 3000
    OnTimer = Timer1Timer
    Left = 360
    Top = 192
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 3000
    OnTimer = Timer2Timer
    Left = 224
    Top = 184
  end
end
