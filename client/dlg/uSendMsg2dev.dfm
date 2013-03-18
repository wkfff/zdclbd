object sendMsg2dev: TsendMsg2dev
  Left = 359
  Top = 291
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #21457#36865#25991#26412#20449#24687
  ClientHeight = 373
  ClientWidth = 492
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 335
    Width = 492
    Height = 38
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvNone
    Color = 16382438
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 149
      Top = 8
      Width = 84
      Height = 25
      Caption = #21457#36865' &S'
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
      Left = 246
      Top = 8
      Width = 84
      Height = 25
      Cancel = True
      Caption = #21462#28040' &C'
      ModalResult = 2
      TabOrder = 1
      OnClick = BitBtn2Click
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 360
    Height = 335
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel1'
    Color = 16382438
    TabOrder = 1
    object Panel_basic: TPanel
      Left = 0
      Top = 49
      Width = 360
      Height = 286
      Align = alClient
      BevelInner = bvLowered
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 0
      OnResize = Panel_basicResize
      object Label2: TLabel
        Left = 1
        Top = 1
        Width = 358
        Height = 13
        Align = alTop
        Caption = #35201#21457#36865#30340#20449#24687#20869#23481#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Memo1: TMemo
        Left = 1
        Top = 14
        Width = 358
        Height = 136
        Align = alTop
        MaxLength = 499
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object ProgressBar1: TProgressBar
        Left = 1
        Top = 263
        Width = 358
        Height = 22
        Align = alBottom
        TabOrder = 1
      end
      object PanelControlSet: TPanel
        Left = 386
        Top = -3
        Width = 218
        Height = 18
        Hint = #27492#21151#33021#38656#36710#36733#35774#22791#25903#25345
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        Visible = False
        object CheckBoxControlSetRead: TCheckBox
          Left = 122
          Top = 1
          Width = 50
          Height = 17
          Hint = #27492#21151#33021#38656#36710#36733#35774#22791#25903#25345
          Caption = #26391#35835
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
        object CheckBoxControlSetShow: TCheckBox
          Left = 169
          Top = 1
          Width = 45
          Height = 17
          Hint = #27492#21151#33021#38656#36710#36733#35774#22791#25903#25345
          Caption = #26174#31034
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
        object CheckBoxSelectControlFunction: TCheckBox
          Left = 117
          Top = 9
          Width = 115
          Height = 17
          Hint = #27492#21151#33021#38656#36710#36733#35774#22791#25903#25345
          Caption = #35843#24230#23631#24102#25511#21046#39033':'
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = CheckBoxSelectControlFunctionClick
        end
      end
      object Panel5: TPanel
        Left = 1
        Top = 150
        Width = 358
        Height = 113
        Align = alClient
        BevelInner = bvSpace
        BevelOuter = bvLowered
        ParentColor = True
        TabOrder = 3
        object Label1: TLabel
          Left = 170
          Top = 8
          Width = 91
          Height = 13
          Caption = #35774#32622#20449#24687#20869#23481#65306
        end
        object Label3: TLabel
          Left = 2
          Top = 2
          Width = 39
          Height = 109
          Align = alLeft
          Caption = #26631#24535#65306
        end
        object checkSign: TcxCheckListBox
          Left = 41
          Top = 2
          Width = 120
          Height = 109
          Align = alLeft
          Items = <
            item
              Text = #32039#24613
            end
            item
              Enabled = False
              Text = #20445#30041
            end
            item
              Text = #32456#31471#26174#31034#22120#26174#31034
            end
            item
              Text = #32456#31471#35821#38899#25773#35835
            end
            item
              Text = #24191#21578#23631#26174#31034
            end
            item
              Text = 'CAN'#25925#38556#30721#20449#24687
            end
            item
              Enabled = False
              Text = #20445#30041
            end
            item
              Enabled = False
              Text = #20445#30041
            end>
          TabOrder = 0
        end
        object ComboBox1: TComboBox
          Left = 170
          Top = 27
          Width = 188
          Height = 21
          ItemHeight = 13
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Text = #30001#24744#20070#20889#20449#24687
          OnChange = ComboBox1Change
          Items.Strings = (
            #30001#24744#20070#20889#20449#24687
            #35831#24744#36895#22238#31649#29702#20013#24515#65281
            #35831#24744#36895#19982#31649#29702#20013#24515#32852#31995#65281
            #35831#24744#36895#19982#24744#30340#23478#20013#32852#31995#65281)
        end
        object btnSign: TBitBtn
          Left = 90
          Top = 81
          Width = 41
          Height = 28
          Caption = #26631#24535
          TabOrder = 2
          Visible = False
          OnClick = btnSignClick
        end
        object CheckBox1: TCheckBox
          Left = 170
          Top = 80
          Width = 169
          Height = 17
          Caption = #26412#27425#25805#20316#38656#20445#23384
          TabOrder = 3
          Visible = False
        end
      end
    end
    object Panel7: TPanel
      Left = 0
      Top = 0
      Width = 360
      Height = 49
      Align = alTop
      BevelInner = bvSpace
      BevelOuter = bvLowered
      Caption = #21457#36865#25991#26412#20449#24687
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = True
      ParentFont = False
      TabOrder = 1
    end
  end
  object Panel3: TPanel
    Left = 360
    Top = 0
    Width = 132
    Height = 335
    Align = alRight
    BevelInner = bvLowered
    BevelOuter = bvNone
    Caption = 'Panel3'
    Color = 16382438
    TabOrder = 2
    object ListView1: TListView
      Left = 1
      Top = 30
      Width = 130
      Height = 276
      Align = alClient
      Columns = <
        item
          AutoSize = True
          Caption = #36710#29260#21495
        end>
      GridLines = True
      MultiSelect = True
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 130
      Height = 29
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = ' '#21457#36865#32473#20197#19979#36710#36742#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = True
      ParentFont = False
      TabOrder = 1
    end
    object Panel6: TPanel
      Left = 1
      Top = 306
      Width = 130
      Height = 28
      Align = alBottom
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 2
      object BitBtnSel: TBitBtn
        Left = 2
        Top = 2
        Width = 63
        Height = 25
        Hint = #37325#26032#36873#25321#36710#36742
        Caption = #37325#26032#36873#25321
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = BitBtnSelClick
      end
      object BitBtn3: TBitBtn
        Left = 66
        Top = 2
        Width = 63
        Height = 25
        Cancel = True
        Caption = #31227#38500
        TabOrder = 1
        OnClick = BitBtn3Click
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
  end
end
