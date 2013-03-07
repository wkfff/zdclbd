inherited QueryQuestionListFrm: TQueryQuestionListFrm
  Caption = #26597#35810#25552#38382#20449#24687
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited PageControl1: TPageControl
      inherited TabSheet1: TTabSheet
        Caption = #25552#38382#20449#24687
        inherited Panel2: TPanel
          inherited Panel3: TPanel
            object Label1: TLabel [6]
              Left = 373
              Top = 25
              Width = 65
              Height = 13
              Caption = #29992#25143#31867#22411#65306
            end
            object Label4: TLabel [7]
              Left = 215
              Top = 25
              Width = 65
              Height = 13
              Caption = #20449#24687#29366#24577#65306
            end
            inherited BitBtn5: TBitBtn
              TabOrder = 9
            end
            object cbxUserType: TComboBox
              Left = 436
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
              Left = 279
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
              SumList.Active = True
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'MSG_ID'
                  Footer.Value = #21512#35745#65306
                  Footer.ValueType = fvtStaticText
                  Footers = <>
                  Title.Caption = 'ID'
                  Width = 60
                end
                item
                  EditButtons = <>
                  FieldName = 'FACT_ID'
                  Footer.ValueType = fvtCount
                  Footers = <>
                  Title.Caption = #21378#23478#32534#21495
                  Width = 70
                end
                item
                  EditButtons = <>
                  FieldName = 'DEV_ID'
                  Footers = <>
                  Title.Caption = #36710#26426#32534#21495
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
                  Width = 149
                end
                item
                  EditButtons = <>
                  FieldName = 'MSG_REPTIME'
                  Footers = <>
                  Title.Caption = #25509#25910#26102#38388
                  Width = 149
                end
                item
                  EditButtons = <>
                  FieldName = 'MSG_DOWNANSWERS'
                  Footers = <>
                  Title.Caption = #20505#36873#31572#26696#21015#34920
                  Width = 300
                end
                item
                  EditButtons = <>
                  FieldName = 'MSG_DRIVERANSWER_STR'
                  Footers = <>
                  Title.Caption = #21496#26426#25552#20132#31572#26696
                  Width = 100
                end>
            end
          end
        end
      end
    end
  end
end
