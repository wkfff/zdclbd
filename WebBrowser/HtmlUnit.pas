unit HtmlUnit;

interface



 var SetNoteStr : string='  <html xmlns:v="urn:schemas-microsoft-com:vml">  '                         + #13 + #10
              +'  <head> '                                                                            + #13 + #10
              +'    <meta http-equiv="content-type" content="text/html; charset=GB2312"/>'            + #13 + #10
              +'    <title>南京通用－显示基本地图</title>'                                            + #13 + #10
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
//            +'    // 图标                                   '                                       + #13 + #10
              +'    var icon 	= new LTIcon();                 '                                       + #13 + #10
              +'    icon.setImageUrl( "./images/car.gif" );   '                                       + #13 + #10
              +'    icon.setWidth(6);                         '                                       + #13 + #10
              +'    icon.setHeight(6);                        '                                       + #13 + #10
	            +'                                              '                                       + #13 + #10
              +'    function $(mValue){                       '                                       + #13 + #10
              +'      return document.getElementById(mValue); '                                       + #13 + #10
              +'    }                                         '                                       + #13 + #10
	            +'                                              '                                       + #13 + #10
//            +'    // 显示搜索地名的显示结果                 '                                       + #13 + #10
              +'    function showPoint(searchResult)          '                                       + #13 + #10
              +'    {                                         '                                       + #13 + #10
              +'      if(searchResult.count>0)//如果存在搜索结果    '                                 + #13 + #10
              +'      {                                             '                                 + #13 + #10
              +'        ClearSearchMarker();                        '                                 + #13 + #10
              +'       points=[];                                   '                                 + #13 + #10
              +'        var html="";                                '                                 + #13 + #10
              +'        $("searchResult").style.display = "";       '                                 + #13 + #10
              +'        $("searchControl").style.display = "";      '                                 + #13 + #10
              +'        $("searchResult").innerHTML = "";           '                                 + #13 + #10
//              +'        //显示分页信息                              '
              +'        html+="共"+LocalSearch.totalNumber+"条记录，分"+LocalSearch.totalPage+"页,当前第"+searchResult.getPageIndex()+"页<br/><br/>"; '   + #13 + #10
              +'                                                                    '                 + #13 + #10
//            +'        //依次将搜索结果显示到地图上'                                                 + #13 + #10
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
//            +'         //输出POI信息列表'
              +'          html+=poi.id+''.<span style="cursor:pointer;" onclick="Locate_SearchResult(''+i+'')"/>''+poi.name+''</span><br/>'';'   + #13 + #10
              //+'          //html+=poi.id+''.<span href="#" target="_blank" onclick="Locate_SearchResult(''+i+'')"/>'+poi.name+'</span><br/>';	//输出POI信息列表'
              +'        }                                                           '                 + #13 + #10
              +'        $("searchResult").innerHTML=html;                           '                 + #13 + #10
              +'        map.getBestMap(points);                                     '                 + #13 + #10
              +'      }                                                             '                 + #13 + #10
              +'      else                                                          '                 + #13 + #10
              +'      {                                                             '                 + #13 + #10
              +'        alert(''无结果'');                                          '                 + #13 + #10
              +'      }                                                             '                 + #13 + #10
              +'    }                                                               '                 + #13 + #10
              +'                                                                    '                 + #13 + #10
//              +'    // 初始化地图                                                 '                 + #13 + #10
              +'    function onLoad()                                               '                 + #13 + #10
              +'    {                                                               '                 + #13 + #10
              +'      map =new LTMaps("mapDiv");                                    '                 + #13 + #10
//            +'     //将地图定位到南京,改动"nanjing"可以将地图定位到其他城市       '                 + #13 + #10
              +'      var city = window.external.GetDefaultMap();                   '                 + #13 + #10
              +'      ChangeCity(city);                                             '
//              +'      // 标准缩放控件                                             '                 + #13 + #10
              +'      StandMapControl = new LTStandMapControl();                    '                 + #13 + #10
              +'      map.addControl(StandMapControl);                              '                 + #13 + #10
              +'      map.handleMouseScroll(true);//启用鼠标滚轮功能支持，参数true代表使用鼠标指向点位置不变模式   '  + #13 + #10
		          +'                                                                    '                 + #13 + #10
//              +'      // 测距控件                                                 '                 + #13 + #10
              +'      PolyLineControl = new LTPolyLineControl();                    '                 + #13 + #10
              +'      PolyLineControl.setTips("双击结束测距");                      '                 + #13 + #10
              +'      LTEvent.bind(map,"dblclick",PolyLineControl,endDraw);//在双击地图的时候调用结束操作          '  + #13 + #10
              +'      map.addControl( PolyLineControl );                            '                 + #13 + #10
              +'      PolyLineControl.setVisible(false);                            '                 + #13 + #10
              +'                                                                    '                 + #13 + #10
