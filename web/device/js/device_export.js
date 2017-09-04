/**
 * Created by Emma on 2017/5/22.
 */
jQuery(document).ready(function() {
    Record.init();
});
var Record=function(){

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

                html=html+"               </tr>";
            }
            document.getElementById("tbody").innerHTML=html;
        });
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



    var handleButtonEvent=function(){
        //$('#return_button').click(function() {RecordconfirmBack();});
        $('#search_button').click(function() {Record.searchRecord();});
        $('#delete_button').click(function() {Record.deleteRecord();});
        $('#add_button').click(function() {Record.addRecord();});
        $('#submit_button').click(function() {Record.modifyRecord();});
        //$('#tools_menu_reload').click(function() {Record.reload();});
        //$('#help_button').click(function() {Record.help();});
        $('#export_button').click(function() {Record.exportRecord();});
        $('#print_button').click(function() {Record.printRecord();});
    };

    var showChart=function () {
    };

    return{
        init:function(){
            _showdata();
            handleButtonEvent();
        },
        deleteRecord:function(post_id){
            deleteRecord(post_id);
        },

        printRecord:function(oper){
            printRecord(oper);
        },

        exportRecord:function () {
            exportRecord();
        }

    };

}();

