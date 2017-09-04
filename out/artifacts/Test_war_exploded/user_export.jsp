<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" import="java.sql.*,java.io.*"%>
<%
    String userId= (String)session.getAttribute("sessionID");
    String userrole=(String)session.getAttribute("sessionRole");
    if (userId==null){
        out.println("<script>alert('请先登陆');window.location.href='login.html'</script>");
        return;
    }else if (userrole.equals("Normal")) {
        out.println("<script>alert('权限不够，你不是管理员！');window.location.href='login.html'</script>");
        return;
    }
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        table, tr, td {
            border: 1px black solid;
        }
    </style>
</head>
<body>
<a download="somedata.xls" href="#" onclick="return ExcellentExport.excel(this, 'data-table', 'Sheet Name Here');">Export to Excel</a>
<br/>

<table class="table-striped footable-res footable metro-blue" data-page-size="6" id="data-table">
    <thead>
    <tr>
        <th>
            用户ID
        </th>
        <th>
            姓名
        </th>
        <!--                                             <th data-hide="phone,tablet">
                                                        起用时间
                                                    </th> -->
        <th data-hide="phone,tablet">
            性别
        </th>
        <th data-hide="phone">
            密码
        </th>
        <th>
            注册时间
        </th>

    </tr>
    </thead >
    <tbody id="tbody">

    </tbody>
    <tfoot>
    <tr>
        <td colspan="6">
            <div class="pagination pagination-centered"></div>
        </td>
    </tr>
    </tfoot>
</table>
<script type="text/javascript" src="user/js/user_export.js"></script>
<script src="user/js/excellentexport.min.js"></script>

<!-- END OF RIGHT SLIDER CONTENT-->
<script src="user/js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script type="text/javascript" src="user/js/echarts.js"></script>
<script type="text/javascript" src="user/js/device_chart.js"></script>
<script type="text/javascript" src="user/js/jquery-3.1.1.js" charset="UTF-8"></script>
<script type="text/javascript" src="assets/js/jquery.js"></script>
<script src="assets/js/progress-bar/src/jquery.velocity.min.js"></script>
<script src="assets/js/progress-bar/number-pb.js"></script>
<script src="assets/js/progress-bar/progress-app.js"></script>



<!-- MAIN EFFECT -->
<script type="text/javascript" src="assets/js/preloader.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.js"></script>
<script type="text/javascript" src="assets/js/app.js"></script>
<script type="text/javascript" src="assets/js/load.js"></script>
<script type="text/javascript" src="assets/js/main.js"></script>




<!-- GAGE -->

<script type="text/javascript" src="assets/js/toggle_close.js"></script>
<script src="assets/js/footable/js/footable.js?v=2-0-1" type="text/javascript"></script>
<script src="assets/js/footable/js/footable.sort.js?v=2-0-1" type="text/javascript"></script>
<script src="assets/js/footable/js/footable.filter.js?v=2-0-1" type="text/javascript"></script>
<script src="assets/js/footable/js/footable.paginate.js?v=2-0-1" type="text/javascript"></script>
<script src="assets/js/footable/js/footable.paginate.js?v=2-0-1" type="text/javascript"></script>
<!--下面这个我也不懂是什么，但是得留着-->
<script type="text/javascript" src="user/js/user_export.js"></script>
</body>
</html>