//              +'      // 标注控件                                                 '                 + #13 + #10
              +'      //var MarkControl = new LTMarkControl();                      '                 + #13 + #10
              +'      //map.addControl( MarkControl );                              '                 + #13 + #10
              +'                                                                    '                 + #13 + #10
//              +'      // 地名查询                                                 '                 + #13 + #10
              +'      LocalSearch = new LTLocalSearch(showPoint);                   '                 + #13 + #10
//            +'      //设置每页显示多少条                                          '                 + #13 + #10
              +'      LocalSearch.pagecap=10;	                                      '                 + #13 + #10
              +'      LocalSearch.setCity("南京");                                '                 + #13 + #10
//              +'      //LocalSearch.search(''中关村'');                           '                 + #13 + #10
              +'                                                                    '                 + #13 + #10
//            +'      // 矩形选车                                                   '                 + #13 + #10
              +'      ZoomSearchControl = new LTZoomSearchControl();                '                 + #13 + #10
              +'      ZoomSearchControl.setLabel("矩形选车");                       '                 + #13 + #10
              +'      ZoomSearchControl.setLeft(680);                               '                 + #13 + #10
              +'      ZoomSearchControl.setTop(15);                                 '                 + #13 + #10
//            +'      //添加矩形选车控件到地图                                      '                 + #13 + #10
              +'      map.addControl(ZoomSearchControl);			                      '                 + #13 + #10
              +'      ZoomSearchControl.setVisible(false);                          '                 + #13 + #10
//            +'      //设置在用户拉框完成之后执行doit函数                          '                 + #13 + #10
              +'      LTEvent.addListener(ZoomSearchControl,"mouseup",doit);	      '                 + #13 + #10
              +'                                                                    '                 + #13 + #10
//              +'      // 鹰眼                                                     '                 + #13 + #10
              +'      OverviewMapControl = new LTOverviewMapControl(null,null,null,null,null,2);  '   + #13 + #10
//            +'      // 鹰眼地图和主地图之间空隙的边框颜色'                                          + #13 + #10
              +'      OverviewMapControl.setBorderColor("black");				            '                 + #13 + #10
//            +'      // 鹰眼地图和主地图之间空隙的背景颜色'                                          + #13 + #10
              +'      OverviewMapControl.setBackColor("gray");					            '                 + #13 + #10
//            +'      // 鹰眼地图上的矩形框的背景颜色'
              +'      OverviewMapControl.setRectBackColor("gray");			            '                 + #13 + #10
//            +'      // 鹰眼地图上的矩形框的边框颜色'
              +'      OverviewMapControl.setRectBorderColor("black");		            '                 + #13 + #10
//            +'      // 默认将鹰眼设置为关闭状态'
              +'      OverviewMapControl.changeView();									            '                 + #13 + #10
              +'      map.addControl(OverviewMapControl);                           '                 + #13 + #10
              +'                                                                    '                 + #13 + #10
//              +'      // 标注                                                     '
              +'      MarkControl = new LTMarkControl();                            '                 + #13 + #10
              +'      map.addControl(MarkControl);                                  '                 + #13 + #10
              +'      MarkControl.setVisible(false);                                '                 + #13 + #10
//            +'      //在标注完成之后运行getPoi函数                                '
              +'      LTEvent.addListener( MarkControl , "mouseup" , getPoi );      '                 + #13 + #10
              +'                                                                    '
//              +'      // 设置电子围栏用的标注，用于获取鼠标当前位置的经纬度       '
              +'      ConfineAreaControl = new LTMarkControl(false);                '                 + #13 + #10
              +'      ConfineAreaControl.setVisible(false);                         '                 + #13 + #10
              +'      map.addControl(ConfineAreaControl);                           '                 + #13 + #10
//            +'      //在标注完成之后运行getConfinePoi函数'
              +'      LTEvent.addListener( ConfineAreaControl , "mouseup" , getConfinePoi );   '      + #13 + #10
              +'                                                                               '      + #13 + #10
//            +'      // 测面积控件                                                            '      + #13 + #10
              +'      //PolygonControl = new LTPolygonControl();                               '      + #13 + #10
//            +'      //不透明度                                                               '      + #13 + #10
//            +'      //PolygonControl.fillColor="transparent";		                             '      + #13 + #10
//            +'      //map.addControl(PolygonControl);                                        '      + #13 + #10
              +'                                                                               '
//            +'      //处理背景图片                                                           '
              +'      document.getElementById("mapDiv").style.backgroundImage = "url(''file://E:/delphi/监控客户端新模式/client_cs/bin_taxi/images/bg.gif'')";  '  + #13 + #10
              +'                                                                               '      + #13 + #10
              +'      for (var i=0; i < document.getElementsByTagName("div").length; i ++){    '      + #13 + #10
              +'        if (document.getElementsByTagName("div")[i].style.zIndex == 65535){    '      + #13 + #10
              +'            document.getElementsByTagName("div")[i].innerHTML = "南京通用电器有限公司";      '  + #13 + #10
              +'          }                                                                    '      + #13 + #10
              +'      }                                                                        '      + #13 + #10
              +'                                                                               '      + #13 + #10
