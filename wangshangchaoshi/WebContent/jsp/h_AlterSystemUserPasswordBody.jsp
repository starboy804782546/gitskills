<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>


<link href="../style/moodSystemUser.css" rel="stylesheet" type="text/css">
<body>
<script language="javascript">
function onJudge(){
	var xinmima=document.form1.xinmima.value;
	var xinmima2=document.form1.querenmima.value;
	if(xinmima!=xinmima2){
		alert("两次新密码输入不一致");
		return false;
	}else
	return true;
	
}

</script>
<div class="body"><form id="form1" name="form1" method="post" action="<%=request.getContextPath() %>/alterUser" onsubmit="return onJudge();">
  <table width="385">
    <tr>
      <td>原密码：</td>
    </tr>
    <tr>
      <td><label for="yuanmima"></label>
        <input type="password" name="yuanmima" id="yuanmima" /></td>
    </tr>
    <tr>
      <td>新密码:</td>
    </tr>
    <tr>
      <td><label for="xinmima"></label>
        <input type="password" name="xinmima" id="xinmima" /></td>
    </tr>
    <tr>
      <td>确认新密码</td>
    </tr>
    <tr>
      <td><label for="querenmima"></label>
        <input type="password" name="querenmima" id="querenmima" /></td>
    </tr>
    <tr>
      <td height="45"><input type="submit" name="button" id="AlterSystemUser_Button" value="提交" />
    </td>
    </tr>
  </table>  </form>
</div>
</body>
</html>
