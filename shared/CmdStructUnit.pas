{ͨѶʱ����ṹ�弰�����ֵĶ���
��@author()
  @created(2004-03-)
  @lastmod(GMT:$Date: 2012/11/30 01:29:23 $) <BR>
  ��������:$Author: wfp $  <BR>
  ��ǰ�汾:$Revision: 1.2 $  <BR>}

unit CmdStructUnit;

interface


uses
  Windows, winsock, Types;

const
       FACT_ID = $22; //���ұ��
  MAC_TYPE = $00; // �豸����
  LCD_FACT_ID = $00;  // lcd�ĳ��̱�ʶ

  METER_TYPEID = $02; // �Ƽ���
  TSM_TYPEID = $03; // TMS
  LED_TYPEID = $04; // LED
  LIGHT_TYPEID = $05; // ���ܶ���
  LCD_TYPEID = $09; // LCD
  {����ͨѶЭ��  �汾�������� MajorVer=XX,MinorVer=XX
  @see TCmdTermsrvRegverData}
  DATAPROTOCOL_10 = $0100;
  DATAPROTOCOL_20 = $0200;
  DEVPROTOCOL_20 = $02; //�복��2.0��ͨѶ�汾2.0
  DEVPROTOCOL_30 = 30; //��AES���ܹ��ĳ���ͨѶ�汾 3.0 (Ϊ��DevVer��Ӧ������ȡֵ30)20070830.sha



  TERMSRV_SENDCONTROLINFO_NEEDDEVANSWER = $15; // �ͻ���->���� ������ظ��ĵ�����Ϣ (�����ı���Ϣ)
  CLIENT_SETELCFENCE = $4B; //���ó����ĵ���Χ��
  SEV_DEVClientArea = $4B;
  TCLIENT_READSAVEELCFENCE = $4C; //��ȡ�����ڴ洢�ĵ���Χ��
  SEV_READSAVEELCFENCE=$4C;
  TCLIENT_CANCELDESIGNFENCE = $4D; //ȡ��ָ���ĵ���Χ����Ϣ
  SEV_CANCELDESIGNFENCE=$4D;

  //
//  
//  (*************�ͻ���������֮�� �������ʶ�������� ******************)
//  //TERMSRV_COMMVER = $01;
//  //SRVTERM_COMMVER = $81;
//  TERMSRV_REG = $01;  // ע��
//  SRVTERM_REG = $81;  // ע��Ӧ��
//  TERMSRV_GETLASTPOS = $03;
//  SRVTERM_GETLASTPOS = $83;
//
//  (*===�ͻ���������V1.0=========== *)
//  TERMSRV_GETDEVSTAT = $04;
//  SRVTERM_GETDEVSTAT = $84;
//  SRVTERM_GPSDATA = $85;
//  TERMSRV_CALLDEV = $06;
//  SRVTERM_CALLDEV = $86;
//  TERMSRV_SWCTRL = $07;
//  SRVTERM_SWCTRL = $87;
//  TERMSRV_SENDDEVMSG = $08;
//  SRVTERM_SENDDEVMSG = $88;
//  SRVTERM_SENDMSG = $89;
//  TERMSRV_PING = $0A;
//  SRVTERM_PING = $8A;
//  SRVTERM_NOTIFYMSG = $8B; //���ط��������ͻ��˷���֪ͨ��Ϣ
//  TERMSRV_CANCELCMD = $0C; //ȡ������
//  SRVTERM_CANCELCMD = $8C;
//  SRVTERM_LASTGPSDATA = $8D; //���ص����ݽṹͬGpsData���Ǳ�ʱ�Ƿ�������Ӧ��������������ص�.
//  TERMSRV_SENDTODTE = $0E; //�������������DTE
//  SRVTERM_SENDTODTE = $8E;
//  SRVTERM_DEVTOHOST = $8F; //�յ����DTE���͸�����������
//  SRVTERM_CMDDELTED = $90; //���ɾ��.
//  TERMSRV_READDEVPARAM = $11; //��ȡ�豸����
//  SRVTERM_READDEVPARAM = $91; //�����豸�Ĳ�������
//  TERMSRV_SETDEVPARAM = $12; //�����豸����
//  SRVTERM_SETDEVPARAM = $92; //���������豸���������ִ�н��
//
//  (*=======�ͻ��� V2.0 ������=====�������V1.0���ƺ���ģ�V2.0����������ԭ�������_V2 *)
//  TERMSRV_GETDEVSTAT_V2 = $04; //��1.0�汾��������ֵһ�������ṹ�嶨����������
//  SRVTERM_GETDEVSTAT_V2 = $84;
//  TERMSRV_GETPOSITION = $13; // �ͻ���->���� ȡ������λ����
////  SRVTERM_GETPOSITION = $93;
//  TERMSRV_PURSUE = $14; // �ͻ���->���� ׷�ٳ���
//  SRVTERM_PURSUE = $94;
//  TERMSRV_SETDEVPARAM_V2 = $15; // �ͻ���->���� ���ò��� ��==Ϊʾ��1.0�汾�����������ֺ��2
//
//  SRVTERM_SETDEVPARAM_V2 = $95;
//  TERMSRV_READDEVPARAM_V2 = $1D; // �ͻ���->����  ��ѯ����
//  SRVTERM_READDEVPARAM_V2 = $9D;
//  TERMSRV_REMOVEALARM = $16; // �ͻ���->���� �������
//  SRVTERM_REMOVEALARM = $96;
//  TERMSRV_MODIFYDEVDISPLAYNAME = $17; // �ͻ���->���� �޸ĳ�����ʾ�� �����湫˾����
//  SRVTERM_MODIFYDEVDISPLAYNAME = $97;
//  TERMSRV_MODIFYDEVDISPLAYFIXEDMENU = $18; // �ͻ���->���� �޸ĳ�����ʾ�� �̶��˵�
//  SRVTERM_MODIFYDEVDISPLAYFIXEDMENU = $98;
//  TERMSRV_SENDCONTROLINFO = $19; // �ͻ���->���� �����ı�������Ϣ
//  SRVTERM_SENDCONTROLINFO = $99;
//  TERMSRV_SENDCONTROLINFO_NEEDDEVANSWER = $15; // �ͻ���->���� ������ظ��ĵ�����Ϣ (�����ı���Ϣ)
//  SRVTERM_SENDCONTROLINFO_NEEDDEVANSWER = $AA;
//  TERMSRV_SETTELLIST = $1B; // �ͻ���->���� ���õ绰��
//  TERMSRV_SETEVENTLIST = $16; // �ͻ���->���� �����¼�
//  SRVTERM_SETTELLIST = $AB;
//  TERMSRV_UPDATEDEVFIRMWARE = $1C; // �ͻ���->���� ���������̼�����
//  SRVTERM_UPDATEDEVFIRMWARE = $AC;
//    //--- ����
//  TEMRSRV_MODIFYDEVDISPLAY_CANCELORDERMENU = $1E; //�޸ĳ�����ʾ��ȡ�������Ĳ˵�
//  SRVTERM_MODIFYDEVDISPLAY_CANCELORDERMENU = $C0;
//  TERMSRV_DOWNAORDER = $1F; //�·�һ������������
//  SRVTERM_DOWNAORDER = $C1;
//  TERMSRV_DOWNCANCELORDER = $38; //�·�����ȡ��
//  SRVTERM_DOWNCANCELORDER = $C2;
//    //--- ���������ظ��ͻ���
//  SRVTERM_ORDERCHANGED = $C3; //������״̬�б仯ʱ������֪ͨ�ͻ���ȥ���¶�����Ϣ
//
//  //��������\�ϵ�\����\���繦�ܣ�2005.12.20
//  TERMSRV_CUTORFEED_OIL_ELECTRICITY = $21; // �ͻ���->���� ����\�ϵ�\����\����
//  SRVTERM_CUTORFEED_OIL_ELECTRICITY = $C4;
//  //���� ��������������  2006-3-24
//  TERMSRV_READTESTDATA = $22; //�ͻ���->���ض�ȡ������������
//  SRVTERM_READTESTDATA = $C5;
//  //�������������汾���ݡ�2006-4-26
//  TERMSRV_READDEVVER = $23; //�ͻ���->���ض�ȡ�����汾����
//  SRVTERM_READDEVVER = $C6;
//  //����˾��������� 2006-8-25
//  TERMSRV_SETDRIVERS = $24; //�ͻ���->���� ����˾����Ϣ
//  SRVTERM_SETDRIVERS = $C7;
//  TERMSRV_READDRIVERS = $25; //              ��ȡ˾����Ϣ
//  SRVTERM_READDRIVERS = $C8;
//  TERMSRV_READCURRENTDRIVER = $26; //              ��ȡ��ǰ˾��
//  SRVTERM_UPLOADCURRENTDRIVER = $C9; //����->�ͻ��ˡ��ϴ���ǰ˾��
//  SRVTERM_UPLOADDRIVERLOGOUT = $CA; //����->�ͻ��ˡ��ϴ�˾���°��˳�
//  //�����ͻ����ó�����һ���� 2006-12-18
//  TERMSRV_GETAPIC = $27; //�ͻ���->���� ���գ��ĵ�ǰ��Ƭ
//  SRVTERM_GETAPIC = $CB; //����->�ͻ��� �ظ�
//  //20070518 ����
//  TERMSRV_READFLUX = $28; //�ͻ���->���أ���ȡ��ǰ����
//  SRVTERM_UPLOADFLUX = $CC; //����->�ͻ��ˡ��յ����� �ϴ�����
//  //2007-8-23 ���ӹ���������
//  TERMSRV_DOWNANAD = $29; //�ͻ���->���أ��·�һ�������Ϣ
//  SRVTERM_DOWNANAD = $CD;
//  TERMSRV_DELANAD = $2A; //�ͻ���->���أ�ɾ��һ�������Ϣ
//  SRVTERM_DELANAD = $CE;
//  TERMSRV_DELALLAD = $2B; //�ͻ���->���أ�ɾ�����й����Ϣ
//  SRVTERM_DELALLAD = $CF;
//  TERMSRV_READALLADID = $2C; //�ͻ���->���أ���ȡ���������й���ID
//  SRVTERM_READALLADID = $D0;
//  TERMSRV_DOWNALLWAY = $2D; //�ͻ���->���أ��·�����������ʾ����
//  SRVTERM_DOWNALLWAY = $D1;
//  TERMSRV_DOWNLISTENCALLNUM = $2E; // �ͻ���->���أ����ó����������Ⲧ��ļ������� 2007-9-24
//  SRVTERM_DOWNLISTENCALLNUM = $D2;
//  TERMSRV_DOWNGENERICCOMMAND = $2F; //�ͻ���->���أ��ͻ��˷���ͨ��������ز�����   2007-10-08  (wlei)
//  SRVTERM_DOWNGENERICCOMMAND = $D3;
//  TERMSRV_DOWNABUSSTATIONINFO = $30; //�ͻ���->���أ�����һ��վ����Ϣ 2007-10-17
//  SRVTERM_DOWNABUSSTATIONINFO = $D4;
//  SRVTERM_INORDOWNSTATION = $D5; //����->�ͻ���  �ϴ�������վ���վ
//  TERMSRV_CLEARBUSSTATIONINFO = $31; //�ͻ���-�����أ���������е�վ����Ϣ
//  SRVTERM_CLEARBUSSTATIONINFO = $D6; //����->�ͻ���
//  //2008-05-09������ص��°���,�ͻ��˷������ص������ֺ����ػظ��������ݶ�Ϊͬһ��
//  TERMSRV_DOWNLED_NEW = $32; //�ͻ���->���أ��·������Ϣ
//  SRVTERM_DOWNLED_NEW = $32;
//  TERMSRV_DISCURRLED_NEW = $33; //�ͻ���->���أ���ʾ��ǰ�Ĺ��
//  SRVTERM_DISCURRLED_NEW = $33;
//  TERMSRV_DELETELEDBYID_NEW = $34; //�ͻ���->���أ�ɾ��ָ��ID���
//  SRVTERM_DELETELEDBYID_NEW = $34;
//  TERMSRV_DELETELED_NEW = $35; //�ͻ���->���أ�ɾ�����еĹ��
//  SRVTERM_DELETELED_NEW = $35;
//  TERMSRV_SETLEDTIME_NEW = $36; //�ͻ���-�����أ�����LEDʱ��
//  SRVTERM_SETLEDTIME_NEW = $36;
//  TERMSRV_READLEDINFO_NEW = $37; //�ͻ���->���أ���ȡ����Ϣ
//  SRVTERM_READLEDINFO_NEW = $37;
//  TERMSRV_READALLADID_NEW = $38; //�ͻ���->���أ���ȡ���й��ID
//  SRVTERM_READALLADID_NEW = $38;
//  TERMSRV_DISSAVELEDBYID = $39; //�ͻ���->���أ���ʾ�洢�Ĺ��ID
//  SRVTERM_DISSAVELEDBYID = $39;
//  TErMsRV_ShowLedSaveID = $49; //������ʾLED����ָ��
//  SRVTERM_ShowLedSaveID = $49; //
//  TERMSRV_DISSAVELEDIsState = $4A; //�ͻ���->���أ�LED������ָ��  ͨ��Ӧ��
//  SRVTERM_DISSAVELEDIsState = $4A; //����-���ͻ�
//
//  SRVTERM_UPLOADHOURDIS = $3A; //���������ϴ�ÿСʱ��ʻ���
//  TERMSRV_READHOURDIS = $3B; //�ͻ���->���أ���ȡÿСʱ��ʻ���
//  SRVTERM_READHOURDIS = $3B;
//  TERMSRV_SETLEDTIME = $3C;
//  SRVTERM_SETLEDTIME = $3C;
//  //========================================================================20080622���ӵ���վ����ص�������
//  SETSTATIONPARAM_STATIONBRANK = $3D;            //���õ���վ�ƵĲ���
//  READSTATIONPARAM_STATIONBRANK = $3E;     //��ȡ����
//  SENDAD_STATIONBRANK = $3F;
//  DISCURRAD_STATIONBRANK = $40;
//  DELETEDESIGNAD_STATIONBRANK = $41;
//  DELETEALLAD_STATIONBRANK=$42;
//  SETADTIME_STATIONBRANK = $43;
//  SECURET2GATAWAY_STATIONBRANK = $46;
//  //======================================�ͻ��˶�ȡ��ǰ����������վ����Ϣ
//  READDEVONSTATION_STATIONBRANK = $47;
//  STATIONBRANK_ONOROFF = $48;
//
//  TERMSRV_EMPTYNEXTFLAG = $08;    // �ͻ���->���أ����ÿ��س���ʾ����   ������
//  SRVTERM_EMPTYNEXTFLAG = $08;
//
//  TERMSRV_SENDCONTROLCMDTXT = $15; //�ͻ���->���أ��·�������ָ����ı�������Ϣ 20090203 sha
//  SRVTERM_SENDCONTROLCMDTXT = $58;
//  TERMSRV_READDEVVERSION_EXTEND = $59; //�ͻ���->���أ���ȡ�豸�汾(������)
//  SRVTERM_READDEVVERSION_EXTEND = $59;
//
//  TERMSRV_SENDNEWATTEMPER = $60;//�ͻ���->���أ��򳵻��·���������    20090423 sha
//  SRVTERM_RETSENDNEWATTEMPER = $60;
//  TERMSRV_SENDCANCELTHEATTEMPER = $61;//�ͻ���->���أ��򳵻�ȡ��ĳ��������
//  SRVTERM_RETSENDCANCELTHEATTEMPER = $61;
//
//  SRVTERM_CHGATTEMPERSTATE = $5F;//����-���ͻ��� �����ϴ���������״̬�ı�
//
//  //==========================================================================================================
//  //-----------���ظ��ͻ���
//  SRVTERM_OVERSPEEDINFO = $D7; //����-���ͻ���  ���ټ�¼
//  SRVTERM_DEVSTOPINFO = $D8; //����-���ͻ���  ͣ����¼
//  SRVTERM_TAXIRUNDATA = $D9; //����-���ͻ���  �Ƽ���Ӫ������
//  SRVTERM_DRIVERON = $DA; //����-���ͻ���  ˾����¼
//  SRVTERM_DRIVEROFF = $DB; //����-���ͻ���   ˾���˳�
//  //�����յ��ͻ��˵����������ظ��ͻ��˵�Ӧ��  2006-1-10 SHA
//  SRVTERM_HEARTBEAT = $F0;
//
//  //�����ظ��ͻ���
//  SRVTERM_GPSDATA_V2 = $AE; //����->�ͻ��ˡ��յ�������λ����
//  SRVTERM_DRIVERUPLOADFIXEDMENU = $AF; //����->�ͻ��ˣ��յ�˾���ϴ��Ĺ̶��˵�
//  SRVTERM_SENDCONTROLINFO_DRIVERANSWER = $B0; //              �յ�˾���� ��ظ��ĵ�����Ϣ �Ļظ���Ϣ
//  SRVTERM_TAXIMETERRUNDATA = $B1; //              �յ������ϴ��ļƼ�����Ӫ����
//  SRVTERM_TAXIMETERCONFIRMSTOPTIME = $B2; //              �յ������ϴ��ļƼ���ȷ�ϵ�ͣ��ʱ��
//  //2006-8-22 ϵͳ�����-����-��ض�
//  SRVTERM_CUTSELF = $B3; //����->��ض� �յ�ϵͳ������ü�ض˹ر�����
//  SRVTERM_ADMSENDMSG = $B4; //����->��ض� �յ�ϵͳ����˷�������Ϣ
//  //���ظ�֪�ͻ��� ���ϴ��µ���Ƭ 2006-12-18
//  SRVTERM_APICUPLOADED = $B5; // ����->�ͻ��ˡ��յ������ѳɹ��ϴ�һ����Ƭ
//  SRVTERM_TELLDBREFRESH = $B6; //���أ���WEbService, ���ݿ����û��������ձ����и���
//  //���ظ�֪��չ��������ͨ�Ƽ��������ϴ�
//  SRVTERM_NTTAXIMETADATA = $B7;
//  //���ظ�֪�ͻ��˳����ӷ�����ע��
//  SRVTERM_DEVLOGOUTFROMSRV = $B8;
//  //����������֪�ͻ��ˣ����յ��������ϴ����س���� 20081126 sha
//  SRVTERM_DEVZTUPLOADCARRYOFFXSLC = $B9;
//  //2008��12��10��  ����������Ϣ������ swp
//
//  CLIENT_SETELCFENCE = $4B; //���ó����ĵ���Χ��
//  SEV_DEVClientArea = $4B;
//  TCLIENT_READSAVEELCFENCE = $4C; //��ȡ�����ڴ洢�ĵ���Χ��
//  SEV_READSAVEELCFENCE=$4C;
//  TCLIENT_CANCELDESIGNFENCE = $4D; //ȡ��ָ���ĵ���Χ����Ϣ
//  SEV_CANCELDESIGNFENCE=$4D;
//  SEV_UPLOADAREAWARN=$4E;  //ת���������򱨾���¼����չ���ͻ���
//
//
//  {UDP����֪ͨ��Ӧ�÷����������ݿ���ˢ������
//  ��־һ��Ҫ����ͳһ�ķ��䷽����
//  <li> �°汾���������־��$20~$29��
//  <li> �û�UDP�����־��$30~$3F��
//  <li> �ϰ汾�������� ��$40~$FF��
//  <li>С��$20�ı�־��ϵͳ����}
//  DBSRV_REFRESH = $308E;
//
//  (**sha 20081230 smsclient***************************)
//  //���ſͻ����������������֡�--�ͻ��˸�֪���أ�ͨ�����ŷ�����ִ���������
//  TERMSRV_SMSCLIENT = $51;
//  SRVTERM_SMSCLIENT = $51;//ȡ��ͬ������
//  //С������
//  TERMSRV_SMS_DEVUPGRADEDEVFIRMWARE= $01;
//  TERMSRV_SMS_REMOVEALARM = $02;
//  TERMSRV_SMS_DEVRESTART = $03;
//  TERMSRV_SMS_CONTROLDEV = $04;
//  TERMSRV_SMS_SETPARAM   = $05;
//  //*********************smsclient********************
//  //**�����Ӷ�ȡ�洢����Ƭ 20090119 sha
//  TERMSRV_READPICTIMESINFO = $56; //��ѯ��Ƭʱ�䷶Χָ��
//  SRVTERM_RETREADPICTIMESINFO = $56;
//  TERMSRV_READTHEPIC       = $57; //��������ȡ�洢����Ƭָ��
//  SRVTERM_RETREADTHEPIC       = $57;
//  TERMSRV_STOPUPLOADSAVEDPIC  = $5B;//��ֹ�ϴ������洢��Ƭ
//  SRVTERM_STOPUPLOADSAVEDPIC  = $5B;
//
//  TERMSRV_READDEVTELLIST = $5C;//��ȡ�����绰��
//  SRVTERM_RETREADDEVTELLIST = $5C;
//  TERMSRV_READDEVDISPLAYFIXEDMENU = $5D;//��ȡ���� �̶��˵�
//  SRVTERM_RETREADDEVDISPLAYFIXEDMENU = $5D;

  {==========V3.0������=========}
  TERMSRV_REG_V3 = $01;  // �ͻ��˵�¼
    
  TERMSRV_SETDEVPARAM_V3 = $10; // �ͻ���->���� ���ò���
  TERMSRV_READDEVPARAM_V3 = $11;  //  �ͻ���->���� ��ѯ����
  TERMSRV_CONTROLTERMINAL_V3=$12; // �ն˿���
  //TERMSRV_FINDPOSTION_V3 = $05; //λ�ò�ѯ
  TERMSRV_PURSUE_V3 = $14;  // ��ʱλ�ø���
  TERMSRV_SENDTXTMSG_V3= $15; //�ı���Ϣ�·�
  TERMSRV_SETEVENTLIST_V3 = $16; // �ͻ���->���� �����¼�

  SRVTERM_TYRESPONSE_V3 = $81;  // ͨ��Ӧ��
  SRVTERM_READDEVPARAM_V3 = $92;  //  ��ѯ����Ӧ��
  SRVTERM_GETPOSTION_V3 = $93;    // λ����Ϣ�㱨
//  SRVTERM_FINDPOSTION_V3 = $86; // λ�ò�ѯӦ��
  SRVTERM_REPORTEVENT_V3 = $95; // ����->�ͻ��ˣ��¼�����

  TERMSRV_SETQUESTLIST_V3 = $17;  // ����
  SRVTERM_REPORTANSWER_V3 = $96; // ����->�ͻ��ˣ�����Ӧ��
  TERMSRV_BACKCALLTEL_V3 = $1A;  // �ز��绰
                                           
  TERMSRV_CONTROLCAR_V3 = $1B;  // ��������
  SRVTERM_CONTROLCAR_V3 = $98;  // ��������Ӧ��

  TERMSRV_GETAPIC_V3 = $24;   // ����
//  SRVTERM_DEVONLINE_V3 = $82;     //��������״̬

  TERMSRV_HEART_V3 = $00;      // ����
  TERMSRV_REMOVEALARM_V3 = $33; // �����������

  TERMSRV_QUERYPICTURE_V3 = $25;  // �洢ͼƬ����
  SRVTERM_QUERYPICTURE_V3 = $A6;  // �洢ͼƬ����Ӧ��
  //----------------------------
  TERMSRV_SENDTAXIBUSS_V3 = $29;  // ���ͳ���ҵ��

  SERTERM_DRIVER_LOGIN_IN_V3 = $9B;  // ˾��ǩ��
  SERTERM_DRIVER_LOGIN_IN_V3_9F = $9F;// $E1;˾��ǩ����
  SERTERM_DRIVER_LOGIN_OUT_V3 = $9C;  // ˾��ǩ��
  SERTERM_SERVER_JUDGE_V3 = $AC;  // ����������Ϣ
  
  TERMSRV_SETTELLIST_V3 = $2C;  // ���õ绰��




  TERMSRV_SETINFOMENU_V3 = $18; // �ͻ���->���� ��Ϣ�㲥�˵� ����
  


  TERMSRV_SETCLASSINFOMENU_V3 = $27;   // �ܱ���Ϣ����˵�
  
  TERMSRV_GETENDPOSTION_V3 = $3F; //��ȡ�������һ����λ����
  SRVTERM_GETENDPOSTION_V3 = $B3; // ��ȡ�������һ����λ����Ӧ��
  TERMSRV_FINDBLACEVER_V3 = $41;  //��ѯ�������汾��
  TERMSRV_SENDUPBLACK = $42;  // ֪ͨMCU����������

  

  TERMSRV_ANTIFAKE_V3 = $2B;   // ���÷�α��־
  SRVTERM_ANTIFAKE_V3 = $9E;   // ���÷�α��־Ӧ��
  

  TERMSRV_INFOSERVER_V3 = $19;  // ������Ϣ

  TERMSRV_QUERYAUDIO_V3 = $39;  //��Ƶ���ݼ���
  SRVTERM_QUERYAUDIO_V3 = $AD;  //��Ƶ���ݼ���Ӧ��
  TERMSRV_UPPICTURE_V3 = $37; // �洢ͼƬ�ϴ�
  SRVTERM_UPLOADPICTURE_V3 = $83; // ���µ���Ƭ����ɹ�
  SRVTERM_UPLOADAUDIO_V3 = $84; // ���µ�MP3����ɹ�
  TERMSRV_MCU_V3 = $31;
  TERMSRV_POLLING_MCU_V3 = $3C; // ����Ѳ��
  TERMSRV_TSM_V3 = $3D; // TSM��ȫģ�����ָ��
  TERMSRV_METER_V3 = $3E;  // �Ƽ�������ָ��
  SRVTERM_POLLING_MCU_V3 = $AE; // ����Ѳ��Ӧ��
  SRVTERM_MCU_V3 = $A4; // ���ܶ�����Ӧ
  TERMSRV_LED_V3 = $2E; // LED����ָ��
  TERMSRV_SEND_V3 = $40;  //͸������������
  SRVTERM_LED_V3 = $A0; // LED����ָ��Ӧ��
  SRVTERM_SEND_V3 = $B4;  // ͸����������Ӧ��
  SRVTERM_LCD_V3 = $A7; // LCD����ָ��Ӧ��
  SRVTERM_MCUUPDATERES_V3 = $A8;  // MCU����������
  SRVTERM_TSM_V3 = $B0; // TSM��ȫģ�����ָ��Ӧ��
  SRVTERM_METER_V3 = $B1; // �Ƽ�������ָ��Ӧ��
  SRVTERM_ORDERCHANGED_V3 = $99;  // ����״̬�����仯
  SRVTERM_DRIVERCANCELORDER_V3 = $AB; //���ʻԱԭ��ȡ������
  SRVTERM_ORDERDONE_V3 = $AA;//�������
//  TERMSRV_SETCIRCLEAREA_V3 = $1C; // ����Բ������
//  TERMSRV_SETRECTANGLEAREA_V3 = $1E;  // ���þ�������
//  TERMSRV_SETNOSYMBOLAREA_V3 = $20;   // ���ò���������
  SRVTERM_SENDVIDEW_V3 = $32; // ������Ƶ�ļ�


  TCLIENT_CANCELCIRCLEAREA_V3=$1D; //ɾ��ָ����Բ������
  TCLIENT_CANCELERECTANGLEAREA_V3=$1F;  // ɾ��ָ���ľ�������
  TCLIENT_CANCELERENOSYMBOLAREA_V3=$21; // ɾ��ָ���Ķ��������

  TERMSRVINITIALIZEMCU_V3=$34;  //Զ�ָ̻�MCU�ĳ�����ʼֵ
  TRRMSERVCONTROLMCU_V3=$35;  // Զ��MCU��λ

  TERMSRV_CONFIRMEARLYWARNING_V3=$3A; //ȷ��Ԥ��
  TERMSRV_CANCELEARLYWARNING_V3=$3B; //ȡ��Ԥ��

  TERMSRV_UPDATEFIRMWARE_V3=$36;  //�����̼�


  SRVTERM_PURSUEPOSTION_V3 = $B5; // ���ͼ�ز����󣬳������ع����Ķ�λ����
  SRVTERM_FINDBLACEVER_V3 = $B6;  // ��ѯ�������汾��ϢӦ��

  SRVTERM_SAVEDRUNDATA_V3 = $B8;  // ���⳵һ��ͨˢ��������ϸ�ϴ�Ӧ��



  //TERMSRV_QUERYBLACKVERISON = $41;  // ��ѯMCU�������汾
  //SRVTERM_QUERYBLACKVERISON = $B6;  // MCU��Ӧ��ѯ�������汾������

  //TERMSRV_SENDUPDATEBLACKLIST = $42;  // ֪ͨMCU����������

type
  {�汾���ݽṹ
  @TABB
  @H(��ʶ      |����       |����                  |�μ�)
  @R( MinorVer |Byte       |�ΰ汾��              |  )
  @R( MinorVer |Byte       |���汾��              |  )
  @R( Version  |Word       |��16λ���ͱ�ʾ�İ汾��ֵ| )
  @TABE}
  TVer = packed record
    case integer of
      0:
      (MinorVer, MajorVer: Byte; );
      1: (Version: Word);
      2: (DevMajorVer, DevMinorVer: Byte; );
  end;

type
  TDateTime_V2 = array[0..5] of byte;
  TDEV_ID_BCD_V3 = array[0..3] of Byte;
  TDEV_ID_BCD_HRB = array[0..4] of Byte;
  TDEV_ID_BCD_ZDCL = array[0..5] of Byte;
  TDEV_ID_BCD_ZDCLArray = array of TDEV_ID_BCD_ZDCL;

  TGovObjID = array[0..11] of Byte;

//  //==================�ͻ�������������ͨ�ŵ����ݰ�=========//
//  TCmdToDataCenter = packed record
//    Head: Byte;         // ͷ
//    DataType: Byte;     // ��������
//    BusinessType: Byte; // ҵ������
//    Grade: Byte;        // ����
//    CmdID: Integer;     // ���к�
//    Reserve: array[0..3] of Byte; // ����
//    DataLength: Word;   // �������ݵĳ���
//    Data: PByte;      // ��������
//    Check: Byte;        // У����
//    Tail: Byte;         // β
//  end;
//  PCmdToDataCenter = ^TCmdToDataCenter;
//
//  //======================��Ϣͷ===========================//
//  TCmdHeader = packed record
//    Flag: Word;         // ��ϢID
//    Size: Word;         // ��Ϣ����
//    DevID: array[0..4] of Byte;     // �����ն�ID
//    Version: ShortInt;      //Э��汾��
//    CmdID: Word;     // ��ˮ��
//    CmdParam: Pointer;  // ��Ϣ��
//    CRC: Word;      // CRCУ����
//  end;
//  PCmdHeader = ^ TCmdHeader;

{********************  �����ǿͻ��˵�Web���������ṹ ************************}

//=====================�ն˹�����========================//
  TSendDevParam = packed record   // �����ն˲���(0x8103)��Ϣ�壬�ն˻ظ�ͨ��Ӧ��
    ParamList: Pointer;   // �������б� ָ��TParam
  end;
  PSendDevParam = ^TSendDevParam;

  TParam = packed record  // ������
    ID: Word;       // ����ID
    Length: Byte;   // ��������
    Info: string;   // ����ֵ
  end;
  PParam = ^TParam;

  TSendQueryDevParam = packed record  // ��ѯ�ն˲���(0x8104)��Ϣ�壬����Ϣ�壬�ն˻ظ�0x0104
  end;

  TSendControlDev = packed record // �ն˿���(0x8105)��Ϣ�壬�ն˻ظ�ͨ��Ӧ��
    // ��������ĳ����ĵ���û�б��������ö���ṹ��
  end;

//=====================λ�á�������======================//
  TSendQueryPosition = packed record // λ����Ϣ��ѯ(0x8201)��Ϣ��,����Ϣ�壬�ն˻ظ�0x0201
  end;

  TSendTracePosition = packed record // λ�ø��ٿ���(0x8202)��Ϣ��,�ն˻ظ�ͨ��Ӧ��
    Properties: Byte;   // ����
    TimeOrDistanceInterval: Word; // ʱ��/������
    KeepTimeOrDistance: Word;  // ����ʱ��/����
  end;
  PSendTracePosition = ^TSendTracePosition;

  {========================V3.0========================}

  THead_V3 = packed record
    SPosFlag:  Byte;//��ʼλ��ʶ
    Size: Word;//����С	UINT16	��������С
    PackType:Byte;//������	BYTE	��������˵��
    Ver:Byte;//Э��汾	BYTE	Ĭ��0X00
    BizType:byte;//ҵ������	BYTE	��ҵ������˵�������ݰ����Ͷ���
    CmdFlag: Byte;//��ϢID	BYTE
    DevId: TDEV_ID_BCD_ZDCL;//�ն��ֻ���	BCD[6]
    CarNo:string[11];//���ƺ�	STRING[12]	����
    CmdOrder:Integer;//��Ϣ��ˮ��	UINT16	������˳���0��ʼѭ���ۼ�
//    Flag: Byte;
//    ExtendedFlag: Byte;
//    //FactID: Byte;--sjp  zdclû��factId
//    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3;//integer;
//    CmdId: Word;
  end;
  PHead_V3 = ^THead_V3;

  THeadHRB_V3 = packed record
    SPosFlag:  Byte;//��ʼλ��ʶ
    Size: Word;//����С	UINT16	��������С
    PackType:Byte;//������	BYTE	��������˵��
    Ver:Byte;//Э��汾	BYTE	Ĭ��0X00
    BizType:byte;//ҵ������	BYTE	��ҵ������˵�������ݰ����Ͷ���
    CmdFlag: Byte;//��ϢID	BYTE
    DevId: TDEV_ID_BCD_HRB;//�ն��ֻ���	BCD[6]
    CarNo:string[11];//���ƺ�	STRING[12]	����
    CmdOrder:Integer;//��Ϣ��ˮ��	UINT16	������˳���0��ʼѭ���ۼ�
