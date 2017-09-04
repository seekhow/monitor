<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<div id="skin-select">
  <div id="logo">
    <h1>车辆管理系统</h1>
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
            <a class="tooltip-tip ajax-load" href="<%=userpage%>" title="个人信息">
              <i class="icon-document-edit"></i>
              <span>个人信息</span>
            </a>
          </li>
          <li>
            <a class="tooltip-tip ajax-load" href="device.jsp" title="设备信息">
              <i class="icon-feed"></i>
              <span>设备信息</span>

            </a>
          </li>
          <li>
            <a class="tooltip-tip ajax-load" href="map.jsp"  title="地图信息">
              <i class="icon-camera"></i>
              <span>地图信息</span>
            </a>
            <%--<ul>--%>
              <%--<li>--%>
                <%--<a class="tooltip-tip2 ajax-load" title="地图概览"><i class="icon-media-record"></i><span>地图概览</span></a>--%>
              <%--</li>--%>
              <%--<li>--%>
                <%--<a class="tooltip-tip2 ajax-load" href="map_locate.jsp" title="设备定位"><i class="icon-media-record"></i><span>设备定位</span></a>--%>
              <%--</li>--%>
            <%--</ul>--%>
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
              <span>地图统计</span>

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
            <a class="tooltip-tip ajax-load" href="map_area.jsp" title="区域管理">
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