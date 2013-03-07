object frmNotice: TfrmNotice
  Left = 499
  Top = 350
  BorderStyle = bsNone
  Caption = #36890#30693
  ClientHeight = 162
  ClientWidth = 274
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object W7Panel1: TW7Panel
    Left = 0
    Top = 30
    Width = 274
    Height = 106
    Version = '1.0.1.0'
    Caption = 'W7Panel1'
    SolidColor = clBlack
    InnerBorders = []
    OuterBorders = []
    Style = wpsCustom
    FillStyle = pfsGradient
    ColorB = 15922157
    ColorC = clBlack
    ColorD = clBlack
    Align = alClient
    DoubleBuffered = False
    TabOrder = 0
    object AdvSmoothLabel1: TAdvSmoothLabel
      Left = 382
      Top = 177
      Width = 280
      Height = 50
      Fill.ColorMirror = clNone
      Fill.ColorMirrorTo = clNone
      Fill.BorderColor = clNone
      Fill.Rounding = 0
      Fill.ShadowOffset = 0
      Fill.Glow = gmNone
      Caption.Text = 'AdvSmoothLabel'
      Caption.Font.Charset = DEFAULT_CHARSET
      Caption.Font.Color = clWindowText
      Caption.Font.Height = -27
      Caption.Font.Name = 'Tahoma'
      Caption.Font.Style = []
      CaptionShadow.Text = 'AdvSmoothLabel'
      CaptionShadow.Font.Charset = DEFAULT_CHARSET
      CaptionShadow.Font.Color = clWindowText
      CaptionShadow.Font.Height = -27
      CaptionShadow.Font.Name = 'Tahoma'
      CaptionShadow.Font.Style = []
      Version = '1.5.0.1'
    end
    object RzBorder1: TRzBorder
      Left = 0
      Top = 0
      Width = 10
      Height = 106
      BorderOuter = fsNone
      Align = alLeft
    end
    object RzBorder2: TRzBorder
      Left = 264
      Top = 0
      Width = 10
      Height = 106
      BorderOuter = fsNone
      Align = alRight
    end
    object W7Panel4: TW7Panel
      Left = 10
      Top = 0
      Width = 254
      Height = 106
      Version = '1.0.1.0'
      Caption = 'W7Panel4'
      SolidColor = clBlack
      InnerBorders = []
      OuterBorders = []
      Style = wpsCustom
      FillStyle = pfsGradient
      ColorC = clBlack
      ColorD = clBlack
      Align = alClient
      DoubleBuffered = False
      TabOrder = 0
      object RzBorder4: TRzBorder
        Left = 0
        Top = 0
        Width = 254
        Height = 3
        BorderOuter = fsNone
        Align = alTop
      end
      object lblNoticeTitle: TRzLabel
        Left = 0
        Top = 3
        Width = 254
        Height = 13
        Align = alTop
        Caption = #20013#24515#21319#32423
        Font.Charset = GB2312_CHARSET
        Font.Color = 4210688
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object RzBorder3: TRzBorder
        Left = 0
        Top = 16
        Width = 254
        Height = 7
        BorderOuter = fsNone
        Align = alTop
      end
      object W7Panel5: TW7Panel
        Left = 0
        Top = 82
        Width = 254
        Height = 24
        Version = '1.0.1.0'
        Caption = 'W7Panel5'
        SolidColor = clBlack
        InnerBorders = []
        OuterBorders = []
        Style = wpsCustom
        FillStyle = pfsGradient
        ColorB = 16576745
        ColorC = clBlack
        ColorD = clBlack
        Align = alBottom
        DoubleBuffered = False
        TabOrder = 0
        object lblRead: TW7ActiveLabel
          Left = 208
          Top = 0
          Width = 46
          Height = 24
          Cursor = crHandPoint
          Hint = #19979#27425#19981#25552#31034
          MouseInColor = 8421440
          MouseOutColor = 4227072
          MouseInCursor = crHandPoint
          MouseOutCursor = crDefault
          Align = alRight
          AutoSize = False
          Caption = #30693#36947#20102
          Font.Charset = GB2312_CHARSET
          Font.Color = 8421440
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = [fsUnderline]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          Transparent = True
          Layout = tlCenter
          OnClick = lblReadClick
        end
      end
      object memoNotice: TRzMemo
        Left = 0
        Top = 23
        Width = 254
        Height = 59
        Align = alClient
        BevelOuter = bvNone
        BorderStyle = bsNone
        Color = 16576745
        Font.Charset = GB2312_CHARSET
        Font.Color = 16384
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        Lines.Strings = (
          '1.'#22686#21152#26381#21153#22120#65292#25552#39640#35775#38382#36895#24230#12290
          '2.'#20248#21270#30005#20449#32593#32476#12290)
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = False
        TabOrder = 1
        DisabledColor = 16577517
        FocusColor = 16577517
        ReadOnlyColor = 16576745
      end
    end
  end
  object W7Panel2: TW7Panel
    Left = 0
    Top = 0
    Width = 274
    Height = 30
    Version = '1.0.1.0'
    Caption = 'W7Panel2'
    SolidColor = clBlack
    InnerBorders = [wpbTop]
    OuterBorders = [wpbTop]
    Style = wpsCustom
    FillStyle = pfsGradient
    ColorA = 16770220
    ColorB = 15922157
    ColorC = 16770220
    ColorD = clWhite
    Align = alTop
    DoubleBuffered = False
    TabOrder = 1
    OnMouseDown = W7Panel2MouseDown
    object Image1: TImage
      Left = 4
      Top = 2
      Width = 25
      Height = 24
      Align = alCustom
      Center = True
      Transparent = True
    end
    object W7SpeedButton1: TW7SpeedButton
      Left = 251
      Top = 0
      Width = 23
      Height = 20
      Caption = #215
      Flat = True
      Light = False
      FadeInInterval = 15
      FadeOutInterval = 40
      IconSize = is16px
      ArrowType = atDown
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5978398
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Align = alCustom
      ParentFont = False
      OnClick = W7SpeedButton1Click
    end
    object RzLabel1: TRzLabel
      Left = 35
      Top = 6
      Width = 44
      Height = 17
      Caption = #36890#30693'  '
      Font.Charset = GB2312_CHARSET
      Font.Color = 28123
      Font.Height = -16
      Font.Name = #21326#25991#26032#39759
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
  end
  object W7Panel3: TW7Panel
    Left = 0
    Top = 136
    Width = 274
    Height = 26
    Version = '1.0.1.0'
    Caption = 'W7Panel1'
    SolidColor = clBlack
    InnerBorders = []
    OuterBorders = []
    Style = wpsCustom
    FillStyle = pfsGradient
    ColorA = 16775918
    ColorB = 15922157
    ColorC = clBlack
    ColorD = clBlack
    Align = alBottom
    DoubleBuffered = False
    TabOrder = 2
    object AdvSmoothLabel2: TAdvSmoothLabel
      Left = 382
      Top = 177
      Width = 280
      Height = 50
      Fill.ColorMirror = clNone
      Fill.ColorMirrorTo = clNone
      Fill.BorderColor = clNone
      Fill.Rounding = 0
      Fill.ShadowOffset = 0
      Fill.Glow = gmNone
      Caption.Text = 'AdvSmoothLabel'
      Caption.Font.Charset = DEFAULT_CHARSET
      Caption.Font.Color = clWindowText
      Caption.Font.Height = -27
      Caption.Font.Name = 'Tahoma'
      Caption.Font.Style = []
      CaptionShadow.Text = 'AdvSmoothLabel'
      CaptionShadow.Font.Charset = DEFAULT_CHARSET
      CaptionShadow.Font.Color = clWindowText
      CaptionShadow.Font.Height = -27
      CaptionShadow.Font.Name = 'Tahoma'
      CaptionShadow.Font.Style = []
      Version = '1.5.0.1'
    end
    object lblReadAll: TW7ActiveLabel
      Left = 7
      Top = 6
      Width = 61
      Height = 13
      Cursor = crHandPoint
      Hint = #26412#27425#25152#26377#36890#30693#19979#27425#19981#20877#25552#31034
      MouseInColor = 8421440
      MouseOutColor = 4227072
      MouseInCursor = crHandPoint
      MouseOutCursor = crDefault
      AutoSize = False
      Caption = #37117#30693#36947#20102
      Font.Charset = GB2312_CHARSET
      Font.Color = 8421440
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = [fsUnderline]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
      Layout = tlCenter
      OnClick = lblReadAllClick
    end
    object lblPageTip: TAdvSmoothLabel
      Left = 205
      Top = 2
      Width = 41
      Height = 20
      Fill.ColorMirror = clNone
      Fill.ColorMirrorTo = clNone
      Fill.BorderColor = clNone
      Fill.Rounding = 0
      Fill.ShadowOffset = 0
      Fill.Glow = gmNone
      Caption.Text = '10/20'
      Caption.Font.Charset = DEFAULT_CHARSET
      Caption.Font.Color = clWindowText
      Caption.Font.Height = -13
      Caption.Font.Name = 'Tahoma'
      Caption.Font.Style = []
      Caption.ColorStart = 7687936
      Caption.GradientType = gtHorizontal
      CaptionShadow.Text = 'AdvSmoothLabel'
      CaptionShadow.Font.Charset = DEFAULT_CHARSET
      CaptionShadow.Font.Color = clWindowText
      CaptionShadow.Font.Height = -27
      CaptionShadow.Font.Name = 'Tahoma'
      CaptionShadow.Font.Style = []
      Version = '1.5.0.1'
    end
    object imgNext: TImage
      Left = 248
      Top = 4
      Width = 16
      Height = 16
      Picture.Data = {
        055449636F6E0000010001001010000000002000680400001600000028000000
        1000000020000000010020000000000040040000000000000000000000000000
        00000000FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
        FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
        FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
        FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
        FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
        FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
        FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01945D00B3945D00FF
        FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
        FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01945D00FFC69400FF
        945D00FFFFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
        FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01945D00FFCC9900FF
        CC9900FF945D00FFFFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
        FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01945D00FFD19D00FF
        D19D00FFD19D00FF945D00FFFFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
        FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01945D00FFCD9800FF
        CF9A00FFD29D00FFD6A100FF945D00FFFFFFFF01FFFFFF01FFFFFF01FFFFFF01
        FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01945D00FFD29B00FF
        D59E00FFD8A100FFDBA400FF945D00FFFFFFFF01FFFFFF01FFFFFF01FFFFFF01
        FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01945D00FFE3AA00FF
        E3AA00FFE3AA00FF945D00FFFFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
        FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01945D00FFE9AF00FF
        E9AF00FF945D00FFFFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
        FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01945D00FFE9AF00FF
        945D00FFFFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
        FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01945D00B3945D00FF
        FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
        FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
        FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
        FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
        FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
        FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
        FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
        FFFFFF010000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF}
      OnClick = imgNextClick
    end
    object imgPrevious: TImage
      Left = 187
      Top = 4
      Width = 16
      Height = 16
      Picture.Data = {
        055449636F6E0000010001001010000000002000680400001600000028000000
        1000000020000000010020000000000040040000000000000000000000000000
        00000000FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
        FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
        FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
        FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
        FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
        FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
        FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
        FFFFFF01FFFFFF01945D00FF945D00B3FFFFFF01FFFFFF01FFFFFF01FFFFFF01
        FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
        FFFFFF01945D00FFC69400FF945D00FFFFFFFF01FFFFFF01FFFFFF01FFFFFF01
        FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
        945D00FFCC9900FFCC9900FF945D00FFFFFFFF01FFFFFF01FFFFFF01FFFFFF01
        FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01945D00FF
        D19D00FFD19D00FFD19D00FF945D00FFFFFFFF01FFFFFF01FFFFFF01FFFFFF01
        FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01945D00FFD7A200FF
        D6A100FFD29D00FFCF9A00FF945D00FFFFFFFF01FFFFFF01FFFFFF01FFFFFF01
        FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01945D00FFDDA600FF
        DBA400FFD8A100FFD59E00FF945D00FFFFFFFF01FFFFFF01FFFFFF01FFFFFF01
        FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01945D00FF
        E3AA00FFE3AA00FFE3AA00FF945D00FFFFFFFF01FFFFFF01FFFFFF01FFFFFF01
        FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
        945D00FFE9AF00FFE9AF00FF945D00FFFFFFFF01FFFFFF01FFFFFF01FFFFFF01
        FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
        FFFFFF01945D00FFE9AF00FF945D00FFFFFFFF01FFFFFF01FFFFFF01FFFFFF01
        FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
        FFFFFF01FFFFFF01945D00FF945D00B3FFFFFF01FFFFFF01FFFFFF01FFFFFF01
        FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
        FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
        FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
        FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
        FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
        FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01
        FFFFFF010000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
        0000FFFF}
      OnClick = imgPreviousClick
    end
  end
end
