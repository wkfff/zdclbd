unit HtmlUnit;

interface



 var SetNoteStr : string='  <html xmlns:v="urn:schemas-microsoft-com:vml">  '                         + #13 + #10
              +'  <head> '                                                                            + #13 + #10
              +'    <meta http-equiv="content-type" content="text/html; charset=GB2312"/>'            + #13 + #10
              +'    <title>�Ͼ�ͨ�ã���ʾ������ͼ</title>'                                            + #13 + #10
              +'    <style type="text/css">v\:*{behavior:url(#default#VML);}</style>'                 + #13 + #10
              +'  </head>'                                                                            + #13 + #10
              +'           '                                                                          + #13 + #10
              +'  <style type="text/css">v\:*{behavior:url(#default#VML);}</style>'                   + #13 + #10
              +'  <script language="javascript" src=http://api.51ditu.com/js/maps.js></script>'       + #13 + #10
              +'  <script language="javascript" src="http://api.51ditu.com/js/search.js"></script>'   + #13 + #10
              +'  <script language="javascript">'                                                     + #13 + #10
              +'    var map = null;												'                                           + #13 + #10
              +'    var StandMapControl = null;						'                                           + #13 + #10
              +'    var PolyLineControl = null; 					'                                           + #13 + #10
              +'    var BEndDraw = false;									'                                           + #13 + #10
              +'    var LocalSearch = null;								'                                           + #13 + #10
              +'    var ZoomSearchControl = null;					'                                           + #13 + #10
              +'    var OverviewMapControl = null;				'                                           + #13 + #10
              +'    var MarkControl = null;								'                                           + #13 + #10
              +'    var	ConfineAreaControl = null;				'                                           + #13 + #10
              +'    var BDrawConfieArea = false;					'                                           + #13 + #10
	            +'                                          '                                           + #13 + #10
              +'    var LogOffSet = 510;									'                                           + #13 + #10
              +'    var LatOffSet = 212;									'                                           + #13 + #10
              +'                                          '                                           + #13 + #10
              +'    var mArrJson = new Array();						'                                           + #13 + #10
              +'    var DevList = new Array();	          '                                           + #13 + #10
              +'    var DevListJSon;											'                                           + #13 + #10
              +'    var HistroyPoint = new Array();				'                                           + #13 + #10
              +'    var SearchMarker = new Array();				'                                           + #13 + #10
              +'    var DefinedMarkerList = new Array();	'                                           + #13 + #10
              +'    var ConfineAreaList = new Array();		'                                           + #13 + #10
              +'    var ConfineAreaPointList = new Array();		'                                       + #13 + #10
              +'                                              '                                       + #13 + #10
              +'    var mMarkerT = null;										  '                                       + #13 + #10
              +'    var mTextT 	= null;											  '                                       + #13 + #10
              +'    var Postion = 0;													'                                       + #13 + #10
              +'    var TimeInterval = 1000;								  '                                       + #13 + #10
              +'    var PolyLineBuf = new Array();					  '                                       + #13 + #10
	            +'                                              '                                       + #13 + #10
              +'    var tempPolyLineBuf = new Array();				'                                       + #13 + #10
	            +'                                              '                                       + #13 + #10
//            +'    // ͼ��                                   '                                       + #13 + #10
              +'    var icon 	= new LTIcon();                 '                                       + #13 + #10
              +'    icon.setImageUrl( "./images/car.gif" );   '                                       + #13 + #10
              +'    icon.setWidth(6);                         '                                       + #13 + #10
              +'    icon.setHeight(6);                        '                                       + #13 + #10
	            +'                                              '                                       + #13 + #10
              +'    function $(mValue){                       '                                       + #13 + #10
              +'      return document.getElementById(mValue); '                                       + #13 + #10
              +'    }                                         '                                       + #13 + #10
	            +'                                              '                                       + #13 + #10
//            +'    // ��ʾ������������ʾ���                 '                                       + #13 + #10
              +'    function showPoint(searchResult)          '                                       + #13 + #10
              +'    {                                         '                                       + #13 + #10
              +'      if(searchResult.count>0)//��������������    '                                 + #13 + #10
              +'      {                                             '                                 + #13 + #10
              +'        ClearSearchMarker();                        '                                 + #13 + #10
              +'       points=[];                                   '                                 + #13 + #10
              +'        var html="";                                '                                 + #13 + #10
              +'        $("searchResult").style.display = "";       '                                 + #13 + #10
              +'        $("searchControl").style.display = "";      '                                 + #13 + #10
              +'        $("searchResult").innerHTML = "";           '                                 + #13 + #10
//              +'        //��ʾ��ҳ��Ϣ                              '
              +'        html+="��"+LocalSearch.totalNumber+"����¼����"+LocalSearch.totalPage+"ҳ,��ǰ��"+searchResult.getPageIndex()+"ҳ<br/><br/>"; '   + #13 + #10
              +'                                                                    '                 + #13 + #10
//            +'        //���ν����������ʾ����ͼ��'                                                 + #13 + #10
              +'        for(var i=0;i<searchResult.count;i++)                       '                 + #13 + #10
              +'        {                                                           '                 + #13 + #10
              +'          var poi=searchResult.searchPoints[i];                     '                 + #13 + #10
              +'          var point=new LTPoint(poi.point[0],poi.point[1]);         '                 + #13 + #10
              +'          var marker=new LTMarker(point);                           '                 + #13 + #10
              +'          map.addOverLay(marker);                                   '                 + #13 + #10
              +'          marker.name=poi.name;                                     '                 + #13 + #10
              +'          SearchMarker[SearchMarker.length]= marker;                '                 + #13 + #10
              +'          LTEvent.bind(marker,"click",marker,function(){this.openInfoWinHtml(this.name)});   '  + #13 + #10
              +'          points.push(point);                                       '                 + #13 + #10
//            +'         //���POI��Ϣ�б�'
              +'          html+=poi.id+''.<span style="cursor:pointer;" onclick="Locate_SearchResult(''+i+'')"/>''+poi.name+''</span><br/>'';'   + #13 + #10
              //+'          //html+=poi.id+''.<span href="#" target="_blank" onclick="Locate_SearchResult(''+i+'')"/>'+poi.name+'</span><br/>';	//���POI��Ϣ�б�'
              +'        }                                                           '                 + #13 + #10
              +'        $("searchResult").innerHTML=html;                           '                 + #13 + #10
              +'        map.getBestMap(points);                                     '                 + #13 + #10
              +'      }                                                             '                 + #13 + #10
              +'      else                                                          '                 + #13 + #10
              +'      {                                                             '                 + #13 + #10
              +'        alert(''�޽��'');                                          '                 + #13 + #10
              +'      }                                                             '                 + #13 + #10
              +'    }                                                               '                 + #13 + #10
              +'                                                                    '                 + #13 + #10
//              +'    // ��ʼ����ͼ                                                 '                 + #13 + #10
              +'    function onLoad()                                               '                 + #13 + #10
              +'    {                                                               '                 + #13 + #10
              +'      map =new LTMaps("mapDiv");                                    '                 + #13 + #10
//            +'     //����ͼ��λ���Ͼ�,�Ķ�"nanjing"���Խ���ͼ��λ����������       '                 + #13 + #10
              +'      var city = window.external.GetDefaultMap();                   '                 + #13 + #10
              +'      ChangeCity(city);                                             '
//              +'      // ��׼���ſؼ�                                             '                 + #13 + #10
              +'      StandMapControl = new LTStandMapControl();                    '                 + #13 + #10
              +'      map.addControl(StandMapControl);                              '                 + #13 + #10
              +'      map.handleMouseScroll(true);//���������ֹ���֧�֣�����true����ʹ�����ָ���λ�ò���ģʽ   '  + #13 + #10
		          +'                                                                    '                 + #13 + #10
