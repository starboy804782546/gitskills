
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" pageEncoding="utf-8"
import="java.util.List"%>
<%String path=request.getContextPath(); %><%session.invalidate(); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户登录</title>
<link href="<%=path %>" rel="stylesheet" type="text/css" />
</head>

<body>

    <form action="<%=path %>/userloading" method="post" name="userloading">
      <table width="270" height="168" border="0">
        <tr>
          <td>用户名:</td>
        </tr>
        <tr>
          <td height="30"><label for="user"></label>
            <input name="quser" type="text" id="quser" value="" /></td>
        </tr>
        <tr>
          <td>密码：</td>
        </tr>
        <tr>
          <td height="30"><label for="password"></label>
            <input name="qpassword" type="password" id="qpassword" value="" /></td>
        </tr>
        <tr>
        <td height="22" align="center" ><a href="register.jsp">免费注册</a>                  
        </tr>
        <tr>
          <td height="40" align="left"><a></a><br />
            <input class="loadingButton" name="Button" type="submit" value="登录" />
        </tr>
      </table>
      </form>

 

</body>
</html>