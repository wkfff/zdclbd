object dlgDriverCancelOrder: TdlgDriverCancelOrder
  Left = 479
  Top = 214
  Width = 331
  Height = 281
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #39550#39542#21592#35831#27714#21462#28040#35746#21333
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 323
    Height = 254
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Panel2: TPanel
      Left = 2
      Top = 210
      Width = 319
      Height = 42
      Align = alBottom
      BevelInner = bvLowered
      TabOrder = 0
      object btnAgree: TBitBtn
        Left = 72
        Top = 8
        Width = 75
        Height = 25
        Hint = #21516#24847#21462#28040#65292#24182#37325#26032#19979#21457#35746#21333
        Caption = #21516#24847
        TabOrder = 0
        OnClick = btnAgreeClick
        Kind = bkOK
      end
      object btnDisagree: TBitBtn
        Left = 192
        Top = 8
        Width = 75
        Height = 25
        Caption = #19981#21516#24847
        TabOrder = 1
        OnClick = btnDisagreeClick
        Kind = bkCancel
      end
    end
    object Panel3: TPanel
      Left = 2
      Top = 2
      Width = 319
      Height = 17
      Align = alTop
      TabOrder = 1
      object Label1: TLabel
        Left = 1
        Top = 1
        Width = 317
        Height = 15
        Align = alClient
        Caption = #35746#21333#20449#24687#65306
      end
    end
    object Panel4: TPanel
      Left = 2
      Top = 19
      Width = 319
      Height = 191
      Align = alClient
      TabOrder = 2
      object Label2: TLabel
        Left = 22
        Top = 72
        Width = 72
        Height = 13
        Caption = #35831#27714#36710#29260#21495#65306
      end
      object Label3: TLabel
        Left = 8
        Top = 6
        Width = 84
        Height = 13
        Caption = #35746#21333#19994#21153#25551#36848#65306
      end
      object edtCarNo: TEdit
        Left = 100
        Top = 69
        Width = 121
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 0
      end
      object mmoOrderDes: TMemo
        Left = 100
        Top = 5
        Width = 185
        Height = 53
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 1
      end
      object rgCancelReason: TRadioGroup
        Left = 100
        Top = 100
        Width = 121
        Height = 63
        Caption = #35831#27714#21462#28040#21407#22240
        Enabled = False
        ItemIndex = 0
        Items.Strings = (
          #20107#25925
          #22581#36710
          #20854#20182)
        TabOrder = 2
      end
    end
  end
end