//            +'      // 加载自定义标签                                                        '
              +'      InitDefinedMarker(window.external.GetDefinedTextList());                 '     + #13 + #10
              +'      SetBackGround();                                                         '     + #13 + #10
              +'      OpenRefreshDev();                                                        '
              +'    }                                                                          '     + #13 + #10
              +'                                                                               '     + #13 + #10
              +'     // 切换地图                                                               '      + #13 + #10
              +'     function ChangeCity(City){                                                '      + #13 + #10
		          +'      map.centerAndZoom(City, 5);//将地图定位到南京,改动"nanjing"可以将地图定位到其他城市  '  + #13 + #10
              +'     }                                                                         '      + #13 + #10
              +'    // 地图加载完，打开地图刷新功能                                                                           '     + #13 + #10
              +'    function OpenRefreshDev(){                                                 '
              +'      window.external.OpenRefreshDev();'
              +'    }'
//            +'    // 本函数是在用户每次拉框操作完成之后执行的操作，bounds是代表用户拉框选择的区域的范围   '
//            +'    // 矩形选择车辆                                                           '
              +'    function doit(bounds)                                                     '
              +'    {                                                                         '      + #13 + #10
              +'      var str="你选择的区域坐标为：\n";                                       '      + #13 + #10
              +'      str+="左上角坐标："+bounds.getXmin()+","+bounds.getYmax()+"\n";         '      + #13 + #10
              +'      str+="右下角坐标："+bounds.getXmax()+","+bounds.getYmin()+"\n";         '      + #13 + #10
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
//              +'      //用户代码                                                            '      + #13 + #10
//              +'      //alert( "纬度：" + point.getLatitude() + "\n经度：" + point.getLongitude());     '
//              +'      //定义一对象，用来保存自定义标签                                                  '
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
//            +'        //将文字设置为没有边框'
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
//              +'    // 加载单个自定义标签                                                   '      + #13 + #10
              +'    function LoadDefinedMarker(log, lat, Text, IdStr){                        '      + #13 + #10
              +'      var DefinedMarker = {IdStr:'', Text:'', log:'', lat:'', mObjMarker:null};   '  + #13 + #10
//              +'      //var marker = new LTMarker( new LTPoint(log , lat));                 '      + #13 + #10
              +'      var marker = new LTMapText( new LTPoint(log , lat));                    '      + #13 + #10
              +'      DefinedMarker.Text = Text;                                              '      + #13 + #10
              +'      DefinedMarker.IdStr = IdStr;                                            '      + #13 + #10
              +'      DefinedMarker.mObjMarker = marker;                                      '      + #13 + #10
              +'      marker.setLabel(DefinedMarker.Text);                                    '      + #13 + #10
//            +'      //将文字设置为没有边框'
              +'      marker.setBorderLine(0);                                                '      + #13 + #10
              +'      marker.setBackgroundColor("")                                           '      + #13 + #10
		          +'                                                                              '      + #13 + #10
              +'      map.addOverLay( marker );                                               '      + #13 + #10
              +'      DefinedMarkerList[DefinedMarkerList.length] = DefinedMarker;            '      + #13 + #10
              +'    }                                                                         '      + #13 + #10
	            +'                                                                              '      + #13 + #10
//              +'    // 地图加载后初始化自定义标签                                           '      + #13 + #10
              +'    function InitDefinedMarker(json){                                         '      + #13 + #10
              +'      while(DefinedMarkerList.pop());                                         '      + #13 + #10
              +'      var DefinedMarkerListJSON = strToJson(json);                            '      + #13 + #10
              +'      for (var i=0; i<DefinedMarkerListJSON.length; i++){                     '      + #13 + #10
              +'        LoadDefinedMarker(DefinedMarkerListJSON[i].log, DefinedMarkerListJSON[i].lat,      '   + #13 + #10
              +'                          DefinedMarkerListJSON[i].Text, DefinedMarkerListJSON[i].IdStr);  '   + #13 + #10
              +'      }                                                                       '      + #13 + #10
              +'    }                                                                         '      + #13 + #10
	            +'                                                                              '      + #13 + #10
//              +'    // 添加标注                                                             '      + #13 + #10
              +'    function MarkControlBtnClick(){                                           '      + #13 + #10
              +'      MarkControl.btnClick();                                                 '      + #13 + #10
              +'    }                                                                         '      + #13 + #10
	            +'                                                                              '      + #13 + #10
