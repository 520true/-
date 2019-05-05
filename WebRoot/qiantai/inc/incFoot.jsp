<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  </head>
  
  <body>
        <div class="foot_pic"></div>
		<div  class="left foot_msg">
			<a href="">关于我们 |</a>
			<a href="">联系我们 |</a>
			<a href="">诚聘英才 |</a>
			<a href="">友情链接 |</a>
			<a href="">合作服务 |</a>
			<a href="">许可协议 |</a>
			<a href="">设为首页 |</a>
			<a href="">加入收藏 |</a>
			<a target="_blank" href="<%=path %>/login.jsp">管理登录</a>
			<br />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电话：440-12***9603   156****8530 &nbsp;&nbsp;&nbsp; 传真：519-8****5379
			<br />
		</div>
		<div style="clear: both"></div>
  </body>
</html>
