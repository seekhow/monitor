jQuery(document).ready(function() {
    Record.init();
});
var Record=function(){

    var _showdata=function(){
        var userid =document.getElementById("oneuser").title;
        $.post("show_oneuserServletAction?user_id="+userid,function(data){
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
                html=html+"   <dt>用户Id</dt>              ";
                html=html+"       <dd>"+userid+"</dd>                ";
                html=html+"                         <dt>姓名</dt>";
                html=html+"                         <dd>"+username+"</dd>";
                html=html+"                         <dt>性别</dt>";
                html=html+"                         <dd>"+usergender+"</dd>";
                html=html+"                         <dt>密码</dt>";
                html=html+"                         <dd>"+userpassword+"</dd>";
                html=html+"                         <dt>注册时间</dt>";
                html=html+"               <dd>"+useraddtime+"</dd>";
            }
            document.getElementById("oneuser").innerHTML=html;
        });
    };



    // add


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
