<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
        %>
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

<body> 

	<script src="map/js/jquery-1.8.3.min.js" type="text/javascript"></script>
	<script src="map/js/map_view.js" type="text/javascript"></script>
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


            <div id="paper-middle">
                <div id="allmap" style="width:100%;height:100%;"></div>
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
