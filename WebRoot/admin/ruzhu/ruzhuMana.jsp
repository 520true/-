<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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

		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		<script type="text/javascript" src="<%=path %>/js/popup_shuaxin.js"></script>
		
        <script language="javascript">
           function userDetail(userId)
           {
                var url="<%=path %>/userDetail.action?userId="+userId;
                var ret = window.showModalDialog(url,"","dialogWidth:800px; dialogHeight:300px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
           }
           
           function tuifangPre(id)
           {
               var url="<%=path %>/tuifangPre.action?id="+id;
               window.location.href=url;
           }
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="10" background="<%=path %>/img/tbg.gif">&nbsp;入住信息管理&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
				    <td width="4%">序号</td>
				    <td width="10%">会员信息</td>
					<td width="10%">入住房间</td>
					<td width="10%">登记姓名</td>
					<td width="10%">身份证号</td>
					<td width="10%">入住时间</td>
					<td width="10%">退房时间</td>
					<td width="5%">总费用</td>
					<td width="5%">退房操作</td>
		        </tr>	
				<s:iterator value="#request.ruzhuList" id="ruzhu" status="ss">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#ss.index+1"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<a style="color: red" href="#" onclick="userDetail(<s:property value="#ruzhu.userId"/>)">会员信息</a>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#ruzhu.kefang.fangjianhao"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#ruzhu.dengjixingming"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#ruzhu.shenfenzheng"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <s:property value="#ruzhu.ruzhushijian"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#ruzhu.tuifangshijian"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#ruzhu.zongfeiyong"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:if test="#ruzhu.tuifangshijian ==''">
						    <input type="button" value="退房" onclick="tuifangPre(<s:property value="#ruzhu.id"/>)"/>
						</s:if>
						<s:if test="#ruzhu.tuifangshijian !=''">
						    已退房
						</s:if>
					</td>
				</tr>
				</s:iterator>
			</table>
	</body>
</html>
