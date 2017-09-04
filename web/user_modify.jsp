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
<html>

<head>
    <meta charset="utf-8">
    <title>车辆管理信息系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Le styles -->



    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/loader-style.css">
    <link rel="stylesheet" href="assets/css/bootstrap.css">

    <link rel="stylesheet" type="text/css" href="assets/js/progress-bar/number-pb.css">
    <link href="assets/js/footable/css/footable.core.css?v=2-0-1" rel="stylesheet" type="text/css">
    <link href="assets/js/footable/css/footable.standalone.css" rel="stylesheet" type="text/css">
    <link href="assets/js/footable/css/footable-demos.css" rel="stylesheet" type="text/css">

    <link rel="stylesheet" href="assets/js/dataTable/lib/jquery.dataTables/css/DT_bootstrap.css">
    <link rel="stylesheet" href="assets/js/dataTable/css/datatables.responsive.css">

    <style type="text/css">
    canvas#canvas4 {
        position: relative;
        top: 20px;
    }
    </style>


    <link rel="shortcut icon" href="assets/ico/minus.png">
</head>

<body > 
	
    <!-- Preloader -->
    <div id="preloader">
        <div id="status">&nbsp;</div>
    </div>
    <!-- TOP NAVBAR -->
    <nav role="navigation" class="navbar navbar-static-top">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button data-target="#bs-example-navbar-collapse-1" data-toggle="collapse" class="navbar-toggle" type="button">
                    <span class="entypo-menu"></span>
                </button>
                <button class="navbar-toggle toggle-menu-mobile toggle-left" type="button">
                    <span class="entypo-list-add"></span>
                </button>




                <div id="logo-mobile" class="visible-xs">
                   <h1>车辆管理系统&nbsp<span>刘佳鑫 陈孜雯 邱浩</span></h1>
                </div>

            </div>


            <!-- Collect the nav links, forms, and other content for toggling -->
            <div id="bs-example-navbar-collapse-1" class="collapse navbar-collapse">
                <ul class="nav navbar-nav">

                    <li class="dropdown">

                        <a data-toggle="dropdown" class="dropdown-toggle" href="#"><i style="font-size:20px;" class="icon-conversation"></i><div class="noft-red"></div></a>
                    </li>
                    <li>

                        <a data-toggle="dropdown" class="dropdown-toggle" href="#"><i style="font-size:19px;" class="icon-warning tooltitle"></i><div class="noft-green"></div></a>
                    </li>
                    <li><a href="#"><i data-toggle="tooltip" data-placement="bottom" title="Help" style="font-size:20px;" class="icon-help tooltitle"></i></a>
                    </li>

                </ul>

                <ul style="margin-right:0;" class="nav navbar-nav navbar-right">
                      <li>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            你好，邱浩<b class="caret"></b>
                        </a>
                        <ul style="margin-top:14px;" role="menu" class="dropdown-setting dropdown-menu">
                            <li>
                                <a href="#">
                                    <span class="entypo-user"></span>&#160;&#160;我的帐号</a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="entypo-vcard"></span>&#160;&#160;帐号设置</a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="entypo-lifebuoy"></span>&#160;&#160;帮助</a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="#">
                                    <span class="entypo-basket"></span>&#160;&#160; 注销</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="icon-gear"></span>&#160;&#160;设置</a>
                        <ul role="menu" class="dropdown-setting dropdown-menu">

                            <li class="theme-bg">
                                <div id="button-bg"></div>
                                <div id="button-bg2"></div>
                                <div id="button-bg3"></div>
                                <div id="button-bg5"></div>
                                <div id="button-bg6"></div>
                                <div id="button-bg7"></div>
                                <div id="button-bg8"></div>
                                <div id="button-bg9"></div>
                                <div id="button-bg10"></div>
                                <div id="button-bg11"></div>
                                <div id="button-bg12"></div>
                                <div id="button-bg13"></div>
                            </li>
                        </ul>
                    </li>
                    <li class="hidden-xs">
                        <a class="toggle-left" href="#">
                            <span style="font-size:20px;" class="entypo-list-add"></span>
                        </a>
                    </li>
                </ul>

            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

    <!-- /END OF TOP NAVBAR -->

    <!-- SIDE MENU -->
    <div id="skin-select">
        <div id="logo">
         <h1>车辆管理系统<span> 刘佳鑫 陈孜雯 邱浩</span></h1>
        </div>

        <a id="toggle">
            <span class="entypo-menu"></span>
        </a>
        <div class="dark">
            <form action="#">
                <span>
                    <input type="text" name="search" value="" class="search rounded id_search" placeholder="搜索菜单..." autofocus="">
                </span>
            </form>
        </div>

        <div class="search-hover">
            <form id="demo-2">
                <input type="search" placeholder="搜索菜单..." class="id_search">
            </form>
        </div>




        <div class="skin-part">
            <div id="tree-wrap">
                <div class="side-bar">
                    <ul class="topnav menu-left-nest">
                        <li>
                            <a href="#" style="border-left:0px solid!important;" class="title-menu-left">

                                <span class="widget-menu"></span>
                                <i data-toggle="tooltip" class="entypo-cog pull-right config-wrap"></i>

                            </a>
                        </li>

                        <li>
                            <a class="tooltip-tip ajax-load" href="#" title="个人信息">
                                <i class="icon-document-edit"></i>
                                <span>个人信息</span>

                            </a>