//    Flag: Byte;
//    ExtendedFlag: Byte;
//    //FactID: Byte;--sjp  zdclû��factId
//    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3;//integer;
//    CmdId: Word;
  end;
  PHeadHRB_V3 = ^THeadHRB_V3;

  TCMDHeart = packed record   // ����
    Header: THead_V3;
  end;
  PCMDHeart = ^TCMDHeart;

    {�û���¼���ط�����    TERMSRV_REG_V3   }
  TCmdTermsrvRegUserData_V3 = packed record
    Header:THead_V3;
    Version: Byte;
    UserID: integer;
    Time: array[0..6] of Byte;
    //UserPass: string;
    //version: Byte;
  end;
  PCmdTermsrvRegUserData_V3 = ^TCmdTermsrvRegUserData_V3;

  //������ע������
  TCmdTermsrvLogoutData_V3 = packed record
    Header:THead_V3;
    XorSum: Byte;
  end;
  PCmdTermsrvLogoutData_V3 = ^TCmdTermsrvLogoutData_V3;

  {ͨ��Ӧ�� ����->�ͻ���}
  TCmdSrvtermTYData_V3 = packed record
    Header:THead_V3;
    RespCmdNo: Integer;
    RespCmdId: Byte;
    Ret: Byte;
        //0���ɹ���
        //1��
        //2������ȡ��
        //3������ɾ������ʱ��
        //4���ظ���¼
        //5���û����Ϸ�
        //6���豸��æ
  end;
  PCmdSrvtermTYData_V3 = ^TCmdSrvtermTYData_V3;

  {ͨ��Ӧ�� �ͻ���->����}
  TCmdTermSrvTYData_V3 = packed record
    Header:THead_V3;
    RespCmdNo: LongWord;//Ӧ����ˮ��
    RespCmdId: Byte;//Ӧ����ϢID
    Ret: Byte;//0���ɹ�/ȷ�ϣ�1��ʧ�ܣ�2����Ϣ����
  end;
  PCmdTermSrvTYData_V3 = ^TCmdTermSrvTYData_V3;

  {��ȡ��������״̬ �ͻ���->����}
  TCmdTermSrvGetOnLineStatData_V3 = packed record
    Header:THead_V3;
  end;
  PCmdTermSrvGetOnLineStatData_V3 = ^TCmdTermSrvGetOnLineStatData_V3;

  //��λ������Ϣ
  TSGpsData_V3 = packed record
    WarningSign: LongWord;  // ������־
    State: Longword; //32λ״̬λ
    Latitude: integer; //γ�� X 100 0000 ��: ֵ32123456��ʾ��32.123456��
    Longitude: integer; //���� X 100 0000
    Altitude:word;//sjp zdcl.20110602      ���θ߶ȣ���λΪ�ף�m��
    Speed: Word; //�ٶȡ���λ������/Сʱ
    Orientation: Word; //������������Ϊ0�ȣ�˳ʱ�����ӣ���λ��2�ȣ���ֵ��Χ0��178��
    GpsTime: array[0..5] of Byte; // GPSʱ��
  end;
  PSGpsData_V3 = ^TSGpsData_V3;

    {������ȡ�ó�����λ���� Flag= SRVTERM_GETPOSTION_V3}
  TCmdSrvTermGpsData_V3 = packed record
    Header:THead_V3;
    WarningSign: LongWord;  // ������־
    State: Longword; //32λ״̬λ
    Latitude: integer; //γ�� X 100 0000 ��: ֵ32123456��ʾ��32.123456��
    Longitude: integer; //���� X 100 0000
    Altitude:word;//sjp zdcl.20110602      ���θ߶ȣ���λΪ�ף�m��
    Speed: Word; //�ٶȡ���λ������/Сʱ
    Orientation: Word; //������������Ϊ0�ȣ�˳ʱ�����ӣ���λ��2�ȣ���ֵ��Χ0��178��
    GpsTime: array[0..5] of Byte; // GPSʱ��
  end;
  PCmdSrvTermGpsData_V3 = ^TCmdSrvTermGpsData_V3;

  //����λ�ò�ѯӦ��
  TCmdSrvTermFindPos_V3 = packed record
    Header:THead_V3;
    IsCompressed: Byte;//0����֧�֣�1��֧��
    //λ����Ϣ (BCD[6]+λ����Ϣ)*N
  end;
  PCmdSrvTermFindPos_V3 = ^TCmdSrvTermFindPos_V3;

  {�����ݿ���ȡ��ʷ��λ����}
  TQueryHistoryGpsData_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3;//integer;
    CmdId: Word;

    WarningSign: LongWord;  // ������־
    State: Longword; //32λ״̬λ
    Latitude: Double; //γ�� X 100 0000 ��: ֵ32123456��ʾ��32.123456��
    Longitude: Double; //���� X 100 0000
    Altitude:word;//sjp zdcl.20110602      ���θ߶ȣ���λΪ�ף�m��
    Speed: Word; //�ٶȡ���λ������/Сʱ
    Orientation: Word; //������������Ϊ0�ȣ�˳ʱ�����ӣ���λ��2�ȣ���ֵ��Χ0��178��
    GpsTime: TDateTime; //array[0..6] of Byte; // GPSʱ��
    ServerTime: TDateTime;
  end;
  PQueryHistoryGpsData_V3 = ^TQueryHistoryGpsData_V3;

      {������ȡ�÷����������� Flag= SRVTERM_GPSDATA_V3}
  TCmdSrvTermServeJudge_V3 = packed record
    GpsData: TCmdSrvTermGpsData_V3;
    Run_id: LongWord;
    ServeTime: array[0..5] of Byte;
    No: array[0..18] of Char;
    ServeID: LongWord;
    NotOkID: LongWord;
  end;
  PCmdSrvTermServeJudge_V3 = ^TCmdSrvTermServeJudge_V3;

  {�Ƽ���Ӫ������}
  TCmdSrvTermDRunData_V3 = packed record
    GpsData: TCmdSrvTermGpsData_V3;
    WarningSign: LongWord;  // ������־
    State: Longword; //32λ״̬λ
    Latitude: integer; //γ�� X 100 0000 ��: ֵ32123456��ʾ��32.123456��
    Longitude: integer; //���� X 100 0000
    Speed: Word; //�ٶȡ���λ������/Сʱ
    Orientation: Byte; //������������Ϊ0�ȣ�˳ʱ�����ӣ���λ��2�ȣ���ֵ��Χ0��178��
    GpsTime: array[0..5] of Byte; // GPSʱ��

    Run_ID: LongWord; // Ӫ��ID
    Server_ID: LongWord;  // ����ID
    Server_Type: Byte;  // ����ѡ��
    Server_Extend: Word;  // ����ѡ����չ

    Car_No: array[0..5] of Char;  // ���ƺ�
    OnTime: array[0..4] of Byte;  // �ϳ�ʱ��
    OffTime: array[0..1] of Byte; // �³�ʱ��
    RunDistanct: array[0..2] of Byte; // �Ƴ̹���
    NoRunDistanct: array[0..1] of Byte; // ��ʻ����
    Surcharge: array[0..2] of Byte; // ���ӷ�
    WaitTime: array[0..1] of Byte;  // �ȴ�ʱ��
    RunJE: array[0..2] of Byte; // ���׽��
  end;
  PCmdSrvTermDRunData_V3 = ^TCmdSrvTermDRunData_V3;

  {������ȡ�ÿ���Ӧ�� Flag= SRVTERM_GPSDATA_V3}
  TCmdSrvtermControlCar_V3 = packed record
    Header:THead_V3;

    ResCmdID: Word;
    WarningSign: LongWord;  // ������־
    State: Longword; //32λ״̬λ
    Latitude: integer; //γ�� X 100 0000 ��: ֵ32123456��ʾ��32.123456��
    Longitude: integer; //���� X 100 0000
    Altitude :Word;
    Speed: Word; //�ٶȡ���λ������/Сʱ
    Orientation: Word; //������������Ϊ0�ȣ�˳ʱ�����ӣ���λ��2�ȣ���ֵ��Χ0��178��
    GpsTime: array[0..5] of Byte; // GPSʱ��
  end;
  PCmdSrvtermControlCar_V3 = ^TCmdSrvtermControlCar_V3;

  {�ͻ��˴���ʱ���õ�GpsData_V3}
  TGpsData_V3 = packed record
    Size: Word;
    Id: TDEV_ID_BCD_ZDCL;
    WarningSign: LongWord;  // ������־
    State: Longword; //32λ״̬λ
    Lat: Double; //������ת����γ�� eg:  32.123456
    Long: Double; //������ת�������� eg: 118.123456
    Altitude:word;//sjp zdcl.20110602      ���θ߶ȣ���λΪ�ף�m��
    Speed: Word; //�ٶȡ���λ������/Сʱ����ʾ��Χ0��255
    Orientation: Word; //������ת����������������Ϊ0�ȣ�˳ʱ�����ӣ���λ����
    GpsTime: TDateTime;
  end;
  PGpsData_V3 = ^TGpsData_V3;

    {�ͻ��˴������ʷ��λ����}
  THistoryGpsData_V3 = packed record
    Size: Byte;
    Id: integer;
    WarningSign: LongWord;  // ������־
    State: Longword; //32λ״̬λ
    Lat: Double; //������ת����γ�� eg:  32.123456
    Long: Double; //������ת�������� eg: 118.123456
    Altitude:word;//sjp zdcl.20110602      ���θ߶ȣ���λΪ�ף�m��
    Speed: Word; //�ٶȡ���λ������/Сʱ����ʾ��Χ0��255
    Orientation: Word; //������ת����������������Ϊ0�ȣ�˳ʱ�����ӣ���λ����
    GpsTime: TDateTime;
    ServerTime: TDateTime;
  end;
  PHistoryGpsData_V3 = ^THistoryGpsData_V3;

  {���ò��� TERMSRV_SETDEVPARAM_V3}
  TCmdTermSrvSetDevParam_V3 = packed record
    Header:THead_V3;
    ParamCnt :Byte;  //��������	UINT8
    ParamPackCnt:Byte;//����������	UINT8
    //�������б�:
    ParamId: Word;
    ParamSize: Byte;
    //����ֵ ���Ȳ���
  end;
  PCmdTermSrvSetDevParam_V3 = ^TCmdTermSrvSetDevParam_V3;
//  {���ػظ���SRVTERM_SETDEVPARAM_V2}
//  TCmdSrvTermSetDevParam_V3 = packed record
//    Size: Word;
//    Flag: Byte;
//    ExtendedFlag: Byte;
//    //FactID: Byte;--sjp  zdclû��factId
//    DevId: TDEV_ID_BCD_ZDCL;//integer;
//    CmdId: Word;
//    Ret: integer;
//  end;
//  PCmdSrvTermSetDevParam_V3 = ^TCmdSrvTermSetDevParam_V3;
  {����������Ϣ}
  TCmdTermSrvSetAnswerList_V3 = packed record
    Header:THead_V3;
    ControlCmd: Byte;
    MsgId: LongWord;  // ����ID
    //info: string;
    // ���б�����
  end;
  PCmdTermSrvSetAnswerList_V3 =^TCmdTermSrvSetAnswerList_V3;

    {����Ӧ��}
  TCmdSrvtermReportAnswer_V3 = packed record
//    Size: Word;
//    Flag: Byte;
//    ExtendedFlag: Byte;
//    //FactID: Byte;--sjp  zdclû��factId
//    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3;//integer;
//    CmdId: Word;
//    //ResCmdID: Word;
    Header:THead_V3;
    MsgId: LongWord;  // ����ID
    AnswerID: Byte;  // ��ID
  end;
  PCmdSrvtermReportAnswer_V3 = ^TCmdSrvtermReportAnswer_V3;

  {�·�������Ϣ}
  TCmdTerSevSendTaxiBuss_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//integer;
    CmdId: Word;
    ID: LongWord;
    BussType: Byte;
    DateTime: Array[0..5] of Byte;
    Count: LongWord;
    // ������Ϣ
    // ҵ������
    // ��ϸҵ������
    // �绰����

  end;
  PCmdTerSevSendTaxiBuss_V3 = ^TCmdTerSevSendTaxiBuss_V3;
    {��ѯ���� TERMSRV_READDEVPARAM_V3}
  TCmdTermSrvReadDevParam_V3 = packed record
    Header:THead_V3;
    ParamId: Word; //����ID
  end;
  PCmdTermSrvReadDevParam_V3 = ^TCmdTermSrvReadDevParam_V3;


  {���ػظ���SRVTERM_READDEVPARAM_V3}
  TCmdSrvTermReadDevParam_V3 = packed record
    Header:THead_V3;
    ParamId: Word; //   ����ID
    ParamLen: Byte; //   ��������
    //����ֵ�������Ȳ���
  end;
  PCmdSrvTermReadDevParam_V3 = ^TCmdSrvTermReadDevParam_V3;


  {�ն˿��� TERMSRV_CONTROLTERMINAL_V3}
  TCmdTermSrvControlTerminal_V3 = packed record
    Header:THead_V3;
    ControlID: Byte;  //����������	BYTE
    //�����������	STRING     
  end;
  PCmdTermSrvControlTerminal_V3 = ^TCmdTermSrvControlTerminal_V3;
  
  // ˾��ǩ��
  TCmdSrvTermDriverLoginIn_V3 = packed record
    GpsData: TCmdSrvTermGpsData_V3;
    //start: Word;
    //Size: Word;
    //dev_type: Byte;
    //fact_id: Byte;
    //flag: Word;
    company_id: array[0..4] of Byte;
    driver_id: array[0..5] of Byte;
    car_no: array[0..5] of Byte;
    dateTime: array[0..5] of Byte;
    MCU_State: Word;
    XZSJ: array[0..4] of Byte;
    XZCS: Byte;
    CZJG: Word;
    //finish: Word;
  end;
  PCmdSrvTermDriverLoginIn_V3 = ^TCmdSrvTermDriverLoginIn_V3;

    //˾��ǩ����
  TCmdSrvTermDriverLoginIn_V3_9F = packed record
    Header:THead_V3;
    DriverNameLen:Byte;         //��ʻԱ��������	UINT8
    DriverName:string;          //��ʻԱ����	STRING
    DriverIdentityCardNo:string;//��ʻԱ���֤����	STRING	����20λ//
//��ҵ�ʸ�֤����	STRING	����40λ
//��֤�������Ƴ���	UINT8	����M
//��֤��������	STRING	��ҵ�ʸ�֤��֤��������
  end;
  PCmdSrvTermDriverLoginIn_V3_9F = ^TCmdSrvTermDriverLoginIn_V3_9F;
    // ˾��ǩ��
  TCmdSrvTermDriverLoginOut_V3 = packed record
    GpsData: TCmdSrvTermGpsData_V3;
    //start: Word;
    //Size: Word;
    //dev_type: Byte;
    fact_id: Byte;
    flag: Word;
    company_id: array[0..4] of Byte;
    driver_id: array[0..5] of Byte;
    car_no: array[0..5] of Byte;
    dateTime: array[0..5] of Byte;
    MCU_State: Word;
    //finish: Word;
  end;
  PCmdSrvTermDriverLoginOut_V3 = ^TCmdSrvTermDriverLoginOut_V3;
//  {������ȡ�÷����������� Flag= SRVTERM_SERVERJUDGE_V3}
//  TCmdSrvTermServerJudge_V3 = packed record
//    Size: Word;
//    Flag: Byte;
//    ExtendedFlag: Byte;
//    //FactID: Byte;--sjp  zdclû��factId
//    DevId: integer;
//    CmdId: Word;
//
//    WarningSign: LongWord;  // ������־
//    State: Longword; //32λ״̬λ
//    Latitude: integer; //γ�� X 100 0000 ��: ֵ32123456��ʾ��32.123456��
//    Longitude: integer; //���� X 100 0000
//    Speed: Word; //�ٶȡ���λ������/Сʱ
//    Orientation: Byte; //������������Ϊ0�ȣ�˳ʱ�����ӣ���λ��2�ȣ���ֵ��Χ0��178��
//    GpsTime: array[0..5] of Byte; // GPSʱ��
//
//    pjsj: array[0..5] of Byte;  // ����ʱ��
//    jsycyzgzs: string;  // ��ʻԱ��ҵ�ʸ�֤��
//    pjxx: Integer;  // ����ѡ��
//    bmyxx: Integer; // ������ѡ��
//
//  end;
//  PCmdSrvTermServerJudge_V3 = ^TCmdSrvTermServerJudge_V3;
  //�ͻ���->���� ���գ��ĵ�ǰ��Ƭ TERMSRV_GETAPIC= $27;
  TCmdTermSrvGetAPic_V3 = packed record
    Header:THead_V3;

    CameraIndex: Byte; //����ͷ��
    CameraCmd: Word;  // ��������
    PZSJJG: Word;   // ����ʱ����
    SaveSign: Byte; // �����־
    GetPicSize: Byte; //��Ƭ�ߴ��С 0=320x240  1=640x480  2-else
    TXZL: Byte; // ͼ������
    LD: Byte;   // ����
    DBD: Byte;  // �Աȶ�
    BHD: Byte;  // ���Ͷ�
    SD: Byte;   // ɫ��
  end;
  PCmdTermSrvGetAPic_V3 = ^TCmdTermSrvGetAPic_V3;

    {���õ绰�� TERMSRV_SETTELLIST}
  TCmdTermSrvSetTelList_V3 = packed record
    Header:THead_V3;
    SetType:Byte;  //��������	BYTE	0��ɾ���ն������д洢����ϵ�ˣ�
                   //                1����ʾ���µ绰����
                   //                2����ʾ׷�ӵ绰����
                   //                3����ʾ�޸ĵ绰��
    SetCount:Byte; //��ϵ������	BYTE
    PackCount:Byte;//����ϵ�˸���	BYTE	��ǰ���ݰ�����ϵ�˸���
                   //��ϵ����		�绰����ϵ�������ݸ�ʽ����38
  end;
  PCmdTermSrvSetTelList_V3 = ^TCmdTermSrvSetTelList_V3;

  {�����¼�}
  TCmdTermSrvSetEventList_V3 = packed record
    Header:THead_V3;
    SetType:Byte;   //��������	UINT8	0��ɾ���ն����������¼���������󲻴�����ֽڣ�
                          //1�������¼���
                          //2��׷���¼���
                          //3���޸��¼���
                          //4��ɾ���ض������¼���֮���¼�����������¼�����
    SetCount:Byte;  //��������	UINT8
    PackCount:Byte;  //�����ø���	UINT8
      //�¼����б�		���Ȳ�����499�ֽڣ�����ֶ�����Ϣ�·�
  end;
  PCmdTermSrvSetEventList_V3 =^TCmdTermSrvSetEventList_V3;
  
  // λ�ò�ѯ  TERMSRV_FINDPOSTION_V3 = $13;
  TCmdTermSrvFindPostion_V3 = packed record
    Header:THead_V3;
  end;
  PCmdTermSrvFindPostion_V3 = ^TCmdTermSrvFindPostion_V3;

  // ��ѯ�������汾
  TCmdTermSrvFindBlackVer_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;
  end;
  PCmdTermSrvFindBlackVer_V3 = ^TCmdTermSrvFindBlackVer_V3;

  // ��ѯ�������汾Ӧ��
  TCmdSrvTermFindBlackVer_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;

    Ver: array[0..2] of Byte;
  end;
  PCmdSrvTermFindBlackVer_V3 = ^TCmdSrvTermFindBlackVer_V3;

  // ���⳵һ��ͨˢ��������ϸ�ϴ�Ӧ��
  TCmdSrvTermSaveDRundata_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;

    Res: Byte;
  end;
  PCmdSrvTermSaveDRundata_V3 = ^TCmdSrvTermSaveDRundata_V3;

  // ��������״̬
  TCmdSrvTermDevOnLine_V3 = packed record
    Header:THead_V3;
    Res: Byte;  //����״̬	1	0������ 1������
    //����
  end;
  PCmdSrvTermDevOnLine_V3 = ^TCmdSrvTermDevOnLine_V3;

  // λ��׷�� TERMSRV_PURSUE_V3
  TCmdTermSrvPursue_V3 = packed record
    Header:THead_V3;
//    ShuXing: Byte;
    PursueInterval: Word;
    JianGe: LongWord;
  end;
  PCmdTermSrvPursue_V3 = ^TCmdTermSrvPursue_V3;

  {�¼�����}
  TCmdSrvtermReportEvent_V3 = packed record
    Header:THead_V3;
    EventNo: Byte;  // �¼�ID
  end;
  PCmdSrvtermReportEvent_V3 = ^TCmdSrvtermReportEvent_V3;

    {���÷�α��־  TERMSRV_ANTIFAKE_V3}
  TCmdSrvtermAntiFake_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;


    TypeId: Byte;
    DataType: Word;

    //Fact_ID: Byte;  // ���̱�ʶ
    MCUFlag: array[0..1] of Byte; // MCU����
    // ��α��־
  end;
  PCmdSrvtermAntiFake_V3 = ^TCmdSrvtermAntiFake_V3;

  {���÷�α��־Ӧ��  TERMSRV_ANTIFAKE_V3}
  TCmdermSrvtAntiFake_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;

    TypeID: Byte;
    Fact_ID: Byte;
    MCU_Flag: Word;
    Res: Byte;
  end;
  PCmdermSrvtAntiFake_V3 = ^TCmdermSrvtAntiFake_V3;

  {���ͻز��绰  TERMSRV_BACKCALLTEL_V3}
  TCmdSrvtermBackCallTel_V3 = packed record
    Header:THead_V3;
    Sign: Byte; // ��־
    // �绰���� ���Ȳ���
  end;
  PCmdSrvtermBackCallTel_V3 = ^TCmdSrvtermBackCallTel_V3;

  {��������  TERMSRV_CONTROLCAR_V3}
  TCmdtermSrvControlCar_V3 = packed record
    Header:THead_V3;
