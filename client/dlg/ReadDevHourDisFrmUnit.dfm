inherited ReadDevHourDisFrm: TReadDevHourDisFrm
  Left = 416
  Top = 131
  Caption = #35835#21462#34892#39542#37324#31243
  ClientHeight = 318
  ClientWidth = 391
  FormStyle = fsNormal
  OldCreateOrder = True
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Top = 287
    Width = 391
    inherited BitBtn1: TBitBtn
      Left = 92
      Width = 102
      Caption = #35835#21462#37324#31243' &S'
    end
    inherited BitBtn2: TBitBtn
      Left = 194
    end
  end
  inherited Panel_Devs: TPanel
    Width = 391
    Height = 257
    Caption = ''
    object Label1: TLabel [0]
      Left = 391
      Top = 192
      Width = 13
      Height = 13
      AutoSize = False
      Caption = #31186
      Visible = False
    end
    inherited Panel4: TPanel
      Left = 317
      Top = 161
      Width = 56
      Caption = #36861#36394#38388#38548':'
      Visible = False
    end
    inherited BitBtn3: TBitBtn
      Top = 223
    end
    inherited BitBtnSel: TBitBtn
      Left = 103
      Top = 223
      TabOrder = 3
    end
    object Edit1: TEdit [4]
      Left = 328
      Top = 186
      Width = 60
      Height = 21
      TabOrder = 2
      Text = 'Edit1'
      Visible = False
      OnKeyPress = Edit1KeyPress
    end
    inherited Panel1: TPanel
      Left = 200
      Height = 255
      TabOrder = 4
      inherited ListView1: TListView
        Height = 234
        OnClick = ListView1Click
      end
      object ProgressBar1: TProgressBar
        Left = 1
        Top = 235
        Width = 188
        Height = 19
        Align = alBottom
        TabOrder = 1
        Visible = False
      end
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 16
      Width = 185
      Height = 177
      Caption = #26102#38388#27573
      TabOrder = 5
      object Label2: TLabel
        Left = 8
        Top = 24
        Width = 65
        Height = 13
        Caption = #24320#22987#26102#38388#65306
      end
      object Label3: TLabel
        Left = 104
        Top = 51
        Width = 13
        Height = 13
        Caption = #26085
      end
      object Label4: TLabel
        Left = 156
        Top = 50
        Width = 13
        Height = 13
        Caption = #26102
      end
      object Label5: TLabel
        Left = 11
        Top = 88
        Width = 65
        Height = 13
        Caption = #32467#26463#26102#38388#65306
      end
      object Label6: TLabel
        Left = 107
        Top = 115
        Width = 13
        Height = 13
        Caption = #26085
      end
      object Label7: TLabel
        Left = 159
        Top = 114
        Width = 13
        Height = 13
        Caption = #26102
      end
      object DateTimePicker1: TDateTimePicker
        Left = 8
        Top = 48
        Width = 92
        Height = 21
        Date = 39585.011884594910000000
        Time = 39585.011884594910000000
        TabOrder = 0
      end
      object Edit2: TEdit
        Left = 120
        Top = 48
        Width = 33
        Height = 21
        TabOrder = 1
        Text = '00'
        OnKeyPress = Edit2KeyPress
      end
      object DateTimePicker2: TDateTimePicker
        Left = 11
        Top = 112
        Width = 92
        Height = 21
        Date = 39585.011884594910000000
        Time = 39585.011884594910000000
        TabOrder = 2
      end
      object Edit3: TEdit
        Left = 123
        Top = 112
        Width = 33
        Height = 21
        TabOrder = 3
        Text = '23'
        OnKeyPress = Edit3KeyPress
      end
    end
  end
  inherited Panel8: TPanel
    Width = 391
    Caption = #35835#21462#34892#39542#37324#31243
  end
end