//              +'      // ���ؼ�                                                 '                 + #13 + #10
              +'      PolyLineControl = new LTPolyLineControl();                    '                 + #13 + #10
              +'      PolyLineControl.setTips("˫���������");                      '                 + #13 + #10
              +'      LTEvent.bind(map,"dblclick",PolyLineControl,endDraw);//��˫����ͼ��ʱ����ý�������          '  + #13 + #10
              +'      map.addControl( PolyLineControl );                            '                 + #13 + #10
              +'      PolyLineControl.setVisible(false);                            '                 + #13 + #10
              +'                                                                    '                 + #13 + #10
//              +'      // ��ע�ؼ�                                                 '                 + #13 + #10
              +'      //var MarkControl = new LTMarkControl();                      '                 + #13 + #10
              +'      //map.addControl( MarkControl );                              '                 + #13 + #10
              +'                                                                    '                 + #13 + #10
//              +'      // ������ѯ                                                 '                 + #13 + #10
              +'      LocalSearch = new LTLocalSearch(showPoint);                   '                 + #13 + #10
//            +'      //����ÿҳ��ʾ������                                          '                 + #13 + #10
              +'      LocalSearch.pagecap=10;	                                      '                 + #13 + #10
              +'      LocalSearch.setCity("�Ͼ�");                                '                 + #13 + #10
//              +'      //LocalSearch.search(''�йش�'');                           '                 + #13 + #10
              +'                                                                    '                 + #13 + #10
//            +'      // ����ѡ��                                                   '                 + #13 + #10
              +'      ZoomSearchControl = new LTZoomSearchControl();                '                 + #13 + #10
              +'      ZoomSearchControl.setLabel("����ѡ��");                       '                 + #13 + #10
              +'      ZoomSearchControl.setLeft(680);                               '                 + #13 + #10
              +'      ZoomSearchControl.setTop(15);                                 '                 + #13 + #10
//            +'      //��Ӿ���ѡ���ؼ�����ͼ                                      '                 + #13 + #10
              +'      map.addControl(ZoomSearchControl);			                      '                 + #13 + #10
              +'      ZoomSearchControl.setVisible(false);                          '                 + #13 + #10
//            +'      //�������û��������֮��ִ��doit����                          '                 + #13 + #10
              +'      LTEvent.addListener(ZoomSearchControl,"mouseup",doit);	      '                 + #13 + #10
              +'                                                                    '                 + #13 + #10
//              +'      // ӥ��                                                     '                 + #13 + #10
              +'      OverviewMapControl = new LTOverviewMapControl(null,null,null,null,null,2);  '   + #13 + #10
//            +'      // ӥ�۵�ͼ������ͼ֮���϶�ı߿���ɫ'                                          + #13 + #10
              +'      OverviewMapControl.setBorderColor("black");				            '                 + #13 + #10
//            +'      // ӥ�۵�ͼ������ͼ֮���϶�ı�����ɫ'                                          + #13 + #10
              +'      OverviewMapControl.setBackColor("gray");					            '                 + #13 + #10
//            +'      // ӥ�۵�ͼ�ϵľ��ο�ı�����ɫ'
              +'      OverviewMapControl.setRectBackColor("gray");			            '                 + #13 + #10
//            +'      // ӥ�۵�ͼ�ϵľ��ο�ı߿���ɫ'
              +'      OverviewMapControl.setRectBorderColor("black");		            '                 + #13 + #10
//            +'      // Ĭ�Ͻ�ӥ������Ϊ�ر�״̬'
              +'      OverviewMapControl.changeView();									            '                 + #13 + #10
              +'      map.addControl(OverviewMapControl);                           '                 + #13 + #10
              +'                                                                    '                 + #13 + #10
//              +'      // ��ע                                                     '
              +'      MarkControl = new LTMarkControl();                            '                 + #13 + #10
              +'      map.addControl(MarkControl);                                  '                 + #13 + #10
              +'      MarkControl.setVisible(false);                                '                 + #13 + #10
//            +'      //�ڱ�ע���֮������getPoi����                                '
              +'      LTEvent.addListener( MarkControl , "mouseup" , getPoi );      '                 + #13 + #10
              +'                                                                    '
//              +'      // ���õ���Χ���õı�ע�����ڻ�ȡ��굱ǰλ�õľ�γ��       '
              +'      ConfineAreaControl = new LTMarkControl(false);                '                 + #13 + #10
              +'      ConfineAreaControl.setVisible(false);                         '                 + #13 + #10
              +'      map.addControl(ConfineAreaControl);                           '                 + #13 + #10
//            +'      //�ڱ�ע���֮������getConfinePoi����'
              +'      LTEvent.addListener( ConfineAreaControl , "mouseup" , getConfinePoi );   '      + #13 + #10
              +'                                                                               '      + #13 + #10
//            +'      // ������ؼ�                                                            '      + #13 + #10
              +'      //PolygonControl = new LTPolygonControl();                               '      + #13 + #10
//            +'      //��͸����                                                               '      + #13 + #10
//            +'      //PolygonControl.fillColor="transparent";		                             '      + #13 + #10
//            +'      //map.addControl(PolygonControl);                                        '      + #13 + #10
              +'                                                                               '
//            +'      //������ͼƬ                                                           '
              +'      document.getElementById("mapDiv").style.backgroundImage = "url(''file://E:/delphi/��ؿͻ�����ģʽ/client_cs/bin_taxi/images/bg.gif'')";  '  + #13 + #10
              +'                                                                               '      + #13 + #10
              +'      for (var i=0; i < document.getElementsByTagName("div").length; i ++){    '      + #13 + #10
              +'        if (document.getElementsByTagName("div")[i].style.zIndex == 65535){    '      + #13 + #10
              +'            document.getElementsByTagName("div")[i].innerHTML = "�Ͼ�ͨ�õ������޹�˾";      '  + #13 + #10
              +'          }                                                                    '      + #13 + #10
              +'      }                                                                        '      + #13 + #10
              +'                                                                               '      + #13 + #10
//            +'      // �����Զ����ǩ                                                        '
              +'      InitDefinedMarker(window.external.GetDefinedTextList());                 '     + #13 + #10
              +'      SetBackGround();                                                         '     + #13 + #10
              +'      OpenRefreshDev();                                                        '
              +'    }                                                                          '     + #13 + #10
              +'                                                                               '     + #13 + #10
              +'     // �л���ͼ                                                               '      + #13 + #10
              +'     function ChangeCity(City){                                                '      + #13 + #10
		          +'      map.centerAndZoom(City, 5);//����ͼ��λ���Ͼ�,�Ķ�"nanjing"���Խ���ͼ��λ����������  '  + #13 + #10
              +'     }                                                                         '      + #13 + #10
              +'    // ��ͼ�����꣬�򿪵�ͼˢ�¹���                                                                           '     + #13 + #10
              +'    function OpenRefreshDev(){                                                 '
              +'      window.external.OpenRefreshDev();'
              +'    }'
//            +'    // �����������û�ÿ������������֮��ִ�еĲ�����bounds�Ǵ����û�����ѡ�������ķ�Χ   '
//            +'    // ����ѡ����                                                           '
              +'    function doit(bounds)                                                     '
              +'    {                                                                         '      + #13 + #10
              +'      var str="��ѡ�����������Ϊ��\n";                                       '      + #13 + #10
              +'      str+="���Ͻ����꣺"+bounds.getXmin()+","+bounds.getYmax()+"\n";         '      + #13 + #10
              +'      str+="���½����꣺"+bounds.getXmax()+","+bounds.getYmin()+"\n";         '      + #13 + #10
              +'                                                                              '      + #13 + #10
              +'                                                                              '      + #13 + #10
              +'      var devListStr = " ";                                                   '      + #13 + #10
              +'      for (var i=0; i<mArrJson.length; i++){                                  '      + #13 + #10
              +'        if (mArrJson[i].mObjMarkers.getPoint().getLongitude()>bounds.getXmin()   '   + #13 + #10
              +'          && mArrJson[i].mObjMarkers.getPoint().getLongitude()<bounds.getXmax()  '   + #13 + #10
              +'          && mArrJson[i].mObjMarkers.getPoint().getLatitude()>bounds.getYmin()   '   + #13 + #10
              +'          && mArrJson[i].mObjMarkers.getPoint().getLatitude()<bounds.getYmax()){ '   + #13 + #10
              +'            devListStr = devListStr + mArrJson[i].mObjStrId + '','';             '   + #13 + #10
              +'        }                                                                     '      + #13 + #10
              +'      }                                                                       '      + #13 + #10
              +'      window.external.SelectDevList(devListStr);                              '      + #13 + #10
              +'    }                                                                         '      + #13 + #10
              +'                                                                              '      + #13 + #10
              +'                                                                              '      + #13 + #10
              +'    function getPoi(point)                                                    '      + #13 + #10
              +'    {                                                                         '      + #13 + #10
