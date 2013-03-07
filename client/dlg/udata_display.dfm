object data_display: Tdata_display
  Left = 377
  Top = 349
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsNone
  Caption = #25968#25454#26174#31034
  ClientHeight = 150
  ClientWidth = 177
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 177
    Height = 125
    Hint = #26597#30475#28857#30340#20449#24687
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvSpace
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 80
      Top = 53
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'BitBtn1'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object StringGrid1: TStringGrid
      Left = 2
      Top = 21
      Width = 173
      Height = 102
      Align = alClient
      BorderStyle = bsNone
      Color = clWhite
      ColCount = 2
      Ctl3D = False
      DefaultColWidth = 105
      DefaultRowHeight = 18
      FixedCols = 0
      RowCount = 2
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goRowSizing, goColSizing, goRowSelect]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      OnDblClick = StringGrid1DblClick
      OnMouseDown = StringGrid1MouseDown
      ColWidths = (
        67
        105)
    end
    object Panel2: TPanel
      Left = 2
      Top = 2
      Width = 173
      Height = 19
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvSpace
      BevelOuter = bvNone
      Caption = 'Panel2'
      Color = 15792327
      TabOrder = 2
      object Panel4: TPanel
        Left = 154
        Top = 1
        Width = 18
        Height = 17
        Hint = #20851#38381#36710#36742#20449#24687
        Align = alRight
        Caption = 'X'
        Color = 10154466
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'System'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = Panel4Click
      end
    end
  end
  object PanelLayerInfo: TPanel
    Left = 0
    Top = 125
    Width = 177
    Height = 25
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    Visible = False
    object SpeedButtonUp: TSpeedButton
      Left = 0
      Top = 3
      Width = 23
      Height = 22
      Caption = '<<'
      OnClick = SpeedButtonUpClick
    end
    object SpeedButtonDown: TSpeedButton
      Left = 22
      Top = 3
      Width = 23
      Height = 22
      Caption = '>>'
      OnClick = SpeedButtonDownClick
    end
    object SpeedButtonList: TSpeedButton
      Left = 44
      Top = 3
      Width = 33
      Height = 22
      Caption = #21015#34920
      OnClick = SpeedButtonListClick
    end
    object LabelLayerName: TLabel
      Left = 78
      Top = 7
      Width = 98
      Height = 13
      Alignment = taRightJustify
      Caption = 'LabelLayerName'
      Color = clBtnFace
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Visible = False
    end
  end
end
