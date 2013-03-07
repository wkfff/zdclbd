inherited TaxiMeterStopDateTimeFrm: TTaxiMeterStopDateTimeFrm
  Caption = #35774#32622#35745#20215#22120#20572#26426#26102#38388
  ClientHeight = 258
  ClientWidth = 332
  FormStyle = fsNormal
  OldCreateOrder = True
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Top = 227
    Width = 332
    inherited BitBtn1: TBitBtn
      Left = 75
      Caption = #21457#36865' &S'
    end
    inherited BitBtn2: TBitBtn
      Left = 163
    end
  end
  inherited Panel_Devs: TPanel
    Top = 34
    Width = 332
    Height = 193
    Caption = ''
    inherited Panel4: TPanel
      Left = 36
      Caption = #35774#32622#20197#19979#36710#36742#65306
    end
    inherited BitBtn3: TBitBtn
      Left = 41
      Top = 142
    end
    inherited BitBtnSel: TBitBtn
      Left = 41
      Top = 114
    end
    inherited Panel1: TPanel
      Left = 141
      Height = 169
      inherited ListView1: TListView
        Height = 167
        Align = alRight
        OnClick = ListView1Click
      end
    end
    object GroupBox1: TGroupBox
      Left = 19
      Top = 27
      Width = 114
      Height = 79
      Caption = #35745#20215#22120#20572#26426#26102#38388
      TabOrder = 4
      object Label1: TLabel
        Left = 89
        Top = 52
        Width = 20
        Height = 15
        AutoSize = False
        Caption = #26102
      end
      object DateTimePicker1: TDateTimePicker
        Left = 8
        Top = 22
        Width = 97
        Height = 21
        Date = 38604.702728946760000000
        Time = 38604.702728946760000000
        TabOrder = 0
      end
      object UpDown1: TUpDown
        Left = 71
        Top = 48
        Width = 15
        Height = 21
        Associate = Edit1
        Max = 23
        TabOrder = 1
      end
      object Edit1: TEdit
        Left = 8
        Top = 48
        Width = 63
        Height = 21
        TabOrder = 2
        Text = '0'
        OnKeyPress = Edit1KeyPress
      end
    end
    object ProgressBar1: TProgressBar
      Left = 1
      Top = 170
      Width = 330
      Height = 22
      Align = alBottom
      TabOrder = 5
      Visible = False
    end
  end
  inherited Panel8: TPanel
    Width = 332
    Height = 34
    Caption = #35774#32622#35745#20215#22120#20572#26426#26102#38388
  end
end
