object DealideaFrm: TDealideaFrm
  Left = 412
  Top = 297
  BorderIcons = [biSystemMenu, biHelp]
  BorderStyle = bsDialog
  Caption = #20010#20154#24847#35265
  ClientHeight = 204
  ClientWidth = 404
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 404
    Height = 204
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 40
      Top = 64
      Width = 74
      Height = 13
      Caption = #22788#29702#20154#24847#35265#65306
    end
    object Memo1: TMemo
      Left = 120
      Top = 32
      Width = 233
      Height = 89
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 96
      Top = 160
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 1
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 216
      Top = 160
      Width = 75
      Height = 25
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 2
    end
  end
end
