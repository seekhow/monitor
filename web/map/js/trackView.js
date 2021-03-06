/**
 * Created by Emma on 2017/5/27.
 */
//参考：http://jingyan.baidu.com/article/ed2a5d1f3fb4d309f6be17c3.html
//参考：http://www.cnblogs.com/zhangqs008/p/3677098.html

jQuery(document).ready(function() {
    Map.init();
});
//初始化坐标点
var points = [];
//初始化地图
var map; //百度地图对象
var car; //汽车图标
var label; //信息标签
var centerPoint;
//初始化控件
var timer; //定时器
var index = 0; //记录播放到第几个point
var followChk, playBtn, pauseBtn, resetBtn; //几个控制按钮
//初始化上一页传过来的参数
var trackId;
//初始化时间
var date1=new Date();  //开始时间

var date2=new Date();    //结束时间
var Map=function(){
    var initMap=function(){
        // 百度地图API功能
        trackId=GetQueryString("trackid");
        //alert(trackId);
        map = new BMap.Map("container");
        map.centerAndZoom(new BMap.Point(104.001404, 30.55915), 15);
        map.addControl(new BMap.MapTypeControl());   //添加地图类型控件
        map.setCurrentCity("成都");
        map.enableScrollWheelZoom(true);
        map.addControl(new BMap.NavigationControl());
    };
    function GetQueryString(name)
    {
        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if(r!=null)return  unescape(r[2]); return null;
    };

    var addline=function () {
        var gpsTimeFrom=document.getElementById("gps_time_from").value;
        var gpsTimeTo=document.getElementById("gps_time_to").value;
        var url="http://www.cdylx.org:9090/teach/gis/markers_popup_track/gps_track.jsp?device_id="+trackId+"&gps_time_from="+gpsTimeFrom+"&gps_time_to="+gpsTimeTo+"&jsoncallback=?";
        alert(url);
        $.getJSON(url,function(data){
            //var json=eval("("+data+")");
            alert(JSON.stringify(data));
            var list=data.aaData;
            var deviceid;
            var devicetime;

            alert(list.length);
            for(var i=0;i<list.length;i++){
                devicetime=list[i].gps_time;
                deviceid=list[i].device_id;
                var L1=list[i].latitude;
                var L0=list[i].longitude;

                // var spe=list[i][5];
                // var loc=list[i][6];

                points[i]=new BMap.Point(L0,L1);
                map.centerAndZoom(points[0], 18);
            }

            var licheng=0;
            var lucheng=new Array();
            var shijianchashuzu=new Array();
            var sudu=new Array();
            var html1="";
           //里程累加以及瞬时距离数组的填充
            for(var m=0;m<list.length-1;m++)
            {
                licheng=licheng+((map.getDistance(points[m],points[m+1])));
                lucheng[m]=map.getDistance(points[m],points[m+1]);
                shijianchashuzu[m]=jisuanshijiancha(list[m].gps_time,list[m+1].gps_time);
                //速度的统计
                sudu[m]=lucheng[m]/(1000*shijianchashuzu[m]);
                //alert(sudu[m]);
                if(sudu[m]>=document.getElementById("chaosuxianzhi").value)
                {

                   html1=html1+"                 <tr>";
                   html1=html1+"                         </td>";
                   html1=html1+"                       <td>"+deviceid+"</td>";
                   html1=html1+"                       <td>"+list[m].latitude+"</td>";
                   html1=html1+"                       <td>"+list[m].longitude+"</td>";
                   html1=html1+"                       <td>"+sudu[m]+"</td>";

                   html1=html1+"                       <td data-value=\"2\">"+list[m].gps_time+"</td>";
                   //html=html+"                         <td><a href=\"javascript:Record.modifyqueryRecord('"+id+"')\"><span>修改</span></a>&nbsp;<a href=\"javascript:Record.deleteRecord('"+deviceid+"')\"><sapn>删除</sapn></a>&nbsp;<a href=\"javascript:Record.viewRecord('"+id+"')\"><span>查看</span></a></td>";
                   html1=html1+"               </tr>";

                 }

            }
            document.getElementById("tbody1").innerHTML=html1;

           //里程统计显示
           alert(licheng+"米");//获取两点距离,保留小数点后两位
            licheng=(licheng/1000).toFixed(2);
          var haoyou=(licheng/10).toFixed(2);
            var html="";
            html=html+"                 <tr>";
            html=html+"                         </td>";
            html=html+"                       <td>"+deviceid+"</td>";
             html=html+"                         <td>"+licheng+"</a>";
            html=html+"                         <td data-value=\"0\">"+haoyou+"</td>";

             html=html+"                         </td>";
             html=html+"                         <td data-value=\"2\">"+devicetime+"</td>";
         //    html=html+"                         <td><a href=\"javascript:Record.modifyqueryRecord('"+id+"')\"><span>修改</span></a>&nbsp;<a href=\"javascript:Record.deleteRecord('"+deviceid+"')\"><sapn>删除</sapn></a>&nbsp;<a href=\"javascript:Record.viewRecord('"+id+"')\"><span>查看</span></a></td>";
             html=html+"               </tr>";
             document.getElementById("tbody").innerHTML=html;
        //     alert(points[0]);
        followChk = document.getElementById("follow");
        playBtn = document.getElementById("play");
        pauseBtn = document.getElementById("pause");
        resetBtn = document.getElementById("reset");
        //alert("1");

        //连接所有点
        map.addOverlay(new BMap.Polyline(points, {strokeColor: "black", strokeWeight: 5, strokeOpacity: 1}));
        //显示小车子
        label = new BMap.Label("", {offset: new BMap.Size(-20, -20)});
        car = new BMap.Marker(points[0]);
        car.setLabel(label);
        map.addOverlay(car);

//点亮操作按钮
        playBtn.disabled = false;
        resetBtn.disabled = false;
        })

    };

    return{
        init: function(){
            initMap();
        },
        GetQueryString:function(name){
            GetQueryString(name);
        },

        addline:function(){
            addline();
        }
    };

}();
function play() {
    playBtn.disabled = true;
    pauseBtn.disabled = false;

    var point = points[index];
    if(index > 0) {
        map.addOverlay(new BMap.Polyline([points[index - 1], point], {strokeColor: "red", strokeWeight: 1, strokeOpacity: 1}));
    }

    label.setContent("经度: " + point.lng + "<br>纬度: " + point.lat);
    car.setPosition(point);
    index++;
    if(followChk.checked) {
        map.panTo(point);
    }

    if(index < points.length) {
        timer = window.setTimeout("play(" + index + ")", 200);

    } else {
        playBtn.disabled = true;
        pauseBtn.disabled = true;
        map.panTo(point);
    }

};

