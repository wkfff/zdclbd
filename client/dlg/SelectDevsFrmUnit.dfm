inherited SelectDevsFrm: TSelectDevsFrm
  Left = 211
  Top = 178
  Caption = 'SelectDevsFrm'
  ClientHeight = 480
  ClientWidth = 417
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Splitter1: TSplitter
    Left = 312
    Top = 31
    Height = 449
  end
  inherited Panel1: TPanel
    Top = 31
    Width = 287
    Height = 449
    inherited Splitter2: TSplitter
      Left = 183
      Height = 421
    end
    inherited TreeView1: TTreeView
      Width = 182
      Height = 421
    end
    inherited Panel4: TPanel
      Width = 285
    end
    inherited FromList: TcxTreeList
      Left = 186
      Width = 100
      Height = 421
    end
  end
  inherited Panel2: TPanel
    Left = 315
    Top = 31
    Width = 102
    Height = 449
    inherited Panel5: TPanel
      Width = 100
    end
    inherited DestList: TcxTreeList
      Width = 100
      Height = 421
    end
  end
  inherited Panel3: TPanel
    Left = 287
    Top = 31
    Width = 25
    Height = 449
    inherited BitBtn_AddSelect: TBitBtn
      Width = 23
      Height = 25
    end
    inherited BitBtn_AddAllList: TBitBtn
      Top = 97
      Width = 23
      Height = 25
    end
    inherited BitBtn1: TBitBtn
      TabOrder = 4
    end
    inherited BitBtn2: TBitBtn
      TabOrder = 5
    end
    object BitBtnDel: TBitBtn
      Left = 2
      Top = 137
      Width = 23
      Height = 25
      Action = AddSelect
      Caption = '<'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
    object BitBtnDelAll: TBitBtn
      Left = 2
      Top = 169
      Width = 23
      Height = 25
      Action = AddAll
      Caption = '<<'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
  end
  inherited Panel6: TPanel
    Left = 56
    Top = 192
    Width = 41
    Align = alNone
    Visible = False
  end
  inherited Panel7: TPanel
    Width = 417
    Height = 31
    Visible = False
  end
  inherited ActionList1: TActionList
    Left = 56
    Top = 89
  end
  inherited PopupMenu_Dest: TPopupMenu
    Left = 123
    Top = 89
  end
  inherited PopupMenu_From: TPopupMenu
    Left = 88
    Top = 89
  end
end
