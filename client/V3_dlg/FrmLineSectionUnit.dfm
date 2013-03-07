object frmSetLineSection: TfrmSetLineSection
  Left = 474
  Top = 216
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #35774#32622#36335#27573
  ClientHeight = 332
  ClientWidth = 336
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 336
    Height = 332
    Align = alClient
    Color = 16382438
    TabOrder = 0
    object Label1: TLabel
      Left = 18
      Top = 42
      Width = 60
      Height = 13
      AutoSize = False
      Caption = #36335#27573#23485#24230
    end
    object Label10: TLabel
      Left = 161
      Top = 42
      Width = 12
      Height = 13
      Caption = #31859
    end
    object Label11: TLabel
      Left = 17
      Top = 16
      Width = 60
      Height = 13
      AutoSize = False
      Caption = #36335#27573#32534#21495
    end
    object GroupBox1: TGroupBox
      Left = 16
      Top = 68
      Width = 305
      Height = 224
      Caption = #36335#27573#23646#24615
      TabOrder = 0
      object Label2: TLabel
        Left = 37
        Top = 114
        Width = 132
        Height = 13
        AutoSize = False
        Caption = #36335#27573#26368#39640#36895#24230
      end
      object Label3: TLabel
        Left = 37
        Top = 136
        Width = 118
        Height = 13
        AutoSize = False
        Caption = #36335#27573#36229#36895#25345#32493#26102#38388
      end
      object Label4: TLabel
        Left = 235
        Top = 114
        Width = 66
        Height = 13
        AutoSize = False
        Caption = #20844#37324'/'#23567#26102
      end
      object Label5: TLabel
        Left = 235
        Top = 136
        Width = 12
        Height = 13
        AutoSize = False
        Caption = #31186
      end
      object Label6: TLabel
        Left = 37
        Top = 45
        Width = 118
        Height = 13
        AutoSize = False
        Caption = #36335#27573#34892#39542#36807#38271#38400#20540
      end
      object Label7: TLabel
        Left = 37
        Top = 69
        Width = 118
        Height = 13
        AutoSize = False
        Caption = #36335#27573#34892#39542#19981#36275#38400#20540
      end
      object Label8: TLabel
        Left = 235
        Top = 45
        Width = 12
        Height = 13
        AutoSize = False
        Caption = #31186
      end
      object Label9: TLabel
        Left = 235
        Top = 69
        Width = 12
        Height = 13
        AutoSize = False
        Caption = #31186
      end
      object Notebook2: TNotebook
        Left = 21
        Top = 161
        Width = 108
        Height = 27
        TabOrder = 0
        object TPage
          Left = 0
          Top = 0
          Caption = 'Default'
          object rbNLat: TRadioButton
            Left = 6
            Top = 6
            Width = 53
            Height = 17
            Caption = #21271#32428
            Checked = True
            TabOrder = 0
            TabStop = True
          end
          object rbSLat: TRadioButton
            Left = 56
            Top = 6
            Width = 50
            Height = 17
            Caption = #21335#32428
            TabOrder = 1
          end
        end
      end
      object Notebook3: TNotebook
        Left = 21
        Top = 191
        Width = 108
        Height = 28
        TabOrder = 1
        object TPage
          Left = 0
          Top = 0
          Caption = 'Default'
          object rbELong: TRadioButton
            Left = 6
            Top = 8
            Width = 53
            Height = 17
            Caption = #19996#32463
            Checked = True
            TabOrder = 0
            TabStop = True
          end
          object rbWLong: TRadioButton
            Left = 56
            Top = 8
            Width = 50
            Height = 17
            Caption = #35199#32463
            TabOrder = 1
          end
        end
      end
      object CheckBox1: TCheckBox
        Left = 24
        Top = 22
        Width = 93
        Height = 17
        Caption = #34892#39542#26102#38388
        TabOrder = 2
        OnClick = CheckBox1Click
      end
      object CheckBox2: TCheckBox
        Left = 24
        Top = 90
        Width = 50
        Height = 17
        Caption = #38480#36895
        TabOrder = 3
        OnClick = CheckBox2Click
      end
      object edtLineSectionMaxSpeed: TEdit
        Left = 153
        Top = 110
        Width = 78
        Height = 21
        Hint = #36335#27573#26368#39640#36895#24230
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        Text = '0'
        OnKeyPress = edtLineSectionWidthKeyPress
      end
      object edtLineSectionOverspeedTime: TEdit
        Left = 153
        Top = 132
        Width = 78
        Height = 21
        Hint = #36335#27573#36229#36895#25345#32493#26102#38388
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        Text = '0'
        OnExit = edtLineSectionWidthExit
        OnKeyPress = edtLineSectionWidthKeyPress
      end
      object edtLineSectionRunMaxTime: TEdit
        Left = 153
        Top = 41
        Width = 78
        Height = 21
        Hint = #36335#27573#34892#39542#36807#38271#38400#20540
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        Text = '0'
        OnExit = edtLineSectionRunMaxTimeExit
        OnKeyPress = edtLineSectionWidthKeyPress
      end
      object edtLineSectionRunMinTime: TEdit
        Left = 153
        Top = 65
        Width = 78
        Height = 21
        Hint = #36335#27573#34892#39542#19981#36275#38400#20540
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        Text = '0'
        OnKeyPress = edtLineSectionWidthKeyPress
      end
    end
    object edtLineSectionWidth: TEdit
      Left = 76
      Top = 38
      Width = 81
      Height = 21
      Hint = #36335#27573#23485#24230
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Text = '0'
      OnExit = edtLineSectionWidthExit
      OnKeyPress = edtLineSectionWidthKeyPress
    end
    object edtLineSectionId: TEdit
      Left = 76
      Top = 12
      Width = 81
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 2
    end
    object BitBtn1: TBitBtn
      Left = 245
      Top = 301
      Width = 75
      Height = 25
      Caption = #32487#32493
      Default = True
      TabOrder = 3
      OnClick = BitBtn1Click
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
    object BitBtn2: TBitBtn
      Left = 168
      Top = 301
      Width = 75
      Height = 25
      Caption = #30830#23450
      ModalResult = 6
      TabOrder = 4
      OnClick = BitBtn2Click
    end
  end
end
