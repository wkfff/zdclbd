object BeforeScreenForm: TBeforeScreenForm
  Left = 285
  Top = 220
  Width = 601
  Height = 444
  Caption = #26041#21521#20449#24687
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 593
    Height = 41
    Align = alTop
    Caption = #26041#21521#20449#24687
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -29
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 593
    Height = 335
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    object Panel4: TPanel
      Left = 407
      Top = 1
      Width = 185
      Height = 333
      Align = alRight
      TabOrder = 0
      object Memo1: TMemo
        Left = 1
        Top = 20
        Width = 183
        Height = 277
        Align = alTop
        Lines.Strings = (
          'Memo1')
        TabOrder = 0
      end
      object Panel5: TPanel
        Left = 1
        Top = 1
        Width = 183
        Height = 19
        Align = alTop
        Caption = #26041#21521#20449#24687#20869#23481
        TabOrder = 1
      end
      object BitBtnAdd: TBitBtn
        Left = 16
        Top = 302
        Width = 75
        Height = 25
        Caption = #28155#21152
        TabOrder = 2
        OnClick = BitBtnAddClick
      end
      object BitBtnDel: TBitBtn
        Left = 90
        Top = 302
        Width = 75
        Height = 25
        Caption = #21024#38500
        TabOrder = 3
        OnClick = BitBtnDelClick
      end
    end
    object InfoList: TcxTreeList
      Left = 1
      Top = 1
      Width = 406
      Height = 333
      Align = alClient
      Bands = <
        item
          Caption.AlignHorz = taCenter
          Caption.Text = #22522#26412#20449#24687
          Width = 299
        end>
      BufferedPaint = True
      OptionsData.Editing = False
      OptionsData.Deleting = False
      OptionsView.GridLines = tlglBoth
      OptionsView.ShowRoot = False
      TabOrder = 1
      OnDblClick = InfoListDblClick
      object cxID: TcxTreeListColumn
        Caption.Text = 'ID'
        DataBinding.ValueType = 'Integer'
        Options.Editing = False
        Width = 68
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
        SortOrder = soDescending
      end
      object cxInfo: TcxTreeListColumn
        Caption.Text = #26041#21521#20449#24687
        DataBinding.ValueType = 'String'
        MinWidth = 50
        Options.Editing = False
        Width = 304
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 376
    Width = 593
    Height = 41
    Align = alBottom
    TabOrder = 2
    object BitBtnSelect: TBitBtn
      Left = 424
      Top = 8
      Width = 75
      Height = 25
      Caption = #36873#20013
      Enabled = False
      TabOrder = 1
      OnClick = BitBtnSelectClick
    end
    object BitBtnClose: TBitBtn
      Left = 498
      Top = 8
      Width = 75
      Height = 25
      Caption = #20851#38381'&C'
      TabOrder = 0
      Kind = bkClose
    end
  end
end
