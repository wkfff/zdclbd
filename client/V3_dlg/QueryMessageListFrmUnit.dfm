inherited QueryMessageListFrm: TQueryMessageListFrm
  Left = 192
  Top = 211
  Caption = #26597#35810#25991#26412#20449#24687
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited PageControl1: TPageControl
      inherited TabSheet1: TTabSheet
        Caption = #25991#26412#20449#24687
        inherited Panel2: TPanel
          inherited Panel3: TPanel
            inherited Label2: TLabel
              Left = 9
            end
            inherited Label5: TLabel
              Left = 243
            end
            inherited Label3: TLabel
              Left = 22
            end
            object Label1: TLabel [6]
              Left = 353
              Top = 25
              Width = 65
              Height = 13
              Caption = #29992#25143#31867#22411#65306
            end
            object Label4: TLabel [7]
              Left = 195
              Top = 25
              Width = 65
              Height = 13
              Caption = #20449#24687#29366#24577#65306
            end
            inherited ComboBox2: TComboBox
              Left = 59
            end
            inherited DateTimePicker1: TDateTimePicker
              Left = 58
            end
            inherited DateTimePicker2: TDateTimePicker
              Left = 256
            end
            inherited fromTime: TDateTimePicker
              Left = 155
            end
            inherited toTime: TDateTimePicker
              Left = 353
            end
            inherited BitBtn5: TBitBtn
              TabOrder = 9
            end
            object cbxUserType: TComboBox
              Left = 416
              Top = 21
              Width = 80
              Height = 21
              ItemHeight = 13
              ItemIndex = 0
              TabOrder = 7
              Text = #24403#21069#29992#25143
              Items.Strings = (
                #24403#21069#29992#25143
                #25152#26377#29992#25143)
            end
            object cbxMessageState: TComboBox
              Left = 259
              Top = 21
              Width = 89
              Height = 21
              ItemHeight = 13
              ItemIndex = 0
              TabOrder = 8
              Text = #25152#26377
              Items.Strings = (
                #25152#26377
                #26410#21457#36865
                #24050#21457#36865
                #36710#26426#24050#25509#25910
                #21457#36865#22833#36133)
            end
          end
          inherited Panel4: TPanel
            inherited DBGridEh1: TDBGridEh
              ParentShowHint = False
              ShowHint = True
              SumList.Active = True
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'MSG_ID'
                  Footer.Value = #21512#35745#65306
                  Footer.ValueType = fvtStaticText
                  Footers = <>
                  Title.Caption = 'ID'
                  Title.TitleButton = True
                  Width = 60
                end
                item
                  EditButtons = <>
                  FieldName = 'FACT_ID'
                  Footer.ValueType = fvtCount
                  Footers = <>
                  Title.Caption = #21378#23478#32534#21495
                  Title.TitleButton = True
                  Width = 70
                end
                item
                  EditButtons = <>
                  FieldName = 'DEV_ID'
                  Footers = <>
                  Title.Caption = #36710#26426#32534#21495
                  Title.TitleButton = True
                  Width = 70
                end
                item
                  EditButtons = <>
                  FieldName = 'CAR_NO'
                  Footers = <>
                  Title.Caption = #36710#29260#21495
                  Width = 80
                end
                item
                  EditButtons = <>
                  FieldName = 'MSG_STATEStr'
                  Footers = <>
                  Title.Caption = #29366#24577
                  Width = 100
                end
                item
                  EditButtons = <>
                  FieldName = 'MSG_MEMO'
                  Footers = <>
                  Title.Caption = #29366#24577
                  Visible = False
                  Width = 80
                end
                item
                  EditButtons = <>
                  FieldName = 'MSG_STATE'
                  Footers = <>
                  Title.Caption = #29366#24577
                  Visible = False
                  Width = 80
                end
                item
                  EditButtons = <>
                  FieldName = 'MSG_TYPE'
                  Footers = <>
                  Visible = False
                end
                item
                  EditButtons = <>
                  FieldName = 'MSG_CONTENT'
                  Footers = <>
                  Title.Caption = #20869#23481
                  Width = 400
                end
                item
                  EditButtons = <>
                  FieldName = 'MSG_SENDUSER'
                  Footers = <>
                  Title.Caption = #21457#36865#32773
                  Width = 80
                end
                item
                  EditButtons = <>
                  FieldName = 'MSG_SENDTIME'
                  Footers = <>
                  Title.Caption = #21457#36865#26102#38388
                  Title.TitleButton = True
                  Width = 149
                end
                item
                  EditButtons = <>
                  FieldName = 'MSG_RECVTIME'
                  Footers = <>
                  Title.Caption = #25509#25910#26102#38388
                  Title.TitleButton = True
                  Width = 149
                end
                item
                  EditButtons = <>
                  FieldName = 'MSG_SHOWFLAG'
                  Footers = <>
                  Visible = False
                end
                item
                  EditButtons = <>
                  FieldName = 'MSG_REPTIME'
                  Footers = <>
                  Title.TitleButton = True
                  Visible = False
                end
                item
                  EditButtons = <>
                  FieldName = 'MSG_DOWNANSWERS'
                  Footers = <>
                  Visible = False
                end
                item
                  EditButtons = <>
                  FieldName = 'MSG_DRIVERANSWER_ID'
                  Footers = <>
                  Visible = False
                end
                item
                  EditButtons = <>
                  FieldName = 'USER_ID'
                  Footers = <>
                  Title.Caption = #29992#25143#32534#21495
                  Visible = False
                  Width = 70
                end
                item
                  EditButtons = <>
                  FieldName = 'GROUP_ID'
                  Footers = <>
                  Visible = False
                end
                item
                  EditButtons = <>
                  FieldName = 'ANSWER_DESC'
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
