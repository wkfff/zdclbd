object ReadLCDMenuFrm: TReadLCDMenuFrm
  Left = 296
  Top = 215
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #35835#21462#21040#36710#26426#23384#20648#30340#22266#23450#33756#21333
  ClientHeight = 486
  ClientWidth = 665
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel5: TPanel
    Left = 273
    Top = 46
    Width = 392
    Height = 440
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel5'
    TabOrder = 0
    object Panel3: TPanel
      Left = 272
      Top = 37
      Width = 120
      Height = 367
      Align = alRight
      BevelInner = bvLowered
      TabOrder = 0
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
      object BitBtnReLodOld: TBitBtn
        Left = 8
        Top = 282
        Width = 104
        Height = 26
        Hint = #37325#26032#36733#20837#31995#32479#20013#30340#22266#23450#33756#21333
        Caption = #37325#26032#36733#20837
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = BitBtnReLodOldClick
      end
      object BitBtnClear: TBitBtn
        Left = 8
        Top = 227
        Width = 105
        Height = 25
        Caption = #28165#38500' &C'
        TabOrder = 6
        OnClick = BitBtnClearClick
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 404
      Width = 392
      Height = 36
      Align = alBottom
      BevelInner = bvLowered
      TabOrder = 1
      object BitBtnSend: TBitBtn
        Left = 213
        Top = 6
        Width = 85
        Height = 25
        Hint = #35774#32622#22266#23450#33756#21333#21040#36710#26426
        Caption = #35774#32622' &S'
        TabOrder = 0
        OnClick = BitBtnSendClick
      end
      object BitBtnCancel: TBitBtn
        Left = 297
        Top = 6
        Width = 75
        Height = 25
        Caption = #21462#28040' &C'
        TabOrder = 1
        OnClick = BitBtnCancelClick
        Kind = bkCancel
      end
    end
    object Panel6: TPanel
      Left = 0
      Top = 0
      Width = 392
      Height = 37
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvSpace
      BevelOuter = bvLowered
      Caption = ' '#31995#32479#20013#30340#65306
      Color = 9157775
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object TreeView1: TTreeView
      Left = 0
      Top = 37
      Width = 272
      Height = 367
      Align = alClient
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      HideSelection = False
      Indent = 19
      ParentFont = False
      PopupMenu = PopupMenu1
      ReadOnly = True
      TabOrder = 3
      OnEdited = TreeView1Edited
      Items.Data = {
        01000000230000000000000000000000FFFFFFFFFFFFFFFF0000000000000000
        0ACFD4CABEC6C1B2CBB5A5}
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 665
    Height = 46
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    Caption = #35835#21462#21040#36710#26426#23384#20648#30340#22266#23450#33756#21333
    Color = 12609027
    Font.Charset = GB2312_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Label2: TLabel
      Left = 7
      Top = 25
      Width = 52
      Height = 13
      Caption = #36710#29260#21495#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object EditCarNO: TEdit
      Left = 52
      Top = 20
      Width = 77
      Height = 21
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'EditCarNO'
    end
  end
  object PanelReaded: TPanel
    Left = 0
    Top = 46
    Width = 273
    Height = 440
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 2
    object TreeViewReaded: TTreeView
      Left = 0
      Top = 37
      Width = 273
      Height = 403
      Align = alClient
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      HideSelection = False
      Indent = 19
      ParentFont = False
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      OnClick = TreeViewReadedClick
      OnEdited = TreeView1Edited
      Items.Data = {
        01000000230000000000000000000000FFFFFFFFFFFFFFFF0000000000000000
        0ACFD4CABEC6C1B2CBB5A5}
    end
    object Panel10: TPanel
      Left = 0
      Top = 0
      Width = 273
      Height = 37
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvSpace
      BevelOuter = bvLowered
      Caption = ' '#35835#21462#21040#36710#26426#23384#20648#30340#65306
      Color = 4707838
      Font.Charset = ANSI_CHARSET
      Font.Color = 5263440
      Font.Height = -16
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 352
    Top = 161
    object N3: TMenuItem
      Caption = #37325#26032#36733#20837#31995#32479#20013#30340#22266#23450#33756#21333
      Hint = #37325#26032#36733#20837#31995#32479#20013#30340#22266#23450#33756#21333
      OnClick = BitBtnReLodOldClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
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
    object c1: TMenuItem
      Caption = #28165#38500' &C'
      OnClick = BitBtnClearClick
    end
  end
end
