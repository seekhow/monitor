<%@page contentType="text/html; charset=UTF-8"
        import="java.sql.*,java.io.*"%>
<%
    String userId= (String)session.getAttribute("sessionID");
    String userrole=(String)session.getAttribute("sessionRole");
    if (userId==null){
        out.println("<script>alert('请先登陆');window.location.href='login.html'</script>");
        return;
    }
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
            设备ID
        </th>
        <th>
            车牌号
        </th>
        <!--                                             <th data-hide="phone,tablet">
                                                        起用时间
                                                    </th> -->
        <th data-hide="phone,tablet">
            车主
        </th>
        <th data-hide="phone">
            使用状态
        </th>
        <th>
            备注
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


<!-- END OF RIGHT SLIDER CONTENT-->
<script src="device/js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script type="text/javascript" src="device/js/echarts.js"></script>

<script type="text/javascript" src="device/js/jquery-3.1.1.js" charset="UTF-8"></script>
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
<script type="text/javascript" src="device/js/device_export.js"></script>
</body>
</html>