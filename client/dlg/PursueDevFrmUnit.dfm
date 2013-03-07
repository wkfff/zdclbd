inherited PursueDevFrm: TPursueDevFrm
  Left = 431
  Top = 217
  Caption = #20020#26102#20301#32622#36319#36394
  ClientHeight = 319
  ClientWidth = 432
  FormStyle = fsNormal
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Top = 288
    Width = 432
    inherited BitBtn1: TBitBtn
      Left = 120
      Width = 75
      Caption = #21457#36865
    end
    inherited BitBtn2: TBitBtn
      Left = 256
      Width = 75
      Caption = #21462#28040
      OnClick = BitBtn2Click
    end
  end
  inherited Panel_Devs: TPanel
    Width = 432
    Height = 288
    inherited Panel4: TPanel [0]
      Left = 0
      Top = 75
      Width = 56
      Caption = #36861#36394#38388#38548':'
    end
    object RadioGroup1: TRadioGroup [1]
      Left = -45
      Top = 61
      Width = 84
      Height = 67
      ItemIndex = 0
      Items.Strings = (
        #24320#22987#36861#36394
        #21462#28040#36861#36394)
      TabOrder = 1
      Visible = False
      OnClick = RadioGroup1Click
    end
    object Panel3: TPanel [2]
      Left = 1
      Top = 1
      Width = 299
      Height = 286
      Align = alClient
      TabOrder = 3
      object ProgressBar1: TProgressBar
        Left = 1
        Top = 266
        Width = 297
        Height = 19
        Align = alBottom
        TabOrder = 0
        Visible = False
      end
    end
    inherited Panel6: TPanel [3]
      Width = 299
      Height = 286
      TabOrder = 4
      object lbl2: TLabel [0]
        Left = 176
        Top = 118
        Width = 112
        Height = 13
        Caption = #31186'(0'#34920#31034#20572#27490#36319#36394')'
      end
      object Label2: TLabel [1]
        Left = 81
        Top = 71
        Width = 39
        Height = 13
        Caption = #23646#24615#65306
        Visible = False
      end
      object lbl1: TLabel [2]
        Left = 42
        Top = 118
        Width = 65
        Height = 13
        Caption = #26102#38388#38388#38548#65306
      end
      object lbl3: TLabel [3]
        Left = 42
        Top = 172
        Width = 65
        Height = 13
        Caption = #25345#32493#26102#38388#65306
      end
      object lbl4: TLabel [4]
        Left = 172
        Top = 172
        Width = 26
        Height = 13
        Caption = #20998#38047
      end
      inherited Panel8: TPanel
        Width = 297
        Height = 56
        BevelInner = bvSpace
        BevelOuter = bvLowered
        Caption = #20020#26102#20301#32622#36319#36394
        Font.Color = clBlack
        ParentColor = True
      end
      object Edit1: TEdit
        Left = 107
        Top = 114
        Width = 63
        Height = 21
        TabOrder = 1
        Text = '0'
        OnKeyPress = Edit1KeyPress
      end
      object comboxShuXing: TComboBox
        Left = 120
        Top = 68
        Width = 157
        Height = 21
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 2
        Text = #25353#26102#38388#38388#38548#12289#25345#32493#26102#38388
        Visible = False
        OnChange = comboxShuXingChange
        Items.Strings = (
          #25353#26102#38388#38388#38548#12289#25345#32493#26102#38388
          #25353#36317#31163#38388#38548#12289#25345#32493#36317#31163
          #25353#26102#38388#38388#38548#12289#25345#32493#36317#31163
          #25353#36317#31163#38388#38548#12289#25345#32493#26102#38388
          #20572#27490#24403#21069#36319#36394)
      end
      object Edit2: TEdit
        Left = 107
        Top = 168
        Width = 63
        Height = 21
        TabOrder = 3
        Text = '0'
        OnKeyPress = Edit1KeyPress
      end
    end
    inherited Panel1: TPanel
      Left = 300
      Width = 131
      Height = 286
      TabOrder = 2
      inherited ListView1: TListView
        Width = 129
        Height = 251
        OnClick = ListView1Click
      end
      inherited Panel5: TPanel
        Top = 252
        Width = 129
        Height = 33
        inherited BitBtnSel: TBitBtn
          Left = 2
          Top = 5
          Width = 61
          Font.Charset = ANSI_CHARSET
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          ParentFont = False
        end
        inherited BitBtn3: TBitBtn
          Left = 66
          Top = 5
          Width = 61
          Font.Charset = ANSI_CHARSET
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          ParentFont = False
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
end