//              +'    // 定位自定义标签                                                       '      + #13 + #10
              +'    function Locate_DefinedMarker(IdStr){                                     '      + #13 + #10
              +'      for (var i=0; i<DefinedMarkerList.length; i++){                         '      + #13 + #10
              +'        if (DefinedMarkerList[i].IdStr == IdStr){                             '      + #13 + #10
              +'          map.centerAndZoom(DefinedMarkerList[i].mObjMarker.getPoint(), map.getCurrentZoom());    '   + #13 + #10
              +'          break;                                                              '      + #13 + #10
              +'        }                                                                     '      + #13 + #10
              +'      }                                                                       '      + #13 + #10                                                       
              +'    }                                                                         '      + #13 + #10
              +'                                                                              '      + #13 + #10
//              +'    // 修改或删除自定义标签   m=true 修改； m=false 删除                    '      + #13 + #10
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
//              +'    // 矩形选车                                                             '      + #13 + #10
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
//              +'    // 开始测距                                                             '      + #13 + #10
              +'    function PolyLineControlBtnClick()                                        '      + #13 + #10
              +'    {                                                                         '      + #13 + #10
//            +'      // 如果矩形选车这是处于工作状态，就重新给矩形选车控件设置为空闲状态'
//            +'      // 灵图不支持测距控件和矩形选择控件同时使用'
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
//              +'    // 结束测距                                                             '      + #13 + #10
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
//              +'    // 添加电子围栏                                                         '      + #13 + #10
              +'    function AddConfineArea(){                                                '      + #13 + #10
              +'      BDrawConfieArea = true;                                                 '      + #13 + #10
              +'      ConfineAreaControl.btnClick();                                          '      + #13 + #10
              +'    }                                                                         '      + #13 + #10
	            +'                                                                              '      + #13 + #10
              +'    function getConfinePoi(point)                                             '      + #13 + #10
              +'    {                                                                         '      + #13 + #10
//              +'      //用户代码                                                                       '  + #13 + #10
//              +'      //alert( "纬度：" + point.getLatitude() + "\n经度：" + point.getLongitude());    '  + #13 + #10
              +'      ConfineAreaPointList[ConfineAreaPointList.length] = point;              '      + #13 + #10
		          +'                                                                              '      + #13 + #10
              +'      if (ConfineAreaPointList.length > 1){                                   '      + #13 + #10
              +'        var points = new Array();                                             '      + #13 + #10
              +'        points.push(ConfineAreaPointList[ConfineAreaPointList.length-2]);     '      + #13 + #10
              +'        points.push(ConfineAreaPointList[ConfineAreaPointList.length-1]);     '      + #13 + #10
//              +'        //根据点数组创建一条折线                                            '      + #13 + #10
              +'        var polyLine = new LTPolyLine( points );                              '      + #13 + #10
//            +'        //设置折线线宽'
              +'        polyLine.setLineStroke(2);	                                          '      + #13 + #10
//              +'        //将折线添加到地图                                                                                        '
              +'        map.addOverLay( polyLine );                                           '      + #13 + #10
              +'        tempPolyLineBuf[tempPolyLineBuf.length] = polyLine;                   '      + #13 + #10
              +'      }                                                                       '      + #13 + #10
              +'      ConfineAreaControl.btnClick();                                          '      + #13 + #10
              +'    }                                                                         '      + #13 + #10
	            +'                                                                              '      + #13 + #10
//              +'    // 画多边形--电子围栏                                                                                                                          '
              +'    function DrawConfieArea(){                                                '      + #13 + #10
              +'      try{                                                                    '      + #13 + #10
              +'        if (ConfineAreaPointList.length<=2){                                  '      + #13 + #10
              +'          alert("绘制电子围栏需要至少3个点！");                               '      + #13 + #10
              +'          exit;                                                               '      + #13 + #10
              +'        }                                                                     '      + #13 + #10
              +'        var ConfineArea = {IdStr:'', Text:'', mObjMarker:null, points:null};  '      + #13 + #10
              +'        var points = new Array();                                             '      + #13 + #10
              +'        for (var i=0; i<ConfineAreaPointList.length; i++){                    '      + #13 + #10
              +'          points.push(ConfineAreaPointList[i]);                               '      + #13 + #10
              +'        }                                                                     '      + #13 + #10
//              +'        //根据点数组创建一个多边形                                          '      + #13 + #10
              +'        var polygon = new LTPolygon(points);                                  '      + #13 + #10
              +'        polygon.setFillColor("transparent");                                  '      + #13 + #10
              +'        polygon.setLineStroke(2);                                             '      + #13 + #10
              +'                                                                              '      + #13 + #10
//              +'        //将多边形添加到地图                                                '      + #13 + #10
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
//            +'        //给多边形添加点击事件绑定'
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
//              +'    // 删除一个多边形，及电子围栏                                           '      + #13 + #10
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
//              +'    // 删除所有的多边形，及电子围栏                                                                                                                                   '
              +'    function DeleteAllConfineArea(){                                          '      + #13 + #10
              +'      for (var i=0; i<ConfineAreaList.length; i++){                           '      + #13 + #10
              +'        map.removeOverLay(ConfineAreaList[i].mObjMarker, true);               '      + #13 + #10
              +'      }                                                                       '      + #13 + #10
              +'      while(ConfineAreaList.pop());                                           '      + #13 + #10
              +'    }                                                                         '      + #13 + #10
              +'                                                                              '      + #13 + #10