//              +'      //�û�����                                                            '      + #13 + #10
//              +'      //alert( "γ�ȣ�" + point.getLatitude() + "\n���ȣ�" + point.getLongitude());     '
//              +'      //����һ�������������Զ����ǩ                                                  '
              +'      try{                                                                    '      + #13 + #10
              +'        var DefinedMarker = {IdStr:'', Text:'', log:'', lat:'', mObjMarker:null};'   + #13 + #10
//              +'        //var marker = new LTMarker( new LTPoint( point.getLongitude() , point.getLatitude()));//, icon ); '
              +'        var marker = new LTMapText(point);                                    '      + #13 + #10
              +'        var s = window.external.UserDefinedText(point.getLongitude()-510 , point.getLatitude()+212); ' + #13 + #10
              +'        var json = strToJson(s);                                              '      + #13 + #10
              +'        DefinedMarker.Text = json[0].Text;                                    '      + #13 + #10
              +'        DefinedMarker.IdStr = json[0].IdStr                                   '      + #13 + #10
              +'        DefinedMarker.mObjMarker = marker;                                    '      + #13 + #10
              +'        marker.setLabel(DefinedMarker.Text);                                  '      + #13 + #10
//            +'        //����������Ϊû�б߿�'
              +'        marker.setBorderLine(0);                                              '      + #13 + #10
              +'        marker.setBackgroundColor("")                                         '      + #13 + #10
              +'                                                                              '      + #13 + #10
              +'        map.addOverLay( marker );                                             '      + #13 + #10
              +'        DefinedMarkerList[DefinedMarkerList.length] = DefinedMarker;          '      + #13 + #10
              +'      }                                                                       '      + #13 + #10
              +'      catch(err){                                                             '      + #13 + #10
              +'      }                                                                       '      + #13 + #10
              +'    }                                                                         '      + #13 + #10
	            +'                                                                              '      + #13 + #10
//              +'    // ���ص����Զ����ǩ                                                   '      + #13 + #10
              +'    function LoadDefinedMarker(log, lat, Text, IdStr){                        '      + #13 + #10
              +'      var DefinedMarker = {IdStr:'', Text:'', log:'', lat:'', mObjMarker:null};   '  + #13 + #10
//              +'      //var marker = new LTMarker( new LTPoint(log , lat));                 '      + #13 + #10
              +'      var marker = new LTMapText( new LTPoint(log , lat));                    '      + #13 + #10
              +'      DefinedMarker.Text = Text;                                              '      + #13 + #10
              +'      DefinedMarker.IdStr = IdStr;                                            '      + #13 + #10
              +'      DefinedMarker.mObjMarker = marker;                                      '      + #13 + #10
              +'      marker.setLabel(DefinedMarker.Text);                                    '      + #13 + #10
//            +'      //����������Ϊû�б߿�'
              +'      marker.setBorderLine(0);                                                '      + #13 + #10
              +'      marker.setBackgroundColor("")                                           '      + #13 + #10
		          +'                                                                              '      + #13 + #10
              +'      map.addOverLay( marker );                                               '      + #13 + #10
              +'      DefinedMarkerList[DefinedMarkerList.length] = DefinedMarker;            '      + #13 + #10
              +'    }                                                                         '      + #13 + #10
	            +'                                                                              '      + #13 + #10
//              +'    // ��ͼ���غ��ʼ���Զ����ǩ                                           '      + #13 + #10
              +'    function InitDefinedMarker(json){                                         '      + #13 + #10
              +'      while(DefinedMarkerList.pop());                                         '      + #13 + #10
              +'      var DefinedMarkerListJSON = strToJson(json);                            '      + #13 + #10
              +'      for (var i=0; i<DefinedMarkerListJSON.length; i++){                     '      + #13 + #10
              +'        LoadDefinedMarker(DefinedMarkerListJSON[i].log, DefinedMarkerListJSON[i].lat,      '   + #13 + #10
              +'                          DefinedMarkerListJSON[i].Text, DefinedMarkerListJSON[i].IdStr);  '   + #13 + #10
              +'      }                                                                       '      + #13 + #10
              +'    }                                                                         '      + #13 + #10
	            +'                                                                              '      + #13 + #10
//              +'    // ��ӱ�ע                                                             '      + #13 + #10
              +'    function MarkControlBtnClick(){                                           '      + #13 + #10
              +'      MarkControl.btnClick();                                                 '      + #13 + #10
              +'    }                                                                         '      + #13 + #10
	            +'                                                                              '      + #13 + #10
//              +'    // ��λ�Զ����ǩ                                                       '      + #13 + #10
              +'    function Locate_DefinedMarker(IdStr){                                     '      + #13 + #10
              +'      for (var i=0; i<DefinedMarkerList.length; i++){                         '      + #13 + #10
              +'        if (DefinedMarkerList[i].IdStr == IdStr){                             '      + #13 + #10
              +'          map.centerAndZoom(DefinedMarkerList[i].mObjMarker.getPoint(), map.getCurrentZoom());    '   + #13 + #10
              +'          break;                                                              '      + #13 + #10
              +'        }                                                                     '      + #13 + #10
              +'      }                                                                       '      + #13 + #10                                                       
              +'    }                                                                         '      + #13 + #10
              +'                                                                              '      + #13 + #10
//              +'    // �޸Ļ�ɾ���Զ����ǩ   m=true �޸ģ� m=false ɾ��                    '      + #13 + #10
              +'    function ModifyOrDeleteDefinedMarker(m, IdStr, Text){                     '      + #13 + #10
              +'      if (m) {	                                                              '      + #13 + #10
              +'        for (var i=0; i<DefinedMarkerList.length; i++){                       '      + #13 + #10
              +'          if (DefinedMarkerList[i].IdStr == IdStr){                           '      + #13 + #10
              +'            DefinedMarkerList[i].Text = Text;                                 '      + #13 + #10
              +'            DefinedMarkerList[i].mObjMarker.setLabel(Text);                   '      + #13 + #10
              +'            break;                                                            '      + #13 + #10
              +'          }                                                                   '      + #13 + #10
              +'        }                                                                     '      + #13 + #10
              +'      }else{		                                                              '      + #13 + #10
              +'        for (var i=0; i<DefinedMarkerList.length; i++){                       '      + #13 + #10
              +'          if (DefinedMarkerList[i].IdStr == IdStr){                           '      + #13 + #10
              +'            map.removeOverLay(DefinedMarkerList[i].mObjMarker, true);         '      + #13 + #10
              +'            DefinedMarkerList.splice(i, 1);                                   '      + #13 + #10
              +'            break;                                                            '      + #13 + #10
              +'          }                                                                   '      + #13 + #10
              +'        }                                                                     '      + #13 + #10
              +'      }                                                                       '      + #13 + #10
              +'    }                                                                         '      + #13 + #10
	            +'                                                                              '      + #13 + #10
//              +'    // ����ѡ��                                                             '      + #13 + #10
              +'    function ZoomSearchControlBtnClick(){                                     '      + #13 + #10
		          +'                                                                              '      + #13 + #10
              +'      if ($("jxxc").style.background == "gainsboro"){                         '      + #13 + #10
              +'        $("jxxc").style.background ="white";                                  '      + #13 + #10
              +'      }else{                                                                  '      + #13 + #10
              +'        $("jxxc").style.background ="gainsboro";                              '      + #13 + #10
              +'      }                                                                       '      + #13 + #10
              +'      ZoomSearchControl.btnClick();                                           '      + #13 + #10
              +'    }                                                                         '      + #13 + #10
	            +'                                                                              '      + #13 + #10
