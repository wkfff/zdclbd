object frmReplyGovInfo: TfrmReplyGovInfo
  Left = 512
  Top = 287
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #22238#22797#25919#24220#24179#21488#20449#24687
  ClientHeight = 278
  ClientWidth = 378
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
    Width = 378
    Height = 278
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = 16382438
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 20
      Width = 60
      Height = 13
      Caption = #22238#22797#20869#23481#65306
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object RzBitBtn1: TRzBitBtn
      Left = 88
      Top = 237
      Caption = #22238#22797
      Color = 15987661
      HotTrack = True
      TabOrder = 0
      OnClick = RzBitBtn1Click
    end
    object RzBitBtn2: TRzBitBtn
      Left = 240
      Top = 237
      Cancel = True
      ModalResult = 2
      Caption = #21462#28040
      Color = 15987661
      HotTrack = True
      TabOrder = 1
      NumGlyphs = 2
    end
    object Memo1: TMemo
      Left = 16
      Top = 44
      Width = 346
      Height = 180
      MaxLength = 500
      ScrollBars = ssBoth
      TabOrder = 2
    end
  end
end