//              +'    // 修改一个多边形，及电子围栏                                           '      + #13 + #10
              +'    function ModifyAConfineArea(IdStr, Text, Color){                          '      + #13 + #10
              +'      for (var i=0; i<ConfineAreaList.length; i++){                           '      + #13 + #10
              +'        if (ConfineAreaList[i].IdStr == IdStr){                               '      + #13 + #10
              +'          ConfineAreaList[i].Text = Text;                                     '      + #13 + #10
//            +'           //给多边形添加点击事件绑定'
//              +'          //LTEvent.addListener(ConfineAreaList[i].mObjMarker, "click", function(){alert(Text)});	                               '
//              +'          //ConfineAreaList[i].mObjMarker.setLineColor("255");                                                                                            '
              +'        }                                                                     '      + #13 + #10
              +'      }                                                                       '      + #13 + #10
              +'    }                                                                         '      + #13 + #10
              +'                                                                              '      + #13 + #10
//              +'    // 定位电子围栏                                                                                                                                  '
              +'    function Locate_ConfineArea(log, lat){                                    '      + #13 + #10
              +'      var point=new LTPoint(log, lat);                                        '      + #13 + #10
              +'      map.centerAndZoom(point, map.getCurrentZoom());                         '      + #13 + #10
              +'    }                                                                         '      + #13 + #10
              +'                                                                              '      + #13 + #10
//              +'    // 刷新单个车机                                                         '      + #13 + #10
              +'    function RefreshDev(log, lat, idstr, carno, ColorStr, GpsTime)            '      + #13 + #10
              +'    {                                                                         '      + #13 + #10
              +'      var b = true;                                                           '      + #13 + #10
              +'      for (var i=0; i<mArrJson.length; i++){                                  '      + #13 + #10
              +'        if (mArrJson[i].mObjStrId == idstr){                                  '      + #13 + #10
              +'                                                                              '      + #13 + #10
//              +'          /*if (mArrJson[i].GpsTime != GpsTime){	// GPS时间变化，说明该定位点是最新定位点，需要刷新该车辆的信息                        '
//              +'              mArrJson[i].mObjMarkers.setFontColor(ColorStr);	// 新定位点中，车辆状态可能改变，所以要更新当前车辆颜色                  '
//              +'          }                                                                                                                           '
//              +'                                                                                                                                       '
//              +'          if ((mArrJson[i].mObjMarkers.getPoint().getLongitude()==log) && (mArrJson[i].mObjMarkers.getPoint().getLatitude()==lat)){ '
//              +'            // 如果最新定位点的经纬度和上个定位点的经纬度相同，就无需刷新改车辆的位置                                              '
//              +'            //mArrJson[i].mObjMarkers.setPoint(mArrJson[i].mObjMarkers.getPoint());                                               '
//              +'          }                                                                                                                      '
//              +'          else{                                                                                                                 '
//              +'            var mpoint = new LTPoint(log, lat);                                                                                '
//              +'            mArrJson[i].mObjMarkers.setPoint(mpoint);                                                                         '
//              +'            mArrJson[i].mObjMarkers.setFontColor(ColorStr);	// 新定位点中，车辆状态可能改变，所以要更新当前车辆颜色          '
//              +'          } */                                                                                                              '
              +'                                                                              '     + #13 + #10
              +'          var mpoint = new LTPoint(log, lat);                                 '     + #13 + #10
              +'          mArrJson[i].mObjMarkers.setPoint(mpoint);                           '     + #13 + #10
//            +'          // 新定位点中，车辆状态可能改变，所以要更新当前车辆颜色'
              +'          mArrJson[i].mObjMarkers.setFontColor(ColorStr);	                    '     + #13 + #10
              +'          b = false;                                                          '     + #13 + #10
              +'          break;                                                              '     + #13 + #10
              +'                                                                              '     + #13 + #10
              +'        }                                                                     '     + #13 + #10
              +'      }                                                                       '     + #13 + #10
              +'                                                                              '     + #13 + #10
              +'      if (b){                                                                 '     + #13 + #10
//              +'        //定义一对象，用来处注                                              '     + #13 + #10
              +'        var mMarkerOp = {mObjStrId:'',mObjMarkers:null,mObjHtml: null, mObjText: null, mObjFlag: true, mCarNo: '', ColorStr: '', GpsTime: ''};  '  + #13 + #10
