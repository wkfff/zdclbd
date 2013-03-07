inherited SendVideoFrm: TSendVideoFrm
  Left = 370
  Top = 243
  Caption = #21457#36865#35270#39057#25991#20214
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited Panel2: TPanel
      inherited BitBtn1: TBitBtn
        Left = 123
        OnClick = BitBtn1Click
      end
      inherited BitBtn2: TBitBtn
        Left = 220
      end
    end
    inherited Panel5: TPanel
      inherited Panel7: TPanel
        Caption = #21457#36865#35270#39057#25991#20214
      end
      object Notebook1: TNotebook
        Left = 0
        Top = 49
        Width = 315
        Height = 263
        Align = alClient
        PageIndex = 1
        TabOrder = 2
        object TPage
          Left = 0
          Top = 0
          Caption = 'Default'
          object Label1: TLabel
            Left = 8
            Top = 136
            Width = 60
            Height = 13
            Caption = #24191#21578#25991#20214#65306
          end
          object SpeedButton4: TSpeedButton
            Left = 262
            Top = 131
            Width = 22
            Height = 22
            Hint = #25171#24320#22768#38899#25991#20214
            Flat = True
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = []
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              04000000000080000000CE0E0000C40E00001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              77777777777777777777000000000007777700333333333077770B0333333333
              07770FB03333333330770BFB0333333333070FBFB000000000000BFBFBFBFB07
              77770FBFBFBFBF0777770BFB0000000777777000777777770007777777777777
              7007777777770777070777777777700077777777777777777777}
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = SpeedButton4Click
          end
          object Edit1: TEdit
            Left = 80
            Top = 132
            Width = 177
            Height = 21
            TabOrder = 0
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'ViewAdInfo'
          object ListView2: TListView
            Left = 0
            Top = 0
            Width = 315
            Height = 248
            Align = alClient
            Columns = <
              item
                Caption = 'ID'
                Width = 80
              end
              item
                Caption = #24191#21578#20449#24687#25991#20214#21517
                Width = 230
              end>
            GridLines = True
            ReadOnly = True
            RowSelect = True
            ParentShowHint = False
            PopupMenu = PopupMenu1
            ShowHint = True
            TabOrder = 0
            ViewStyle = vsReport
          end
          object PanViewAdInfo: TPanel
            Left = 128
            Top = 250
            Width = 185
            Height = 28
            TabOrder = 1
            Visible = False
            object SpeedButton1: TSpeedButton
              Left = 162
              Top = 6
              Width = 20
              Height = 17
              Caption = 'X'
              OnClick = SpeedButton1Click
            end
            object Edit2: TEdit
              Left = 8
              Top = 4
              Width = 121
              Height = 21
              TabOrder = 0
            end
          end
          object GroupBox3: TGroupBox
            Left = 0
            Top = 248
            Width = 315
            Height = 15
            Align = alBottom
            Caption = #23646#24615
            TabOrder = 2
            Visible = False
            object RadioButton5: TRadioButton
              Left = 24
              Top = 19
              Width = 113
              Height = 17
              Caption = #25968#25454#26080#21387#32553
              Checked = True
              TabOrder = 0
              TabStop = True
            end
            object RadioButton6: TRadioButton
              Left = 120
              Top = 19
              Width = 113
              Height = 17
              Caption = 'gz'#21387#32553
              TabOrder = 1
            end
            object CheckBox3: TCheckBox
              Left = 216
              Top = 19
              Width = 97
              Height = 17
              Caption = #23494#25991
              TabOrder = 2
            end
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'QueryAdInfo'
          object Label5: TLabel
            Left = 1
            Top = 93
            Width = 312
            Height = 24
            Caption = #26597#35810#24403#21069#27491#22312#25773#25918#30340#24191#21578#20449#24687
            Font.Charset = GB2312_CHARSET
            Font.Color = clWhite
            Font.Height = -24
            Font.Name = #38582#20070
            Font.Style = []
            ParentFont = False
          end
          object Label4: TLabel
            Left = 2
            Top = 94
            Width = 312
            Height = 24
            Caption = #26597#35810#24403#21069#27491#22312#25773#25918#30340#24191#21578#20449#24687
            Font.Charset = GB2312_CHARSET
            Font.Color = clPurple
            Font.Height = -24
            Font.Name = #38582#20070
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object GroupBox2: TGroupBox
            Left = -160
            Top = 128
            Width = 185
            Height = 129
            Caption = #23646#24615
            TabOrder = 0
            Visible = False
            object RadioButton3: TRadioButton
              Left = 32
              Top = 24
              Width = 113
              Height = 17
              Caption = #25968#25454#26080#21387#32553
              Checked = True
              TabOrder = 0
              TabStop = True
            end
            object RadioButton4: TRadioButton
              Left = 32
              Top = 48
              Width = 113
              Height = 17
              Caption = 'gz'#21387#32553
              TabOrder = 1
            end
            object CheckBox2: TCheckBox
              Left = 32
              Top = 88
              Width = 97
              Height = 17
              Caption = #23494#25991
              TabOrder = 2
            end
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'QueryAllAdInfo'
          object ListView3: TListView
            Left = 0
            Top = 0
            Width = 315
            Height = 263
            Align = alClient
            Columns = <
              item
                Caption = 'ID'
                Width = 80
              end
              item
                Caption = #24191#21578#20449#24687#25991#20214#21517
                Width = 230
              end>
            GridLines = True
            ReadOnly = True
            RowSelect = True
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ViewStyle = vsReport
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'DeleteAdInfo'
          object ListView4: TListView
            Left = 0
            Top = 0
            Width = 315
            Height = 263
            Align = alClient
            Columns = <
              item
                Caption = 'ID'
                Width = 80
              end
              item
                Caption = #24191#21578#20449#24687#25991#20214#21517
                Width = 230
              end>
            GridLines = True
            ReadOnly = True
            RowSelect = True
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ViewStyle = vsReport
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'DeleteAllAdInfo'
          object Label3: TLabel
            Left = 56
            Top = 104
            Width = 216
            Height = 24
            Caption = #21024#38500#25152#26377#30340#24191#21578#20449#24687
            Font.Charset = GB2312_CHARSET
            Font.Color = clWhite
            Font.Height = -24
            Font.Name = #38582#20070
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object Label2: TLabel
            Left = 58
            Top = 105
            Width = 216
            Height = 24
            Caption = #21024#38500#25152#26377#30340#24191#21578#20449#24687
            Font.Charset = GB2312_CHARSET
            Font.Color = clPurple
            Font.Height = -24
            Font.Name = #38582#20070
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object GroupBox1: TGroupBox
            Left = -144
            Top = 80
            Width = 185
            Height = 129
            Caption = #23646#24615
            TabOrder = 0
            Visible = False
            object RadioButton1: TRadioButton
              Left = 24
              Top = 24
              Width = 113
              Height = 17
              Caption = #25968#25454#26080#21387#32553
              Checked = True
              TabOrder = 0
              TabStop = True
            end
            object RadioButton2: TRadioButton
              Left = 24
              Top = 48
              Width = 113
              Height = 17
              Caption = 'gz'#21387#32553
              TabOrder = 1
            end
            object CheckBox1: TCheckBox
              Left = 24
              Top = 88
              Width = 97
              Height = 17
              Caption = #23494#25991
              TabOrder = 2
            end
          end
        end
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 64
    Top = 200
  end
  object PopupMenu1: TPopupMenu
    Left = 96
    Top = 257
    object N1: TMenuItem
      Caption = #26412#22320#24191#21578#25991#20214
      OnClick = N1Click
    end
  end
end
