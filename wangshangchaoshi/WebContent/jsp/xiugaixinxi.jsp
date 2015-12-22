<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" pageEncoding="utf-8"
import="java.util.List"%>
<%@page import="com.shop.usermanager.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.shop.usermanager.UserManager"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人中心——客户资料</title>
<link href="<%=request.getContextPath() %>/style/index.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<!-- 头部开始-->
<%@ include file="head.jsp"%>
	</p>
	<!-- 头部结束-->

<div style=" width:1200px; margin:auto;">

		<div style="height: 500px;">
			<div
				style="height: 500px; width: 200px; background-color: #CCC; float: left;">
				<table width="200" border="1" cellpadding="5px" cellspacing="1px;">
					<tr>
						<th><a name="wodegerenziliao" href="kehuziliao.jsp"><center>
									<u>我的个人资料</u>
								</center></a></th>
					</tr>
					<tr>
						<th><a name="wodedingdan" href="wodedingdan.jsp"><center>
									<u>我的订单</u>
								</center></a></th>
					</tr>
					<tr>
						<th><a name="wodegouwuche" href="wodegouwuche.jsp"><center>
									<u>我的购物车</u>
								</center></a></th>
						<tr>
							<th><a name="xiugaixinxi" href="xiugaixinxi.jsp"><center>
										<u>修改信息</u>
									</center></a></th>
							<tr>
								<th><a name="wodeqianbao" href="wodeqianbao.jsp"><center>
											<u>我的钱包</u>
										</center></a></th>
				</table>


			</div>

<script language="javascript">
function isnull(){
	var cname = document.getElementById('cname').value;
	if (cname == ""||cname==null) {
		alert("姓名不能为空");
		return false;
	}
	var ctel = document.getElementById('ctel').value;
	if (ctel == ""||ctel==null) {
		alert("电话不能为空");
		return false;
	}
	var cadress = document.getElementById('cadress').value;
	if (cadress == ""||cadress==null) {
		alert("默认地址不能为空");
		return false;
	}
	
	
	return true;
}


</script>
			<div style="height: 500px;">
			<form action = "<%=request.getContextPath() %>/editcustomer" method="post"  onsubmit="return isnull();"">
				<center>
					<table border="0" width="807">
					<%
					String user = "张三";  //得在上面加<%String User= (String)session.getAttribute("User"); 
						UserManager manager = new UserManager();
						ArrayList<User> Onelist = manager.findinformation(user);
					%>
					<%
						for (int i = 0; i < Onelist.size(); i++) {
							
							
					%>
					
						<tr>
							<th width="17%" style="width: 20%; height: 35px;">用户名：</th>
							<td width="55%"><input type="text" name="cname" id="cname"
						style="width: 400px;" value="<%=Onelist.get(i).getXingming()%>" /></td>
							<td width="28%" rowspan="4" style="width: 25%;"><div
									style="width: 200px; height: 160px; background-color: #6C3">
									<img src="wallpaper_5252096.jpg" width="200px" height="160" />
								</div></td>
						</tr>
						<tr>
							<th style="width: 20%; height: 35px;"><span
								style="height: 35px;">联系电话：</span></th>
							<td height="45%"><input type="text" name="ctel" id="ctel"
						style="width: 400px;" value="<%=Onelist.get(i).getDianhua()%>" /></td>
						</tr>
						
						<tr>
							<th style="height: 35px;"><span style="height: 35px;">默认地址：</span></th>
							<td><input type="text" name="cadress" id="cadress"
						style="width: 400px;" value="<%=Onelist.get(i).getDizhi()%>" /></td>
						</tr>
						<tr>
							<th style="height: 35px;">备用地址1：</th>
							<td colspan="2"><input type="text" name="cadress2" id="cadress2"
						style="width: 400px;" value="<%=Onelist.get(i).getDizhi1()%>" /></td>
						</tr>
						<tr>
							<th style="height: 35px;">备用地址2：</th>
							<td colspan="2"><input type="text" name="cadress3" id="cadress3"
						style="width: 400px;" value="<%=Onelist.get(i).getDizhi2()%>" /></td>
						</tr>

						<tr>
							<th style="height: 100px;"><p style="margin-top: 20px;">备注：</p></th>
							<td><input style="width:400px; height:100px;" type="text" name="cremark" id="cremark"
						style="width: 400px;" value="<%=Onelist.get(i).getBeizhu()%>"/></td>
						</tr>
						<tr>
							<td colspan="3" style="height: 25px;">
							<input style="margin-left: 100px; margin-top: 15px;" type="submit" value="保存修改" />
							
							</td>
						</tr>
<%
						}
					%>
					</table>
					</center>
					</form>
			</div>
		</div>


		<p align="right">
			<a href="#top" name="bottom" style="margin-right: 80px;">返回顶部 ↑</a>
		</p>
		<!-- 底部开始-->
	<%@ include file="footer.jsp"%>
		<!-- 底部结束-->
</body>
</html>

