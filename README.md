## 简介  
一个新手入门级别的java web应用  
非常简陋，至于有多简陋，如果你不小心看了，还请不要骂我  
当初实习时在参与一个Java web的项目时写的先导项目，即练手项目  
当时负责前端，所以后端就用java最省事的方式写的(反正想着后端是其他人写好的，现在全栈写多了发现自己还是天真)  

## 框架  
前端没有用框架，采取最简单的Jquery+ajax方式来进行交互  
UI库使用的是Bootstrap  
后端服务器端使用Java开发  

## 地图  
使用的是百度地图API  官网文档地址:[点击这里](http://lbsyun.baidu.com/index.php?title=jspopular)   
![](http://otjjfdfdp.bkt.clouddn.com/17-8-15/98236293.jpg)  

这是导入的百度地图API，显示从mysql数据库中查询到的设备位置  
这是上图具体实现的代码，url部分后来开发正式版之后就直接改成跨域从另外一台主机源源不断的得到处理好的设备和经纬度数据   

```
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
    var addMarker=function(){   //添加标注
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

```

## 轨迹  
实现了设备轨迹跟踪回放功能  
```
...
//连接所有点
        map.addOverlay(new BMap.Polyline(points, {strokeColor: "black", strokeWeight: 5, strokeOpacity: 1}));
        //显示小车子
        label = new BMap.Label("", {offset: new BMap.Size(-20, -20)});
        car = new BMap.Marker(points[0]);
        car.setLabel(label);
        map.addOverlay(car);
...
```
轨迹跟踪的一部分实现代码  
![](http://otjjfdfdp.bkt.clouddn.com/17-9-19/65515286.jpg)  

轨迹跟踪的效果  

![](http://otjjfdfdp.bkt.clouddn.com/17-9-19/29945241.jpg)  

以及完整的设备里程统计与超速统计  

## 区域  
实现了在地图上自由勾画一个区域，设备一旦出了规定区域就进行报警通知  
![](http://otjjfdfdp.bkt.clouddn.com/17-9-19/12453929.jpg)  
利用百度地图API提供的几何功能实现的区域管理功能  
```
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
```

## CURD  
用户管理和设备管理两个最基础的模块实现了完整的增删改查，看导引统8个功能  

![](http://otjjfdfdp.bkt.clouddn.com/17-9-19/64345031.jpg)  
![](http://otjjfdfdp.bkt.clouddn.com/17-9-19/46831812.jpg)  
![](http://otjjfdfdp.bkt.clouddn.com/17-9-19/68379442.jpg)  

## 总结  
从零开始，从前到后，也写的不容易  
但是一路写过来，现在再回去看当时写的代码，真的是不忍直视  
想了很久还是把这个项目放了上来  
存在的问题很多，我总结了一下：
- 架构：由于经验不足，导致整个的架构很混乱  
- 框架：没有选择前端的框架去规范化前端开发的流程，使得前端  
- 数据处理：犯了一个打错，用了eval()这个语句去解析json字符串  
- servlet:为方便，一servlet对应1个查询数据库的操作，使得servlet混乱，难以管理  
- 移动端：即使用的Bootstrap已经是响应式的UI库，但是移动端使用感受依然不佳  
- 异步：经验不足，异步开发出现的问题太多