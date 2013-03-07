object SendOrderMiniFrm: TSendOrderMiniFrm
  Left = 168
  Top = 353
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #21457#36865#35746#21333
  ClientHeight = 219
  ClientWidth = 1106
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnDeactivate = FormDeactivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1106
    Height = 219
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel2'
    TabOrder = 0
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 984
      Height = 219
      Align = alClient
      TabOrder = 0
      object Panel6: TPanel
        Left = 1
        Top = 1
        Width = 251
        Height = 217
        Align = alLeft
        BevelInner = bvLowered
        BevelOuter = bvNone
        TabOrder = 0
        object Label1: TLabel
          Left = 31
          Top = 28
          Width = 55
          Height = 13
          AutoSize = False
          Caption = #20056#23458#30005#35805
          FocusControl = EditCustomTel
        end
        object Label3: TLabel
          Left = 30
          Top = 64
          Width = 56
          Height = 13
          AutoSize = False
          Caption = #35746#21333'ID'#21495
        end
        object Label4: TLabel
          Left = 4
          Top = 99
          Width = 82
          Height = 13
          AutoSize = False
          Caption = #25104#21151#25250#21333#30340#36710
        end
        object Label5: TLabel
          Left = 30
          Top = 134
          Width = 56
          Height = 13
          AutoSize = False
          Caption = #35746#21333#29366#24577
        end
        object Label9: TLabel
          Left = 5
          Top = 170
          Width = 81
          Height = 13
          AutoSize = False
          Caption = #21462#28040#35746#21333#21407#22240
        end
        object EditCustomTel: TEdit
          Left = 87
          Top = 24
          Width = 158
          Height = 21
          MaxLength = 16
          TabOrder = 0
          Text = 'EditCustomTel'
          OnExit = EditCustomTelExit
          OnKeyPress = EditCustomTelKeyPress
        end
        object EditOrderID: TEdit
          Left = 87
          Top = 60
          Width = 158
          Height = 21
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 1
          Text = 'EditOrderID'
        end
        object EditOKCarNO: TEdit
          Left = 87
          Top = 95
          Width = 158
          Height = 21
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 2
          Text = 'EditOKCarNO'
        end
        object EditState: TEdit
          Left = 87
          Top = 130
          Width = 158
          Height = 21
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 3
          Text = 'EditState'
        end
        object EditCancelReason: TEdit
          Left = 87
          Top = 166
          Width = 158
          Height = 21
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 4
          Text = 'EditCancelReason'
        end
      end
      object Panel1: TPanel
        Left = 252
        Top = 1
        Width = 293
        Height = 217
        Align = alLeft
        BevelInner = bvLowered
        BevelOuter = bvNone
        TabOrder = 1
        object Label7: TLabel
          Left = 8
          Top = 135
          Width = 55
          Height = 13
          AutoSize = False
          Caption = #20056#23458#22995#27663
        end
        object Label2: TLabel
          Left = 9
          Top = 195
          Width = 55
          Height = 13
          AutoSize = False
          Caption = #39044#32422#26102#38388
          FocusControl = DateTimePickerDate
        end
        object Label6: TLabel
          Left = 8
          Top = 164
          Width = 55
          Height = 13
          AutoSize = False
          Caption = #35746#21333#31867#22411
          FocusControl = ComboBoxType
        end
        object Label8: TLabel
          Left = 8
          Top = 24
          Width = 55
          Height = 13
          AutoSize = False
          Caption = #20056#36710#22320#28857
          FocusControl = EditAddress
        end
        object Label10: TLabel
          Left = 8
          Top = 69
          Width = 52
          Height = 13
          Caption = #19994#21153#25551#36848
        end
        object ComboBoxName: TComboBox
          Left = 169
          Top = 130
          Width = 61
          Height = 21
          ItemHeight = 13
          ItemIndex = 0
          MaxLength = 4
          TabOrder = 3
          Text = #20808#29983
          OnKeyPress = ComboBoxNameKeyPress
          Items.Strings = (
            #20808#29983
            #22899#22763)
        end
        object ComboBoxType: TComboBox
          Left = 64
          Top = 160
          Width = 145
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 4
          OnChange = ComboBoxTypeChange
          OnKeyPress = ComboBoxTypeKeyPress
          Items.Strings = (
            #21363#26102#35746#21333
            #39044#32422#35746#21333
            #24613#21484#35746#21333)
        end
        object DateTimePickerDate: TDateTimePicker
          Left = 64
          Top = 189
          Width = 95
          Height = 21
          Date = 38609.720743993060000000
          Format = 'yyyy-MM-dd'
          Time = 38609.720743993060000000
          TabOrder = 5
          OnExit = DateTimePickerDateExit
          OnKeyPress = DateTimePickerDateKeyPress
        end
        object DateTimePickerTime: TDateTimePicker
          Left = 159
          Top = 189
          Width = 82
          Height = 21
          Date = 38609.720911273150000000
          Time = 38609.720911273150000000
          Kind = dtkTime
          TabOrder = 6
          OnExit = DateTimePickerTimeExit
          OnKeyPress = DateTimePickerTimeKeyPress
        end
        object EditName: TComboBox
          Left = 64
          Top = 130
          Width = 104
          Height = 21
          CharCase = ecUpperCase
          ItemHeight = 13
          TabOrder = 2
          OnChange = EditNameChange
          OnEnter = EditNameEnter
          OnKeyPress = EditNameKeyPress
          OnSelect = EditNameSelect
        end
        object EditAddress: TMemo
          Left = 64
          Top = 22
          Width = 222
          Height = 42
          Lines.Strings = (
            'EditAddress')
          MaxLength = 180
          ScrollBars = ssVertical
          TabOrder = 0
          OnChange = EditAddressChange
          OnKeyPress = EditAddressKeyPress
        end
        object memoDesc: TMemo
          Left = 64
          Top = 67
          Width = 222
          Height = 58
          ScrollBars = ssVertical
          TabOrder = 1
        end
      end
      object Panel5: TPanel
        Left = 545
        Top = 1
        Width = 307
        Height = 217
        Align = alClient
        BevelInner = bvLowered
        BevelOuter = bvNone
        TabOrder = 2
        object Panel9: TPanel
          Left = 1
          Top = 1
          Width = 305
          Height = 59
          Align = alTop
          TabOrder = 0
          object Label11: TLabel
            Left = 5
            Top = 37
            Width = 91
            Height = 13
            Caption = #36873#36710#21322#24452#33539#22260#65306
          end
          object Label12: TLabel
            Left = 152
            Top = 37
            Width = 26
            Height = 13
            Caption = #20844#37324
          end
          object BitBtnQuery: TBitBtn
            Left = 151
            Top = 4
            Width = 67
            Height = 25
            Caption = #22320#28857#26597#35810
            TabOrder = 0
            OnClick = BitBtnQueryClick
          end
          object ComboBoxAddress: TComboBox
            Left = 2
            Top = 8
            Width = 149
            Height = 21
            CharCase = ecUpperCase
            ItemHeight = 13
            TabOrder = 1
            Text = 'COMBOBOXADDRESS'
            OnChange = ComboBoxAddressChange
            OnExit = ComboBoxAddressExit
            OnKeyPress = ComboBoxAddressKeyPress
            OnSelect = ComboBoxAddressSelect
          end
          object Edit1: TEdit
            Left = 93
            Top = 33
            Width = 57
            Height = 21
            TabOrder = 2
            Text = '1.0'
          end
        end
        object cxAddressList: TcxTreeList
          Left = 1
          Top = 60
          Width = 305
          Height = 156
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
          OptionsSelection.CellSelect = False
          OptionsView.GridLines = tlglBoth
          OptionsView.ShowRoot = False
          ParentFont = False
          TabOrder = 1
          OnDblClick = cxAddressListDblClick
          object cxAddress: TcxTreeListColumn
            Caption.Text = #22320#28857#21517#31216
            DataBinding.ValueType = 'String'
            Options.Editing = False
            Width = 191
            Position.ColIndex = 0
            Position.RowIndex = 0
            Position.BandIndex = 0
            SortOrder = soAscending
          end
          object cxAddressListcxTreeListColumn1: TcxTreeListColumn
            Visible = False
            DataBinding.ValueType = 'Integer'
            Position.ColIndex = 1
            Position.RowIndex = 0
            Position.BandIndex = 0
          end
        end
      end
      object Panel7: TPanel
        Left = 852
        Top = 1
        Width = 131
        Height = 217
        Align = alRight
        BevelInner = bvLowered
        TabOrder = 3
        object ListView1: TListView
          Left = 2
          Top = 2
          Width = 127
          Height = 213
          Align = alClient
          Columns = <
            item
              AutoSize = True
              Caption = #21457#36865#20197#19979#36710#29260#21495
            end
            item
              Caption = #36317#31163
              Width = 45
            end>
          GridLines = True
          MultiSelect = True
          ReadOnly = True
          RowSelect = True
          TabOrder = 0
          ViewStyle = vsReport
        end
      end
    end
    object Panel10: TPanel
      Left = 984
      Top = 0
      Width = 122
      Height = 219
      Align = alRight
      TabOrder = 1
      object BitBtnSend: TBitBtn
        Left = 19
        Top = 14
        Width = 75
        Height = 41
        Caption = #21457#36865'&S'
        ModalResult = 1
        TabOrder = 0
        OnClick = BitBtnSendClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        Layout = blGlyphTop
        NumGlyphs = 2
      end
      object BitBtnCancel: TBitBtn
        Left = 19
        Top = 54
        Width = 75
        Height = 25
        Caption = #21462#28040#35746#21333'&L'
        TabOrder = 1
        Visible = False
        OnClick = BitBtnCancelClick
      end
      object BitBtnSel: TBitBtn
        Left = 19
        Top = 78
        Width = 75
        Height = 25
        Caption = #37325#26032#36873#25321
        TabOrder = 3
        OnClick = BitBtnSelClick
      end
      object BitBtn4: TBitBtn
        Left = 19
        Top = 102
        Width = 75
        Height = 25
        Cancel = True
        Caption = #31227#38500
        TabOrder = 4
        OnClick = BitBtn4Click
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
      object BitBtnClose: TBitBtn
        Left = 19
        Top = 126
        Width = 75
        Height = 25
        Caption = #36716#25237#35785#30005#35805
        TabOrder = 2
        Visible = False
        OnClick = BitBtnCloseClick
        NumGlyphs = 2
      end
      object rgSendOption: TRadioGroup
        Left = 7
        Top = 157
        Width = 98
        Height = 57
        Caption = #21457#36865#36873#39033
        ItemIndex = 0
        Items.Strings = (
          #25353#31215#20998#39640#20302
          #25353#36317#31163#36828#36817)
        TabOrder = 5
      end
    end
  end
  object TimerShow: TTimer
    Enabled = False
    Interval = 1
    OnTimer = TimerShowTimer
    Left = 149
    Top = 81
  end
  object TimerClose: TTimer
    Enabled = False
    Interval = 1
    OnTimer = TimerCloseTimer
    Left = 141
    Top = 41
  end
end
