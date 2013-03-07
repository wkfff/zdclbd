inherited SetNightModeFrm: TSetNightModeFrm
  Left = 462
  Top = 177
  Caption = #35774#32622#39030#28783#22812#38388#27169#24335
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited Panel2: TPanel
      inherited BitBtn1: TBitBtn
        OnClick = BitBtn1Click
      end
    end
    inherited Panel5: TPanel
      object Label1: TLabel [0]
        Left = 88
        Top = 140
        Width = 60
        Height = 13
        Caption = #36215#22987#26102#38388#65306
      end
      object Label2: TLabel [1]
        Left = 88
        Top = 175
        Width = 60
        Height = 13
        Caption = #32467#26463#26102#38388#65306
      end
      inherited Panel7: TPanel
        Caption = #35774#32622#39030#28783#22812#38388#27169#24335
      end
      object beginTime: TDateTimePicker
        Left = 160
        Top = 136
        Width = 69
        Height = 21
        Date = 40073.502741423610000000
        Time = 40073.502741423610000000
        Kind = dtkTime
        TabOrder = 2
      end
      object endTime: TDateTimePicker
        Left = 160
        Top = 171
        Width = 69
        Height = 21
        Date = 40073.502775057880000000
        Time = 40073.502775057880000000
        Kind = dtkTime
        TabOrder = 3
      end
      object GroupBox1: TGroupBox
        Left = -176
        Top = 80
        Width = 233
        Height = 129
        Caption = #23646#24615
        TabOrder = 4
        Visible = False
        object CheckBox3: TCheckBox
          Left = 56
          Top = 88
          Width = 121
          Height = 17
          Caption = #23494#25991
          TabOrder = 0
        end
        object RadioButton1: TRadioButton
          Left = 56
          Top = 24
          Width = 113
          Height = 17
          Caption = #25968#25454#26080#21387#32553
          Checked = True
          TabOrder = 1
          TabStop = True
        end
        object RadioButton2: TRadioButton
          Left = 56
          Top = 56
          Width = 113
          Height = 17
          Caption = 'gz'#21387#32553
          TabOrder = 2
        end
      end
    end
  end
end