//              +'        //var marker = new LTMarker( new LTPoint( log , lat ), icon );      '     + #13 + #10
              +'        var marker = new LTMapText( new LTPoint( log , lat ));                '     + #13 + #10
              +'        marker.setLabel("●");                                                '     + #13 + #10
              +'        marker.setFontSize(8);                                                '     + #13 + #10
              +'        marker.setFontColor(ColorStr);                                        '     + #13 + #10
              +'        marker.setBorderLine(0);//将文字设置为没有边框                        '     + #13 + #10
              +'        marker.setBackgroundColor("")                                         '     + #13 + #10
              +'        map.addOverLay( marker );                                             '     + #13 + #10
              +'                                                                              '     + #13 + #10
              +'        mMarkerOp.mObjStrId = idstr;                                          '     + #13 + #10
              +'        mMarkerOp.mCarNo = carno;                                             '     + #13 + #10
              +'        mMarkerOp.ColorStr = ColorStr;                                        '     + #13 + #10
              +'        mMarkerOp.GpsTime = GpsTime;                                          '     + #13 + #10
              +'        mMarkerOp.mObjMarkers = marker;                                       '     + #13 + #10
              +'        mArrJson[mArrJson.length] = mMarkerOp;                                                   '      + #13 + #10
//              +'        //LTEvent.addListener(marker1,"mouseover",show);//在地图有变化的时候显示新的经纬度     '      + #13 + #10
              +'                                                                                                 '      + #13 + #10
              +'        var html="<br>车牌号：" + carno + "</br><br>设备ID：" + idstr + "</br>";                 '      + #13 + #10
              +'        LTEvent.addListener(marker,"mouseover",getMouseOverCallBack(mMarkerOp,html));            '      + #13 + #10
              +'        LTEvent.addListener(marker,"mouseout",getMouseOutCallBack(marker));                      '      + #13 + #10
              +'      }                                                                       '    + #13 + #10
              +'    }                                                                         '    + #13 + #10
              +'                                                                              '    + #13 + #10
//              +'    // 循环刷新车机                                                         '    + #13 + #10
              +'    function RefreshDevList(json)                                             '    + #13 + #10
              +'    {                                                                         '    + #13 + #10
              +'      try{                                                                    '    + #13 + #10
//              +'        //var myDate = new Date();                                          '    + #13 + #10
//              +'        //var j = myDate.getSeconds()+'':''+myDate.getMilliseconds();       '    + #13 + #10
              +'        DevListJSon = strToJson(json);                                        '    + #13 + #10
              +'        var bounds = map.getBoundsLatLng();                                   '    + #13 + #10
              +'        for (var i=0; i<DevListJSon.length; i++){                             '    + #13 + #10
              +'          try{                                                                '    + #13 + #10
//            +'            // 最新定位点在地图显示范围内'
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
//              +'    // 获取地图左上角和右下角的经纬度                                       '    + #13 + #10
              +'    function GetLogLat(){                                                     '    + #13 + #10
              +'                                                                              '    + #13 + #10
              +'      var str="你选择的区域坐标为：\n";                                       '    + #13 + #10
//             +'      // 最小经度、最大纬度'
              +'      str+="左上角坐标："+map.getBoundsLatLng().getXmin()+","+map.getBoundsLatLng().getYmax()+"\n";	 '     + #13 + #10
//            +'      // 最大经度、最小纬度'
              +'      str+="右下角坐标："+map.getBoundsLatLng().getXmax()+","+map.getBoundsLatLng().getYmin()+"\n";  '     + #13 + #10
              +'      alert(str);                                                             '    + #13 + #10
              +'    }                                                                         '    + #13 + #10
              +'                                                                              '    + #13 + #10
//              +'    // 加载需要刷新的车机信息                                               '    + #13 + #10
              +'    function AddDev(log, lat, IdStr, CarNo){                                  '    + #13 + #10
              +'      var DevMarker = {log: 0, lat: 0, IdStr: '', CarNo: '', IsBusy: 0};      '    + #13 + #10
              +'      DevMarker.log = log;                                                    '    + #13 + #10
              +'      DevMarker.lat = lat;                                                    '    + #13 + #10
              +'      DevMarker.IdStr = IdStr;                                                '    + #13 + #10
              +'      DevMarker.CarNo = CarNo;                                                '    + #13 + #10
              +'      DevList[DevList.length] = DevMarker;                                    '    + #13 + #10
              +'    }                                                                         '    + #13 + #10
              +'                                                                              '    + #13 + #10
//              +'    // 将JSON格式字符串转换为JS能够识别的JSON格式                           '    + #13 + #10
              +'    function strToJson(str){                                                  '    + #13 + #10
              +'       var json = eval(''('' + str + '')'');                                  '    + #13 + #10
              +'       return json;                                                           '    + #13 + #10
              +'    }                                                                         '    + #13 + #10
              +'                                                                              '    + #13 + #10
