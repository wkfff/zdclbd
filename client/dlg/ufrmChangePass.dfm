object frmChangePass: TfrmChangePass
  Left = 343
  Top = 290
  BorderStyle = bsDialog
  Caption = #26356#25913#23494#30721
  ClientHeight = 190
  ClientWidth = 329
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 34
    Width = 329
    Height = 115
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 45
      Top = 21
      Width = 39
      Height = 13
      Caption = #29992#25143#21517
    end
    object Label2: TLabel
      Left = 45
      Top = 45
      Width = 39
      Height = 13
      Caption = #21407#23494#30721
    end
    object Label3: TLabel
      Left = 45
      Top = 69
      Width = 39
      Height = 13
      Caption = #26032#23494#30721
    end
    object Label4: TLabel
      Left = 19
      Top = 91
      Width = 65
      Height = 13
      Caption = #26032#23494#30721#30830#35748
    end
    object RzProgressBar1: TRzProgressBar
      Left = 224
      Top = 63
      Width = 98
      Height = 19
      BackColor = clCream
      BarColor = clLime
      BorderColor = 8421440
      BorderInner = fsFlat
      BorderOuter = fsNone
      BorderWidth = 0
      Font.Charset = GB2312_CHARSET
      Font.Color = clLime
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      InteriorOffset = 0
      ParentFont = False
      ParentShowHint = False
      PartsComplete = 0
      Percent = 100
      ShowHint = True
      ShowPercent = False
      TotalParts = 0
      Visible = False
    end
    object Edit1: TEdit
      Left = 98
      Top = 16
      Width = 120
      Height = 21
      CharCase = ecLowerCase
      MaxLength = 10
      ReadOnly = True
      TabOrder = 3
      Text = 'edit1'
    end
    object Edit2: TEdit
      Left = 98
      Top = 39
      Width = 120
      Height = 21
      CharCase = ecLowerCase
      MaxLength = 15
      PasswordChar = '*'
      TabOrder = 0
      Text = 'edit2'
    end
    object Edit3: TEdit
      Left = 98
      Top = 62
      Width = 120
      Height = 21
      CharCase = ecLowerCase
      MaxLength = 15
      PasswordChar = '*'
      TabOrder = 1
      Text = 'edit3'
      OnExit = Edit3Exit
      OnKeyUp = Edit3KeyUp
    end
    object Edit4: TEdit
      Left = 98
      Top = 85
      Width = 120
      Height = 21
      CharCase = ecLowerCase
      MaxLength = 10
      PasswordChar = '*'
      TabOrder = 2
      Text = '4'
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 149
    Width = 329
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 70
      Top = 8
      Width = 84
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
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
      Left = 153
      Top = 8
      Width = 84
      Height = 25
      Cancel = True
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 329
    Height = 34
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    Caption = #26356#25913#23494#30721
    Font.Charset = GB2312_CHARSET
    Font.Color = 16512
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
end
