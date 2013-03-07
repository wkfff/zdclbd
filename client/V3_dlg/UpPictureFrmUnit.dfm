inherited UpPictureFrm: TUpPictureFrm
  Left = 316
  Top = 225
  Caption = #23384#20648#22810#23186#20307#25968#25454#19978#20256
  ClientHeight = 335
  ClientWidth = 420
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 420
    Height = 335
    inherited Panel2: TPanel
      Top = 297
      Width = 420
      inherited BitBtn1: TBitBtn
        Left = 131
        OnClick = BitBtn1Click
      end
      inherited BitBtn2: TBitBtn
        Left = 228
      end
    end
    inherited Panel3: TPanel
      Left = 303
      Height = 297
      inherited ListView1: TListView
        Height = 238
        BevelInner = bvNone
      end
      inherited Panel6: TPanel
        Top = 268
      end
    end
    inherited Panel5: TPanel
      Width = 303
      Height = 297
      object Label1: TLabel [0]
        Left = 56
        Top = 97
        Width = 48
        Height = 13
        Caption = #25668#20687#22836#65306
      end
      object Label2: TLabel [1]
        Left = 42
        Top = 157
        Width = 60
        Height = 13
        Caption = #36215#22987#26102#38388#65306
      end
      object Label3: TLabel [2]
        Left = 41
        Top = 186
        Width = 60
        Height = 13
        Caption = #32467#26463#26102#38388#65306
      end
      object Label4: TLabel [3]
        Left = 69
        Top = 68
        Width = 36
        Height = 13
        Caption = #31867#22411#65306
      end
      object Label5: TLabel [4]
        Left = 69
        Top = 127
        Width = 36
        Height = 13
        Caption = #21407#22240#65306
      end
      inherited Panel7: TPanel
        Width = 303
        Height = 44
        BevelInner = bvRaised
        Caption = #23384#20648#22810#23186#20307#25968#25454#19978#20256
      end
      inherited PanProgress: TPanel
        Top = 274
        Width = 303
        inherited ProgressBar1: TProgressBar
          Width = 299
        end
      end
      object ComboBoxCamera: TComboBox
        Left = 103
        Top = 93
        Width = 135
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 2
        Text = #25152#26377
        Items.Strings = (
          #25152#26377
          #21496#26426#19978#26041
          #21069#38376
          #21069#36710#21410
          #21518#36710#21410
          #21069#36710#22806)
      end
      object beginDate: TDateTimePicker
        Left = 103
        Top = 153
        Width = 81
        Height = 21
        Date = 40072.669589652770000000
        Time = 40072.669589652770000000
        TabOrder = 3
      end
      object beginTime: TDateTimePicker
        Left = 186
        Top = 153
        Width = 73
        Height = 21
        Date = 40072.669808113410000000
        Time = 40072.669808113410000000
        Kind = dtkTime
        TabOrder = 4
      end
      object endDate: TDateTimePicker
        Left = 103
        Top = 182
        Width = 81
        Height = 21
        Date = 40072.669589652770000000
        Time = 40072.669589652770000000
        TabOrder = 5
      end
      object endTime: TDateTimePicker
        Left = 186
        Top = 182
        Width = 73
        Height = 21
        Date = 40072.669808113410000000
        Time = 40072.669808113410000000
        Kind = dtkTime
        TabOrder = 6
      end
      object GroupBox1: TGroupBox
        Left = 47
        Top = 208
        Width = 212
        Height = 57
        Caption = #21024#38500#26631#24535
        TabOrder = 7
        object RadioButton1: TRadioButton
          Left = 35
          Top = 24
          Width = 50
          Height = 17
          Caption = #20445#30041
          Checked = True
          TabOrder = 0
          TabStop = True
        end
        object RadioButton2: TRadioButton
          Left = 128
          Top = 24
          Width = 48
          Height = 17
          Caption = #21024#38500
          TabOrder = 1
        end
      end
      object cbxMediaType: TComboBox
        Left = 103
        Top = 64
        Width = 135
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 8
        Text = #22270#20687
        Items.Strings = (
          #22270#20687
          #38899#39057
          #35270#39057)
      end
      object cbxMediaReason: TComboBox
        Left = 103
        Top = 123
        Width = 135
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 9
        Text = #20013#24515#19979#21457
        Items.Strings = (
          #20013#24515#19979#21457
          #23450#26102#21160#20316
          #25250#21163#25253#35686
          #30896#25758#20391#32763#25253#35686)
      end
    end
  end
end
