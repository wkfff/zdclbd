{���ó�������
 @created(2003-09-04)
 @lastmod(GMT:$Date: 2012/11/30 01:29:23 $) <BR>
 ��������:$Author: wfp $ <BR>
 ��ǰ�汾:$Revision: 1.2 $ <BR>}



unit ConstDefineUnit;

interface
uses Messages;
const
//====================================================================
  BEIDOU = '����';
  MAXLONGWORD = 4294967295;
  MAXINTEGER = 2147483647;
  MY_APP_NAME = 'VSMSClient_Taxi';
  CM_RESTORE = WM_USER + $1000; // -�Զ���ġ��ָ�����Ϣ
  CM_DATASERVER_SENDMSG = WM_USER + $1001; //
  CM_DevStat = WM_USER + $1002; // �豸״̬
  CM_DevParam_READOk = WM_USER + $1003; // ���豸����
  CM_DevNotifyStat = WM_USER + $1004; // �����������ݸ��µ�֪ͨ,֪ͨ�ͻ���Ҫˢ��ָ�����豸����Ϣ
  CM_DevToHost = WM_USER + $1005; // �յ�Dev���͵�Host������
  CM_RegUserErr = WM_USER + $1006; // �û���¼�����ط����� ����
  CM_DEVALARM = WM_USER + $1007; // ���յ���GPS�������� ����

  //ɾ��Խ���ʻ�뱨���б��е���س��� ������Ϣ�ɵ���Χ���б���ɾ��ʱ�����������档
  //--���û��ڵ���Χ���б���ɾ��ĳ���򣨶�Ӧ�ĳ�����ȫ���޶����� ��ĳ�����в����޶��ó�ʱ�����Խ���ʻ�뱨���б����иó����������뵽��ʷ��¼��
  CM_DELAlarmListDev_OutORInCA = WM_USER + $1008;

  CM_UPDATE = WM_USER + $1009; //���±�����,,����ر��Լ�,�����Ϣ���ɸ��³��򷢳�.
//  CM_PowerCut           =WM_USER+ $1010;  //�ϵ籨��

  //���������ִ��״̬
  CMD_SNDNODO = 0; // �ѷ���δִ��
  CMD_DONE = 1; // ��ִ��
  CMD_DOERROR = 2; // ִ�г���
  CMD_CANCELByUSER = 3; // ���û�ȡ��
  CMD_CANCELED = 4; // ��ȡ��
  CMD_CANCELFAIL = 5; // ȡ��ʧ��
  CMD_RESND = 6; // �ط�
  CMD_DELETED = 7; // ��ɾ��
  CMD_REPLACE = 8; // �����
  CMD_OVERTIME = 9; // ��ʱ
  CMD_SND2SMSSENDSVR = 10; // �ѷ��͵�SMS���ͷ�����
  CMD_INVALIDDEV = 11; //��Ч�ĳ���ID��
  CMD_NOPIC = 12;//û�з�����������Ƭ

  ForDevLimit = 100; //��ǰ����� �鿴������
  UserDrawAreaLayerName = '����Χ���滭ͼ��'; //�����򡡵�ͼ��ġ�����

  ALARM_OUT = 0; //Խ���硡����
  ALARM_IN = 1; //��硡������
  Alarm_LINEKEYPOINT = 2;// ��·�ؼ��㱨��
  ALARM_OVER_SPEET = 2; //�����ٱ���
  ALARM_WAY_OUT = 3;
  ALARM_WAY_IN = 4;
  BUSLINE_WAY = 5;
  ASSEMBLE_WARRING = 5; // �ۼ�����
  OUT_TOWN = 6; // ���Ǳ���
  OUT_TOWN_ERROR = 61; // ���ǳ�ʱ����

  ANTIFAKE_WARRING = 7; // ��α�ܱ걨��
  SUSPECTEDPETITIONS_WARRING = 8; // �����Ϸñ���

  SEEK_CAR = 9;   // ����鳵

  //-------GPS��λ�����еĸ���־λ
  GPSALARM_EMERGENCY = 32; //��������
  GPSALARM_DEVOVERSPEED = 48;// ��48λ	1�����ٱ���
  GPSALARM_DRIVERFATIGUE = 49;//��49λ	1��ƣ�ͼ�ʻ����
  GPSALARM_DRIVERTIMEOUT = 50;  //��50λ  1���ۼƼ�ʻ��ʱ����
  GPSALARM_DRIVERSTOP = 51;   // ��51λ   1��ͣ����ʱ����
  GPSALARM_DEVCUTPOWER = 18;//��18λ	1���ϵ籨��
  GPSALARM_INDEVAREA = 20;//��20λ	1�������򱨾�
  GPSALARM_OUTDEVAREA = 21;//��21λ	1�������򱨾�
  GPSALARM_OUTLINE = 22;//��22λ	1��ƫ��·�߱���
  GPSALARM_FORTIFY =23; //��23λ	1:  �Ƿ��������� �������
  GPSALARM_DEVLOWPOWER = 26;//��26λ	1����ѹ����
