
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" pageEncoding="utf-8"
import="java.util.List"%>
<%String path=request.getContextPath(); %><%session.invalidate(); %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>欢迎来到登录页！</title>
<link href="<%=path%>" rel="stylesheet" type="text/css" />
</head>
<body background="<%=path%>/img/safadsgsfhej.jpg">
	<div style="margin-top: 100px; font-size: 20px; margin-left: 112px;"><%=request.getAttribute("tishi") == null ? "" : request.getAttribute("tishi")%></div>
	<div>
		<img src="<%=path%>/img/123123122312.png"
			style="margin-left: 175px; margin-top: 100px; width: 500px; height: 400px;" />
		<div class="cc_01"
			style="float:right; margin-top:80px; margin-right:200px; width:450px; height:450px; background-image:url(<%=path%>/img/450-450.png)">

			<form action="<%=path%>/userloading" method="post" name="userloading">
				<div style="margin-top: 100px; font-size: 20px; margin-left: 112px;">
					用户名:<br /> <input name="quser" type="text" id="quser"
						style="width: 200px; height: 30px;" />
				</div>
				<div style="margin-top: 40px; font-size: 20px; margin-left: 112px;">
					密码:<br /> <input name="qpassword" type="password" id="qpassword"
						style="width: 200px; height: 30px;" />
					<div style="margin-top: 30px; font-size: 15px; margin-left: 160px;">
						<a href="<%=request.getContextPath() %>/jsp/register.jsp">免费注册<br />
							<div>
								<button name="Button" type="submit"
									style="margin-top: 30px; width: 80px; margin-left: -90px;">
									登录</button>
							</div>
			</form>
		</div>
	</div>
</body>
<style>
.cc_01 input:hover {
	background: #ddf1fc;
}
</style>
</html>

