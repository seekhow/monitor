<%--
  Created by IntelliJ IDEA.
  User: Emma
  Date: 2017/5/15
  Time: 21:34
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: Emma
  Date: 2017/5/15
  Time: 21:33
  To change this template use File | Settings | File Templates.
--%>
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

                    <input style="border-radius:15px" type="text"
                           placeholder="搜索..." class="form-control">
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
                                <a class="nav-toggle-alt"
                                   href="#Footable">
                                    <span class="entypo-up-open"></span>
                                </a>
                            </div>

                        </div>

                        <div class="body-nest" id="Footable" >

                            <p class="lead well">用户可以在这个页面，添
                                加设备信息</p>
                            <!-- BEGIN PAGE CONTENT-->
                            <!--
        ----------------------------------------页面开始，替换这里即
        可---------------------------------------- -->
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="portlet
box blue ">
                                        <div
                                                class="portlet-title">
                                            <div
                                                    class="caption">

                                                <i class="fa fa-gift"></i>添加设备

                                            </div>
                                            <div
                                                    class="tools">

                                                <a href="" class="reload"> </a>

                                                <a href="" class="remove"> </a>

                                            </div>
                                        </div>
                                        <div
                                                class="portlet-body form">

                                            <form class="form-horizontal" role="form" id="page_form" name="page_form"
                                                  action="device_add_ok.jsp">

                                                <input type="hidden" id="action" name="action" value="add_record"/>

                                                <div class="form-body">



                                                    <div class="form-group">

                                                        <label class="col-md-3 control-label">设备ID（必填）<font
                                                                color="red">*</font></label>

                                                        <div class="col-md-9">

                                                            <input type="text" id="device_id" name="device_id"
                                                                   class="form-control" placeholder="请填写设备ID" value=""/>

                                                        </div>

                                                    </div>

                                                    <div class="form-group">

                                                        <label class="col-md-3 control-label">车牌号</label>

                                                        <div class="col-md-9">

                                                            <input type="text" id="device_name"
                                                                   name="device_name" class="form-control" placeholder="请填写车牌号"
                                                                   value=""/>

                                                        </div>

                                                    </div>

                                                    <div class="form-group">

                                                        <label class="col-md-3 control-label">车主</label>

                                                        <div class="col-md-9">

                                                            <input type="text" id="device_host"
                                                                   name="device_host" class="form-control" placeholder="请输入车主" value=""/>

                                                        </div>

                                                    </div>

                                                    <div class="form-group">

                                                        <label class="col-md-3 control-label">使用状态</label>

                                                        <div class="col-md-9">

                                                            <input type="text" id="device_status"
                                                                   name="device_status" class="form-control" placeholder="请输入使用状态"
                                                                   value=""/>

                                                        </div>

                                                    </div>

                                                    <div class="form-group">

                                                        <label class="col-md-3 control-label">备注</label>

                                                        <div class="col-md-9">

                                                            <input type="text" id="content" name="content"
                                                                   class="form-control" placeholder="备注" value=""/>

                                                        </div>

                                                    </div>



                                                </div>

                                                <div class="form-actions right1">

                                                    <button type="submit" id="add_button" class="btn green"
                                                            onclck="addRecord();">

                                                        提交添加

                                                    </button>

                                                    <%--<button type="button" id="search_button" class="btn green">--%>

                                                    <%--查询记录--%>

                                                    <%--</button>--%>

                                                    <%--<button type="button" id="submit_button" class="btn green">--%>

                                                    <%--添加记录--%>

                                                    <%--</button>--%>



                                                    <button type="button" id="return_button" class="btn green" onclick="window.location='device.jsp'">

                                                        返回

                                                    </button>

                                                    <button type="button" id="help_button" class="btn green" title="在线
帮助">

                                                        <i class="fa fa-question"></i>

                                                    </button>

                                                </div>

                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--
        ----------------------------------------页面结束，替换上面即
        可---------------------------------------- -->
                            <!-- END PAGE CONTENT-->





                        </div>
                        <!-- <div class="col-sm-12">
                            <input type="button" value="添加设备"
onclick="window.location='add_device.html'
                              " />
                            <input type="button" value="查询设备"
onclick="window.location='query_device.html'
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
<script type="text/javascript" src="device/js/Record_list.js"></script>

<%@ include file="frame_bottom.jsp" %>
</body>
</html>