//==========================================================================

  (*****�����롡����******)
  {���������ء����ظ���������ͨ��Ӧ���еġ�������--��0���ɹ�|1��ʧ��}
  DEVRET_OK = $0;
  DEVRET_FAIL = $1;
  {�绰��������״̬ }
  TELSTATE_TALKRESTRICT = $01; //0x00:ͨ��������  ->������룬�������
  TELSTATE_ENABLEIN_NOTOUT = $02; //0x01:������룬��ֹ����
  TELSTATE_ENABLEOUT_NOTIN = $03; //0x02:�����������ֹ����
  TELSTATE_DISABLE         = $04; //0X03: ��ֹͨ��
  (*****�ͻ��ˡ�������****)
  RET_OK = $0;
  {����ִ�гɹ�}
  RET_CMDOK = $0;
  {ERR_��ͷ��Ϊ������}
  //���й���
  ERR_LED = $1;
  // �û���¼�ɹ�
  LOGIN_OK = $01;
  {��Ч�û���}
  ERR_INVALIDUSER = $02;
  {�ظ���¼}
  ERR_Logged = $03;
  {��������}
  ERR_INVALIDPASSWD = $04;
  {�û��������¼}
  ERR_USERDISABLED = $3;
  {�û��ѱ�ɾ��}
  ERR_USERDELETED = $4;
  {��������Ч}
  ERR_INVALIDOLDPASSWD = $5;
  {��������Ч}
  ERR_INVALIDNEWPASSWD = $6;
  {��δ��¼}
  ERR_NOTLOGIN = $7;
  {û��ȡ����Ҫ������}
  ERR_NODATA = $8;
  { �������Ҫ����������}
  ERR_DATALACK = $9;
  {��������ݸ�ʽ}
  ERR_INVALIDFORMAT = $A;
  {û��������Ҫͬ��}
  ERR_NOSYNC = $B;
  { д�����ݿ�ʧ��}
  ERR_Record = $C;
  {���汾�Ź���}
  ERR_ProtocalMajorOver = $D;
  {���汾�Ź�С}
  ERR_ProtocalMajorLack = $E;
  {�ΰ汾�Ź���}
  ERR_ProtocalMinorOver = $F;
  {�ΰ汾�Ź�С}
  ERR_ProtocalMinorLack = $10;
  {��Ч�İ汾��}
  ERR_INVALIDVER = $11;
  {��Ч�ĳ���}
  ERR_INVALIDDEV = $13;
  {��Ч���ƶ�Ŀ��}
  ERR_INVALIDTARGET = $14;
  {û��Ȩ��}
  ERR_NOPRIVILEGE = $15;
  {����ִ�г�ʱʧ��}
  ERR_TIMEOUT = $16;
  {�������޸ĺ�ִ��,������ִ���ڼ䱻һ���µ����ֻ�ǲ�����ͬ�����}
  RET_CMDMODIFY = $17;
  {�����ѷ��͵�SMS���ͷ�����}
  RET_CMDSnd2SMSSendSvr = $18;
  {�����ѱ�ɾ��}
  RET_ORDERDELETED = $19;
  {����ִ��ʧ��}
  RET_FAIL = $FE;
  {δ֪����}
  ERR_Unknown = $FF;
  {ͨ�ŷ����������û�,ΪXXXXX��md5ֵ}
  SYSTEM_SUPERUSER = '{F1F34647-81A5-48F6-A854-F8B469F64F67}';
  SYSTEM_SUPERPASS = '{A789376B-F01E-40A8-917A-DF5B34B200FE}';
  {���볤��}
  PassLength = 32;

