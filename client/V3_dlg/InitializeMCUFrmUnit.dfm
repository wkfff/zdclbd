inherited InitializeMCUFrm: TInitializeMCUFrm
  Width = 457
  Height = 352
  Caption = #21021#22987#21270'MCU'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 449
    Height = 325
    inherited Panel2: TPanel
      Top = 287
      Width = 449
      inherited BitBtn1: TBitBtn
        OnClick = BitBtn1Click
      end
    end
    inherited Panel3: TPanel
      Left = 332
      Height = 287
      inherited ListView1: TListView
        Height = 228
      end
      inherited Panel6: TPanel
        Top = 258
      end
    end
    inherited Panel5: TPanel
      Width = 332
      Height = 287
      object Label1: TLabel [0]
        Left = 16
        Top = 128
        Width = 262
        Height = 24
        Caption = #35828#26126#65306#24674#22797'MCU'#30340#20986#21378#21021#22987#20540
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      inherited Panel7: TPanel
        Width = 332
        Caption = #21021#22987#21270'MCU'
      end
      inherited PanProgress: TPanel
        Top = 264
        Width = 332
        inherited ProgressBar1: TProgressBar
          Width = 328
        end
      end
    end
  end
end
