/**
 * Created by Emma on 2017/5/16.
 */
var name;
jQuery(document).ready(function() {
    Record.init();
});
var Record=function(){

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
        //alert(Id);
        var url = "modifyquery_deviceServletAction?id=" + Id;
        //alert(url);
        $.post(url,function(data) {
            var json = eval("(" + data + ")");
            var list = json.aaData;
            var deviceid = list[0][0];
            var devicename = list[0][1];
            var devicehost = list[0][2];
            var devicestatus = list[0][3];
            var devicecontent = list[0][4];

            var i_d = list[0][5];
            document.getElementById("inputId").value = i_d;
            //alert(i_d);
            //alert(document.getElementById("inputId").value);
            document.getElementById("device_id").value = deviceid;
            document.getElementById("device_name").value = devicename;
            document.getElementById("device_host").value = devicehost;
            document.getElementById("device_status").value = devicestatus;
            document.getElementById("content").value = devicecontent;

        });

    }


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
            window.self.location="device.jsp";
        });

    };

    var searchRecord=function(){
        var deviceId=document.getElementById("device_id").value;
        var url="search_deviceServletAction?device_id="+deviceId;
        //alert(url);
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
        //$('#tools_menu_reload').click(function() {Record.reload();});
        //$('#help_button').click(function() {Record.help();});
        //$('#export_button').click(function() {Record.exportRecord();});
        $('#print_button').click(function() {Record.printRecord();});
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
        var url1="modify_deviceServletAction?id="+I_d+"&device_id="+deviceId+"&device_name="+deviceName+"&device_host="+deviceHost+"&device_status="+deviceStatus+"&content="+content;
        //alert(url1);
        window.self.location=url1;

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
        }
    };

}();