<!--                             <ul>
                                <li>
                                    <a class="tooltip-tip2 ajax-load" href="blog-list.html" title="Blog List"><i class="entypo-doc-text"></i><span>Blog List</span></a>
                                </li>
                                <li>
                                    <a class="tooltip-tip2 ajax-load" href="blog-detail.html" title="Blog Detail"><i class="entypo-newspaper"></i><span>Blog Details</span></a>
                                </li>
                            </ul> -->
                        </li>
                        <li>
                            <a class="tooltip-tip ajax-load" href="device.jsp" title="设备信息">
                                <i class="icon-feed"></i>
                                <span>设备信息</span>

                            </a>
                        </li>
                        <li>
                            <a class="tooltip-tip ajax-load" href="" title="车辆信息">
                                <i class="icon-camera"></i>
                                <span>车辆信息</span>

                            </a>
                        </li>
                    </ul>

                    <ul class="topnav menu-left-nest">
                        <li>
                            <a href="#" style="border-left:0px solid!important;" class="title-menu-left">

                                <span class="design-kit"></span>
                                <i data-toggle="tooltip" class="entypo-cog pull-right config-wrap"></i>

                            </a>
                        </li>

                        <li>
                            <a class="tooltip-tip ajax-load" href="" title="信息统计">
                                <i class="icon-window"></i>
                                <span>信息统计</span>

                            </a>
                        </li>
                        <li>
                            <a class="tooltip-tip ajax-load" href="" title="消息通知">
                                <i class="icon-mail"></i>
                                <span>消息通知</span>
                                <div class="noft-blue"></div>
                            </a>
                        </li>

                        <li>
                            <a class="tooltip-tip ajax-load" href="" title="区域管理">
                                <i class="icon-preview"></i>
                                <span>区域管理</span>
                                <div class="noft-blue" style="display: inline-block; float: none;"></div>
                            </a>
                        </li>

                        <li>
                            <a class="tooltip-tip" href="#" title="其他页面">
                                <i class="icon-document-new"></i>
                                <span>其他页面</span>
                            </a>
                            <!--这里以后可以设置链接其他页面，留一个范例
							<ul>
                                <li>
                                    <a class="tooltip-tip2 ajax-load" href="blank_page.html" title="Blank Page"><i class="icon-media-record"></i><span>Blank Page</span></a>
                                </li>
                            </ul> -->
                        </li>

                        <li>
                            <a class="tooltip-tip " href="" title="注册登录">
                                <i class="icon-download"></i>
                                <span>注册登录</span>
                            </a>
                        </li>

                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- END OF SIDE MENU -->



    <!--  PAPER WRAP -->
    <div class="wrap-fluid">
        <div class="container-fluid paper-wrap bevel tlbr">





            <!-- CONTENT -->
            <!--TITLE -->
            <div class="row">
                <div id="paper-top">
                    <div class="col-lg-3">
                        <h2 class="tittle-content-header">
                            <i class="icon-window"></i> 
                            <span>开始区域
                            </span>
                        </h2>

                    </div>

                    <div class="col-lg-7">
                        <div class="devider-vertical visible-lg"></div>
                        <div class="tittle-middle-header">

                            <div class="alert">
                                <button type="button" class="close" data-dismiss="alert">×</button>
                                <span class="tittle-alert entypo-info-circled"></span>
                                欢迎回来,&nbsp;
                                <strong>邱浩!</strong>&nbsp;&nbsp;你上次登录： Yesterday, 16:54 PM
                            </div>


                        </div>

                    </div>
                </div>
            </div>
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

                                <p class="lead well">用户可以在这个页面，修改用户信息</p>
<!-- BEGIN PAGE CONTENT-->
					<!-- ----------------------------------------页面开始，替换这里即可---------------------------------------- -->
