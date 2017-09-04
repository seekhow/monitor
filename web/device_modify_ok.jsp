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

                                <p class="lead well">用户可以在这个页面，添加设备信息</p>
<!-- BEGIN PAGE CONTENT-->
					<!-- ----------------------------------------页面开始，替换这里即可---------------------------------------- -->
					<div class="row">
						<div class="col-md-12">
							<div class="portlet box blue ">
								<div class="portlet-title">
									<div class="caption">
										<i class="fa fa-gift"></i>添加设备
									</div>
									<div class="tools">
										<a href="" class="reload"> </a>
										<a href="" class="remove"> </a>
									</div>
								</div>
<%          String id = request.getParameter("id");
			String deviceId = request.getParameter("device_id");
			String deviceName = request.getParameter("device_name");
            String deviceHost = request.getParameter("device_host");
			String deviceStatus = request.getParameter("device_status");
			String content = request.getParameter("content");
			request.setCharacterEncoding("UTF-8");
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException classnotfoundexception) {
				classnotfoundexception.printStackTrace();
			}
			try {
				Connection conn = DriverManager
						.getConnection("jdbc:mysql://localhost:3306/test?user=ylx&password=ylx&useUnicode=true&characterEncoding=UTF-8");
				Statement statement = conn.createStatement();
				//out.println("Connect Database Ok！！！<br>");
				String sql = "update device_file set device_id='" + deviceId+ "',device_name='" + deviceName + "',device_host='" + deviceHost + "',device_status='" + deviceStatus + "' ,content='" + content + "'where id=" + id;
				statement.executeUpdate(sql);
				//out.println(sql);
				statement.close();
				conn.close();
				//out.println("Database Closed！！！<br>");
		%>
更改成功！请返回。
<input type="button" name="listBtn" value="返回列表" onclick="window.location='device.jsp'">
		<%
			} catch (SQLException sqlexception) {
				sqlexception.printStackTrace();
		%>
出现错误，请查看Console提示信息！请返回。
<input type="button" name="listBtn" value="返回列表" onclick="window.location='device.jsp'">
		<%
			}
		%>
							</div>
						</div>
					</div>
					<!-- ----------------------------------------页面结束，替换上面即可---------------------------------------- -->
					<!-- END PAGE CONTENT-->
                               
                               
                               
                               
                               
                            </div>
                            <!-- <div class="col-sm-12">
                                <input type="button" value="添加设备" onclick="window.location='add_device.html'
                                  " />
                                <input type="button" value="查询设备" onclick="window.location='query_device.html'
                                  " />
                            </div> -->
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
    <script type="text/javascript" src="device/js/record_list_add.js"></script>


    <%@ include file="frame_bottom.jsp" %>
</body>
</html>

