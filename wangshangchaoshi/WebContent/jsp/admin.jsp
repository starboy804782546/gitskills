
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" pageEncoding="utf-8"
import="java.util.List"
%><%String path=request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网上超市销售系统后台登录</title>
<link href="<%=path %>/style/loading.css" rel="stylesheet" type="text/css" />
<script language="javascript">
function onClick(){
	var user=document.loagding.user.value;
	var passwd=document.loagding.password.value;
	if(user==""){
		document.getElementById("errorDiv").innerHTML="请输入用户名";
		return false;
	}else if(passwd==""){
		document.getElementById("errorDiv").innerHTML="请输入密码";
		return false;
	}
	return true;
}
function cleanOnClick(){
	document.getElementById("errorDiv").innerHTML="";
}
</script>
</head>

<body>
<div class="outlayer">
  <div class="logo"><img src="<%=path %>/img/logo.png" width="300" height="50" alt="" /></div>
  <div class="From">
    <div class="logo2"><img src="<%=path %>/img/logo2.png" alt="" name="logo2" width="270" height="170" id="logo2" style="background-color: #CCCCCC" /></div>
    <div class="From_">
    <form action="<%=path %>/loading" method="post" name="loagding" onsubmit="return onClick();">
      <table width="270" height="168" border="0">
        <tr>
          <td>用户名:</td>
        </tr>
        <tr>
          <td height="30"><label for="user"></label>
            <input name="user" type="text" id="user" value="" onclick="cleanOnClick();" /></td>
        </tr>
        <tr>
          <td>密码：</td>
        </tr>
        <tr>
          <td height="30"><label for="password"></label>
            <input name="password" type="password" id="password" value="" onclick="cleanOnClick();"/></td>
        </tr>
        <tr>
          <td height="40"><input class="loadingButton" name="Button" type="submit" value="登录" />
        
         
           <!-- <a href="yuanxing/index.html" class="loadingButton">登录</a> --> </td>
        </tr>
      </table>
      </form>
    </div>  <div class="errorOut" id = "errorDiv">
    </div>
  </div>
  <div class="copyright">Copyright： © 2014-2015 超市公司版权所有</div>
</div>
</body>
</html>