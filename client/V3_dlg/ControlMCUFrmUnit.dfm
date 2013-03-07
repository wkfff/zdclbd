inherited ControlMCUFrm: TControlMCUFrm
  Left = 381
  Top = 206
  Width = 436
  Height = 343
  Caption = #36828#31243#25511#21046'MCU'#22797#20301
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 428
    Height = 316
    inherited Panel2: TPanel
      Top = 279
      Width = 428
      Height = 37
      inherited BitBtn1: TBitBtn
        Left = 99
        OnClick = BitBtn1Click
      end
      inherited BitBtn2: TBitBtn
        Left = 196
      end
    end
    inherited Panel3: TPanel
      Left = 311
      Height = 279
      inherited ListView1: TListView
        Height = 220
      end
      inherited Panel6: TPanel
        Top = 250
      end
    end
    inherited Panel5: TPanel
      Width = 311
      Height = 279
      object Label1: TLabel [0]
        Left = 64
        Top = 132
        Width = 36
        Height = 13
        Caption = #23494#30721#65306
      end
      inherited Panel7: TPanel
        Width = 311
        Caption = #36828#31243#25511#21046'MCU'#22797#20301
      end
      inherited PanProgress: TPanel
        Top = 256
        Width = 311
        inherited ProgressBar1: TProgressBar
          Width = 307
        end
      end
      object Edit1: TEdit
        Left = 112
        Top = 128
        Width = 121
        Height = 21
        PasswordChar = '*'
        TabOrder = 2
      end
    end
  end
end
