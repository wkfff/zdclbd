inherited InfoServerFrm: TInfoServerFrm
  Top = 315
  Caption = #20449#24687#26381#21153
  ClientHeight = 309
  ClientWidth = 418
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 418
    Height = 309
    inherited Panel2: TPanel
      Top = 271
      Width = 418
      inherited BitBtn1: TBitBtn
        Left = 111
        Width = 83
        ParentShowHint = False
        OnClick = BitBtn1Click
      end
      inherited BitBtn2: TBitBtn
        Left = 224
        Width = 83
      end
    end
    inherited Panel3: TPanel
      Left = 287
      Width = 131
      Height = 271
      inherited ListView1: TListView
        Width = 129
        Height = 212
      end
      inherited Panel4: TPanel
        Width = 129
      end
      inherited Panel6: TPanel
        Top = 242
        Width = 129
        inherited BitBtnSel: TBitBtn
          Left = 3
          Width = 61
        end
        inherited BitBtn3: TBitBtn
          Left = 65
          Width = 61
        end
      end
    end
    inherited Panel5: TPanel
      Width = 287
      Height = 271
      object Label1: TLabel [0]
        Left = 11
        Top = 74
        Width = 60
        Height = 13
        Caption = #20449#24687#31867#22411#65306
      end
      object Label2: TLabel [1]
        Left = 11
        Top = 107
        Width = 60
        Height = 13
        Caption = #20449#24687#20869#23481#65306
      end
      inherited Panel7: TPanel
        Width = 287
        Caption = #20449#24687#26381#21153
      end
      inherited PanProgress: TPanel
        Top = 248
        Width = 287
        inherited ProgressBar1: TProgressBar
          Width = 283
        end
      end
      object EditType: TEdit
        Left = 86
        Top = 46
        Width = 121
        Height = 21
        TabOrder = 2
        Text = '0'
        Visible = False
        OnChange = EditTypeChange
        OnKeyPress = EditTypeKeyPress
      end
      object Memo1: TMemo
        Left = 72
        Top = 107
        Width = 200
        Height = 126
        MaxLength = 499
        TabOrder = 3
      end
      object cbxInfoType: TComboBox
        Left = 74
        Top = 70
        Width = 117
        Height = 21
        ItemHeight = 13
        TabOrder = 4
        OnChange = cbxInfoTypeChange
      end
      object RzBitBtn1: TRzBitBtn
        Left = 197
        Top = 68
        Width = 76
        Hint = #26174#31034#35813#31867#22411#19979#30340#20449#24687
        Caption = #25442#19968#26465#20449#24687
        HotTrack = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = RzBitBtn1Click
      end
    end
  end
end
