inherited LCDMenuALLFrm: TLCDMenuALLFrm
  Left = 209
  Top = 187
  BorderStyle = bsSingle
  ClientHeight = 365
  ClientWidth = 525
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 525
  end
  inherited Panel2: TPanel
    Top = 329
    Width = 525
    inherited BitBtnSend: TBitBtn
      Left = 338
    end
    inherited BitBtnCancel: TBitBtn
      Left = 428
    end
    object ProgressBar1: TProgressBar
      Left = 8
      Top = 8
      Width = 321
      Height = 21
      TabOrder = 2
      Visible = False
    end
  end
  inherited Panel3: TPanel
    Left = 288
    Height = 288
  end
  inherited Panel4: TPanel
    Width = 288
    Height = 288
    inherited TreeView1: TTreeView
      Width = 284
      Height = 284
    end
  end
  object Panel5: TPanel [4]
    Left = 408
    Top = 41
    Width = 117
    Height = 288
    Align = alRight
    Caption = 'Panel5'
    TabOrder = 4
    object Panel6: TPanel
      Left = 1
      Top = 259
      Width = 115
      Height = 28
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      object BitBtn3: TBitBtn
        Left = 58
        Top = 2
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
        Top = 2
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
      Width = 115
      Height = 229
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
      OnClick = ListView1Click
    end
    object Panel7: TPanel
      Left = 1
      Top = 1
      Width = 115
      Height = 29
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = ' '#21457#36865#32473#20197#19979#36710#36742#65306
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
