<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
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
		
		<script language="javascript">
		    
        </script>
	</head>
	<body>
			<form action="<%=path %>/yudingAdd.action" name="form1" method="post">
				<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
					<tr>
						<td width="30%" height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							入住日期：
						</td>
						<td width="70%" bgcolor="#FFFFFF">
							&nbsp;
							<input type="text" name="ruzhushiian" value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date(new Date().getTime()+1*24*60*60*1000)) %>"/>
						</td>
					</tr>
					<tr>
						<td width="30%" height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							离店日期：
						</td>
						<td width="70%" bgcolor="#FFFFFF">
							&nbsp;
							<input type="text" name="lidianshiian" value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date(new Date().getTime()+2*24*60*60*1000)) %>"/>
						</td>
					</tr>
					<tr>
						<td width="30%" height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							联系方式：
						</td>
						<td width="70%" bgcolor="#FFFFFF">
							&nbsp;
							<input type="text" name="yudingzheTel"/>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9">
							&nbsp;
						</td>
						<td bgcolor="#FFFFFF">
							&nbsp;
							<input type="hidden" name="kefangId" value="<%=request.getParameter("kefangId") %>"/>
							<input type="hidden" name="mendianId" value="<%=request.getParameter("mendianId") %>"/>
							<input type="submit" value="确定"/>
						</td>
					</tr>
				</table>
			</form>
	</body>
</html>
