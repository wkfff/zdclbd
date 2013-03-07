inherited frmSend: TfrmSend
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #36879#20256#25968#25454
  ClientHeight = 473
  ClientWidth = 552
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 552
    Height = 473
    inherited Panel2: TPanel
      Top = 435
      Width = 552
      inherited BitBtn1: TBitBtn
        Left = 147
        OnClick = BitBtn1Click
      end
      inherited BitBtn2: TBitBtn
        Left = 244
      end
    end
    inherited Panel3: TPanel
      Left = 435
      Height = 435
      inherited ListView1: TListView
        Height = 376
      end
      inherited Panel6: TPanel
        Top = 406
      end
    end
    inherited Panel5: TPanel
      Width = 435
      Height = 435
      object Label1: TLabel [0]
        Left = 8
        Top = 120
        Width = 36
        Height = 13
        Caption = #21457#36865#65306
      end
      object Label2: TLabel [1]
        Left = 8
        Top = 256
        Width = 36
        Height = 13
        Caption = #25509#25910#65306
      end
      object Label3: TLabel [2]
        Left = 8
        Top = 72
        Width = 36
        Height = 13
        Caption = #22806#35774#65306
      end
      inherited Panel7: TPanel
        Width = 435
        Caption = #36879#20256#25968#25454
      end
      inherited PanProgress: TPanel
        Top = 412
        Width = 435
        inherited ProgressBar1: TProgressBar
          Width = 431
        end
      end
      object Memo1: TMemo
        Left = 52
        Top = 120
        Width = 369
        Height = 121
        ScrollBars = ssVertical
        TabOrder = 2
      end
      object Memo2: TMemo
        Left = 52
        Top = 256
        Width = 369
        Height = 121
        ScrollBars = ssVertical
        TabOrder = 3
      end
      object RadioButton1: TRadioButton
        Left = 64
        Top = 70
        Width = 57
        Height = 17
        Caption = 'TSM'
        Checked = True
        TabOrder = 4
        TabStop = True
      end
      object RadioButton2: TRadioButton
        Left = 130
        Top = 70
        Width = 49
        Height = 17
        Caption = #39030#28783
        TabOrder = 5
      end
      object RadioButton3: TRadioButton
        Left = 200
        Top = 70
        Width = 65
        Height = 17
        Caption = #35745#20215#22120
        TabOrder = 6
      end
      object RadioButton4: TRadioButton
        Left = 284
        Top = 70
        Width = 57
        Height = 17
        Caption = 'LCD'
        TabOrder = 7
      end
      object RadioButton5: TRadioButton
        Left = 352
        Top = 70
        Width = 49
        Height = 17
        Caption = 'LED'
        TabOrder = 8
      end
    end
  end
end
