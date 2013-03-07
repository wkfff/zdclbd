inherited QueryAudioFrm: TQueryAudioFrm
  Left = 466
  Top = 221
  Caption = #38899#39057#25968#25454#26816#32034
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited Panel2: TPanel
      inherited BitBtn1: TBitBtn
        Left = 107
        Width = 86
        OnClick = BitBtn1Click
      end
      inherited BitBtn2: TBitBtn
        Left = 244
        Width = 86
      end
    end
    inherited Panel3: TPanel
      Left = 303
      Width = 129
      inherited ListView1: TListView
        Width = 127
      end
      inherited Panel4: TPanel
        Width = 127
      end
      inherited Panel6: TPanel
        Width = 127
        inherited BitBtnSel: TBitBtn
          Width = 63
        end
        inherited BitBtn3: TBitBtn
          Left = 65
          Width = 63
        end
      end
    end
    inherited Panel5: TPanel
      Width = 303
      object Label4: TLabel [0]
        Left = 41
        Top = 112
        Width = 60
        Height = 13
        Caption = #24405#38899#21407#22240#65306
      end
      object Label1: TLabel [1]
        Left = 65
        Top = 72
        Width = 36
        Height = 13
        Caption = #36890#36947#65306
      end
      inherited Panel7: TPanel
        Width = 303
        Caption = #38899#39057#25968#25454#26816#32034
      end
      inherited PanProgress: TPanel
        Width = 303
        inherited ProgressBar1: TProgressBar
          Width = 299
        end
      end
      object GroupBox1: TGroupBox
        Left = 18
        Top = 145
        Width = 265
        Height = 145
        TabOrder = 2
        object Label2: TLabel
          Left = 16
          Top = 56
          Width = 60
          Height = 13
          Caption = #36215#22987#26102#38388#65306
        end
        object Label3: TLabel
          Left = 16
          Top = 88
          Width = 60
          Height = 13
          Caption = #32467#26463#26102#38388#65306
        end
        object CheckBox1: TCheckBox
          Left = 1
          Top = 1
          Width = 73
          Height = 17
          Caption = #26816#32034#26102#38388
          Checked = True
          State = cbChecked
          TabOrder = 0
          OnClick = CheckBox1Click
        end
        object beginDate: TDateTimePicker
          Left = 79
          Top = 51
          Width = 81
          Height = 21
          Date = 40072.669589652770000000
          Time = 40072.669589652770000000
          TabOrder = 1
        end
        object beginTime: TDateTimePicker
          Left = 167
          Top = 51
          Width = 73
          Height = 21
          Date = 40072.669808113410000000
          Time = 40072.669808113410000000
          Kind = dtkTime
          TabOrder = 2
        end
        object endDate: TDateTimePicker
          Left = 79
          Top = 83
          Width = 81
          Height = 21
          Date = 40072.669589652770000000
          Time = 40072.669589652770000000
          TabOrder = 3
        end
        object endTime: TDateTimePicker
          Left = 167
          Top = 83
          Width = 73
          Height = 21
          Date = 40072.669808113410000000
          Time = 40072.669808113410000000
          Kind = dtkTime
          TabOrder = 4
        end
      end
      object ComboBoxReason: TComboBox
        Left = 105
        Top = 108
        Width = 113
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 3
        Text = #20013#24515#20027#21160
        OnKeyPress = ComboBoxReasonKeyPress
        Items.Strings = (
          #20013#24515#20027#21160
          #23450#26102#21160#20316
          #25250#21163#25253#35686
          #30896#25758#20391#32763#25253#35686)
      end
      object ComboBoxCamera: TComboBox
        Left = 105
        Top = 68
        Width = 89
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 4
        Text = #25152#26377
        OnKeyPress = ComboBoxCameraKeyPress
        Items.Strings = (
          #25152#26377
          #21496#26426#19978#26041
          #21069#38376
          #21069#36710#21410
          #21518#36710#21410
          #21069#36710#22806)
      end
    end
  end
end
