inherited QueryCmdListFrm: TQueryCmdListFrm
  Caption = #26597#35810#21457#36865#21629#20196
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited PageControl1: TPageControl
      inherited TabSheet1: TTabSheet
        Caption = #26597#35810#21457#36865#21629#20196
        inherited Panel2: TPanel
          inherited Panel3: TPanel
            inherited SpeedButtonOneTime: TSpeedButton
              Left = 715
            end
            object Label1: TLabel [6]
              Left = 209
              Top = 25
              Width = 65
              Height = 13
              Caption = #29992#25143#31867#22411#65306
            end
            object cbxUserType: TComboBox [14]
              Left = 272
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
            inherited BitBtn5: TBitBtn
              TabOrder = 8
            end
          end
          inherited Panel4: TPanel
            inherited DBGridEh1: TDBGridEh
              SumList.Active = True
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'CMDLOG_ID'
                  Footer.Value = #21512#35745#65306
                  Footer.ValueType = fvtStaticText
                  Footers = <>
                  Title.Caption = #32534#21495
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
                  Title.TitleButton = True
                  Width = 80
                end
                item
                  EditButtons = <>
                  FieldName = 'USERNAME'
                  Footers = <>
                  Title.Caption = #21457#36865#32773
                  Title.TitleButton = True
                  Width = 60
                end
                item
                  EditButtons = <>
                  FieldName = 'CMD_DESC'
                  Footers = <>
                  Title.Caption = #21629#20196#25551#36848
                  Title.TitleButton = True
                  Width = 400
                end
                item
                  EditButtons = <>
                  FieldName = 'EXEC_TIME'
                  Footers = <>
                  Title.Caption = #21457#36865#26102#38388
                  Title.TitleButton = True
                  Width = 149
                end>
            end
          end
        end
      end
    end
  end
end