//              +'    // ��ʼ���                                                             '      + #13 + #10
              +'    function PolyLineControlBtnClick()                                        '      + #13 + #10
              +'    {                                                                         '      + #13 + #10
//            +'      // �������ѡ�����Ǵ��ڹ���״̬�������¸�����ѡ���ؼ�����Ϊ����״̬'
//            +'      // ��ͼ��֧�ֲ��ؼ��;���ѡ��ؼ�ͬʱʹ��'
              +'      if ($("jxxc").style.background == "white"){		                          '      + #13 + #10
              +'        ZoomSearchControlBtnClick();								                          '      + #13 + #10
              +'      }else{                                                                  '      + #13 + #10
              +'      }                                                                       '      + #13 + #10
              +'                                                                              '      + #13 + #10
              +'      $("cj").style.background ="White";                                      '      + #13 + #10
              +'      PolyLineControl.btnClick();                                             '      + #13 + #10
              +'      BEndDraw = true;                                                        '      + #13 + #10
              +'    }                                                                         '      + #13 + #10
	            +'                                                                              '      + #13 + #10
//              +'    // �������                                                             '      + #13 + #10
              +'    function endDraw()                                                        '      + #13 + #10
              +'    {                                                                         '      + #13 + #10
              +'      if (BDrawConfieArea == true){                                           '      + #13 + #10
              +'        DrawConfieArea();                                                     '      + #13 + #10
              +'      }else{                                                                  '      + #13 + #10
              +'        if (BEndDraw == true){                                                '      + #13 + #10
              +'          PolyLineControl.endDraw();                                          '      + #13 + #10
              +'          PolyLineControl.btnClick();                                         '      + #13 + #10
              +'          $("cj").style.background ="Gainsboro";                              '      + #13 + #10
              +'          BEndDraw = false;                                                   '      + #13 + #10
              +'        }                                                                     '      + #13 + #10
              +'      }                                                                       '      + #13 + #10
              +'    }                                                                         '      + #13 + #10
	            +'                                                                              '      + #13 + #10
//              +'    // ��ӵ���Χ��                                                         '      + #13 + #10
              +'    function AddConfineArea(){                                                '      + #13 + #10
              +'      BDrawConfieArea = true;                                                 '      + #13 + #10
              +'      ConfineAreaControl.btnClick();                                          '      + #13 + #10
              +'    }                                                                         '      + #13 + #10
	            +'                                                                              '      + #13 + #10
              +'    function getConfinePoi(point)                                             '      + #13 + #10
              +'    {                                                                         '      + #13 + #10
//              +'      //�û�����                                                                       '  + #13 + #10
//              +'      //alert( "γ�ȣ�" + point.getLatitude() + "\n���ȣ�" + point.getLongitude());    '  + #13 + #10
              +'      ConfineAreaPointList[ConfineAreaPointList.length] = point;              '      + #13 + #10
		          +'                                                                              '      + #13 + #10
              +'      if (ConfineAreaPointList.length > 1){                                   '      + #13 + #10
              +'        var points = new Array();                                             '      + #13 + #10
              +'        points.push(ConfineAreaPointList[ConfineAreaPointList.length-2]);     '      + #13 + #10
              +'        points.push(ConfineAreaPointList[ConfineAreaPointList.length-1]);     '      + #13 + #10
//              +'        //���ݵ����鴴��һ������                                            '      + #13 + #10
              +'        var polyLine = new LTPolyLine( points );                              '      + #13 + #10
//            +'        //���������߿�'
              +'        polyLine.setLineStroke(2);	                                          '      + #13 + #10
//              +'        //��������ӵ���ͼ                                                                                        '
              +'        map.addOverLay( polyLine );                                           '      + #13 + #10
              +'        tempPolyLineBuf[tempPolyLineBuf.length] = polyLine;                   '      + #13 + #10
              +'      }                                                                       '      + #13 + #10
              +'      ConfineAreaControl.btnClick();                                          '      + #13 + #10
              +'    }                                                                         '      + #13 + #10
	            +'                                                                              '      + #13 + #10
//              +'    // �������--����Χ��                                                                                                                          '
              +'    function DrawConfieArea(){                                                '      + #13 + #10
              +'      try{                                                                    '      + #13 + #10
              +'        if (ConfineAreaPointList.length<=2){                                  '      + #13 + #10
              +'          alert("���Ƶ���Χ����Ҫ����3���㣡");                               '      + #13 + #10
              +'          exit;                                                               '      + #13 + #10
              +'        }                                                                     '      + #13 + #10
              +'        var ConfineArea = {IdStr:'', Text:'', mObjMarker:null, points:null};  '      + #13 + #10
              +'        var points = new Array();                                             '      + #13 + #10
              +'        for (var i=0; i<ConfineAreaPointList.length; i++){                    '      + #13 + #10
              +'          points.push(ConfineAreaPointList[i]);                               '      + #13 + #10
              +'        }                                                                     '      + #13 + #10
//              +'        //���ݵ����鴴��һ�������                                          '      + #13 + #10
              +'        var polygon = new LTPolygon(points);                                  '      + #13 + #10
              +'        polygon.setFillColor("transparent");                                  '      + #13 + #10
              +'        polygon.setLineStroke(2);                                             '      + #13 + #10
              +'                                                                              '      + #13 + #10
//              +'        //���������ӵ���ͼ                                                '      + #13 + #10
              +'        map.addOverLay(polygon);                                              '      + #13 + #10
			        +'                                                                              '      + #13 + #10
              +'        var LogLatStr = '' '';                                                '      + #13 + #10
              +'        for (var i=0; i<ConfineAreaPointList.length; i++){                    '      + #13 + #10
              +'          var log = ConfineAreaPointList[i].getLongitude()-510;               '      + #13 + #10
              +'          var lat = ConfineAreaPointList[i].getLatitude()+212;                '      + #13 + #10
              +'                                                                              '      + #13 + #10
              +'          LogLatStr = LogLatStr + log + '','' +  lat + '';'';                 '      + #13 + #10
              +'        }                                                                     '      + #13 + #10
              +'        var json = strToJson(window.external.SetConfineArea(LogLatStr));      '      + #13 + #10
              +'        ConfineArea.IdStr = json[0].IdStr;                                    '      + #13 + #10
              +'        ConfineArea.Text = json[0].Text;                                      '      + #13 + #10
              +'        ConfineArea.mObjMarker = polygon;                                     '      + #13 + #10
              +'        ConfineArea.points = points;                                          '      + #13 + #10
              +'        ConfineAreaList[ConfineAreaList.length] = ConfineArea;                '      + #13 + #10
              +'                                                                              '      + #13 + #10
//            +'        //���������ӵ���¼���'
              +'        LTEvent.addListener(polygon, "click", function(){alert(ConfineArea.Text)});	 '  + #13 + #10
//              +'        //LTEvent.bind(polygon,"click",polygon,onClick);                                                          '
              +'      }                                                                       '      + #13 + #10
              +'      catch(err){                                                             '      + #13 + #10
              +'      }                                                                       '      + #13 + #10
              +'      finally{                                                                '      + #13 + #10
              +'        ConfineAreaControl.btnClick();                                        '      + #13 + #10
              +'        BDrawConfieArea = false;                                              '      + #13 + #10
              +'        while(ConfineAreaPointList.pop());                                    '      + #13 + #10
              +'        for (var i=0; i<tempPolyLineBuf.length; i++){                         '      + #13 + #10
              +'          map.removeOverLay(tempPolyLineBuf[i], true);                        '      + #13 + #10
              +'        }                                                                     '      + #13 + #10
              +'        while(tempPolyLineBuf.pop());                                         '      + #13 + #10
              +'      }                                                                       '      + #13 + #10
              +'    }                                                                         '      + #13 + #10
              +'                                                                              '      + #13 + #10
