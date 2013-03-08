inherited frmUpgradeTerminal: TfrmUpgradeTerminal
  Left = 485
  Top = 311
  Width = 407
  Height = 314
  Caption = #21319#32423#32456#31471
  PixelsPerInch = 96
  TextHeight = 13
  inherited RzPanel1: TRzPanel
    Top = 239
    Width = 399
    inherited RzBitBtn1: TRzBitBtn
      Left = 133
      Top = 9
      OnClick = RzBitBtn1Click
    end
    inherited RzBitBtn2: TRzBitBtn
      Left = 245
      Top = 9
    end
  end
  inherited RzPanel2: TRzPanel
    Left = 265
    Height = 239
    inherited RzPanel4: TRzPanel
      Top = 210
    end
    inherited ListView1: TListView
      Height = 183
    end
  end
  inherited RzPanel3: TRzPanel
    Width = 265
    Height = 239
    object Label1: TLabel
      Left = 16
      Top = 185
      Width = 248
      Height = 26
      Caption = #35828#26126#65306#26412#21151#33021#21482#38024#23545#21271#26007#35774#22791#26377#25928#65292#36873#25321#38750#21271#26007#35774#22791#35813#21629#20196#19981#19979#21457
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
    end
    object RzGroupBox1: TRzGroupBox
      Left = 9
      Top = 15
      Width = 247
      Height = 154
      Caption = #21319#32423#36873#39033
      TabOrder = 0
      Transparent = True
      object Label2: TLabel
        Left = 14
        Top = 32
        Width = 63
        Height = 13
        Caption = #21319#32423#31867#22411#65306' '
        Transparent = True
      end
      object Label3: TLabel
        Left = 15
        Top = 76
        Width = 62
        Height = 13
        Caption = #21046#36896#21830'ID'#65306' '
        Transparent = True
      end
      object Label4: TLabel
        Left = 14
        Top = 120
        Width = 63
        Height = 13
        Caption = #21319#32423#29256#26412#65306' '
        Transparent = True
      end
      object cbxUpgradeType: TRzComboBox
        Left = 77
        Top = 28
        Width = 152
        Height = 21
        Ctl3D = False
        FrameVisible = True
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 0
      end
      object cbxMID: TRzComboBox
        Left = 77
        Top = 72
        Width = 152
        Height = 21
        Ctl3D = False
        FrameVisible = True
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 1
      end
      object cbxUpgradeVer: TRzComboBox
        Left = 77
        Top = 116
        Width = 152
        Height = 21
        Ctl3D = False
        FrameVisible = True
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 2
      end
    end
    object ProgressBar1: TProgressBar
      Left = 0
      Top = 222
      Width = 265
      Height = 17
      Align = alBottom
      TabOrder = 1
      Visible = False
    end
  end
end
