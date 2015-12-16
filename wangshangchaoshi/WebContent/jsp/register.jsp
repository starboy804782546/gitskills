<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" pageEncoding="utf-8"
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>注册页面</title>
</head>
<body>
<div id="apDiv1">
  <form id="form2" name="form2" method="post" action="<%=request.getContextPath() %>/register">
    <table width="312" border="0" cellspacing="0">
      <tr>
        <td width="87">用户名称：</td>
        <td width="168"><label for="textfield"></label>
          <input type="text" name="zhanghao" id="zhanghao" /></td>
      </tr>
      <tr>
        <td>用户密码</td>
        <td><label for="select">
          <input type="password" name="password" id="password" />
        </label></td>
      </tr>

      <tr>
       <td>姓名</td>
        <td><input type="text" name="username" id="username" /></td>
     </tr>
      <tr>
        <td>手机号</td>
        <td><input type="text" name="phonenumber" id="phonenumber" /></td>
      </tr>
      <tr>
        <td height="42" colspan="2" ><p><input type="submit" value="注册" /></p>         </td>
      </tr>
    </table>
  </form>
</div>
</body>
</html>