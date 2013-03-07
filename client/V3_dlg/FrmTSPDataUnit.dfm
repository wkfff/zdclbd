inherited frmTSPData: TfrmTSPData
  Left = 393
  Top = 291
  Caption = #25968#25454#19979#34892#36879#20256
  ClientHeight = 241
  ClientWidth = 357
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Top = 210
    Width = 357
    inherited BitBtn1: TBitBtn
      Caption = #21457#36865'(&S)'
    end
    inherited BitBtn2: TBitBtn
      Left = 197
      Caption = #21462#28040'(&C)'
    end
  end
  inherited Panel_Devs: TPanel
    Width = 357
    Height = 210
    inherited Panel6: TPanel
      Width = 233
      Height = 208
      object Label1: TLabel [0]
        Left = 6
        Top = 183
        Width = 65
        Height = 13
        Caption = #25968#25454#31867#22411#65306
      end
      object Label2: TLabel [1]
        Left = 144
        Top = 184
        Width = 51
        Height = 11
        Caption = #19981#22823#20110'255'
        Font.Charset = GB2312_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      inherited Panel8: TPanel
        Width = 231
        Height = 22
        Alignment = taLeftJustify
        Caption = #36879#20256#25968#25454#20869#23481#65306
        Font.Height = -13
      end
      object Memo1: TMemo
        Left = 1
        Top = 23
        Width = 231
        Height = 146
        TabOrder = 1
      end
      object Edit1: TEdit
        Left = 71
        Top = 179
        Width = 67
        Height = 21
        MaxLength = 3
        TabOrder = 2
        Text = '1'
        OnKeyPress = Edit1KeyPress
      end
    end
    inherited Panel4: TPanel
      Left = 145
      Top = 11
    end
    inherited Panel1: TPanel
      Left = 234
      Width = 122
      Height = 208
      inherited ListView1: TListView
        Width = 120
        Height = 174
      end
      inherited Panel5: TPanel
        Top = 175
        Width = 120
        Height = 32
        inherited BitBtnSel: TBitBtn
          Left = 1
          Top = 5
          Width = 69
          Height = 23
        end
        inherited BitBtn3: TBitBtn
          Left = 70
          Top = 5
          Width = 49
          Height = 23
        end
      end
    end
  end
end
