/**
 * Created by Emma on 2017/5/18.
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

            //数据为空检测
            //alert(list);
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
                html=html+"               </tr>";
            }
            document.getElementById("tbody").innerHTML=html;
        });
    };



    return{
        init:function(){
            _showdata();

        },
        searchRecord:function(){
            searchRecord();
        },
        showChart:function(){
            addRecord();
        }
    };

}();