//              +'    // 清空搜索地名图标                                                     '    + #13 + #10
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
//              +'    //清空地图图标                                                          '    + #13 + #10
              +'    function clear(){                                                         '    + #13 + #10
              +'      map.clearOverLays();                                                    '    + #13 + #10
              +'      while(DevList.pop());                                                   '    + #13 + #10
              +'      while(mArrJson.pop());                                                  '    + #13 + #10
              +'      while(SearchMarker.pop());                                              '    + #13 + #10
              +'    }                                                                         '    + #13 + #10
              +'                                                                              '    + #13 + #10
//              +'    // 打开浮动窗体                                                         '    + #13 + #10
              +'    function getMouseOverCallBack(mMarkerOp,html)                             '    + #13 + #10
              +'    {                                                                         '    + #13 + #10
              +'      return function()                                                       '    + #13 + #10
              +'      {                                                                       '    + #13 + #10
              +'        mMarkerOp.mObjMarkers.openInfoWinHtml(html);                          '    + #13 + #10
              +'        OnCarAction(mMarkerOp.mObjStrId);                                     '    + #13 + #10
              +'      } ;                                                                     '    + #13 + #10
              +'    }                                                                         '    + #13 + #10
              +'                                                                              '    + #13 + #10
//              +'    // 鼠标在地图上移至车辆上方时，车辆列表和车辆信息中动态显示改车辆信息   '    + #13 + #10
              +'    function OnCarAction(DevIdStr){                                           '    + #13 + #10
              +'      window.external.OnCarAction(DevIdStr);                                  '    + #13 + #10
              +'    }                                                                         '    + #13 + #10
              +'                                                                              '    + #13 + #10
//              +'    // 关闭浮动窗体                                                         '    + #13 + #10
              +'    function getMouseOutCallBack(marker){                                     '    + #13 + #10
              +'      return function()	{marker.closeInfoWin()};                              '    + #13 + #10
              +'    }                                                                         '    + #13 + #10
              +'                                                                              '    + #13 + #10
//              +'    // 定位选定车辆                                                         '    + #13 + #10
              +'    function Locate_car(log, lat, idstr, carno){                              '    + #13 + #10
              +'      for (var i=0; i<mArrJson.length; i++){                                  '    + #13 + #10
              +'        if (mArrJson[i].mObjStrId == idstr){                                  '    + #13 + #10
              +'          var mpoint = new LTPoint(log, lat);                                 '    + #13 + #10
              +'          var html="<br>车牌号：" + carno + "</br><br>设备ID：" + idstr + "</br>";    '    + #13 + #10
              +'                                                                              '    + #13 + #10
              +'          mArrJson[i].mObjMarkers.setPoint(mpoint);                           '    + #13 + #10
              +'          map.centerAndZoom(mpoint,map.getCurrentZoom());                     '    + #13 + #10
              +'          mArrJson[i].mObjMarkers.openInfoWinHtml(html )                      '    + #13 + #10
              +'          break;                                                              '    + #13 + #10
              +'        }                                                                     '    + #13 + #10
              +'      }                                                                       '    + #13 + #10
              +'    }                                                                         '    + #13 + #10
              +'                                                                              '    + #13 + #10
//              +'    // 定位地点位置                                                         '    + #13 + #10
              +'    function Locate_SearchResult(i)                                           '    + #13 + #10
              +'    {                                                                         '    + #13 + #10
              +'      var html = SearchMarker[i].name;                                        '    + #13 + #10
              +'                                                                              '    + #13 + #10
//              +'      //mArrJson[i].mObjMarkers.setPoint(mpoint);                           '    + #13 + #10
              +'      map.centerAndZoom(SearchMarker[i].getPoint(),map.getCurrentZoom());     '    + #13 + #10
              +'      SearchMarker[i].openInfoWinHtml(html)                                   '    + #13 + #10
              +'    }                                                                         '    + #13 + #10
              +'                                                                              '    + #13 + #10
//              +'    // 存放轨迹回放数据                                                     '    + #13 + #10
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
//              +'    // 轨迹回放，由CS调用                                                   '    + #13 + #10
              +'    function play()                                                           '    + #13 + #10
              +'    {                                                                         '    + #13 + #10
              +'      clear();                                                                '    + #13 + #10
              +'      Postion = 0;                                                            '    + #13 + #10
              +'      PlayHistroyGpsData();                                                   '    + #13 + #10
              +'    }                                                                         '    + #13 + #10
              +'                                                                              '    + #13 + #10
//              +'    // 轨迹回放                                                             '    + #13 + #10
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
//            +'        //设置折线线型'
              +'        polyLine.setLineStyle("Solid");	                                      '    + #13 + #10
//            +'        //设置折线线宽'
              +'        polyLine.setLineStroke(1);	                                          '    + #13 + #10
//            +'        //设置折线透明度'
              +'        polyLine.setOpacity(0.8);	                                            '    + #13 + #10
