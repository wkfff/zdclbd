object LCDMenuFrm: TLCDMenuFrm
  Left = 241
  Top = 191
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #20462#25913#26174#31034#23631#22266#23450#33756#21333
  ClientHeight = 332
  ClientWidth = 426
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 426
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    Caption = #20462#25913#26174#31034#23631#22266#23450#33756#21333
    Color = clMoneyGreen
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 296
    Width = 426
    Height = 36
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 1
    object BitBtnSend: TBitBtn
      Left = 234
      Top = 6
      Width = 75
      Height = 25
      Caption = #21457#36865' &S'
      TabOrder = 0
      OnClick = BitBtnSendClick
    end
    object BitBtnCancel: TBitBtn
      Left = 332
      Top = 6
      Width = 75
      Height = 25
      Caption = #21462#28040' &C'
      TabOrder = 1
      OnClick = BitBtnCancelClick
      Kind = bkCancel
    end
  end
  object Panel3: TPanel
    Left = 306
    Top = 41
    Width = 120
    Height = 255
    Align = alRight
    BevelInner = bvLowered
    TabOrder = 2
    object Label1: TLabel
      Left = 4
      Top = 6
      Width = 113
      Height = 16
      AutoSize = False
      Caption = #33756#21333#30340#20869#23481':'
    end
    object BitBtnAdd: TBitBtn
      Left = 7
      Top = 120
      Width = 107
      Height = 25
      Hint = #28155#21152#23376#33756#21333
      Caption = #28155#21152' &A'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BitBtnAddClick
    end
    object BitBtnInsert: TBitBtn
      Left = 7
      Top = 144
      Width = 107
      Height = 25
      Caption = #25554#20837' &I'
      TabOrder = 1
      OnClick = BitBtnInsertClick
    end
    object BitBtnEdit: TBitBtn
      Left = 7
      Top = 168
      Width = 107
      Height = 25
      Caption = #20462#25913' &E'
      TabOrder = 2
      OnClick = BitBtnEditClick
    end
    object BitBtnDel: TBitBtn
      Left = 7
      Top = 192
      Width = 107
      Height = 25
      Caption = #21024#38500' &D'
      TabOrder = 3
      OnClick = BitBtnDelClick
    end
    object EditMenu: TMemo
      Left = 7
      Top = 24
      Width = 107
      Height = 89
      Lines.Strings = (
        'EditMenu')
      MaxLength = 39
      TabOrder = 4
      OnChange = EditMenuChange
    end
    object BitBtnClear: TBitBtn
      Left = 8
      Top = 224
      Width = 105
      Height = 25
      Caption = #28165#38500' &C'
      TabOrder = 5
      OnClick = BitBtnClearClick
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 41
    Width = 306
    Height = 255
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 3
    object TreeView1: TTreeView
      Left = 2
      Top = 2
      Width = 302
      Height = 251
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      HideSelection = False
      Indent = 19
      ParentFont = False
      PopupMenu = PopupMenu1
      ReadOnly = True
      TabOrder = 0
      OnEdited = TreeView1Edited
      Items.Data = {
        01000000230000000000000000000000FFFFFFFFFFFFFFFF0000000000000000
        0ACFD4CABEC6C1B2CBB5A5}
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 160
    Top = 145
    object A1: TMenuItem
      Caption = #28155#21152' &A'
      Visible = False
      OnClick = BitBtnAddClick
    end
    object I1: TMenuItem
      Caption = #25554#20837' &I'
      Visible = False
      OnClick = BitBtnInsertClick
    end
    object E1: TMenuItem
      Caption = #20462#25913' &E'
      OnClick = BitBtnEditClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object D1: TMenuItem
      Caption = #21024#38500' &D'
      OnClick = BitBtnDelClick
    end
    object N2: TMenuItem
      Caption = #28165#38500' &C'
      OnClick = BitBtnClearClick
    end
  end
end
