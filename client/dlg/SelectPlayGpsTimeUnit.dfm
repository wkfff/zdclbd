object SelectPlayGpsTimeForm: TSelectPlayGpsTimeForm
  Left = 294
  Top = 413
  Width = 465
  Height = 250
  BorderIcons = [biSystemMenu]
  Caption = #36873#25321'GPS'#36712#36857#22238#25918#26102#38388#27573
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
  object Panel4: TPanel
    Left = 0
    Top = 176
    Width = 457
    Height = 40
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 0
    object BitBtn3: TBitBtn
      Left = 257
      Top = 8
      Width = 84
      Height = 25
      Caption = #30830#23450
      Default = True
      TabOrder = 0
      OnClick = BitBtn3Click
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
    object BitBtn1: TBitBtn
      Left = 340
      Top = 8
      Width = 88
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
    object BitBtnReSelect: TBitBtn
      Left = 8
      Top = 8
      Width = 97
      Height = 25
      Caption = #37325#26032#36873#25321#36710#36742
      TabOrder = 2
      Visible = False
      OnClick = BitBtnReSelectClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 41
    Width = 457
    Height = 98
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 23
      Width = 39
      Height = 13
      Caption = #36710#29260#21495
    end
    object Label2: TLabel
      Left = 8
      Top = 46
      Width = 39
      Height = 13
      Caption = #35774#22791#21517
    end
    object Label3: TLabel
      Left = 8
      Top = 70
      Width = 47
      Height = 13
      Caption = 'SIM'#21345#21495
    end
    object Label4: TLabel
      Left = 168
      Top = 24
      Width = 40
      Height = 13
      Caption = #35774#22791'ID'
    end
    object Label5: TLabel
      Left = 168
      Top = 47
      Width = 52
      Height = 13
      Caption = #25152#22312#20998#32452
    end
    object Label6: TLabel
      Left = 168
      Top = 70
      Width = 52
      Height = 13
      Caption = #36710#36742#22791#27880
    end
    object Edit1: TEdit
      Left = 62
      Top = 16
      Width = 99
      Height = 21
      Color = 14737632
      ReadOnly = True
      TabOrder = 0
      Text = 'Edit1'
    end
    object Edit2: TEdit
      Left = 62
      Top = 39
      Width = 99
      Height = 21
      Color = 14737632
      ReadOnly = True
      TabOrder = 1
      Text = 'Edit2'
    end
    object Edit3: TEdit
      Left = 62
      Top = 63
      Width = 99
      Height = 21
      Color = 14737632
      ReadOnly = True
      TabOrder = 2
      Text = 'Edit3'
    end
    object Edit4: TEdit
      Left = 226
      Top = 18
      Width = 110
      Height = 21
      Color = 14737632
      ReadOnly = True
      TabOrder = 3
      Text = 'Edit4'
    end
    object Edit5: TEdit
      Left = 226
      Top = 41
      Width = 110
      Height = 21
      Color = 14737632
      ReadOnly = True
      TabOrder = 4
      Text = 'Edit5'
    end
    object Edit6: TEdit
      Left = 226
      Top = 64
      Width = 223
      Height = 21
      Color = 14737632
      ReadOnly = True
      TabOrder = 5
      Text = 'Edit6'
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 139
    Width = 457
    Height = 37
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 2
    object Label7: TLabel
      Left = 6
      Top = 13
      Width = 78
      Height = 13
      Caption = #22238#25918#26102#38388#27573#65306
    end
    object Label8: TLabel
      Left = 259
      Top = 13
      Width = 14
      Height = 13
      Caption = '--'
    end
    object start_date: TDateTimePicker
      Left = 79
      Top = 8
      Width = 98
      Height = 21
      Date = 38122.000000000000000000
      Time = 38122.000000000000000000
      TabOrder = 0
      OnChange = start_dateChange
    end
    object start_time: TDateTimePicker
      Left = 179
      Top = 8
      Width = 81
      Height = 21
      Date = 38122.000000000000000000
      Time = 38122.000000000000000000
      Kind = dtkTime
      TabOrder = 1
    end
    object end_date: TDateTimePicker
      Left = 275
      Top = 8
      Width = 94
      Height = 21
      Date = 38122.000000000000000000
      Time = 38122.000000000000000000
      TabOrder = 2
    end
    object end_time: TDateTimePicker
      Left = 370
      Top = 8
      Width = 81
      Height = 21
      Date = 38122.999988425930000000
      Time = 38122.999988425930000000
      Kind = dtkTime
      TabOrder = 3
    end
  end
  object Panel8: TPanel
    Left = 0
    Top = 0
    Width = 457
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    Caption = #36873#25321'GPS'#36712#36857#22238#25918#26102#38388#27573
    Color = 15265488
    Font.Charset = GB2312_CHARSET
    Font.Color = 16512
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
end
