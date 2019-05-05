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
           function yudingDel(id)
           {
                var url="<%=path %>/yudingDel.action?id="+id;
                window.location.href=url;
           }
           function userDetail(userId)
           {
                var url="<%=path %>/userDetail.action?userId="+userId;
                var ret = window.showModalDialog(url,"","dialogWidth:800px; dialogHeight:300px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
           }
           
           function ruzhuAdd(yudingId,userId,kefangId,mendianId)
           {
                var url="<%=path %>/admin/ruzhu/ruzhuAdd.jsp?userId="+userId+"&kefangId="+kefangId+"&mendianId="+mendianId+"&yudingId="+yudingId;
                //alert(url);这个地方之所以要传递预订ID，是为了入住以后。就吧预订这条信息删除
                window.location.href=url;
           }
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="10" background="<%=path %>/img/tbg.gif">&nbsp;预订信息管理&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
				    <td width="4%">序号</td>
					<td width="10%">预订房间</td>
					<td width="10%">入住时间</td>
					<td width="10%">离店时间</td>
					<td width="10%">联系方式</td>
					<td width="10%">预订时间</td>
					<td width="10%">会员信息</td>
					<td width="10%">操作</td>
		        </tr>	
				<s:iterator value="#request.yudingList" id="yuding" status="ss">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#ss.index+1"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#yuding.kefang.fangjianhao"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <s:property value="#yuding.ruzhushiian"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#yuding.lidianshiian"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#yuding.yudingzheTel"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#yuding.yudingshijian"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<a style="color: red" href="#" onclick="userDetail(<s:property value="#yuding.userId"/>)">会员信息</a>
					</td>
					<td  bgcolor="#FFFFFF" align="center" >
						<a style="color: red" href="#" onclick="yudingDel(<s:property value="#yuding.id"/>)" class="pn-loperator">删除</a>
						&nbsp;
						<a style="color: red" href="#" onclick="ruzhuAdd(<s:property value="#yuding.id"/>,<s:property value="#yuding.userId"/>,<s:property value="#yuding.kefangId"/>,<s:property value="#yuding.mendianId"/>)" class="pn-loperator">入住</a>
					</td>
				</tr>
				</s:iterator>
			</table>
	</body>
</html>
