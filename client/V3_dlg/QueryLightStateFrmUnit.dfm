inherited QueryLightStateFrm: TQueryLightStateFrm
  Caption = #26597#35810#39030#28783#29366#24577
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited Panel2: TPanel
      inherited BitBtn1: TBitBtn
        OnClick = BitBtn1Click
      end
    end
    inherited Panel5: TPanel
      object Label1: TLabel [0]
        Left = 88
        Top = 136
        Width = 144
        Height = 24
        Caption = #26597#35810#39030#28783#29366#24577
        Font.Charset = GB2312_CHARSET
        Font.Color = clWhite
        Font.Height = -24
        Font.Name = #38582#20070
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label2: TLabel [1]
        Left = 90
        Top = 137
        Width = 144
        Height = 24
        Caption = #26597#35810#39030#28783#29366#24577
        Font.Charset = GB2312_CHARSET
        Font.Color = clPurple
        Font.Height = -24
        Font.Name = #38582#20070
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      inherited Panel7: TPanel
        Caption = #26597#35810#39030#28783#29366#24577
      end
      object GroupBox1: TGroupBox
        Left = -144
        Top = 152
        Width = 185
        Height = 145
        Caption = #23646#24615
        TabOrder = 2
        Visible = False
        object CheckBox2: TCheckBox
          Left = 32
          Top = 104
          Width = 97
          Height = 17
          Caption = #23494#25991
          TabOrder = 0
        end
        object RadioButton1: TRadioButton
          Left = 32
          Top = 24
          Width = 113
          Height = 17
          Caption = #25968#25454#26080#21387#32553
          Checked = True
          TabOrder = 1
          TabStop = True
        end
        object RadioButton2: TRadioButton
          Left = 32
          Top = 56
          Width = 113
          Height = 17
          Caption = 'gz'#21387#32553
          TabOrder = 2
        end
      end
      object CheckBox4: TCheckBox
        Left = 114
        Top = 169
        Width = 97
        Height = 17
        Caption = #24320#21551
        Checked = True
        State = cbChecked
        TabOrder = 3
        Visible = False
        OnClick = CheckBox4Click
      end
    end
  end
end
