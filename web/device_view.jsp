<%--
  Created by IntelliJ IDEA.
  User: Emma
  Date: 2017/5/16
  Time: 23:47
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

                            <p class="lead well">用户可以在这个页面，查看设备的详细信息</p>
                            <!-- BEGIN PAGE CONTENT-->
                            <!-- ----------------------------------------页面开始，替换这里即可---------------------------------------- -->
                            <!-- 查询数据库 -->
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="portlet box blue ">
                                        <div class="portlet-title">
                                            <div class="caption">
                                                <i class="fa fa-gift"></i>设备信息
                                            </div>
                                            <div class="tools">
                                                <a href="" class="reload"> </a>
                                                <a href="" class="remove"> </a>
                                            </div>
                                        </div>
                                        <div class="portlet-body form">

                                            <form class="form-horizontal" role="form" id="page_form" name="page_form" action="device_modify_ok.jsp">
                                                <input type="hidden" id="action" name="action" value="add_record"/>
                                                <div class="form-body">

                                                    <div class="form-group">
                                                        <input type="hidden" id="inputId" name="inputId" value="">
                                                        <label class="col-md-3 control-label">设备ID（必填）<font color="red">*</font></label>
                                                        <div class="col-md-9">
                                                            <input type="text" readonly="readonly" id="device_id" name="device_id" class="form-control" value=" "/>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-md-3 control-label">车牌号</label>
                                                        <div class="col-md-9">
                                                            <input type="text" readonly="readonly"  id="device_name" name="device_name" class="form-control" value=" "/>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-md-3 control-label">车主</label>
                                                        <div class="col-md-9">
                                                            <input type="text" readonly="readonly"  id="device_host" name="device_host" class="form-control" value=" "/>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-md-3 control-label">使用状态</label>
                                                        <div class="col-md-9">
                                                            <input type="text" readonly="readonly"  id="device_status" name="device_status" class="form-control" value=" "/>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-md-3 control-label">备注</label>
                                                        <div class="col-md-9">
                                                            <input type="text" readonly="readonly"  id="content" name="content" class="form-control" value=" "/>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-md-3 control-label">经度</label>
                                                        <div class="col-md-9">
                                                            <input type="text" readonly="readonly"  id="longitude" name="content" class="form-control" value=" "/>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-md-3 control-label">纬度</label>
                                                        <div class="col-md-9">
                                                            <input type="text" readonly="readonly"  id="latitude" name="content" class="form-control" value=" "/>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="form-actions right1">
                                                    <button type="button" id="first_button" class="btn green" title="跳到首记录">
                                                        第一个
                                                    </button>
                                                    <button type="button" id="prev_button" class="btn green" title="跳到前一个记录">
                                                        前一个
                                                    </button>
                                                    <button type="button" id="next_button" class="btn green" title="跳到后一个记录">
                                                        后一个
                                                    </button>
                                                    <button type="button" id="last_button" class="btn green" title="跳到最后一条记录">
                                                        最后一个
                                                    </button>
                                                    <button type="button" id="return_button" class="btn green"onclick="window.location='device.jsp'">
                                                        返回
                                                    </button>
                                                    <button type="button" id="track_button" class="btn green" title="查看轨迹" onclick="Record.Gototrack()">
                                                        查看轨迹
                                                    </button>
                                                    <button type="button" id="locate_button" class="btn green" title="设备定位" onclick="Record.locate()">
                                                        设备定位
                                                    </button>
                                                   <!-- <button type="button" id="submit_button" class="btn green">
                                                        修改记录
                                                    </button>

                                                    <button type="button" id="help_button" class="btn green" title="在线帮助">
                                                        <i class="fa fa-question"></i>
                                                    </button>-->
                                                </div>
                                            </form>

                                        </div>
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
<script type="text/javascript" src="device/js/device_view.js"></script>

<%@ include file="frame_bottom.jsp" %>
</body>
</html>
