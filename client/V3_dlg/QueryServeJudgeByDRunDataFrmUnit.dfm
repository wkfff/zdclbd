object QueryServeJudgeByDRunDataFrm: TQueryServeJudgeByDRunDataFrm
  Left = 538
  Top = 414
  Width = 710
  Height = 207
  BorderIcons = [biSystemMenu]
  Caption = #35780#20215#20449#24687
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 702
    Height = 139
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object DBGridEh1: TDBGridEh
      Left = 0
      Top = 0
      Width = 702
      Height = 139
      Align = alClient
      Ctl3D = True
      Flat = True
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      FooterRowCount = 1
      ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDialogFind]
      ParentCtl3D = False
      ReadOnly = True
      RowHeight = 4
      RowLines = 1
      SortLocal = True
      SumList.Active = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      UseMultiTitle = True
      Columns = <
        item
          EditButtons = <>
          FieldName = 'Judge_Id'
          Footers = <>
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'Fact_Id'
          Footers = <>
          Title.Caption = #21378#23478#32534#21495
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'Dev_Id'
          Footers = <>
          Title.Caption = #36710#26426#32534#21495
        end
        item
          EditButtons = <>
          FieldName = 'CAR_NO'
          Footers = <>
          Title.Caption = #36710#29260#21495
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'DriverServeNum'
          Footers = <>
          Title.Caption = #21496#26426#32534#21495
          Width = 150
        end
        item
          EditButtons = <>
          FieldName = 'Judge_Time'
          Footers = <>
          Title.Caption = #35780#20215#26102#38388
          Width = 149
        end
        item
          EditButtons = <>
          FieldName = 'Judge_Result'
          Footers = <>
          Title.Caption = #35780#20215#25551#36848
          Width = 200
        end
        item
          EditButtons = <>
          FieldName = 'NotOK_Num'
          Footers = <>
          Title.Caption = #21333#20215
          Visible = False
          Width = 60
        end
        item
          DisplayFormat = '0.00'
          EditButtons = <>
          FieldName = 'NotOk_Desc'
          Footers = <>
          Title.Caption = #33829#36816#37324#31243
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'USER_ID'
          Footers = <>
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'GROUP_ID'
          Footers = <>
          Visible = False
        end>
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 139
    Width = 702
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 304
      Top = 8
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      Kind = bkOK
    end
  end
  object DataSource1: TDataSource
    Left = 318
    Top = 210
  end
end
