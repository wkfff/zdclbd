object ReadGPRSFluxForm: TReadGPRSFluxForm
  Left = 256
  Top = 170
  Width = 514
  Height = 389
  Caption = #36710#26426'GPRS'#27969#37327
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 506
    Height = 41
    Align = alTop
    Caption = #36710#26426'GPRS'#27969#37327
    Font.Charset = ANSI_CHARSET
    Font.Color = clGreen
    Font.Height = -24
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 506
    Height = 280
    Align = alClient
    TabOrder = 1
    object ListView1: TListView
      Left = 1
      Top = 1
      Width = 504
      Height = 278
      Align = alClient
      Columns = <
        item
          AutoSize = True
          Caption = #36710#29260#21495
        end
        item
          Caption = #36830#25509#21495
          Width = 80
        end
        item
          Caption = #19978#34892
          Width = 100
        end
        item
          Caption = #19979#34892
          Width = 100
        end
        item
          Caption = #21512#35745
          Width = 100
        end>
      GridLines = True
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 321
    Width = 506
    Height = 41
    Align = alBottom
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 400
      Top = 8
      Width = 75
      Height = 25
      Caption = #20851#38381'&C'
      TabOrder = 0
      Kind = bkClose
    end
  end
end
