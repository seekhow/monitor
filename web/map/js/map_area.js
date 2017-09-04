//参考：http://jingyan.baidu.com/article/ed2a5d1f3fb4d309f6be17c3.html
//参考：http://www.cnblogs.com/zhangqs008/p/3677098.html

jQuery(document).ready(function() {
	Map.init();
});
var map;
var point = new Array();
var Map=function(){
	var initMap=function(){
		// 百度地图API功能
		map = new BMap.Map("allmap", {enableMapClick:false});    // 创建Map实例
		map.centerAndZoom(new BMap.Point(104.001404, 30.55915), 15);  // 初始化地图,设置中心点坐标和地图级别
		map.addControl(new BMap.MapTypeControl());   //添加地图类型控件
    	map.addControl(new BMap.NavigationControl());  //添加鱼骨控件
		map.setCurrentCity("成都");          // 设置地图显示的城市 此项是必须设置的
		map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
	};
	var savearea = function () {
		var overlays = [];
		var overlaycomplete = function(e){
			overlays.push(e.overlay);
			var path = e.overlay.getPath();//Array<Point> 返回多边型的点数组
			var windowpoint = new BMap.Point(path[1].lng,path[1].lat);
			var savepoints = "POLYGON((";
			for(var i=0;i<path.length;i++){
				//alert("lng:"+path[i].lng+"\n lat:"+path[i].lat);
				savepoints += path[i].lng + " " + path[i].lat + ",";
				//alert(savepoints);
			}
			savepoints = savepoints.substring(0, savepoints.length - 1);
			savepoints += "))";
			alert(savepoints);
			var msg = "是否将该区域保存?\n\n请确认！";
			if (confirm(msg)==true){
				var opts = {
					width : 200,     // 信息窗口宽度
					height: 115     // 信息窗口高度
				}
				var inforwindow=new window.BMap.InfoWindow("<div>请输入区域编号:<input style=\"width:150px;color:#00F;\" id=\"layerid\" type=\'text\' value=\'\'/><br>请输入描述内容:<input   style=\"width:150px;color:#00F;\" id=\"description\" type=\'text\' value=\"\"/><br><input id=\"onSure\" type=\"button\" value=\"确定\" onclick=\"postarea(savepoints);\"></div>  ");
				//map.openInfoWindow(inforwindow, windowpoint);
				postarea(savepoints);
			}
		};
		var styleOptions = {
			strokeColor:"red",    //边线颜色。
			fillColor:"red",      //填充颜色。当参数为空时，圆形将没有填充效果。
			strokeWeight: 3,       //边线的宽度，以像素为单位。
			strokeOpacity: 0.8,       //边线透明度，取值范围0 - 1。
			fillOpacity: 0.6,      //填充的透明度，取值范围0 - 1。
			strokeStyle: 'solid' //边线的样式，solid或dashed。
		}
		//实例化鼠标绘制工具
		var drawingManager = new BMapLib.DrawingManager(map, {
			isOpen: false, //是否开启绘制模式
			enableDrawingTool: true, //是否显示工具栏
			drawingMode:BMAP_DRAWING_POLYGON,//绘制模式  多边形
			drawingToolOptions: {
				anchor: BMAP_ANCHOR_TOP_LEFT, //位置
				offset: new BMap.Size(5, 5), //偏离值
				drawingModes:[
					BMAP_DRAWING_POLYGON
				]
			},
			polygonOptions: styleOptions //多边形的样式
		});
		//添加鼠标绘制工具监听事件，用于获取绘制结果
		drawingManager.addEventListener('overlaycomplete', overlaycomplete);
	};
	var postarea=function(savepoints){
		//alert(111);
		var layerid = "2";//$("layerid").html();
		//var description = $("description").html();
		//alert(layerid);
		//alert(description);
		//$.post("saveareaServletAction?points=" + savepoints + "&layer_id=" + layerid+"&description="+description, function (data) {
		$.post("saveareaServletAction?points=" + savepoints + "&layer_id=" + layerid, function (data) {
			if (data.result_code == 0) {
				alert("保存成功");
			}
		});
	};
	var showarea=function(){	//显示区域
		var layerid = "1";
                $.post("readareaServletAction?layer_id="+layerid,function(json){
					var list=json.aaData;
					for(var i=0;i<list.length;i++){
						showRecord(list[i]);   //每个区域执行一次
					}
                });
    };
	var showRecord = function (json) {
		alert("[showRecord]"+JSON.stringify(json));
		console.log(JSON.stringify(json));
		json.points=json.points.replace("POINTS","");
		json.points=json.points.replace("POINT","");
		json.points=json.points.replace("LINESTRING","");
		json.points=json.points.replace("POLYGON","");
		json.points=json.points.replace("((","");
		json.points=json.points.replace("))","");
		json.points=json.points.replace("(","");
		json.points=json.points.replace(")","");
		//alert(json.points);
		//alert(json.layer_id);
		var polygonData=json.points;
		//alert(polygonData);
		var removeArea = function(e,ee,marker){
			map.removeOverlay(polygon);
			var url = "deleteareaServletAction?layer_id=" + json.layer_id;
			$.post(url, function (data) {
				if (data.result_code == 0) {
					alert("删除成功");
				}
			});
		}
		index=0;
		{
			var pointListx = [];
			var pointListy = [];
			polygonPoints = polygonData.split(",");
			var i=0;
			for(inner_index in polygonPoints){
				singlePoint = polygonPoints[inner_index].split(" ");
				pointX = singlePoint[0];
				pointY = singlePoint[1];
				//alert(pointX+" "+pointY);
				pointListx[i] = Number(pointX);
				pointListy[i] = Number(pointY);
				point[i] = new BMap.Point(pointListx[i], pointListy[i]);
				i++;
			}
		}
		var polygon = new BMap.Polygon(point, {strokeColor:"blue", strokeWeight:2, strokeOpacity:0.5});  //创建多边形
		var markerMenu=new BMap.ContextMenu();
		markerMenu.addItem(new BMap.MenuItem('删除',removeArea.bind(polygon)));
		map.addOverlay(polygon);
		polygon.addContextMenu(markerMenu);
	};
	return{
		init: function(){
			initMap();
			showarea();
			savearea();
		},
		showRecord:function(json){
			showRecord(json);
		},
		postarea:function(){
			postarea();
		}
	};
}();
