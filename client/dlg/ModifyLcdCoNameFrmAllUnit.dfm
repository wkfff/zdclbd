inherited ModifyLcdCoNameAllFrm: TModifyLcdCoNameAllFrm
  Left = 258
  Top = 239
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 242
  ClientWidth = 408
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel11111: TPanel
    Width = 291
    Height = 242
    inherited Panel1: TPanel
      Width = 289
    end
    inherited Panel2: TPanel
      Width = 289
      Height = 165
      inherited Label1: TLabel
        Left = 13
        Top = 27
      end
      inherited Label2: TLabel
        Left = 5
        Top = 117
      end
      inherited EditCoName: TEdit
        Left = 21
        Top = 70
      end
      object ProgressBar1: TProgressBar
        Left = 1
        Top = 144
        Width = 287
        Height = 20
        Align = alBottom
        TabOrder = 1
        Visible = False
      end
    end
    inherited Panel3: TPanel
      Top = 200
      Width = 289
      inherited BitBtnOk: TBitBtn
        Caption = #21457#36865' &S'
      end
      inherited BitBtnCancel: TBitBtn
        Caption = #21462#28040' &C'
      end
    end
  end
  object Panel4: TPanel
    Left = 291
    Top = 0
    Width = 117
    Height = 242
    Align = alRight
    Caption = 'Panel4'
    TabOrder = 1
    object Panel6: TPanel
      Left = 1
      Top = 213
      Width = 115
      Height = 28
      Align = alBottom
      BevelInner = bvLowered
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
      Height = 183
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
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 115
      Height = 29
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = ' '#21457#36865#32473#20197#19979#36710#36742#65306
      Color = 15265488
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
