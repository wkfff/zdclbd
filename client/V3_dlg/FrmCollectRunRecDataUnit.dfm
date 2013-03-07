inherited frmCollectRunRecData: TfrmCollectRunRecData
  Left = 223
  Top = 250
  Caption = #37319#38598#34892#39542#35760#24405#25968#25454
  ClientHeight = 360
  ClientWidth = 661
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 661
    Height = 360
    inherited Panel2: TPanel
      Top = 322
      Width = 661
      inherited BitBtn1: TBitBtn
        Left = 182
        Width = 86
        OnClick = BitBtn1Click
      end
      inherited BitBtn2: TBitBtn
        Left = 351
        Width = 86
      end
    end
    inherited Panel3: TPanel
      Left = 531
      Width = 130
      Height = 322
      inherited ListView1: TListView
        Width = 128
        Height = 263
      end
      inherited Panel4: TPanel
        Width = 128
      end
      inherited Panel6: TPanel
        Top = 293
        Width = 128
        inherited BitBtnSel: TBitBtn
          Width = 63
        end
        inherited BitBtn3: TBitBtn
          Left = 65
          Width = 63
        end
      end
    end
    inherited Panel5: TPanel
      Width = 531
      Height = 322
      inherited Panel7: TPanel
        Width = 531
        Height = 40
        Caption = #37319#38598#34892#39542#35760#24405#25968#25454
        Font.Color = 8302448
        Font.Style = [fsBold]
      end
      inherited PanProgress: TPanel
        Top = 299
        Width = 531
        inherited ProgressBar1: TProgressBar
          Width = 527
        end
      end
      object GroupBox1: TGroupBox
        Left = 9
        Top = 47
        Width = 512
        Height = 242
        Caption = #37319#38598#20869#23481
        TabOrder = 2
        object Notebook1: TNotebook
          Left = 2
          Top = 15
          Width = 508
          Height = 225
          Align = alClient
          TabOrder = 0
          object TPage
            Left = 0
            Top = 0
            Caption = 'old'
            object CheckBox_1: TCheckBox
              Left = 8
              Top = 8
              Width = 254
              Height = 17
              Caption = #39550#39542#21592#20195#30721#21450#23545#24212#26426#21160#36710#39550#39542#35777#21495#30721
              TabOrder = 0
            end
            object CheckBox_2: TCheckBox
              Left = 270
              Top = 8
              Width = 234
              Height = 17
              Caption = #35760#24405#20202#30340#23454#26102#26102#38047
              TabOrder = 1
            end
            object CheckBox_3: TCheckBox
              Left = 8
              Top = 39
              Width = 254
              Height = 17
              Caption = #26368#36817'360'#23567#26102#20869#30340#32047#35745#34892#39542#37324#31243#25968#25454
              TabOrder = 2
            end
            object CheckBox_4: TCheckBox
              Left = 270
              Top = 39
              Width = 234
              Height = 17
              Caption = #35760#24405#20202#20013#30340#36710#36742#29305#24449#31995#25968
              TabOrder = 3
            end
            object CheckBox_5: TCheckBox
              Left = 8
              Top = 70
              Width = 254
              Height = 17
              Caption = #26368#36817'360'#23567#26102#20869#30340#34892#39542#36895#24230#25968#25454
              TabOrder = 4
            end
            object CheckBox_6: TCheckBox
              Left = 270
              Top = 70
              Width = 234
              Height = 17
              Caption = #36710#36742'VIN'#21495#12289#36710#29260#21495#30721#12289#36710#36742#20998#31867
              TabOrder = 5
            end
            object CheckBox_7: TCheckBox
              Left = 8
              Top = 100
              Width = 254
              Height = 17
              Caption = #35760#24405#20202#20013#20107#25925#30097#28857#25968#25454
              TabOrder = 6
            end
            object CheckBox_8: TCheckBox
              Left = 8
              Top = 131
              Width = 254
              Height = 17
              Caption = #26368#36817'2'#20010#26085#21382#22825#20869#30340#32047#35745#34892#39542#37324#31243
              TabOrder = 7
            end
            object CheckBox_9: TCheckBox
              Left = 8
              Top = 162
              Width = 230
              Height = 17
              Caption = #26368#36817'2'#20010#26085#21382#22825#20869#30340#34892#39542#36895#24230#25968#25454
              TabOrder = 8
            end
            object CheckBox_11: TCheckBox
              Left = 8
              Top = 193
              Width = 463
              Height = 17
              Caption = #26368#36817'2'#20010#26085#21382#22825#20869#21516#19968#39550#39542#21592#36830#32493#39550#39542#26102#38388#36229#36807'3'#23567#26102#30340#25152#26377#35760#24405#25968#25454
              TabOrder = 9
            end
          end
          object TPage
            Left = 0
            Top = 0
            Caption = 'new'
            object CheckBox1: TCheckBox
              Left = 19
              Top = 37
              Width = 186
              Height = 17
              Caption = #37319#38598#24403#21069#39550#39542#20154#20449#24687
              TabOrder = 1
            end
            object CheckBox2: TCheckBox
              Left = 19
              Top = 62
              Width = 186
              Height = 17
              Caption = #37319#38598#35760#24405#20202#23454#26102#26102#38388
              TabOrder = 2
            end
            object CheckBox3: TCheckBox
              Left = 19
              Top = 87
              Width = 186
              Height = 17
              Caption = #37319#38598#32047#35745#34892#39542#37324#31243
              TabOrder = 3
            end
            object CheckBox4: TCheckBox
              Left = 19
              Top = 112
              Width = 186
              Height = 17
              Caption = #37319#38598#35760#24405#20202#33033#20914#31995#25968
              TabOrder = 4
            end
            object CheckBox5: TCheckBox
              Left = 19
              Top = 137
              Width = 186
              Height = 17
              Caption = #37319#38598#36710#36742#20449#24687
              TabOrder = 5
            end
            object CheckBox6: TCheckBox
              Left = 19
              Top = 162
              Width = 186
              Height = 17
              Caption = #37319#38598#35760#24405#20202#29366#24577#20449#21495#37197#32622#20449#24687
              TabOrder = 6
            end
            object CheckBox7: TCheckBox
              Left = 231
              Top = 12
              Width = 186
              Height = 17
              Caption = #37319#38598#35760#24405#20202#21807#19968#24615#32534#21495
              TabOrder = 7
            end
            object CheckBox8: TCheckBox
              Left = 231
              Top = 37
              Width = 186
              Height = 17
              Caption = #37319#38598#25351#23450#30340#34892#39542#36895#24230#35760#24405
              TabOrder = 8
            end
            object CheckBox9: TCheckBox
              Left = 231
              Top = 62
              Width = 186
              Height = 17
              Caption = #37319#38598#25351#23450#30340#20301#32622#20449#24687#35760#24405
              TabOrder = 9
            end
            object CheckBox10: TCheckBox
              Left = 231
              Top = 87
              Width = 186
              Height = 17
              Caption = #37319#38598#25351#23450#30340#20107#25925#30097#28857#35760#24405
              TabOrder = 10
            end
            object CheckBox11: TCheckBox
              Left = 231
              Top = 112
              Width = 186
              Height = 17
              Caption = #37319#38598#25351#23450#30340#36229#26102#39550#39542#35760#24405
              TabOrder = 11
            end
            object CheckBox12: TCheckBox
              Left = 231
              Top = 137
              Width = 186
              Height = 17
              Caption = #37319#38598#25351#23450#30340#39550#39542#20154#36523#20221#35760#24405
              TabOrder = 12
            end
            object CheckBox13: TCheckBox
              Left = 231
              Top = 162
              Width = 186
              Height = 17
              Caption = #37319#38598#25351#23450#30340#22806#37096#20379#30005#35760#24405
              TabOrder = 13
            end
            object CheckBox14: TCheckBox
              Left = 231
              Top = 187
              Width = 186
              Height = 17
              Caption = #37319#38598#25351#23450#30340#21442#25968#20462#25913#35760#24405
              TabOrder = 14
            end
            object CheckBox0: TCheckBox
              Left = 19
              Top = 12
              Width = 186
              Height = 17
              Caption = #37319#38598#35760#24405#20202#25191#34892#26631#20934#29256#26412
              TabOrder = 0
            end
          end
        end
      end
    end
  end
end
