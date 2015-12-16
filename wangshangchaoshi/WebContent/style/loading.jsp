<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网上超市销售系统后台登录</title>
<link href="style/loading.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="outlayer">
  <div class="logo"><img src="img/logo.png" width="300" height="50" alt="" /></div>
  <div class="From">
    <div class="logo2"><img src="" alt="" name="logo2" width="270" height="170" id="logo2" style="background-color: #CCCCCC" /></div>
    <div class="From_"><form action="" method="post" name="loagding">
      <table width="270" height="168" border="0">
        <tr>
          <td>用户名:</td>
        </tr>
        <tr>
          <td height="30"><label for="user"></label>
            <input type="text" name="user" id="user" /></td>
        </tr>
        <tr>
          <td>密码：</td>
        </tr>
        <tr>
          <td height="30"><label for="password"></label>
            <input type="password" name="password" id="password" /></td>
        </tr>
        <tr>
          <td height="40"><input class="loadingButton" name="Button" type="submit" value="登录" /></td>
        </tr>
      </table>
      </form>
    </div>
    <div class="errorOut">用户名或密码错误！</div>
  </div>
  <div class="copyright">Copyright： © 2014-2015 超市公司版权所有</div>
</div>
</body>
</html>