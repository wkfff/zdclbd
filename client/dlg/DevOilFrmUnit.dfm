inherited DevOilFrm: TDevOilFrm
  Left = 404
  Top = 120
  Caption = #35774#32622#29702#35770#27833#32791
  ClientWidth = 358
  FormStyle = fsNormal
  OldCreateOrder = True
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Width = 358
    inherited BitBtn1: TBitBtn
      Caption = #35774#32622
    end
  end
  inherited Panel_Devs: TPanel
    Width = 358
    Caption = ''
    object Label1: TLabel [0]
      Left = 319
      Top = 136
      Width = 13
      Height = 13
      AutoSize = False
      Caption = #31186
    end
    inherited Panel4: TPanel
      Left = 245
      Top = 105
      Width = 56
      Caption = #36861#36394#38388#38548':'
    end
    inherited BitBtnSel: TBitBtn
      TabOrder = 3
    end
    object Edit1: TEdit [4]
      Left = 256
      Top = 130
      Width = 60
      Height = 21
      TabOrder = 2
      Text = 'Edit1'
      OnKeyPress = Edit1KeyPress
    end
    inherited Panel1: TPanel
      Left = 167
      TabOrder = 4
      inherited ListView1: TListView
        Height = 157
        OnClick = ListView1Click
      end
      object ProgressBar1: TProgressBar
        Left = 1
        Top = 158
        Width = 188
        Height = 19
        Align = alBottom
        TabOrder = 1
        Visible = False
      end
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 152
      Height = 84
      Caption = #35774#32622#29702#35770#27833#32791
      TabOrder = 5
      object Label2: TLabel
        Left = 8
        Top = 22
        Width = 78
        Height = 13
        Caption = #27599#20844#37324#27833#32791#65306
      end
      object Label3: TLabel
        Left = 103
        Top = 50
        Width = 13
        Height = 13
        Caption = #21319
      end
      object Edit2: TEdit
        Left = 11
        Top = 46
        Width = 86
        Height = 21
        TabOrder = 0
        Text = '10'
        OnKeyPress = Edit2KeyPress
      end
    end
  end
  inherited Panel8: TPanel
    Width = 358
    Caption = #35774#32622#29702#35770#27833#32791
  end
end