<!-- 查询数据库 -->								
<%
			
			String mid = request.getParameter("id");
			//out.println(id);
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException classnotfoundexception) {
				classnotfoundexception.printStackTrace();
			}
			try {
				Connection conn = DriverManager
						.getConnection("jdbc:mysql://localhost:3306/test?user=ylx&password=ylx&useUnicode=true&characterEncoding=UTF-8");
				Statement statement = conn.createStatement();
				//out.println("Connect Database Ok！！！");
				ResultSet rs = statement
						.executeQuery("select * from user_file where id='" + mid+"'");
						
			//	out.println("1");
           //     System.out.print(id);
				while (rs.next()) {
		%>					
					<div class="row">
						<div class="col-md-12">
							<div class="portlet box blue ">
								<div class="portlet-title">
									<div class="caption">
										<i class="fa fa-gift"></i>修改用户信息
									</div>
									<div class="tools">
										<a href="" class="reload"> </a>
										<a href="" class="remove"> </a>
									</div>
								</div>
								
								
								
								
								
								
								<div class="portlet-body form">

									<form class="form-horizontal" role="form" id="page_form" name="page_form" action="user_modify_ok.jsp">
										<input type="hidden" id="action" name="action" value="add_record"/>
										<div class="form-body">
											
											<div class="form-group">
											<input type="hidden" name="id" value="<%=mid%>">
												<label class="col-md-3 control-label">用户ID（必填）<font color="red">*</font></label>
												<div class="col-md-9">
													<input type="text" id="user_id" name="user_id" class="form-control" value="<%=rs.getString("user_id")%>"/>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">姓名</label>
												<div class="col-md-9">
													<input type="text" id="user_name" name="user_name" class="form-control" value="<%=rs.getString("user_name")%>"/>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">性别</label>
												<div class="col-md-9">
													<input type="text" id="user_gender" name="user_gender" class="form-control" value="<%=rs.getString("user_gender")%>"/>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">密码</label>
												<div class="col-md-9">
													<input type="text" id="user_password" name="user_password" class="form-control" value="<%=rs.getString("user_password")%>"/>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">注册时间</label>
												<div class="col-md-9">
													<input type="text" id="add_time" name="add_time" class="form-control" value="<%=rs.getString("add_time")%>"/>
												</div>
											</div>
											
										</div>

										<div class="form-actions right1">
										    <button type="submit"  class="btn green" onclick="Record.modifyRecord(<%=mid%>);">
												提交修改
											</button>
											
											
											<button type="button" id="return_button" class="btn green"onclick="window.location='user.jsp'">
												返回
											</button>
											<button type="button" id="help_button" class="btn green" title="在线帮助">
												<i class="fa fa-question"></i>
											</button>
										</div>
									</form>
									
								</div>
							</div>
						</div>
					</div>
					<%
			}
				//out.println("<br>");
				statement.close();
				conn.close();
				//out.println("Database Closed！！！");
			} catch (SQLException sqlexception) {
				sqlexception.printStackTrace();
			}
		%>
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
		

			<!-- 下面这个div块必须要，不然部件会失控。。我也不知道为什么……神奇-->
            <div class="content-wrap">
                                <div id="placeholder" style="width:1%;height:1px;"></div>
                <!-- /END OF CONTENT -->



                <!-- FOOTER -->
                <div class="footer-space"></div>
                <div id="footer">
                    <div class="devider-footer-left"></div>
                    <div class="time">
                        <p id="spanDate">
                        <p id="clock">
                    </div>
                    <div class="copyright"></div>
                      
                    <div class="devider-footer"></div>

                </div>
                <!-- / END OF FOOTER -->


            </div>
        </div>
    </div>
    <!--  END OF PAPER WRAP -->

    <!-- RIGHT SLIDER CONTENT -->
   


    <!-- END OF RIGHT SLIDER CONTENT-->
    <script src="user/js/jquery-1.8.3.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="user/js/Record_list.js"></script>
    
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
<script type="text/javascript">
    $(function() {
        $('.footable-res').footable();
    });
    </script>
    <script type="text/javascript">
    $(function() {
        $('#footable-res2').footable().bind('footable_filtering', function(e) {
            var selected = $('.filter-status').find(':selected').text();
            if (selected && selected.length > 0) {
                e.filter += (e.filter && e.filter.length > 0) ? ' ' + selected : selected;
                e.clear = !e.filter;
            }
        });

        $('.clear-filter').click(function(e) {
            e.preventDefault();
            $('.filter-status').val('');
            $('table.demo').trigger('footable_clear_filter');
        });

        $('.filter-status').change(function(e) {
            e.preventDefault();
            $('table.demo').trigger('footable_filter', {
                filter: $('#filter').val()
            });
        });

        $('.filter-api').click(function(e) {
            e.preventDefault();

            //get the footable filter object
            var footableFilter = $('table').data('footable-filter');

            alert('about to filter table by "tech"');
            //filter by 'tech'
            footableFilter.filter('tech');

            //clear the filter
            if (confirm('clear filter now?')) {
                footableFilter.clearFilter();
            }
        });
    });
    </script>
<div style="text-align:center;">
<p>仅供学习  研究与开发实践课程 于2017.3-2017.6 </p>
</div>
</body>
</html>
