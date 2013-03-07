inherited QueryUpdateRecordFrm: TQueryUpdateRecordFrm
  Left = 69
  Top = 194
  Width = 1168
  Caption = #26597#35810#21319#32423#35760#24405
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 949
    inherited PageControl1: TPageControl
      Width = 947
      inherited TabSheet1: TTabSheet
        Caption = #26597#35810#21319#32423#35760#24405
        inherited Panel2: TPanel
          Width = 939
          inherited Panel3: TPanel
            Width = 937
            Height = 96
            inherited SpeedButtonOneTime: TSpeedButton
              Left = 891
            end
            inherited SpeedButton3: TSpeedButton
              Left = 645
              Top = 27
            end
            inherited SpeedButton4: TSpeedButton
              Left = 906
              Top = 35
            end
            inherited Label2: TLabel
              Top = 15
            end
            inherited Label5: TLabel
              Left = 259
              Top = 68
            end
            inherited Label3: TLabel
              Top = 68
            end
            object Label1: TLabel [6]
              Left = 9
              Top = 41
              Width = 65
              Height = 13
              Caption = #21319#32423#29366#24577#65306
            end
            object Label4: TLabel [7]
              Left = 209
              Top = 15
              Width = 65
              Height = 13
              Caption = #35774#22791#31867#22411#65306
            end
            object Label6: TLabel [8]
              Left = 407
              Top = 15
              Width = 78
              Height = 13
              Caption = #22266#20214#29256#26412#21495#65306
            end
            object Label7: TLabel [9]
              Left = 407
              Top = 41
              Width = 78
              Height = 13
              Caption = #36719#20214#26412#29256#21495#65306
            end
            object Label8: TLabel [10]
              Left = 209
              Top = 41
              Width = 65
              Height = 13
              Caption = #35774#22791#21378#21830#65306
            end
            inherited BitBtnToExcel: TBitBtn
              Left = 719
              Top = 27
            end
            inherited BitBtn2: TBitBtn
              Left = 791
              Top = 27
              TabOrder = 12
            end
            inherited ComboBox2: TComboBox
              Top = 11
              TabOrder = 1
            end
            inherited DateTimePicker1: TDateTimePicker
              Left = 72
              Top = 64
              TabOrder = 7
            end
            inherited DateTimePicker2: TDateTimePicker
              Left = 272
              Top = 64
              TabOrder = 9
            end
            inherited fromTime: TDateTimePicker
              Left = 171
              Top = 64
              TabOrder = 8
            end
            inherited toTime: TDateTimePicker
              Left = 369
              Top = 64
              TabOrder = 10
            end
            inherited BitBtn5: TBitBtn
              Left = 569
              Top = 27
              TabOrder = 11
            end
            object cbxUpdateRes: TComboBox
              Left = 72
              Top = 37
              Width = 129
              Height = 21
              ItemHeight = 13
              ItemIndex = 0
              TabOrder = 2
              Text = #20840#37096
              Items.Strings = (
                #20840#37096
                #26080#38656#21319#32423
                #25104#21151
                #22833#36133
                #21378#21830#26631#35782#19981#19968#33268
                #30828#20214#29256#26412#21495#19981#19968#33268
                #19979#36733#21319#32423#25991#20214#22833#36133
                #21319#32423#26381#21153#22120#20027#21160#21462#28040
                #22806#35774#20027#21160#25918#24323#21319#32423)
            end
            object cbxDevType: TComboBox
              Left = 272
              Top = 11
              Width = 129
              Height = 21
              ItemHeight = 13
              TabOrder = 3
              OnChange = cbxDevTypeChange
            end
            object editHardVer: TEdit
              Left = 482
              Top = 11
              Width = 49
              Height = 21
              Cursor = crIBeam
              DragCursor = crIBeam
              TabOrder = 5
            end
            object editSoftVer: TEdit
              Left = 482
              Top = 37
              Width = 49
              Height = 21
              TabOrder = 6
            end
            object cbxDevFact: TComboBox
              Left = 272
              Top = 37
              Width = 129
              Height = 21
              ItemHeight = 13
              TabOrder = 4
            end
          end
          inherited Panel4: TPanel
            Top = 105
            Width = 937
            Height = 317
            inherited DBGridEh1: TDBGridEh
              Width = 937
              Height = 317
              SumList.Active = True
              TabOrder = 1
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'devid'
                  Footer.Value = #21512#35745#65306
                  Footer.ValueType = fvtStaticText
                  Footers = <>
                  Title.Caption = #36710#26426#21495
                  Title.TitleButton = True
                  Width = 75
                end
                item
                  EditButtons = <>
                  FieldName = 'car_no'
                  Footer.ValueType = fvtCount
                  Footers = <>
                  Title.Caption = #36710#29260#21495
                  Title.TitleButton = True
                  Width = 75
                end
                item
                  EditButtons = <>
                  FieldName = 'typename'
                  Footers = <>
                  Title.Caption = #35774#22791#31867#22411
                  Title.TitleButton = True
                  Width = 120
                end
                item
                  EditButtons = <>
                  FieldName = 'factname'
                  Footers = <>
                  Title.Caption = #35774#22791#21378#21830
                  Title.TitleButton = True
                  Width = 120
                end
                item
                  EditButtons = <>
                  FieldName = 'hardver'
                  Footers = <>
                  Title.Caption = #22266#20214#29256#26412#21495
                  Title.TitleButton = True
                  Width = 70
                end
                item
                  EditButtons = <>
                  FieldName = 'softver'
                  Footers = <>
                  Title.Caption = #36719#20214#29256#26412#21495
                  Title.TitleButton = True
                  Width = 70
                end
                item
                  EditButtons = <>
                  FieldName = 'updatedate'
                  Footers = <>
                  Title.Caption = #21319#32423#26085#26399
                  Title.TitleButton = True
                  Width = 149
                end
                item
                  EditButtons = <>
                  FieldName = 'updateresult'
                  Footers = <>
                  Title.Caption = #21319#32423#32467#26524
                  Title.TitleButton = True
                  Width = 150
                end
                item
                  EditButtons = <>
                  FieldName = 'devtype'
                  Footers = <>
                  Title.TitleButton = True
                  Visible = False
                end
                item
                  EditButtons = <>
                  FieldName = 'devfactid'
                  Footers = <>
                  Title.TitleButton = True
                  Visible = False
                end
                item
                  EditButtons = <>
                  FieldName = 'updateres'
                  Footers = <>
                  Title.TitleButton = True
                  Visible = False
                end
                item
                  EditButtons = <>
                  Footers = <>
                  Visible = False
                end>
            end
            object PageControl3: TPageControl
              Left = 0
              Top = 0
              Width = 937
              Height = 317
              ActivePage = TabSheet3
              Align = alClient
              TabOrder = 0
              object TabSheet3: TTabSheet
                Caption = #26597#35810#32467#26524
                object DBGridEh2: TDBGridEh
                  Left = 0
                  Top = 0
                  Width = 929
                  Height = 289
                  Align = alClient
                  Ctl3D = True
                  Flat = True
                  FooterColor = clWindow
                  FooterFont.Charset = GB2312_CHARSET
                  FooterFont.Color = clWindowText
                  FooterFont.Height = -13
                  FooterFont.Name = #23435#20307
                  FooterFont.Style = []
                  FooterRowCount = 1
                  Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                  OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDialogFind]
                  ParentCtl3D = False
                  PopupMenu = PopupMenu1
                  ReadOnly = True
                  RowHeight = 4
                  RowLines = 1
                  SortLocal = True
                  SumList.Active = True
                  TabOrder = 0
                  TitleFont.Charset = GB2312_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -13
                  TitleFont.Name = #23435#20307
                  TitleFont.Style = []
                  UseMultiTitle = True
                  Columns = <
                    item
                      EditButtons = <>
                      FieldName = 'devid'
                      Footer.Value = #21512#35745#65306
                      Footer.ValueType = fvtStaticText
                      Footers = <>
                      Title.Caption = #36710#26426#21495
                      Title.TitleButton = True
                      Width = 75
                    end
                    item
                      EditButtons = <>
                      FieldName = 'car_no'
                      Footer.ValueType = fvtCount
                      Footers = <>
                      Title.Caption = #36710#29260#21495
                      Title.TitleButton = True
                      Width = 75
                    end
                    item
                      EditButtons = <>
                      FieldName = 'typename'
                      Footers = <>
                      Title.Caption = #35774#22791#31867#22411
                      Title.TitleButton = True
                      Width = 120
                    end
                    item
                      EditButtons = <>
                      FieldName = 'factname'
                      Footers = <>
                      Title.Caption = #35774#22791#21378#21830
                      Title.TitleButton = True
                      Width = 120
                    end
                    item
                      EditButtons = <>
                      FieldName = 'hardver'
                      Footers = <>
                      Title.Caption = #22266#20214#29256#26412#21495
                      Title.TitleButton = True
                      Width = 70
                    end
                    item
                      EditButtons = <>
                      FieldName = 'softver'
                      Footers = <>
                      Title.Caption = #36719#20214#29256#26412#21495
                      Title.TitleButton = True
                      Width = 70
                    end
                    item
                      EditButtons = <>
                      FieldName = 'updatedate'
                      Footers = <>
                      Title.Caption = #21319#32423#26085#26399
                      Title.TitleButton = True
                      Width = 149
                    end
                    item
                      EditButtons = <>
                      FieldName = 'updateresult'
                      Footers = <>
                      Title.Caption = #21319#32423#32467#26524
                      Title.TitleButton = True
                      Width = 150
                    end
                    item
                      EditButtons = <>
                      FieldName = 'devtype'
                      Footers = <>
                      Title.TitleButton = True
                      Visible = False
                    end
                    item
                      EditButtons = <>
                      FieldName = 'devfactid'
                      Footers = <>
                      Title.TitleButton = True
                      Visible = False
                    end
                    item
                      EditButtons = <>
                      FieldName = 'updateres'
                      Footers = <>
                      Title.TitleButton = True
                      Visible = False
                    end
                    item
                      EditButtons = <>
                      Footers = <>
                      Visible = False
                    end>
                end
              end
              object TabSheet4: TTabSheet
                Caption = #21047#36873#32467#26524
                ImageIndex = 1
                object cxOtherCarList: TcxTreeList
                  Left = 0
                  Top = 0
                  Width = 929
                  Height = 282
                  Align = alClient
                  Bands = <
                    item
                      Caption.AlignHorz = taCenter
                      Caption.Text = #22522#26412#20449#24687
                    end>
                  BufferedPaint = True
                  Font.Charset = GB2312_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = #23435#20307
                  Font.Style = []
                  OptionsData.Editing = False
                  OptionsData.Deleting = False
                  OptionsView.GridLines = tlglBoth
                  OptionsView.ShowRoot = False
                  ParentFont = False
                  PopupMenu = PopupMenu2
                  StateImages = Mainf.ImageList1
                  TabOrder = 0
                  object CxDevIdStr: TcxTreeListColumn
                    Caption.Text = #36710#26426#32534#21495
                    DataBinding.ValueType = 'String'
                    Position.ColIndex = 0
                    Position.RowIndex = 0
                    Position.BandIndex = 0
                  end
                  object CxCarNo: TcxTreeListColumn
                    Caption.Text = #36710#29260#21495
                    DataBinding.ValueType = 'String'
                    Options.Editing = False
                    Width = 105
                    Position.ColIndex = 1
                    Position.RowIndex = 0
                    Position.BandIndex = 0
                  end
                  object CxGroupName: TcxTreeListColumn
                    Caption.Text = #20844#21496#21517#31216
                    DataBinding.ValueType = 'String'
                    Width = 150
                    Position.ColIndex = 3
                    Position.RowIndex = 0
                    Position.BandIndex = 0
                  end
                  object CxTel: TcxTreeListColumn
                    Caption.Text = #20844#21496#30005#35805
                    DataBinding.ValueType = 'String'
                    Position.ColIndex = 4
                    Position.RowIndex = 0
                    Position.BandIndex = 0
                  end
                end
              end
            end
          end
          inherited cxSplitter2: TcxSplitter
            Top = 97
            Width = 937
          end
        end
      end
    end
  end
  inherited PrintDBGridEh1: TPrintDBGridEh
    DBGridEh = DBGridEh2
  end
  object PopupMenu1: TPopupMenu
    Left = 509
    Top = 282
    object N1: TMenuItem
      Caption = #25552#21462#31579#36873#32467#26524
      OnClick = N1Click
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 477
    Top = 234
    object N2: TMenuItem
      Caption = #23548#20986#36710#36742#21015#34920
      OnClick = N2Click
    end
  end
end