//��Ϣ��������
  //��Ϣ����
  MSGTYPE_NORMAL = 0; //�ı�������Ϣ
  MSGTYPE_NEEDANSWER = 1; //��ظ��ĵ�����������
  //��Ϣ״̬
  MSGSTAT_UNSEND = 0; //��Ϣδ����
  MSGSTAT_SENDED = 1; //��Ϣ�ѷ���
  MSGSTAT_RECVED = 2; //�����ѽ�����Ϣ
  MSGSTAT_REPLYED = 3; //˾����Ӧ����Ϣ
  MSGSTAT_FAILED = 9; //��Ϣ����ʧ��
  //˾��Ӧ��
  MSGANSWERTYPE_YES = 1; //˾��Ӧ����
  MSGANSWERTYPE_NO = 0; //˾��Ӧ�𣭷�

//���������̼� ����
  UPDATEDEV_DEV = $0; //��������
  UPDATEDEV_DISPLAY = $1; //������ʾ��


//���ݿ�����
  DATABASE_NAME = 'VSMSdata';

//��ȡ�豸������
  DEVParam_Basic = 0; //��������
  DEVParam_Else = 1; //������ҵ��绰
  DEVParam_KeyPressTel = 2; //�����绰

  //����ͨ��
  COMMUNICATION_GRPS = 0; //GPRS��ʽ
  COMMUNICATION_SMS = 1; //����Ϣ��ʽ

  //�·���������������� û������Ӧ�������Զ�ɾ��
  TIMEOVER_DELORDER = 30000;
  //������״̬
  ORDERSTATE_NODEVANSWER_DEL = 0; //�����·�30���û�г�����Ӧ�������Զ�ɾ��
  ORDERSTATE_WAITGRAB = 1; //�ȴ�����������
  ORDERSTATE_DEVGRAB = 2; //  ���г�������
  ORDERSTATE_SENDINGDEVGRABOK = 3; //�����·������������ɹ�
  ORDERSTATE_SENDDEVGRABOK_FAIL = 4; //�·������������ɹ���ʧ�ܣ�����ûӦ���·������� ����Ҳ��Ӧ�𡣻����޳����ɷ���
  ORDERSTATE_DEVGRABOK = 5; //���������ɹ�
  ORDERSTATE_SRVCANCEL = 6; //����ȡ������
  ORDERSTATE_DEVCANCEL = 7; //����ȡ������

  ORDERSTATE_FINISH = 8;  // �������

 //�̶��˵�����
  LCD_MENU_LENGTH = 39;
 //�̶��˵�����
  LCD_MENU_COUNT = 128;

 //������Ϣ��(PostMessage)����, //��Ӧ�ĺ���: ReturnMsgTypeState
  MSG_TYPE_LCD_MENU = 1; //�̶��˵�.
  MSG_TYPE_CONTRAL_INFO = 2; //������Ϣ.
  MSG_TYPE_TAXI_STOPTIME = 3; //�Ƽ���ͣ��ʱ��
  MSG_TYPE_SEV_INFO = 4; //������֪ͨ��Ϣ;
  MSG_TYPE_DEV_SEND_TO_HOST = 5; // �յ�Dev���͵�Host������
  MSG_TYPE_GPS_MODULE_ERROR = 34; //GPSģ�鷢������
  MSG_TYPE_GPS_LINE_ERROR = 35; //GPS����δ�ӻ򱻼���
  MSG_TYPE_GPS_LINE_SHORT = 36; //GPS���߶�·
  MSG_TYPE_LOW_V = 37; //��ѹ����
  MSG_TYPE_CUT_V = 38;  // �ϵ籨��
  MSG_TYPE_LCD_ERROR = 39; //LCD����
  MSG_TYPE_TTS_ERROR = 40;  //TTSģ�����
  MSG_TYPE_PHOTOVIDICON_ERROR = 41; //����ͷ ����
  MSG_TYPE_MEASURE_ERROR = 42; //�Ƽ�������
  MSG_TYPE_EVALUATOR_ERROR = 43;  // ��������������
  MSG_TYPE_LEDAD_ERROR = 44;//led����� ����         //add sha 20090113
  MSG_TYPE_LCDVIEW_ERROR = 45;  // lcd��ʾ������
  MSG_TYPE_TSM_ERROR = 46;      // TSM��ȫģ�����
  MSG_TYPE_LEDLIGHT_ERROR = 47; // led���ƹ���
  MSG_TYPE_VSS_ERROR = 55; // vss����
  MSG_TYPE_SIM_ERROR = 29; //SIM��δ���ã����߳�����ȡSIM����ʧ��



  MSG_TYPE_ZTUPLOADCARRYXSLC = 35;//30 //�������ϴ��س���̣�����ճ�
  MSG_TYPE_ZTUPLOADOFFXSLC = 36;  //31 //�������ϴ��ճ���̣������س�
  MSG_TYPE_AreaAlarm=32;//�������򱨾�
  //���Ͷϵ繩�͹��硡�����еľ�������
  CUT_OIL = 1; //����
  CUT_ELECTRICITY = 2; //�ϵ�
  FEED_OIL = 3; //����
  FEED_ELECTRICITY = 4; //����


//===================================================================


  //ϵͳ�����������ͨѶ
  SYSADM_USERID = $00FF00FF;
  SYSADM_USERPASS = '{B274AB8A-34D5-476F}';

  //������Web����ͨѶ       20070611
  SYSWEB_USERID = $1002;
  SYSWEB_USERPASS = '1';

  //���ȷ������� ����ġ�TCP�ͻ��� ��¼����
  DISPATCH_USERID = $00FF0100;
  DISPATCH_USERPASS = '{8707A054-5ADA-416B}';

  //������ͷ�������½����
  OTHERSERVER_USERID = $1000;
  //������صķ�������¼�û���
  CHECKGATAWAY_USERID = $1001;

  //===============������������V3.0������Ϣ��ʾ��Ϣ===============//
  MSG_STATE_0 = 0;
  MSG_STATE_1 = 1;
  MSG_STATE_2 = 2;
  MSG_STATE_3 = 3;
  MSG_STATE_4 = 4;
  MSG_STATE_5 = 5;
  MSG_STATE_6 = 6;
  MSG_STATE_7 = 7;
  MSG_STATE_8 = 8;
  MSG_STATE_9 = 9;
  MSG_STATE_10 = 10;
  MSG_STATE_11 = 11;
  MSG_STATE_12 = 12;
  MSG_STATE_13 = 13;
  MSG_STATE_14 = 14;
  MSG_STATE_15 = 15;
  MSG_STATE_16 = 16;
  MSG_STATE_17 = 17;
  MSG_STATE_18 = 18;
  MSG_STATE_19 = 19;
  MSG_STATE_20 = 20;
  MSG_STATE_21 = 21;
  MSG_STATE_22 = 22;
  MSG_STATE_23 = 23;
  MSG_STATE_24 = 24;
  MSG_STATE_25 = 25;
  MSG_STATE_26 = 26;
  MSG_STATE_27 = 27;
  MSG_STATE_28 = 28;
  MSG_STATE_29 = 29;
  MSG_STATE_30 = 30;
  MSG_STATE_31 = 31;
  MSG_Warning_0 = 0;
  MSG_Warning_1 = 1;
  MSG_Warning_2 = 2;
  MSG_Warning_3 = 3;
  MSG_Warning_4 = 4;
  MSG_Warning_5 = 5;
  MSG_Warning_6 = 6;
  MSG_Warning_7 = 7;
  MSG_Warning_8 = 8;
  MSG_Warning_9 = 9;
  MSG_Warning_10 = 10;
  MSG_Warning_11 = 11;
  MSG_Warning_12 = 12;
  MSG_Warning_13 = 13;
  MSG_Warning_14 = 14;
  MSG_Warning_15 = 15;
  MSG_Warning_16 = 16;
  MSG_Warning_17 = 17;
  MSG_Warning_18 = 18;
  MSG_Warning_19 = 19;
  MSG_Warning_20 = 20;
  MSG_Warning_21 = 21;
  MSG_Warning_22 = 22;
  MSG_Warning_23 = 23;
  MSG_Warning_24 = 24;
  MSG_Warning_25 = 25;
  MSG_Warning_26 = 26;
  MSG_Warning_27 = 27;
  MSG_Warning_28 = 28;
  MSG_Warning_29 = 29;
  MSG_Warning_30 = 30;
  MSG_Warning_31 = 31;

  //��ʾ��
  QUERY_WARNING_INFO = '��������ʧ��';

  //�����Ͷ���
  PACKTYPE_TAXI= 1;//01	���⳵Ӧ��
  PACKTYPE_BUS = 2;//02	����Ӧ��
  PACKTYPE_2KE1WEI = 3;//03	����һΣӦ��

  //----------------------��������ƽ̨������Ϣ������--------------------------
    ALARMDEAL_DEALING = $00;//������
    ALARMDEAL_DEALED = $01;//�Ѵ������
    ALARMDEAL_NODEAL = $02;//��������
    ALARMDEAL_DEALINFUTURE = $03;//��������
  //----------------------��������ƽ̨������Ϣ������--------------------------