//              +'    // ɾ��һ������Σ�������Χ��                                           '      + #13 + #10
              +'    function DeleteAConfineArea(IdStr){                                       '      + #13 + #10
              +'      for (var i=0; i<ConfineAreaList.length; i++){                           '      + #13 + #10
              +'        if (ConfineAreaList[i].IdStr == IdStr){                               '      + #13 + #10
              +'          map.removeOverLay(ConfineAreaList[i].mObjMarker, true);             '      + #13 + #10
              +'          ConfineAreaList.splice(i, 1);                                       '      + #13 + #10
              +'          break;                                                              '      + #13 + #10
              +'        }                                                                     '      + #13 + #10
              +'      }                                                                       '      + #13 + #10
              +'    }                                                                         '      + #13 + #10
              +'                                                                              '      + #13 + #10
//              +'    // ɾ�����еĶ���Σ�������Χ��                                                                                                                                   '
              +'    function DeleteAllConfineArea(){                                          '      + #13 + #10
              +'      for (var i=0; i<ConfineAreaList.length; i++){                           '      + #13 + #10
              +'        map.removeOverLay(ConfineAreaList[i].mObjMarker, true);               '      + #13 + #10
              +'      }                                                                       '      + #13 + #10
              +'      while(ConfineAreaList.pop());                                           '      + #13 + #10
              +'    }                                                                         '      + #13 + #10
              +'                                                                              '      + #13 + #10
//              +'    // �޸�һ������Σ�������Χ��                                           '      + #13 + #10
              +'    function ModifyAConfineArea(IdStr, Text, Color){                          '      + #13 + #10
              +'      for (var i=0; i<ConfineAreaList.length; i++){                           '      + #13 + #10
              +'        if (ConfineAreaList[i].IdStr == IdStr){                               '      + #13 + #10
              +'          ConfineAreaList[i].Text = Text;                                     '      + #13 + #10
//            +'           //���������ӵ���¼���'
//              +'          //LTEvent.addListener(ConfineAreaList[i].mObjMarker, "click", function(){alert(Text)});	                               '
//              +'          //ConfineAreaList[i].mObjMarker.setLineColor("255");                                                                                            '
              +'        }                                                                     '      + #13 + #10
              +'      }                                                                       '      + #13 + #10
              +'    }                                                                         '      + #13 + #10
              +'                                                                              '      + #13 + #10
//              +'    // ��λ����Χ��                                                                                                                                  '
              +'    function Locate_ConfineArea(log, lat){                                    '      + #13 + #10
              +'      var point=new LTPoint(log, lat);                                        '      + #13 + #10
              +'      map.centerAndZoom(point, map.getCurrentZoom());                         '      + #13 + #10
              +'    }                                                                         '      + #13 + #10
              +'                                                                              '      + #13 + #10
//              +'    // ˢ�µ�������                                                         '      + #13 + #10
              +'    function RefreshDev(log, lat, idstr, carno, ColorStr, GpsTime)            '      + #13 + #10
              +'    {                                                                         '      + #13 + #10
              +'      var b = true;                                                           '      + #13 + #10
              +'      for (var i=0; i<mArrJson.length; i++){                                  '      + #13 + #10
              +'        if (mArrJson[i].mObjStrId == idstr){                                  '      + #13 + #10
              +'                                                                              '      + #13 + #10
//              +'          /*if (mArrJson[i].GpsTime != GpsTime){	// GPSʱ��仯��˵���ö�λ�������¶�λ�㣬��Ҫˢ�¸ó�������Ϣ                        '
//              +'              mArrJson[i].mObjMarkers.setFontColor(ColorStr);	// �¶�λ���У�����״̬���ܸı䣬����Ҫ���µ�ǰ������ɫ                  '
//              +'          }                                                                                                                           '
//              +'                                                                                                                                       '
//              +'          if ((mArrJson[i].mObjMarkers.getPoint().getLongitude()==log) && (mArrJson[i].mObjMarkers.getPoint().getLatitude()==lat)){ '
//              +'            // ������¶�λ��ľ�γ�Ⱥ��ϸ���λ��ľ�γ����ͬ��������ˢ�¸ĳ�����λ��                                              '
//              +'            //mArrJson[i].mObjMarkers.setPoint(mArrJson[i].mObjMarkers.getPoint());                                               '
//              +'          }                                                                                                                      '
//              +'          else{                                                                                                                 '
//              +'            var mpoint = new LTPoint(log, lat);                                                                                '
//              +'            mArrJson[i].mObjMarkers.setPoint(mpoint);                                                                         '
//              +'            mArrJson[i].mObjMarkers.setFontColor(ColorStr);	// �¶�λ���У�����״̬���ܸı䣬����Ҫ���µ�ǰ������ɫ          '
//              +'          } */                                                                                                              '
              +'                                                                              '     + #13 + #10
              +'          var mpoint = new LTPoint(log, lat);                                 '     + #13 + #10
              +'          mArrJson[i].mObjMarkers.setPoint(mpoint);                           '     + #13 + #10
//            +'          // �¶�λ���У�����״̬���ܸı䣬����Ҫ���µ�ǰ������ɫ'
              +'          mArrJson[i].mObjMarkers.setFontColor(ColorStr);	                    '     + #13 + #10
              +'          b = false;                                                          '     + #13 + #10
              +'          break;                                                              '     + #13 + #10
              +'                                                                              '     + #13 + #10
              +'        }                                                                     '     + #13 + #10
              +'      }                                                                       '     + #13 + #10
              +'                                                                              '     + #13 + #10
              +'      if (b){                                                                 '     + #13 + #10
//              +'        //����һ����������ע                                              '     + #13 + #10
              +'        var mMarkerOp = {mObjStrId:'',mObjMarkers:null,mObjHtml: null, mObjText: null, mObjFlag: true, mCarNo: '', ColorStr: '', GpsTime: ''};  '  + #13 + #10
//              +'        //var marker = new LTMarker( new LTPoint( log , lat ), icon );      '     + #13 + #10
              +'        var marker = new LTMapText( new LTPoint( log , lat ));                '     + #13 + #10
              +'        marker.setLabel("��");                                                '     + #13 + #10
              +'        marker.setFontSize(8);                                                '     + #13 + #10
              +'        marker.setFontColor(ColorStr);                                        '     + #13 + #10
              +'        marker.setBorderLine(0);//����������Ϊû�б߿�                        '     + #13 + #10
              +'        marker.setBackgroundColor("")                                         '     + #13 + #10
              +'        map.addOverLay( marker );                                             '     + #13 + #10
              +'                                                                              '     + #13 + #10
              +'        mMarkerOp.mObjStrId = idstr;                                          '     + #13 + #10
              +'        mMarkerOp.mCarNo = carno;                                             '     + #13 + #10
              +'        mMarkerOp.ColorStr = ColorStr;                                        '     + #13 + #10
              +'        mMarkerOp.GpsTime = GpsTime;                                          '     + #13 + #10
              +'        mMarkerOp.mObjMarkers = marker;                                       '     + #13 + #10
              +'        mArrJson[mArrJson.length] = mMarkerOp;                                                   '      + #13 + #10
//              +'        //LTEvent.addListener(marker1,"mouseover",show);//�ڵ�ͼ�б仯��ʱ����ʾ�µľ�γ��     '      + #13 + #10
              +'                                                                                                 '      + #13 + #10
              +'        var html="<br>���ƺţ�" + carno + "</br><br>�豸ID��" + idstr + "</br>";                 '      + #13 + #10
              +'        LTEvent.addListener(marker,"mouseover",getMouseOverCallBack(mMarkerOp,html));            '      + #13 + #10
              +'        LTEvent.addListener(marker,"mouseout",getMouseOutCallBack(marker));                      '      + #13 + #10
              +'      }                                                                       '    + #13 + #10
              +'    }                                                                         '    + #13 + #10
              +'                                                                              '    + #13 + #10
//              +'    // ѭ��ˢ�³���                                                         '    + #13 + #10
              +'    function RefreshDevList(json)                                             '    + #13 + #10
              +'    {                                                                         '    + #13 + #10
              +'      try{                                                                    '    + #13 + #10
