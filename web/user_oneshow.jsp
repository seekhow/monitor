<%@page contentType="text/html; charset=UTF-8"
        import="java.sql.*,java.io.*"%>
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
<head>
    <%@ include file="frame_css.jsp" %>
    <script src="user/js/Record_list.js"></script>
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


        <!-- END OF BREADCRUMB -->

        <div class="content-wrap">
            <div class="row">
                    <div class="col-sm-12">
                        <div class="well profile">
                            <div class="col-sm-12">
                                <div class="col-xs-12 col-sm-4 ">

                                    <ul class="list-group">
                                        <li class="list-group-item text-left">
                                            <span class="entypo-user"></span>&nbsp;&nbsp;Profile</li>
                                        <li class="list-group-item text-center">
                                            <img src="assets/img/personimg.jpg" alt="" class="img-circle img-responsive img-profile">

                                        </li>
                                        <li class="list-group-item text-center">
                                            <span class="pull-left">
                                                <strong>Ratings</strong>
                                            </span>


                                            <div class="ratings">

                                                <a href="#">
                                                    <span class="fa fa-star"></span>
                                                </a>
                                                <a href="#">
                                                    <span class="fa fa-star"></span>
                                                </a>
                                                <a href="#">
                                                    <span class="fa fa-star"></span>
                                                </a>
                                                <a href="#">
                                                    <span class="fa fa-star"></span>
                                                </a>
                                                <a href="#">
                                                    <span class="fa fa-star-o"></span>
                                                </a>

                                            </div>


                                        </li>

                                        <li class="list-group-item text-right">
                                            <span class="pull-left">
                                                <strong>Joined</strong>
                                            </span>2.13.2014</li>
                                        <li class="list-group-item text-right">
                                            <span class="pull-left">
                                                <strong>Last seen</strong>
                                            </span>Yesterday</li>
                                    </ul>

                                </div>
                                <div class="col-xs-12 col-sm-8 profile-name">
                                    <h2>基本信息
                                        <span class="pull-right social-profile">
                                            <i class="entypo-facebook-circled"></i>  <i
                                                class="entypo-twitter-circled"></i>  <i class="entypo-linkedin-circled"></i>  <i
                                                class="entypo-github-circled"></i>  <i class="entypo-gplus-circled"></i>
                                        </span>

                                    </h2>
                                    <hr>
                                    <dl id = "oneuser" class="dl-horizontal-profile" title="<%=userId%>">
                                    </dl>

                                </div>
                            </div>
                        </div>
                    </div>

                    </div>


                </div>

            </div>
        </div>
            <%@ include file="frame_specialone.jsp" %>

    </div>
</div>
<!--  END OF PAPER WRAP -->

<!-- RIGHT SLIDER CONTENT -->



<!-- END OF RIGHT SLIDER CONTENT-->
<script src="user/js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script type="text/javascript" src="user/js/oneuser_show.js"></script>


<%@ include file="frame_bottom.jsp" %>
</body>
</html>