inherited ControlCarFrm: TControlCarFrm
  Caption = #36710#36742#25511#21046
  ClientHeight = 289
  ClientWidth = 398
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 398
    Height = 289
    inherited Panel2: TPanel
      Top = 251
      Width = 398
      inherited BitBtn1: TBitBtn
        Width = 89
        OnClick = BitBtn1Click
      end
      inherited BitBtn2: TBitBtn
        Left = 228
        Width = 89
      end
    end
    inherited Panel3: TPanel
      Left = 268
      Width = 130
      Height = 251
      inherited ListView1: TListView
        Width = 128
        Height = 192
      end
      inherited Panel4: TPanel
        Width = 128
      end
      inherited Panel6: TPanel
        Top = 222
        Width = 128
        inherited BitBtnSel: TBitBtn
          Width = 62
        end
        inherited BitBtn3: TBitBtn
          Left = 65
          Width = 62
        end
      end
    end
    inherited Panel5: TPanel
      Width = 268
      Height = 251
      inherited Panel7: TPanel
        Width = 268
        Caption = #36710#36742#25511#21046
      end
      inherited PanProgress: TPanel
        Top = 228
        Width = 268
        inherited ProgressBar1: TProgressBar
          Width = 264
        end
      end
      object RadioOil: TRadioGroup
        Left = 96
        Top = 124
        Width = 185
        Height = 73
        Caption = #27833#36335
        ItemIndex = 0
        Items.Strings = (
          #24674#22797#36710#36742#27833#36335
          #26029#24320#36710#36742#27833#36335)
        TabOrder = 2
        Visible = False
      end
      object RadioElect: TRadioGroup
        Left = 96
        Top = 208
        Width = 185
        Height = 73
        Caption = #30005#36335
        Enabled = False
        ItemIndex = 0
        Items.Strings = (
          #24674#22797#36710#36742#30005#36335
          #26029#24320#36710#36742#30005#36335)
        TabOrder = 3
        Visible = False
      end
      object RadioDoor: TRadioGroup
        Left = 47
        Top = 92
        Width = 185
        Height = 73
        Caption = #36710#38376
        ItemIndex = 0
        Items.Strings = (
          #36710#38376#35299#38145
          #36710#38376#21152#38145)
        TabOrder = 4
      end
      object RadioButton1: TRadioButton
        Left = 232
        Top = 108
        Width = 57
        Height = 17
        Caption = #27833#36335
        Checked = True
        TabOrder = 5
        TabStop = True
        Visible = False
        OnClick = RadioButton1Click
      end
      object RadioButton2: TRadioButton
        Left = 232
        Top = 192
        Width = 57
        Height = 17
        Caption = #30005#36335
        TabOrder = 6
        Visible = False
        OnClick = RadioButton2Click
      end
      object RadioButton3: TRadioButton
        Left = 240
        Top = 212
        Width = 57
        Height = 17
        Caption = #36710#38376
        TabOrder = 7
        Visible = False
        OnClick = RadioButton3Click
      end
    end
  end
end
