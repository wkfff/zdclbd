object ConfineAreaSetFrm: TConfineAreaSetFrm
  Left = 412
  Top = 302
  BorderStyle = bsDialog
  Caption = #35774#32622#30005#23376#22260#26639#21306#22495
  ClientHeight = 280
  ClientWidth = 466
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 466
    Height = 280
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    Color = 16382438
    TabOrder = 0
    object BitBtn_ok: TBitBtn
      Left = 132
      Top = 241
      Width = 75
      Height = 25
      Caption = #30830#23450
      Default = True
      TabOrder = 0
      OnClick = BitBtn_okClick
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC000000C40E0000C40E00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888800000008888008888888888800000008880220888888888800000008802
        2220888888888000000088222222088888888000000080222222208888888000
        0000822222222208888880000000822228B222208888800000008222288B2222
        0888800000008B222888B22220888000000088B228888B22220880000000888B
        B88888B222208000000088888888888B222200000000888888888888B2222000
        00008888888888888B222000000088888888888888B220000000888888888888
        888880000000}
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 10
      Width = 258
      Height = 218
      Caption = #30005#23376#22260#26639#21306#22495
      TabOrder = 1
      object Label1: TLabel
        Left = 32
        Top = 26
        Width = 39
        Height = 13
        Caption = #32534#21495#65306
      end
      object Label2: TLabel
        Left = 32
        Top = 50
        Width = 39
        Height = 13
        Caption = #21517#31216#65306
      end
      object Label3: TLabel
        Left = 168
        Top = 42
        Width = 39
        Height = 13
        Caption = #39068#33394#65306
        Visible = False
      end
      object SpeedButton1: TSpeedButton
        Left = 300
        Top = 38
        Width = 21
        Height = 21
        Caption = '...'
        Visible = False
        OnClick = SpeedButton1Click
      end
      object Label4: TLabel
        Left = 32
        Top = 76
        Width = 39
        Height = 13
        Caption = #31867#22411#65306
      end
      object Label5: TLabel
        Left = 135
        Top = 185
        Width = 33
        Height = 13
        Caption = #38480#36895':'
      end
      object Label6: TLabel
        Left = 135
        Top = 121
        Width = 46
        Height = 13
        Caption = #20844#37324'/'#26102
      end
      object Label10: TLabel
        Left = 124
        Top = 185
        Width = 52
        Height = 13
        Caption = #36710#36742#25968#65306
      end
      object Label11: TLabel
        Left = 135
        Top = 121
        Width = 13
        Height = 13
        Caption = #36742
      end
      object Edit_AreaID: TEdit
        Left = 65
        Top = 22
        Width = 100
        Height = 21
        Color = clSilver
        ReadOnly = True
        TabOrder = 0
        Text = 'Edit_AreaID'
      end
      object Edit_AreaName: TEdit
        Left = 65
        Top = 46
        Width = 100
        Height = 21
        MaxLength = 30
        TabOrder = 1
        Text = 'Edit_AreaName'
      end
      object Edit_AreaColor: TEdit
        Left = 201
        Top = 38
        Width = 100
        Height = 21
        ReadOnly = True
        TabOrder = 2
        Text = 'Edit_AreaColor'
        Visible = False
        OnDblClick = SpeedButton1Click
      end
      object CheckBox_IsDraw: TCheckBox
        Left = 10
        Top = 174
        Width = 97
        Height = 17
        Caption = #22312#22320#22270#20013#30011#20986
        Checked = True
        State = cbChecked
        TabOrder = 3
      end
      object ComboBox_AreaType: TComboBox
        Left = 65
        Top = 72
        Width = 119
        Height = 20
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ItemHeight = 12
        ParentFont = False
        TabOrder = 4
        Text = 'ComboBox_AreaType'
        OnChange = ComboBox_AreaTypeChange
        Items.Strings = (
          #36710#36742#39542#20986#21306#22495#25253#35686
          #36710#36742#39542#20837#21306#22495#25253#35686
          #32447#36335#20851#38190#28857#30417#25511#25253#35686)
      end
      object Edit_LimitSpeet: TEdit
        Left = 169
        Top = 181
        Width = 67
        Height = 21
        MaxLength = 5
        TabOrder = 5
        Text = 'Edit_LimitSpeet'
        OnKeyPress = Edit_LimitSpeetKeyPress
      end
      object CheckBoxShowPop: TCheckBox
        Left = 10
        Top = 194
        Width = 97
        Height = 17
        Caption = #26174#31034#25253#35686#25552#31034
        Checked = True
        State = cbChecked
        TabOrder = 6
      end
      object Panel2: TPanel
        Left = 4
        Top = 95
        Width = 249
        Height = 70
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 7
        Visible = False
        object Notebook1: TNotebook
          Left = 0
          Top = 0
          Width = 249
          Height = 70
          Align = alClient
          PageIndex = 2
          TabOrder = 0
          object TPage
            Left = 0
            Top = 0
            Caption = 'Default'
            object Label12: TLabel
              Left = 3
              Top = 5
              Width = 65
              Height = 13
              Caption = #38450#20266#20449#24687#65306
            end
            object Label13: TLabel
              Left = 3
              Top = 29
              Width = 65
              Height = 13
              Caption = #38450#20266#22270#29255#65306
            end
            object SpeedButton2: TSpeedButton
              Left = 185
              Top = 25
              Width = 23
              Height = 22
              Caption = '...'
              OnClick = SpeedButton2Click
            end
            object editText: TEdit
              Left = 62
              Top = 1
              Width = 121
              Height = 21
              MaxLength = 4
              TabOrder = 0
            end
            object editFilePath: TEdit
              Left = 62
              Top = 25
              Width = 121
              Height = 21
              TabOrder = 1
            end
            object RadioButton1: TRadioButton
              Left = 60
              Top = 50
              Width = 52
              Height = 17
              Caption = #25991#23383
              Checked = True
              TabOrder = 2
              TabStop = True
            end
            object RadioButton2: TRadioButton
              Left = 132
              Top = 50
              Width = 49
              Height = 17
              Caption = #22270#29255
              TabOrder = 3
            end
          end
          object TPage
            Left = 0
            Top = 0
            Caption = 'page1'
            object Label14: TLabel
              Left = 5
              Top = 5
              Width = 65
              Height = 13
              Caption = #26368#20302#36895#24230#65306
            end
            object Label15: TLabel
              Left = 5
              Top = 29
              Width = 65
              Height = 13
              Caption = #25345#32493#26102#38388#65306
            end
            object Label16: TLabel
              Left = 183
              Top = 29
              Width = 26
              Height = 13
              Caption = #20998#38047
            end
            object editMinSpeed: TEdit
              Left = 63
              Top = 1
              Width = 121
              Height = 21
              TabOrder = 0
            end
            object editMaintainTime: TEdit
              Left = 63
              Top = 25
              Width = 121
              Height = 21
              TabOrder = 1
            end
          end
          object TPage
            Left = 0
            Top = 0
            Caption = 'line'
            object Label17: TLabel
              Left = 8
              Top = 8
              Width = 52
              Height = 13
              Caption = #21040#36798#26102#38388
            end
            object Label18: TLabel
              Left = 8
              Top = 38
              Width = 52
              Height = 13
              Caption = #31163#24320#26102#38388
            end
            object arriveDate: TDateTimePicker
              Left = 64
              Top = 4
              Width = 95
              Height = 21
              Date = 40777.446802835650000000
              Time = 40777.446802835650000000
              TabOrder = 0
            end
            object arriveTime: TDateTimePicker
              Left = 159
              Top = 4
              Width = 82
              Height = 21
              Date = 40777.447166701400000000
              Time = 40777.447166701400000000
              Kind = dtkTime
              TabOrder = 1
            end
            object leaveDate: TDateTimePicker
              Left = 64
              Top = 30
              Width = 95
              Height = 21
              Date = 40777.448991423610000000
              Time = 40777.448991423610000000
              TabOrder = 2
            end
            object leaveTime: TDateTimePicker
              Left = 160
              Top = 30
              Width = 82
              Height = 21
              Date = 40777.449106979170000000
              Time = 40777.449106979170000000
              Kind = dtkTime
              TabOrder = 3
            end
          end
        end
      end
    end
    object BitBtn_Cancel: TBitBtn
      Left = 260
      Top = 241
      Width = 75
      Height = 25
      Cancel = True
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 2
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object GroupBox2: TGroupBox
      Left = 273
      Top = 10
      Width = 185
      Height = 218
      Enabled = False
      TabOrder = 3
      object Label7: TLabel
        Left = 15
        Top = 37
        Width = 59
        Height = 13
        Caption = #24320#22987#26102#38388':'
      end
      object Label8: TLabel
        Left = 15
        Top = 77
        Width = 59
        Height = 13
        Caption = #32467#26463#26102#38388':'
      end
      object Label9: TLabel
        Left = 5
        Top = 123
        Width = 177
        Height = 39
        Caption = #27880':'#13'  '#22914#26524#24320#22987#26102#38388#22823#20110#32467#26463#26102#38388','#13'  '#21017#32467#26463#26102#38388#20026#31532#20108#22825#30340#26102#38388'.'
        Font.Charset = GB2312_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object BeginTime: TDateTimePicker
        Left = 82
        Top = 33
        Width = 81
        Height = 21
        Date = 39456.708333333340000000
        Time = 39456.708333333340000000
        Color = clBtnFace
        Kind = dtkTime
        TabOrder = 0
      end
      object EndTime: TDateTimePicker
        Left = 82
        Top = 73
        Width = 81
        Height = 21
        Date = 39456.250000000000000000
        Time = 39456.250000000000000000
        Color = clBtnFace
        Kind = dtkTime
        TabOrder = 1
      end
    end
    object CheckBoxEnabledTime: TCheckBox
      Left = 276
      Top = 7
      Width = 97
      Height = 17
      Caption = #21551#29992#26377#25928#26102#38388
      TabOrder = 4
      OnClick = CheckBoxEnabledTimeClick
    end
  end
  object ColorDialog1: TColorDialog
    Left = 136
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '.bmp'
    Filter = '*.bmp|*.bmp'
    Left = 208
    Top = 134
  end
end
