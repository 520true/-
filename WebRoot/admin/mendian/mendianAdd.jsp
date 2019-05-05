<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page isELIgnored="false" %> 
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>

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
        
        <SCRIPT type=text/javascript>
			function FillCity(selectedProvince)
			{
				var cityNameList = new Array();
				var provinceCityMap;
				provinceCityMap=new Array();
				provinceCityMap[0]="合肥";
				provinceCityMap[1]="安庆";
				provinceCityMap[2]="蚌埠";
				provinceCityMap[3]="毫州";
				provinceCityMap[4]="巢湖";
				provinceCityMap[5]="滁州";
				provinceCityMap[6]="阜阳";
				provinceCityMap[7]="贵池";
				provinceCityMap[8]="淮北";
				provinceCityMap[9]="准化";
				provinceCityMap[10]="淮南";
				provinceCityMap[11]="黄山";
				provinceCityMap[12]="九华山";
				provinceCityMap[13]="六安";
				provinceCityMap[14]="马鞍山";
				provinceCityMap[15]="宿州";
				provinceCityMap[16]="铜陵";
				provinceCityMap[17]="屯溪";
				provinceCityMap[18]="芜湖";
				provinceCityMap[19]="宣城";
				provinceCityMap[20]="池州";
				provinceCityMap[21]="宿县";
				cityNameList[0]=provinceCityMap;
				provinceCityMap=new Array();
				provinceCityMap[0]="北京";
				cityNameList[1]=provinceCityMap;
				provinceCityMap=new Array();
				provinceCityMap[0]="重庆";
				cityNameList[2]=provinceCityMap;
				provinceCityMap=new Array();
				provinceCityMap[0]="福州";
				provinceCityMap[1]="福安";
				provinceCityMap[2]="龙岩";
				provinceCityMap[3]="南平";
				provinceCityMap[4]="宁德";
				provinceCityMap[5]="莆田";
				provinceCityMap[6]="泉州";
				provinceCityMap[7]="三明";
				provinceCityMap[8]="邵武";
				provinceCityMap[9]="石狮";
				provinceCityMap[10]="永安";
				provinceCityMap[11]="武夷山";
				provinceCityMap[12]="厦门";
				provinceCityMap[13]="漳州";
				cityNameList[3]=provinceCityMap;
				provinceCityMap=new Array();
				provinceCityMap[0]="兰州";
				provinceCityMap[1]="白银";
				provinceCityMap[2]="定西";
				provinceCityMap[3]="敦煌";
				provinceCityMap[4]="甘南";
				provinceCityMap[5]="金昌";
				provinceCityMap[6]="酒泉";
				provinceCityMap[7]="临夏";
				provinceCityMap[8]="平凉";
				provinceCityMap[9]="天水";
				provinceCityMap[10]="武威";
				provinceCityMap[11]="西峰";
				provinceCityMap[12]="矿区";
				provinceCityMap[13]="陇南";
				provinceCityMap[14]="庆阳";
				provinceCityMap[15]="嘉峪关";
				provinceCityMap[16]="张掖";
				provinceCityMap[17]="东风";
				provinceCityMap[18]="合作";
				cityNameList[4]=provinceCityMap;
				provinceCityMap=new Array();
				provinceCityMap[0]="广州";
				provinceCityMap[1]="潮阳";
				provinceCityMap[2]="潮州";
				provinceCityMap[3]="澄海";
				provinceCityMap[4]="东莞";
				provinceCityMap[5]="佛山";
				provinceCityMap[6]="河源";
				provinceCityMap[7]="惠州";
				provinceCityMap[8]="江门";
				provinceCityMap[9]="揭阳";
				provinceCityMap[10]="开平";
				provinceCityMap[11]="茂名";
				provinceCityMap[12]="梅州";
				provinceCityMap[13]="清远";
				provinceCityMap[14]="汕头";
				provinceCityMap[15]="汕尾";
				provinceCityMap[16]="深圳";
				provinceCityMap[17]="韶关";
				provinceCityMap[18]="顺德";
				provinceCityMap[19]="阳江";
				provinceCityMap[20]="英德";
				provinceCityMap[21]="云浮";
				provinceCityMap[22]="增城";
				provinceCityMap[23]="湛江";
				provinceCityMap[24]="肇庆";
				provinceCityMap[25]="中山";
				provinceCityMap[26]="珠海";
				cityNameList[5]=provinceCityMap;
				provinceCityMap=new Array();
				provinceCityMap[0]="南宁";
				provinceCityMap[1]="百色";
				provinceCityMap[2]="北海";
				provinceCityMap[3]="贵港";
				provinceCityMap[4]="桂林";
				provinceCityMap[5]="防城港";
				provinceCityMap[6]="河池";
				provinceCityMap[7]="柳州";
				provinceCityMap[8]="钦州";
				provinceCityMap[9]="梧州";
				provinceCityMap[10]="玉林";
				cityNameList[6]=provinceCityMap;
				provinceCityMap=new Array();
				provinceCityMap[0]="贵阳";
				provinceCityMap[1]="安顺";
				provinceCityMap[2]="毕节";
				provinceCityMap[3]="都匀";
				provinceCityMap[4]="凯里";
				provinceCityMap[5]="六盘水";
				provinceCityMap[6]="铜仁";
				provinceCityMap[7]="兴义";
				provinceCityMap[8]="玉屏";
				provinceCityMap[9]="遵义";
				cityNameList[7]=provinceCityMap;
				provinceCityMap=new Array();
				provinceCityMap[0]="海口";
				provinceCityMap[1]="儋县";
				provinceCityMap[2]="陵水";
				provinceCityMap[3]="琼海";
				provinceCityMap[4]="三亚";
				provinceCityMap[5]="通什";
				provinceCityMap[6]="万宁";
				cityNameList[8]=provinceCityMap;
				provinceCityMap=new Array();
				provinceCityMap[0]="石家庄";
				provinceCityMap[1]="保定";
				provinceCityMap[2]="北戴河";
				provinceCityMap[3]="沧州";
				provinceCityMap[4]="承德";
				provinceCityMap[5]="丰润";
				provinceCityMap[6]="邯郸";
				provinceCityMap[7]="衡水";
				provinceCityMap[8]="廊坊";
				provinceCityMap[9]="南戴河";
				provinceCityMap[10]="秦皇岛";
				provinceCityMap[11]="唐山";
				provinceCityMap[12]="邢台";
				provinceCityMap[13]="新城";
				provinceCityMap[14]="张家口";
				cityNameList[9]=provinceCityMap;
				provinceCityMap=new Array();
				provinceCityMap[0]="哈尔滨";
				provinceCityMap[1]="大庆";
				provinceCityMap[2]="大兴安岭";
				provinceCityMap[3]="鹤岗";
				provinceCityMap[4]="黑河";
				provinceCityMap[5]="佳木斯";
				provinceCityMap[6]="鸡西";
				provinceCityMap[7]="牡丹江";
				provinceCityMap[8]="齐齐哈尔";
				provinceCityMap[9]="七台河";
				provinceCityMap[10]="双鸭山";
				provinceCityMap[11]="绥化";
				provinceCityMap[12]="伊春";
				cityNameList[10]=provinceCityMap;
				provinceCityMap=new Array();
				provinceCityMap[0]="郑州";
				provinceCityMap[1]="安阳";
				provinceCityMap[2]="鹤壁";
				provinceCityMap[3]="潢川";
				provinceCityMap[4]="焦作";
				provinceCityMap[5]="开封";
				provinceCityMap[6]="漯河";
				provinceCityMap[7]="洛阳";
				provinceCityMap[8]="南阳";
				provinceCityMap[9]="平顶山";
				provinceCityMap[10]="濮阳";
				provinceCityMap[11]="三门峡";
				provinceCityMap[12]="商丘";
				provinceCityMap[13]="新乡";
				provinceCityMap[14]="信阳";
				provinceCityMap[15]="许昌";
				provinceCityMap[16]="周口";
				provinceCityMap[17]="驻马店";
				cityNameList[11]=provinceCityMap;
				provinceCityMap=new Array();
				provinceCityMap[0]="武汉";
				provinceCityMap[1]="恩施";
				provinceCityMap[2]="鄂州";
				provinceCityMap[3]="黄冈";
				provinceCityMap[4]="黄石";
				provinceCityMap[5]="荆门";
				provinceCityMap[6]="荆州";
				provinceCityMap[7]="潜江";
				provinceCityMap[8]="十堰";
				provinceCityMap[9]="随州";
				provinceCityMap[10]="武穴";
				provinceCityMap[11]="仙桃";
				provinceCityMap[12]="咸宁";
				provinceCityMap[13]="襄樊";
				provinceCityMap[14]="三峡";
				provinceCityMap[15]="孝感";
				provinceCityMap[16]="宜昌";
				cityNameList[12]=provinceCityMap;
				provinceCityMap=new Array();
				provinceCityMap[0]="长沙";
				provinceCityMap[1]="常德";
				provinceCityMap[2]="郴州";
				provinceCityMap[3]="衡阳";
				provinceCityMap[4]="怀化";
				provinceCityMap[5]="湘西";
				provinceCityMap[6]="吉首";
				provinceCityMap[7]="娄底";
				provinceCityMap[8]="邵阳";
				provinceCityMap[9]="湘潭";
				provinceCityMap[10]="益阳";
				provinceCityMap[11]="岳阳";
				provinceCityMap[12]="永州";
				provinceCityMap[13]="张家界";
				provinceCityMap[14]="株洲";
				cityNameList[13]=provinceCityMap;
				provinceCityMap=new Array();
				provinceCityMap[0]="南京";
				provinceCityMap[1]="常熟";
				provinceCityMap[2]="常州";
				provinceCityMap[3]="海门";
				provinceCityMap[4]="淮安";
				provinceCityMap[5]="江都";
				provinceCityMap[6]="江阴";
				provinceCityMap[7]="昆山";
				provinceCityMap[8]="连云港";
				provinceCityMap[9]="启东";
				provinceCityMap[10]="沭阳";
				provinceCityMap[11]="太仓";
				provinceCityMap[12]="同里";
				provinceCityMap[13]="南通";
				provinceCityMap[14]="宿迁";
				provinceCityMap[15]="苏州";
				provinceCityMap[16]="泰州";
				provinceCityMap[17]="无锡";
				provinceCityMap[18]="徐州";
				provinceCityMap[19]="盐城";
				provinceCityMap[20]="扬州";
				provinceCityMap[21]="宜兴";
				provinceCityMap[22]="仪征";
				provinceCityMap[23]="胥浦";
				provinceCityMap[24]="淮阴";
				provinceCityMap[25]="镇江";
				provinceCityMap[26]="张家港";
				provinceCityMap[27]="周庄";
				cityNameList[14]=provinceCityMap;
				provinceCityMap=new Array();
				provinceCityMap[0]="南昌";
				provinceCityMap[1]="抚州";
				provinceCityMap[2]="赣州";
				provinceCityMap[3]="吉安";
				provinceCityMap[4]="景德镇";
				provinceCityMap[5]="井冈山";
				provinceCityMap[6]="九江";
				provinceCityMap[7]="庐山";
				provinceCityMap[8]="萍乡";
				provinceCityMap[9]="上饶";
				provinceCityMap[10]="新余";
				provinceCityMap[11]="宜春";
				provinceCityMap[12]="鹰潭";
				cityNameList[15]=provinceCityMap;
				provinceCityMap=new Array();
				provinceCityMap[0]="长春";
				provinceCityMap[1]="白城";
				provinceCityMap[2]="白山";
				provinceCityMap[3]="珲春";
				provinceCityMap[4]="辽源";
				provinceCityMap[5]="梅河";
				provinceCityMap[6]="吉林";
				provinceCityMap[7]="四平";
				provinceCityMap[8]="松原";
				provinceCityMap[9]="通化";
				provinceCityMap[10]="延边";
				cityNameList[16]=provinceCityMap;
				provinceCityMap=new Array();
				provinceCityMap[0]="沈阳";
				provinceCityMap[1]="鞍山";
				provinceCityMap[2]="本溪";
				provinceCityMap[3]="朝阳";
				provinceCityMap[4]="丹东";
				provinceCityMap[5]="抚顺";
				provinceCityMap[6]="阜新";
				provinceCityMap[7]="葫芦岛";
				provinceCityMap[8]="锦州";
				provinceCityMap[9]="辽阳";
				provinceCityMap[10]="大连";
				provinceCityMap[11]="盘锦";
				provinceCityMap[12]="铁岭";
				provinceCityMap[13]="营口";
				cityNameList[17]=provinceCityMap;
				provinceCityMap=new Array();
				provinceCityMap[0]="呼和浩特";
				provinceCityMap[1]="包头";
				provinceCityMap[2]="赤峰";
				provinceCityMap[3]="通辽";
				provinceCityMap[4]="满洲里";
				provinceCityMap[5]="乌海";
				provinceCityMap[6]="乌盟";
				provinceCityMap[7]="伊盟";
				provinceCityMap[8]="兴安盟";
				provinceCityMap[9]="呼盟";
				provinceCityMap[10]="哲盟";
				provinceCityMap[11]="巴盟";
				provinceCityMap[12]="锡盟";
				provinceCityMap[13]="阿盟";
				cityNameList[18]=provinceCityMap;
				provinceCityMap=new Array();
				provinceCityMap[0]="银川";
				provinceCityMap[1]="固原";
				provinceCityMap[2]="石嘴山";
				provinceCityMap[3]="吴忠";
				cityNameList[19]=provinceCityMap;
				provinceCityMap=new Array();
				provinceCityMap[0]="西宁";
				provinceCityMap[1]="德令哈";
				provinceCityMap[2]="格尔木";
				provinceCityMap[3]="共和";
				provinceCityMap[4]="海东";
				provinceCityMap[5]="海晏";
				provinceCityMap[6]="玛沁";
				provinceCityMap[7]="同仁";
				provinceCityMap[8]="玉树";
				cityNameList[20]=provinceCityMap;
				provinceCityMap=new Array();
				provinceCityMap[0]="济南";
				provinceCityMap[1]="滨州";
				provinceCityMap[2]="兖州";
				provinceCityMap[3]="德州";
				provinceCityMap[4]="东营";
				provinceCityMap[5]="菏泽";
				provinceCityMap[6]="济宁";
				provinceCityMap[7]="莱芜";
				provinceCityMap[8]="聊城";
				provinceCityMap[9]="蓬莱";
				provinceCityMap[10]="临沂";
				provinceCityMap[11]="日照";
				provinceCityMap[12]="泰安";
				provinceCityMap[13]="潍坊";
				provinceCityMap[14]="威海";
				provinceCityMap[15]="烟台";
				provinceCityMap[16]="青岛";
				provinceCityMap[17]="曲阜";
				provinceCityMap[18]="枣庄";
				provinceCityMap[19]="淄博";
				cityNameList[21]=provinceCityMap;
				provinceCityMap=new Array();
				provinceCityMap[0]="上海";
				cityNameList[22]=provinceCityMap;
				provinceCityMap=new Array();
				provinceCityMap[0]="太原";
				provinceCityMap[1]="长治";
				provinceCityMap[2]="大同";
				provinceCityMap[3]="候马";
				provinceCityMap[4]="晋城";
				provinceCityMap[5]="离石";
				provinceCityMap[6]="临汾";
				provinceCityMap[7]="宁武";
				provinceCityMap[8]="朔州";
				provinceCityMap[9]="忻州";
				provinceCityMap[10]="阳泉";
				provinceCityMap[11]="榆次";
				provinceCityMap[12]="运城";
				cityNameList[23]=provinceCityMap;
				provinceCityMap=new Array();
				provinceCityMap[0]="西安";
				provinceCityMap[1]="安康";
				provinceCityMap[2]="宝鸡";
				provinceCityMap[3]="汉中";
				provinceCityMap[4]="渭南";
				provinceCityMap[5]="商洛";
				provinceCityMap[6]="绥德";
				provinceCityMap[7]="铜川";
				provinceCityMap[8]="咸阳";
				provinceCityMap[9]="延安";
				provinceCityMap[10]="榆林";
				cityNameList[24]=provinceCityMap;
				provinceCityMap=new Array();
				provinceCityMap[0]="成都";
				provinceCityMap[1]="巴中";
				provinceCityMap[2]="达州";
				provinceCityMap[3]="德阳";
				provinceCityMap[4]="都江堰";
				provinceCityMap[5]="眉山";
				provinceCityMap[6]="涪陵";
				provinceCityMap[7]="广安";
				provinceCityMap[8]="广元";
				provinceCityMap[9]="九寨沟";
				provinceCityMap[10]="康定";
				provinceCityMap[11]="乐山";
				provinceCityMap[12]="凉山";
				provinceCityMap[13]="泸州";
				provinceCityMap[14]="马尔康";
				provinceCityMap[15]="绵阳";
				provinceCityMap[16]="南充";
				provinceCityMap[17]="内江";
				provinceCityMap[18]="攀枝花";
				provinceCityMap[19]="遂宁";
				provinceCityMap[20]="汶川";
				provinceCityMap[21]="西昌";
				provinceCityMap[22]="雅安";
				provinceCityMap[23]="宜宾";
				provinceCityMap[24]="自贡";
				provinceCityMap[25]="资阳";
				cityNameList[25]=provinceCityMap;
				provinceCityMap=new Array();
				provinceCityMap[0]="天津";
				cityNameList[26]=provinceCityMap;
				provinceCityMap=new Array();
				provinceCityMap[0]="乌鲁木齐";
				provinceCityMap[1]="阿克苏";
				provinceCityMap[2]="阿勒泰";
				provinceCityMap[3]="阿图什";
				provinceCityMap[4]="博乐";
				provinceCityMap[5]="东山";
				provinceCityMap[6]="哈密";
				provinceCityMap[7]="和田";
				provinceCityMap[8]="喀什";
				provinceCityMap[9]="克拉玛依";
				provinceCityMap[10]="库车";
				provinceCityMap[11]="库尔勒";
				provinceCityMap[12]="奎屯";
				provinceCityMap[13]="石河子";
				provinceCityMap[14]="塔城";
				provinceCityMap[15]="吐鲁番";
				provinceCityMap[16]="伊犁";
				cityNameList[27]=provinceCityMap;
				provinceCityMap=new Array();
				provinceCityMap[0]="拉萨";
				provinceCityMap[1]="阿里";
				provinceCityMap[2]="昌都";
				provinceCityMap[3]="林芝";
				provinceCityMap[4]="那曲";
				provinceCityMap[5]="日喀则";
				provinceCityMap[6]="山南";
				cityNameList[28]=provinceCityMap;
				provinceCityMap=new Array();
				provinceCityMap[0]="昆明";
				provinceCityMap[1]="保山";
				provinceCityMap[2]="楚雄";
				provinceCityMap[3]="大理";
				provinceCityMap[4]="东川";
				provinceCityMap[5]="个旧";
				provinceCityMap[6]="景洪";
				provinceCityMap[7]="开远";
				provinceCityMap[8]="临沧";
				provinceCityMap[9]="丽江";
				provinceCityMap[10]="六库";
				provinceCityMap[11]="潞西";
				provinceCityMap[12]="曲靖";
				provinceCityMap[13]="思茅";
				provinceCityMap[14]="文山";
				provinceCityMap[15]="版纳";
				provinceCityMap[16]="玉溪";
				provinceCityMap[17]="中甸";
				provinceCityMap[18]="昭通";
				provinceCityMap[19]="德宏";
				provinceCityMap[20]="怒江";
				provinceCityMap[21]="红河";
				cityNameList[29]=provinceCityMap;
				provinceCityMap=new Array();
				provinceCityMap[0]="杭州";
				provinceCityMap[1]="安吉";
				provinceCityMap[2]="慈溪";
				provinceCityMap[3]="定海";
				provinceCityMap[4]="奉化";
				provinceCityMap[5]="海盐";
				provinceCityMap[6]="黄岩";
				provinceCityMap[7]="湖州";
				provinceCityMap[8]="嘉兴";
				provinceCityMap[9]="金华";
				provinceCityMap[10]="临安";
				provinceCityMap[11]="临海";
				provinceCityMap[12]="丽水";
				provinceCityMap[13]="宁波";
				provinceCityMap[14]="瓯海";
				provinceCityMap[15]="平湖";
				provinceCityMap[16]="千岛湖";
				provinceCityMap[17]="衢州";
				provinceCityMap[18]="江山";
				provinceCityMap[19]="瑞安";
				provinceCityMap[20]="绍兴";
				provinceCityMap[21]="嵊州";
				provinceCityMap[22]="台州";
				provinceCityMap[23]="温岭";
				provinceCityMap[24]="温州";
				provinceCityMap[25]="舟山";
				cityNameList[30]=provinceCityMap;
				provinceCityMap=new Array();
				provinceCityMap[0]="澳门";
				cityNameList[31]=provinceCityMap;
				provinceCityMap=new Array();
				provinceCityMap[0]="香港";
				cityNameList[32]=provinceCityMap;
				provinceCityMap=new Array();
				provinceCityMap[0]="台湾";
				cityNameList[33]=provinceCityMap;
				
				var cityDropdown=document.getElementById('shi');
				
				index=cityDropdown.options.length;
				
				while (index>0){
					cityDropdown.options[index]=null;
					index--;
				}
			
				var myOption=new Option();
				
				var insertIndex=cityDropdown.options.length;
				
				var i;var flag=false;
				
				if (selectedProvince.options.selectedIndex != 0){
					var cityList = cityNameList[selectedProvince.options.selectedIndex-1];
					for ( i = 0; i < cityList.length; i++){
						myOption=new Option();
						myOption.value=cityList[i];
						myOption.text=cityList[i];
				
						if (myOption.value=="") {
							myOption.selected=true;
						}
						
						cityDropdown.options[i+1]=myOption;
					}
					
					if (flag==false){
						cityDropdown.options[1].selected=true;
					}
				}
			}
			
			
			function c()
			{
			    var sheng=document.formAdd.sheng.value;
			    var shi=document.formAdd.shi.value;
			    var mingcheng=document.formAdd.mingcheng.value;
			    var dizhi=document.formAdd.dizhi.value;
			    var xingming=document.formAdd.xingming.value;
			    var loginname=document.formAdd.loginname.value;
			    var loginpw=document.formAdd.loginpw.value;
			    
			    if(sheng=="none")
			    {
			        alert("请选择门店所在省市");
			        return false;
			    }
			    if(shi=="none")
			    {
			        alert("请选择门店所在城市");
			        return false;
			    }
			    if(mingcheng=="")
			    {
			        alert("请输入名称");
			        return false;
			    }
			    if(dizhi=="")
			    {
			        alert("请输入门店地址");
			        return false;
			    }
			    if(xingming=="")
			    {
			        alert("请输入负责人姓名");
			        return false;
			    }
			    if(loginname=="")
			    {
			        alert("请输入负责人账号");
			        return false;
			    }
			    if(loginpw=="")
			    {
			        alert("请输入负责人密码");
			        return false;
			    }
			    
			    document.formAdd.submit();
			}
        </SCRIPT>
	</head>

	<body leftmargin="2" topmargin="9" background='<%=path %>/img/allbg.gif'>
			<form action="<%=path %>/mendianAdd.action" name="formAdd" method="post">
				     <table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
						<tr bgcolor="#EEF4EA">
					        <td colspan="3" background="<%=path %>/img/wbg.gif" class='title'><span>门店信息管理</span></td>
					    </tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						          省市：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <select name="sheng" onChange="FillCity(this);" style="width:200px;">
									<option value="none">—选择省市—</option>
									<option value="安徽">安徽</option>
									<option value="北京">北京</option>
									<option value="重庆">重庆</option>
									<option value="福建">福建</option>
									<option value="甘肃">甘肃</option>
									<option value="广东">广东</option>
									<option value="广西">广西</option>
									<option value="贵州">贵州</option>
									<option value="海南">海南</option>
									<option value="河北">河北</option>
									<option value="黑龙江">黑龙江</option>
									<option value="河南">河南</option>
									<option value="湖北">湖北</option>
									<option value="湖南">湖南</option>
									<option value="江苏">江苏</option>
									<option value="江西">江西</option>
									<option value="吉林">吉林</option>
									<option value="辽宁">辽宁</option>
									<option value="内蒙古">内蒙古</option>
									<option value="宁夏">宁夏</option>
									<option value="青海">青海</option>
									<option value="山东">山东</option>
									<option value="上海">上海</option>
									<option value="山西">山西</option>
									<option value="陕西">陕西</option>
									<option value="四川">四川</option>
									<option value="天津">天津</option>
									<option value="新疆">新疆</option>
									<option value="西藏">西藏</option>
									<option value="云南">云南</option>
									<option value="浙江">浙江</option>
								</select>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						          城市：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <select id="shi" name="shi" style="width:200px;">
								    <option value="none">—选择城市—</option>
								</select>
						        
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						          名称：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="mingcheng" style="width:196px;"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						          地址：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="dizhi" style="width:196px;"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						          电话：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="dianhua" style="width:196px;"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         简介：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <FCK:editor instanceName="jianjie"  basePath="/fckeditor" width="300" height="130" value="" toolbarSet="Basic">
	                            </FCK:editor>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						          负责人姓名：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="xingming" style="width:196px;"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						          负责人账号：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="loginname" style="width:196px;"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						          负责人密码：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="loginpw" value="000000" style="width:196px;"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        &nbsp;
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						       <input type="button" value="提交" onclick="c()"/>&nbsp; 
						       <input type="reset" value="重置"/>&nbsp;
						    </td>
						</tr>
					 </table>
			</form>
   </body>
</html>