//    Control: Byte;
    ControlCmd: Byte;
  end;
  PCmdtermSrvControlCar_V3 = ^TCmdtermSrvControlCar_V3;

  {��Ϣ����  TERMSRV_INFOSERVER_V3}
  TCmdSrvtermInfoServer_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//integer;
    CmdId: Word;
    Sign: Byte; // ��Ϣ����
    // ��Ϣ���� ������
  end;
  PCmdSrvtermInfoServer_V3 = ^TCmdSrvtermInfoServer_V3;

  {�洢ͼƬ���� TERMSRV_QUERYPICTURE_V3}
  TCmdSrvtermQueryPicture_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;
    
    CameraIndex: Byte; //����ͷ��
    Reason: Byte; // ����ԭ��
    beginDateTime: array[0..5] of Byte;  // ��ʼʱ��
    endDateTime: array[0..5] of Byte;  // ����ʱ��
  end;
  PCmdSrvtermQueryPicture_V3 = ^TCmdSrvtermQueryPicture_V3;

  // Ӧ��
  TCmdTermSrvQueryPicture_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;
    Count: LongWord;
    offSet: LongWord;


   { CameraIndex: Byte;
    WarningSign: LongWord;  // ������־
    State: Longword; //32λ״̬λ
    Latitude: integer; //γ�� X 100 0000 ��: ֵ32123456��ʾ��32.123456��
    Longitude: integer; //���� X 100 0000
    Speed: Word; //�ٶȡ���λ������/Сʱ
    Orientation: Byte; //������������Ϊ0�ȣ�˳ʱ�����ӣ���λ��2�ȣ���ֵ��Χ0��178��
    GpsTime: array[0..5] of Byte; // GPSʱ��   }
  end;
  PCmdTermSrvQueryPicture_V3 = ^TCmdTermSrvQueryPicture_V3;

    {��Ƶ���ݼ��� TERMSRV_QUERYPICTURE_V3}
  TCmdSrvtermQueryAudio_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;

    Reason: Byte; // ¼��ԭ��
    beginDateTime: array[0..5] of Byte;  // ��ʼʱ��
    endDateTime: array[0..5] of Byte;  // ����ʱ��
  end;
  PCmdSrvtermQueryAudio_V3 = ^TCmdSrvtermQueryAudio_V3;

  // Ӧ��
  TCmdTermSrvQueryAudio_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;
    //McuCmdId: Word;
    Count: LongWord;
    offSet: LongWord;

   { CameraIndex: Byte;
    WarningSign: LongWord;  // ������־
    State: Longword; //32λ״̬λ
    Latitude: integer; //γ�� X 100 0000 ��: ֵ32123456��ʾ��32.123456��
    Longitude: integer; //���� X 100 0000
    Speed: Word; //�ٶȡ���λ������/Сʱ
    Orientation: Byte; //������������Ϊ0�ȣ�˳ʱ�����ӣ���λ��2�ȣ���ֵ��Χ0��178��
    GpsTime: array[0..5] of Byte; // GPSʱ��   }
  end;
  PCmdTermSrvQueryAudio_V3 = ^TCmdTermSrvQueryAudio_V3;

  TQueryPicture_V3 = packed record
    CameraIndex: Byte;
    WarningSign: LongWord;  // ������־
    State: Longword; //32λ״̬λ
    Latitude: integer; //γ�� X 100 0000 ��: ֵ32123456��ʾ��32.123456��
    Longitude: integer; //���� X 100 0000
    Speed: Word; //�ٶȡ���λ������/Сʱ
    Orientation: Byte; //������������Ϊ0�ȣ�˳ʱ�����ӣ���λ��2�ȣ���ֵ��Χ0��178��
    GpsTime: array[0..5] of Byte; // GPSʱ��
  end;
  PQueryPicture_V3 = ^TQueryPicture_V3;

  TQueryPicture_V3_New = packed record
    //PictureType: Byte;  // 0����Ƭ 2����Ƶ 3����Ƶ ������RFU
    PictureId: Integer;
  end;
  PQueryPicture_V3_New = ^TQueryPicture_V3_New;


  {�洢ͼƬ�ϴ� TERMSRV_UPPICTURE_V3}
  TCmdSrvtermUpPicture_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3;// integer;
    CmdId: Word;
    CameraIndex: Byte; //����ͷ��
    beginDateTime: array[0..5] of Byte;  // ��ʼʱ��
    endDateTime: array[0..5] of Byte;  // ����ʱ��
    DeleteSign: Byte;   // ɾ����־
  end;
  PCmdSrvtermUpPicture_V3 = ^TCmdSrvtermUpPicture_V3;

    {�洢ͼƬ�ϴ� TERMSRV_UPPICTURE_V3}
  TCmdSrvtermUpPicture_V3_New = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3;// integer;
    CmdId: Word;
    PictureType: Byte;
    PictureId: Integer;
  end;
  PCmdSrvtermUpPicture_V3_New = ^TCmdSrvtermUpPicture_V3_New;

    //���ظ�֪�ͻ��� �յ������ѳɹ��ϴ��µ���Ƭ SRVTERM_UPLOADPICTURE_V3
  TCmdSrvTermAPicUploaded_V3 = packed record
    Header: THead_V3;
    PicId: Integer;
    TId: Integer;//�ն�ID
    MediaType: Byte;//             0��ͼ��1����Ƶ��2����Ƶ
    MediaFormat: Byte;//��ý���ʽ���� 0��JPEG��1��TIF��2��MP3��3��WAV��4��WMV����������
    EventId: Byte;//�¼������    0��ƽ̨�·�ָ�1����ʱ������2�����ٱ���������3����ײ�෭����������4:ƣ�ͱ��� ��������
    ChannelId: Byte;//ͨ��ID
    XorSum: Byte;
  end;
  PCmdSrvTermAPicUploaded_V3 = ^TCmdSrvTermAPicUploaded_V3;

  {���ö���ҹ��ģʽ }
  TCmdSrvtermSetNightMode_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;

    TypeId: Byte;
    DataType: Word;

    //Fact_ID: Byte;  // ���̱�ʶ
    MCUFlag: array[0..1] of Byte;
    beginTime: array[0..1] of Byte;  // ��ʼʱ��
    endTime: array[0..1] of Byte;  // ����ʱ��

  end;
  PCmdSrvtermSetNightMode_V3 = ^TCmdSrvtermSetNightMode_V3;

    {��������ҹ��ģʽ }
  TCmdSrvtermOpenNightMode_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3;// integer;
    CmdId: Word;

    TypeId: Byte;
    DataType: Word;

    //Fact_ID: Byte;  // ���̱�ʶ
    MCUFlag: array[0..1] of Byte;
    Res: Byte;

  end;
  PCmdSrvtermOpenNightMode_V3 = ^TCmdSrvtermOpenNightMode_V3;

  TCmdErmTSerPolling_MCU_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3;// integer;
    CmdId: Word;
  end;
  PCmdErmTSerPolling_MCU_V3 = ^TCmdErmTSerPolling_MCU_V3;

  TCmdSerTErmPolling_MCU_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3;// integer;
    CmdId: Word;

    {McuType: Byte;
    McuLength: Word;
    
    FACTType: Byte;
    MCUFlag: Word;
    State: array[0..31] of Byte;  }
  end;
  PCmdSerTErmPolling_MCU_V3 = ^TCmdSerTErmPolling_MCU_V3;

  // �ͻ��˷����ն������͸����
  TCmdSrvTerm_MCU_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;

    TypeId: Byte;
    DataType: Word;

    //Fact_ID: Byte;  // ���̱�ʶ
    MCU_Flag: Word; // ������

    // ������
  end;
  PCmdSrvTerm_MCU_V3 = ^TCmdSrvTerm_MCU_V3;

  {��ѯ����״̬ }
  TCmdSrvtermQueryLightState_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;

    TypeId: Byte;
    DataType: Word;

    //Fact_ID: Byte;  // ���̱�ʶ
    MCUFlag: array[0..1] of Byte;
    dateTime: array[0..6] of Byte;
  end;
  PCmdSrvtermQueryLightState_V3 = ^TCmdSrvtermQueryLightState_V3;

    {��ѯLCD״̬ }
 { TCmdSrvtermQueryLCDState_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: integer;
    CmdId: Word;

    ControlCmdID: Integer;
    PackCount: Integer;
    PackID: Integer;
    ShuXing: Integer;
    MCUFlag: array[0..1] of Byte;
    dateTime: array[0..6] of Byte;
  end;
  PCmdSrvtermQueryLCDState_V3 = ^TCmdSrvtermQueryLCDState_V3;    }

    {��ѯled״̬ }
  TCmdSrvtermQueryLEDState_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;

    TypeId: Byte;
    DataType: Word;

    //Fact_ID: Byte;  // ���̱�ʶ
    MCUFlag: array[0..1] of Byte;
    dateTime: array[0..6] of Byte;
  end;
  PCmdSrvtermQueryLEDState_V3 = ^TCmdSrvtermQueryLEDState_V3;

    {͸������ }
  TCmdSrvtermSend_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;

    TypeId: Byte;
    DataType: Word;

    MCUFlag: Word;

    //Buf: array of Byte


    {MCUFlag: array[0..1] of Byte;
    dateTime: array[0..6] of Byte;  }
  end;
  PCmdSrvtermSend_V3 = ^TCmdSrvtermSend_V3;

    {���ܶ�����Ӧ}
  TCmdtermSrv_MCU_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;

    TypeId: Byte;
    Fact_ID: Byte;

    MCUflag: array[0..1] OF Byte;
    RES: Byte;

  end;
  PCmdtermSrv_MCU_V3 = ^TCmdtermSrv_MCU_V3;

  TCmdtermSrv_QUERYMCU_V3= packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: integer;
    CmdId: Word;

    TypeId: Byte;
    Fact_ID: Byte;

    MCUflag: array[0..1] OF Byte;
    state: array[0..31] of Byte;
  end;
  PCmdtermSrv_QUERYMCU_V3 = ^TCmdtermSrv_QUERYMCU_V3;

    {LED��Ӧ}
  TCmdtermSrv_LED_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;

    TypeId: Byte;
    Fact_ID: Byte;

    MCUflag: array[0..1] OF Byte;
    RES: Byte;

  end;
  PCmdtermSrv_LED_V3 = ^TCmdtermSrv_LED_V3;

  TCmdtermSrv_QUERYLED_V3= packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: integer;
    CmdId: Word;

    TypeId: Byte;
    Fact_ID: Byte;

    MCUflag: array[0..1] OF Byte;
    state: array[0..31] of Byte;
  end;
  PCmdtermSrv_QUERYLED_V3 = ^TCmdtermSrv_QUERYLED_V3;

    {ֹͣ��α }
  TCmdSrvtermStopAntiFake_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;

    TypeId: Byte;
    DataType: Word;

    //Fact_ID: Byte;  // ���̱�ʶ
    MCUFlag: array[0..1] of Byte;
  end;
  PCmdSrvtermStopAntiFake_V3 = ^TCmdSrvtermStopAntiFake_V3;

  {���ò˵���Ϣ}
  TCmdTermSrvSetInfoMenu_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//integer;
    CmdId: word;
    // ��Ϣ�˵��б�����
  end;
  PCmdTermSrvSetInfoMenu_V3 =^TCmdTermSrvSetInfoMenu_V3;

  {�����ܱ���Ϣ����˵���Ϣ}
  TCmdTermSrvSetClassInfoMenu_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: word;
    // ��Ϣ�˵��б�����
  end;
  PCmdTermSrvSetClassInfoMenu_V3 =^TCmdTermSrvSetClassInfoMenu_V3;

  {����ҵ���·�}
  TCmdTermSrvDownAOrder_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3;//integer;
    CmdId: Word;
    OrderID: integer; //����ID ����ͻ���<->���ز��õ���Integer; ����<->��������Word
    OrderType: Byte; //��������

    OrderDateTime: TDateTime_V2; //�������ڡ�ʱ�� --����Ҫ������ʱ���10����
    //�·������ٸ����� 1   ��a

    //�·�����ID�б�     a*5   a������ID��integer��

    //��������         <200  ASCII��

    //������ϸ����     <200  ASCII��

    //�˿͵绰��             ASCII��
  end;
  PCmdTermSrvDownAOrder_V3 = ^TCmdTermSrvDownAOrder_V3;

  TCmdTermSrvCancelOrder_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    //DevType: Byte;//�豸����    BCD��       //DevId: integer;
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3;//�����ն�Id  BCD��
    CmdId: Word;
    OrderID: integer; //����ID
  end;
  PCmdTermSrvCancelOrder_V3 = ^TCmdTermSrvCancelOrder;

    {���ظ��ͻ��ˣ�������Ϣ���и��ģ���ͻ������д����ݿ��и��� SRVTERM_ORDERCHANGED_V3 = $C3;}
  TCmdSrvTermOrderChanged_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;
    
    OrderID: integer;
    MCU_FACT_ID: Byte;
    MCU_DEV_ID: Integer;
    RetStat: Byte; //��������--�ö���״̬
  end;
  PCmdSrvTermOrderChanged_V3 = ^TCmdSrvTermOrderChanged_V3;

  TCmdSrvTermCancelOrder_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    //DevType: Byte;
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //array[0..2] of Byte;
    CmdId: Word;

    OrderId: Integer;
    ReasonId: Byte;
  end;
  PCmdSrvTermCancelOrder_V3 = ^TCmdSrvTermCancelOrder_V3;

  TCmdSrvTermOrderDone_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    //DevType: Byte;
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //array[0..2] of Byte;
    CmdId: Word;

    OrderId: Integer;
  end;
  PCmdSrvTermOrderDone_V3 = ^TCmdSrvTermOrderDone_V3;

  //TERMSRV_SETCIRCLEAREA_V3 =$1c  //���ó����ĵ���Χ�� (Բ��)
  TCmdTermSrvSetCircleArea_V3 = packed record
    Header:THead_V3;
    SetType: Byte;  //��������	BYTE	0����������
                    //                1��׷������
                    //                2���޸�����
    SetCount : Byte;//��������	BYTE
    PackCount :Byte;//��������	BYTE	��ǰ���ݰ����������
     //������		Բ��������������������ݸ�ʽ����43
//  end;
//
//  TRecordAreaCircle = packed record
    AreaID: LongWord;               //��һ���·�һ��Բ������
    AreaAlarmKind: Word;
    Latitude: LongWord;
    Longitude: LongWord;
    Radio: LongWord;
//    BeginDateTime: array[0..5] of Byte;
//    endDateTime: array[0..5] of Byte;
//    MaxSpeed: Word;
//    ContinueTime: Byte;
  end;
  PCmdTermSrvSetCircleArea_V3 = ^TCmdTermSrvSetCircleArea_V3;


  //SRVTERM_SETRECTANGLEAREA_V3 =$1E   //���ó����ĵ���Χ��  (����)
  TCmdTermSrvSetRectangleArea_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//integer;
    CmdId: Word;

    AreaCount: Byte;
    AreaID: LongWord;
    AreaAlarmKind: Word;
    LeftLatitude: LongWord;
    LeftLongitude: LongWord;
    RightLatitude: LongWord;
    RightLongitude: LongWord;
   { beginDateTime: array[0..5] of Byte;
    endDateTime: array[0..5] of Byte;
    MaxSpeed: Word;
    ContinueTime: Byte;  }

  end;
  PCmdTermSrvSetRectangleArea_V3 = ^TCmdTermSrvSetRectangleArea_V3;

  //SRVTERM_SETNOSYMBOLAREA_V3 =$20   //���ó����ĵ���Χ��  (������ͼ��)
  TCmdTermSrvSetNoSymbolArea_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//integer;
    CmdId: Word;

    AreaID: LongWord;
    AreaAlarmKind: Word;

   { beginDateTime: array[0..5] of Byte;
    endDateTime: array[0..5] of Byte;
    MaxSpeed: Word;
    ContinueTime: Byte;
    // �����ܶ�����
    // ����Ϣ�ж�����
    // ������}

  end;
  PCmdTermSrvSetNoSymbolArea_V3 = ^TCmdTermSrvSetNoSymbolArea_V3;

     //TCLIENT_CANCELCIRCLEAREA_V3=$1D  //ȡ��ָ����Բ����������ID��4d��
  TCmdTermSrvCancelArea_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//integer;
    CmdId: Word;

    count: Byte;  //������
  end;
  PCmdTermSrvCancelArea_V3 = ^TCmdTermSrvCancelArea_V3;

       //SRVTERM_SENDVIDEW_V3 =$32   //������Ƶ�ļ�
  TCmdTermSrvSendVideo_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//integer;
    CmdId: Word;

   // ��Ƶ�ļ�

  end;
  PCmdTermSrvSendVideo_V3 = ^TCmdTermSrvSendVideo_V3;

    {������� TERMSRV_REMOVEALARM_V3}
  TCmdTermSrvRemoveAlarm_V3 = packed record
    Header:THead_V3;
  end;
  PCmdTermSrvRemoveAlarm_V3 = ^TCmdTermSrvRemoveAlarm_V3;

      {ȷ��Ԥ�� TERMSRV_CONFIRMEARLYWARNING_V3}
  TCmdTermSrvConfirmEarlyWarning_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3;
    CmdId: Word;
  end;
  PCmdTermSrvConfirmEarlyWarning_V3 = ^TCmdTermSrvConfirmEarlyWarning_V3;

    {�ظ�MCU�ĳ�����ʼֵ TERMSRVINITIALIZEMCU_V3}
  TCmdtermSrvInitializeMCU_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//integer;
    CmdId: Word;
  end;
  PCmdtermSrvInitializeMCU_V3 = ^TCmdtermSrvInitializeMCU_V3;

      {Զ�̿���MCU��λ TRRMSERVCONTROLMCU_V3}
  TCmdtermSrvControlMCU_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//integer;
    CmdId: Word;
  end;
  PCmdtermSrvControlMCU_V3 = ^TCmdtermSrvControlMCU_V3;

  {��ѯLCD״̬}
  TCmdtermSrvQueryLCDState_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;

    TypeId: Byte;
    DataType: Word;

    //Fact_ID: Byte;  // ���̱�ʶ
    MCUFlag: word;//array[0..1] of Byte;
    dateTime: array[0..6] of Byte;
  end;
  PCmdtermSrvQueryLCDState_V3 = ^TCmdtermSrvQueryLCDState_V3;

  {��λLCD}
  TCmdTermSrvResetLCD_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3;//integer;
    CmdId: Word;

    TypeId: Byte;
    DataType: Word;

    //Fact_ID: Byte;  // ���̱�ʶ
    MCUFlag: word;//array[0..1] of Byte;
  end;
  PCmdTermSrvResetLCD_V3 = ^TCmdTermSrvResetLCD_V3;

  {����/�ر�LCD}
  TCmdTermSrvOpenLCD_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;

    TypeId: Byte;
    DataType: Word;

    //Fact_ID: Byte;  // ���̱�ʶ
    MCUFlag: word;//array[0..1] of Byte;
    Res: Byte;
  end;
  PCmdTermSrvOpenLCD_V3 = ^TCmdTermSrvOpenLCD_V3;

  {��ʾָ���Ĺ����Ϣ}
  TCmdTermSrvViewAdInfo_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId:TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3;//integer;
    CmdId: Word;

    TypeId: Byte;
    DataType: Word;

    //Fact_ID: Byte;  // ���̱�ʶ
    MCUFlag: Word;
    // �����Ϣ
  end;
  PCmdTermSrvViewAdInfo_V3 = ^TCmdTermSrvViewAdInfo_V3;

  {����ָ���Ĺ����Ϣ}
  TCmdTermSrvDownLoadAdInfo_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3;//integer;
    CmdId: Word;

    TypeId: Byte;
    DataType: Word;

    //Fact_ID: Byte;  // ���̱�ʶ
    MCUFlag: Word;
    // �����Ϣ
  end;
  PCmdTermSrvDownLoadAdInfo_V3 = ^TCmdTermSrvDownLoadAdInfo_V3;

  {��ѯ��ǰ���ڲ��ŵĹ����Ϣ}
  TCmdTermSrvQueryAdInfo_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3;//integer;
    CmdId: Word;

    TypeID: Byte;
    DataType: Word;

    //Fact_ID: Byte;
    MCUFlag: Word;
  end;
  PCmdTermSrvQueryAdInfo_V3 = ^TCmdTermSrvQueryAdInfo_V3;

    {��ѯLCD�ڵĹ����Ϣ}
  TCmdTermSrvQueryAllAdInfo_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3;//integer;
    CmdId: Word;

    TypeID: Byte;
    DataType: Word;

    //Fact_ID: Byte;
    MCUFlag: Word;
  end;
  PCmdTermSrvQueryAllAdInfo_V3 = ^TCmdTermSrvQueryAllAdInfo_V3;

      {ɾ��ָ���ĵĹ����Ϣ}
  TCmdTermSrvDeleteAdInfo_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3;//integer;
    CmdId: Word;

    TypeID: Byte;
    DataType: Word;

    //MCU//FactID: Byte;--sjp  zdclû��factId
    MCUFlag: Word;
    // �����Ϣ������
  end;
  PCmdTermSrvDeleteAdInfo_V3 = ^TCmdTermSrvDeleteAdInfo_V3;

        {ɾ�����еĵĹ����Ϣ}
  TCmdTermSrvDeleteAllAdInfo_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3;//integer;
    CmdId: Word;

    TypeId: Byte;
    DataType: Word;

    //Fact_ID: Byte;  // ���̱�ʶ
    MCUFlag: Word;
  end;
  PCmdTermSrvDeleteAllAdInfo_V3 = ^TCmdTermSrvDeleteAllAdInfo_V3;

      {LCD��Ӧ}
  TCmdSrvTerm_LCD_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;

    TypeId: Byte;
    Fact_ID: Byte;

    MCUflag: Word; //array[0..1] OF Byte;
    //RES: Byte;
    // ������

  end;
  PCmdSrvTerm_LCD_V3 = ^TCmdSrvTerm_LCD_V3;

  {LCD��Ӧ}
  TCmdSrvTerm_QUERYLCD_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//integer;
    CmdId: Word;

    MCUFactID: Byte;//--sjp  zdclû��factId
    MCUflag: word;//array[0..1] OF Byte;
    // ������
  end;
  PCmdSrvTerm_QUERYLCD_V3 = ^TCmdSrvTerm_QUERYLCD_V3;

  // �Ƽ�������
  TMeterParam_V3 = packed record
    CSQYSJ: array[0..4] of Byte;        // ��������ʱ��
    BTWFDJ: array[0..1] of Byte;        // ������������
    YJWFDJ: array[0..1] of Byte;        // ҹ����������
    BTDCDJ: array[0..1] of Byte;        // ���쵥�̵���
    YJDCDJ: array[0..1] of Byte;        // ҹ�䵥�̵���
    BTECKTDJ: array[0..1] of Byte;      // ������ο�������
    YJECKTDJ: array[0..1] of Byte;      // ҹ����ο�������
    BTQBJ: array[0..1] of Byte;         // �����𲽼�
    YJQBJ: array[0..1] of Byte;         // ҹ���𲽼�
    XCGLS: array[0..1] of Byte;         // ���̹�����
    QCGL: array[0..1] of Byte;          // ���̹���
    DCGL: array[0..1] of Byte;          // ���̹���
    ECKTGL: array[0..1] of Byte;        // ���ο�������
    BTDHSJDJ: array[0..1] of Byte;      // ����Ⱥ�ʱ�䵥��
    YJDHSJDJ: array[0..1] of Byte;      // ҹ��Ⱥ�ʱ�䵥��
    MFDHSJ: array[0..1] of Byte;        // ��ѵȺ�ʱ��
    JJSJ: array[0..1] of Byte;          // �Ӽ�ʱ��
    YJKSSJ: array[0..1] of Byte;        // ҹ�俪ʼʱ��
    YJJSSJ: array[0..1] of Byte;        // ҹ�����ʱ��
    FJF: array[0..1] of Byte;           // ���ӷ�

    RFU: array[0..20] of Byte;          // RFU
    //----------�����Զ������(�Ͼ�ͨ���Զ���)
    DTSJQLKSSJ: array[0..1] of Byte;     // �����������㿪ʼʱ��
    QXMDLC: array[0..1] of Byte;         // ȡ��������
    QHSD: array[0..1] of Byte;           // �л��ٶ�
    CCSJ: array[0..1] of Byte;           // ���ʱ��
    CDSJ: array[0..1] of Byte;           // ������

    byte74: Byte;                        // ��ӡ���µĴ�ӡƫ���������ΪFF���ʾ����ӡ

    byte75: Byte;                        // �߰��ֽ�Ϊ0 ��ʾ��̡��߰��ֽ�Ϊ1 ��ʾ����̣�
                                         // �Ͱ��ֽ�Ϊ0 ��ʾ�Զ��Ⱥ򡢵Ͱ��ֽ�Ϊ1 ��ʾ�ֶ��Ⱥ�

    byte76: Byte;                        // �߰��ֽ�Ϊ0 ��ʾ�Զ����̡��߰��ֽ�Ϊ1 ��ʾ�ֶ����̣�
                                         // �Ͱ��ֽ�Ϊ0 ��ʾ�Զ���ӡ���Ͱ��ֽ�Ϊ1 ��ʾ�ֶ���ӡ��

    byte77: Byte;                        // ������������1-15��

    byte78: Byte;                        // �߰��ֽ�Ϊ0 ��ʾ��ͨһ��ͨ���ܡ��߰��ֽ�Ϊ1 ��ʾ�رոù��ܣ�
                                         // �Ͱ��ֽ�Ϊ0 ��ʾ��ͨGPS���ܡ��Ͱ��ֽ�Ϊ1 ��ʾ�رոù��ܣ�

    byte79: Byte;                        // �߰��ֽ�Ϊ0 ��ʾӪ�����ݵ����ʹ�ʱ������ʷ���ݡ��߰��ֽ�Ϊ1 ��ʾӪ�����ݵ����ʹ�ʱֹͣӪ�ˣ�
                                         // �Ͱ��ֽ�Ϊ0x01 ��ʾ��ʾ�������뵽�֡�
                                         // �Ͱ��ֽ�Ϊ0x02 ��ʾ��ʾ�������뵽�ǡ�
                                         // �Ͱ��ֽ�Ϊ0x04 ��ʾ��ʾ�������뵽Ԫ��
                                         // �Ͱ��ֽ�Ϊ0x08 ��ʾ��ʾ��������Ϊ����������������������������뷽ʽ����ͬʱ���ڣ�

    byte80: Byte;                        // 10H ��ȵ���ʱ���ϳ�ֽ��������ʾ��PFC8583ʱ��оƬ��
                                         // 11H ��ȵ���ʱ���ϳ�ֽ��������ʾ��PFC8563ʱ��оƬ��
                                         // 12H ��ȵ���ʱ���ϳ�ֽ��������ʾ��PFC8583ʱ��оƬ��
                                         // 13H ��ȵ���ʱ���ϳ�ֽ��������ʾ��PFC8563ʱ��оƬ��
                                         // 14H ��ȵ���ʱ��ǰ��ֽ��������ʾ��PFC8583ʱ��оƬ��
                                         // 15H ��ȵ���ʱ��ǰ��ֽ��������ʾ��PFC8563ʱ��оƬ��
                                         // 16H ��ȵ���ʱ��ǰ��ֽ��������ʾ��PFC8583ʱ��оƬ��
                                         // 17H ��ȵ���ʱ��ǰ��ֽ��������ʾ��PFC8563ʱ��оƬ��
                                         // 18H �������ʱ���ϳ�ֽ��������ʾ��PFC8583ʱ��оƬ��
                                         // 19H �������ʱ���ϳ�ֽ��������ʾ��PFC8563ʱ��оƬ��
                                         // 1AH �������ʱ���ϳ�ֽ��������ʾ��PFC8583ʱ��оƬ��
                                         // 1BH �������ʱ���ϳ�ֽ��������ʾ��PFC8563ʱ��оƬ��
                                         // 1CH �������ʱ��ǰ��ֽ��������ʾ��PFC8583ʱ��оƬ��
                                         // 1DH �������ʱ��ǰ��ֽ��������ʾ��PFC8563ʱ��оƬ��
                                         // 1EH �������ʱ��ǰ��ֽ��������ʾ��PFC8583ʱ��оƬ��
                                         // 1FH �������ʱ��ǰ��ֽ��������ʾ��PFC8563ʱ��оƬ��
  RFU2: array[0..44] of Byte;            // ����
  CRC: Word;              // CRCУ��ֵ�����ֽ���ǰ�����ֽ��ں�
  //----------�����Զ������(�Ͼ�ͨ���Զ���)
  end;
  PMeterParam_V3 = ^TMeterParam_V3;

  // ���üƼ�������
  TCmdTermSrvMeterParam_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;

    TypeID: Byte;
    DataType: Word;

    MCUflag: Word; //array[0..1] OF Byte;
    // ����
    MeterParam: TMeterParam_V3;
  end;
  PCmdTermSrvMeterParam_V3 = ^TCmdTermSrvMeterParam_V3;

  // ���üƼ�������
  TCmdTermSrvMeterParam_V3_NJTY = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;

    TypeID: Byte;
    DataType: Word;

    MCUflag: Word; //array[0..1] OF Byte;
    // ����
    MeterParam: array[0..127] of byte;
  end;
  PCmdTermSrvMeterParam_V3_NJTY = ^TCmdTermSrvMeterParam_V3_NJTY;

  // ��ȡ�Ƽ�������
  TCmdTermSrvReadMeterParam_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;

    TypeID: Byte;
    DataType: Word;

    MCUflag: Word; //array[0..1] OF Byte;
  end;
  PCmdTermSrvReadMeterParam_V3 = ^TCmdTermSrvReadMeterParam_V3;

    // ��ȡ�Ƽ������� Ӧ��
  TCmdSrvTermReadMeterParam_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;

    TypeID: Byte;
    Fact_Id: Byte; //DataType: Word;

    MCUflag: Word; //array[0..1] OF Byte;
  end;
  PCmdSrvTermReadMeterParam_V3 = ^TCmdSrvTermReadMeterParam_V3;

  {�Ƽ���״̬}
  TCmdtermSrvQueryMeterState_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;

    TypeId: Byte;
    DataType: Word;

    //Fact_ID: Byte;  // ���̱�ʶ
    MCUFlag: word;//array[0..1] of Byte;
    dateTime: array[0..6] of Byte;
  end;
  PCmdtermSrvQueryMeterState_V3 = ^TCmdtermSrvQueryMeterState_V3;

    {TSM״̬}
  TCmdtermSrvQueryTSMState_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;

    TypeId: Byte;
    DataType: Word;

    //Fact_ID: Byte;  // ���̱�ʶ
    MCUFlag: word;//array[0..1] of Byte;
    dateTime: array[0..6] of Byte;
  end;
  PCmdtermSrvQueryTSMState_V3 = ^TCmdtermSrvQueryTSMState_V3;

    // TSMӦ��
  TCmdTermSrv_TSM_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;

    TypeID: Byte;
    Fact_ID: Byte;//DataType: Word;

    MCUflag: Word; //array[0..1] OF Byte;
  end;
  PCmdTermSrv_TSM_V3 = ^TCmdTermSrv_TSM_V3;

    {���������̼����� TERMSRV_UPDATEDEVFIRMWARE}
  TCmdTermSrvUpdateDevFirmware_V3 = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: TDEV_ID_BCD_ZDCL;//TDEV_ID_BCD_V3; //integer;
    CmdId: Word;
    
    UpdateType: Byte; //�����豸���ͣ���0����ʾ��������1����ʾ����������
    //URL��ַ ��������200Byte
  end;
  PCmdTermSrvUpdateDevFirmware_V3 = ^TCmdTermSrvUpdateDevFirmware_V3;

//=====================��Ϣ��============================//
  TSendTextInfo = packed record  // �ı���Ϣ�·�(0x8300)��Ϣ�壬�ն˻ظ�ͨ��Ӧ��
    Sign: Byte;       // ��־
    TextInfo: string; // �ı���Ϣ
  end;
  PSendTextInfo = ^TSendTextInfo;

  TSendSetEvent = packed record // �¼�����(0x8301)��Ϣ��, �ն˻ظ�ͨ��Ӧ��
    Count: Byte;      // �¼��������0��ʾɾ���ն������¼�
    EventList: Pointer; // �¼����б�ָ��TEvent
  end;
  PSendSetEvent = ^TSendSetEvent;

  TEvent = packed record   // �¼���
    ID: Byte;       // ���ն�����ͬID���¼����򱻸���
    Info: string;   // ʱ������
  end;
  PEvent = ^TEvent;

  TSendQuestion = packed record // �����·�(0x8302)��Ϣ�壬�ն˻ظ�ͨ��Ӧ��
    Sign: Byte;       // ��־
    Question: string; // ����
    AnswerList: Pointer;  // ��ѡ�����б�ָ��TAnswer �豣֤��Ϣ�峤�Ȳ�����500�ֽ�
  end;
  PSendQuestion = ^TSendQuestion;

  TAnswer = packed record
    ID: Byte;   //��ID
    Info: string; // ������ �Ϊ20�ֽ�
  end;

//======================�绰��===========================//
  TSendTelNO = packed record  // �绰�ز�(0x8400)��Ϣ�壬�ն˻ظ�ͨ��Ӧ��
    Sign: Byte;     // ��־
    TelNO: string;  // �绰���룬 �Ϊ20���ֽ�
  end;
  PSendTelNO = ^TSendTelNO;

  TSendSetTelList = packed record   // ���õ绰��(0x8401)��Ϣ�壬�ն˻ظ�ͨ��Ӧ��
    Count: Byte;    // ������Ϣ����ϵ��������0��ʾɾ���ն������д洢����ϵ��
    TelList: Pointer;   // ��ϵ����
  end;
  PSendSetTelList = ^TSendSetTelList;

  TTelList = packed record   // ��ϵ����
    Sign: Byte;   // ��־
    TelNO: string;  // �绰����
    LinkMan: string;  // ��ϵ��
  end;
  PTelList = ^TTelList;

//======================����������=======================//
  TSendControlCar = packed record   // ��������(0x8500)��Ϣ��,�ն��Ȼظ�ͨ��Ӧ���ڻظ�0x0500Ӧ��
    Option: Byte; // ������
    Command: Byte;  // ��������
  end;
  PSendControlCar = ^TSendControlCar;

//======================����������=======================//
  TSendSetAlarmCircle = packed record   // ����Բ������(0x8600)��Ϣ��
    Num: Byte;    // ������
  end;
  PSendSetAlarmCircle = ^TSendSetAlarmCircle;

  TCircleOptions = packed record    // Բ�������������
    ID: Integer;          // ����ID
    Properties: Word;     // ��������
    Latitude: Integer;    // γ��
    Longitude: Integer;   // ����
    Radius: Integer;      // �뾶
    BeginTime: array[0..5] of Byte; // ��ʼʱ��
    EndTime: array[0..5] of Byte;   // ����ʱ��
    MaxSpeed: Word;       // ����ٶ�
    OverspeedKeepTime: Byte;  // ���ٳ���ʱ��
  end;
  PCircleOptions = ^TCircleOptions;

  TSendDeleteAlarmCircle = packed record  // ɾ��Բ������(0x8601)��Ϣ��
    Num: Byte;        // ��������������Ϣ�а�������������������125������125�ö�����Ϣ��0Ϊɾ������Բ������
  end;
  PSendDeleteAlarmCircle = ^TSendDeleteAlarmCircle;

  TSendSetAlarmRectangle = packed record  // ���þ�������(0x8602)��Ϣ��
    Num: Byte;    // ������
  end;
  PSendSetAlarmRectangle = ^TSendSetAlarmRectangle;

  TRectangleOptions = packed record   // ���������������
    ID: Integer;          // ����ID
    Properties: Word;     // ��������
    LeftUpLatitude: Integer;    // ����γ��
    LeftUpLongitude: Integer;   // ���Ͼ���
    RightDownLatitude: Integer;    // ����γ��
    RightDownLongitude: Integer;   // ���¾���
    BeginTime: array[0..5] of Byte; // ��ʼʱ��
    EndTime: array[0..5] of Byte;   // ����ʱ��
    MaxSpeed: Word;       // ����ٶ�
    OverspeedKeepTime: Byte;  // ���ٳ���ʱ��
  end;
  PRectangleOptions = ^TRectangleOptions;

  TSendDeleteAlarmRectangle = packed record  // ɾ����������(0x8603)��Ϣ��
    Num: Byte;        // ��������������Ϣ�а�������������������125������125�ö�����Ϣ��0Ϊɾ������Բ������
  end;
  PSendDeleteAlarmRectangle = ^TSendDeleteAlarmRectangle;

  TSendSetAlarmNoSybol = packed record  // ���ö��������(0x8604)��Ϣ��
    ID: Integer;          // ����ID
    Properties: Word;     // ��������
    BeginTime: array[0..5] of Byte; // ��ʼʱ��
    EndTime: array[0..5] of Byte;   // ����ʱ��
    MaxSpeed: Word;       // ����ٶ�
    OverspeedKeepTime: Byte;  // ���ٳ���ʱ��
    AreaAllVertexNum: Word;   // �����ܶ�����
    ThisInfoVertexNum: Byte;  // ����Ϣ�ж�����,�豣֤��Ϣ�峤�Ȳ�����500
  end;
  PSendSetAlarmNoSybol = ^TSendSetAlarmNoSybol;

  TVertexOptions = packed record // ������
    VertexLatitude: Integer;    // ����γ��
    VertexLongitude: Integer;   // ���㾭��
  end;
  PVertexOptions = ^TVertexOptions;

  TSendDeleteAlarmNoSybol = packed record   // ɾ�����������(0x8605)��Ϣ��
    Num: Byte;    // ��������������Ϣ�а�������������������125������125�ö�����Ϣ��0Ϊɾ�����о�������
  end;
  PSendDeleteAlarmNoSybol = ^TSendDeleteAlarmNoSybol;

  TSendSetRunWay = packed record

  end;

{**********************  ������Web���񵽿ͻ��˵�����ṹ **********************}

{*****************  ���������ط������Ϳͻ���֮�������ṹ ********************}

  {�ն�����������͵�ȷ������ͨѶЭ������
    @TABB
    @H(��ʶ |����    |����|�μ�)
    @R( size| Word   |���ݰ��ĳ���=sizeof(TCmdTermsrvRegverData) | | )
    @R( Flag| Byte   |=TERMSRV_REG| )     //�ǲ���Ӧ���á�TERMSRV_COMMVER  --shajp��
    @R( MajorVer|Byte|����Э�����汾 | )
    @R( MinorVer|Byte|����Э��ΰ汾 | )
    @TABE
    ����Э���ʽ˵��:<br>
    [������2Byte][��־1Byt][������]<br>
    ������=�������ݰ��ĳ���
  }
  TCmdTermsrvRegverData = packed record
    Size: Word;
    Flag: Byte;
    case integer of
      0: (MinorVer, MajorVer: Byte);
      1: (Ver: Word);
  end;
  PCmdTermsrvRegverData = ^TCmdTermsrvRegverData;
  {@link(TCmdTermsrvRegverData)����Ļظ�}
  TCmdSrvtermRegverData = packed record
    Size: Word;
    Flag: Byte;
    Ret: integer;
  end;
  PCmdSrvtermRegverData = ^TCmdSrvtermRegverData;

  {�û���¼���ط�����
   @TABB
   @H(��ʶ  |����    |����|�μ�)
   @R( UserID  |integer| �û�ID)
   @R( UserPass|stirng | �û�����)
   @TABE
  }
  TCmdTermsrvRegUserData = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: integer;
    CmdId: integer;

    UserID: integer;
    UserPass: string[20];
    version: Byte;
  end;
  PCmdTermsrvRegUserData = ^TCmdTermsrvRegUserData;
  {�û���¼����ķ���@link(TCmdTermsrvRegUserData)}
  TCmdSrvtermRegUserData = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: integer;
    CmdId: integer;
    UserId: Integer;
    Ret: Byte;
  end;
  PCmdSrvtermRegUserData = ^TCmdSrvtermRegUserData;

  {�ն������ط����������ȡ�豸�����һ��λ�ã���Ч�ģ�״̬����
  @TABB
  @H(��ʶ  | ����    |����                  |�μ�)
  @R( size | Word    |���ݰ��ĳ���=sizeof() | | )
  @R( Flag | Byte    |=| )
  @R( CmdId| | )
  @R( DevId| | )
  @TABE}
  TCmdTermsrvGetlastPosData = packed record
    Size: Word;
    Flag: Byte;
    CmdId, DevId: integer;
  end;
  PCmdTermsrvGetlastPosData = ^TCmdTermsrvGetlastPosData;

  {��ȡ�ƶ�Ŀ������һ��λ��״̬��������ִ�еķ��ؽ��
    @TABB
    @H(��ʶ  | ����  |����         |�μ�)
    @R( Size | Word  | ���ݰ��ĳ���| )
    @R( Flag | Byte  | ����ı�־  | )
    @R( CmdId|Integer| ����ID      | )
    @R( Ret  |Integer| ����ֵ      | )
    @TABE
  }
  TCmdSrvtermGetlastPosData = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: integer;
  end;
  PCmdSrvtermGetlastPosData = ^TCmdSrvtermGetlastPosData;

  {��ȡGPS�豸״̬}
  TCmdTermsrvGetstatData = packed record
    Size: Word;
    Flag: Byte;
    CmdId, DevId: integer;
  end;
  PCmdTermsrvGetstatData = ^TCmdTermsrvGetstatData;
  TCmdSrvEmptyWord = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    nextType:byte;
    wordtype: Byte;
    wordEdit:byte;
  end;
  PCmdSrvEmptyWord = ^TCmdSrvEmptyWord;
  {��ȡGPS�豸״̬�ķ���ֵ}
  TCmdSrvtermGetstatData = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: integer;
    case integer of
      0: ();
      1: (
        MajorVer: Byte;
        MinorVer: Byte;
        Freq: Word;
        AutoSend: Byte;
         //BatteryVoltage: Word;
         //Batterytemperature: Word;
        HaveMoreInfo: Byte);
  end;
  PCmdSrvtermGetstatData = ^TCmdSrvtermGetstatData;

  {����GPS�豸�Ķ�λ����}
  TCmdSrvtermGpsdata = packed record
    Size: Word;
    Flag: Byte;
    DevId: integer;
    Long: integer;
    Lat: integer;
    GpsTime: array[0..5] of Byte;
    Altitude: Word;
    Speed: Word;
    Angle: Word;
    Stat: Byte;
    Switch: Byte;
  end;
  PCmdSrvtermGpsdata = ^TCmdSrvtermGpsdata;

  {�������GPS����}
  TGpsData = packed record
    Size: Byte;
    Id: integer;
    Long: Double;
    Lat: Double;
    GpsTime: TDateTime;
    Speed: integer;
    Altitude: integer;
    Angle: integer;
    IO: Word; //��8λ��ʾ��ͷ,��8λ��ʾ�豸״̬
    //��8λ��0λ��ʾ��λ״̬,1λ��ʾGPRS����״̬
  end;
  PGpsData = ^TGpsData;

  {���г�������
    @TABB
    @H(��ʶ      |����   |  ����                      |�μ�)
    @R( Size     | Word  |=sizeof(TCmdTermsrvCalldev) | )
    @R( Flag     | Byte  |=TERMSRV_CALLDEV            | )
    @R( CmdId    |Integer|����ID                      | )
    @R( DevId |Integer|Ҫ���е��ƶ�Ŀ��ID          | )
    @R( Freq     | Word  |���к������ݵ�Ƶ��        | )
    @R( HoldTime | Word  | ���г�����ʱ��             | )
    @R( AvailTime| Byte  |���������������б��е���Ч��(����)��������Ч����û�б�ִ�о�ȡ��| )
    @TABE
  }
  TCmdTermsrvCalldev = packed record
    Size: Word;
    Flag: Byte;
    CmdId, DevId: integer;
    Freq, HoldTime: Word;
    AvailTime: Byte;
  end;
  PCmdTermsrvCalldev = ^TCmdTermsrvCalldev;

  TCmdSrvtermCalldev = packed record
    Size: Word;
    Flag: Byte;
    CmdId, DevId, Ret: integer;
    Freq, HoldTime: Word;
  end;
  PCmdSrvtermCalldev = ^TCmdSrvtermCalldev;

  {��������
    @TABB
    @H(��ʶ       | ����  |����                   |�μ�)
    @R( Size      |Word   |���ݰ�����             | )
    @R( Flag      |Byte   |�����־               | )
    @R( CmdID     |integer|������               | )
    @R( DevId  |integer|Ŀ��ID                 | )
    @R( SwitchId  | Byte  | �̵���ID              | )
    @R( SwitchStat| Stat  | �̵���״̬��0�Ͽ�����1����| )
    @TABE
  }
  TCmdTermsrvSwitchCtrlData = packed record
    Size: Word;
    Flag: Byte;
    CmdId, DevId: integer;
    SwitchId, SwitchStat: Byte;
  end;
  PCmdTermsrvSwitchCtrlData = ^TCmdTermsrvSwitchCtrlData;

  TCmdSrvtermSwitchCtrlData = packed record
    Size: Word;
    Flag: Byte;
    CmdId, DevId, Ret: integer;
    SwitchId, SwitchStat: Byte;
  end;
  PCmdSrvtermSwitchCtrlData = ^TCmdSrvtermSwitchCtrlData;

 {
  TERMSRV_SENDDEVMSG  = $08;
  SRVTERM_SENDDEVMSG  = $88;
  ���ͼ����Ϣ���豸}
  TCmdTermSrvDevMsgHeader = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    MsgID: Word;
    MsgType: Byte
    //MsgContent:TBytes;
  end;
  PCmdTermSrvDevMsgHeader = ^TCmdTermSrvDevMsgHeader;

  {��������Ӧ�ͻ��˷��͵�����"���ͼ����Ϣ���豸"}
  TCmdSrvTermDevMsg = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    MsgID: Word;
    Ret: integer;
  end;
  PCmdSrvTermDevMsg = ^TCmdSrvTermDevMsg;


  {�ͻ���PING������}
  TCmdTermsrvPingData = packed record
    Size: Word;
    Flag: Byte; //TERMSRV_PING
    CmdId, TimeStamp: Longword;
  end;
  PCmdTermsrvPingData = ^TCmdTermsrvPingData;
  {��������PING����Ӧ}
  TCmdSrvterPingData = packed record
    Size: Word;
    Flag: Byte; //SRVTERM_PING
    CmdId, TimeStamp: Longword;
  end;
  PCmdSrvterPingData = ^TCmdSrvterPingData;

  {�����������ݸ��µ�֪ͨ��
  ֪ͨ�ͻ���Ҫˢ��ָ�����豸����Ϣ}
  TSrvtermNotifystat = packed record
    Size: Word;
    Flag: Byte;
    DevId: integer;
    ChangeFlag: Byte;
  end;
  PSrvtermNOtifystat = ^TSrvtermNotifystat;

  {  ȡ������ִ�е�����
     @TABB
     @H(��ʶ|  ����   |����                             |�μ�)
     @R( Size| Word   |=sizeof(TCmdTermsrvCancelCmdData)|  )
     @R( Flag| Byte   |=TERMSRV_CANCELCMD               | )
     @R( CmdID|integer| ���������ID                    | )
     @R( CmdTobeCancel| integer| Ҫȡ��������ID         | )
     @TABE
  }
  TCmdTermsrvCancelCmd = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    CmdTobeCancel: integer;
  end;
  PCmdTermsrvCancelCmd = ^TCmdTermsrvCancelCmd;

  {  ȡ������ִ�е�����ķ�������������Ӧ
     @TABB
     @H(��ʶ|  ����   |����                             |�μ�)
     @R( Size| Word   |=sizeof(TCmdSrvTermCancelCmdData)|  )
     @R( Flag| Byte   |=SRVTERM_CANCELCMD               | )
     @R( CmdID|integer| ���������ID                    | )
     @R( CmdTobeCancel| integer| Ҫȡ��������ID         | )
     @R( Ret | integer| �������ķ���ֵ                | )
     @TABE
  }
  TCmdSrvTermCancelCmd = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    CmdTobeCancel: integer;
    Ret: integer;
  end;
  PCmdSrvTermCancelCmd = ^TCmdSrvTermCancelCmd;

 {   ����������DTE
     @TABB
     @H(��ʶ|  ����   |����                             |�μ�)
     @R( Size| Word   |=sizeof(TCmdSrvTermCancelCmdData)|  )
     @R( Flag| Byte   |=SRVTERM_CANCELCMD               | )
     @R( CmdID|integer| ���������ID                    | )
     @R( CmdTobeCancel| integer| Ҫȡ��������ID         | )
     @R( Ret | integer| �������ķ���ֵ                | )
     @TABE
  }
  TCmdTermSrvSendToDTEHeader = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    DataLen: Byte;
  end;
  PCmdTermSrvSendToDTEHeader = ^TCmdTermSrvSendToDTEHeader;

  {��������������Ӧ����}
  TCmdSrvTermSendToDTE = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: integer;
  end;
  PCmdSrvTermSendToDTE = ^TCmdSrvTermSendToDTE;

  {SRVTERM_DEVTOHOST,�յ�Dev���͵�Host������}
  TCmdSrvTermRecvFromDTEHeader = TCmdTermSrvSendToDTEHeader;
  PCmdSrvTermRecvFromDTEHeader = ^TCmdSrvTermRecvFromDTEHeader;

  {���ܷ��������͵�֪ͨ��Ϣ
  CmdFlag	1Byte	SRVTERM_SENDMSG
  Msg	1Byte
  Data	Bytes[DataLen]
  }
  TCmdSrvTermSendMsg = packed record
    Size: Word;
    Flag: Byte;
    MsgLen: Byte;
  end;
  PCmdSrvTermSendMsg = ^TCmdSrvTermSendMsg;

  {���ɾ����֪ͨ�ͻ���}
  TCmdSrvTermCmdDeleted = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer; //��ɾ��������ID
    DelType: Byte; //��ɾ����ԭ������ 1-ɾ����2-����� 3-��ʱ
  end;
  PCmdSrvTermCmdDeleted = ^TCmdSrvTermCmdDeleted;

  {
  �ͻ��˷��������ȡ�豸�Ĳ�����
  TERMSRV_READDEVPARAM
  }
  TcmdTermSrvReadDevParam = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    ReadNum: Byte; // add by sha 2004-10-27
  end;
  PCmdTermSrvReadDevParam = ^TcmdTermSrvReadDevParam;

{���ص��豸�Ĳ������ݰ�ͷ �����������Ϊ([�������][����ֵ])
  SRVTERM_SETDEVPARAM}
  TCmdSrvTermReadDevParamRet = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: integer;
    //params
  end;
  PCmdSrvTermReadDevParamRet = ^TCmdSrvTermReadDevParamRet;

  {�����豸�Ĳ���@link(TCmdSrvTermReadDevParam)}
  TCmdTermSrvSetDevParam = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    //params
  end;
  PCmdTermSrvSetDevParam = ^TCmdTermSrvSetDevParam;

  {�����豸����������ִ�з�������}
  TCmdSrvTermSetDevParamRet = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: integer;
  end;
  PCmdSrvTermSetDevParamRet = ^TCmdSrvTermSetDevParamRet;


  {ͨ��UDP�˿�֪ͨ��Ҫ�����ݿ���ˢ���µ����ݵ�����
    @TABB
    @H(��ʶ        |����   |����|�μ�)
    @R( Flag       |Byte   | �����ʶ=DBSRV_REFRESH| )
    @R( CmdId      |integer| ����ID| )
    @R( RefreshType|Byte   | ����ˢ�µ�����| )
    @TABE
    ����ˢ�����ͣ�
    <li>����������ϵ�����仯       =$01
    <li>���������鷽����Ϣ�����仯 =$02
    <li>����-������Ӧ�����仯      =$04
  }
  TCmdDBSrvRefresh = packed record
    CmdFlag: Word;
    ExeFlag: Byte;
    CmdId: integer;
    RefreshType: Byte;
  end;
  PCmdDBSrvRefresh = ^TCmdDBSrvRefresh;


  (**************�ͻ��������� V2.0�桡���������� ***********)
  {��ȡGPS�豸״̬}
  TCmdTermsrvGetstatData_V2 = packed record
    Size: Word;
    Flag: Byte;
    CmdId, DevId: integer;
  end;
  PCmdTermsrvGetstatData_V2 = ^TCmdTermsrvGetstatData_V2;

  {��ȡGPS�豸״̬�ķ���ֵ}
  TCmdSrvtermGetstatData_V2 = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: integer;
    case integer of
      0: ();
      1: (
        DevVer: Word; //�����汾��
        DevRegTime: TDateTime; //������¼ʱ��
        );
  end;
  PCmdSrvtermGetstatData_V2 = ^TCmdSrvtermGetstatData_V2;

  {��λ���ȡ�ó����ĵ�ǰ��λ����   Flag= TERMSRV_GETPOSITION}
  TCmdTermSrvGetPosition = packed record
    Size: Word;
    Flag: Byte; //������
    CmdId: integer; //�������
    DevId: integer;
  end;
  PCmdTermSrvGetPosition = ^TCmdTermSrvGetPosition;
  {���ػظ���Flag= SRVTERM_GETPOSITION}
  TCmdSrvTermGetPosition = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermGetPosition = ^TCmdSrvTermGetPosition;
  {������ȡ�ó�����λ���� Flag= SRVTERM_GPSDATA_V2}
  TCmdSrvTermGpsData_V2 = packed record
    Size: Word;
    Flag: Byte;
    //CmdID:integer; ��CmdID
    DevId: integer;
    Latitude: integer; //γ�� X 100 0000 ��: ֵ32123456��ʾ��32.123456��
    Longitude: integer; //���� X 100 0000
    Speed: Byte; //�ٶȡ���λ������/Сʱ����ʾ��Χ0��255
    Orientation: Byte; //������������Ϊ0�ȣ�˳ʱ�����ӣ���λ��2�ȣ���ֵ��Χ0��180��
    State: Longword; //32λ״̬λ
    GpsTime: array[0..5] of Byte; // GPSʱ��
  end;
  PCmdSrvTermGpsData_V2 = ^TCmdSrvTermGpsData_V2;
  {�ͻ��˴���ʱ���õ�GpsData_V2}
  TGpsData_V2 = packed record
    Size: Byte;
    Id: integer;
    Long: Double; //������ת�������� eg: 118.123456
    Lat: Double; //������ת����γ�� eg:  32.123456
    Speed: Byte; //�ٶȡ���λ������/Сʱ����ʾ��Χ0��255
    Orientation: Word; //������ת����������������Ϊ0�ȣ�˳ʱ�����ӣ���λ����
    State: Longword; //32λ״̬λ
    GpsTime: TDateTime;
  end;
  PGpsData_V2 = ^TGpsData_V2;


  {׷�ٳ���
  @TABB
     @H(��ʶ           |  ����  |����                             |�μ�)
     @R( Size          | Word   |=sizeof(TCmdTermSrvPursue)       |  )
     @R( Flag          | Byte   |=TERMSRV_PURSUE                  | )
     @R( CmdID         | integer| ������������                  | )
     @R( DevID         | integer| Ҫ׷�ٳ���ID                    | )
     @R( PursueInterval| Word   | ��λ���룬��СΪ0��Ĭ��Ϊ30�����Ϊ65535��Լ18Сʱ����Ϊ0ʱ��ʾֹͣ׷��                | )
     @TABE
  }
  TCmdTermSrvPursue = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    PursueInterval: Word;
  end;
  PCmdTermSrvPursue = ^TCmdTermSrvPursue;
  {���ػظ���SRVTERM_PURSUE}
  TCmdSrvTermPursue = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermPursue = ^TCmdSrvTermPursue;

  {���ò��� TERMSRV_SETDEVPARAM_V2}
  TCmdTermSrvSetDevParam_V2 = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    ParamId: Word;
    //����ֵ ���Ȳ���
  end;
  PCmdTermSrvSetDevParam_V2 = ^TCmdTermSrvSetDevParam_V2;
  {���ػظ���SRVTERM_SETDEVPARAM_V2}
  TCmdSrvTermSetDevParam_V2 = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: integer;
  end;
  PCmdSrvTermSetDevParam_V2 = ^TCmdSrvTermSetDevParam_V2;
  TCmdSrvTermSetStationParam_V2 = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: byte;
  end;
  PCmdSrvTermSetStationParam_V2 = ^TCmdSrvTermSetStationParam_V2;
  {��ѯ���� TERMSRV_READDEVPARAM_V2}
  TCmdTermSrvReadDevParam_V2 = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    ParamId: Word; //����ID
  end;
  PCmdTermSrvReadDevParam_V2 = ^TCmdTermSrvReadDevParam_V2;
  {���ػظ���SRVTERM_READDEVPARAM_V2}
  TCmdSrvTermReadDevParam_V2 = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    ReadRet: Byte; //   ��ѯ���0���ɹ�  1��ʧ��
    ParamId: Word; //   ����ID
    ParamLen: Byte; //   ��������
    //����ֵ�������Ȳ���
  end;
  PCmdSrvTermReadDevParam_V2 = ^TCmdSrvTermReadDevParam_V2;
  TCmdSrvTermReadDevParam_Bus = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    ReadRet: Byte; //   ��ѯ���0���ɹ�  1��ʧ��
    ParamId: Word; //   ����ID
    ParamLen: Word; //   ��������
    //����ֵ�������Ȳ���
  end;
  PCmdSrvTermReadDevParam_Bus = ^TCmdSrvTermReadDevParam_Bus;
  {������� TERMSRV_REMOVEALARM}
  TCmdTermSrvRemoveAlarm = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
  end;
  PCmdTermSrvRemoveAlarm = ^TCmdTermSrvRemoveAlarm;
  {���ػظ���SRVTERM_REMOVEALARM}
  TCmdSrvTermRemoveAlarm = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermRemoveAlarm = ^TCmdSrvTermRemoveAlarm;

  {�޸ĳ�����ʾ�� �����湫˾���� TERMSRV_MODIFYDEVDISPLAYNAME}
  TCmdTermSrvModifyDevDisplayName = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    //���Ʋ�����
  end;
  PCmdTermSrvModifyDevDisplayName = ^TCmdTermSrvModifyDevDisplayName;
  {���ػظ� SRVTERM_MODIFYDEVDISPLAYNAME}
  TCmdSrvTermModifyDevDisplayName = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermModifyDevDisplayName = ^TCmdSrvTermModifyDevDisplayName;

  {�޸ĳ�����ʾ�� �̶��˵� TERMSRV_MODIFYDEVDISPLAYFIXEDMENU}
  TCmdTermSrvModifyDevDisplayFixedMenu = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    //�˵�ID���˵����� --������
  end;
  PCmdTermSrvModifyDevDisplayFixedMenu = ^TCmdTermSrvModifyDevDisplayFixedMenu;
  {���ػظ�}
  TCmdSrvTermModifyDevDisplayFixedMenu = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermModifyDevDisplayFixedMenu = ^TCmdSrvTermModifyDevDisplayFixedMenu;

  {�����ı�������Ϣ TERMSRV_SENDCONTROLINFO}
  TCmdTermSrvSendControlInfo = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    MsgID: Word; //������ϢID�������ݿ���ȡֵ
    //������Ϣ ������ ��<200Byte
  end;
  PCmdTermSrvSendControlInfo = ^TCmdTermSrvSendControlInfo;
  {���ػظ�}
  TCmdSrvTermSendControlInfo = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    MsgID: Word; //������ϢID�������ݿ���ȡֵ
    Ret: Byte;
  end;
  PCmdSrvTermSendControlInfo = ^TCmdSrvTermSendControlInfo;

  {���ʹ�����������ı�������Ϣ TERMSRV_SENDCONTROLCMDTXT}
  TCmdTermSrvSendControlCmdTxt = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: integer;
    CmdId: integer;
    //MsgID: Word; //������ϢID�������ݿ���ȡֵ
    ControlCmd:Byte;//���ȿ����1
    //������Ϣ ������ ��<200Byte
  end;
  PCmdTermSrvSendControlCmdTxt = ^TCmdTermSrvSendControlCmdTxt;
  {���ػظ�}
  TCmdSrvTermSendControlCmdTxt = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    //MsgID: Word; //������ϢID�������ݿ���ȡֵ
    Ret: Byte;
  end;
  PCmdSrvTermSendControlCmdTxt = ^TCmdSrvTermSendControlCmdTxt;


  {�·��ı���Ϣ TERMSRV_SENDCONTROLINFO_V3}
  TCmdTermSrvSendControlInfo_V3 = packed record
    Header:THead_V3;
    ID: Integer;  // �ı�ID
    ControlCmd:Byte; // ��־
    //������Ϣ ������ ��<=499Byte
  end;
  PCmdTermSrvSendControlInfo_V3 = ^TCmdTermSrvSendControlInfo_V3;

  {���ػظ�}
  TCmdSrvTermSendControlInfo_NeedDevAnswer = packed record
    Size: Word;
    Flag: Byte;
    CmdId: Word;
    DevId: integer;
    MsgID: Word; //������ϢID�������ݿ���ȡֵ
    Ret: Byte;
  end;
  PCmdSrvTermSendControlInfo_NeedDevAnswer = ^TCmdSrvTermSendControlInfo_NeedDevAnswer;

  {���õ绰�� TERMSRV_SETTELLIST}
  TCmdTermSrvSetTelList = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    //�绰�б� ������
  end;
  PCmdTermSrvSetTelList = ^TCmdTermSrvSetTelList;

  TCmdTermSrvSetEventList = packed record
    Size: Word;
    Flag: Byte;
    ExtendedFlag: Byte;
    //FactID: Byte;--sjp  zdclû��factId
    DevId: integer;
    CmdId: word;
    // �¼��б�����
  end;
  PCmdTermSrvSetEventList =^TCmdTermSrvSetEventList;

  {���ػظ���SRVTERM_SETTELLIST}
  TCmdSrvTermSetTelList = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermSetTelList = ^TCmdSrvTermSetTelList;
  {���ػظ�վ�Ƶ��ȷ����Ӧ��}
  TCmdSrvTermAnswer2Client = packed record
    Size:word;
    Flag:byte;
    CmdId:integer;
    BrankId:integer;
    Ret:byte;
  end;
  PCmdSrvTermAnswer2Client = ^TCmdSrvTermAnswer2Client;
  {���������̼����� TERMSRV_UPDATEDEVFIRMWARE}
  TCmdTermSrvUpdateDevFirmware = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    UpdateType: Byte; //�����豸���ͣ���0����ʾ��������1����ʾ����������
    //URL��ַ ��������200Byte
  end;
  PCmdTermSrvUpdateDevFirmware = ^TCmdTermSrvUpdateDevFirmware;
  {���ػظ�}
  TCmdSrvTermUpdateDevFirmware = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermUpdateDevFirmware = ^TCmdSrvTermUpdateDevFirmware;


  {�޸ĳ�����ʾ�� ȡ�������õĲ˵� TEMRSRV_MODIFYDEVDISPLAY_CANCELORDERMENU = $1E;}
  TCmdTermSrvModifyDevDisplay_CancelOrderMenu = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    { ��1��˵�ID��      1
      ��1��˵��ĳ���    1
      ��1��˵�������    <40   ASCII��
      ...��n���������10����}
  end;
  PCmdTermSrvModifyDevDisplay_CancelOrderMenu = ^TCmdTermSrvModifyDevDisplay_CancelOrderMenu;
  {���ػظ�SRVTERM_MODIFYDEVDISPLAY_CANCELORDERMENU = $C0;}
  TCmdSrvTermModifyDevDisplay_CancelOrderMenu = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermModifyDevDisplay_CancelOrderMenu = ^TCmdSrvTermModifyDevDisplay_CancelOrderMenu;

  {�·�һ������������ TERMSRV_DOWNAORDER= $1F;}
  TCmdTermSrvDownAOrder = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    //DevID: Integer;   //��
    OrderType: Byte; //��������
    OrderID: integer; //����ID ����ͻ���<->���ز��õ���Integer; ����<->��������Word
    OrderDateTime: TDateTime; //�������ڡ�ʱ�� --����Ҫ������ʱ���10����
    //�·������ٸ����� 1   ��a
    //�·�����ID�б�     a*4   a������ID��integer��
    //�������ݳ���     1��
    //��������         <200  ASCII��
    //�˿͵绰����     1
    //�˿͵绰��             ASCII��
    //������ϸ���ݳ��� 1
    //������ϸ����     <200  ASCII��
  end;
  PCmdTermSrvDownAOrder = ^TCmdTermSrvDownAOrder;
  TCmdTermSrvDownAOrder_V2 = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    //DevID: Integer;   //��
    OrderType: Byte; //��������
    OrderID: integer; //����ID ����ͻ���<->���ز��õ���Integer; ����<->��������Word
    OrderDateTime: Tdatetime_V2; //�������ڡ�ʱ�� --����Ҫ������ʱ���10����
    //�·������ٸ����� 1   ��a
    //�·�����ID�б�     a*4   a������ID��integer��
    //�������ݳ���     1��
    //��������         <200  ASCII��
    //�˿͵绰����     1
    //�˿͵绰��             ASCII��
    //������ϸ���ݳ��� 1
    //������ϸ����     <200  ASCII��
  end;
  PCmdTermSrvDownAOrder_V2 = ^TCmdTermSrvDownAOrder_V2;
  {���ػظ� SRVTERM_DOWNAORDER = $C1;}
  TCmdSrvTermDownAOrder = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    //DevID: Integer;   //��
    OrderID: integer; //����ID
    Ret: Byte;
  end;
  PCmdSrvTermDownAOrder = ^TCmdSrvTermDownAOrder;

  {�·�����ȡ�� TERMSRV_DOWNCANCELORDER  = $20;}
  TCmdTermSrvCancelOrder = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    //DevID: Integer;   //��
    OrderID: integer; //����ID
  end;
  PCmdTermSrvCancelOrder = ^TCmdTermSrvCancelOrder;
  {���ػظ�SRVTERM_DOWNCANCELORDER = $C2;}
  TCmdSrvTermCancelOrder = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    //DevID: Integer;   //��
    OrderID: integer; //����ID
    Ret: Byte;
  end;
  PCmdSrvTermCancelOrder = ^TCmdSrvTermCancelOrder;

  {��ضˡ��������أ��Գ�������/�ϵ�/����/���硡TERMSRV_CUTORFEED_OIL_ELECTRICITY = $21;}
  TCmdTermSrvCutOrFeedOilOrElectricity = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Content: Byte; //����������ݣ�����/�ϵ�/����/����,�ó�����ʾ��
  end;
  PCmdTermSrvCutOrFeedOilOrElectricity = ^TCmdTermSrvCutOrFeedOilOrElectricity;
  {���ػظ��� SRVTERM_CUTORFEED_OIL_ELECTRICITY     = $C4;}
  TCmdSrvTermCutOrFeedOilOrElectricity = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermCutOrFeedOilOrElectricity = ^TCmdSrvTermCutOrFeedOilOrElectricity;

  {��ض˸�����������0200}
  {���ػظ���}
  TCmdSrvTermHeartBeat = packed record
    Size: Word; //=3
    Flag: Byte; // SRVTERM_HEARTBEAT =$F0;
  end;
  PCmdSrvTermHeartBeat = ^TCmdSrvTermHeartBeat;

  {��ض� -> ���� �������������� TERMSRV_READTESTDATA  = $22}
  TCmdTermSrvReadTestData = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
  end;
  PCmdTermSrvReadTestData = ^TCmdTermSrvReadTestData;
  {���ػظ� �����ϴ����� �������� SRVTERM_READTESTDATA = $C5}
  TCmdSrvTermReadTestData = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
    TestData: array[0..19] of Byte;
  end;
  PCmdSrvTermReadTestData = ^TCmdSrvTermReadTestData;

  {��ض� -> ���� �������汾 TERMSRV_READDEVVER = $23}
  TCmdTermSrvReadDevVer = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
  end;
  PCmdTermSrvReadDevVer = ^TCmdTermSrvReadDevVer;
  { ���ػظ��������ϴ��������汾��SRVTERM_READDEVVER = $C6}
  TCmdSrvTermReadDevVer = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
    //DevVer ���������Ϊ32�ֽ�
  end;
  PCmdSrvTermReadDevVer = ^TCmdSrvTermReadDevVer;

  { ���ػظ��������ϴ������汾(������)��SRVTERM_READDEVVER = $59  20090205}
  {TCmdSrvTermReadDevVer_Extend= packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;  //���������ϴ�ʱ��=0
    DevId: integer;
    DevVer: String[20]; //�����汾�� ASCII�룬����20Byte
    //IsNeedAnswer:byte;//�Ƿ���ҪӦ��. �Կͻ�������
    DevState:Word;
    LcdVer:String[20]; //������ �汾�� ASCII�룬����20Byte
    LedVer:String[20]; //����� �汾�� ASCII�룬����20Byte
    JjqVer:String[20];
    PosVer:String[20]; //POS�� �汾�� ASCII�룬����20Byte
  end;}

  TCmdSrvTermReadDevVer_Extend= packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;  //���������ϴ�ʱ��=0
    DevId: integer;
    DevVer: array[0..19]of byte; //�����汾�� ASCII�룬����20Byte
    //IsNeedAnswer:byte;//�Ƿ���ҪӦ��. �Կͻ�������
    DevState:Word;
    LcdVer:array[0..19]of byte; //������ �汾�� ASCII�룬����20Byte
    LedVer:array[0..19]of byte; //����� �汾�� ASCII�룬����20Byte
    JjqVer:array[0..19]of byte;
    PosVer:array[0..19]of byte; //POS�� �汾�� ASCII�룬����20Byte
  end;
  PCmdSrvTermReadDevVer_Extend = ^TCmdSrvTermReadDevVer_Extend;

  //��ض� -> ���� ����˾����ϢTERMSRV_SETDRIVERS   = $24;
  TCmdTermSrvSetDrivers = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    DriverNo1: array[0..9] of char; //����.���㲿�ݲ�0
    DriverName1: array[0..19] of char;
    DriverNo2: array[0..9] of char;
    DriverName2: array[0..19] of char;
    DriverNo3: array[0..9] of char;
    DriverName3: array[0..19] of char;
    DriverNo4: array[0..9] of char;
    DriverName4: array[0..19] of char;
  end;
  PCmdTermSrvSetDrivers = ^TCmdTermSrvSetDrivers;
  //���ػظ�      SRVTERM_SETDRIVERS  = $C7;
  TCmdSrvTermSetDrivers = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermSetDrivers = ^TCmdSrvTermSetDrivers;

  //��ض� -> ����  ��ȡ˾����ϢTERMSRV_READDRIVERS  = $25;
  TCmdTermSrvReadDrivers = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
  end;
  PCmdTermSrvReadDrivers = ^TCmdTermSrvReadDrivers;
  //���ػظ�     SRVTERM_READDRIVERS    = $C8;
  TCmdSrvTermReadDrivers = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    DriverNo1: array[0..9] of char; //����.���㲿�ݲ�0
    DriverName1: array[0..19] of char;
    DriverNo2: array[0..9] of char;
    DriverName2: array[0..19] of char;
    DriverNo3: array[0..9] of char;
    DriverName3: array[0..19] of char;
    DriverNo4: array[0..9] of char;
    DriverName4: array[0..19] of char;
    Ret: Byte;
  end;
  PCmdSrvTermReadDrivers = ^TCmdSrvTermReadDrivers;

  // ��ض� -> ����  ��ȡ��ǰ˾�� TERMSRV_READCURRENTDRIVERS    = $26;
  TCmdTermSrvReadCurrentDriver = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
  end;
  PCmdTermSrvReadCurrentDriver = ^TCmdTermSrvReadCurrentDriver;
  //����->�ͻ��ˡ��ϴ���ǰ˾��SRVTERM_UPLOADCURRENTDRIVER  = $C9;  --�п����ǳ��������ϴ�,Ҳ���������������Ӧ��
  TCmdSrvTermUploadCurrentDriver = packed record
    Size: Word;
    Flag: Byte;
    //CmdId: integer; //�ͻ��˸���CmdID �����ǳ����Զ������Ӧ��(=�������CmdId),���ǳ��������ϴ�(=-1)
    DevId: integer;
    DriverNo: array[0..9] of char;
    LoginTime: array[0..5] of byte;  //TDateTime
    //Ret: Byte;
  end;
  PCmdSrvTermUploadCurrentDriver = ^TCmdSrvTermUploadCurrentDriver;

  //����->�ͻ��ˡ��ϴ�˾���°��˳� SRVTERM_UPLOADDRIVERLOGOUT            = $CA;
  TCmdSrvTermUploadDriverLogOut = packed record
    Size: Word;
    Flag: Byte;
    DevId: integer;
    DriverNo: array[0..9] of char;
    LogOutTime: array[0..5] of byte;  //TDateTime;
  end;
  PCmdSrvTermUploadDriverLogOut = ^TCmdSrvTermUploadDriverLogOut;
  //����-���ͻ���  �ϴ�������վ���վ SRVTERM_INORDOWNSTATION = $D5
  TCmdSrvTermInOrDownStation = packed record
    Size: Word;
    Flag: Byte;
    DevId: Integer;
    StationNo: byte;
    Direct: Byte;
    InOrDown: Byte;
  end;
  PCmdSrvTermInOrDownStation = ^TCmdSrvTermInOrDownStation;
  //����->�ͻ���  �ϴ�����վ�Ƶ��߻�����
  TCmdSrvTermStationOnOrOff = packed record
    Size:word;
    Flag:Byte;
    StationBrankId:integer;
    ret:byte;
  end;
  PCmdSrvTermStationOnOrOff = ^TCmdSrvTermStationOnOrOff;
  //����->�ͻ���  �ϴ������ӷ�����ע��  SRVTERM_DEVLOGOUTFROMSRV = $B8;
  TCmdSrvTermDevLogOutFromSrv = packed record
    Size: Word;
    Flag: byte;
    DevId: integer;
    Latitude: integer; //γ�� X 100 0000 ��: ֵ32123456��ʾ��32.123456��
    Longitude: integer; //���� X 100 0000
    Speed: Byte; //�ٶȡ���λ������/Сʱ����ʾ��Χ0��255
    Orientation: Byte; //������������Ϊ0�ȣ�˳ʱ�����ӣ���λ��2�ȣ���ֵ��Χ0��180��
    State: Longword; //32λ״̬λ
    GpsTime: array[0..5] of Byte;
  end;
  PCmdSrvTermDevLogOutFromSrv = ^TCmdSrvTermDevLogOutFromSrv;
  //����-���ͻ���  �ϴ��������ټ�¼  SRVTERM_OVERSPEEDINFO = $D7
  TCmdSrvTermOverSpeedInfo = packed record
    Size: Word;
    Flag: Byte;
    DevId: Integer;
    AreaNo: integer;
    overSpeedTime: array[0..5] of byte;
    IsBengin: byte;
  end;
  PCmdSrvTermOverSpeedInfo = ^TCmdSrvTermOverSpeedInfo;
  //����-���ͻ���  ͣ����¼
  TCmdSrvTermStopInfo = packed record
    Size: Word;
    Flag: Byte;
    DevId: Integer;
    Num: integer;
    //ͣ����¼
  end;
  PCmdSrvTermStopInfo = ^TCmdSrvTermStopInfo;
  //����-���ͻ���  �Ƽ�������  SRVTERM_TAXIRUNDATA = $D9
  TCmdSrvTermTaxiRunData = packed record
    Size: Word;
    Flag: Byte;
    DevId: integer;
    //�Ƽ�������
  end;
  PCmdSrvTermTaxiRunData = ^TCmdSrvTermTaxiRunData;
  //����ת������ͨ�Ƽ���Ӫ������
  //����-���ͻ���  ˾����½  SRVTERM_DRIVERON = $DA
  TCmdSrvTermDriverOn = packed record
    Size: Word;
    Flag: Byte;
    DevId: integer;
    DriverNo: array[0..9] of Byte;
    LoginTime: array[0..5] of Byte;
  end;
  PCmdSrvTermDriverOn = ^TCmdSrvTermDriverOn;
  //���� -���ͻ���  ˾���˳� SRVTERM_DRIVEROFF = $DB
  TCmdSrvTermDriverOff = packed record
    Size: Word;
    Flag: byte;
    DevId: integer;
    DriverNo: array[0..9] of Byte;
    LogOutTime: array[0..5] of Byte;
  end;
  PCmdSrvTermDriverOff = ^TCmdSrvTermDriverOff;
   //�ͻ���->���� ���գ��ĵ�ǰ��Ƭ TERMSRV_GETAPIC= $27;
  TCmdTermSrvGetAPic = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    GetPicSize: Byte; //��Ƭ�ߴ��С 0=320x240  1=640x480  2-else
    CameraIndex: Byte; //����ͷ��
  end;
  PCmdTermSrvGetAPic = ^TCmdTermSrvGetAPic;
  //���ػظ�  SRVTERM_GETAPIC= $CB;
  TCmdSrvTermGetAPic = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermGetAPic = ^TCmdSrvTermGetAPic;

  //20070518 ����
  //�ͻ���->���أ���ȡ��ǰ���� TERMSRV_READFLUX = $28;
  TCmdTermSrvReadFlux = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
  end;
  PCmdTermSrvReadFlux = ^TCmdTermSrvReadFlux;
  //����->�ͻ��ˡ��յ����� �ϴ�����SRVTERM_UPLOADFLUX = $CC;
  TCmdSrvTermUploadFlux = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer; //���ش���ʱ������ǳ��������ϴ���CmdIdΪ0������ǶԿͻ��˵�Ӧ�����ǿͻ��˷�����CmdId
    DevId: integer;
    Ret: Byte; //���ش���ʱ������ǳ��������ϴ���RetֵΪ0��
    Link1Up: Integer; //����1����������
    Link1Down: Integer; //����1����������
    Link2Up: Integer; //����2����������
    Link2Down: Integer; //����2����������
    Link3Up: Integer; //����3����������
    Link3Down: Integer; //����3����������
    Link4Up: Integer; //����4����������
    Link4Down: Integer; //����4����������
    Link5Up: Integer; //����5����������
    Link5Down: Integer; //����5����������
    Link6Up: Integer; //����6����������
    Link6Down: Integer; //����6����������
  end;
  PCmdSrvTermUploadFlux = ^TCmdSrvTermUploadFlux;
  //2008-05-09 �����·����-�°汾
  //������ʾ��ʱ�� TERMSRV_SETLEDTIME_NEW = $36
  TCmdTermSrvSetLedTime_New = packed record
    Size: Word;
    Flag: byte;
    CmdId: integer;
    devId: integer;
    second: byte;
    minute: byte;
    hour: byte;
    week: byte;
    day: byte;
    month: byte;
    year: byte;
    DisLen:word;
    disIntval:word;
  end;
  PCmdTermSrvSetLedTime_New = ^TCmdTermSrvSetLedTime_New;

 // LED������ָ��(����ID��4AH)
  TCmdTermSrvSetLedseat_New = packed record
    Size: Word;
    Flag: byte;
    CmdId: integer;
    devId: integer;
    frontLed: byte;
    backled: byte;
  end;
  pCmdTermSrvSetLedseat_New = ^TCmdTermSrvSetLedseat_New;


 //������ʾLED����ָ���Ĺ��(����ID��49H)
  TCmdTermSrvSetLedShow = packed record
    Size: Word;
    Flag: byte;
    CmdId: integer;
    devId: integer;
    ledID: integer;
  end;
  pCmdTermSrvSetLedShow = ^TCmdTermSrvSetLedShow;

  TCmdSrvTermSetLedShow = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermSetLedShow = ^TCmdSrvTermSetLedShow;

  TCmdSrvTermSetLedTime_New = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermSetLedTime_New = ^TCmdSrvTermSetLedTime_New;
  //TERMSRV_DELETELED_NEW = $35;//�ͻ���->���أ�ɾ�����еĹ��
  TCmdTermSrvDeleteAllLed_New = packed record
    Size: word;
    Flag: byte;
    cmdId: integer;
    devId: integer;
  end;
  PCmdTermSrvDeleteAllLed_New = ^TCmdTermSrvDeleteAllLed_New;
  TCmdSrvTermDeleteAllLed_New = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermDeleteAllLed_New = ^TCmdSrvTermDeleteAllLed_New;

   //TERMSRV_DELETELEDBYID_NEW = $34;//�ͻ���->���أ�ɾ��ָ��ID���
  TCmdTermSrvDeleteLedById_New = packed record
    Size: word;
    Flag: byte;
    cmdId: integer;
    devId: integer;
    ledID: integer;
  end;
  PCmdTermSrvDeleteLedById_New = ^TCmdTermSrvDeleteLedById_New;
  TCmdSrvTermDeleteLedById_New = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermDeleteLedById_New = ^TCmdSrvTermDeleteLedById_New;
  //TERMSRV_DISCURRLED_NEW = $33;//�ͻ���->���أ���ʾ��ǰ�Ĺ��
  TCmdTermSrvDisCurrLed_New = packed record
    Size: word;
    Flag: byte;
    cmdId: integer;
    devId: integer;
    ledNo: byte; //ģ��ID
    ledID: integer;
    DataType: byte;
    DisSpeed: byte;
    InType: byte;
    ExitType: byte;
    X: array[0..1] of byte;
    Y: array[0..1] of byte;
    StopTime: word;
    Font: byte;
    IsDisTime: byte;
    Extend: array[0..3] of byte;
    //������ݣ�������
  end;
  PCmdTermSrvDisCurrLed_New = ^TCmdTermSrvDisCurrLed_New;
  TCmdSrvTermDisCurrLed_New = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermDisCurrLed_New = ^TCmdSrvTermDisCurrLed_New;
  //TERMSRV_DOWNLED_NEW = $32;     //�ͻ���->���أ��·������Ϣ
  TcmdTermSrvDownLed_New = packed record
    Size: word;
    Flag: byte;
    cmdId: integer;
    devId: integer;
    ledNo: byte;
    ledID: integer;
    DataType: byte;
    DisSpeed: byte;
    InType: byte;
    ExitType: byte;
    X: array[0..1] of byte;
    Y: array[0..1] of byte;
    StopTime: word;
    Font: byte;
    IsDisTime: byte;
    Extend: array[0..3] of byte;
    //������ݣ�������
  end;
  PcmdTermSrvDownLed_New = ^TcmdTermSrvDownLed_New;
  TCmdSrvTermDownLed_New = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermDownLed_New = ^TCmdSrvTermDownLed_New;
 //CLIENT_SETELCFENCE =$4B   //���ó����ĵ���Χ��
  TCmdTermSrvSETELCFENCE_New = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: TDEV_ID_BCD_ZDCL;
    AreaID: word;
    kindAlarm: byte;
    overAlarm: byte;
    lyAlarm: byte;
    kindArea: byte;
    len: word
  end;
  PCmdTermSrvSETELCFENCE_New = ^TCmdTermSrvSETELCFENCE_New;

  TCmdSrvTermSETELCFENCE = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: TDEV_ID_BCD_ZDCL;
    Ret: Byte;
  end;
  pCmdSrvTermSETELCFENCE = ^TCmdSrvTermSETELCFENCE;
  //CCLIENT_READSAVEELCFENCE=$4C  //��ȡ�����ڴ洢�ĵ���Χ��
  TCmdTermSrvREADSAVEELCFENCE_New = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: TDEV_ID_BCD_ZDCL;
    Ret: Byte;
  end;
  pCmdTermSrvREADSAVEELCFENCE_New = ^TCmdTermSrvREADSAVEELCFENCE_New;

   //SEV_READSAVEELCFENCE=$4C  //��ȡ�����ڴ洢�ĵ���Χ��   �ظ�
  TCmdSrvTermREADSAVEELCFENCE_New = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: TDEV_ID_BCD_ZDCL;
    Ret: Byte;
  end;
  pCmdSrvTermREADSAVEELCFENCE_New = ^TCmdTermSrvREADSAVEELCFENCE_New;

 //TCLIENT_CANCELDESIGNFENCE=$4D  //ȡ��ָ���ĵ���Χ����Ϣ������ID��4d��
  TCmdTermSrvCANCELDESIGNFENCE_New = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: TDEV_ID_BCD_ZDCL;
  end;
  PCmdTermSrvCANCELDESIGNFENCE_New = ^TCmdTermSrvCANCELDESIGNFENCE_New;
  //SEV_CANCELDESIGNFENCE=$4D
  TCmdSrvTermCANCELDESIGNFENCE_New = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: TDEV_ID_BCD_ZDCL;
    Ret: Byte;
  end;
  PCmdSrvTermCANCELDESIGNFENCE_New = ^TCmdSrvTermCANCELDESIGNFENCE_New;

  //�ϴ����򱨾���¼ CLIENT_UPLOADAREAWARN = (byte) 0x4E;
  TCmdSrvTermAreaAlarm_New=Packed record
    Size: Word;
    Flag: Byte;
    DevId: integer;
    Latitude: integer; //γ�� X 100 0000 ��: ֵ32123456��ʾ��32.123456��
    Longitude: integer; //���� X 100 0000
    Speed: Byte; //�ٶȡ���λ������/Сʱ����ʾ��Χ0��255
    Orientation: Byte; //������������Ϊ0�ȣ�˳ʱ�����ӣ���λ��2�ȣ���ֵ��Χ0��180��
    State: Longword; //32λ״̬λ
    GpsTime: array[0..5] of Byte; // GPSʱ��
    AreamType:byte;       //���
    areaID:word;          //Χ��ID
  end;
   PCmdSrvTermAreaAlarm_New = ^TCmdSrvTermAreaAlarm_New;

  //��ȡ����Ϣ   TERMSRV_READLEDINFO_NEW = $37
  TCmdTermSrvReadLed_New = packed record
    Size: word;
    Flag: byte;
    CmdId: integer;
    DevId: integer;
  end;
  PCmdTermSrvReadLed_New = ^TCmdTermSrvReadLed_New;
  TCmdSrvTermReadLed_New = packed record
    Size: word;
    Flag: byte;
    CmdId: integer;
    DevId: integer;
    LedNums: byte;
    RowNums: word;
    ColNums: word;
    Ret: byte;
  end;
  PCmdSrvTermReadLed_New = ^TCmdSrvTermReadLed_New;
  //��ȡ���й��
  TCmdTermSrvReadAllAd_New = packed record
    Size: word;
    Flag: byte;
    CmdId: integer;
    DevId: integer;
  end;
  PCmdTermSrvReadAllAd_New = ^TCmdTermSrvReadAllAd_New;
  TCmdSrvTermReadAllAd_New = packed record
    Size: word;
    Flag: byte;
    CmdId: integer;
    DevId: integer;
    //���ID
    Ret: byte;
  end;
  PCmdSrvTermReadAllAd_New = ^TCmdSrvTermReadAllAd_New;
  //��ʾ�洢�Ĺ����Ϣ
  TCmdTermSrvDisSaveAd_New = packed record
    Size: word;
    Flag: byte;
    CmdId: integer;
    DevId: integer;
    LedNo: byte;
    LedId: integer;
  end;
  PCmdTermSrvDisSaveAd_New = ^TCmdTermSrvDisSaveAd_New;
  TCmdSrvTermDisSaveAd_New = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermDisSaveAd_New = ^TCmdSrvTermDisSaveAd_New;
  //==========================20080515���������ϴ���ʻ�����Ϣ
  // SRVTERM_UPLOADHOURDIS = $3A;
  TCmdSrvTermUploadHourDis = packed record
    Size: word;
    Flag: Byte;
    DevId: integer;
    uploadTime: array[0..3] of byte;
    uploadDis: integer;
  end;
  PCmdSrvTermUploadHourDis = ^TCmdSrvTermUploadHourDis;
  //TERMSRV_READHOURDIS = $3B;
  TCmdTermSrvReadHourDis = packed record
    Size: word;
    Flag: byte;
    CmdId: integer;
    DevId: integer;
    beginTime: array[0..4] of byte;
    endTime: array[0..4] of byte;
  end;
  PCmdTermSrvReadHourDis = ^TCmdTermSrvReadHourDis;
  TCmdSrvTermReadHOurDis = packed record
    Size: word;
    Flag: byte;
    CmdId: integer;
    DevId: integer;
    Ret: byte;
    //��ʻ�����Ϣ 12	���1��Ӧ��ʱ��	4	ѹ��BCD��  YY MM DD HH
      //��ʱ���ڵ���ʻ���1	4�ֽ�	��λ����

  end;
  PCmdSrvTermReadHOurDis = ^TCmdSrvTermReadHOurDis;
  //====================================================================================
  //2007-8-23 ���ӹ���������
  //�ͻ���->���أ��·�һ�������Ϣ TERMSRV_DOWNANAD = $29;
  TCmdTermSrvDownAnAd = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    AdId: integer;
    AdLen: Byte;
    //AdContent  <200Byte;
  end;
  PCmdTermSrvDownAnAd = ^TCmdTermSrvDownAnAd;
  {���ػظ� SRVTERM_DOWNANAD = $CD;}
  TCmdSrvTermDownAnAd = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermDownAnAd = ^TCmdSrvTermDownAnAd;

  //�ͻ���->���أ�ɾ��һ�������ϢTERMSRV_DELANAD  = $2A;
  TCmdTermSrvDelAnAd = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    AdId: Integer;
  end;
  PCmdTermSrvDelAnAd = ^TCmdTermSrvDelAnAd;
  //���ػظ�    SRVTERM_DELANAD  = $CE;
  TCmdSrvTermDelAnAd = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: byte;
  end;
  PCmdSrvTermDelAnAd = ^TCmdSrvTermDelAnAd;

  //�ͻ���->���أ�ɾ�����й����Ϣ TERMSRV_DELALLAD = $2B;
  TCmdTermSrvDelAllAd = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
  end;
  PCmdTermSrvDelAllAd = ^TCmdTermSrvDelAllAd;
  //���ػظ�    SRVTERM_DELALLAD = $CF;
  TCmdSrvTermDelAllAd = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermDelAllAd = ^TCmdSrvTermDelAllAd;
  //�ͻ���-������  ��ȡ��ǰ����������վ����Ϣ     TERMSRV_DOWNLED_NEW
  TCmdSrvReadDevStation = packed record
    Size:word;
    Flag:byte;
    DevId:integer;
  end;
  PCmdSrvReadDevStation = ^TCmdSrvReadDevStation;
  //���ػظ�������վ��Ϣ
  //�ͻ���->���أ���ȡ���������й���ID    TERMSRV_READALLADID = $2C;
  TCmdTermSrvReadAllAdId = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
  end;
  PCmdTermSrvReadAllAdId = ^TCmdTermSrvReadAllAdId;
  //���ػظ�  SRVTERM_READALLADID = $D0;
  TCmdSrvTermReadAllAdId = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
    //AdId1 : Integer;
    //....AdIdn:Integer;
  end;
  PCmdSrvTermReadAllAdId = ^TCmdSrvTermReadAllAdId;

  //�ͻ���->���أ��·�����������ʾ����  TERMSRV_DOWNALLWAY  = $2D;
  TCmdTermSrvDownAllWay = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    //WayId1:Integer;
    //WayLen1 : Byte;
    //WayContent : <50
    //...
  end;
  PCmdTermSrvDownAllWay = ^TCmdTermSrvDownAllWay;
  //���ػظ�  SRVTERM_DOWNALLWAY  = $D1;
  TCmdSrvTermDownAllWay = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermDownAllWay = ^TCmdSrvTermDownAllWay;

  // �ͻ���->���أ����ó����������Ⲧ��ļ������� 2007-9-24  TERMSRV_DOWNLISTENCALLNUM = $2E;
  TCmdTermSrvDownListenCallNum = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    //ListenCallNum :<20 ASCII��
  end;
  PCmdTermSrvDownListenCallNum = ^TCmdTermSrvDownListenCallNum;
  //���ػظ�  SRVTERM_DOWNLISTENCALLNUM = $D2;
  TCmdSrvTermDownListenCallNum = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermDownListenCallNum = ^TCmdSrvTermDownListenCallNum;

  //�ͻ���->���أ��ͻ��˷���ͨ�õ�������ز�������� 2007-10-08  TERMSRV_DOWNGENERICCOMMAND = $2F
  TCmdTermSrvDownGenicCommand = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    //��������
  end;
  PCmdTermSrvDownGenicCommand = ^TCmdTermSrvDownGenicCommand;
  //���ػظ�   SRVTERM_DOWNGENERICCOMMAND = $D3
  TCmdSrvTermDownGeniccommand = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermDownGeniccommand = ^TCmdSrvTermDownGeniccommand;
  //�ͻ���-�����أ����������һ��վ����Ϣ TERMSRV_CLEARBUSSTATIONINFO=$31;
  TCmdTermSrvClearABusStationInfo = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
  end;
  PCmdTermSrvClearABusStationInfo = ^TCmdTermSrvClearABusStationInfo;
  //���ػظ� SRVTERM_CLEARBUSSTATIONINFO = $D5;
  TCmdSrvTermClearABusStationInfo = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermClearABusStationInfo = ^TCmdSrvTermClearABusStationInfo;
  //�ͻ���->���أ�����һ��վ����Ϣ 2007-10-17  TERMSRV_DOWNABUSSTATIONINFO = $30;
  TCmdTermSrvDownABusStationInfo = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    BusStationId: Byte;
    PLATTYPE: byte; //վ������
    PLATDirect: word; //վ�㷽��
    INDistance: word; //��վ��վ����
    OUTDistance: Word; //��վ��վ����
    INGPSLanti: integer; //��վγ��
    INGPSLongi: integer; //��վ����
    OUTGPSLanti: integer; //��վγ��
    OUTGPSLongi: integer; //��վ����
    //վ������
  end;
  PCmdTermSrvDownABusStationInfo = ^TCmdTermSrvDownABusStationInfo;
  //���ػظ� SRVTERM_DOWNABUSSTATIONINFO = $D4;
  TCmdSrvTermDownABusStationInfo = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    RetBusStationId: Byte; //վ����
    Ret: Byte;
  end;
  PCmdSrvTermDownABusStationInfo = ^TCmdSrvTermDownABusStationInfo;


  //�����������������ͻ��ˣ������أ��������������������������������
  //��������ʱ������,�೤ʱ�䲻��,�����ͽ�������״̬
  TCmdTermSrvHibernateTime = packed record
    Size: Word;
    Flag: Byte; //TERMSRV_DOWNGENERICCOMMAND = $2F
    CmdId: integer;
    DevId: integer;
    NextFlag: Byte; //=1
    Time: Byte; //��λ��Сʱ;
  end;
  PCmdTermSrvHibernateTime = ^TCmdTermSrvHibernateTime;

  //���ó���ʱ��,�������ٶ���ʱ�����Ϊ����.
  TCmdTermSrvOverSpeedTime = packed record
    Size: Word;
    Flag: Byte; //TERMSRV_DOWNGENERICCOMMAND = $2F
    CmdId: integer;
    DevId: integer;
    NextFlag: Byte; //=2
    Time: Byte; //��λ����;
  end;
  PCmdTermSrvOverSpeedTime = ^TCmdTermSrvOverSpeedTime;

  TCmdTermSrvBrakeState = packed record
    Size: Word;
    Flag: Byte; //TERMSRV_DOWNGENERICCOMMAND = $2F
    CmdId: integer;
    DevId: integer;
    NextFlag: Byte; //=3
    State: Byte; //״̬,1:�ߵ�ƽ��Ч,0:�͵�ƽ��Ч;
  end;
  PCmdTermSrvBrakeState = ^TCmdTermSrvBrakeState;

  //20081119 sha �������ͻ�����ӽ�����س���ʾ����  TERMSRV_EMPTYNEXTFLAG = $08;
  TCmdTermSrvEmptyWord = packed record
    Size: Word;
    Flag: Byte;     //�������֣�TERMSRV_DOWNGENERICCOMMAND = $2F
    CmdId: integer;
    DevId: integer;
    NextFlag: byte;   //�������֣���TERMSRV_EMPTYNEXTFLAG   = $08;
    WordType: Byte;   //��ʾ����
    WordEdit: byte;   //���ݱ���
    //��������
  end;
  PCmdTermSrvEmptyWord = ^TCmdTermSrvEmptyWord;
  //������������������������������������������������������������������

  (**sha 20081230 smsclient***************************)
  //���ض�����5�������Ӧ��
  TCmdSrvTermRet_Sms = packed record
    Size :Word;      //����
    MainFlag :byte;  //��������
    MidFlag : byte;  //С������
    CmdId: integer;     //�������
    DevId: Integer;  //����ID
    Ret: Byte;   //�ظ��Ƿ�ִ�гɹ���
  end;
  PCmdSrvTermRet_Sms= ^TCmdSrvTermRet_Sms;

  TCmdTermSrv_SmsHeader=packed record
    Size :Word;      //����
    MainFlag :byte;  //��������
    MidFlag : byte;  //С������
    CmdId: integer;     //�������
    DevId: Integer;  //����ID
  end;
  PCmdTermSrv_SmsHeader = ^TCmdTermSrv_SmsHeader;

  //TERMSRV_SMS_DEVUPGRADEDEVFIRMWARE= $01;
  TCmdTermSrv_SmsUpgradeDevFirmware= packed record
    Size :Word;
    MainFlag :byte;
    MidFlag : byte;
    CmdId: integer;
    DevId: Integer;
    //URL��ַ	<200	�̼������ص�ַ��IP:Port:APN��
  end;
  PCmdTermSrv_SmsUpgradeDevFirmware = ^TCmdTermSrv_SmsUpgradeDevFirmware;

  //TERMSRV_SMS_REMOVEALARM = $02;
  TCmdTermSrv_SmsRemoveAlarm = packed record
    Size :Word;      //����
    MainFlag :byte;  //��������
    MidFlag : byte;  //С������
    CmdId: integer;    //�������
    DevId: Integer;  //����ID
  end;
  PCmdTermSrv_SmsRemoveAlarm = ^TCmdTermSrv_SmsRemoveAlarm;

  //TERMSRV_SMS_DEVRESTART = $03;
  TCmdTermSrv_SmsDevRestart = packed record
    Size :Word;      //����
    MainFlag :byte;  //��������
    MidFlag : byte;  //С������
    CmdId: integer;    //�������
    DevId: Integer;  //����ID
  end;
  PCmdTermSrv_SmsDevRestart= ^TCmdTermSrv_SmsDevRestart;

  //С������ TERMSRV_SMS_CONTROLDEV = $04;
  TCmdTermSrv_SmsControlDev= packed record
    Size :Word;      //����
    MainFlag :byte;  //��������
    MidFlag : byte;  //С������
    CmdId: integer;  //�������
    DevId: Integer;  //����ID
    ControlContent:Byte; //��������	 	1 -����  2-�ϵ� 3-���� 4-����
  end;
  PCmdTermSrv_SmsControlDev = ^TCmdTermSrv_SmsControlDev;

  // TERMSRV_SMS_SETPARAM   = $05;
  TCmdTermSrv_SmsSetParam= packed record
    Size :Word;      //����
    MainFlag :byte;  //��������
    MidFlag : byte;  //С������
    CmdId: integer;    //�������
    DevId: Integer;  //����ID
    ParamId:Word;  //����ID
    //ParamContent :�������ݣ�������
  end;
  PCmdTermSrv_SmsSetParam = ^TCmdTermSrv_SmsSetParam;
   //=====================

  //��ѯ��Ƭʱ�䷶Χָ��   TERMSRV_READPICTIMESINFO = $56;
  TCmdTermSrvReadPicTimesInfo= packed record
    Size:Word;
    Flag:Byte;
    CmdId:Integer;
    DevId:Integer;
  end;
  PCmdTermSrvReadPicTimesInfo = ^TCmdTermSrvReadPicTimesInfo;
  //SRVTERM_RETREADPICTIMESINFO = $56;
  TCmdSrvTermRetReadPicTimesInfo= packed record
    Size:Word;
    Flag:Byte;
    CmdId:Integer;
    DevId:Integer;
    FirstDateTime:array[0..5] of byte;//��һ���ֽڴ����꣨2000��Ϊ0�꣩���ڶ����ֽڴ����£��������ֽڴ����գ�����Ƭʱ�����ֽ�Ϊ0��
    LastDateTime:array[0..5] of byte;
    //������Ƭ���������Բ�������Ƭ��������ǰ����Ƭ��������ǰ����Ƭ��������������Ƭ���� ���غ�����Ƭ����...
  end;
  PCmdSrvTermRetReadPicTimesInfo = ^TCmdSrvTermRetReadPicTimesInfo;

  //��������ȡ�洢����Ƭָ�� TERMSRV_READTHEPIC       = $57;
  TCmdTermSrvReadThePic = packed record
    Size:Word;
    Flag:Byte;
    CmdId:Integer;
    DevId:Integer;
    ReadDateTime:array [0..5]of byte;
    ReadPicCountType:Byte;  //Ҫ���ϴ�����Ƭ����	1 	0��ʱ���֮ǰ��������Ƭ��1��ʱ���֮ǰ��1����Ƭ
    ReadPicType:Byte;     // ��Ƭ����	1	0-���Բ�������Ƭ�� 1-������Ƭ 2-������Ƭ 3-����������Ƭ 4-���ٱ�����Ƭ 5-ƣ�ͱ�����Ƭ 6-�������Ժ���չ��0xff-��ָ����Ƭ����
  end;
  PCmdTermSrvReadThePic = ^TCmdTermSrvReadThePic;
  //SRVTERM_RETREADTHEPIC       = $57;
  TCmdSrvTermRetReadThePic = packed record
    Size:Word;
    Flag:Byte;
    CmdId:Integer;
    DevId:Integer;
    Ret:Byte;//����з�����������Ƭ�����ص�Ӧ����Ϊ�ɹ������򣬷��ص�Ӧ����Ϊʧ�ܡ�
  end;
  PCmdSrvTermRetReadThePic = ^TCmdSrvTermRetReadThePic;

  //��ֹ�ϴ������洢��Ƭ TERMSRV_STOPUPLOADSAVEDPIC  = $5B;
  TCmdTermSrvStopUploadSavedPic= packed record
    Size:Word;
    Flag:Byte;
    CmdId:Integer;
    DevId:Integer;
  end;
  PCmdTermSrvStopUploadSavedPic = ^TCmdTermSrvStopUploadSavedPic;
  {���ػظ�}
  TCmdSrvTermRetStopUploadSavedPic = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermRetStopUploadSavedPic = ^TCmdSrvTermRetStopUploadSavedPic;

  //��ȡ�����绰��TERMSRV_READDEVTELLIST = $5C;
  TCmdTermSrvReadDevTelList= TCmdTermSrvStopUploadSavedPic;//�ṹ��ͬ
  PCmdTermSrvReadDevTelList = ^TCmdTermSrvReadDevTelList;
  //���ػظ� SRVTERM_RETREADDEVTELLIST = $5C;
  TCmdSrvTermRetReadDevTelList =  packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    //
  end;
  PCmdSrvTermRetReadDevTelList= ^TCmdSrvTermRetReadDevTelList;

  //��ȡ���� �̶��˵� TERMSRV_READDEVDISPLAYFIXEDMENU = $5D;
  TCmdTermSrvReadDevDiplayFixedMenu = TCmdTermSrvStopUploadSavedPic;//�ṹ��ͬ
  PCmdTermSrvReadDevDiplayFixedMenu = ^TCmdTermSrvReadDevDiplayFixedMenu;
  //���ػظ�SRVTERM_RETREADDEVDISPLAYFIXEDMENU = $5D;
  TCmdSrvTermRetReadDevDisplayFixedMenu = TCmdSrvTermRetReadDevTelList;//�ṹ������
  PCmdSrvTermRetReadDevDisplayFixedMenu = ^TCmdSrvTermRetReadDevDisplayFixedMenu;

  //�ͻ���->���أ��򳵻��·���������
  TCmdTermSrvSendNewAttemper = packed record
    size:Word;
    Flag:Byte;
    CmdId: Integer;
    DevId:Integer;
    AttemperId: Integer;    //����ID	4
    OverStopTimes:Word;     //��ʱͣ�����	2	��λ�����ӣ�������ʱ����ͣ��ʱ�䳬��ֵ��ʱ�������Ľ��г�ʱͣ������
        //����Χ����������	1	����Χ���������ֽ���
        //����Χ������	-	�����Χ����������ʽ�ͳ�������Χ���Ķ��������Ĳ�����ͬ��
        //����Χ����������	1	����Χ���������ֽ���
        //����Χ������	-	�����Χ����������ʽ�ͳ�������Χ���Ķ��������Ĳ�����ͬ��
  end;
    {���ػظ�}
  TCmdSrvTermRetSendNewAttemper = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    Ret: Byte;
  end;
  PCmdSrvTermRetSendNewAttemper = ^TCmdSrvTermRetSendNewAttemper;

  //�ͻ���->���أ��򳵻�ȡ��ĳ��������
  TCmdTermSrvSendCancelTheAttemper = packed record
    size:Word;
    Flag:Byte;
    CmdId: Integer;
    DevId:Integer;
    AttemperId: Integer;    //����ID	4
  end;
    {���ػظ�}
  TCmdSrvTermRetSendCancelTheAttemper = TCmdSrvTermRetSendNewAttemper; //�ṹһ��
  PCmdSrvTermRetSendCancelTheAttemper = ^TCmdSrvTermRetSendCancelTheAttemper;


  (****����Ϊ�����������ͻ��˵�����***)
  {���ظ��ͻ��ˣ�˾���� ��ظ��ĵ�����Ϣ �Ļظ������ǡ��򡰷� SRVTERM_SENDCONTROLINFO_DRIVERANSWER}
  TCmdSrvTermSendControlInfo_DriverAnswer = packed record
    Size: Word;
    Flag: Byte;
    //CmdID:integer; ��CmcID
    DevId: integer;
    MsgID: Word; //������ϢID�������ݿ���ȡֵ
    AnswerInfo: Byte; //˾��������Ϣ - 0����  1����
  end;
  PCmdSrvTermSendControlInfo_DriverAnswer = ^TCmdSrvTermSendControlInfo_DriverAnswer;

  {���ظ��ͻ��ˣ��յ�˾���ϴ��Ĺ̶��˵�  SRVTERM_DRIVERUPLOADFIXEDMENU}
  TCmdSrvTermDriverUploadFixedMenu = packed record
    Size: Word;
    Flag: Byte;
    //CmdID:integer; ��
    DevId: integer;
    FixedMenuId: Byte; //˾����ѡ��Ĺ̶��˵�ID
  end;
  PCmdSrvTermDriverUploadFixedMenu = ^TCmdSrvTermDriverUploadFixedMenu;

  {���ظ��ͻ��ˣ��յ������ϴ��ļƼ�����Ӫ���� SRVTERM_TAXIMETERRUNDATA}
  TCmdSrvTermTaxiMeterRunData = packed record
    Size: Word;
    Flag: Byte;
    //CmdID:integer; ��
    DevId: integer;
    {������}
  end;
  PCmdSrvTermTaxiMeterRunData = ^TCmdSrvTermTaxiMeterRunData;

  {���ظ��ͻ��ˣ��յ������ϴ��ļƼ���ȷ�ϵ�ͣ��ʱ�� SRVTERM_TAXIMETERCONFIRMSTOPTIME}
  TCmdSrvTermTaxiMeterConfirmStopTime_Old = packed record
    Size: Word;
    Flag: Byte;
    //CmdID:integer; ��
    DevId: integer;
    StopDate: TDateTime; //eg:2005-08-16 ��    //
    StopTime: Byte; //ʱ
  end;
  PCmdSrvTermTaxiMeterConfirmStopTime_Old = ^TCmdSrvTermTaxiMeterConfirmStopTime_Old;
             {--------delphi����������ģ�java����������� 2009-02 sha-------}
  TCmdSrvTermTaxiMeterConfirmStopTime = packed record
    Size: Word;
    Flag: Byte;
    //CmdID:integer; ��
    DevId: integer;
    StopDateTime:array[0..4] of byte;//2009-2-23�ģ�// TDateTime; //eg:2005-08-16 ��    //StopTime: Byte; //ʱ
  end;
  PCmdSrvTermTaxiMeterConfirmStopTime = ^TCmdSrvTermTaxiMeterConfirmStopTime;

  {���ظ��ͻ��ˣ�������Ϣ���и��ģ���ͻ������д����ݿ��и��� SRVTERM_ORDERCHANGED = $C3;}
  TCmdSrvTermOrderChanged = packed record
    Size: Word;
    Flag: Byte;
    //CmdID:integer; ��
    //DevID: Integer; ��
    OrderID: integer;
    RetStat: Byte; //��������--�ö���״̬
  end;
  PCmdSrvTermOrderChanged = ^TCmdSrvTermOrderChanged;

  //���ظ�֪�ͻ��� �յ������ѳɹ��ϴ��µ���Ƭ SRVTERM_APICUPLOADED = $B5;
  TCmdSrvTermAPicUploaded = packed record
    Size: Word;
    Flag: Byte;
    DevId: integer;
    PicIndex: integer; //�ó�������Ƭ���
    CameraIndex: Byte; //����ͷ��
    PicReson: Byte; //����ԭ��
    DoneRet: Byte; //���ս����0-�ɹ���1-��Ƭ��������2-����ͷ����3-����ʧ��
  end;
  PCmdSrvTermAPicUploaded = ^TCmdSrvTermAPicUploaded;

  //���������ͻ��ˣ����յ��������ϴ����س���� 20081126 sha  SRVTERM_DEVZTUPLOADCARRYOFFXSLC = $B9;
  TCmdSrvTermDevZtUploadCarrayOffXslc = packed record
    Size: Word;
    Flag: Byte;
    DevId: integer;
    MeliType:Byte;
    StartTime:array[0..5] of byte;
    StartLongi:Integer;
    StartLati:Integer;
    EndTime:array[0..5] of byte;
    EndLongi:Integer;
    EndLati:Integer;
    Xslc: Integer;
  end;
  PCmdSrvTermDevZtUploadCarrayOffXslc= ^TCmdSrvTermDevZtUploadCarrayOffXslc;

  //��������-���ͻ��� �����ϴ���������״̬�ı�  SRVTERM_CHGATTEMPERSTATE = $5C;
  TCmdSrvTermDevUploadAttemperStateChg = packed record
    Size: Word;
    Flag: Byte;
    DevId: integer;
    AttemperId : Integer;
    ChgTime : array[0..5] of byte;
    ChgLongitude:longword;
    ChgLatitude :LongWord;
    DriverNo:array[0..9] of byte;
    CurrentState:Byte;{�ı�������״̬	1	0���������뿪������
                                          1��������빤������
                                          2��ж�ϣ��ڹ��������ڵ�һ�η�ת��
                                          3��ж�꣨�뿪��������
                                          4���س������볧���� }
  end;
  PCmdSrvTermDevUploadAttemperStateChg = ^TCmdSrvTermDevUploadAttemperStateChg;

{********************  �����Ƿ�������GPS�����豸֮�������ṹ   *********************}
  {IP��ַ��}
  TInetAddr = packed record
    a: Byte;
    b: Byte;
    c: Byte;
    d: Byte;
  end;

  {  1.1��ͳһ�ĳ����豸��������ͷ��ʽ
     @TABB
     @H( ��ʶ    | ����   | ����        |�μ�)
     @R( CmdFlag | byte   | �����־    | )
     @R( ExecFlag| byte   | ����ִ��״̬| )
     @R( DevID   | integer| �豸ID      | )
     @TABE
  }
  TCmdDevHeader = packed record
    Size: Byte;
    DevId: Longword;
    CmdFlag: Byte;
    case integer of
      0: (Execute: Byte);
      1: (CheckSum: Byte);
  end;
  PCmdDevHeader = ^TCmdDevHeader;


  {�豸ע�������,�����豸���������������������֤��Ϣ
  DEV_LOGIN        =$FE;}
 {
  ������	1Byte	������Ϊ�������ݰ��ĳ��ȡ�
  �豸��ʶ	4Byte
  ������=0xFE	1Byte
  �豸IP	4Byte
  �豸Port	2Byte
  Э��汾	2Byte
  �豸�汾	2Byte
  У��	1Byte
 }
  TCmdDevSrvLogon = packed record
    Size: Byte;
    DevId: Longword;
    CmdFlag: Byte;
    DevIP: TInetAddr;
    Port: Word;
    CommVer: TVer;
    DevVer: TVer;
    CheckSum: Byte;
  end;
  PCmdDevSrvLogon = ^TCmdDevSrvLogon;

  {ע������ķ���ֵ Ret 0x00-ע��ɹ�0x01-ע��ʧ��}
  TCmdDevSrvLogonRet = packed record
    Size: Byte;
    DevId: Longword;
    CmdFlag: Byte;
    Ret: Byte;
    CheckSum: Byte;
  end;
  PCmdDevSrvLogonRet = ^TCmdDevSrvLogonRet;

  {�豸ע��
  DEV_LOGOFF       =$FF;
  @TABB
  @H(��ʶ   | ����    |����                  |�μ�)
  @R( size  | Word    |���ݰ��ĳ���=sizeof() |  )
  @R( DevID | Byte    |�豸��ʶ              | )
  @R( CmdFlag |       |������                | )
  @R( Execute| Byte   |����ִ��״̬          | )
  @R(LogOffReason|Byte| ע��ԭ��)
  @R( CheckSum|Byte   |У�� )
  @TABE
  }
  TCmdDevSrvLogOff = packed record
    Size: Byte;
    DevId: Longword;
    CmdFlag: Byte;
    Execute: Byte;
    LogOffReason: Byte;
    CheckSum: Byte;
  end;
  PCmdDevSrvLogOff = ^TCmdDevSrvLogOff;

  {��ͨGPS���� DEV_NGPSDATA     =$10;
  ������=0x10	1Byte
  ����	4Byte	��λ��ddd��mm.mmm�֣�
  γ��	4Byte	��λ��ddd��mm.mmm�֣�
  �ٶ�	2Byte	��λ 0.1����/Сʱ = 0.1852����/Сʱ
  ʱ��	6Byte	YY-MM-DD HH mm SS
  �豸״̬	1Byte	Bit0 GPS��λ״̬  Bit1 GPRS����״̬  ��������
  OI״̬	  1Byte	Bit0 ��ʾ������ť
  ע����������û�� �߶� ����
  }
  TCmdDevSrvNGpsData = packed record
    Size: Byte;
    DevId: integer;
    Flag: Byte;
    Long: array[0..3] of Byte;
    Lat: array[0..3] of Byte;
    Speed: array[0..1] of Byte;
    GpsTime: array[0..5] of Byte;
    Stat: Byte;
    Switch: Byte;
    CheckSum: Byte;
  end;
  PCmdDevSrvNGpsData = ^TCmdDevSrvNGpsData;


  {������GPS����,�豸���͵�����GPS���ݼ�¼
  }
  TBatchGpsData = packed record
    //Long: Integer;
    //Lat:  Integer;
    Long: array[0..3] of Byte;
    Lat: array[0..3] of Byte;
    //Speed: Word;
    Speed: array[0..1] of Byte;
    Stat: Byte;
    Switch: Byte;
  end;
  PBatchGpsData = ^TBatchGpsData;

  {����GPS����<br>
  DEV_BGPSDATA     =$12;
  @TABB
  @H(��ʶ    |����    |����                  |�μ�)
  @R( size   |Word    |������	1Byte	������Ϊ�������ݰ��ĳ���| )
  @R( DevID  |longword| �豸ID|)
  @R( CmdFlag|Byte    |=$12| )
  @R( ETime  |Byte[6] |���һ������ʱ��ʱ�� |)
  @R( InterVal|Word   |���ʱ��,�豸���͵�BigEnd�ֽ�˳�������| )
  @R( RecordCount|Byte|��¼���� n	1Byte )
  @TABE
  }
  TCmdDevSrvBGpsDataHeader = packed record
    Size: Byte;
    DevId: Longword;
    CmdFlag: Byte;
    ETime: array[0..5] of Byte;
    InterVal: Word;
    RecordCount: Byte;
    //n*record:  TBatchGpsData[]
    //CheckSum:Byte;
  end;
  PCmdDevSrvBGpsDataHeader = ^TCmdDevSrvBGpsDataHeader;

  {��������  DEV_TRACE        =$13;
  ������=0x13	1Byte
  ����ִ��״̬	1Byte
  ����ʱ����	1Byte	0~255��
  ���г���ʱ��	2Byte	0~3600��}
  TCmdSrvDevTrace = packed record
    Size: Byte;
    DevId: Longword;
    CmdFlag: Byte;
    ExecFlag: Byte;
    Freq: Byte;
    Time: Word;
    CheckSum: Byte;
  end;
  PCmdSrvDevTrace = ^TCmdSrvDevTrace;

  {Զ�̿���
  DEV_REMOTECTRL   =$14;
  ����ִ��״̬	1Byte
  �̵������	1Byte
  �̵���״̬	1Byte	��Ӧ��ÿһλ�ɱ�ʾһ���̵���
  }
  TCmdSrvDevRemoteCtrl = packed record
    Size: Byte;
    DevId: Longword;
    CmdFlag: Byte;
    ExecFlag: Byte;
    RelayNo: Byte;
    RelaySw: Byte;
    CheckSum: Byte;
  end;
  PCmdSrvDevRemoteCtrl = ^TCmdSrvDevRemoteCtrl;


  {���ò���
  DEV_SETPARAM     =$15;ʹ��ͨ�õ�����ͷ����}
  TCmdSrvDevSetParam = packed record
    Size: Byte;
    DevId: Longword;
    CmdFlag: Byte;
    ExecFlag: Byte;
    //[n of params]
    //CheckSum:Byte;
  end;
  PCmdSrvDevSetParam = ^TCmdSrvDevSetParam;

  {���ò���
  DEV_SETPARAM     =$15;ʹ��ͨ�õ�����ͷ����}
  TCmdDevSrvSetParamRet = packed record
    Size: Byte;
    DevId: Longword;
    CmdFlag: Byte;
    ExecFlag: Byte;
    CheckSum: Byte;
  end;
  PCmdDevSrvSetParamRet = ^TCmdDevSrvSetParamRet;


  {��ȡ����
  DEV_READPARAM    =$16;
  ������	1Byte	������Ϊ�������ݰ��ĳ��ȡ�
  �豸��ʶ	4Byte
  ������=0x16	1Byte	��ȡ�豸����
  ����ִ��״̬	1Byte	CMD_REQUEST
  }
  TCmdSrvDevReadParam = packed record
    Size: Byte;
    DevId: Longword;
    CmdFlag: Byte;
    ExecFlag: Byte;
    ReadNum: Byte; // add by sha 2004-10-27
    CheckSum: Byte;
  end;
  PCmdSrvDevReadParam = ^TCmdSrvDevReadParam;


  {���ͼ����Ϣ
  DEV_SENDMSG      =$17;}
  TCmdSrvDevSendMsg = packed record
    Size: Byte;
    DevId: Longword;
    CmdFlag: Byte;
    ExecFlag: Byte;
    MsgID: Word;
    MsgType: Byte;
      //MsgContent[]Bytes
  end;
  PCmdSrvDevSendMsg = ^TCmdSrvDevSendMsg;

  {�豸�յ���ķ�������DEV_SENDMSG      =$17}
  TCmdDevSrvRecvmsg = packed record
    Size: Byte;
    DevId: Longword;
    CmdFlag: Byte;
    ExecFlag: Byte;
    MsgID: Word;
    AttValue: Word;
    CheckSum: Byte;
  end;
  PCmdDevSrvRecvmsg = ^TCmdDevSrvRecvmsg;

  {�������ݵ�DTE
  DEV_TODTE        =$18;}
  TCmdSrvDevSendToDTEHdr = packed record
    Size: Byte;
    DevId: Longword;
    CmdFlag: Byte;
    ExecFlag: Byte;
    DataID: Byte;
    DataLen: Byte;
      //..DataContent;   Bytes[]
      //..CheckSum:Byte;
  end;
  PCmdSrvDevSendToDTEHdr = ^TCmdSrvDevSendToDTEHdr;

  TCmdDevSrvSendToDTERet = packed record
    Size: Byte;
    DevId: Longword;
    CmdFlag: Byte;
    ExecFlag: Byte;
    DataID: Byte;
    CheckSum: Byte;
  end;
  PCmdDevSrvSendToDTERet = ^TCmdDevSrvSendToDTERet;

  {�豸�������ݵ�������
  ��DTE��������
  DEV_TOHOST       =$19;}
  TCmdDevSrvSendToHost = packed record
    Size: Byte;
    DevId: Longword;
    CmdFlag: Byte;
    ExecFlag: Byte;
    DataID: Byte;
    DataLen: Byte;
      //..DataContent;   Bytes[]
      //..CheckSum:Byte;
  end;
  PCmdDevSrvSendToHost = ^TCmdDevSrvSendToHost;
  {��������Ӧ�豸���յ�����}
  TCmdSrvDevSendToHostRet = TCmdDevSrvSendToDTERet;
  PCmdSrvDevSendToHostRet = ^TCmdSrvDevSendToHostRet;
  //PING ����������
  //DEVSRV_PING         =$EC;

  (******�����복����V2.0 **********)
  {V2.0��ĳ�������ͷ}
  TCmdDevHeader_V2 = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    //������
    //CheckSum     : Byte;  //У��
  end;
  PCmdDevHeader_V2 = ^TCmdDevHeader_V2;

  {���ĸ������ġ�ͨ��Ӧ�� CmdId=DEV_SRVRET_V2}
  TCmdSrvDevAnswer = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������$01
    Answer_CmdOrder: Word; //���� ������ʱ�� �������
    Answer_CmdFlag: Byte; //���� ������ʱ�� ����ID
    Ret: Byte; //������	0���ɹ���1��ʧ��
    CheckSum: Byte; //У��
  end;
  PCmdSrvDevAnswer = ^TCmdSrvDevAnswer;

  {���������ĵġ�ͨ��Ӧ�� CmdId=DEV_DEVRET_V2}
  TCmdDevSrvAnswer = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������ $71
    Answer_CmdOrder: Word; //���ġ��·�����ʱ�� �������
    Answer_CmdFlag: Byte; //���ġ��·�����ʱ�� ����ID
    Ret: Byte; //������	0���ɹ���1��ʧ��
    CheckSum: Byte; //У��
  end;
  PCmdDevSrvAnswer = ^TCmdDevSrvAnswer;

  {���������ĵ�ͨ��Ӧ�� ��У��� CmdId=DEV_DEVRET_V2��20070602}
  TCmdDevSrvAnswer_NoSum = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������ $71
    Answer_CmdOrder: Word; //���ġ��·�����ʱ�� �������
    Answer_CmdFlag: Byte; //���ġ��·�����ʱ�� ����ID
    Ret: Byte; //������	0���ɹ���1��ʧ��
    //CheckSum: Byte; //У��
  end;
  PCmdDevSrvAnswer_NoSum = ^TCmdDevSrvAnswer_NoSum;


  {���ģ�����������λ��CmdId=DEV_GETPOSITION_V2 =$02 }
  TCmdSrvDevGetPostion = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    CheckSum: Byte; //У��
  end;
  PCmdSrvDevGetPostion = ^TCmdSrvDevGetPostion;
  {���������ġ���λ������ CmdId=DEV_GPSDATA_V2=$72}
  TCmdDevSrvGpsData_V2 = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    Latitude: integer; //γ�� X 100 0000 ��: ֵ32123456��ʾ��32.123456��
    Longitude: integer; //���� X 100 0000
    Speed: Byte; //�ٶȡ���λ������/Сʱ����ʾ��Χ0��255
    Orientation: Byte; //������������Ϊ0�ȣ�˳ʱ�����ӣ���λ��2�ȣ���ֵ��Χ0��180��
    State: Longword; //32λ״̬λ
    GpsTime: array[0..5] of Byte; //GPSʱ�䡡
    CheckSum: Byte; //У��
  end;
  PCmdDevSrvGpsData_V2 = ^TCmdDevSrvGpsData_V2;

  //��У��ͣ���Gpsʱ��
  //���������ġ���λ������ CmdId=DEV_GPSDATA_V2=$72
  TCmdDevSrvGpsData_NoSum = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    Latitude: integer; //γ�� X 100 0000 ��: ֵ32123456��ʾ��32.123456��
    Longitude: integer; //���� X 100 0000
    Speed: Byte; //�ٶȡ���λ������/Сʱ����ʾ��Χ0��255
    Orientation: Byte; //������������Ϊ0�ȣ�˳ʱ�����ӣ���λ��2�ȣ���ֵ��Χ0��180��
    State: Longword; //32λ״̬λ
    GpsTime: array[0..5] of Byte; //GPSʱ�䡡
    //CheckSum: Byte; //У��
  end;
  PCmdDevSrvGpsData_NoSum = ^TCmdDevSrvGpsData_NoSum;

  //��ȫ��������Э�飬��Gpsʱ�䣬��У���:
  {���������ġ���λ������ CmdId=DEV_GPSDATA_V2=$72}
  TCmdDevSrvGpsData_NoSumNoGpsTime = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    Latitude: integer; //γ�� X 100 0000 ��: ֵ32123456��ʾ��32.123456��
    Longitude: integer; //���� X 100 0000
    Speed: Byte; //�ٶȡ���λ������/Сʱ����ʾ��Χ0��255
    Orientation: Byte; //������������Ϊ0�ȣ�˳ʱ�����ӣ���λ��2�ȣ���ֵ��Χ0��180��
    State: Longword; //32λ״̬λ
    //GpsTime: array[0..5] of Byte; //GPSʱ�䡡
    //CheckSum: Byte; //У��
  end;
  PCmdDevSrvGpsData_NoSumNoGpsTime = ^TCmdDevSrvGpsData_NoSumNoGpsTime;
  {�������жϣ��Ƿ�Ϊ��������������ǣ������ͨ��Ӧ�𣬷���Ӧ��}

  {���ģ���������׷�١�CmdId=DEV_PURSUE_V2 =$03}
  TCmdSrvDevPursue = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    PursueInterval: Word; //׷�ټ��	��λ���룬��СΪ0��Ĭ��Ϊ30�����Ϊ65535��Լ18Сʱ��
    CheckSum: Byte; //У��
  end;
  PCmdSrvDevPursue = ^TCmdSrvDevPursue;
  {���� ���� ͨ��Ӧ��}

  {���ģ������� �趨���� CmdId = DEV_SETPARAM_V2 = $04;}
  TCmdSrvDevSetParam_V2 = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    ParamId: Word; //����ID
    //����ֵ ���Ȳ���
    //CheckSum     : Byte;  //У��
  end;
  PCmdSrvDevSetParam_V2 = ^TCmdSrvDevSetParam_V2;
  {���� ���� ͨ��Ӧ��}

  {���ģ������������������CmdId =DEV_REMOVEALARM_V2 =$05}
  TCmdSrvDevRemoveAlarm = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    CheckSum: Byte; //У��
  end;
  PCmdSrvDevRemoveAlarm = ^TCmdSrvDevRemoveAlarm;
  {���� ���� ͨ��Ӧ��}

  {���ģ������� �޸ĳ�����ʾ�� �����湫˾���ơ�DEV_MODIFYDEVDISPLAYNAME_V2 = $06}
  TCmdSrvDevModifyDevDisplayname = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    //���Ʋ�����
    //CheckSum     : Byte;  //У��
  end;
  PCmdSrvDevModifyDevDisplayname = ^TCmdSrvDevModifyDevDisplayname;
  {���� ���� ͨ��Ӧ��}

  {���ģ������� �޸ĳ�����ʾ���̶��˵� DEV_MODIFYDEVDISPLAYFIXEDMENU_V2  = $07}
  TCmdSrvDevModifyDevDisplayFixedMenu = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    //�˵�ID���˵����� --������
    //CheckSum     : Byte;  //У��
  end;
  PCmdSrvDevModifyDevDisplayFixedMenu = ^TCmdSrvDevModifyDevDisplayFixedMenu;
  {���� ���� ͨ��Ӧ��}

  {���ģ������� �����ı�������Ϣ DEV_SENDCONTROLINFO_V2 = $09;}
  TCmdSrvDevSendControlInfo = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    //������Ϣ ������ ��<200Byte
    //CheckSum     : Byte;  //У��
  end;
  PCmdSrvDevSendControlInfo = ^TCmdSrvDevSendControlInfo;
  {���� ���� ͨ��Ӧ��}

  {���ģ������� ������ظ��ĵ�����Ϣ DEV_SENDCONTROLINFO_NEEDANSWER_V2 = $0A}
  TCmdSrvDevSendControlInfo_NeedAnswer = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    MsgID: Word; //������ϢID
    //������Ϣ ������ ��<200Byte
    //CheckSum     : Byte;  //У��
  end;
  PCmdSrvDevSendControlInfo_NeedAnswer = ^TCmdSrvDevSendControlInfo_NeedAnswer;
  {���� ���� ͨ��Ӧ��}

  {���ģ������� ���õ绰�� DEV_SETTELLIST_V2 = $0F;}
  TCmdSrvDevSetTelList = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    ////�绰�б� ������
    //CheckSum     : Byte;  //У��
  end;
  PCmdSrvDevSetTelList = ^TCmdSrvDevSetTelList;
  {���� ���� ͨ��Ӧ��}

  {���ģ������� �����̼� DEV_UPDATEFIRMWARE_V2 = $10}
  TCmdSrvDevUpdateFirmware = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    UpdateType: Byte; //�����豸���ͣ���0����ʾ��������1����ʾ����������
    //URL��ַ ��������200Byte
    //CheckSum     : Byte;  //У��
  end;
  PCmdSrvDevUpdateFirmware = ^TCmdSrvDevUpdateFirmware;
  {���� ���� ͨ��Ӧ��}

  {���ģ������� ������ DEV_READPARAM_V2 = $11}
  TCmdSrvDevReadParam_V2 = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    ParamId: Word; //   ����ID
    CheckSum: Byte; //У��
  end;
  PCmdSrvDevReadParam_V2 = ^TCmdSrvDevReadParam_V2;
  {�����������ġ�������Ӧ�𣭣��������ͨ��Ӧ������ϼ��ϲ���ֵ}
  TCmdDevSrvReadParam_V2 = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������  = �ﳵ��Ӧ��ͨ�������֡�=DEV_DEVRET_V2=$71
    Answer_CmdOrder: Word; //���ġ��·�����ʱ�� �������
    Answer_CmdFlag: Byte; //���ġ��·�����ʱ�� ������ID  = DEV_READPARAM_V2 = $11
    Ret: Byte; //������	0���ɹ���1��ʧ��
    ParamId: Word; //   ����ID
    //����ֵ
    //CheckSum     : Byte;  //У��
  end;
  PCmdDevSrvReadParam_V2 = ^TCmdDevSrvReadParam_V2;

  {���ģ������� �޸ĳ�����ʾ�� ȡ�������õĲ˵� DEV_MODIFYDEVDISPLAY_CANCELORDERMENU_V2= $08}
  TCmdSrvDevModifyDevDisplay_CancelOrderMenu_V2 = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    { ��1��˵�ID��
      ��1��˵��ĳ���
      ��1��˵�������
      ...}
    //CheckSum   : Byte;   //У��
  end;
  PCmdSrvDevModifyDevDisplay_CancelOrderMenu_V2 = ^TCmdSrvDevModifyDevDisplay_CancelOrderMenu_V2;
  {�����ٸ���ͨ��Ӧ��}

  {���ģ������� �·�һ������������  DEV_DOWNAORDER_V2 = $0B; }
  TCmdSrvDevDownAOrder = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    OrderType: Byte; //��������
    OrderID: Word; //����ID
    OrderDate_yy: Byte; //�������� 3�ֽ�-��
    OrderDate_mm: Byte; //              -��
    OrderDate_dd: Byte; //              -��
    OrderTime_hh: Byte; //����ʱ�� 2�ֽ�-ʱ
    OrderTime_nn: Byte; //              -��
    //��������  <200
    //CheckSum   : Byte;   //У��
  end;
  PCmdSrvDevDownAOrder = ^TCmdSrvDevDownAOrder;
  {��������Ӧ��}

  {���ģ������� �·�һ������������  DEV_DOWNAORDER_V2 = $0B; }
  TCmdSrvDevDownAOrder_4 = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    OrderType: Byte; //��������
    OrderID: integer; //����ID
    OrderDate_yy: Byte; //�������� 3�ֽ�-��
    OrderDate_mm: Byte; //              -��
    OrderDate_dd: Byte; //              -��
    OrderTime_hh: Byte; //����ʱ�� 2�ֽ�-ʱ
    OrderTime_nn: Byte; //              -��
    //��������  <200
    //CheckSum   : Byte;   //У��
  end;
  PCmdSrvDevDownAOrder_4 = ^TCmdSrvDevDownAOrder_4;
  //{��������Ӧ��}
  {20070323-����Ϊ����Ӧ��}

  {���ģ������� �·������ɹ� DEV_DOWNGRABEDORDEROK_V2 = $0C; }
  TCmdSrvDevDownGrabOrderOk = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    OrderID: Word; //����ID
    GuestTelLen: Byte; //�û��绰��λ��
    //�û��ĵ绰	-	�绰�������ASCII���ʾ��
    //������ϸ����	<200
    //CheckSum   : Byte;   //У��
  end;
  PCmdSrvDevDownGrabOrderOk = ^TCmdSrvDevDownGrabOrderOk;
  {�����ٸ���ͨ��Ӧ��}

   {���ģ������� �·������ɹ� DEV_DOWNGRABEDORDEROK_V2 = $0C; }
  TCmdSrvDevDownGrabOrderOk_4 = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    OrderID: integer; //����ID
    GuestTelLen: Byte; //�û��绰��λ��
    //�û��ĵ绰	-	�绰�������ASCII���ʾ��
    //������ϸ����	<200
    //CheckSum   : Byte;   //У��
  end;
  PCmdSrvDevDownGrabOrderOk_4 = ^TCmdSrvDevDownGrabOrderOk_4;
  {�����ٸ���ͨ��Ӧ��}

  {���ģ������� �·�����ʧ�� DEV_DOWNGRABEDORDERFAIL_V2 = $0D;}
  TCmdSrvDevDownGrabOrderFail = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    OrderID: Word; //����ID
    CheckSum: Byte; //У��
  end;
  PCmdSrvDevDownGrabOrderFail = ^TCmdSrvDevDownGrabOrderFail;
  {�����ٸ���ͨ��Ӧ��}

  {���ģ������� �·�����ʧ�� DEV_DOWNGRABEDORDERFAIL_V2 = $0D;}
  TCmdSrvDevDownGrabOrderFail_4 = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    OrderID: integer; //����ID
    CheckSum: Byte; //У��
  end;
  PCmdSrvDevDownGrabOrderFail_4 = ^TCmdSrvDevDownGrabOrderFail_4;
  {�����ٸ���ͨ��Ӧ��}


  {���ģ�������  �·�����ȡ��  DEV_DOWNCANCELORDER  = $0E;}
  TCmdSrvDevCancelOrder = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    OrderID: Word; //����ID
    CheckSum: Byte; //У��
  end;
  PCmdSrvDevCancelOrder = ^TCmdSrvDevCancelOrder;
  {�����ٸ���ͨ��Ӧ��}
  {���ģ�������  �·�����ȡ��  DEV_DOWNCANCELORDER  = $0E;}
  TCmdSrvDevCancelOrder_4 = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    OrderID: integer; //����ID
    CheckSum: Byte; //У��
  end;
  PCmdSrvDevCancelOrder_4 = ^TCmdSrvDevCancelOrder_4;
  {�����ٸ���ͨ��Ӧ��}

  {������������  �ϴ�������Ϣ DEV_DEVGRABORDER_V2 = $76}
  TCmdDevSrvGrabOrder = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    OrderID: Word; //����ID        2
    CheckSum: Byte; //У��
  end;
  PCmdDevSrvGrabOrder = ^TCmdDevSrvGrabOrder;
  {���Ĳ�����ͨ��Ӧ�𣬶��ǻظ������ɹ�������ʧ��}

  {������������  �ϴ�������Ϣ DEV_DEVGRABORDER_V2 = $76
    4�ֽڵĶ���ID}
  TCmdDevSrvGrabOrder_4 = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    OrderID: integer; //����ID        2
    CheckSum: Byte; //У��
  end;
  PCmdDevSrvGrabOrder_4 = ^TCmdDevSrvGrabOrder_4;
  //{���Ĳ�����ͨ��Ӧ�𣬶��ǻظ������ɹ�������ʧ��}
  {20070323-����Ϊ����Ӧ��,�ٻظ������ɹ�������ʧ��}

  {������������  �ϴ�����δ����ɵ�ԭ�� DEV_DEVRESON_CANCELORDER_V2=$77}
  TCmdDevSrvReson_CancelOrder = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    OrderID: Word; //����ID        2
    CancelMenuID: Byte; //ȡ�������Ĳ˵�ID    1
    CheckSum: Byte; //У��
  end;
  PCmdDevSrvReson_CancelOrder = ^TCmdDevSrvReson_CancelOrder;
  {�����ٸ���ͨ��Ӧ��}

  {������������  �ϴ�����δ����ɵ�ԭ�� DEV_DEVRESON_CANCELORDER_V2=$77
    4�ֽڵĶ���ID}
  TCmdDevSrvReson_CancelOrder_4 = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    OrderID: integer; //����ID        2
    CancelMenuID: Byte; //ȡ�������Ĳ˵�ID    1
    CheckSum: Byte; //У��
  end;
  PCmdDevSrvReson_CancelOrder_4 = ^TCmdDevSrvReson_CancelOrder_4;
  {�����ٸ���ͨ��Ӧ��}

  {���� -> ���� ˾���ϴ��������DEV_UPLOADDONEORDER  = $7F; //}
  TCmdDevSrvUploadDoneOrder_4 = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    OrderID: integer;
    CheckSum: Byte; //У��
  end;
  PCmdDevSrvUploadDoneOrder_4 = ^TCmdDevSrvUploadDoneOrder_4;
  {���ظ�����ͨ��Ӧ�� DEV_RETUPLOADDONEORDER      = $1A;}
  TCmdSrvDevRetUploadDoneOrder_4 = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    OrderID: integer;
    CheckSum: Byte; //У��
  end;
  PCmdSrvDevRetUploadDoneOrder_4 = ^TCmdSrvDevRetUploadDoneOrder_4;


  {������������ �ϴ��̶��˵� DEV_DRIVERUPLOADFIXEDMENU_V2 = $73}
  TCmdDevSrvUploadFixedMenu = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    FixedMenuId: Byte; //˾����ѡ��Ĺ̶��˵�ID
    CheckSum: Byte; //У��
  end;
  PCmdDevSrvUploadFixedMenu = ^TCmdDevSrvUploadFixedMenu;
 {�����ٸ���ͨ��Ӧ��}

  {������������ ˾���� ��ظ��ĵ�����Ϣ�� �ظ� DEV_SENDCONTROLINFO_DRIVERANSWER_V2= $74}
  TCmdDevSrvSendControlInfo_DriverAnswer = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    MsgID: Word; //������ϢID�������ݿ���ȡֵ
    AnswerInfo: Byte; //˾��������Ϣ - 0����  1����
    CheckSum: Byte; //У��
  end;
  PCmdDevSrvSendControlInfo_DriverAnswer = ^TCmdDevSrvSendControlInfo_DriverAnswer;
  {�����ٸ���ͨ��Ӧ��}

  {������������ �ϴ��Ƽ���Ӫ������  DEV_TAXIMETERRUNDATA_V2= $75}
  TCmdDevSrvTaxiMeterRunData = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    {������}
  end;
  PCmdDevSrvTaxiMeterRunData = ^TCmdDevSrvTaxiMeterRunData;

  {������������ �����ϴ��ļƼ���ȷ�ϵ�ͣ��ʱ�� DEV_TAXIMETERCONFIRMSTOPTIM_V2    = $7C}
  TCmdDevSrvTaxiMeterConfirmStopTime = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    StopTime: array[0..4] of Byte; //BCD�� XX XX ��XX��XX��XXʱ
    CheckSum: Byte; //У��
  end;
  PCmdDevSrvTaxiMeterConfirmStopTime = ^TCmdDevSrvTaxiMeterConfirmStopTime;

  {������������  ������¼ DEV_LOGIN_V2  = $7B}
  TCmdDevSrvLogin_V2 = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    Latitude: integer; //γ�� X 100 0000 ��: ֵ32123456��ʾ��32.123456��
    Longitude: integer; //���� X 100 0000
    Speed: Byte; //�ٶȡ���λ������/Сʱ����ʾ��Χ0��255
    Orientation: Byte; //������������Ϊ0�ȣ�˳ʱ�����ӣ���λ��2�ȣ���ֵ��Χ0��180��
    State: Longword; //32λ״̬λ
    GpsTime: array[0..5] of Byte;
    CheckSum: Byte; //У��
  end;
  PCmdDevSrvLogin_V2 = ^TCmdDevSrvLogin_V2;
  {�����ٸ���ͨ��Ӧ��}
  {����->���� �����ӷ�����ע��  DEV_LOGOUT_V2 = $89 }
  TCmdDevSrvLogOut_V2 = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    Latitude: integer; //γ�� X 100 0000 ��: ֵ32123456��ʾ��32.123456��
    Longitude: integer; //���� X 100 0000
    Speed: Byte; //�ٶȡ���λ������/Сʱ����ʾ��Χ0��255
    Orientation: Byte; //������������Ϊ0�ȣ�˳ʱ�����ӣ���λ��2�ȣ���ֵ��Χ0��180��
    State: Longword; //32λ״̬λ
    GpsTime: array[0..5] of Byte;
    CheckSum: Byte; //У��
  end;
  PCmdDevSrvLogOut_V2 = ^TCmdDevSrvLogOut_V2;
  {�����������ġ��ϴ��������ݲ���}
  TCmdDevSrvUpdateParam = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    ReadRet: Byte; //   ��ѯ���0���ɹ�  1��ʧ��
    ParamId: Word; //   ����ID
    ParamLen: Byte; //   ��������
    //����ֵ
    //CheckSum     : Byte;  //У��
  end;

  {���ĸ������·�����/�ϵ�/����/�������� DEV_CUTORFEED_OIL_ELECTRICITY     = $16; }
  TCmdSrvDevCutOrFeedOilOrElectricity = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    Content: Word; //��ϸ���ݣ� ����/�ϵ�/����/����
    CheckSum: Byte; //У��
  end;
  PCmdSrvDevCutOrFeedOilOrElectricity = ^TCmdSrvDevCutOrFeedOilOrElectricity;
  {�����ٸ�ͨ��Ӧ��}

  {����-> ���� ���������� DEV_READTESTDATA = $AA}
  TCmdSrvDevReadTestData = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    CheckSum: Byte; //У��
  end;
  PCmdSrvDevReadTestData = ^TCmdSrvDevReadTestData;
  {����-> ���� �ϴ��������� DEV_UPLOADTESTDATA= $FA}
  TCmdDevsrvRetReadTestData = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    TestData: array[0..19] of Byte; //20�ֽڵĲ�������
    CheckSum: Byte; //У��
  end;
  PCmdDevsrvRetReadTestData = ^TCmdDevsrvRetReadTestData;

  {����-> ���� ���汾����  DEV_READDEVVER = $AB;}
  TCmdSrvDevReadDevVer = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    CheckSum: Byte; //У��
  end;
  PCmdSrvDevReadDevVer = ^TCmdSrvDevReadDevVer;
  {����-> ���� �ϴ������汾 DEV_UPLOADDEVVER= $FB}
  TCmdDevSrvRetReadDevVer = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    //�汾���ݡ�����32    AscII��         ��
    //CheckSum   : Byte;    //У��
  end;
  PCmdDevSrvRetReadDevVer = ^TCmdDevSrvRetReadDevVer;

  //����˾��������� 2006-8-25
  {����-> ���� ����˾����Ϣ DEV_SETDRIVERS  = $17;}
  TCmdSrvDevSetDrivers = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    DriverNo1: array[0..9] of char; //����.���㲿�ݲ�0
    DriverName1: array[0..19] of char;
    DriverNo2: array[0..9] of char;
    DriverName2: array[0..19] of char;
    DriverNo3: array[0..9] of char;
    DriverName3: array[0..19] of char;
    DriverNo4: array[0..9] of char;
    DriverName4: array[0..19] of char;
    CheckSum: Byte; //У��
  end;
  PCmdSrvDevSetDrivers = ^TCmdSrvDevSetDrivers;
  {��������ͨ��Ӧ��}

  {����-> ���� ��ȡ˾����Ϣ DEV_READDRIVERS   = $18;}
  TCmdSrvDevReadDrivers = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    CheckSum: Byte; //У��
  end;
  PCmdSrvDevReadDrivers = ^TCmdSrvDevReadDrivers;
  {�������ظ�}
  TCmdDevSrvRetReadDrivers = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    DriverNo1: array[0..9] of char; //����.���㲿�ݲ�0
    DriverName1: array[0..19] of char;
    DriverNo2: array[0..9] of char;
    DriverName2: array[0..19] of char;
    DriverNo3: array[0..9] of char;
    DriverName3: array[0..19] of char;
    DriverNo4: array[0..9] of char;
    DriverName4: array[0..19] of char;
    CheckSum: Byte; //У��
  end;
  PCmdDevSrvRetReadDrivers = ^TCmdDevSrvRetReadDrivers;

  {����-> ���� ��ȡ��ǰ˾�� DEV_READCURRENTDRIVER = $19;}
  TCmdSrvDevReadCurrentDriver = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    CheckSum: Byte; //У��
  end;
  PCmdSrvDevReadCurrentDriver = ^TCmdSrvDevReadCurrentDriver;


  {���� ->���ġ��ϴ���ǰ˾����DEV_UPLOADCURRENTDRIVER = $7D;--���������Ķ�ȡ��Ӧ��Ҳ�����������ϴ���}
  TCmdDevSrvUploadCurrentDriver = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    DriverNo: array[0..9] of Byte;
    LoginTime: array[0..5] of Byte;
    CheckSum: Byte; //У��
  end;
  PCmdDevSrvUploadCurrentDriver = ^TCmdDevSrvUploadCurrentDriver;

  {����-������ �ϴ�������վ���վ DEV_INORDOWNSTATION=$84}
  TCmdDevSrvInOrDownStation = packed record
    Size: Word;
    DevFaction: Byte;
    DevId: integer;
    ComVer: Byte;
    CmdOrder: Word;
    CmdFlag: Byte;
    StationNo: Byte;
    Direct: Byte;
    InOrDown: Byte;
    CheckSum: Byte;
  end;
  PCmdDevSrvInOrDownStation = ^TCmdDevSrvInOrDownStation;
  {����->����  �ϴ��������ټ�¼ DEV_OVERSPEEDINFO = $86}
  TCmdDevSrvOverSpeedInfo = packed record
    Size: Word;
    DevFaction: Byte;
    DevId: integer;
    ComVer: Byte;
    CmdOrder: Word;
    CmdFlag: Byte;
    AreaNo: integer; //������
    OverSpeedTime: array[0..5] of byte; //ʱ��
    IsBegin: byte; //0->��ʼ 1->����
  end;
  PCmdDevSrvOverSpeedInfo = ^TCmdDevSrvOverSpeedInfo;
  {����-������  �ϴ�ͣ����¼ DEV_DEVSTOPINFO = $85}
  TCmdDevSrvStopInfo = packed record
    Size: Word;
    DevFaction: Byte;
    DevId: integer;
    ComVer: Byte;
    CmdOrder: Word;
    CmdFlag: Byte;
    Num: byte;
    //ͣ������
  end;
  PCmdDevSrvStopInfo = ^TCmdDevSrvStopInfo;
  {����-������ �ϴ��洢�Ķ�λ���� DEV_SAVEGPSDATA = $87}
  TCmdDevSrvSaveGpsdata = packed record
    Size: Word;
    DevFaction: Byte;
    DevId: integer;
    ComVer: Byte;
    CmdOrder: Word;
    CmdFlag: Byte;
     //��������GPS��λ����
  end;
  PCmdDevSrvSaveGpsdata = ^TCmdDevSrvSaveGpsdata;
  {���� -> ���� �ϴ�˾���°��˳� DEV_UPLOADDRIVERLOGOUT }
  TCmdDevSrvUploadDriverLogOut = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    DriverNo: array[0..9] of Byte;
    LogOutTime: array[0..5] of Byte;
    CheckSum: Byte; //У��
  end;
  PCmdDevSrvUploadDriverLogOut = ^TCmdDevSrvUploadDriverLogOut;
  {���ĸ���ͨ��Ӧ��}

  //����-> ���� �ó�����һ����ƬDEV_GETAPIC = $1B;
  TCmdSrvDevGetAPic = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    GetPicSize: Byte; //��Ƭ�ߴ��С 0=320x240  1=640x480  2-else
    CameraIndex: Byte; //����ͷ��
    CheckSum: Byte; //У��
  end;
  PCmdSrvDevGetAPic = ^TCmdSrvDevGetAPic;
  //�����ظ� ͨ��Ӧ��

   //���� -> ���� �����ѳɹ�����Ƭ�ϴ�  DEV_APICUPLOADED= $80
  TCmdDevSrvAPicUploaded = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    PicIndex: integer; //��������Ƭ���
    CameraIndex: Byte; //����ͷ��
    PicReson: Byte; //����ԭ��
    DoneRet: Byte; //���ս����0-�ɹ���1-��Ƭ��������2-����ͷ����3-����ʧ��
    CheckSum: Byte; //У��
  end;
  PCmdDevSrvAPicUploaded = ^TCmdDevSrvAPicUploaded;
  {���ĸ���ͨ��Ӧ��}

  // 20070518 ����
  //����->��������ȡ��ǰ����  DEV_READFLUX = $1C;
  TCmdSrvDevReadFlux = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    CheckSum: Byte; //У��
  end;
  PCmdSrvDevReadFlux = ^TCmdSrvDevReadFlux;
   //���� �ϴ�����DEV_UPLOADFLUX = $81;
  TCmdDevSrvUploadFlux = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    Link1Up: Integer; //����1����������
    Link1Down: Integer; //����1����������
    Link2Up: Integer; //����2����������
    Link2Down: Integer; //����2����������
    Link3Up: Integer; //����3����������
    Link3Down: Integer; //����3����������
    Link4Up: Integer; //����4����������
    Link4Down: Integer; //����4����������
    Link5Up: Integer; //����5����������
    Link5Down: Integer; //����5����������
    Link6Up: Integer; //����6����������
    Link6Down: Integer; //����6����������
    CheckSum: Byte; //У��
  end;
  PCmdDevSrvUploadFlux = ^TCmdDevSrvUploadFlux;

  //2007-8-23 ���ӹ���������
  //����->�������·�һ�������Ϣ DEV_DOWNANAD = $1D;
  TCmdSrvDevDownAnAd = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    AdId: Integer; // ���ID
    AdLen: Byte; // ������ݵĳ���
    //AdContent:       �����ϸ���� <200Byte
    //CheckSum: Byte; //У��
  end;
  PCmdSrvDevDownAnAd = ^TCmdSrvDevDownAnAd;
  {�����ظ�ͨ������Ӧ��}

  //ɾ��һ�������ϢDEV_DELANAD  = $1E;
  TCmdSrvDevDelAnAd = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    AdId: Integer; // ���ID
    CheckSum: Byte; //У��
  end;
  PCmdSrvDevDelAnAd = ^TCmdSrvDevDelAnAd;
  {�����ظ�ͨ������Ӧ��}

  //ɾ�����й����Ϣ  DEV_DELALLAD = $1F;
  TCmdSrvDevDelAllAd = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    CheckSum: Byte; //У��
  end;
  PCmdSrvDevDelAllAd = ^TCmdSrvDevDelAllAd;
  {�����ظ�ͨ������Ӧ��}

  //����->��������ȡ���������й���ID DEV_READALLADID = $20;
  TCmdSrvDevReadAllAdId = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    CheckSum: Byte; //У��
  end;
  PCmdSrvDevReadAllAdId = ^TCmdSrvDevReadAllAdId;
  //�����ظ����ϴ����������й���ID DEV_UPLOADALLADID = $82;
  TCmdDevSrvUploadAllAdId = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    //AdId1: Integer;
    //...AdIdn: Integer;
    //CheckSum: Byte; //У��
  end;
  PCmdDevSrvUploadAllAdId = ^TCmdDevSrvUploadAllAdId;

  //����->�������·�����������ʾ���� DEV_DOWNALLWAY  = $21;
  TCmdSrvDevDownAllWay = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    //WayId1:Integer;
    //WayLen1 : Byte;
    //WayContent : <50
    //...
    //CheckSum: Byte; //У��
  end;
  PCmdSrvDevDownAllWay = ^TCmdSrvDevDownAllWay;
  {�����ظ�ͨ������Ӧ��}

  //����->����������AES��Կ DEV_DOWNAESKEY  = $23;  2007-08-30
  TCmdSrvDevDownAesKey = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    DESKey: array[0..7] of byte;
    CheckSum: Byte; //У��
  end;
  PCmdSrvDevDownAesKey = ^TCmdSrvDevDownAesKey;
  {�����ظ����ܺ��ͨ������Ӧ��}

  //����->���������ó�����������ļ����绰����  DEV_DOWNLISTENCALLNUM = $24;  //2007-9-24
  TCmdSrvDevDownListenCallNum = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    //CallNum: ��20��ASCII��
    //CheckSum: Byte; //У��
  end;
  PCmdSrvDevDownListenCallNum = ^TCmdSrvDevDownListenCallNum;
  {�����ظ�ͨ������Ӧ��}
  //����->����������ͨ������
  TCmdSrcDevGenericCommand = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    //MinorCmdFlag : Byte; //��������
    //��������
    //CheckSum:Byte;//У��
  end;
  PCmdSrcDevGenericCommand = ^TCmdSrcDevGenericCommand;
  {�����ظ�ͨ������Ӧ��}

  //�����·�һ������վ����Ϣ  DEV_DOWNABUSSTATIONINFO= $26;
  TCmdSrvDevDownABusStationInfo = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    BusStationId: Byte;
    //BusStationInfo
    //CheckSum:Byte;//У��
  end;
  PCmdSrvDevDownABusStationInfo = ^TCmdSrvDevDownABusStationInfo;
  {�����ظ�ͨ������Ӧ��}
  //�����·�һ���������վ����Ϣ����  DEV_CLEARBUSSTATIONINFO = $27;
  TCmdSrvDevClearABusStationInfo = packed record
    Size: Word;
    DevFactory: Byte; //��������
    DevId: integer;
    ComVer: Byte; //Э��汾
    CmdOrder: Word; //�������
    CmdFlag: Byte; //������
    CheckSum: Byte; //У��
  end;
  PCmdSrvDevClearABusStationInfo = ^TCmdSrvDevClearABusStationInfo;
  {�����ظ�ͨ��Ӧ��}
  {*******************2006-5-30 ����WEB�����������ص�ͨѶЭ��********}
  //Web����������������� ͨ������ͷ
  TCmdWebSrvHeader = packed record
    Header: Word; //Э��ͷ���̶�Ϊ$FF FF
    Size: Word; //�ܳ���
    DevId: integer; //ȥ����һ������1��SIM������
    ComVer: Byte; //Э��汾��=2
    CmdOrder: Word; //�������
    CmdFlag: Byte;
    //���� ���ݣ�������Ȳ���
    //CheckSum
  end;
  PCmdWebSrvHeader = ^TCmdWebSrvHeader;

  //����ת������GPS���ݸ�WEB������  WEB_SRVTRANSGPSDATA
  TCmdSrvWebTransGpsData = packed record
    Header: Word; //Э��ͷ���̶�Ϊ$FF FF
    Size: Word; //�ܳ���
    DevId: integer; //ȥ����һ������1��SIM������
    ComVer: Byte; //Э��汾��=2
    CmdOrder: Word; //�������
    CmdFlag: Byte; //WEB_SRVTRANSGPSDATA
    Latitude: integer; //γ�� X 100 0000 ��: ֵ32123456��ʾ��32.123456��
    Longitude: integer; //���� X 100 0000
    Speed: Byte; //�ٶȡ���λ������/Сʱ����ʾ��Χ0��255
    Orientation: Byte; //������������Ϊ0�ȣ�˳ʱ�����ӣ���λ��2�ȣ���ֵ��Χ0��180��
    State: Longword; //32λ״̬λ
    GpsTime: array[0..5] of Byte; // GPSʱ��
    CheckSum: Byte; //У��λ
  end;
  PCmdSrvWebTransGpsData = ^TCmdSrvWebTransGpsData;

  {WEB������ ��ѯ��������Ķ�λ���� WEB_GETLASTPOS}
  TCmdWebSrvGetLastPos = packed record
    Header: Word; //Э��ͷ���̶�Ϊ$FF FF
    Size: Word; //�ܳ���
    DevId: integer; //ȥ����һ������1��SIM������
    ComVer: Byte; //Э��汾��=2
    CmdOrder: Word; //�������
    CmdFlag: Byte; //WEB_GETLASTPOS
    CheckSum: Byte; //У��λ
  end;
  PCmdWebSrvGetLastPos = ^TCmdWebSrvGetLastPos;
  {���ػظ�WEB������}
  TCmdSrvWebGetLastPos = packed record
    Header: Word; //Э��ͷ���̶�Ϊ$FF FF
    Size: Word; //�ܳ���
    DevId: integer; //ȥ����һ������1��SIM������
    ComVer: Byte; //Э��汾��=2
    Answer_CmdOrder: Word; //�ظ������� ���
    Answer_CmdFlag: Byte; //�ظ���������   = WEB_GETLASTPOS
    Answer_Ret: Byte; //�ظ�ִ�н��  0-ִ�гɹ���1-��Ч�ĳ���ID
    Latitude: integer; //γ�� X 100 0000 ��: ֵ32123456��ʾ��32.123456��
    Longitude: integer; //���� X 100 0000
    Speed: Byte; //�ٶȡ���λ������/Сʱ����ʾ��Χ0��255
    Orientation: Byte; //������������Ϊ0�ȣ�˳ʱ�����ӣ���λ��2�ȣ���ֵ��Χ0��180��
    State: Longword; //32λ״̬λ
    GpsTime: array[0..5] of Byte; // GPSʱ��
    CheckSum: Byte; //У��λ
  end;
  PCmdSrvWebGetLastPos = ^TCmdSrvWebGetLastPos;

  { WEB������ ���Ͷ��Ͷϵ� WEB_CUTORFEED_OIL_ELECTRICITY  = $D1; }
  TCmdWebSrvCutOrFeedOilElectricity = packed record
    Header: Word; //Э��ͷ���̶�Ϊ$FF FF
    Size: Word; //�ܳ���
    DevId: integer; //ȥ����һ������1��SIM������
    ComVer: Byte; //Э��汾��=2
    CmdOrder: Word; //�������
    CmdFlag: Byte; //WEB_CUTORFEED_OIL_ELECTRICITY
    Content: Word; //��������1 -����  2-�ϵ� 3-���� 4-����
    CheckSum: Byte; //У��λ
  end;
  PCmdWebSrvCutOrFeedOilElectricity = ^TCmdWebSrvCutOrFeedOilElectricity;
  {�����յ�������Ӧ��󣬻ظ�WEB������}
  TCmdSrvWebCutOrFeedOilElectricity = packed record
    Header: Word; //Э��ͷ���̶�Ϊ$FF FF
    Size: Word; //�ܳ���
    DevId: integer; //ȥ����һ������1��SIM������
    ComVer: Byte; //Э��汾��=2
    Answer_CmdOrder: Word; //�ظ����������
    Answer_CmdFlag: Byte; //�ظ��������� =WEB_CUTORFEED_OIL_ELECTRICITY
    Answer_Ret: Byte; //	0-ִ�гɹ���1-��Ч�ĳ���ID��2-ִ�г�ʱ
    CheckSum: Byte; //У��λ
  end;
  PCmdSrvWebCutOrFeedOilElectricity = ^TCmdSrvWebCutOrFeedOilElectricity;

  (************* ϵͳ�����ADM �� ����SRV ֮�� 2006-8-22 ����*************)
  //ϵͳ�����->���� ȡ���û��б�  ADMSRV_GETUSERLIST  = $70;
  TCmdAdmSrvGetUserList = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
  end;
  PCmdAdmSrvGetUserList = ^TCmdAdmSrvGetUserList;
  TLogUserInfo = packed record //��¼��ض��û���Ϣ
    UserID: integer;
    LogTime: TDateTime;
    IPAddr: string[15];
  end;
  PLogUserInfo = ^TLogUserInfo;
   // ���ػظ� SRVADM_GETUSERLIST  = $E0;
  TCmdSrvAdmGetUserList = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    UserCnt: integer; //��ǰ�û�����
    //UserList-- array of TLogUserInfo
    //Ret : Byte;
  end;
  PCmdSrvAdmGetUserList = ^TCmdSrvAdmGetUserList;

  //ϵͳ�����->���� �Ͽ�ĳ���û� ADMSRV_CUTAUSER     = $71;
  TCmdAdmSrvCutAUser = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    UserID: integer;
  end;
  PCmdAdmSrvCutAUser = ^TCmdAdmSrvCutAUser;
  // ���ػظ� SRVADM_CUTAUSER    = $E2
  TCmdSrvAdmCutAUser = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    UserID: integer;
    Ret: Byte; // �ظ�
  end;
  PCmdSrvAdmCutAUser = ^TCmdSrvAdmCutAUser;
  //����->��ض�  ϵͳ������ü�ض� �ر�����  SRVTERM_CUTSELF    = $B3;���
  TCmdSrvTermCutSelf = packed record
    Size: Word;
    Flag: Byte;
  end;
  PCmdSrvTermCutSelf = ^TCmdSrvTermCutSelf;

  //ϵͳ�����->����  ������Ϣ��ĳ���û� ADMSRV_SENDMSG2AUSER= $72
  TCmdAdmSrvSendMsg2AUser = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    UserID: integer;
    //msgInfo:string;
  end;
  PCmdAdmSrvSendMsg2AUser = ^TCmdAdmSrvSendMsg2AUser;
  //���ػظ� SRVADM_SENDMSG2AUSER= $E3;
  TCmdSrvAdmSendMsg2AUser = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    UserID: integer;
    Ret: Byte;
  end;
  PCmdSrvAdmSendMsg2AUser = ^TCmdSrvAdmSendMsg2AUser;
  //����->��ض� ϵͳ����� ������Ϣ SRVTERM_ADMSENDMSG = $B4���
  TCmdSrvTermAdmSendMsg = packed record
    Size: Word;
    Flag: Byte;
    //msgInfo:string;
  end;
  PCmdSrvTermAdmSendMsg = ^TCmdSrvTermAdmSendMsg;

  //����->����� �û��б仯SRVADM_USERCHG  = $E4;
  TCmdSrvAdmUserChg = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    UserID: integer;
    LogFlag: Byte; //0-�˳� 1-��¼
    LogUserInfo: TLogUserInfo;
  end;
  PCmdSrvAdmUserChg = ^TCmdSrvAdmUserChg;

{****************************  ��������ṹ����   *****************************}
  //���ظ�֪webService�����ݿ���ˢ�£������û����ձ����иı䣩
  TCmdSrvTermTellDbRefresh = packed record
    Size: word;
    Flag: Byte;
  end;

  (*****************���ȷ��������롡���ص�ͨѶ��2006-11-17 SHA**** 20070709 sha.��ӵ���������ϳɴ���2�ֶ���*****)
  {����->���أ��·�һ������,�����ĵ�һ���·� DISPSRVFIRSTDOWNAORDER = $40}
  TCmdDispSrvFirstDownAOrder = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    OrderID: integer; //����ID �������<->���ز��õ���Integer; ����<->��������Word
    OrderType: Byte; //��������
    OrderDateTime: TDateTime; //�������ڡ�ʱ�� --����Ҫ������ʱ���10����
    CallNum: Byte; //Ҫ������
    OverTimes: integer; //��ʱʱ�� ��λ����
    SendToDevCnt: Byte; //�·������ٸ�����
    FirstDevId: integer; //��һ�������ģɣĺ�
    //�������ݳ���     1
    //��������         <200  ASCII��
    //�˿͵绰����     1
    //�˿͵绰��             ASCII��
    //������ϸ���ݳ��� 1
    //������ϸ����     <200  ASCII��
  end;
  PCmdDispSrvFirstDownAOrder = ^TCmdDispSrvFirstDownAOrder;
  {���ػظ�}
  TCmdSrvDispFirstDownAOrder = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    OrderID: integer; //����ID
    Ret: Byte;
  end;
  PCmdSrvDispFirstDownAOrder = ^TCmdSrvDispFirstDownAOrder;

  {����->���أ������ķǳ����·�����ʱ���·�����һ������DISPSRVNEXTDOWNAORDER = $41;}
  TCmdDispSrvNextDownAOrder = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    OrderID: integer; //����ID
    NextDevId: integer; // ��һ������ID
  end;
  PCmdDispSrvNextDownAOrder = ^TCmdDispSrvNextDownAOrder;
  TCmdSrvDispNextDownAOrder = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    OrderID: integer; //����ID
    Ret: Byte;
  end;
  PCmdSrvDispNextDownAOrder = ^TCmdSrvDispNextDownAOrder;

  {����->���ȷ���������ʱû������}
  TCmdSrvDispOrderNoDevGrab = packed record
    Size: Word;
    Flag: Byte;
    OrderID: integer; //����ID
  end;
  PCmdSrvDispOrderNoDevGrab = ^TCmdSrvDispOrderNoDevGrab;

  {����->���ȷ��������������ĳ����б��������ɹ��ĳ����б� SRVDISPGRABDEVSANDGRABOKDEVS= $62;}
  TCmdSrvDispGrabDevsAndGrabOkDevs = packed record
    Size: Word;
    Flag: Byte;
    OrderID: integer; //����ID
    CallNum: Byte;
    GrabDevCnt: Byte; //�������ĳ�����
    GrabOkDevCnt: Byte; //�����ɹ��ĳ�����
    //GrabDevList   ��//�������ġ� ����ID(Integer)�б�
    //GrabOkDevList   //�����ɹ��� ����ID(Integer)�б�
  end;
  PCmdSrvDispGrabDevsAndGrabOkDevs = ^TCmdSrvDispGrabDevsAndGrabOkDevs;

  {����->���� �������SRVDISPDEVDONEORDER = $63; }
  TCmdSrvDispDevDoneOrder = packed record
    Size: Word;
    Flag: Byte;
    OrderID: integer; //����ID
    DoneDevId: integer; //��ɶ����ĳ���ID
  end;
  PCmdSrvDispDevDoneOrder = ^TCmdSrvDispDevDoneOrder;

  {����->���ȡ�˾��ȡ������������ԭ���Ľṹ��ͬ�������ƵĶ��岻һ��SRVDISPDEVCANCELORDER = $64;}
  TCmdSrvDispDevCancelOrder = packed record
    Size: Word;
    Flag: Byte;
    OrderID: integer;
    AskCancelDevId: integer; //����ȡ�������ġ������ɣ�
    CancelMenuID: Byte; //ȡ�������Ĳ˵�ID
  end;
  PCmdSrvDispDevCancelOrder = ^TCmdSrvDispDevCancelOrder;

  {����->���ء�����ȡ��ĳ���Ķ��� DISPSRVCANCELADEVORDER = $45;}
  TCmdDispSrvCancelADevOrder = packed record
    Size: Word;
    Flag: Byte;
    OrderID: integer;
    CancelDevId: integer; //����ȡ���ĳ��� ID
  end;
  PCmdDispSrvCancelADevOrder = ^TCmdDispSrvCancelADevOrder;
  {���صĻظ���SRVDISPRETCANCELADEVORDER = $65;}
  TCmdSrvDispRetCancelADevOrder = packed record
    Size: Word;
    Flag: Byte;
    OrderID: integer;
    CancelDevId: integer; //����ȡ���ĳ���
    Ret: Byte; //0-����ִ�гɹ�  1-�˶���������
  end;
  PCmdSrvDispRetCancelADevOrder = ^TCmdSrvDispRetCancelADevOrder;

  {����->���� �û��������ձ��иı�  SRVDISPUSERDEVCHANGED     = $66; }
  TCmdSrvDispUserDevChanged = packed record
    Size: Word;
    Flag: Byte;
  end;
  PCmdSrvDispUserDevChanged = ^TCmdSrvDispUserDevChanged;

  {����->���ء������ı����ȣ�������MsgId������ר��DISPSRVSENDCONTROLINFO    = $47;}
  TCmdDispSrvSendControlInfo = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    //��MsgID: Word;   //������ϢID�������ݿ���ȡֵ
    //������Ϣ ������ ��<200Byte
  end;
  PCmdDispSrvSendControlInfo = ^TCmdDispSrvSendControlInfo;
  {���ػظ�}
  TCmdSrvDispSendControlInfo = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer;
    //��MsgID: Word;   //������ϢID�������ݿ���ȡֵ
    Ret: Byte;
  end;
  PCmdSrvDispSendControlInfo = ^TCmdSrvDispSendControlInfo;

  //����->���أ��·�һ������  DISPSRV_DOWNAORDER = $49; ����ֻ���·����������ڴ�
  TCmdDispSrvDownAOrder = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer; // Ҫ�·��ĳ���ID
    OrderID: integer; //����ID
    OrderType: Byte; //��������
    OrderDate_yy: Byte; //�������� 3�ֽ�-��   ȫ��ʮ�����Ʊ�ʾ
    OrderDate_mm: Byte; //              -��        ��:12����ʾΪ0C
    OrderDate_dd: Byte; //              -��
    OrderTime_hh: Byte; //����ʱ�� 2�ֽ�-ʱ
    OrderTime_nn: Byte; //              -��
    //��������  <200
  end;
  PCmdDispSrvDownAOrder = ^TCmdDispSrvDownAOrder;
   //   ���ػظ���ֻ���޴˳���ʱ�ظ���SRVDISP_DOWNAORDER = $69
  TCmdSrvDispDownAOrder = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer; // Ҫ�·��ĳ���ID
    OrderID: integer; //����ID
    Ret: Byte; //�޴˳��� ERR_INVALIDDEV=$13;
  end;
  PCmdSrvDispDownAOrder = ^TCmdSrvDispDownAOrder;

  // ����->���ȡ���������   SRVDISP_DEVGRABORDER = $6A;
  TCmdSrvDispDevGrabOrder = packed record
    Size: Word;
    Flag: Byte;
    DevId: integer; //����ID
    OrderID: integer; //����ID
  end;
  PCmdSrvDispDevGrabOrder = ^TCmdSrvDispDevGrabOrder;

   // ����->���أ��������·������ɹ�DISPSRV_DOWNGRABOK  = $4B;
  TCmdDispSrvDownGrabOk = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer; //����ID
    OrderID: integer; //����ID
    GuestTelLen: Byte; //�û��绰��λ��
    //�û��ĵ绰	-	�绰�������ASCII���ʾ��
    //������ϸ����	<200
  end;
  PCmdDispSrvDownGrabOk = ^TCmdDispSrvDownGrabOk;
  //   ���ػظ� ���޴˳������յ��������·������ɹ���Ӧ���·������ɹ���������ʱ)  SRVDISP_DOWNGRABOK  = $6B
  TCmdSrvDispDownGrabOk = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer; //����ID
    OrderID: integer; //����ID
    Ret: Byte; //�յ��������·������ɹ���Ӧ��RET_OK=0��
                         //�޴˳��� ERR_INVALIDDEV=$13;
                         //�·������ɹ���������ʱ(����ִ�г�ʱʧ��ERR_TIMEOUT=$16;)
  end;
  PCmdSrvDispDownGrabOk = ^TCmdSrvDispDownGrabOk;

  //����->���أ��������·�����ʧ��   DISPSRV_DOWNGRABFAIL = $4C;
  TCmdDispSrvDownGrabFail = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer; //����ID
    OrderID: integer; //����ID
  end;
  PCmdDispSrvDownGrabFail = ^TCmdDispSrvDownGrabFail;
  // ���ػظ���ֻ���޴˳��������������·��ĳ�ʱ������SRVDISP_DOWNGRABFAIL = $6C;
  TCmdSrvDispDownGrabFail = packed record
    Size: Word;
    Flag: Byte;
    CmdId: integer;
    DevId: integer; //����ID
    OrderID: integer; //����ID
    Ret: Byte; //�޴˳��� ERR_INVALIDDEV=$13;
  end;
  PCmdSrvDispDownGrabFail = ^TCmdSrvDispDownGrabFail;


{*******************************ҵ��������Ϳͻ��˽ṹ����********************************}
  TMyPhoto = packed record
    Size: integer;
    PhotoReasonID: integer; //����ԭ��
    GpsTime: TDateTime; //GPSʱ��
    Longitude: Double; //����
    Latitude: Double; //γ��
    TakeBeginTime: TDateTime; //���տ�ʼʱ��
    TkeEndTime: TDateTime; //���ս���ʱ��
    PhotoSize: integer; //��Ƭ��С
    PhotoType: integer; //��Ƭ����
    PicIndex: integer; //��Ƭ���
    PhotoMeasure: integer; //��Ƭ�ߴ�
    CameraIndex: Byte;
    //Photo:TByteDynArray;     //��Ƭ����,��������С
  end;
  PMyPhoto = ^TMyPhoto;


//------------------------------------------------------------------------------
  TCmdSrvTermAreaAlarm_V3 = packed record
    Header: THead_V3;
    AreaNo: Integer;//Χ�����
    AlarmType: Byte;//0�������򱨾� 1�������򱨾� 2��·�߱���3���ۼ����� 4��������̨ 5�������Ϸ�
    //�����豸�����	BCD[5]*N
  end;
  PCmdSrvTermAreaAlarm_V3 = ^TCmdSrvTermAreaAlarm_V3;

  //͸�������ͷ
  TCmdTSPHead_V3 = packed record
    //SPosFlag:  Byte;//��ʼλ��ʶ 0x7E
    CmdFlag: Word;
    CmdProperty: Word;
    DevId: TDEV_ID_BCD_ZDCL;
    CmdSNo: Word;
    //��Ϣ��װ�� ��Ϣ����������ر�ʶλȷ����Ϣ�ְ����� �����������(Ŀǰϵͳ���ݲ����ְ�����)
  end;
  PCmdTSPTHead_V3 = ^TCmdTSPHead_V3;

  //͸�������ͷ
  TCmdTSPTHeadHRB_V3 = packed record
    SPosFlag:  Word;//��ʼλ��ʶ 0x7E
    CmdFlag: Word;
    CmdProperty: Word;
    CmdSNo: Word;
    Ver: Byte;
    DevId: TDEV_ID_BCD_HRB;
    //��Ϣ��װ�� ��Ϣ����������ر�ʶλȷ����Ϣ�ְ����� �����������(Ŀǰϵͳ���ݲ����ְ�����)
  end;
  PCmdTSPTHeadHRB_V3 = ^TCmdTSPTHeadHRB_V3;

  TCmdTSPSetDevParam_V3 = packed record
    TSPHeader: TCmdTSPHead_V3;
    ParamCnt :Byte;  //��������	UINT8
//    ParamPackCnt:Byte;//����������	UINT8
    //�������б�:
    ParamId: LongWord;
    ParamSize: Byte;
  end;
  PCmdTSPSetDevParam_V3 = ^TCmdTSPSetDevParam_V3;

  TCmdTSPSetAllDevParam_V3 = packed record
    TSPHeader: TCmdTSPHead_V3;
    ParamCnt :Byte;  //��������	UINT8
    //�������б�:
    //ParamId: LongWord;
    //ParamSize: Byte;
  end;
  PCmdTSPSetAllDevParam_V3 = ^TCmdTSPSetAllDevParam_V3;

  TCmdTSPReadDevParam_V3 = packed record
    TSPHeader: TCmdTSPHead_V3;
//    ParamId: Word;
  end;
  PCmdTSPReadDevParam_V3 = ^TCmdTSPReadDevParam_V3;

  TCmdSrvTermTSPReadDevParam_V3 = packed record
    TSPHeader: TCmdTSPHead_V3;
    RespCmdSNo: Word;//Ӧ����ˮ��
    ParamPackCnt: Byte;
//    ParamId: LongWord;
//    ParamSize: Byte;
  end;
  PCmdSrvTermTSPReadDevParam_V3 = ^TCmdSrvTermTSPReadDevParam_V3;

  TCmdSrvTermGpsDataTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    WarningSign: LongWord;  // ������־
    State: Longword; //32λ״̬λ
    Latitude: LongWord; //γ�� X 100 0000 ��: ֵ32123456��ʾ��32.123456��
    Longitude: LongWord; //���� X 100 0000
    Altitude:word;//sjp zdcl.20110602      ���θ߶ȣ���λΪ�ף�m��
    Speed: Word; //�ٶȡ���λ������/Сʱ
    Orientation: Word; //������������Ϊ0�ȣ�˳ʱ�����ӣ���λ��2�ȣ���ֵ��Χ0��178��
    GpsTime: array[0..5] of Byte; // GPSʱ��
  end;
  PCmdSrvTermGpsDataTSP_V3 = ^TCmdSrvTermGpsDataTSP_V3;

  TDevGpsData_V3 = packed record
    DevIdBCD: TDEV_ID_BCD_ZDCL;
    GpsData: TCmdSrvTermGpsDataTSP_V3;
  end;

  TDevIDGpsDataArray = array of TDevGpsData_V3;

  TCmdSrvTermGpsDataTSPHRB_V3 = packed record
    Header: TCmdTSPHead_V3;
    WarningSign: LongWord;  // ������־
    State: Longword; //32λ״̬λ
    Latitude: integer; //γ�� X 100 0000 ��: ֵ32123456��ʾ��32.123456��
    Longitude: integer; //���� X 100 0000
    Altitude:word;//sjp zdcl.20110602      ���θ߶ȣ���λΪ�ף�m��
    Speed: Word; //�ٶȡ���λ������/Сʱ
    Orientation: Byte; //������������Ϊ0�ȣ�˳ʱ�����ӣ���λ��2�ȣ���ֵ��Χ0��178��
    GpsTime: array[0..5] of Byte; // GPSʱ��
  end;
  PCmdSrvTermGpsDataTSPHRB_V3 = ^TCmdSrvTermGpsDataTSPHRB_V3;

  TCmdTermSrvSendControlInfoHRB_V3 = packed record
    Header: TCmdTSPTHeadHRB_V3;
    ControlCmd:Byte; // ��־
    //������Ϣ ������ ��<=499Byte
  end;
  PCmdTermSrvSendControlInfoHRB_V3 = ^TCmdTermSrvSendControlInfoHRB_V3;

  {�ն˿��� TERMSRV_CONTROLTERMINAL_V3}
  TCmdTermSrvControlTerminalTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    ControlID: Byte;  //����������	BYTE
    //�����������	STRING     
  end;
  PCmdTermSrvControlTerminalTSP_V3 = ^TCmdTermSrvControlTerminalTSP_V3;

  TCmdTermSrvFindPostionTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
  end;
  PCmdTermSrvFindPostionTSP_V3 = ^TCmdTermSrvFindPostionTSP_V3;

  TCmdTermSrvPursueCarTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    Interval: Word;
    Duration: LongWord;
  end;
  PCmdTermSrvPursueCarTSP_V3 = ^TCmdTermSrvPursueCarTSP_V3;

  TCmdTermSrvSendControlInfoTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    ControlCmd:Byte; // ��־
    //������Ϣ ������ ��<=499Byte
  end;
  PCmdTermSrvSendControlInfoTSP_V3 = ^TCmdTermSrvSendControlInfoTSP_V3;

  TCmdTermSrvSetEventListTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    EventType: Byte;
    //EventCount: Byte;
    //EventPackCount: Byte;
    //�¼����б�
  end;
  PCmdTermSrvSetEventListTSP_V3 = ^TCmdTermSrvSetEventListTSP_V3;

  TCmdSrvTermEventUploadTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    EventId: Byte;
  end;
  PCmdSrvTermEventUploadTSP_V3 = ^TCmdSrvTermEventUploadTSP_V3;

  TCmdTermSrvSetAnswerListTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    Flag: Byte;
    QuestionLen: Byte;
    //��������
    //��ѡ���б�
  end;
  PCmdTermSrvSetAnswerListTSP_V3 = ^TCmdTermSrvSetAnswerListTSP_V3;

  TCmdSrvTermQuestionAnswerTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    RespCmdSNo: Word;//Ӧ����ˮ��
    AnswerId: Byte;
  end;
  PCmdSrvTermQuestionAnswerTSP_V3 = ^TCmdSrvTermQuestionAnswerTSP_V3;

  TCmdTermSrvSetInfoMenuTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    SetType: Byte;
//    InfoCount: Byte;
//    PackCount: Byte;
    //��Ϣ���б�
  end;
  PCmdTermSrvSetInfoMenuTSP_V3 = ^TCmdTermSrvSetInfoMenuTSP_V3;

  TCmdSrvTermInfoMenuTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    InfoType: Byte; //��Ϣ����
    SelOrQuit: Byte;//�㲥ȡ����־ 0��ȡ�� 1���㲥
  end;
  PCmdSrvTermInfoMenuTSP_V3 = ^TCmdSrvTermInfoMenuTSP_V3;

  TCmdTermSrvSendInfoTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    InfoType: Byte;
    InfoLen: Word;
//    PackCount: Byte;
    //��Ϣ����
  end;
  PCmdTermSrvSendInfoTSP_V3 = ^TCmdTermSrvSendInfoTSP_V3;

  TCmdTermSrvCallBackTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    Flag: Byte;//��־  0:��ͨ�绰 1������
    //�绰����  �20���ֽ�
  end;
  PCmdTermSrvCallBackTSP_V3 = ^TCmdTermSrvCallBackTSP_V3;

  TCmdTermSrvSetPhoneBookTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    SetType: Byte;
//    PhoneCount: Byte;
//    PackCount: Byte;
    //��ϵ����
  end;
  PCmdTermSrvSetPhoneBookTSP_V3 = ^TCmdTermSrvSetPhoneBookTSP_V3;

  TCmdTermSrvDevControlTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    ControlCmd: Byte;
  end;
  PCmdTermSrvDevControlTSP_V3 = ^TCmdTermSrvDevControlTSP_V3;

  TCmdSrvTermDevControlTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    CmdSNo: Word;
    WarningSign: LongWord;  // ������־
    State: Longword; //32λ״̬λ
    Latitude: integer; //γ�� X 100 0000 ��: ֵ32123456��ʾ��32.123456��
    Longitude: integer; //���� X 100 0000
    Altitude:word;//sjp zdcl.20110602      ���θ߶ȣ���λΪ�ף�m��
    Speed: Word; //�ٶȡ���λ������/Сʱ
    Orientation: Word; //������������Ϊ0�ȣ�˳ʱ�����ӣ���λ��2�ȣ���ֵ��Χ0��178��
    GpsTime: array[0..5] of Byte; // GPSʱ��
  end;
  PCmdSrvTermDevControlTSP_V3 = ^TCmdSrvTermDevControlTSP_V3;

  TCmdSrvTermFindPosTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    CmdSNo: Word;
    WarningSign: LongWord;  // ������־
    State: Longword; //32λ״̬λ
    Latitude: integer; //γ�� X 100 0000 ��: ֵ32123456��ʾ��32.123456��
    Longitude: integer; //���� X 100 0000
    Altitude:word;//sjp zdcl.20110602      ���θ߶ȣ���λΪ�ף�m��
    Speed: Word; //�ٶȡ���λ������/Сʱ
    Orientation: Word; //������������Ϊ0�ȣ�˳ʱ�����ӣ���λ��2�ȣ���ֵ��Χ0��178��
    GpsTime: array[0..5] of Byte; // GPSʱ��
  end;
  PCmdSrvTermFindPosTSP_V3 = ^TCmdSrvTermFindPosTSP_V3;

  TCmdSrvTermRunRecDataTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    RespCmdNo: Word;
    RunRecFlag: Byte;//��ʻ��¼����������
    //��ʻ��¼��������
  end;
  PCmdSrvTermRunRecDataTSP_V3 = ^TCmdSrvTermRunRecDataTSP_V3;

  TERunDataUpload = record
    devId: string;
    carNo: string;
    ERunData: string;
  end;

  TCmdSrvTermERunDataTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    ERunDataLen: LongWord;//�����˵�����
    //�����˵�����
  end;
  PCmdSrvTermERunDataTSP_V3 = ^TCmdSrvTermERunDataTSP_V3;

  TDriverInfoUpload = record
    DevId: string;
    CarNo: string;
    DriverName: string;
    DriverIDNo: String;
    DriverServiceNo: String;
    AgencyName: String;
  end;

  TDriverLogInfo = record
    DriverInfo: TDriverInfoUpload;
    LogType: Byte;//0ǩ�� 1ǩ��
    GpsTime: TDateTime;
    Longitude: Double;
    Latitude: Double;
  end;

  RecMediaEventUpload = record
    DevId: string;
    CarNo: string;
    MediaDataId: LongWord;
    MediaType: Byte;
    MediaDataFormat: Byte;
    MediaEventId: Byte;
    MediaChannelId: Byte;
  end;

  RecSrvRunInfo = packed record
    SrvType: Byte;          //����������
    SrvRunTime: LongWord;   //����ʱ��
    SrvRunStatus: Byte;     //����״̬
    SrvCPUPercent: LongWord;//CPUռ����
    SrvTotalMem: LongWord;  //�ڴ��С
    SrvMemInUse: LongWord;  //ʹ���ڴ�
    SrvMemPercent: LongWord;//�ڴ�ʹ����
  end;

  TCmdSrvTermDriverInfoTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    DriverNameLen: Byte;
    //��ʻԱ����
    //��ʻԱ���֤����  20λ
    //��ҵ�ʸ�֤����    40λ
    //��֤�������Ƴ���
    //��֤��������
  end;
  PCmdSrvTermDriverInfoTSP_V3 = ^TCmdSrvTermDriverInfoTSP_V3;

  TCmdSrvTermMediaEventUploadTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    MediaDataId: LongWord;
    MediaType: Byte;
    MediaFormat: Byte;
    MediaEventId: Byte;
    MediaChannelId: Byte;
  end;
  PCmdSrvTermMediaEventUploadTSP_V3 = ^TCmdSrvTermMediaEventUploadTSP_V3;

  TCmdTermSrvRecordTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    RecFlag: Byte; //0:ֹͣ¼�� 1����ʼ¼��
    RecTime: Word; //¼��ʱ��
    RecSaveFlag: Byte;//¼�������־  0��ʵʱ�ϴ� 1������
    RecSRate: Byte;//0:8k 1:11k 2:23k 3:32k 
  end;
  PCmdTermSrvRecordTSP_V3 = ^TCmdTermSrvRecordTSP_V3;

  TCmdTermSrvTSPDataTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    TSPDataType: Byte;
//    TSPDataLen: LongWord;
//    PackLen: Word;
    //͸����������
  end;
  PCmdTermSrvTSPDataTSP_V3 = ^TCmdTermSrvTSPDataTSP_V3;

  TCmdSrvTermTSPDataTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    TSPDataType: Byte;
//    TSPDataLen: LongWord;
//    PackLen: Word;
    //͸����������
  end;
  PCmdSrvTermTSPDataTSP_V3 = ^TCmdSrvTermTSPDataTSP_V3;

  TCmdSrvTermCompressedDataTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    CompressedDataLen: LongWord;
    //ѹ����������
  end;
  PCmdSrvTermCompressedDataTSP_V3 = ^TCmdSrvTermCompressedDataTSP_V3;

  TCmdTermSrvTakeAPhotoTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    CameraIndex: Byte; //����ͷ��
    CameraCmd: Word;  // ��������
    PZSJJG: Word;   // ����ʱ����
    SaveSign: Byte; // �����־
    GetPicSize: Byte; //��Ƭ�ߴ��С 0=320x240  1=640x480  2-else
    TXZL: Byte; // ͼ������
    LD: Byte;   // ����
    DBD: Byte;  // �Աȶ�
    BHD: Byte;  // ���Ͷ�
    SD: Byte;   // ɫ��
  end;
  PCmdTermSrvTakeAPhotoTSP_V3 = ^TCmdTermSrvTakeAPhotoTSP_V3;

  TCmdTermSrvQueryMediaTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    MediaType: Byte;//��ý������  0:ͼ�� 1:��Ƶ 2:��Ƶ
    CameraIndex: Byte;//ͨ��ID(����ͷ���)
    Reason: Byte;//�¼������(ԭ��)
    SDatetime: array[0..5] of Byte;
    EDatetime: array[0..5] of Byte;
  end;
  PCmdTermSrvQueryMediaTSP_V3 = ^TCmdTermSrvQueryMediaTSP_V3;

  TCmdSrvTermQueryMediaTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    RespCmdNo: Word;//Ӧ����ˮ��
    MediaDataCount: Word;//��ý������������
    //PackCount: Word;//������
    //������
  end;
  PCmdSrvTermQueryMediaTSP_V3 = ^TCmdSrvTermQueryMediaTSP_V3;

  TCmdSrvTermQueryMediaMPTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    TotalPackCount: Word;
    CurrPackCount: Word;
    RespCmdNo: Word;//Ӧ����ˮ��
    MediaDataCount: Word;//��ý������������
    //PackCount: Word;//������
    //������
  end;
  PCmdSrvTermQueryMediaMPTSP_V3 = ^TCmdSrvTermQueryMediaMPTSP_V3;

  TMediaDataUpload_V3 = packed record
    MediaId: LongWord;//��ý��ID 2011-10-09 808�����ĵ�
    MediaType: Byte;
    MediaChannel: Byte;
    Reason: Byte;
    WarningSign: LongWord;  // ������־
    State: Longword; //32λ״̬λ
    Latitude: Longword; //γ�� X 100 0000 ��: ֵ32123456��ʾ��32.123456��
    Longitude: Longword; //���� X 100 0000
    Altitude:word;//sjp zdcl.20110602      ���θ߶ȣ���λΪ�ף�m��
    Speed: Word; //�ٶȡ���λ������/Сʱ
    Orientation: Word; //������������Ϊ0�ȣ�˳ʱ�����ӣ���λ��2�ȣ���ֵ��Χ0��178��
    GpsTime: array[0..5] of Byte; // GPSʱ��
  end;
  PMediaDataUpload_V3 = ^TMediaDataUpload_V3;

  TCmdTermSrvUploadMediaDataTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    MediaType: Byte;
    MediaChannel: Byte;
    MediaReason: Byte;
    SDateTime: array[0..5] of Byte;
    EDateTime: array[0..5] of Byte;
    DelFlag: Byte;
  end;
  PCmdTermSrvUploadMediaDataTSP_V3 = ^TCmdTermSrvUploadMediaDataTSP_V3;

  TCmdTermSrvUploadMediaDataSingleTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    MediaId: LongWord;
    DelFlag: Byte;
  end;
  PCmdTermSrvUploadMediaDataSingleTSP_V3 = ^TCmdTermSrvUploadMediaDataSingleTSP_V3;

  //��ʻԱǩ�� 0x0B01    //��ʻԱǩ�� 0x0B02
  TCmdSrvTermDriverLoginTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    GpsTime: array[0..6] of Byte;
    Longitude: LongWord;
    Latitude: LongWord;
    DriverNameLen: Byte;
    //��ʻԱ����
    //��ʻԱ���֤����  20λ
    //��ҵ�ʸ�֤����    40λ
    //��֤�������Ƴ���
    //��֤��������
  end;
  PCmdSrvTermDriverLoginTSP_V3 = ^TCmdSrvTermDriverLoginTSP_V3;


  //���俪ʼ������ 0x0B03��0x0B04
  TCmdSrvTermTransportStartTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    GpsTime: array[0..6] of Byte;
    Longitude: Longword; //���� X 100 0000    
    Latitude: Longword; //γ�� X 100 0000 ��: ֵ32123456��ʾ��32.123456��
    //�˵���
  end;
  PCmdSrvTermTransportStartTSP_V3 = ^TCmdSrvTermTransportStartTSP_V3;

  TCircleAreaRec = packed record
    AreaId: LongWord;
    AreaProperty: Word;
    CenterLati: LongWord;
    CenterLong: LongWord;
    Radius: LongWord;   //�����ĸ��ֶο��п��� ����������ͬ
//    SDateTime: array[0..5] of Byte;
//    EDateTime: array[0..5] of Byte;
//    MaxSpeed: Word;
//    OverSpeedTime: Byte;
  end;
  PCircleAreaRec = ^TCircleAreaRec;

  TRectAreaRec = packed record
    AreaId: LongWord;
    AreaProperty: Word;
    LeftTopLati: LongWord;
    LeftTopLong: LongWord;
    RightBottomLati: LongWord;
    RightBottomLong: LongWord;
//    SDateTime: array[0..5] of Byte;
//    EDateTime: array[0..5] of Byte;
//    MaxSpeed: Word;
//    OverSpeedTime: Byte;
  end;
  PRectAreaRec = ^TRectAreaRec;

  TPolygonAreaRec = packed record
    AreaId: LongWord;
    AreaProperty: Word;
//    SDateTime: array[0..5] of Byte;
//    EDateTime: array[0..5] of Byte;
//    MaxSpeed: Word;
//    OverSpeedTime: Byte;
//    AreaPointCount: Word;
//    PackAreaPointCount: Word;
    //�㾭γ����Ϣ
  end;
  PPolygonAreaRec = ^TPolygonAreaRec;

  TPolyLineAreaRec = packed record
    LineNo: LongWord;
    LineProperty: Word;
//    SDateTime: array[0..5] of Byte;
//    EDateTime: array[0..5] of Byte;
//    AreaPointCount: Word;
//�յ�������
  end;
  PPolyLineAreaRec = ^TPolyLineAreaRec;

  //�˴���Ϊÿ��ֻ��һ������   Բ������
  TCmdTermSrvSetCircleAreaTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    SetType: Byte;
    AreaCount: Byte;
//    PackCount: Byte;
    CircleArea: TCircleAreaRec;
  end;
  PCmdTermSrvSetCircleAreaTSP_V3 = ^TCmdTermSrvSetCircleAreaTSP_V3;

  //�˴���Ϊÿ��ֻ��һ������  ��������
  TCmdTermSrvSetRectAreaTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    SetType: Byte;
    AreaCount: Byte;
//    PackCount: Byte;
    RectArea: TRectAreaRec;
  end;
  PCmdTermSrvSetRectAreaTSP_V3 = ^TCmdTermSrvSetRectAreaTSP_V3;

  //�˴���Ϊÿ��ֻ��һ������   �����
  TCmdTermSrvSetPolygonAreaTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    PolygonArea: TPolygonAreaRec;
  end;
  PCmdTermSrvSetPolygonAreaTSP_V3 = ^TCmdTermSrvSetPolygonAreaTSP_V3;

  //�˴���Ϊÿ��ֻ��һ������   ·��
  TCmdTermSrvSetPolyLineAreaTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    PolyLineArea: TPolyLineAreaRec;
  end;
  PCmdTermSrvSetPolyLineAreaTSP_V3 = ^TCmdTermSrvSetPolyLineAreaTSP_V3;

  TCmdTermSrvDelAreaTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    AreaCount: Byte;
  end;
  PCmdTermSrvDelAreaTSP_V3 = ^TCmdTermSrvDelAreaTSP_V3;

  //��ʻ��¼���ݲɼ�
  TCmdTermSrvCollectRunRecDataTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    Flag: Byte;
  end;
  PCmdTermSrvCollectRunRecDataTSP_V3 = ^TCmdTermSrvCollectRunRecDataTSP_V3;

//  ������ʻ��¼�ǲ���
  TCmdTermSrvSetRunRecParamTSP_V3 = packed record
    Header: TCmdTSPHead_V3;
    Flag: Byte;
//    ���ݿ�
  end;
  PCmdTermSrvSetRunRecParamTSP_V3 = ^TCmdTermSrvSetRunRecParamTSP_V3;

  //********************************��������********************************
  TCmdTermSrvUpgradeTerminalTSP_BD = packed record
    Header: TCmdTSPHead_V3;
    UpgradeType: Byte;
    MID: array[0..4] of Byte;
    VerLen: Byte;
    //Ver: string;
    //ʣ��������������ǰ����䣬��ض˷��͸�����ʱ���Ը�����
  end;
  PCmdTermSrvUpgradeTerminalTSP_BD = ^TCmdTermSrvUpgradeTerminalTSP_BD;

  TCmdSrvTermUpgradeTerminalRetTSP_BD = packed record
    Header: TCmdTSPHead_V3;
    UpgradeType: Byte;//��������  0���նˣ�12����·����֤ IC ����������52���������Ƕ�λģ�顣
    UpgradeRet: Byte;//�������	BYTE	0���ɹ���1��ʧ�ܣ�2��ȡ��
  end;
  PCmdSrvTermUpgradeTerminalRetTSP_BD = ^TCmdSrvTermUpgradeTerminalRetTSP_BD;

  TCmdTermSrvReadParamSpecTSP_BD = packed record
    Header: TCmdTSPHead_V3;
    ParamCount: Byte;
  end;
  PCmdTermSrvReadParamSpecTSP_BD = ^TCmdTermSrvReadParamSpecTSP_BD;
  //********************************��������********************************

  //͸������
  TCmdTSP_V3 = packed record
    Header: THead_V3;
    //͸��������
  end;
  PCmdTSP_V3 = ^TCmdTSP_V3;

  //͸������
  TCmdTSPHRB_V3 = packed record
    Header: THeadHRB_V3;
    //͸��������
  end;
  PCmdTSPHRB_V3 = ^TCmdTSPHRB_V3;

  //������������
  TCmdSendEmgcyAlarmDeal_V3 = packed record
    Header: THead_V3;
    Flag: Byte; //0: ȷ�ϱ��� 1: �������
  end;
  PCmdSendEmgcyAlarmDeal_V3 = ^TCmdSendEmgcyAlarmDeal_V3;

  //������������
  TCmdSendReplyAlarmSupervise_V3 = packed record
    Header: THead_V3;
    AlarmId: Integer;
    Ret: Byte;
//    AlarmType: Word;
  end;
  PCmdSendReplyAlarmSupervise_V3 = ^TCmdSendReplyAlarmSupervise_V3;

  //����������״̬
  TCmdSrvRunInfo_V3 = packed record
    Header: THead_V3;
    SrvType: Byte;          //����������
    SrvRunTime: LongWord;   //����ʱ��
    SrvRunStatus: Byte;     //����״̬
    SrvCPUPercent: LongWord;//CPUռ����
    SrvTotalMem: LongWord;  //�ڴ��С
    SrvMemInUse: LongWord;  //ʹ���ڴ�
    SrvMemPercent: LongWord;//�ڴ�ʹ����
  end;
  PCmdSrvRunInfo_V3 = ^TCmdSrvRunInfo_V3;

  TCmdAlarmSupervise_V3 = packed record
    Header: THead_V3;
    CarNoLen: Byte;
   { CarNo: string;
    AlarmSrc: Byte;
    AlarmType: Word;
    AlarmId: LongWord;
    AlarmLevel: Byte;
    AlarmSupervisorLen: LongWord;
   ������
    �����˵绰����
    �����˵绰
    ������Email����
    ������Email
  }
  end;
  PCmdAlarmSupervise_V3 = ^TCmdAlarmSupervise_V3;

  //����ƽ̨�·���Ϣ  ƽ̨��ڡ�������Ϣ
  TCmdGovInfo_V3 = packed record
    Header: THead_V3;
    ObjType: Byte;//��������
    ObjID: TGovObjID;
    MsgId: Integer;
    MsgLen: Integer;
    //Msg: string;
  end;
  PCmdGovInfo_V3 = ^TCmdGovInfo_V3;

  TCmdGovAlarm_V3 = packed record
    Header: THead_V3;
    CarNoLen: Byte;
  { CarNo: string;
    CarCPColor: Byte;
    AlarmSrcType: Byte;
    AlarmType: Word;
    AlarmTime: array[0..6] of byte;
    AlarmMsgLen: Integer;
    AlarmMsg: string;
  }
  end;
  PCmdGovAlarm_V3 = ^TCmdGovAlarm_V3;

  TCmdGovGpsDataCount_V3 = packed record
    Header: THead_V3;
    GpsDataCount: Integer;
    STime: array[0..6] of Byte;
    ETime: array[0..6] of Byte;
  end;
  PCmdGovGpsDataCount_V3 = ^TCmdGovGpsDataCount_V3;

  TGovGpsData_V3 = packed record
    Encrypt: Byte;
    Date: array[0..3] of Byte;
    Time: array[0..2] of Byte;
    Longitude: LongWord;
    Latitude: LongWord;
    Speed: Word;
    Speed_RunRec: Word;//��¼�ǵ��ٶ�
    TotalCourse: LongWord;
    Dir: Word;
    Altitude: Word;
    State: LongWord;
    Alarm: LongWord;
  end;
  PGovGpsData_V3 = ^TGovGpsData_V3;

  TCmdGovCarGpsData_V3 = packed record
    Header: THead_V3;
    CarNo: array[0..20] of Byte;
    CarCpColor: Byte;
    GpsData: TGovGpsData_V3;
  end;
  PCmdGovCarGpsData_V3 = ^TCmdGovCarGpsData_V3;

  TCmdGovStartGpsData_V3 = packed record
    Header: THead_V3;
    CarNo: array[0..20] of Byte;
    CarCpColor: Byte;
    Reason: Byte;
  end;
  PCmdGovStartGpsData_V3 = ^TCmdGovStartGpsData_V3;

  TCmdGovApplyGpsData_V3 = packed record
    Header: THead_V3;
    CarNo: array[0..20] of Byte;
    CarCpColor: Byte;
    STime: array[0..6] of Byte;
    ETime: array[0..6] of Byte;
  end;
  PCmdGovApplyGpsData_V3 = ^TCmdGovApplyGpsData_V3;

  TCmdGovCancelGpsData_V3 = packed record
    Header: THead_V3;
    CarNo: array[0..20] of Byte;
    CarCpColor: Byte;
  end;
  PCmdGovCancelGpsData_V3 = ^TCmdGovCancelGpsData_V3;


  TCmdGovAlarmDealReply_V3 = packed record
    Header: THead_V3;
    CarNo: array[0..20] of Byte;
    CarCpColor: Byte;
    AlarmIdManual: Integer;
    DealResult: Byte;
  end;
  PCmdGovAlarmDealReply_V3 = ^TCmdGovAlarmDealReply_V3;
//
//  TCmdSrvTermSetDevParam_V3 = packed record
//    Header: THead_V3;
//    DevParam: TCmdTSPSetDevParam_V3;
//  end;
//  PCmdSrvTermSetDevParam_V3 = ^TCmdSrvTermSetDevParam_V3;
//------------------------------------------------------------------------------

  { Procedure: GetCmdName<br>
     �������������
     @param const ACmdFlag: Integer
     @Return string
     @see @link()}
function GetCmdName(const ACmdFlag: integer): string;
 { Procedure: CmdToStr<br>
     ��������ĸ�ʽ��������
     @param P: Pointer
     @param
     @Return string
     @see @link()
     }
function CmdToStr(P: Pointer): string;

  {��BCD��ʾ���޷��ų�����32bit��ת�����޷��ų�����}
function BcdToLong(pB: PByte): Longword;
  {��BCD��ʾ��16bit�޷�������ת����16bit�޷�������}
function BcdToWord(pB: PByte): Word;
  {��BCD��ʾ��8bit�޷�������ת����8bit�޷�������}
function BcdToByte(bcd: Byte): Byte;
  {������ת��ΪBCD}
function LongToBcd(pB: Longint): Variant;

function StrToBcd1(Value: string): Variant;

  {�ֽ�˳��ת��}
function ByteOderConvert_Word(AValue: Word): Word;
  {�ֽ�˳��ת��
  @param AValue:longword
  @return longword
  }
function ByteOderConvert_LongWord(AValue: Longword): Longword;

//�����ֽڵ�bcd�뱱��ʱ�䷵�� ʱ�����͡�
function GetTimeFromBcd(AOrg: array of Byte): TDateTime;
{����У���- ���}
function GetXorSum(Buff: Pointer; ALen : integer):Byte;
// ���ַ���ת��Ϊ����
function StringToInteger(param: string): Integer; overload;
function StringToInteger(param: string; defValue: Integer): Integer; overload;
// ���ַ���ת��Ϊ����
function StringToLongWord(param: string): LongWord; overload;
function StringToLongWord(param: string; defValue: LongWord): LongWord; overload;
//
function StringToFloat(param: string): Double; overload;
function StringToFloat(param: string; defValue: Double): Double; overload;

//function GetGpsTime(AOrg: array of Byte): TDateTime;
//  {�� TCmdSrvtermGpsdata ��ʽ������ת���� TGpsData��ʽ
//   @param AOrg:TCmdSrvtermGpsdata
//   @param ANew:TGpsData
//   @return ת���ɹ�����True�����򷵻�False}
//function TransCmdGpsData(var AOrg: TCmdSrvtermGpsdata; var ANew: TGpsData): Boolean; overload;
//  {V2.0�汾�С��ͻ����յ����ش����Ķ�λ����TCmdSrvTermGpsData_V2��ת�ɿͻ����ڲ������õ�TGpsData_V2}
//function TransCmdGpsData(var AOrg: TCmdSrvTermGpsData_V2; var ANew: TGpsData_V2): Boolean; overload;
  {V3.0�汾������������Ŀ}
function TransCmdGpsData(var AOrg: TCmdSrvTermGpsData_V3; var ANew: TGpsData_V3): Boolean; overload;
function TransCmdGpsData(var AOrg: TCmdSrvTermGpsDataTSP_V3; var ANew: TGpsData_V3): Boolean; overload;
function TransCmdGpsData(var AOrg: TCmdSrvTermGpsDataTSPHRB_V3; var ANew: TGpsData_V3): Boolean; overload;
function TransCmdGpsData(var AOrg: TCmdSrvtermControlCar_V3; var ANew: TGpsData_V3): Boolean; overload;
function TransCmdGpsData(var AOrg: TCmdSrvTermDevControlTSP_V3; var ANew: TGpsData_V3): Boolean; overload;
// �켣�ط�����
function TransCmdGpsData(var AOrg: TQueryHistoryGpsData_V3; var ANew: THistoryGpsData_V3): Boolean; overload;

implementation
uses
  Sysutils, DateUtils;

function StringToInteger(param: string): Integer; overload;
begin
  if param = '' then
  begin
    Result := 0;
  end
  else begin
    try
      Result := StrToInt(param);
    except
      Result := 0;
    end;
  end;
end;

function StringToInteger(param: string; defValue: Integer): Integer; overload;
begin
  if param = '' then
  begin
    Result := defValue;
  end
  else begin
    try
      Result := StrToInt(param);
    except
      Result := defValue;
    end;
  end;
end;

function StringToLongWord(param: string): LongWord; overload;
begin
  if param = '' then
  begin
    Result := 0;
  end
  else begin
    try
      Result := StrToInt(param);
    except
      Result := 0;
    end;
  end;
end;

function StringToLongWord(param: string; defValue: LongWord): LongWord; overload;
begin
  if param = '' then
  begin
    Result := defValue;
  end
  else begin
    try
      Result := StrToInt(param);
    except
      Result := defValue;
    end;
  end;
end;

function StringToFloat(param: string): Double;
begin
  if param = '' then
  begin
    Result := 0;
  end
  else begin
    try
      Result := StrToFloat(param);
    except
      Result := 0;
    end;
  end;
end;

function StringToFloat(param: string; defValue: Double): Double;
begin
  if param = '' then
  begin
    Result := defValue;
  end
  else begin
    try
      Result := StrToFloat(param);
    except
      Result := defValue;
    end;
  end;
end;


//function TransCmdGpsData(var AOrg: TCmdSrvtermGpsdata; var ANew: TGpsData): Boolean;
//  function GetGpsTime(AOrg: array of Byte): TDateTime;
//  var
//    year, mon, day, hour, min, sec: Word;
//  begin
//    //-------------------���豸�յ�¼ʱ,��GPS���߻����й��ϣ����յ�ȫ��0������
//    if (AOrg[1] = 0) and (AOrg[2] = 0) and (AOrg[3] = 0) and (AOrg[4] = 0) and (AOrg[5] = 0) then
//    begin
//      Result := EncodeDate(2000, 1, 1) + EncodeTime(0, 0, 0, 0);
//      exit;
//    end;
//    //====================================================
//    year := 2000 + AOrg[0];
//    mon := AOrg[1];
//    day := AOrg[2];
//    hour := AOrg[3];
//    min := AOrg[4];
//    sec := AOrg[5];
//    try
//      Result := EncodeDate(year, mon, day) + EncodeTime(hour, min, sec, 0);
//    except
//      Result := 0; // EncodeDate(2000,1,1)+ EncodeTime(0,0,0,0);
//    end;
//  end;
//begin
//  Result := True;
//  try
//    ANew.Size := SizeOf(ANew);
//    ANew.Id := AOrg.DevId;
//    ANew.Long := AOrg.Long / 1000 / 60;
//    ANew.Lat := AOrg.Lat / 1000 / 60;
//    ANew.GpsTime := GetGpsTime(AOrg.GpsTime);
//    ANew.Speed := AOrg.Speed;
//    ANew.Altitude := AOrg.Altitude;
//    ANew.Angle := AOrg.Angle;
//    ANew.IO := AOrg.Stat;
//    ANew.IO := (ANew.IO shl 8) or AOrg.Switch;
//  except
//    Result := False;
//  end;
//end;
//
//{V2.0�汾�С��ͻ����յ����ش����Ķ�λ����TCmdSrvTermGpsData_V2��ת�ɿͻ����ڲ������õ�TGpsData_V2}
//
//function TransCmdGpsData(var AOrg: TCmdSrvTermGpsData_V2; var ANew: TGpsData_V2): Boolean;
//  function GetGpsTime(AOrg: array of Byte): TDateTime;
//  var
//    year, mon, day, hour, min, sec: Word;
//    Error: Boolean;
//  begin
//    //-------------------���豸�յ�¼ʱ,��GPS���߻����й��ϣ����յ�ȫ��0������
//    if (AOrg[1] = 0) and (AOrg[2] = 0) and (AOrg[3] = 0) and (AOrg[4] = 0) and (AOrg[5] = 0) then
//    begin
//      Result := EncodeDate(2000, 1, 1) + EncodeTime(0, 0, 0, 0);
//      exit;
//    end;
//    //====================================================
//    Error := False;
//    year := 2000 + AOrg[0];
//    mon := AOrg[1];
//    if not ((mon > 0) and (mon <= 12)) then Error := True;
//    day := AOrg[2];
//    if not ((day > 0) and (day <= 31)) then Error := True;
//    hour := AOrg[3];
//    if not ((hour >= 0) and (hour <= 23)) then Error := True;
//    min := AOrg[4];
//    if not ((min >= 0) and (min <= 59)) then Error := True;
//    sec := AOrg[5];
//    if not ((sec >= 0) and (sec <= 59)) then Error := True;
//    if Error then
//    begin
//      Result := EncodeDate(2000, 1, 1) + EncodeTime(0, 0, 0, 0);
//      exit;
//    end;
//    try
//      //�������8Сʱ��
//      Result := EncodeDate(year, mon, day) + EncodeTime(hour, min, sec, 0) + 1 / 3;
//    except
//      Result := EncodeDate(2000, 1, 1) + EncodeTime(0, 0, 0, 0);
//    end;
//  end;
//begin
//  Result := True;
//  try
//    ANew.Size := SizeOf(ANew);
//    ANew.Id := AOrg.DevId;
//    ANew.Long := AOrg.Longitude / 1000000;
//    ANew.Lat := AOrg.Latitude / 1000000;
//    ANew.Speed := AOrg.Speed;
//    ANew.Orientation := AOrg.Orientation * 2; //Anew.Orientation��λ���� || Aorg.Orientation��λ��2��
//    ANew.State := AOrg.State;
//    ANew.GpsTime := GetGpsTime(AOrg.GpsTime);
//  except
//    Result := False;
//  end;
//end;


function GetGpsTime(AOrg: array of Byte): TDateTime;
var
  year, mon, day, hour, min, sec: Word;
  Error: Boolean;
begin
  //-------------------���豸�յ�¼ʱ,��GPS���߻����й��ϣ����յ�ȫ��0������
  if (AOrg[1] = 0) and (AOrg[2] = 0) and (AOrg[3] = 0) and (AOrg[4] = 0) and (AOrg[5] = 0) then
  begin
    Result := EncodeDate(2000, 1, 1) + EncodeTime(0, 0, 0, 0);
    exit;
  end;
  //====================================================
  Error := False;
  year := 2000 + BcdToByte(AOrg[0]);//StrToInt(IntToHex(AOrg[0], 2));
  mon := BcdToByte(AOrg[1]);//StrToInt(IntToHex(AOrg[1], 2));
  if not ((mon > 0) and (mon <= 12)) then Error := True;
  day := BcdToByte(AOrg[2]);//StrToInt(IntToHex(AOrg[2], 2));
  if not ((day > 0) and (day <= 31)) then Error := True;
  hour := BcdToByte(AOrg[3]);//StrToInt(IntToHex(AOrg[3], 2));
  if not ((hour >= 0) and (hour <= 23)) then Error := True;
  min := BcdToByte(AOrg[4]);//StrToInt(IntToHex(AOrg[4], 2));
  if not ((min >= 0) and (min <= 59)) then Error := True;
  sec := BcdToByte(AOrg[5]);//StrToInt(IntToHex(AOrg[5], 2));
  if not ((sec >= 0) and (sec <= 59)) then Error := True;
  if Error then
  begin
    Result := EncodeDate(2000, 1, 1) + EncodeTime(0, 0, 0, 0);
    exit;
  end;
  try
    //�������8Сʱ��
    Result := EncodeDate(year, mon, day) + EncodeTime(hour, min, sec, 0);// + 1 / 3;
  except
    Result := EncodeDate(2000, 1, 1) + EncodeTime(0, 0, 0, 0);
  end;
end;

function TransCmdGpsData(var AOrg: TCmdSrvTermGpsData_V3; var ANew: TGpsData_V3): Boolean;
begin
  Result := True;
  try
    ANew.Size := SizeOf(ANew);
//    ANew.Id :=  BCDToInt(@AOrg.DevId[0]);//AOrg.DevId[4] + AOrg.DevId[3]*256 + AOrg.DevId[2]*256*256 + AOrg.DevId[1]*256*256*256;
    ANew.Id :=  AOrg.Header.DevId;
    ANew.Long := AOrg.Longitude / 1000000;
    ANew.Lat := AOrg.Latitude / 1000000;
    ANew.Altitude := AOrg.Altitude;
    ANew.Speed := AOrg.Speed;
    ANew.Orientation := AOrg.Orientation * 2; //Anew.Orientation��λ���� || Aorg.Orientation��λ��2��
    ANew.GpsTime := GetGpsTime(AOrg.GpsTime);
    ANew.State := AOrg.State;
    ANew.WarningSign := AOrg.WarningSign;
  except
    Result := False;
  end;
end;

function TransCmdGpsData(var AOrg: TCmdSrvTermGpsDataTSP_V3; var ANew: TGpsData_V3): Boolean;
begin
  Result := True;
  try
    ANew.Size := SizeOf(ANew);
//    ANew.Id :=  BCDToInt(@AOrg.DevId[0]);//AOrg.DevId[4] + AOrg.DevId[3]*256 + AOrg.DevId[2]*256*256 + AOrg.DevId[1]*256*256*256;
    ANew.Id :=  AOrg.Header.DevId;
    ANew.Long := AOrg.Longitude / 1000000;
    ANew.Lat := AOrg.Latitude / 1000000;
    ANew.Altitude := AOrg.Altitude;
    ANew.Speed := AOrg.Speed;
    ANew.Orientation := AOrg.Orientation * 2; //Anew.Orientation��λ���� || Aorg.Orientation��λ��2��
    ANew.GpsTime := GetGpsTime(AOrg.GpsTime);
    ANew.State := AOrg.State;
    ANew.WarningSign := AOrg.WarningSign;
  except
    Result := False;
  end;
end;

function TransCmdGpsData(var AOrg: TCmdSrvTermGpsDataTSPHRB_V3; var ANew: TGpsData_V3): Boolean; overload;
begin
  Result := True;
  try
    ANew.Size := SizeOf(ANew);
//    ANew.Id :=  BCDToInt(@AOrg.DevId[0]);//AOrg.DevId[4] + AOrg.DevId[3]*256 + AOrg.DevId[2]*256*256 + AOrg.DevId[1]*256*256*256;
    ANew.Id :=  AOrg.Header.DevId;
    ANew.Long := AOrg.Longitude / 1000000;
    ANew.Lat := AOrg.Latitude / 1000000;
    ANew.Altitude := AOrg.Altitude;
    ANew.Speed := AOrg.Speed;
    ANew.Orientation := AOrg.Orientation * 2; //Anew.Orientation��λ���� || Aorg.Orientation��λ��2��
    ANew.GpsTime := GetGpsTime(AOrg.GpsTime);
    ANew.State := AOrg.State;
    ANew.WarningSign := AOrg.WarningSign;
  except
    Result := False;
  end;
end;

function TransCmdGpsData(var AOrg: TCmdSrvtermControlCar_V3; var ANew: TGpsData_V3): Boolean;
begin
  Result := True;
  try
    ANew.Size := SizeOf(ANew);
    ANew.Id := AOrg.Header.DevId;
//    ANew.Id := BCDToInt(@AOrg.DevId[0]);//AOrg.DevId[4] + AOrg.DevId[3]*256 + AOrg.DevId[2]*256*256 + AOrg.DevId[1]*256*256*256;
    {if (AOrg.FactID = 2) or (AOrg.FactID = 3) then
    begin
      ANew.Long := AOrg.Longitude / 600000;
      ANew.Lat := AOrg.Latitude / 600000;
    end
    else
    begin  }
      ANew.Long := AOrg.Longitude / 1000000;
      ANew.Lat := AOrg.Latitude / 1000000;
    //end;
    ANew.Altitude := AOrg.Altitude;
    ANew.Speed := AOrg.Speed;
    ANew.Orientation := AOrg.Orientation * 2; //Anew.Orientation��λ���� || Aorg.Orientation��λ��2��
    ANew.State := AOrg.State;
    ANew.GpsTime := GetGpsTime(AOrg.GpsTime);
    ANew.WarningSign := AOrg.WarningSign;
  except
    Result := False;
  end;
end;

function TransCmdGpsData(var AOrg: TCmdSrvTermDevControlTSP_V3; var ANew: TGpsData_V3): Boolean; overload;
begin
  Result := True;
  try
    ANew.Size := SizeOf(ANew);
    ANew.Id := AOrg.Header.DevId;
    ANew.Long := AOrg.Longitude / 1000000;
    ANew.Lat := AOrg.Latitude / 1000000;
    ANew.Altitude := AOrg.Altitude;
    ANew.Speed := AOrg.Speed;
    ANew.Orientation := AOrg.Orientation * 2; //Anew.Orientation��λ���� || Aorg.Orientation��λ��2��
    ANew.State := AOrg.State;
    ANew.GpsTime := GetGpsTime(AOrg.GpsTime);
    ANew.WarningSign := AOrg.WarningSign;
  except
    Result := False;
  end;
end;

function TransCmdGpsData(var AOrg: TQueryHistoryGpsData_V3; var ANew: THistoryGpsData_V3): Boolean;
  function BCDToInt(ABuff:Pointer): Integer; // ��BCD�ַ���ת��Ϊ����
  var
    i:integer;
    temp: string;
  begin
    temp:='';
    inc(PByte(ABuff));
    for i:=0 to 2 do
    begin
      temp:=temp+InttoHex(PByte(ABuff)^,2);
      inc(PByte(ABuff));
    end;
    Result := StringToInteger(temp);
  end;
begin
  Result := True;
  try
    ANew.Size := SizeOf(ANew);
    ANew.Id :=  BCDToInt(@AOrg.DevId[0]);//AOrg.DevId[4] + AOrg.DevId[3]*256 + AOrg.DevId[2]*256*256 + AOrg.DevId[1]*256*256*256;
    ANew.Long := AOrg.Longitude / 1000000;
    ANew.Lat := AOrg.Latitude / 1000000;
    ANew.Speed := AOrg.Speed;
    ANew.Orientation := AOrg.Orientation; //Anew.Orientation��λ���� || Aorg.Orientation��λ��2��
    ANew.State := AOrg.State;
    ANew.GpsTime := AOrg.GpsTime;//GetGpsTime(AOrg.GpsTime);
    ANew.WarningSign := AOrg.WarningSign;
    ANew.ServerTime := AOrg.ServerTime;
  except
    Result := False;
  end;
end;

{�ֽ�˳��ת��,���������ֽ�˳��(LITTLE_END)ת��BIG_END
@param AValue:Word
@return Word
}

function ByteOderConvert_Word(AValue: Word): Word;
type
  TLongByte = packed record
    a, b: Byte;
  end;
var
  P: ^TLongByte;
  t: Byte;
begin
  P := @AValue;
  t := P^.a;
  P^.a := P^.b;
  P^.b := t;

  Result := AValue;
end;

{�ֽ�˳��ת��
@param AValue:longword
@return longword
}

function ByteOderConvert_LongWord(AValue: Longword): Longword;
type
  TLongByte = packed record
    a, b, c, d: Byte;
  end;
var
  P: ^TLongByte;
  t: Byte;
begin
  P := @AValue;
  t := P^.a;
  P^.a := P^.d;
  P^.d := t;

  t := P^.b;
  P^.b := P^.c;
  P^.c := t;

  Result := AValue;
end;
{
bcd�б������4���ֽڵĸ����ʾ
"03201.831" ת������4���ֽڵ�bcd���ʾ���� <br>
0x03  0x20  0x18  0x31                     <br>
��0x03  0x20  0x18  0x31 ת��8���ֽ�       <br>
 0 ��3��2��0, 1��8��3��1                   <br>
 Ȼ��ƴ��һ��longword                      <br>
  (0*6000+3*600+2*60)*1000+
  (0*10000+1*1000+8*100+3*10+1)
 --------
 ���ͻ����ټ���ʱ���ٳ���1000*60
 =32.0305167
}

function BcdToLong(pB: PByte): Longword;
var
  b: array[0..7] of Byte;
  i: integer;
begin
  for i := 0 to 3 do
  begin
    b[i * 2] := pB^ shr 4;
    b[i * 2 + 1] := pB^ and $0F;
    inc(pB);
  end;

  Result :=
    (b[0] * 6000 + b[1] * 600 + b[2] * 60) * 1000 +
    (b[3] * 10000 + b[4] * 1000 + b[5] * 100 + b[6] * 10 + b[7]);
end;

function LongToBcd(pB: Longint): Variant;
var
  b: array of Byte;
  hex: string;
  i: Integer;
  temp: Integer;
begin
  setlength(b, 4);
  b[0] := pB div 1000;
  pB := pB shl 1;
  b[1] := pB div 100;
  pB := pB shl 1;
  b[2] := pB div 10;
  pB := pB shl 1;
  b[3] := pB mod 10;
  hex := IntToHex(pB, 8);
  for i := 0 to 3 do
  begin
    temp := StrToInt('$' + Copy(hex, i*2+1, 2));
    b[i] := ((temp div 10) shl 4) + (temp mod 10);
  end;
  Result := b;
end;

function StrToBcd1(Value: string): Variant;
var
  i, j: Integer;
  temp: string;
  temp1: Integer;
  BCD: array of Byte;
begin
  temp1 := StringToInteger(Value);
  temp := FormatFloat('0000000000', temp1);
  SetLength(BCD, 5);
  j := 1;
  for i:=0 to 4  do
  begin
    BCD[i] := StrToInt('$' + copy(temp,i*2+1,2));
    j := j+1;
  end;
  Result := BCD;
end;

{
bcd�б������2���ֽڵ����ͱ�ʾ
1204����������ʾ�ٶ�Ϊ120.4����ÿСʱ
�����������ֽڵ�bcd���ʾ[0x12,0x04]
��0x12 0x04 ת��4���ֽ�
    1,2,0,4
 Ȼ��ƴ��һ������
 1*1000+2*100+0*10+4;
}

function BcdToWord(pB: PByte): Word;
var
  b: array[0..3] of Byte;
begin

  b[0] := pB^ shr 4;
  b[1] := pB^ and $0F;
  inc(pB);
  b[2] := pB^ shr 4;
  b[3] := pB^ and $0F;

  Result := b[0] * 1000 + b[1] * 100 + b[2] * 10 + b[3];
end;

function BcdToByte(bcd: Byte): Byte;
begin
  Result := (bcd shr 4) * 10 + (bcd and $0F);
end;


function GetCmdName(const ACmdFlag: integer): string;
begin
//  case ACmdFlag of
//    //--------------��ؿͻ��ˡ��롡���� ����
//    TERMSRV_REG: Result := '�ͻ����û�ע�ᷢ������'; //= $02;
//    SRVTERM_REG: Result := '�������û�ע�᷵������'; //= $82;
//    TERMSRV_GETLASTPOS: Result := '�ͻ��˲�ѯĿ�����λ�÷�������'; //= $03;
//    SRVTERM_GETLASTPOS: Result := '��������ѯĿ�����λ�÷�������'; //= $83;
//    TERMSRV_GETDEVSTAT: Result := '�ͻ��˲�ѯĿ��״̬��������'; //= $04;
//    SRVTERM_GETDEVSTAT: Result := '��������ѯĿ��״̬��������'; //= $84;
//    SRVTERM_GPSDATA: Result := '����������Ŀ������ݵ��ͻ�������'; //= $85;
//    TERMSRV_CALLDEV: Result := '�ͻ��˺���Ŀ�귢������'; //= $06;
//    SRVTERM_CALLDEV: Result := '����������Ŀ�귵������'; //= $86;
//    TERMSRV_SWCTRL: Result := '�ͻ��˿���Ŀ�귢������'; //= $07;
//    SRVTERM_SWCTRL: Result := '����������Ŀ�귵������'; //= $87;
//    TERMSRV_SENDDEVMSG: Result := '�ͻ��˷���Ŀ����Ϣ��������'; //= $08;
//    SRVTERM_SENDMSG: Result := '������������Ϣ���ͻ�������'; //= $89;
//    TERMSRV_PING: Result := '�ͻ��˵�����������������'; //= $0A;
//    SRVTERM_PING: Result := '��������Ӧ�ͻ��˵���������'; //= $8A;
//    SRVTERM_NOTIFYMSG: Result := '������֪ͨ�ͻ��˵�֪ͨ��Ϣ'; //= $8B;
//    TERMSRV_CANCELCMD: Result := '�ͻ���֪ͨ������ȡ������ɨ�з�������'; //= $0C;
//    SRVTERM_CANCELCMD: Result := '��������Ӧȡ������ķ�������'; //= $8C;
//    SRVTERM_LASTGPSDATA: Result := ''; //= $8D;
//   
//  else
//    Result := 'δ֪����ID:' + IntToStr(ACmdFlag);
//  end;
end;

function CmdToStr(P: Pointer): string;
  function GetTERMSRV_COMMVER(P: Pointer): string;
  begin
    with PCmdTermsrvRegverData(P)^ do
      Result := '�ͻ���ע��ͨѶЭ������ ' + IntToStr(MajorVer) + '.' + IntToStr(MinorVer);
  end;

  function GetSRVTERM_COMMVER(P: Pointer): string;
  begin
    with PCmdSrvtermRegverData(P)^ do
      Result := '��������Ӧע��ͨѶЭ������ ';
  end;

  function GetTERMSRV_REG(P: Pointer): string;
  begin
    with PCmdTermsrvRegUserData(P)^ do
      Result := '�ͻ���ע��,�û�:' + IntToStr(UserID) + ',Password:******' + '�ͻ��˰汾�� ';// +
        //IntToStr(MajorVer) + '.' + IntToStr(MinorVer);
  end;

  function GetSRVTERM_REG(P: Pointer): string;
  begin
    with PCmdSrvtermRegUserData(P)^ do
      Result := '��������Ӧע������' + IntToStr(PCmdSrvtermRegUserData(P)^.Ret);
  end;

  function GetTERMSRV_GETLASTPOS(P: Pointer): string;
  begin
    with PCmdTermsrvGetlastPosData(P)^ do
      Result := '�ͻ�������Ŀ������λ�ã�IDΪ' + IntToStr(PCmdTermsrvGetlastPosData(P)^.DevId);
  end;

  function GetSRVTERM_GETLASTPOS(P: Pointer): string;
  begin

  end;

  function GetTERMSRV_GETSTAT(P: Pointer): string;
  begin

  end;

  function GetSRVTERM_GETSTAT(P: Pointer): string;
  begin

  end;

  function GetSRVTERM_GPSDATAV20(P: Pointer): string;
  begin

  end;

  function GetTERMSRV_CALLDEV(P: Pointer): string;
  begin

  end;

  function GetSRVTERM_CALLDEV(P: Pointer): string;
  begin

  end;

  function GetTERMSRV_SWITCHCTRL(P: Pointer): string;
  begin

  end;

  function GetSRVTERM_SWITCHCTRL(P: Pointer): string;
  begin

  end;

  function GetTERMSRV_SENDDEVMSG(P: Pointer): string;
  begin

  end;

  function GetSRVTERM_SENDMSG(P: Pointer): string;
  begin

  end;

  function GetTERMSRV_PING(P: Pointer): string;
  begin

  end;

  function GetSRVTERM_PING(P: Pointer): string;
  begin

  end;

  function GetSRVTERM_NOTIFYSTAT(P: Pointer): string;
  begin

  end;

  function GetTERMSRV_CANCELCMD(P: Pointer): string;
  begin

  end;

  function GetSRVTERM_CANCELCMD(P: Pointer): string;
  begin

  end;

  function GetSRVTERM_LASTGPSDATA(P: Pointer): string;
  begin

  end;

  function PtrAdd(P: Pointer; offset: integer): Pointer;
  begin
    Result := Pointer(integer(P) + offset);
  end;

begin
{
  case PByte(PtrAdd(P,2))^ of
    TERMSRV_COMMVER     :Result := GetTERMSRV_COMMVER(p)      ;//$01
    SRVTERM_COMMVER     :Result := GetSRVTERM_COMMVER(p)      ;//$81
    TERMSRV_REG         :Result := GetTERMSRV_REG(p)          ;//$02
    SRVTERM_REG         :Result := GetSRVTERM_REG(p)          ;//$82
    TERMSRV_GETLASTPOS  :Result := GetTERMSRV_GETLASTPOS(p)   ;//$03
    SRVTERM_GETLASTPOS  :Result := GetSRVTERM_GETLASTPOS(p)   ;//$83
    TERMSRV_GETDEVSTAT  :Result := GetTERMSRV_GETSTAT(p)      ;//$04
    SRVTERM_GETDEVSTAT  :Result := GetSRVTERM_GETSTAT(p)      ;//$84
    SRVTERM_GPSDATA     :Result := GetSRVTERM_GPSDATAV20(p)   ;//$85
    TERMSRV_CALLDEV     :Result := GetTERMSRV_CALLDEV(p)      ;//$06
    SRVTERM_CALLDEV     :Result := GetSRVTERM_CALLDEV(p)      ;//$86
    TERMSRV_SWCTRL      :Result := GetTERMSRV_SWITCHCTRL(p)   ;//$07
    SRVTERM_SWCTRL      :Result := GetSRVTERM_SWITCHCTRL(p)   ;//$87
    TERMSRV_SENDDEVMSG  :Result := GetTERMSRV_SENDDEVMSG(p)   ;//$08
    SRVTERM_SENDMSG     :Result := GetSRVTERM_SENDMSG(p)      ;//$89
    TERMSRV_PING        :Result := GetTERMSRV_PING(p)         ;//$0A
    SRVTERM_PING        :Result := GetSRVTERM_PING(p)         ;//$8A
    SRVTERM_NOTIFYMSG   :Result := GetSRVTERM_NOTIFYSTAT(p)   ;//$8B
    TERMSRV_CANCELCMD   :Result := GetTERMSRV_CANCELCMD(p)    ;//$0C
    SRVTERM_CANCELCMD   :Result := GetSRVTERM_CANCELCMD(p)    ;//$8C
    SRVTERM_LASTGPSDATA :Result := GetSRVTERM_LASTGPSDATA(p)  ;//$8D
  else
    Result := 'δ֪����';
  end;
 }
end;

 //�����ֽڵ�bcd�뱱��ʱ�䷵�� ʱ�����͡�
function GetTimeFromBcd(AOrg: array of Byte): TDateTime;
var
  year, mon, day, hour, min, sec: Word;
  Error: Boolean;
begin
  AOrg[0] := BcdToByte(AOrg[0]);
  AOrg[1] := BcdToByte(AOrg[1]);
  AOrg[2] := BcdToByte(AOrg[2]);
  AOrg[3] := BcdToByte(AOrg[3]);
  AOrg[4] := BcdToByte(AOrg[4]);
  AOrg[5] := BcdToByte(AOrg[5]);
  if (AOrg[1] = 0) and (AOrg[2] = 0) and (AOrg[3] = 0) and (AOrg[4] = 0) and (AOrg[5] = 0) then
  begin
    Result := EncodeDate(2000, 1, 1) + EncodeTime(0, 0, 0, 0);
    exit;
  end;
  //====================================================
  Error := False;
  year := 2000 + AOrg[0];
  mon := AOrg[1];
  if not ((mon > 0) and (mon <= 12)) then Error := True;
  day := AOrg[2];
  if not ((day > 0) and (day <= 31)) then Error := True;
  hour := AOrg[3];
  if not ((hour >= 0) and (hour <= 23)) then Error := True;
  min := AOrg[4];
  if not ((min >= 0) and (min <= 59)) then Error := True;
  sec := AOrg[5];
  if not ((sec >= 0) and (sec <= 59)) then Error := True;
  if Error then
  begin
    Result := EncodeDate(2000, 1, 1) + EncodeTime(0, 0, 0, 0);
    exit;
  end;
  try
    Result := EncodeDate(year, mon, day) + EncodeTime(hour, min, sec, 0);
  except
    Result := EncodeDate(2000, 1, 1) + EncodeTime(0, 0, 0, 0);
  end;
end;

{����У���- ���}
function GetXorSum(Buff: Pointer; ALen : integer):Byte;
var
  i: integer;
  p: PByte;
  checkSum : Byte;
begin
  p:= PByte(Buff);
  checkSum := 0;
  for i:= 0 to Alen-1 do
  begin
    checkSum := checkSum xor p^;
    Inc(p);
  end;
  Result:= checkSum;
end;

end.