//              +'        //var myDate = new Date();                                          '    + #13 + #10
//              +'        //var j = myDate.getSeconds()+'':''+myDate.getMilliseconds();       '    + #13 + #10
              +'        DevListJSon = strToJson(json);                                        '    + #13 + #10
              +'        var bounds = map.getBoundsLatLng();                                   '    + #13 + #10
              +'        for (var i=0; i<DevListJSon.length; i++){                             '    + #13 + #10
              +'          try{                                                                '    + #13 + #10
//            +'            // ���¶�λ���ڵ�ͼ��ʾ��Χ��'
              +'            if (DevListJSon[i].log>bounds.getXmin()                           '    + #13 + #10
              +'              && DevListJSon[i].log<bounds.getXmax()                          '    + #13 + #10
              +'              && DevListJSon[i].lat>bounds.getYmin()                          '    + #13 + #10
              +'              && DevListJSon[i].lat<bounds.getYmax()){                        '    + #13 + #10
              +'                RefreshDev(DevListJSon[i].log, DevListJSon[i].lat, DevListJSon[i].IdStr, DevListJSon[i].CarNo,   '     + #13 + #10
              +'                           DevListJSon[i].ColorStr, DevListJSon[i].GpsTime);  '    + #13 + #10
              +'            }                                                                 '    + #13 + #10
              +'          }                                                                   '    + #13 + #10
              +'          catch(err){                                                         '    + #13 + #10
              +'          }                                                                   '    + #13 + #10
              +'        }                                                                     '    + #13 + #10
//              +'        //var myDate2 = new Date();                                         '
///             +'        //alert(myDate2.getSeconds()+'':''+myDate2.getMilliseconds() + ''  '' + j + ''  '' + i + ''  ''+DevListJSon.length);   '
              +'      }                                                                       '    + #13 + #10
              +'      catch(err)                                                              '    + #13 + #10
              +'      {                                                                       '    + #13 + #10
              +'      }                                                                       '    + #13 + #10
              +'      finally                                                                 '    + #13 + #10
              +'      {                                                                       '    + #13 + #10
              +'        while(DevList.pop());                                                 '    + #13 + #10
              +'      }                                                                       '    + #13 + #10
              +'    }                                                                         '    + #13 + #10
              +'                                                                              '    + #13 + #10
//              +'    // ��ȡ��ͼ���ϽǺ����½ǵľ�γ��                                       '    + #13 + #10
              +'    function GetLogLat(){                                                     '    + #13 + #10
              +'                                                                              '    + #13 + #10
              +'      var str="��ѡ�����������Ϊ��\n";                                       '    + #13 + #10
//             +'      // ��С���ȡ����γ��'
              +'      str+="���Ͻ����꣺"+map.getBoundsLatLng().getXmin()+","+map.getBoundsLatLng().getYmax()+"\n";	 '     + #13 + #10
//            +'      // ��󾭶ȡ���Сγ��'
              +'      str+="���½����꣺"+map.getBoundsLatLng().getXmax()+","+map.getBoundsLatLng().getYmin()+"\n";  '     + #13 + #10
              +'      alert(str);                                                             '    + #13 + #10
              +'    }                                                                         '    + #13 + #10
              +'                                                                              '    + #13 + #10
//              +'    // ������Ҫˢ�µĳ�����Ϣ                                               '    + #13 + #10
              +'    function AddDev(log, lat, IdStr, CarNo){                                  '    + #13 + #10
              +'      var DevMarker = {log: 0, lat: 0, IdStr: '', CarNo: '', IsBusy: 0};      '    + #13 + #10
              +'      DevMarker.log = log;                                                    '    + #13 + #10
              +'      DevMarker.lat = lat;                                                    '    + #13 + #10
              +'      DevMarker.IdStr = IdStr;                                                '    + #13 + #10
              +'      DevMarker.CarNo = CarNo;                                                '    + #13 + #10
              +'      DevList[DevList.length] = DevMarker;                                    '    + #13 + #10
              +'    }                                                                         '    + #13 + #10
              +'                                                                              '    + #13 + #10
//              +'    // ��JSON��ʽ�ַ���ת��ΪJS�ܹ�ʶ���JSON��ʽ                           '    + #13 + #10
              +'    function strToJson(str){                                                  '    + #13 + #10
              +'       var json = eval(''('' + str + '')'');                                  '    + #13 + #10
              +'       return json;                                                           '    + #13 + #10
              +'    }                                                                         '    + #13 + #10
              +'                                                                              '    + #13 + #10
//              +'    // �����������ͼ��                                                     '    + #13 + #10
              +'    function ClearSearchMarker()                                              '    + #13 + #10
              +'    {                                                                         '    + #13 + #10
              +'      for (var i=0; i<SearchMarker.length; i++){                              '    + #13 + #10
              +'        map.removeOverLay(SearchMarker[i], true);                             '    + #13 + #10
              +'      }                                                                       '    + #13 + #10
              +'      while(SearchMarker.pop());                                              '    + #13 + #10
              +'                                                                              '    + #13 + #10
              +'      $("searchResult").style.display = "none"                                '    + #13 + #10
              +'      $("searchControl").style.display = "none"                               '    + #13 + #10
              +'    }                                                                         '    + #13 + #10
              +'                                                                              '    + #13 + #10
//              +'    //��յ�ͼͼ��                                                          '    + #13 + #10
              +'    function clear(){                                                         '    + #13 + #10
              +'      map.clearOverLays();                                                    '    + #13 + #10
              +'      while(DevList.pop());                                                   '    + #13 + #10
              +'      while(mArrJson.pop());                                                  '    + #13 + #10
              +'      while(SearchMarker.pop());                                              '    + #13 + #10
              +'    }                                                                         '    + #13 + #10
              +'                                                                              '    + #13 + #10
//              +'    // �򿪸�������                                                         '    + #13 + #10
              +'    function getMouseOverCallBack(mMarkerOp,html)                             '    + #13 + #10
              +'    {                                                                         '    + #13 + #10
              +'      return function()                                                       '    + #13 + #10
              +'      {                                                                       '    + #13 + #10
              +'        mMarkerOp.mObjMarkers.openInfoWinHtml(html);                          '    + #13 + #10
              +'        OnCarAction(mMarkerOp.mObjStrId);                                     '    + #13 + #10
              +'      } ;                                                                     '    + #13 + #10
              +'    }                                                                         '    + #13 + #10
              +'                                                                              '    + #13 + #10
//              +'    // ����ڵ�ͼ�����������Ϸ�ʱ�������б�ͳ�����Ϣ�ж�̬��ʾ�ĳ�����Ϣ   '    + #13 + #10
              +'    function OnCarAction(DevIdStr){                                           '    + #13 + #10
              +'      window.external.OnCarAction(DevIdStr);                                  '    + #13 + #10
              +'    }                                                                         '    + #13 + #10
              +'                                                                              '    + #13 + #10
//              +'    // �رո�������                                                         '    + #13 + #10
              +'    function getMouseOutCallBack(marker){                                     '    + #13 + #10
              +'      return function()	{marker.closeInfoWin()};                              '    + #13 + #10
              +'    }                                                                         '    + #13 + #10
              +'                                                                              '    + #13 + #10
//              +'    // ��λѡ������                                                         '    + #13 + #10
              +'    function Locate_car(log, lat, idstr, carno){                              '    + #13 + #10
              +'      for (var i=0; i<mArrJson.length; i++){                                  '    + #13 + #10
              +'        if (mArrJson[i].mObjStrId == idstr){                                  '    + #13 + #10
              +'          var mpoint = new LTPoint(log, lat);                                 '    + #13 + #10
              +'          var html="<br>���ƺţ�" + carno + "</br><br>�豸ID��" + idstr + "</br>";    '    + #13 + #10
              +'                                                                              '    + #13 + #10
              +'          mArrJson[i].mObjMarkers.setPoint(mpoint);                           '    + #13 + #10
              +'          map.centerAndZoom(mpoint,map.getCurrentZoom());                     '    + #13 + #10
              +'          mArrJson[i].mObjMarkers.openInfoWinHtml(html )                      '    + #13 + #10
              +'          break;                                                              '    + #13 + #10
              +'        }                                                                     '    + #13 + #10
              +'      }                                                                       '    + #13 + #10
              +'    }                                                                         '    + #13 + #10
              +'                                                                              '    + #13 + #10
