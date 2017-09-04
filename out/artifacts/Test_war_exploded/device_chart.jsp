<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
                                设备统计</h6>
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

                            <p class="lead well">用户可以在这个页面，设备本年度行车里程、耗油量、出车次数</p>
                            <!-- BEGIN PAGE CONTENT-->
                            <!-- ----------------------------------------页面开始，替换这里即可---------------------------------------- -->
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="portlet box blue ">
                                        <div id="main" style="width: 600px;height:400px;"></div>
                                    </div>
                                </div>
                            </div>

                            <!-- ----------------------------------------页面结束，替换上面即可---------------------------------------- -->
                            <!-- END PAGE CONTENT-->

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
<script type="text/javascript" src="device/js/echarts.js"></script>
<script type="text/javascript" src="device/js/device_chart.js"></script>
<script type="text/javascript" src="device/js/jquery-3.1.1.js" charset="UTF-8"></script>



<%@ include file="frame_bottom.jsp" %>
</body>
</html>
