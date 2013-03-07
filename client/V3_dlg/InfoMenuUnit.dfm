object InfoMenu: TInfoMenu
  Left = 740
  Top = 333
  Width = 329
  Height = 217
  BorderIcons = [biSystemMenu]
  Caption = #20449#24687#33756#21333
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 321
    Height = 190
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 44
      Top = 61
      Width = 60
      Height = 13
      Caption = #20449#24687#20869#23481#65306
    end
    object Label2: TLabel
      Left = 44
      Top = 25
      Width = 60
      Height = 13
      Caption = #20449#24687#31867#22411#65306
    end
    object Label3: TLabel
      Left = 232
      Top = 25
      Width = 24
      Height = 13
      Caption = '<256'
    end
    object memInfo: TMemo
      Left = 107
      Top = 58
      Width = 185
      Height = 66
      MaxLength = 20
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object btnOK: TBitBtn
      Left = 64
      Top = 136
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 1
      OnClick = btnOKClick
    end
    object btnCancel: TBitBtn
      Left = 200
      Top = 136
      Width = 75
      Height = 25
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 2
    end
    object EditMenuNO: TEdit
      Left = 107
      Top = 21
      Width = 121
      Height = 21
      TabOrder = 3
      Text = '0'
      OnChange = EditMenuNOChange
      OnKeyPress = EditMenuNOKeyPress
    end
    object editMenuId: TEdit
      Left = 279
      Top = 3
      Width = 121
      Height = 21
      TabOrder = 4
      Visible = False
    end
  end
end
