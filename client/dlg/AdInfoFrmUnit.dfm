object AdInfoForm: TAdInfoForm
  Left = 114
  Top = 154
  Width = 910
  Height = 584
  Caption = #24191#21578#20449#24687
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 736
    Height = 550
    Align = alClient
    TabOrder = 0
    object AdInfoList: TcxTreeList
      Left = 1
      Top = 41
      Width = 734
      Height = 467
      Align = alClient
      Bands = <
        item
          Caption.AlignHorz = taCenter
          Caption.Text = #22522#26412#20449#24687
        end>
      BufferedPaint = True
      OptionsData.Editing = False
      OptionsData.Deleting = False
      OptionsView.GridLines = tlglBoth
      OptionsView.ShowRoot = False
      TabOrder = 0
      OnClick = AdInfoListClick
      OnDblClick = AdInfoListDblClick
      object cxID: TcxTreeListColumn
        Caption.Text = #33258#21160#32534#21495
        DataBinding.ValueType = 'Integer'
        Options.Editing = False
        Width = 74
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
        SortOrder = soDescending
      end
      object cxadMemo: TcxTreeListColumn
        Caption.Text = #24191#21578#20869#23481
        DataBinding.ValueType = 'String'
        MinWidth = 50
        Options.Editing = False
        Width = 301
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object cxbeginTime: TcxTreeListColumn
        Caption.Text = #25237#25918#26102#38388
        DataBinding.ValueType = 'DateTime'
        Options.Editing = False
        Width = 99
        Position.ColIndex = 2
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object cxendTime: TcxTreeListColumn
        Caption.Text = #21040#26399#26102#38388
        DataBinding.ValueType = 'DateTime'
        Width = 124
        Position.ColIndex = 3
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object cxcustomerName: TcxTreeListColumn
        Caption.Text = #23458#25143#21517#31216
        DataBinding.ValueType = 'String'
        Width = 140
        Position.ColIndex = 4
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object cxlinkName: TcxTreeListColumn
        Caption.Text = #32852#31995#20154
        DataBinding.ValueType = 'String'
        Width = 75
        Position.ColIndex = 5
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object cxTel: TcxTreeListColumn
        Caption.Text = #32852#31995#30005#35805
        DataBinding.ValueType = 'String'
        Position.ColIndex = 6
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object cxMemo: TcxTreeListColumn
        Caption.Text = #22791#27880
        DataBinding.ValueType = 'String'
        Position.ColIndex = 7
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 734
      Height = 40
      Align = alTop
      Caption = #24191#21578#20449#24687
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -27
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object Panel3: TPanel
      Left = 1
      Top = 508
      Width = 734
      Height = 41
      Align = alBottom
      TabOrder = 2
      object BitBtnSelect: TBitBtn
        Left = 568
        Top = 8
        Width = 75
        Height = 25
        Caption = #36873#20013
        TabOrder = 0
        OnClick = BitBtnSelectClick
      end
      object BitBtnClose: TBitBtn
        Left = 648
        Top = 8
        Width = 75
        Height = 25
        Caption = #20851#38381'&C'
        TabOrder = 1
        Kind = bkClose
      end
    end
  end
  object Panel4: TPanel
    Left = 736
    Top = 0
    Width = 166
    Height = 550
    Align = alRight
    TabOrder = 1
    object Label2: TLabel
      Left = 3
      Top = 190
      Width = 51
      Height = 13
      Caption = #25237#25918#26102#38388':'
    end
    object Label3: TLabel
      Left = 4
      Top = 214
      Width = 51
      Height = 13
      Caption = #21040#26399#26102#38388':'
    end
    object Label4: TLabel
      Left = 3
      Top = 240
      Width = 51
      Height = 13
      Caption = #23458#25143#21517#31216':'
    end
    object Label5: TLabel
      Left = 4
      Top = 293
      Width = 39
      Height = 13
      Caption = #32852#31995#20154':'
    end
    object Label6: TLabel
      Left = 3
      Top = 318
      Width = 51
      Height = 13
      Caption = #32852#31995#30005#35805':'
    end
    object Label7: TLabel
      Left = 4
      Top = 364
      Width = 27
      Height = 13
      Caption = #22791#27880':'
    end
    object EditAdInfo: TMemo
      Left = 1
      Top = 41
      Width = 164
      Height = 136
      Align = alTop
      Lines.Strings = (
        'EditAdInfo')
      MaxLength = 200
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 164
      Height = 40
      Align = alTop
      TabOrder = 1
      object Label1: TLabel
        Left = 7
        Top = 23
        Width = 51
        Height = 13
        Caption = #24191#21578#20869#23481':'
      end
    end
    object DateTimeBegin: TDateTimePicker
      Left = 59
      Top = 185
      Width = 94
      Height = 21
      Date = 39322.699831412040000000
      Time = 39322.699831412040000000
      TabOrder = 2
    end
    object DateTimeEnd: TDateTimePicker
      Left = 59
      Top = 209
      Width = 94
      Height = 21
      Date = 39322.700009178240000000
      Time = 39322.700009178240000000
      TabOrder = 3
    end
    object EditCustomer: TEdit
      Left = 2
      Top = 256
      Width = 157
      Height = 21
      TabOrder = 4
      Text = 'EditCustomer'
    end
    object EditLinkName: TEdit
      Left = 64
      Top = 288
      Width = 97
      Height = 21
      TabOrder = 5
      Text = 'EditLinkName'
    end
    object EditTel: TEdit
      Left = 2
      Top = 333
      Width = 159
      Height = 21
      TabOrder = 6
      Text = 'EditTel'
    end
    object EditMemo: TEdit
      Left = 3
      Top = 380
      Width = 158
      Height = 21
      TabOrder = 7
      Text = 'EditMemo'
    end
    object ButtonAdd: TButton
      Left = 10
      Top = 418
      Width = 49
      Height = 25
      Caption = #28155#21152
      TabOrder = 8
      OnClick = ButtonAddClick
    end
    object ButtonModifiy: TButton
      Left = 58
      Top = 418
      Width = 49
      Height = 25
      Caption = #20462#25913
      TabOrder = 9
    end
    object ButtonDel: TButton
      Left = 106
      Top = 418
      Width = 49
      Height = 25
      Caption = #21024#38500
      TabOrder = 10
      OnClick = ButtonDelClick
    end
  end
end
