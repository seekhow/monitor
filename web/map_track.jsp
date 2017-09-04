<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
        %>
<!--<%
    String userId= (String)session.getAttribute("sessionID");
    String userrole=(String)session.getAttribute("sessionRole");
    String userpage = "user.jsp";
    if (userId==null){
        out.println("<script>alert('请先登陆');window.location.href='login.html'</script>");
        return;
    }else if (userrole.equals("Normal")) {
        userpage = "user_oneshow.jsp";
    }
%>-->
<!DOCTYPE html>
<html>

<head>
    <%@ include file="frame_css.jsp" %>
    <style type="text/css">

        #map_canvas{width:100%;height:500px;}
        #result {width:100%}
    </style>
</head>

<body>
    <script type="text/javascript" src="map/js/LuShu_min.js"></script>
	<script src="map/js/jquery-1.8.3.min.js" type="text/javascript"></script>
	<script src="map/js/map_track.js" type="text/javascript"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=B7d71c582e960e8bc1eae517183b5f77"></script>

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
                <li><a href="#" title="Sample page 1">默认区域</a>
                </li>
                <li class="pull-right">
                    <div class="input-group input-widget">

                        <input style="border-radius:15px" type="text" placeholder="搜索..." class="form-control">
                    </div>
                </li>
            </ul>

            <!-- END OF BREADCRUMB -->


            <div id="paper-middle" class="form-group">

                <div class="col-md-9" id="map_panel_div">
                    时间：<input type="text" style="color:#429812;" id="gps_time_from" value="2015-09-20 15:39:00"/>到
                    <input type="text" style="color:#429812;" id="gps_time_to" value="2015-09-20 18:41:00"/>

                   <!-- <input type="text" class="" id="device_id" value="381215032027883"/>-->
                    <input type="button" class="" id="" value="查询" onclick="Map.addLine();"/>

                    <div id="result"></div>
                    <button id="run">开始</button>
                    <button id="stop">停止</button>
                    <button id="pause">暂停</button>
                    <button id="hide">隐藏信息窗口</button>
                    <button id="show">展示信息窗口</button>
                </div>
                <!--<div id="map_canvas"></div>-->
                <div id="allmap" style="width:100%;height:100%;"></div>
            </div>
            <div class="col-sm-12">

                <button type="button" id="return_button" title="返回设备管理界面" onclick="window.location='device.jsp'">点击返回设备管理界面</button>
            </div>
            <!--  DEVICE MANAGER -->
           
            <!--  / DEVICE MANAGER -->





            <%@ include file="frame_specialone.jsp" %>
        </div>
    </div>
    <!--  END OF PAPER WRAP -->

    <!-- RIGHT SLIDER CONTENT -->
   

    <!-- END OF RIGHT SLIDER CONTENT-->
    <%@ include file="frame_bottom.jsp" %>
</body>

</html>
