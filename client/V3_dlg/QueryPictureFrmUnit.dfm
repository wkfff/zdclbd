inherited QueryPictureFrm: TQueryPictureFrm
  Top = 241
  Caption = #23384#20648#22270#29255#26816#32034
  ClientHeight = 319
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Height = 319
    inherited Panel2: TPanel
      Top = 281
      inherited BitBtn1: TBitBtn
        Left = 126
        Width = 89
        OnClick = BitBtn1Click
      end
      inherited BitBtn2: TBitBtn
        Left = 223
        Width = 89
      end
    end
    inherited Panel3: TPanel
      Left = 303
      Width = 129
      Height = 281
      inherited ListView1: TListView
        Width = 127
        Height = 222
      end
      inherited Panel4: TPanel
        Width = 127
      end
      inherited Panel6: TPanel
        Top = 252
        Width = 127
        inherited BitBtnSel: TBitBtn
          Width = 61
        end
        inherited BitBtn3: TBitBtn
          Left = 63
          Width = 61
        end
      end
    end
    inherited Panel5: TPanel
      Width = 303
      Height = 281
      object Label1: TLabel [0]
        Left = 73
        Top = 64
        Width = 36
        Height = 13
        Caption = #36890#36947#65306
      end
      object Label4: TLabel [1]
        Left = 49
        Top = 93
        Width = 60
        Height = 13
        Caption = #25293#29031#21407#22240#65306
      end
      inherited Panel7: TPanel
        Width = 303
        Caption = #23384#20648#22270#20687#26816#32034
      end
      inherited PanProgress: TPanel
        Top = 258
        Width = 303
        inherited ProgressBar1: TProgressBar
          Width = 299
        end
      end
      object ComboBoxCamera: TComboBox
        Left = 110
        Top = 60
        Width = 89
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 2
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
      object GroupBox1: TGroupBox
        Left = 25
        Top = 132
        Width = 265
        Height = 112
        TabOrder = 3
        object Label2: TLabel
          Left = 21
          Top = 37
          Width = 60
          Height = 13
          Caption = #36215#22987#26102#38388#65306
        end
        object Label3: TLabel
          Left = 21
          Top = 76
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
          Left = 82
          Top = 32
          Width = 81
          Height = 21
          Date = 40072.669589652770000000
          Time = 40072.669589652770000000
          TabOrder = 1
        end
        object beginTime: TDateTimePicker
          Left = 170
          Top = 32
          Width = 73
          Height = 21
          Date = 40072.669808113410000000
          Time = 40072.669808113410000000
          Kind = dtkTime
          TabOrder = 2
        end
        object endDate: TDateTimePicker
          Left = 82
          Top = 71
          Width = 81
          Height = 21
          Date = 40072.669589652770000000
          Time = 40072.669589652770000000
          TabOrder = 3
        end
        object endTime: TDateTimePicker
          Left = 170
          Top = 71
          Width = 73
          Height = 21
          Date = 40072.669808113410000000
          Time = 40072.669808113410000000
          Kind = dtkTime
          TabOrder = 4
        end
      end
      object ComboBoxReason: TComboBox
        Left = 110
        Top = 89
        Width = 113
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 4
        Text = #20013#24515#20027#21160#25293#29031
        OnKeyPress = ComboBoxReasonKeyPress
        Items.Strings = (
          #20013#24515#20027#21160#25293#29031
          #23450#26102#25293#29031
          #25250#21163#25253#35686#25293#29031
          #30896#25758#20391#32763#25253#35686#25293#29031)
      end
    end
  end
end
