Unit BleepInt; { Version 4.5 }

{ Copyright 1999 Andy Preston - Apollo Developments, Swindon U.K. andy@apollod.freeserve.co.uk

  HACKERS OF THE WORLD UNITE!    HACKERS OF THE WORLD UNITE!    HACKERS OF THE WORLD UNITE!    HACKERS OF THE WORLD UNITE!

  How to make your Delphi programs bleep like FRACTINT!  See Demo1.pas/Demo1.dfm or Bleepint.htm for details

  This unit is free software; you can redistribute it and/or modify it under the terms of the GNU Library General Public
  License as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version.

  This unit is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Library General Public License for more details.

  You should have received a copy of the GNU Library General Public License along with this unit; if not, write to the
  Free Software Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
}

Interface

Type
  TBleepType= (bOK, bInterrupt, bError);

Procedure ShutUp; { Added to help counter the effects of DoBleep (Freq, -1).
                    If you are producing a tone, & you want to stop without doing another Bleep, call this procedure }

Procedure DoBleep (Freq : Word; MSecs : LongInt); { Duration of -1 means bleep until the next bleep sent, or ShutUp is called }

Procedure Bleep (BleepType : TBleepType);

Implementation

Uses
  {$IFDEF WIN32} Windows {$ELSE} WinProcs {$ENDIF}
  {$IFNDEF CONSOLE}, Forms {$ENDIF};

{ -- --- -- --- -- --- -- --- -- --- -- --- -- --- Assembler Bits for Wind 3.x And '95 -- --- -- --- -- --- -- --- -- --- }

Procedure AsmShutUp; {$IFDEF WIN32} Pascal; {$ENDIF}
Begin
  Asm
    In AL, $61
    And AL, $FC
    Out $61, AL
  End;
End;

Procedure AsmBeep (Freq : Word); {$IFDEF WIN32} Pascal; {$ENDIF}
Label
  Skip;
Begin
  Asm
        Push BX
        In AL, $61
        Mov BL, AL
        And AL, 3
        Jne Skip
        Mov AL, BL
        Or AL, 3
        Out $61, AL
        Mov AL, $B6
        Out $43, AL
  Skip: Mov AX, Freq
        Out $42, AL
        Mov AL, AH
        Out $42, AL
        Pop BX
  End;
End;

{ -- --- -- --- -- --- -- --- -- --- -- --- -- --- Low Level Bits for Wind 3.x And '95 -- --- -- --- -- --- -- --- -- --- }

Procedure HardBleep (Freq : Word; MSecs : LongInt);
Const
  HiValue={$IFDEF WIN32}High (DWord){$ELSE}High (LongInt){$ENDIF};
Var
  iCurrTickCount, iFirstTickCount : {$IFDEF WIN32} DWord {$ELSE} LongInt {$ENDIF};
  iElapTime : LongInt;
Begin
  If (Freq>=20)And (Freq<=5000)Then Begin
    AsmBeep (Word (1193181 Div LongInt (Freq)));
    If MSecs>=0 Then Begin
      iFirstTickCount:=GetTickCount;
      Repeat
        {$IFNDEF CONSOLE}
        If MSecs>1000 Then Application.ProcessMessages;
        {$ENDIF}
        iCurrTickCount:=GetTickCount;
        { Has GetTickCount wrapped to 0 ? }
        If iCurrTickCount<iFirstTickCount Then iElapTime:=HiValue-iFirstTickCount+iCurrTickCount
        Else iElapTime:=iCurrTickCount-iFirstTickCount;
      Until iElapTime>=MSecs;
      AsmShutUp;
    End;
  End;
End;

{ This is the old 'succumbs to Murphy's Law version of HardBleep              }
{ I'll delete it later - it's here just in case Murphy's Law hits the new one }
{ Why have I used (* *) style comments to hide it?                            }

(* Procedure HardBleep (Freq : Word; MSecs : Integer);
   Var
    FirstTickCount : {$IFDEF WIN32} DWord {$ELSE} LongInt {$ENDIF};
   Begin
     If (Freq>=20) And (Freq<=5000) Then Begin
       AsmBeep (Word (1193181 Div LongInt(Freq)));
       If MSecs>-1 Then Begin
         FirstTickCount:=GetTickCount;
         Repeat
           {$IFNDEF CONSOLE} If MSecs>1000 Then Application.ProcessMessages; {$ENDIF}
         Until ((GetTickCount-FirstTickCount)>{$IFDEF WIN32} DWord {$ELSE} LongInt {$ENDIF}(MSecs));
         AsmShutUp;
       End;
     End;
   End; *)

{ -- --- -- --- -- --- -- --- -- --- -- --- -- --- -- --- Procedures for you to use -- --- -- --- -- --- -- --- -- --- -- --- }

Procedure Bleep (BleepType : TBleepType);
Begin
  Case BleepType Of
    bOK : Begin
        DoBleep (1047, 100);
        DoBleep (1109, 100);
        DoBleep (1175, 100);
      End;
    bInterrupt : Begin
        DoBleep (2093, 100);
        DoBleep (1976, 100);
        DoBleep (1857, 100);
      End;
    bError : DoBleep (40, 500);
  End;
End;

{$IFDEF WIN32}
Var
  SysWinNT : Boolean;
  {$ENDIF}

Procedure DoBleep (Freq : Word; MSecs : LongInt);
Begin
  If MSecs<-1 Then MSecs:=0;
  {$IFDEF WIN32} If SysWinNT Then Windows.Beep (Freq, MSecs)Else {$ENDIF} HardBleep (Freq, MSecs);
End;

Procedure ShutUp;
Begin
  {$IFDEF WIN32} If SysWinNT Then Windows.Beep (1, 0)Else {$ENDIF} AsmShutUp;
End;

{$IFDEF WIN32}

Procedure InitSysType;
Var
  VersionInfo : TOSVersionInfo;
Begin
  VersionInfo.dwOSVersionInfoSize:=SizeOf (VersionInfo);
  GetVersionEx (VersionInfo);
  SysWinNt:=VersionInfo.dwPlatformID=VER_PLATFORM_WIN32_NT;
End;

Initialization
  InitSysType;

{$ENDIF}

End.
