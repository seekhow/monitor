<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
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
                <li><a href="#" title="Sample page 1">用户管理</a>
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
                                    用户管理</h6>
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

                                <p class="lead well">用户可以在这个页面，查询用户信息</p>
<!-- BEGIN PAGE CONTENT-->
					<!-- ----------------------------------------页面开始，替换这里即可---------------------------------------- -->
					<div class="row">
						<div class="col-md-12">
							<div class="portlet box blue ">
								<div class="portlet-title">
									<div class="caption">
										<i class="fa fa-gift"></i>查询用户
									</div>
									<div class="tools">
										<a href="" class="reload"> </a>
										<a href="" class="remove"> </a>
									</div>
								</div>
								<div class="portlet-body form">
									<form class="form-horizontal" role="form" id="page_form" name="page_form" >
										<!-- input type="hidden" id="action" name="action" value="add_record"/-->
										<div class="form-body">
											
											<div class="form-group">
												<label class="col-md-3 control-label">用户ID（必填）</label>
												<div class="col-md-9">
													<input type="text" id="user_id" name="user_id" class="form-control" placeholder="请填写用户ID" value=""/>
												</div>
											
											
										    </div>
                                        </div>
										<div class="form-actions right1">

		
											<input type="button" value="查询" onclick="Record.search();" />
                                            <input type="button" value="返回" onclick="window.location='<%=userpage%>'" />
                                        </div>
									</form>
								</div>
							</div>
							
							 <table class="table-striped footable-res footable metro-blue" data-page-size="6">
                                    <thead>
                                        <tr>
                                            <th>
                                                用户ID
                                            </th>
                                            <th>
                                                用户名
                                            </th>
                                            <th data-hide="phone,tablet">
                                                性别
                                            </th>
                                            <th>
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
    <script src="user/js/jquery-1.8.3.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="user/js/search_user.js"></script>

    <%@ include file="frame_bottom.jsp" %>
</body>
</html>