//------------------------------------------------------------------------------
    //���豸��
    BLANKDEVID = '000000000000';
    //��ʼλ��ʶ
    SPOSFLAG = $40;
    //Э��汾 Ĭ��0x00
    PROTOCOLVER = $00;
    //ҵ������  0x 06	��ؿͻ���
    BIZTYPE = $06;
    //��¼�汾��
    LOGVERSION = $00;
    //͸�������еı�ʶλ
    FLAGTSP = $7E;
    //͸��������Ϣ��������ֵ
    CMDPROPERTY = $03FF;
    //ת���ַ�1
    ESCAPEBYTE1 = $7E;
    //ת���ַ�2
    ESCAPEBYTE2 = $7D;
  {*************************************�ͻ���->����***************************}
    //��¼
    TERMSRV_LOGIN = $01;
    //ע��
    TERMSRV_LOGOUT = $02;
    //ͨ��Ӧ��
    TERMSRV_TYRET = $03;
    //��ȡ��������״̬
    TERMSRV_GETDEVONLINESTAT = $04;
    //��ȡ���λ��
    TERMSRV_LASTGPS_V3 = $05;

    //���챨��������
    TERMSRV_REPLYALRMSUPERVISE = $07;

    //ƽ̨��ڻظ�
    TERMSRV_REPLYGOVCHECKDUTY = $09;
    //����ƽ̨�·�������Ϣ�ظ�
    //TERMSRV_REPLYGOVTEXTINFO = $0A;
    //������ƽ̨���뽻��������λ��Ϣ
    TERMSRV_APPLYGPSDATA = $0A;
    //������ƽ̨ȡ������������λ��Ϣ
    TERMSRV_CANCELGPSDATA = $0B;
    //������ƽ̨�����ϱ�����������
    TERMSRV_ALARMDEALREPLY = $0C;

    //������������
    TERMSRV_EMGCYALARMDEAL_V3 = $A1;

    //͸��ָ��
    TRANSPARENT = $55;
    {********************************͸��������������**************************}
      TERMSRV_SETDEVPARAM_V3 = $8103;//���ò���
      TERMSRV_READDEVPARAM_V3 = $8104;//��ѯ����
      TERMSRV_CONTROLTERMINAL_V3 = $8105;//�ն˿���
      TERMSRV_FINDPOSTION_V3 = $8201;//λ�ò�ѯ
      TERMSRV_PURSUECAR_V3 = $8202;//��ʱλ��׷�ٿ���
      TERMSRV_TEXTINFO_V3 = $8300;//�ı���Ϣ
      TERMSRV_SETEVENT_V3 = $8301;//�¼�����
      TERMSRV_SETANSWER_V3 = $8302;//�����·�
      TERMSRV_SETINFOMENU_V3 = $8303;//��Ϣ�㲥�˵�����
      TERMSRV_SENDINFO_V3 = $8304;//��Ϣ����
      TERMSRV_CALLBACK_V3 = $8400;//�绰�ز�
      TERMSRV_SETPHONEBOOK_V3 = $8401;//���õ绰��
      TERMSRV_DEVCONTROL_V3 = $8500;//��������
      TERMSRV_SETCIRCLEAREA_V3 = $8600;//����Բ������
      TERMSRV_DELCIRCLEAREA_V3 = $8601;//ɾ��Բ������
      TERMSRV_SETRECTAREA_V3 = $8602;//���þ�������
      TERMSRV_DELRECTAREA_V3 = $8603;//ɾ����������
      TERMSRV_SETPOLYGONAREA_V3 = $8604;//���ö��������
      TERMSRV_DELPOLYGONAREA_V3 = $8605;//ɾ�����������
      TERMSRV_SETLINE_V3 = $8606;//����·��
      TERMSRV_DELLINE_V3 = $8607;//ɾ��·��
      TERMSRV_TAKEAPHOTO_V3 = $8801;//����
      TERMSRV_COLLECTRUNRECDATA_V3 = $8700;//�ɼ���ʻ��¼����
      TERMSRV_SETRUNRECPARAM_V3 = $8701;//������ʻ��¼����
        SETRUNRECPARAM_DRIVERNO_OLD = $81;//���ü�ʻԱ���� ����ʻ֤��
        SETRUNRECPARAM_VINCARNOTYPE_OLD = $82;//���ó���VIN�š����ƺ��롢��������
        SETRUNRECPARAM_TIME_OLD = $C2;//���ñ���ʱ��
        SETRUNRECPARAM_CARCCC_OLD = $C3;//��������ϵ��

        SETRUNRECPARAM_CARINFO = $82;//���ó�����Ϣ
        SETRUNRECPARAM_INSTALLDATE = $83;//���ü�¼�ǳ��ΰ�װ����
        SETRUNRECPARAM_STATUSPARAM = $84;//����״̬��������Ϣ
        SETRUNRECPARAM_TIME = $C2;//���ü�¼��ʱ��;
        SETRUNRECPARAM_PULSE = $C3;//���ü�¼������ϵ��
        SETRUNRECPARAM_INITMILEAGE = $C4;//���ó�ʼ���
      TERMSRV_QUERYMEDIADATA_V3 = $8802;//��ý�����ݼ���
      TERMSRV_MEDIADATAUPLOAD_V3 = $8803;//��ý�������ϴ�
      TERMSRV_MEDIADATAUPLOAD_SINGLE_V3 = $8805;//������ý�������ϴ�
      TERMSRV_RECORD_V3 = $8804;//¼������
      TERMSRV_TSPDATA_V3 = $8900;//��������͸��

      //------------��������------------
      TERSRV_UPGRADETERMINAL_BD = $8108;//�·��ն�������
      TERSRV_READPARAMSPEC_BD = $8106;//��ȡָ������
      TERSRV_GETDEVPROPERTY_BD = $8107;//��ѯ�ն�����
      TERSRV_GETDRIVERINFO_BD = $8702;//��ȡ��ʻԱ��Ϣ
      TERSRV_CONFIRMALARM_BD = $8203;//�˹�ȷ�ϱ�����Ϣ
      
      SRVTERM_GETDEVPROPERTY_BD = $0107;//��ѯ�ն�����Ӧ��
      SRVTERM_UPGRADETERMINAL_RET_BD = $0108;//�ն��������֪ͨ

      //------------��������------------
    {********************************͸��������������**************************}

  {*************************************�ͻ���->����***************************}

  {*************************************����->�ͻ���***************************}
    //ͨ��Ӧ��
    SRVTERM_TYRET_V3 = $81;
    //��������״̬
    SRVTERM_DEVONLINE_V3 = $82;
    //��Ƭ�ϴ��ɹ�
    SRVTERM_PICUPLOADOK_V3 = $83;
    //��Ƶ�ϴ��ɹ�
    SRVTERM_AUDIOUPLOADOK_V3 = $84;
    //����Χ������
    SRVTERM_AREAALARM_V3 = $85;
    //��ȡ���λ��
    SRVTERM_LASTGPS_V3 = $86;
    //����ƽ̨��������
    SRVTERM_GOV_ALARMSUPERVISE = $87;
    //����ƽ̨���
    SRVTERM_GOV_CHECKDUTY = $89;
    //����ƽ̨�·�������Ϣ
    SRVTERM_GOV_TEXTINFO = $8A;
    //����ƽ̨�·�Ԥ����Ϣ
    SRVTERM_GOV_EARLYWARNING = $8B;
    //����ƽ̨�·�ʵʱ������Ϣ
    SRVTERM_GOV_ALARM = $8C;
    //����ƽ̨֪ͨ�·�gps��������
    SRVTERM_GOV_GPSDATACOUNT = $8D;
    //����ƽ̨�·�gps����
    SRVTERM_GOV_GPSDATA = $8E;
    //����ƽ̨֪ͨ��ʼ����������λ��Ϣ
    SRVTERM_GOV_STARTGPSDATA = $8F;
    //����ƽ̨֪ͨ��������������λ��Ϣ
    SRVTERM_GOV_ENDGPSDATA = $91;

    //����͸������
    SRVTERM_TRANSPARENT = $D5;
    {*******************************����͸������������*************************}
      SRVTREM_READDEVPARAM_V3 = $0104;//��ȡ��������
      SRVTERM_PGPSDATA_V3 = $0200;    //��λ����
      SRVTERM_FINDPOSTION_V3 = $0201; //λ�ò�ѯӦ��
      SRVTERM_EVENTUPLOAD_V3 = $0301;//�¼�����
      SRVTERM_QUESTIONANSWER_V3 = $0302;//����Ӧ��
      SRVTERM_INFOMENU_V3 = $0303;//��Ϣ�㲥
      SRVTERM_DEVCONTROL_V3 = $0500;//��������Ӧ��
      SRVTERM_RUNRECDATAUPLOAD_V3 = $0700;//��ʻ��¼�������ϴ�
      SRVTERM_ERUNDATA_V3 = $0701;//�����˵��ϴ�
      SRVTERM_DRIVERINFO_V3 = $0702;//��ʻԱ�����Ϣ�ɼ��ϱ�
      SRVTREM_MEDIAEVENTUPLOAD_V3 = $0800;//��ý���¼���Ϣ�ϴ�
      SRVTERM_MEDIADATAUPLOAD_V3 = $0802;//��ý�����ݼ���Ӧ��
      SRVTERM_TSPDATAUPLOAD_V3 = $0900;//��������͸��
      SRVTERM_COMPRESSEDDATA_V3 = $0901;//����ѹ���ϴ�

      SRVTERM_DRIVERLOGIN_V3 = $0B01;//˾��ǩ��
      SRVTERM_DRIVERLOGOUT_V3 = $0B02;//˾��ǩ��
      SRVTERM_TRANSPORTSTART_V3 = $0B03;//���俪ʼ
      SRVTERM_TRANSPORTEND_V3 = $0B04;//�������
    {*******************************����͸������������*************************}

    SRVTERM_SERVERINFO = $E2;//���ķ�����֪ͨƽ̨������������״��
  {*************************************����->�ͻ���***************************}
