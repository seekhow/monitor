jQuery(document).ready(function() {
        Record.init();
});
    var Record=function(){

        var _showdata=function(){
          $.post("show_userServletAction",function(data){
            var html="";

            var json=eval("("+data+")");
            var list=json.aaData;
            for(var i=0;i<list.length;i++){
            var userid=list[i][0];
            var username=list[i][1];
            var usergender=list[i][2];
           // var userstatus=list[i][3];
            var userpassword = list[i][3];
            var useraddtime=list[i][4];
            var id=list[i][5];
            html=html+"                 <tr>";
                html=html+"                       <td>"+userid+"</td>";
            html=html+"                         <td>"+username+"</a>";
                html=html+"                         </td>";
                html=html+"                         <td data-value=\"0\">"+usergender+"</td>";
                html=html+"                         </td>";
                html=html+"                         <td data-value=\"2\">"+userpassword+"</td>";
                html=html+"                         </td>";
                html=html+"                         <td data-value=\"2\">"+useraddtime+"</td>";
                html=html+"                         <td><a href=\"javascript:Record.modifyqueryRecord('"+id+"')\"><span>修改</span></a>&nbsp;<a href=\"javascript:Record.checkRecord('"+id+"')\"><span>详细</span></a>&nbsp;<a href=\"javascript:Record.deleteRecord('"+userid+"')\"><sapn>删除</sapn></a></td>";
                html=html+"               </tr>";
            }
            document.getElementById("tbody").innerHTML=html;
          });
        }; 
        
        var deleteRecord=function(post_id){
            var flag=confirm("你是否确定删除这条记录？！");
            if(flag==true){
                window.self.location="delete_userServletAction?id="+post_id;
            }

        };

        // add
        var addRecord=function(){
            var userId=encodeURI(document.getElementById("user_id").value);
            var userName=encodeURI(document.getElementById("user_name").value);
            var userGender=encodeURI(document.getElementById("user_gender").value);
            var userPassword=encodeURI(document.getElementById("user_password").value);
            var addTime=get_time();

            //window.self.location="add_deviceServletAction?device_id="+deviceId+"&device_name="+deviceName+"&device_host="+deviceHost+"&device_status"+deviceStatus+"&content"+content;
           // alert("2222");
            var url1="add_userServletAction?user_id="+userId+"&user_name="+userName+"&user_gender="+userGender+"&user_password="+userPassword+"&add_time="+addTime;
            //alert(url1);
            $.post(url1,function(data){
                alert("添加成功！");
                window.self.location="user.jsp";
            });

        };

        //search
        var searchRecord=function () {
            var userId=document.getElementById("search").value;
            //alert(userId);
            var url="search_userServletAction?user_id="+userId;
            //  alert(url);
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
        var modifyRecord=function(mid){
            var Id = mid;//alert(Id);
            var userId=encodeURI(document.getElementById("user_id").value);
            var userName=encodeURI(document.getElementById("user_name").value);
            var userGender=encodeURI(document.getElementById("user_gender").value);
            var userPassword=encodeURI(document.getElementById("user_password").value);
            var addTime=encodeURI(document.getElementById("add_time").value);

            //window.self.location="add_deviceServletAction?device_id="+deviceId+"&device_name="+deviceName+"&device_host="+deviceHost+"&device_status"+deviceStatus+"&content"+content;
            //alert("2222");
            var url1="modify_userServletAction?id="+Id+"&user_id="+userId+"&user_name="+userName+"&user_gender="+userGender+"&user_password="+userPassword+"&add_time="+addTime;
           //alert(url1);
            $.post(url1,function(data){
            alert("添加成功！");
            window.self.location="user.jsp";
        });
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

        var modifyqueryRecord=function(modifyID){
            var url = "user_modify.jsp?id=" + modifyID;

            window.self.location=url;
        }
        var checkRecord=function(modifyID){
            var url = "user_check.jsp?id=" + modifyID;

            window.self.location=url;
        }

        var get_time=function() {
                var date = new Date();
                var seperator1 = "-";
                var seperator2 = ":";
                var month = date.getMonth() + 1;
                var strDate = date.getDate();
                if (month >= 1 && month <= 9) {
                    month = "0" + month;
                }
                if (strDate >= 0 && strDate <= 9) {
                    strDate = "0" + strDate;
                }
                var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
                    + " " + date.getHours() + seperator2 + date.getMinutes()
                    + seperator2 + date.getSeconds();
                return currentdate;
            }

        return{

            init:function(){
                _showdata();
            },
            deleteRecord:function(post_id){
                deleteRecord(post_id);
            },
            modifyqueryRecord:function(modifyID){
                modifyqueryRecord(modifyID);
            },
            get_time:function(){
                get_time();
            },
            checkRecord:function(modifyID){
                checkRecord(modifyID);
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
            }
        };

    }();
