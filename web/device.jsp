<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String userId= (String)session.getAttribute("sessionID");
    String userrole=(String)session.getAttribute("sessionRole");
    String userpage = "user.jsp";
    if (userId==null){
        out.println("<script>alert('请先登陆');window.location.href='login.html'</script>");
        return;
    }else if (userrole.equals("Normal")) {
        userpage = "user_oneshow.jsp";
    }
%>
<!DOCTYPE html>
<html>

<head>
    <%@ include file="frame_css.jsp" %>
</head>

<body > 
	
    <!-- Preloader -->
    <%@ include file="frame_topmenu.jsp" %>

    <!-- /END OF TOP NAVBAR -->

    <!-- SIDE MENU -->
    <%@ include file="frame_sidemenu.jsp" %>
    <!-- END OF SIDE MENU -->

    <!--  PAPER WRAP -->
    <div class="wrap-fluid">
        <div class="container-fluid paper-wrap bevel tlbr">

            <!-- CONTENT -->
            <!--TITLE -->
            <%@ include file="frame_start.jsp" %>
            <!--/ TITLE -->

            <!-- BREADCRUMB -->
            <ul id="breadcrumb">
                <li>
                    <span class="entypo-home"></span>
                </li>
                <li><i class="fa fa-lg fa-angle-right"></i>
                </li>
                <li><a href="#" title="Sample page 1">开始</a>
                </li>
                <li><i class="fa fa-lg fa-angle-right"></i>
                </li>
                <li><a href="#" title="Sample page 1">设备管理</a>
                </li>
                <li class="pull-right">
                    <div class="input-group input-widget">

                        <input style="border-radius:15px" type="text" placeholder="搜索..." class="form-control">
                    </div>
                </li>
            </ul>

            <!-- END OF BREADCRUMB -->

			 <div class="content-wrap">
                <div class="row">


                    <div class="col-sm-12">

                        <div class="nest" id="FootableClose">
                            <div class="title-alt">
                                <h6>
                                    设备管理</h6>
                                <div class="titleClose">
                                    <a class="gone" href="#FootableClose">
                                        <span class="entypo-cancel"></span>
                                    </a>
                                </div>
                                <div class="titleToggle">
                                    <a class="nav-toggle-alt" href="#Footable">
                                        <span class="entypo-up-open"></span>
                                    </a>
                                </div>

                            </div>

                            <div class="body-nest" id="Footable" >

                                <p class="lead well">用户可以在这个页面对设备进行简洁明了的查看与管理
                                <br>普通用户只能看到注册在自己ID下的设备</p>
                                <!--startprint1-->
                                <!--打印内容开始-->
                                <table class="table-striped footable-res footable metro-blue" data-page-size="6">
                                    <thead>
                                        <tr>
                                            <th>
                                                设备ID
                                            </th>
                                            <th>
                                                车牌号
                                            </th>
                                            <th data-hide="phone,tablet">
                                                车主
                                            </th>
                                            <th data-hide="phone">
                                                使用状态
                                            </th>
                                            <th>
                                                备注
                                            </th>
                                             <th>
                                                操作
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
                                <!--打印内容结束-->
                                <!--endprint1-->
                            </div>
                            <div class="col-sm-12">
                                <input type="button" value="添加设备" onclick="window.location='device_add.jsp'" />
                                <input type="button" value="统计" onclick="window.location='device_chart.jsp'" />
                                <!-- 这个add还有modify这周要分开成js-->
                                <input type="button" value="查询设备" onclick="window.location='device_search.jsp'" />
                                <input type="button" value="打印" id="print_button" onclick="Record.printRecord(1);"  />

                                <!--<button type="button" id="print_button"  title="打印记录">打印</button>-->
                                <button type="button" id="export_button" title="导出 记录" onclick="window.location='device_export.jsp'">导出</button>
                            </div>
                        </div>


                    </div>

                </div>
            </div>

            <!--  DEVICE MANAGER -->
           
            <!--  / DEVICE MANAGER -->

            <%@ include file="frame_specialone.jsp" %>
        </div>
    </div>
    <!--  END OF PAPER WRAP -->

    <!-- RIGHT SLIDER CONTENT -->
   


    <!-- END OF RIGHT SLIDER CONTENT-->
    <script src="device/js/jquery-1.8.3.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="device/js/Record_list.js"></script>

    <%@ include file="frame_bottom.jsp" %>
</body>
</html>