//              +'    // ��λ�ص�λ��                                                         '    + #13 + #10
              +'    function Locate_SearchResult(i)                                           '    + #13 + #10
              +'    {                                                                         '    + #13 + #10
              +'      var html = SearchMarker[i].name;                                        '    + #13 + #10
              +'                                                                              '    + #13 + #10
//              +'      //mArrJson[i].mObjMarkers.setPoint(mpoint);                           '    + #13 + #10
              +'      map.centerAndZoom(SearchMarker[i].getPoint(),map.getCurrentZoom());     '    + #13 + #10
              +'      SearchMarker[i].openInfoWinHtml(html)                                   '    + #13 + #10
              +'    }                                                                         '    + #13 + #10
              +'                                                                              '    + #13 + #10
//              +'    // ��Ź켣�ط�����                                                     '    + #13 + #10
              +'    function PutHistroyGpsData(log, lat, IdStr, CarNo)                        '    + #13 + #10
              +'    {                                                                         '    + #13 + #10
              +'      var HisDevPoint = {log: 0, lat: 0, IdStr: '', CarNo: ''};               '    + #13 + #10
              +'      HisDevPoint.log = log;                                                  '    + #13 + #10
              +'      HisDevPoint.lat = lat;                                                  '    + #13 + #10
              +'      HisDevPoint.IdStr = IdStr;                                              '    + #13 + #10
              +'      HisDevPoint.CarNo = CarNo;                                              '    + #13 + #10
              +'      HistroyPoint[HistroyPoint.length] = HisDevPoint;                        '    + #13 + #10
//              +'      //HistroyPoint = result;                                              '    + #13 + #10
              +'    }                                                                         '    + #13 + #10
              +'                                                                              '    + #13 + #10
//              +'    // �켣�طţ���CS����                                                   '    + #13 + #10
              +'    function play()                                                           '    + #13 + #10
              +'    {                                                                         '    + #13 + #10
              +'      clear();                                                                '    + #13 + #10
              +'      Postion = 0;                                                            '    + #13 + #10
              +'      PlayHistroyGpsData();                                                   '    + #13 + #10
              +'    }                                                                         '    + #13 + #10
              +'                                                                              '    + #13 + #10
//              +'    // �켣�ط�                                                             '    + #13 + #10
              +'    function PlayHistroyGpsData()                                             '    + #13 + #10
              +'    {                                                                         '    + #13 + #10
              +'      var mpoint = null;                                                      '    + #13 + #10
              +'                                                                              '    + #13 + #10
              +'      if (Postion < HistroyPoint.length - 1)                                  '    + #13 + #10
              +'      {                                                                       '    + #13 + #10
              +'        var points = new Array();                                             '    + #13 + #10
              +'        points.push(new LTPoint(HistroyPoint[Postion].log, HistroyPoint[Postion].lat));        '     + #13 + #10
              +'        points.push(new LTPoint(HistroyPoint[Postion+1].log, HistroyPoint[Postion+1].lat));    '     + #13 + #10
              +'        Postion = Postion + 1;                                                '    + #13 + #10
              +'                                                                              '    + #13 + #10
              +'        var polyLine = new LTPolyLine(points);                                '    + #13 + #10
              +'        polyLine.setLineColor("green");                                       '    + #13 + #10
//            +'        //������������'
              +'        polyLine.setLineStyle("Solid");	                                      '    + #13 + #10
//            +'        //���������߿�'
              +'        polyLine.setLineStroke(1);	                                          '    + #13 + #10
//            +'        //��������͸����'
              +'        polyLine.setOpacity(0.8);	                                            '    + #13 + #10
//            +'        //�������ߵ����˼�ͷ'
              +'        polyLine.setLineArrow("Oval","Open");	                                '    + #13 + #10
              +'        addPolyLine(polyLine,HistroyPoint[Postion]);                          '    + #13 + #10
              +'      }                                                                       '    + #13 + #10
              +'      else                                                                    '    + #13 + #10
              +'      {                                                                       '    + #13 + #10
              +'        clear();                                                              '    + #13 + #10
              +'        while(HistroyPoint.pop());                                            '    + #13 + #10
              +'        while(PolyLineBuf.pop());                                             '    + #13 + #10
              +'        mMarkerT = null;                                                      '    + #13 + #10
              +'        mTextT = null;                                                        '    + #13 + #10
              +'        setTimeout(EndPlayHistroy, TimeInterval);                             '    + #13 + #10
              +'      }                                                                       '    + #13 + #10
              +'    }                                                                         '    + #13 + #10
              +'                                                                              '    + #13 + #10
//              +'    // �ص�delphi���������¿�ʼˢ�³���λ��                                 '    + #13 + #10
              +'    function EndPlayHistroy(){                                                '    + #13 + #10
              +'      window.external.EndPlayHistroy();                                       '    + #13 + #10
              +'    }                                                                         '    + #13 + #10
              +'                                                                              '    + #13 + #10
//              +'    //�켣�ط�,���켣��                                                     '    + #13 + #10
              +'    function addPolyLine(polyLine,locatData)                                  '    + #13 + #10
              +'    {                                                                         '    + #13 + #10
              +'      var mpoint = new LTPoint(locatData.log,locatData.lat);                  '    + #13 + #10
//              +'      //if (nTrack){                                                        '    + #13 + #10
//              +'      //	map.centerAndZoom (mpoint,map.getCurrentZoom());                  '    + #13 + #10
//              +'      //}                                                                   '    + #13 + #10
              +'      if (mMarkerT == null){                                                  '    + #13 + #10
              +'        mMarkerT = new LTMarker(mpoint,icon );                                '    + #13 + #10
              +'        mTextT  = new LTMapText(mMarkerT);                                    '    + #13 + #10
              +'        mTextT.setLabel(locatData.CarNo);                                     '    + #13 + #10
              +'        map.addOverLay(mTextT);                                               '    + #13 + #10
              +'        map.addOverLay( mMarkerT );                                           '    + #13 + #10
              +'      }else{                                                                  '    + #13 + #10
              +'        mMarkerT.setPoint(mpoint);                                            '    + #13 + #10
              +'        mTextT.setPoint(mpoint);                                              '    + #13 + #10
              +'      }                                                                       '    + #13 + #10
              +'                                                                              '    + #13 + #10
              +'      map.addOverLay(polyLine);                                               '    + #13 + #10
              +'      PolyLineBuf[PolyLineBuf.length] = polyLine;                             '    + #13 + #10
              +'      if (PolyLineBuf.length >= 30)                                           '    + #13 + #10
              +'      {                                                                       '    + #13 + #10
              +'        map.removeOverLay(PolyLineBuf[0], true);                              '    + #13 + #10
              +'        PolyLineBuf.splice(0, 1);                                             '    + #13 + #10
              +'      }                                                                       '    + #13 + #10
              +'                                                                              '    + #13 + #10
              +'      var bounds = map.getBoundsLatLng();                                     '    + #13 + #10
              +'      if (locatData.log>bounds.getXmin()                                      '    + #13 + #10
              +'          && locatData.log<bounds.getXmax()                                   '    + #13 + #10
              +'          && locatData.lat>bounds.getYmin()                                   '    + #13 + #10
              +'          && locatData.lat<bounds.getYmax()){                                 '    + #13 + #10
              +'                                                                              '    + #13 + #10
              +'      }else{                                                                  '    + #13 + #10
              +'          map.centerAndZoom (mpoint,map.getCurrentZoom());                    '    + #13 + #10
              +'      }                                                                       '    + #13 + #10
//            +'      // ��ʷ�켣�㲻�ڵ�ͼ��ʾ��Χ��ʱ������������ '                              + #13 + #10
              +'      setTimeout(PlayHistroyGpsData,TimeInterval);                            '    + #13 + #10
              +'    }                                                                         '    + #13 + #10
              +'                                                                              '    + #13 + #10
