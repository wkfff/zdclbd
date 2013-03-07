inherited BackCallTelFrm: TBackCallTelFrm
  Left = 383
  Top = 245
  Caption = #22238#25320#30005#35805
  ClientHeight = 313
  ClientWidth = 437
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 437
    Height = 313
    inherited Panel2: TPanel
      Top = 275
      Width = 437
      inherited BitBtn1: TBitBtn
        Left = 119
        Width = 85
        OnClick = BitBtn1Click
      end
      inherited BitBtn2: TBitBtn
        Left = 232
        Width = 85
      end
    end
    inherited Panel3: TPanel
      Left = 309
      Width = 128
      Height = 275
      inherited ListView1: TListView
        Width = 126
        Height = 216
      end
      inherited Panel4: TPanel
        Width = 126
      end
      inherited Panel6: TPanel
        Top = 246
        Width = 126
        inherited BitBtnSel: TBitBtn
          Width = 61
        end
        inherited BitBtn3: TBitBtn
          Left = 64
          Width = 61
        end
      end
    end
    inherited Panel5: TPanel
      Width = 309
      Height = 275
      object Label1: TLabel [0]
        Left = 68
        Top = 188
        Width = 60
        Height = 13
        Caption = #30005#35805#21495#30721#65306
      end
      inherited Panel7: TPanel
        Width = 309
        Caption = #22238#25320#30005#35805
      end
      inherited PanProgress: TPanel
        Top = 252
        Width = 309
        inherited ProgressBar1: TProgressBar
          Width = 305
        end
      end
      object RadioGroup1: TRadioGroup
        Left = 68
        Top = 76
        Width = 185
        Height = 73
        Caption = #26631#24535
        ItemIndex = 0
        Items.Strings = (
          #26222#36890#30005#35805
          #30417#21548)
        TabOrder = 2
      end
      object editTel: TEdit
        Left = 132
        Top = 184
        Width = 121
        Height = 21
        MaxLength = 20
        TabOrder = 3
        OnKeyPress = editTelKeyPress
      end
    end
  end
end
