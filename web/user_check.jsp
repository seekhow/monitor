<%@page contentType="text/html; charset=UTF-8"
        import="java.sql.*,java.io.*"%>
<%  String mid = request.getParameter("id");
    String userId= (String)session.getAttribute("sessionID");
    String userrole=(String)session.getAttribute("sessionRole");
    String userpage = "user.jsp";
    if (userId==null){
        out.println("<script>alert('请先登陆');window.location.href='login.html'</script>");
        return;
    }else if (userrole.equals("Normal")) {
        out.println("<script>alert('权限不够，你不是管理员！');window.location.href='login.html'</script>");
        return;
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



                    <div class="col-sm-12" id="Footable" >



                        <!--startprint1-->
                        <!--打印内容开始-->
                        <div class="col-xs-12 col-sm-8 profile-name">
                            <h2>基本信息

                            </h2>
                            <hr>


                            <dl id = "oneuser" class="dl-horizontal-profile" title="<%=mid%>">




                            </dl>
                            <div class="col-sm-12">
                                <input type="button" value="上一个" onclick="Record.upcheck();
                                  " />
                                <input type="button" value="下一个" onclick="Record.downcheck();
                                  " />

                                <input type="button" value="返回用户主界面" id="print_button" onclick="window.location='user.jsp'"  />

                            </div>







                        </div>
                    </div>

                    <!--打印内容结束-->
                    <!--endprint1-->

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
<script src="user/js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script type="text/javascript" src="user/js/check_user.js"></script>

<%@ include file="frame_bottom.jsp" %>
</body>
</html>