//            +'        //设置折线的两端箭头'
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
//              +'    // 回调delphi函数，重新开始刷新车辆位置                                 '    + #13 + #10
              +'    function EndPlayHistroy(){                                                '    + #13 + #10
              +'      window.external.EndPlayHistroy();                                       '    + #13 + #10
              +'    }                                                                         '    + #13 + #10
              +'                                                                              '    + #13 + #10
//              +'    //轨迹回放,画轨迹线                                                     '    + #13 + #10
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
//            +'      // 历史轨迹点不在地图显示范围内时，将车辆居中 '                              + #13 + #10
              +'      setTimeout(PlayHistroyGpsData,TimeInterval);                            '    + #13 + #10
              +'    }                                                                         '    + #13 + #10
              +'                                                                              '    + #13 + #10
//              +'    // 设置回放速度                                                         '    + #13 + #10
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
              +'    <input id="dzwl" type="button" value="电子围栏" style="Z-INDEX: 600; position: absolute; top: 15px; right: 234px; background: gainsboro;"                  '
              +'          onClick="AddConfineArea()">                                                                                                                          '
              +'    <input id="bz" type="button" value="标 注" style="Z-INDEX: 600; position: absolute; top: 15px; right: 184px; background: gainsboro;"                       '
              +'          onClick="MarkControlBtnClick()">                                                                                                                     '
              +'    <input id="jxxc" type="button" value="矩形选车" style="Z-INDEX: 600; position: absolute; top: 15px; right: 105px; background: gainsboro;"                  '
              +'          onClick="ZoomSearchControlBtnClick()">                                                                                                               '
              +'    <input id="cj" type="button" value="测 距" style="Z-INDEX: 600; position: absolute; top: 15px; right: 55px; background: gainsboro;"                        '
              +'          onClick="PolyLineControlBtnClick()">                                                                                                                 '
              +'    <input type="button"  value="搜 索" style="Z-INDEX: 600; position: absolute; top: 15px; right: 5px; background: gainsboro;"                                '
              +'          onclick="ViewSearch()"/>                                                                                                                             '
              +'                                                                                                                                                               '
              +'    <div id="mapDiv" style="position:absolute;width:870px; height:405px;">                                                                                     '
              +'      <div align="center" style="margin:12px;">                                                                                                                '
              +'        <a href="http://api.51ditu.com/docs/mapsapi/help.html" target="_blank" style="color:#D01E14;font-weight:bolder;font-size:12px;">看不到地图请点这里</a> '
              +'      </div>                                                                                                                                                   '
              +'    </div>                                                                                                                                                     '
              +'                                                                                                                                                               '
              +'    <div id="search1" style="position: absolute; top: 0px; right: 235px; display:none;">                                                                       '
              +'      <div id="search" style="z-index:4;position:absolute;left:-5px;top: 37px; right: 5px;height:50px;width:230px; margin:4px; padding:8px;display:"";">    '
              +'        <table width="100%" border=1 cellspacing="0" cellpadding="3" bordercolordark="#ffffff" bordercolorlight="#003366" style="font-size:12px;">             '
              +'          <tr>                                                                                                                                                 '
              +'            <td align="center" colspan="2">                                                                                                                    '
              +'              在 <input type="text" id="city" value="南京" size="5" onchange="LocalSearch.setCity(this.value);"/> 市 搜索                                      '
              +'              <input type="text" id="word" value="光华路" size="10"/>                                                                                          '
              +'            </td>                                                                                                                                              '
              +'          </tr>                                                                                                                                                '
              +'                                                                                                                                                               '
              +'          <tr>                                                                                                                                                 '
              +'            <td align="center" colspan="2">                                                                                                                    '
              +'              <input class="button" type="button" name="btnOK" 	id="btnOK" 	value="确 定" onclick="LocalSearch.search(document.getElementById(''word'').value);">   '
              +'              <input class="button" type="button" name="btnClear" 	id="btnOK" 	value="清 除" onclick="ClearSearchMarker();">                                  '
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
              +'            <input type="button" value="首页" onclick="LocalSearch.firstPage()"/>                                                                              '
              +'            <input type="button" value="上页" onclick="LocalSearch.previousPage()"/>                                                                           '
              +'            <input type="button" value="下页" onclick="LocalSearch.nextPage()"/>                                                                               '
              +'            <input type="button" value="尾页" onclick="LocalSearch.lastPage()"/><br/>                                                                          '
              +'            转到第<input type="text" value="1" id="pageId" size="2"/>页 <input type="button" onclick="LocalSearch.searchPage(parseInt(document.getElementById(''pageId'').value));" value="转到"/>    '
              +'          </td>                                                                                                                                                '
              +'        </tr>                                                                                                                                                  '
              +'      </div>                                                                                                                                                   '
              +'    </div>                                                                                                                                                     '
              +'  </body>                                                                                                                                                      '
              +'  </html>';

implementation

end.
