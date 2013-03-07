inherited SetUpdateDevAllFrm: TSetUpdateDevAllFrm
  BorderStyle = bsSingle
  ClientHeight = 278
  ClientWidth = 433
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 317
    Height = 278
    BevelOuter = bvNone
    inherited Panel2: TPanel
      Left = 0
      Top = 33
      Width = 317
      Height = 212
      inherited Panel5: TPanel
        Left = 131
        Width = 185
        Height = 189
        Caption = #12288
        inherited Memo1: TMemo
          Width = 185
          Height = 160
        end
        inherited Panel6: TPanel
          Width = 185
          Hint = #21319#32423#30340#36164#28304#22320#22336
          BevelInner = bvRaised
          BevelOuter = bvLowered
        end
      end
      inherited Panel4: TPanel
        Width = 130
        Height = 189
        BevelInner = bvNone
        BevelOuter = bvNone
        inherited RadioGroup1: TRadioGroup
          Left = 1
          Top = 9
          Width = 128
          Height = 148
          Items.Strings = (
            '0 '#21319#32423#20027#26426
            '1 '#21319#32423#35843#24230#23631
            '2 '#21319#32423'POS'#26426
            '3 '#21319#32423#35745#20215#22120
            '4 '#21319#32423'LED'#26174#31034#23631)
        end
      end
      object ProgressBar1: TProgressBar
        Left = 1
        Top = 190
        Width = 315
        Height = 21
        Align = alBottom
        TabOrder = 2
        Visible = False
      end
    end
    inherited Panel3: TPanel
      Left = 0
      Top = 0
      Width = 317
    end
    inherited Panel7: TPanel
      Left = 0
      Top = 245
      Width = 317
      inherited BitBtnOk: TBitBtn
        Left = 76
        Caption = #21457#36865' &S'
      end
      inherited BitBtnCancel: TBitBtn
        Left = 159
        Cancel = True
        Caption = #21462#28040' &C'
      end
    end
  end
  object Panel8: TPanel
    Left = 317
    Top = 0
    Width = 116
    Height = 278
    Align = alRight
    Caption = 'Panel8'
    TabOrder = 1
    object Panel9: TPanel
      Left = 1
      Top = 245
      Width = 114
      Height = 32
      Align = alBottom
      BevelInner = bvLowered
      BevelOuter = bvNone
      TabOrder = 0
      object BitBtn3: TBitBtn
        Left = 58
        Top = 4
        Width = 55
        Height = 25
        Hint = #21024#38500#25152#36873#30340#36710#36742
        Caption = #21024#38500
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = BitBtn3Click
      end
      object BitBtnSel: TBitBtn
        Left = 2
        Top = 4
        Width = 55
        Height = 25
        Hint = #37325#26032#36873#25321#36710#36742
        Caption = #37325#26032#36873#25321
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = BitBtnSelClick
      end
    end
    object ListView1: TListView
      Left = 1
      Top = 30
      Width = 114
      Height = 215
      Align = alClient
      Columns = <
        item
          AutoSize = True
          Caption = #36710#29260#21495
        end>
      GridLines = True
      MultiSelect = True
      ReadOnly = True
      RowSelect = True
      TabOrder = 1
      ViewStyle = vsReport
    end
    object Panel10: TPanel
      Left = 1
      Top = 1
      Width = 114
      Height = 29
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = ' '#21457#36865#32473#20197#19979#36710#36742#65306
      Color = clMoneyGreen
      Font.Charset = GB2312_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
  end
end
