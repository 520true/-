<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
	String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		
		<link href="<%=path %>/css/layout.css" type="text/css" rel="stylesheet" />
		
		<script type="text/javascript" src="<%=path %>/js/popup_shuaxin_no.js"></script>
	    
        <script type="text/javascript">
	        function yuding(kefangId,mendianId)
	        {
	            <c:if test="${sessionScope.user==null}">
	               alert("请先登录");
	            </c:if>
	            <c:if test="${sessionScope.user !=null}">
	                var url="<%=path %>/qiantai/kefang/yuding.jsp?kefangId="+kefangId+"&mendianId="+mendianId;
		            var pop=new Popup({ contentType:1,isReloadOnClose:false,width:450,height:300});
		            pop.setContent("contentUrl",url);
		            pop.setContent("title","预订客房");
		            pop.build();
		            pop.show();
	            </c:if>
	        } 
	    </script>
	</head>

	<body>
		<jsp:include flush="true" page="/qiantai/inc/incTop.jsp"></jsp:include>
		<div class="page_row">
			<div class="page_main_msg left">
			    <div class="left_row">
		              <div class="list pic_news">
		  	                <div class="list_bar">&nbsp;客房信息</div>
						  	<table width="99%" border="0" cellpadding="5" cellspacing="5" bgcolor="#FFFFFF" align="center" style="margin-top:8px">
					              <tr align="center" bgcolor="#FAFAF1" height="22">
					                    <td width="5%">序号</td>
										<td width="10%">客房类型</td>
										<td width="10%">房间编号</td>
										<td width="10%">房间面积</td>
										<td width="10%">房间费(一天)</td>
										<td width="10%">状态</td>
										<td width="14%">操作</td>
					              </tr>
								  <s:iterator value="#request.kefangList" id="kefang" status="ss">
								  <tr align='center' bgcolor="#FFFFFF" height="22">
									    <td bgcolor="#FFFFFF" align="center">
											<s:property value="#ss.index+1"/>
										</td>
										<td bgcolor="#FFFFFF" align="center">
											<s:property value="#kefang.kefangleixing"/>
										</td>
										<td bgcolor="#FFFFFF" align="center">
										    <s:property value="#kefang.fangjianhao"/>
										</td>
										<td bgcolor="#FFFFFF" align="center">
											<s:property value="#kefang.area"/>
										</td>
										<td bgcolor="#FFFFFF" align="center">
											<s:property value="#kefang.qianshu"/>
										</td>
										<td bgcolor="#FFFFFF" align="center">
											<s:property value="#kefang.zhuangtai"/>
										</td>
									    <td>
									        <s:if test="#kefang.zhuangtai=='空闲'">
									            <a style="color: red" href="#" onclick="yuding(${requestScope.kefang.id},${requestScope.kefang.mendianId})">预订</a>
									        </s:if>
									        <s:if test="#kefang.zhuangtai=='已预订'">
									              已预订
									        </s:if>
									        <s:if test="#kefang.zhuangtai=='已入住'">
									              已入住
									        </s:if>
									        <a style="color: red" href="<%=path %>/kefangDetailQian.action?id=<s:property value="#kefang.id"/>"> 
									              详细信息
									        </a>
									    </td>
								  </tr>
								  </s:iterator>
		        			</table>
		              </div>
				      <div style="clear:both;"></div>
			     </div>
			</div>
			
			<!-- 右边的用户登录。留言。投票 -->
			<div class="page_other_msg right">
				<div class="left_row">
					<div class="list">
						<div class="list_bar">用户登录</div>
						<div class="list_content">
							<div id="div">
								<jsp:include flush="true" page="/qiantai/userlogin/userlogin.jsp"></jsp:include>
							</div>
						</div>
					</div>
				</div>
				<div class="left_row">
				    <div class="list">
				        <div class="list_bar">网站公告</div>
				        <div class="list_content">
				            <div id="div"> 
								<s:action name="gonggaoQian5" executeResult="true" flush="true"></s:action>
					        </div>
					    </div>
				    </div>
				</div>
				<div class="left_row">
				    <div class="list">
				        <div class="list_bar">网站日历表</div>
				        <div class="list_content">
				            <jsp:include flush="true" page="/qiantai/rili/rili.jsp"></jsp:include>
					    </div>
				    </div>
			    </div>
			</div>
			<!-- 右边的用户登录。留言。投票 -->
		</div>
		
		<div class="foot">
		   <jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include>
	    </div>
	</body>
</html>
