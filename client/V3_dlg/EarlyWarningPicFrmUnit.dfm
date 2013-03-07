object EarlyWarningPicFrm: TEarlyWarningPicFrm
  Left = 1016
  Top = 179
  Width = 264
  Height = 592
  Caption = #36710#36742#39044#35686#29031#29255
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnDeactivate = FormDeactivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 256
    Height = 565
    Align = alClient
    Alignment = taLeftJustify
    TabOrder = 0
    object Splitter5: TSplitter
      Left = 1
      Top = 186
      Width = 254
      Height = 4
      Cursor = crVSplit
      Align = alTop
      Beveled = True
    end
    object Splitter6: TSplitter
      Left = 1
      Top = 375
      Width = 254
      Height = 4
      Cursor = crVSplit
      Align = alBottom
      Beveled = True
    end
    object GroupBox5: TGroupBox
      Left = 1
      Top = 1
      Width = 254
      Height = 185
      Align = alTop
      Caption = #29031#29255'1'
      TabOrder = 0
      object Panel5: TPanel
        Left = 2
        Top = 15
        Width = 250
        Height = 168
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Image1: TImage
          Left = 0
          Top = 0
          Width = 250
          Height = 168
          Align = alClient
        end
      end
    end
    object GroupBox6: TGroupBox
      Left = 1
      Top = 190
      Width = 254
      Height = 185
      Align = alClient
      Caption = #29031#29255'2'
      TabOrder = 1
      object Panel6: TPanel
        Left = 2
        Top = 15
        Width = 250
        Height = 168
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Image2: TImage
          Left = 0
          Top = 0
          Width = 250
          Height = 168
          Align = alClient
        end
      end
    end
    object GroupBox7: TGroupBox
      Left = 1
      Top = 379
      Width = 254
      Height = 185
      Align = alBottom
      Caption = #29031#29255'3'
      TabOrder = 2
      object Panel7: TPanel
        Left = 2
        Top = 15
        Width = 250
        Height = 168
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Image3: TImage
          Left = 0
          Top = 0
          Width = 250
          Height = 168
          Align = alClient
        end
      end
    end
  end
  object TimerShow: TTimer
    Enabled = False
    Interval = 1
    OnTimer = TimerShowTimer
    Left = 149
    Top = 81
  end
  object TimerClose: TTimer
    Enabled = False
    Interval = 1
    OnTimer = TimerCloseTimer
    Left = 141
    Top = 41
  end
end
