inherited frmDealEmgcyAlarm: TfrmDealEmgcyAlarm
  Left = 535
  Top = 292
  Caption = #32039#24613#25253#35686#22788#29702
  ClientHeight = 268
  ClientWidth = 376
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 376
    Height = 268
    inherited Panel2: TPanel
      Top = 230
      Width = 376
      inherited BitBtn1: TBitBtn
        Width = 87
        OnClick = BitBtn1Click
      end
      inherited BitBtn2: TBitBtn
        Width = 87
      end
    end
    inherited Panel3: TPanel
      Left = 242
      Width = 134
      Height = 230
      inherited ListView1: TListView
        Width = 132
        Height = 171
      end
      inherited Panel4: TPanel
        Width = 132
      end
      inherited Panel6: TPanel
        Top = 201
        Width = 132
        inherited BitBtnSel: TBitBtn
          Left = 3
          Width = 63
        end
        inherited BitBtn3: TBitBtn
          Left = 68
          Width = 63
        end
      end
    end
    inherited Panel5: TPanel
      Width = 242
      Height = 230
      inherited Panel7: TPanel
        Width = 242
        Height = 37
        Caption = #32039#24613#25253#35686#22788#29702
      end
      inherited PanProgress: TPanel
        Top = 207
        Width = 242
        inherited ProgressBar1: TProgressBar
          Width = 238
        end
      end
      object RadioGroup1: TRadioGroup
        Left = 32
        Top = 64
        Width = 185
        Height = 113
        Caption = #25253#35686#22788#29702#36873#39033
        ItemIndex = 1
        Items.Strings = (
          #30830#35748#25253#35686
          #35299#38500#25253#35686)
        TabOrder = 2
      end
    end
  end
end
