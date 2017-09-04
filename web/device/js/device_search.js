jQuery(document).ready(function() {
    Record.init();
});
var Record=function(){
    var post_id;
    var oper;
    function searchData(){
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

    //查询

    var handleButtonEvent=function(){

        //$('#return_button').click(function() {Page.confirmBack();});
        $('#search_button').click(function() {Record.searchData();});


    };

    return{
        init:function(){
            handleButtonEvent();
        },
        searchData:function(){
            searchData();
        }
    };

}();