//              +'    // ���ûط��ٶ�                                                         '    + #13 + #10
              +'    function SetTimeInterval(Interval)                                        '    + #13 + #10
              +'    {                                                                         '    + #13 + #10
              +'      TimeInterval = Interval;                                                '    + #13 + #10
              +'    }                                                                         '    + #13 + #10
              +'                                                                              '    + #13 + #10
              +'    function ViewSearch()                                                     '    + #13 + #10
              +'    {                                                                         '    + #13 + #10
              +'      if ($("search1").style.display == "")                                   '    + #13 + #10
              +'      {                                                                       '    + #13 + #10
              +'        $("search1").style.display = "none";                                  '    + #13 + #10
              +'      }                                                                       '    + #13 + #10
              +'      else                                                                    '    + #13 + #10
              +'      {                                                                       '    + #13 + #10
              +'        $("search1").style.display = "";                                      '    + #13 + #10
              +'      }                                                                       '    + #13 + #10
              +'    }                                                                         '    + #13 + #10
              +'                                                                              '    + #13 + #10
              +'    function ViewSearchResult()                                               '    + #13 + #10
              +'    {                                                                         '    + #13 + #10
              +'      if ($("searchResult").style.display == "")                              '    + #13 + #10
              +'      {                                                                       '    + #13 + #10
              +'        $("searchResult").style.display = "none"                              '    + #13 + #10
              +'      }else                                                                   '    + #13 + #10
              +'      {                                                                       '    + #13 + #10
              +'        $("searchResult").style.display = "";                                 '    + #13 + #10
              +'      }                                                                       '    + #13 + #10
              +'    }                                                                         '    + #13 + #10
              +'                                                                              '    + #13 + #10
              +'    function SetMapDiv(width, height){                                        '    + #13 + #10
//              +'      // left: 567px;left: 825px                                            '    + #13 + #10
              +'      $("mapDiv").style.width = (width-35)+"px";                              '    + #13 + #10
              +'      $("mapDiv").style.height = (height-22)+"px";	                          '    + #13 + #10
              +'    }                                                                         '    + #13 + #10
              +'                                                                              '
              +'    function SetBackGround() {'
              +'      var exePath = ''file://''+window.external.GetExePath();                '    + #13 + #10
              +'      var mapDivPath = exePath + ''images/bg.gif'';                          '    + #13 + #10
              +'                                                                             '    + #13 + #10
              +'      document.getElementById("mapDiv").style.backgroundImage = "url("+mapDivPath+")";  '
              +'      var searchPath = exePath +''images/m_04.gif'';                         '    + #13 + #10
              +'      document.getElementById("search").style.backgroundImage = "url("+searchPath+")"; '
              +'      document.getElementById("searchResult").style.backgroundImage = "url("+searchPath+")"; '
              +'      document.getElementById("searchControl").style.backgroundImage = "url("+searchPath+")"; '
              +'    }'
              +'  </script>                                                                   '    + #13 + #10
              +'                                                                              '    + #13 + #10
              +'  <body onload="onLoad()">                                                                                                                                     '
              +'                                                                                                                                                               '
              +'    <input id="dzwl" type="button" value="����Χ��" style="Z-INDEX: 600; position: absolute; top: 15px; right: 234px; background: gainsboro;"                  '
              +'          onClick="AddConfineArea()">                                                                                                                          '
              +'    <input id="bz" type="button" value="�� ע" style="Z-INDEX: 600; position: absolute; top: 15px; right: 184px; background: gainsboro;"                       '
              +'          onClick="MarkControlBtnClick()">                                                                                                                     '
              +'    <input id="jxxc" type="button" value="����ѡ��" style="Z-INDEX: 600; position: absolute; top: 15px; right: 105px; background: gainsboro;"                  '
              +'          onClick="ZoomSearchControlBtnClick()">                                                                                                               '
              +'    <input id="cj" type="button" value="�� ��" style="Z-INDEX: 600; position: absolute; top: 15px; right: 55px; background: gainsboro;"                        '
              +'          onClick="PolyLineControlBtnClick()">                                                                                                                 '
              +'    <input type="button"  value="�� ��" style="Z-INDEX: 600; position: absolute; top: 15px; right: 5px; background: gainsboro;"                                '
              +'          onclick="ViewSearch()"/>                                                                                                                             '
              +'                                                                                                                                                               '
              +'    <div id="mapDiv" style="position:absolute;width:870px; height:405px;">                                                                                     '
              +'      <div align="center" style="margin:12px;">                                                                                                                '
              +'        <a href="http://api.51ditu.com/docs/mapsapi/help.html" target="_blank" style="color:#D01E14;font-weight:bolder;font-size:12px;">��������ͼ�������</a> '
              +'      </div>                                                                                                                                                   '
              +'    </div>                                                                                                                                                     '
              +'                                                                                                                                                               '
              +'    <div id="search1" style="position: absolute; top: 0px; right: 235px; display:none;">                                                                       '
              +'      <div id="search" style="z-index:4;position:absolute;left:-5px;top: 37px; right: 5px;height:50px;width:230px; margin:4px; padding:8px;display:"";">    '
              +'        <table width="100%" border=1 cellspacing="0" cellpadding="3" bordercolordark="#ffffff" bordercolorlight="#003366" style="font-size:12px;">             '
              +'          <tr>                                                                                                                                                 '
              +'            <td align="center" colspan="2">                                                                                                                    '
              +'              �� <input type="text" id="city" value="�Ͼ�" size="5" onchange="LocalSearch.setCity(this.value);"/> �� ����                                      '
              +'              <input type="text" id="word" value="�⻪·" size="10"/>                                                                                          '
              +'            </td>                                                                                                                                              '
              +'          </tr>                                                                                                                                                '
              +'                                                                                                                                                               '
              +'          <tr>                                                                                                                                                 '
              +'            <td align="center" colspan="2">                                                                                                                    '
              +'              <input class="button" type="button" name="btnOK" 	id="btnOK" 	value="ȷ ��" onclick="LocalSearch.search(document.getElementById(''word'').value);">   '
              +'              <input class="button" type="button" name="btnClear" 	id="btnOK" 	value="�� ��" onclick="ClearSearchMarker();">                                  '
              +'            </td>                                                                                                                                              '
              +'          </tr>                                                                                                                                                '
              +'        </table>                                                                                                                                               '
              +'      </div>                                                                                                                                                   '
              +'                                                                                                                                                               '
              +'      <div id="searchResult" style="font-size:12px;z-index:4;position:absolute;left:-5px;top: 107px; right: 5px;height:215px;width:230px;background-image:url(\\images\\m_04.gif); margin:4px; padding:8px; display:none;overflow:scroll">   '
              +'      </div>                                                                                                                                                   '
              +'                                                                                                                                                               '
              +'      <div id="searchControl" style="font-size:12px;z-index:4;position:absolute;left:-5px;top: 322px; right: 5px;height:55px;width:230px;background-image:url(.\\images\\m_04.gif); margin:4px; padding:8px; display:none;">    '
              +'        <tr>                                                                                                                                                   '
              +'          <td>                                                                                                                                                 '
              +'                                                                                                                                                               '
              +'          </td>                                                                                                                                                '
              +'        </tr>                                                                                                                                                  '
              +'        <tr>                                                                                                                                                   '
              +'          <td align="center" colspan="2">                                                                                                                      '
              +'            <input type="button" value="��ҳ" onclick="LocalSearch.firstPage()"/>                                                                              '
              +'            <input type="button" value="��ҳ" onclick="LocalSearch.previousPage()"/>                                                                           '
              +'            <input type="button" value="��ҳ" onclick="LocalSearch.nextPage()"/>                                                                               '
              +'            <input type="button" value="βҳ" onclick="LocalSearch.lastPage()"/><br/>                                                                          '
              +'            ת����<input type="text" value="1" id="pageId" size="2"/>ҳ <input type="button" onclick="LocalSearch.searchPage(parseInt(document.getElementById(''pageId'').value));" value="ת��"/>    '
              +'          </td>                                                                                                                                                '
              +'        </tr>                                                                                                                                                  '
              +'      </div>                                                                                                                                                   '
              +'    </div>                                                                                                                                                     '
              +'  </body>                                                                                                                                                      '
              +'  </html>';

implementation

end.
