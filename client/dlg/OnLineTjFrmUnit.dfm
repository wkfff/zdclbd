object OnLineTjFrm: TOnLineTjFrm
  Left = 637
  Top = 513
  Width = 464
  Height = 235
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #22312#32447#29575#32479#35745
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
    Width = 456
    Height = 208
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 0
    object PageControl2: TPageControl
      Left = 1
      Top = 1
      Width = 454
      Height = 180
      Align = alClient
      DockSite = True
      TabOrder = 0
    end
    object TreeView1: TTreeView
      Left = 1
      Top = 1
      Width = 454
      Height = 180
      Align = alClient
      BevelKind = bkFlat
      Color = 15792327
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      HideSelection = False
      Indent = 19
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      RightClickSelect = True
      ShowHint = False
      TabOrder = 1
      OnChange = TreeView1Change
    end
    object Panel2: TPanel
      Left = 1
      Top = 181
      Width = 454
      Height = 26
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
    end
  end
end
