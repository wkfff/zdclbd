object frmDevAreaList: TfrmDevAreaList
  Left = 430
  Top = 200
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #36710#26426#24050#35774#32622#21306#22495'/'#36335#32447
  ClientHeight = 376
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 447
    Height = 289
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object RzListView1: TRzListView
      Left = 0
      Top = 0
      Width = 447
      Height = 289
      Align = alClient
      BorderStyle = bsNone
      Checkboxes = True
      Columns = <
        item
          Caption = #21306#22495#24418#29366
          Width = 120
        end
        item
          Caption = #21306#22495'/'#36335#32447#32534#21495
          Width = 100
        end
        item
          Caption = #21306#22495'/'#36335#32447#21517#31216
          Width = 210
        end>
      GridLines = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 330
    Width = 447
    Height = 46
    Align = alBottom
    BevelOuter = bvLowered
    Color = 16382438
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 128
      Top = 11
      Width = 75
      Height = 25
      Caption = #30830#23450'(&O)'
      Default = True
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
      Left = 264
      Top = 11
      Width = 75
      Height = 25
      Caption = #21462#28040'(&C)'
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 289
    Width = 447
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 2
    object rbUpdate: TRadioButton
      Left = 8
      Top = 14
      Width = 56
      Height = 17
      Caption = #26356#26032
      TabOrder = 0
    end
    object rbAttach: TRadioButton
      Left = 64
      Top = 14
      Width = 56
      Height = 17
      Caption = #36861#21152
      Checked = True
      TabOrder = 1
      TabStop = True
    end
    object rbModify: TRadioButton
      Left = 120
      Top = 14
      Width = 56
      Height = 17
      Caption = #20462#25913
      TabOrder = 2
    end
  end
end
