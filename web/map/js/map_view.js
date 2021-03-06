//参考：http://jingyan.baidu.com/article/ed2a5d1f3fb4d309f6be17c3.html
//参考：http://www.cnblogs.com/zhangqs008/p/3677098.html

jQuery(document).ready(function() {
	Map.init();
});
var map;    
var point=new Array();//存放标注点经纬度信息的数组
var marker=new Array();//存放标注点对象的数组
var info=new Array();//存放提示信息窗对象的数组
var Map=function(){
	var initMap=function(){
		// 百度地图API功能
		map = new BMap.Map("allmap");    // 创建Map实例
		map.centerAndZoom(new BMap.Point(104.001404, 30.55915), 5);  // 初始化地图,设置中心点坐标和地图级别
		map.addControl(new BMap.MapTypeControl());   //添加地图类型控件
		map.setCurrentCity("成都");          // 设置地图显示的城市 此项是必须设置的
		map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
	};
	var addMarker=function(){	//添加标注
            var url=""; //这里的url部分要添加数据源，可以直接改为get方式去获取后台servlet传过来的数据
                $.getJSON(url,function(data){
                    //alert(data);
                    //alert(JSON.stringify(data));
                    var json=data;
                      var list=json.aaData;
                      for(var i=0;i<list.length;i++){                       
                          var ID=list[i].device_id;
                          var L0=list[i].longitude;
                          var L1=list[i].latitude;
                          //var popcontent=list[i].device_content;
                          point[i]=new BMap.Point(L0,L1);
                          marker[i]=new BMap.Marker(point[i]);                
                          map.addOverlay(marker[i]);
                          info[i]=new window.BMap.InfoWindow("<div>设备ID:"+ID+"<br>经度:"+L0+"<br>纬度:"+L1+"<br><a href=\"device.jsp\">more information</a></div>");
                          addPopup(i);
                      }
		
                });
    };
             var addPopup=function(i){

                 marker[i].addEventListener("click",function(){

                     this.openInfoWindow(info[i]);

                  });
              };
							return{
                                  init: function(){
                                       initMap();
                                       addMarker();
                                       //addLine();
                                       }
                      };

}();      