//------------------------------------------------------------------------------

  SecondsPerMinute = 60;
  SecondsPerHour = 60 * 60;
  SecondsPerDay = 24 * 60 * 60;

function ReturnMsgTypeState(State: integer): string;
//�õ����͵繩�͹���ľ�������
function ReturnCutOrFeedContent(ParamId: Byte): string;
 //�õ������ϴ���Ƭ������ԭ��
function ReturnUploadPicReason(PicReason:byte):String;
//��������
function ReturnDevAlarmType(AlarmType:Byte):string;
implementation


function ReturnMsgTypeState(State: integer): string;
begin
  Result := '';
  case State of
    MSG_Warning_0:  Result := '��������';
    MSG_Warning_1:  Result := '���ٱ���';
    MSG_Warning_2:  Result := 'ƣ�ͼ�ʻ';
    MSG_Warning_3:  Result := 'Ԥ��';
    MSG_Warning_4:  Result := 'GPSģ�鷢������';
    MSG_Warning_5:  Result := 'GPS����δ�ӻ򱻼���';
    MSG_Warning_6:  Result := 'GPS�ն�����Դ����';
    MSG_Warning_7:  Result := '�ն�����ԴǷѹ';
    MSG_Warning_8:  Result := '�ն�����Դ����';
    MSG_Warning_9:  Result := '�ն�����Դ����';
    MSG_Warning_10: Result := 'TTSģ�����';
    MSG_Warning_11: Result := '����ͷ����';
    MSG_Warning_12: ;
    MSG_Warning_13: ;
    MSG_Warning_14: ;
    MSG_Warning_15: ;
    MSG_Warning_16: ;
    MSG_Warning_17: ;
    MSG_Warning_18: Result := '�����ۼƼ�ʻ��ʱ';
    MSG_Warning_19: Result := '��ʱͣ��';
    MSG_Warning_20: Result := '��������';
    MSG_Warning_21: Result := '����·��';
    MSG_Warning_22: Result := '·����ʻʱ�䲻��/����';
    MSG_Warning_23: Result := '·��ƫ�뱨��';
    MSG_Warning_24: Result := '����VSS����';
    MSG_Warning_25: Result := '���������쳣';
    MSG_Warning_26: Result := '��������';
    MSG_Warning_27: Result := '�����Ƿ����';
    MSG_Warning_28: Result := '�����Ƿ�λ��';
    MSG_Warning_29: Result := '��������';
    MSG_Warning_30: ;
    MSG_Warning_31: ;


    {MSG_TYPE_LCD_MENU: Result := '�̶��˵�';
    MSG_TYPE_CONTRAL_INFO: Result := '������Ϣ';
    MSG_TYPE_TAXI_STOPTIME: Result := '�Ƽ���ͣ��ʱ��';
    MSG_TYPE_SEV_INFO: Result := '������֪ͨ��Ϣ';
    MSG_TYPE_DEV_SEND_TO_HOST: Result := '�յ����������ĵ�����';
    MSG_TYPE_GPS_MODULE_ERROR: Result := 'GPSģ�鷢������';
    MSG_TYPE_GPS_LINE_ERROR: Result := 'GPS����δ�ӻ򱻼���';
    MSG_TYPE_LOW_V: Result := '��ѹ����';
    MSG_TYPE_LCD_ERROR: Result := 'LCD����';
    MSG_TYPE_MEASURE_ERROR: Result := '�Ƽ�������';
    MSG_TYPE_SIM_ERROR :Result :='SIM������'; //= 29;
    MSG_TYPE_LEDAD_ERROR: Result :='LED���������';// 30;
    MSG_TYPE_PHOTOVIDICON_ERROR:Result :='����ͷ ����';// = 31; //

    //MSG_TYPE_ZTUPLOADCARRYXSLC :Result := '����������ճ�'; //= 30; //�������ϴ��س���̣�����ճ�
    //MSG_TYPE_ZTUPLOADOFFXSLC :Result := '�����������س�';//= 31;   //�������ϴ��ճ���̣������س�
    MSG_TYPE_AreaAlarm:Result:='�������򱨾�'; //32       }
  end;
end;

function ReturnCutOrFeedContent(ParamId: Byte): string;
begin
  Result := '';
  case ParamId of
    CUT_OIL: Result := '����';
    CUT_ELECTRICITY: Result := '�ϵ�';
    FEED_OIL: Result := '����';
    FEED_ELECTRICITY: Result := '����';
  end;
end;

 //�õ������ϴ���Ƭ������ԭ��
function ReturnUploadPicReason(PicReason:byte):String;
begin
  Result := '';
  case PicReason of
    0: Result := 'ƽ̨�·�';
    1: Result := '��ʱ����';
    2: Result := '���ٱ���';
    3: Result := '��ײ�෭����';
    4: Result := 'ƣ�ͱ���';
  else
    Result:='����ԭ��';
  end;
end;

function ReturnDevAlarmType(AlarmType:Byte):string;
begin
  Result := '';
  case AlarmType of
    MSG_Warning_16 : Result :='���ٱ���';// 17;// ��17λ	1��
    //GPSALARM_DEVCUTPOWER : Result :='�ϵ籨��';// 18;//��18λ	1��
    MSG_Warning_17 : Result :='ƣ�ͼ�ʻ����';// 19;//��19λ	1��
    MSG_Warning_18 : Result :='�ۼƼ�ʻ����';
    MSG_Warning_19 : Result :='ͣ����ʱ����';
    //GPSALARM_INDEVAREA : Result :='������(����)����';// 20;//��20λ	1��
    //GPSALARM_OUTDEVAREA : Result :='������(����)����';// 21;//��21λ	1��
    //GPSALARM_OUTLINE : Result :='ƫ��·�߱���';// 22;//��22λ	1��
    //GPSALARM_FORTIFY : Result :='�������';//23; //��23λ	1: Result :  �Ƿ���������
    //GPSALARM_DEVLOWPOWER : Result :='��ѹ����';// 26;//��26λ	1��
  else
    Result:='������������';
  end;
end;
end.