function pause() {
    playBtn.disabled = false;
    pauseBtn.disabled = true;

    if(timer) {
        window.clearTimeout(timer);
    }
};

function reset() {
    followChk.checked = false;
    playBtn.disabled = false;
    pauseBtn.disabled = true;

            if(timer) {
        window.clearTimeout(timer);    index = 0;

    }
    car.setPosition(points[0]);
    map.panTo(centerPoint);
};
function jisuanshijiancha(date1,date2) {
    //alert(date2+"1"+date1);

    var date11=new Date(date1);
    var date22=new Date(date2);
    var date3=date22.getTime()-date11.getTime() ; //时间差的毫秒数


//计算出相差天数
    var days=Math.floor(date3/(24*3600*1000));

//计算出小时数

    var leave1=date3%(24*3600*1000) ;   //计算天数后剩余的毫秒数
    var hours=Math.floor(leave1/(3600*1000));
//计算相差分钟数;
    var leave2=leave1%(3600*1000) ;       //计算小时数后剩余的毫秒数
    var minutes=Math.floor(leave2/(60*1000));


//计算相差秒数
    var leave3=leave2%(60*1000)  ;    //计算分钟数后剩余的毫秒数
    var seconds=Math.round(leave3/1000);
    //alert(" 相差 "+days+"天 "+hours+"小时 "+minutes+" 分钟"+seconds+" 秒");
   // alert(date3/3600000);
    return (date3/3600000)



}

