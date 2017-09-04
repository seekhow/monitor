jQuery(document).ready(function() {
    Record.init();
});
var Record=function(){
    var UpdateDeviceData=function () {
        var url="http://www.ylxteach.net:9999/teach/gis/markers_popup_track/gps_device.jsp?jsoncallback=?";
        $.getJSON(url,function(data){
            //alert(data);
            //alert(JSON.stringify(data));
            var json=data;
            var list=json.aaData;
            for(var i=0;i<list.length;i++){
                var ID=list[i].device_id;
                var L0=list[i].longitude;
                var L1=list[i].latitude;

            }

        });
    };

    var _showdata=function(){
        $.post("show_deviceServletAction",function(data){
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
                html=html+"                         <td><a href=\"javascript:Record.modifyqueryRecord('"+id+"')\"><span>修改</span></a>&nbsp;<a href=\"javascript:Record.deleteRecord('"+deviceid+"')\"><sapn>删除</sapn></a>&nbsp;<a href=\"javascript:Record.viewRecord('"+id+"')\"><span>查看</span></a></td>";
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
    var modifyqueryRecord=function(modifyID){
        var url = "device_modify.jsp?id=" + modifyID;

        window.self.location=url;
    };
    //查看
    var viewRecord=function(mid){

        window.self.location="device_view.jsp?id="+mid;
    };
    //打印
    var printRecord=function(oper){
        //window.location.href="device_print.jsp?exist_resultset=1";

        if (oper < 10){
            bdhtml=window.document.body.innerHTML; //获取当前页的html代码
            sprnstr="<!--startprint"+oper+"-->";//设置打印开始区域
            eprnstr="<!--endprint"+oper+"-->";//设置打印结束区域
            prnhtml=bdhtml.substring(bdhtml.indexOf(sprnstr)+18); //从开始代码向后取html
            prnhtml=prnhtml.substring(0,prnhtml.indexOf(eprnstr));//从结束代码向前取html
            window.document.body.innerHTML=prnhtml;
            window.print();
            window.document.body.innerHTML=bdhtml;
        } else {
            window.print();
        }

    };
    /*var printRecord=function(){
     window.location.href="/device/device_print.jsp";
     };
     */
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
    var exportRecord=function(){
        window.self.location="device_export.jsp";
    };
    var handleButtonEvent=function(){
        //$('#return_button').click(function() {RecordconfirmBack();});
        $('#search_button').click(function() {Record.searchRecord();});
        $('#delete_button').click(function() {Record.deleteRecord();});
        $('#add_button').click(function() {Record.addRecord();});
        $('#submit_button').click(function() {Record.modifyRecord();});
        //$('#tools_menu_reload').click(function() {Record.reload();});
        //$('#help_button').click(function() {Record.help();});
        $('#export_button').click(function() {Record.exportRecord();});
        //$('#print_button').click(function() {Record.printRecord();});
    };

    var showChart=function () {
    };

    return{
        init:function(){
            UpdateDeviceData();
            _showdata();
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
        showChart:function(){
            addRecord();
        },
        exportRecord:function () {
            exportRecord();
        },
        viewRecord:function (mid) {
            viewRecord(mid);
        }

    };

}();
