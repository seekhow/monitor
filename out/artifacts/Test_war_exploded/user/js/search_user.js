jQuery(document).ready(function() {
        Record.init();
});
    var Record=function(){

        var search=function(){
            var userId=document.getElementById("user_id").value;

            var url="search_userServletAction?user_id="+userId;
             // alert(url);
            $.post(url,function (data) {
                //  alert(data);
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
                    html=html+"                       <td>"+deviceid+"</td>";
                    html=html+"                         <td>"+devicename+"</a>";
                    html=html+"                         </td>";
                    html=html+"                         <td data-value=\"0\">"+devicehost+"</td>";
                    html=html+"                         <td data-value=\"0\">"+devicestatus+"</td>";
                    //  if(devicestatus==1){
                    //      html=html+"                         <td data-value=\"1\">";
                    //      html=html+"                              <span class=\"status-metro status-active\" title=\"Active\">正常</span>";
                    //  }
                    //  else{
                    ////       html=html+"                         <td data-value=\"3\">";
                    //       html=html+"                              <span class=\"status-metro status-suspended\" title=\"Suspended\">异常</span>";
                    //   }
                    html=html+"                         </td>";
                    html=html+"                         <td data-value=\"2\">"+devicecontent+"</td>";
                    //  html=html+"                         <td><a href=\"javascript:Record.modifyRecord('"+id+"')\"><span>修改</span></a>&nbsp;<a href=\"javascript:Record.deleteRecord('"+deviceid+"')\"><sapn>删除</sapn></a></td>";
                    html=html+"               </tr>";
                }
                document.getElementById("tbody").innerHTML=html;
                alert("finish");
            });
        }; 
        
        var deleteRecord=function(post_id){
            var flag=confirm("你是否确定删除这条记录？！");
            if(flag==true){
                window.location="user_delete.jsp?id="+post_id;
            }

        };
       
        var modifyRecord=function(mid){
        	    window.location="user_modify.jsp?id="+mid;
        };
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
    		//$('#return_button').click(function() {Page.confirmBack();});
    		//$('#search_button').click(function() {Page.searchRecord();});
    		$('#delete_button').click(function() {Page.deleteRecord();});
    		$('#add_button').click(function() {Page.addRecord();});
    		$('#submit_button').click(function() {Page.submitRecord();});
    		//$('#tools_menu_reload').click(function() {Page.reload();});
    		//$('#help_button').click(function() {Page.help();});
    		//$('#export_button').click(function() {Page.exportRecord();});
    		$('#print_button').click(function() {Page.printRecord();});
    	};
    	

        return{
              init:function(){

              },
            deleteRecord:function(post_id){
                deleteRecord(post_id);
            },
            search:function(){
                search();
            },
            modifyRecord:function(mid){
                modifyRecord(mid);
              },
              printRecord:function(oper){
      			printRecord(oper);
      		}
        };

    }();
