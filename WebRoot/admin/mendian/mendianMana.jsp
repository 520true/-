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
		
		<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
		
        <script language="javascript">
           function mendianAdd()
           {
              var url="<%=path %>/admin/mendian/mendianAdd.jsp";
              window.location.href=url;
           }
           
           function mendianDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/mendianDel.action?id="+id;
               }
           }
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="14" background="<%=path %>/img/tbg.gif">&nbsp;门店信息管理&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="4%">序号</td>
					<td width="6%">所在省市</td>
					<td width="6%">所在城市</td>
					<td width="12%">名称</td>
					
					<td width="17%">地址</td>
					<td width="10%">电话</td>
					<td width="6%">负责人姓名</td>
					<td width="6%">负责人账号</td>
					
					<td width="6%">负责人密码</td>
					<td width="6%">操作</td>
		        </tr>	
				<s:iterator value="#request.mendianList" id="mendian" status="ss">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						 <s:property value="#ss.index+1"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						 <s:property value="#mendian.sheng"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <s:property value="#mendian.shi"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#mendian.mingcheng"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#mendian.dizhi"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#mendian.dianhua"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#mendian.xingming"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#mendian.loginname"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#mendian.loginpw"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<a class="pn-loperator" href="#" onclick="mendianDel(<s:property value="#mendian.id"/>)">删除</a>
					</td>
				</tr>
				</s:iterator>
			</table>
			
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 5px;">
			  <tr>
			    <td>
			      <input type="button" value="添加门店" style="width: 80px;" onclick="mendianAdd()" />
			    </td>
			  </tr>
		    </table>
	</body>
</html>
