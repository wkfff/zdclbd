inherited QueryOrderListFrm: TQueryOrderListFrm
  Left = 191
  Top = 163
  Caption = #26597#35810#35746#21333
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited PageControl1: TPageControl
      inherited TabSheet1: TTabSheet
        Caption = #26597#35810#35746#21333
        inherited Panel2: TPanel
          inherited Panel3: TPanel
            inherited SpeedButtonOneTime: TSpeedButton
              Left = 707
              Top = 6
            end
            inherited SpeedButton3: TSpeedButton
              Left = 581
              Top = 46
            end
            object Label1: TLabel [6]
              Left = 216
              Top = 25
              Width = 65
              Height = 13
              Caption = #35746#21333#31867#22411#65306
            end
            object Label4: TLabel [7]
              Left = 344
              Top = 25
              Width = 65
              Height = 13
              Caption = #29992#25143#31867#22411#65306
            end
            inherited BitBtnToExcel: TBitBtn
              Left = 655
              Top = 46
            end
            inherited BitBtn2: TBitBtn
              Left = 727
              Top = 46
            end
            inherited BitBtn5: TBitBtn
              Left = 507
              Top = 46
              Width = 73
              TabOrder = 11
            end
            object cbxOrderType: TComboBox
              Left = 280
              Top = 21
              Width = 57
              Height = 21
              ItemHeight = 13
              ItemIndex = 0
              TabOrder = 7
              Text = #25152#26377
              Items.Strings = (
                #25152#26377
                #21363#26102
                #39044#32422
                #24613#25307)
            end
            object cbxUserType: TComboBox
              Left = 408
              Top = 21
              Width = 80
              Height = 21
              ItemHeight = 13
              ItemIndex = 0
              TabOrder = 8
              Text = #24403#21069#29992#25143
              Items.Strings = (
                #24403#21069#29992#25143
                #25152#26377#29992#25143)
            end
            object chkShowSucc: TCheckBox
              Left = 504
              Top = 21
              Width = 139
              Height = 17
              Caption = #21482#26174#31034#25104#21151#23436#25104#35746#21333
              TabOrder = 9
            end
            object chkShowCancel: TCheckBox
              Left = 665
              Top = 21
              Width = 113
              Height = 17
              Caption = #21482#26174#31034#21462#28040#35746#21333
              TabOrder = 10
            end
          end
          inherited Panel4: TPanel
            inherited DBGridEh1: TDBGridEh
              DataSource = DataSource1
              ParentShowHint = False
              ShowHint = True
              SumList.Active = True
              OnDblClick = DBGridEh1DblClick
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'id'
                  Footer.Value = #21512#35745#65306
                  Footer.ValueType = fvtStaticText
                  Footers = <>
                  Title.Caption = #35746#21333#21495
                  Title.TitleButton = True
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
                end
                item
                  EditButtons = <>
                  FieldName = 'CAR_NO'
                  Footer.ValueType = fvtCount
                  Footers = <>
                  Title.Caption = #25250#21333#25104#21151#36710#29260#21495
                  Title.TitleButton = True
                  Width = 100
                end
                item
                  EditButtons = <>
                  FieldName = 'secusTime'
                  Footers = <>
                  Title.Caption = #25250#21333#25104#21151#26102#38388
                  Title.TitleButton = True
                  Width = 149
                end
                item
                  EditButtons = <>
                  FieldName = 'memo'
                  Footers = <>
                  Title.Caption = #25250#21333#32467#26524
                  Title.TitleButton = True
                  Visible = False
                  Width = 100
                end
                item
                  EditButtons = <>
                  FieldName = 'resultStr'
                  Footers = <>
                  Title.Caption = #25250#21333#32467#26524
                  Width = 100
                end
                item
                  EditButtons = <>
                  FieldName = 'result'
                  Footers = <>
                  Title.Caption = #25250#21333#32467#26524
                  Title.TitleButton = True
                  Visible = False
                  Width = 80
                end
                item
                  EditButtons = <>
                  FieldName = 'atypeStr'
                  Footers = <>
                  Title.Caption = #35746#21333#31867#22411
                  Title.TitleButton = True
                  Width = 80
                end
                item
                  EditButtons = <>
                  FieldName = 'atype'
                  Footers = <>
                  Title.Caption = #35746#21333#31867#22411
                  Title.TitleButton = True
                  Visible = False
                  Width = 70
                end
                item
                  EditButtons = <>
                  FieldName = 'adatetime'
                  Footers = <>
                  Title.Caption = #39044#32422#35746#21333#26102#38388
                  Title.TitleButton = True
                  Width = 149
                end
                item
                  EditButtons = <>
                  FieldName = 'content'
                  Footers = <>
                  Title.Caption = #20056#36710#22320#28857
                  Title.TitleButton = True
                  Width = 150
                end
                item
                  EditButtons = <>
                  FieldName = 'usertel'
                  Footers = <>
                  Title.Caption = #20056#23458#30005#35805
                  Title.TitleButton = True
                  Width = 100
                end
                item
                  EditButtons = <>
                  FieldName = 'partContent'
                  Footers = <>
                  Title.Caption = #19994#21153#25551#36848
                  Title.TitleButton = True
                  Width = 200
                end
                item
                  EditButtons = <>
                  FieldName = 'sendDate'
                  Footers = <>
                  Title.Caption = #21457#36865#26102#38388
                  Title.TitleButton = True
                  Width = 148
                end
                item
                  EditButtons = <>
                  FieldName = 'devIDAry'
                  Footers = <>
                  Visible = False
                end
                item
                  EditButtons = <>
                  FieldName = 'Dev_ID'
                  Footers = <>
                  Visible = False
                end
                item
                  EditButtons = <>
                  FieldName = 'Fact_Id'
                  Footers = <>
                  Visible = False
                end
                item
                  EditButtons = <>
                  FieldName = 'cancelTime'
                  Footers = <>
                  Title.Caption = #35746#21333#21462#28040#26102#38388
                  Title.TitleButton = True
                  Width = 149
                end
                item
                  EditButtons = <>
                  FieldName = 'DevCancelReasonID'
                  Footers = <>
                  Title.Caption = #35746#21333#21462#28040#21407#22240
                  Title.TitleButton = True
                  Visible = False
                  Width = 85
                end
                item
                  EditButtons = <>
                  FieldName = 'DevCancelReasonIDStr'
                  Footers = <>
                  Title.Caption = #35746#21333#21462#28040#21407#22240
                  Width = 85
                end
                item
                  EditButtons = <>
                  FieldName = 'SendUser_Id'
                  Footers = <>
                  Visible = False
                end
                item
                  EditButtons = <>
                  FieldName = 'SendUser_Name'
                  Footers = <>
                  Visible = False
                end>
            end
          end
        end
      end
    end
  end
end
