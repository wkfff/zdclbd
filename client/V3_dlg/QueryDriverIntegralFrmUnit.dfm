inherited QueryDriverIntegralFrm: TQueryDriverIntegralFrm
  Left = 104
  Top = 227
  Height = 466
  Caption = #26597#35810#21496#26426#31215#20998#24773#20917
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel7: TPanel
    Height = 432
    inherited PageControl2: TPageControl
      Height = 399
      inherited TabSheet2: TTabSheet
        inherited TreeView1: TTreeView
          Height = 371
        end
      end
    end
    inherited PanelSelectGroupName: TPanel
      Top = 399
    end
  end
  inherited Panel1: TPanel
    Height = 432
    inherited PageControl1: TPageControl
      Height = 430
      inherited TabSheet1: TTabSheet
        Caption = #21496#26426#31215#20998
        inherited Panel2: TPanel
          Height = 402
          inherited Panel3: TPanel
            inherited Label2: TLabel
              Left = 574
              Top = 9
              Visible = False
            end
            object Label1: TLabel [6]
              Left = 35
              Top = 25
              Width = 39
              Height = 13
              Caption = #21496#26426#65306
            end
            inherited ComboBox2: TComboBox
              Left = 624
              Top = 5
              Width = 73
              Visible = False
            end
            inherited BitBtn5: TBitBtn
              TabOrder = 10
            end
            object rb2: TRadioButton
              Left = 392
              Top = 23
              Width = 74
              Height = 17
              Caption = #31215#20998#25490#21517
              TabOrder = 7
              OnClick = rb2Click
            end
            object rb1: TRadioButton
              Left = 280
              Top = 23
              Width = 88
              Height = 17
              Caption = #21152#20943#20998#21382#21490
              Checked = True
              TabOrder = 8
              TabStop = True
              OnClick = rb1Click
            end
            object cbbDriver: TComboBox
              Left = 71
              Top = 21
              Width = 145
              Height = 21
              ItemHeight = 13
              TabOrder = 9
            end
          end
          inherited Panel4: TPanel
            Height = 302
            inherited DBGridEh1: TDBGridEh
              Height = 302
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'chgdate'
                  Footers = <>
                  Title.Caption = #31215#20998#21464#21270#26102#38388
                  Title.TitleButton = True
                  Width = 94
                end
                item
                  EditButtons = <>
                  FieldName = 'driver_name'
                  Footers = <>
                  Title.Caption = #21496#26426#22995#21517
                  Title.TitleButton = True
                  Width = 82
                end
                item
                  EditButtons = <>
                  FieldName = 'chgvalue'
                  Footers = <>
                  Title.Caption = #31215#20998#21464#21270
                  Title.TitleButton = True
                  Width = 79
                end
                item
                  EditButtons = <>
                  FieldName = 'chgreason'
                  Footers = <>
                  Title.Caption = #21464#21270#21407#22240
                  Title.TitleButton = True
                  Width = 130
                end
                item
                  EditButtons = <>
                  FieldName = 'Integral'
                  Footers = <>
                  Title.Caption = #31215#20998
                  Title.TitleButton = True
                  Visible = False
                end>
            end
          end
        end
      end
    end
  end
  inherited cxSplitter3: TcxSplitter
    Height = 432
  end
end
