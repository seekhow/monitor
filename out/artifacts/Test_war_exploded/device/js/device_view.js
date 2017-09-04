/**
 * Created by Emma on 2017/5/23.
 */
/**
 * Created by Emma on 2017/5/16.
 */
var name;
jQuery(document).ready(function() {
    Record.init();
});
var Record=function(){
    var userId;
    var nowIndex=0;
    var length=0;
    var list;
    var _showdata=function(){
        $.post("modifyquery_deviceServletAction",function(data){
            var html="";
            var json=eval("("+data+")");
            var list=json.aaData;

            for(var i=0;i<list.length;i++){
                var deviceid=list[i][0];
                var devicename=list[i][1];
                var devicehost=list[i][2];
                var devicestatus=list[i][3];
                var devicecontent=list[i][4];
                var id=list[i][5];
                html=html+"                 <tr>";

                html=html+"                         </td>";  html=html+"                       <td>"+deviceid+"</td>";
                html=html+"                         <td>"+devicename+"</a>";
                html=html+"                         <td data-value=\"0\">"+devicehost+"</td>";
                if(devicestatus==1){
                    html=html+"                         <td data-value=\"1\">";
                    html=html+"                              <span class=\"status-metro status-active\" title=\"Active\">正常</span>";
                }
                else{
                    html=html+"                         <td data-value=\"3\">";
                    html=html+"                              <span class=\"status-metro status-suspended\" title=\"Suspended\">异常</span>";
                }
                html=html+"                         </td>";
                html=html+"                         <td data-value=\"2\">"+devicecontent+"</td>";
                html=html+"                         <td><a href=\"javascript:Record.modifyqueryRecord('"+id+"')\"><span>修改</span></a>&nbsp;<a href=\"javascript:Record.deleteRecord('"+deviceid+"')\"><sapn>删除</sapn></a></td>";
                html=html+"               </tr>";
            }
            document.getElementById("tbody").innerHTML=html;
        });
    };
    //删除
    var deleteRecord=function(post_id){
        var flag=confirm("你是否确定删除这条记录？！");
        if(flag==true){
            window.self.location="delete_deviceServletAction?id="+post_id;
        }
    };
    //修改
    var modifyqueryRecord=function(){

        var Id=GetQueryString("id");

        var url = "query_deviceServletAction?id=" + Id;

        $.post(url,function(data) {
            var json = eval("(" + data + ")");

            list = json.aaData;
            length=list.length;
            for(var i=0;i<length;i++)
            {
                if(list[i][5]==Id)
                {
                    nowIndex=i;
                }
            }
            var deviceid = list[nowIndex][0];
            var devicename = list[nowIndex][1];
            var devicehost = list[nowIndex][2];
            var devicestatus = list[nowIndex][3];
            var devicecontent = list[nowIndex][4];
            var i_d = list[nowIndex][5];
            var devicelongitude=list[nowIndex][6];
            var devicelatitude=list[nowIndex][7];

            document.getElementById("inputId").value = i_d;
            document.getElementById("device_id").value = deviceid;
            document.getElementById("device_name").value = devicename;
            document.getElementById("device_host").value = devicehost;
            document.getElementById("device_status").value = devicestatus;
            document.getElementById("content").value = devicecontent;
            document.getElementById("longitude").value = devicelongitude;
            document.getElementById("latitude").value = devicelatitude;

        });

    };

//查看

    var getRecordViewByIndex = function(index){

        getRecordView(index);
    }
    var getRecordView = function(index){

        var deviceid = list[index][0];
        var devicename = list[index][1];
        var devicehost = list[index][2];
        var devicestatus = list[index][3];
        var devicecontent = list[index][4];
        var i_d = list[index][5];
        document.getElementById("inputId").value = i_d;
        document.getElementById("device_id").value = deviceid;
        document.getElementById("device_name").value = devicename;
        document.getElementById("device_host").value = devicehost;
        document.getElementById("device_status").value = devicestatus;
        document.getElementById("content").value = devicecontent;

    };
    var first=function(){
        nowIndex=0;
        getRecordViewByIndex(nowIndex);
    };
    var prev=function(){
        if (nowIndex<=0)
        {
            alert("已经是最前面了");
        }
        else {
            nowIndex = nowIndex - 1;
            getRecordViewByIndex(nowIndex);
        }
    };
    var next=function(){
        if (nowIndex>=length)
        {
            alert("已经是最后面了");
        }
        else {
            nowIndex = nowIndex + 1;
            getRecordViewByIndex(nowIndex);
        }
    }
    var last=function(){
        nowIndex=length-1;
        getRecordViewByIndex(nowIndex);
    };
    var addRecord=function(){
        var deviceId=encodeURI(document.getElementById("device_id").value);
        var deviceName=encodeURI(document.getElementById("device_name").value);
        var deviceHost=encodeURI(document.getElementById("device_host").value);
        var deviceStatus=encodeURI(document.getElementById("device_status").value);
        var content=encodeURI(document.getElementById("content").value);

        //window.self.location="add_deviceServletAction?device_id="+deviceId+"&device_name="+deviceName+"&device_host="+deviceHost+"&device_status"+deviceStatus+"&content"+content;
        //alert("2222");
        var url1="add_deviceServletAction?device_id="+deviceId+"&device_name="+deviceName+"&device_host="+deviceHost+"&device_status="+deviceStatus+"&content="+content;
        //alert(url1);
        $.post(url1,function(data){
            alert("添加成功！");
            window.self.location="/device.jsp";
        });

    };

    var searchRecord=function(){
        var deviceId=document.getElementById("device_id").value;
        var url="search_deviceServletAction?device_id="+deviceId;
       // alert(url);
        $.post(url,function(data){
            var html="";
            var json=eval("("+data+")");
            var list=json.aaData;
            //alert(list);
            for(var i=0;i<list.length;i++){
                var deviceid=list[i][0];
                var devicename=list[i][1];
                var devicehost=list[i][2];
                var devicestatus=list[i][3];
                var devicecontent=list[i][4];
                var id=list[i][5];
                html=html+"                 <tr>";
                html=html+"                       <td>"+deviceid+"</td>";
                html=html+"                         <td>"+devicename+"</a>";
                html=html+"                         </td>";
                html=html+"                         <td data-value=\"0\">"+devicehost+"</td>";
                if(devicestatus==1){
                    html=html+"                         <td data-value=\"1\">";
                    html=html+"                              <span class=\"status-metro status-active\" title=\"Active\">正常</span>";
                }
                else{
                    html=html+"                         <td data-value=\"3\">";
                    html=html+"                              <span class=\"status-metro status-suspended\" title=\"Suspended\">异常</span>";
                }
                html=html+"                         </td>";
                html=html+"                         <td data-value=\"2\">"+devicecontent+"</td>";
                html=html+"                         <td><a href=\"javascript:Record.modifyRecord('"+id+"')\"><span>修改</span></a>&nbsp;<a href=\"javascript:Record.deleteRecord('"+deviceid+"')\"><sapn>删除</sapn></a></td>";
                html=html+"               </tr>";
            }
            document.getElementById("tbody").innerHTML=html;
        });
    };
    var handleButtonEvent=function(){
        //$('#return_button').click(function() {RecordconfirmBack();});
        $('#search_button').click(function() {Record.searchRecord();});
        $('#delete_button').click(function() {Record.deleteRecord();});
        $('#add_button').click(function() {Record.addRecord();});
        $('#submit_button').click(function() {Record.modifyRecord();});
        $('#print_button').click(function() {Record.printRecord();});
        //查看
        $('#first_button').click(function() {Record.first();});
        $('#prev_button').click(function() {Record.prev();});
        $('#next_button').click(function() {Record.next();});
        $('#last_button').click(function() {Record.last();});
    };
    //获取url
    function GetQueryString(name)
    {
        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if(r!=null)return  unescape(r[2]); return null;
    };
    var  modifyRecord=function(){

        var I_d=encodeURI(document.getElementById("inputId").value);
        var deviceId=encodeURI(document.getElementById("device_id").value);
        var deviceName=encodeURI(document.getElementById("device_name").value);
        var deviceHost=encodeURI(document.getElementById("device_host").value);
        var deviceStatus=encodeURI(document.getElementById("device_status").value);
        var content=encodeURI(document.getElementById("content").value);

        //window.self.location="add_deviceServletAction?device_id="+deviceId+"&device_name="+deviceName+"&device_host="+deviceHost+"&device_status"+deviceStatus+"&content"+content;
        //alert("2222");
        var url1="/modify_deviceServletAction?id="+I_d+"&device_id="+deviceId+"&device_name="+deviceName+"&device_host="+deviceHost+"&device_status="+deviceStatus+"&content="+content;
        //alert(url1);
        window.self.location=url1;

    };
    var Gototrack=function(){
        var track_id = document.getElementById("device_id").value;
        //alert(track_id);
        window.location = "trackView.html?trackid=" + track_id;
    };
    var locate=function(){
        var track_id = document.getElementById("device_id").value;
        //alert(track_id);
        window.location = "map_locate.jsp?trackid=" + track_id;
    };

    return{
        init:function(){
            modifyqueryRecord();
            GetQueryString();
            handleButtonEvent();
        },
        deleteRecord:function(post_id){
            deleteRecord(post_id);
        },
        modifyqueryRecord:function(modifyID){
            modifyqueryRecord(modifyID);
        },
        modifyRecord:function(mid){
            modifyRecord(mid);
        },
        printRecord:function(oper){
            printRecord(oper);
        },
        addRecord:function(){
            addRecord();
        },
        searchRecord:function(){
            searchRecord();
        },
        GetQueryString:function(name){
            GetQueryString(name);
        },
        handleButtonEvent:function () {
            handleButtonEvent();
        },
        Gototrack:function () {
            Gototrack();
        },
        locate:function () {
            locate();
        },
        first:function(){first();},
        prev:function(){prev();},
        next:function(){next();},
        last:function(){last();}
    };

}();
