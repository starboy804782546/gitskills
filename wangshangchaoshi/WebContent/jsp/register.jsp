<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" pageEncoding="utf-8"
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>欢迎来到注册页！</title>
</head>
<body   background="<%=request.getContextPath() %>/img/safadsgsfhej.jpg" >

<div> <img  src="<%=request.getContextPath() %>/img/123123122312.png" style=" margin-left:175px; margin-top:100px; width:500px; height:400px;" />
<script language="javascript">
function onJudge(){

	var psd=document.form2.password.value;
	var psd2=document.form2.password2.value;
	if(psd!=psd2){
		alert("两次密码输入不一致");
		return false;
	}else
	return true;
	
}
function isnull(){
	var zhanghao = document.getElementById('zhanghao').value;
	if (zhanghao == ""||zhanghao==null) {
		alert("账号不能为空");
		return false;
	}
	return true;
}
function namenull(){
	var username = document.getElementById('username').value;
	if (username == ""||username==null) {
		alert("姓名不能为空");
		return false;
	}
	return true;
}
</script>
<div style="margin-top:20px; margin-right:258px; width:400px; height:450px; "><%=request.getAttribute("xinxi")==null?"":request.getAttribute("xinxi") %></div>

<form id="form2" name="form2" method="post" action="<%=request.getContextPath() %>/register" onsubmit="return isnull()&&onJudge()&&namenull();">


  <div class="cc_01" style="float:right; margin-top:20px; margin-right:258px; width:400px; height:450px; " >

    <div  style=" margin-top:-350px; font-size:20px; margin-left:112px; "> 用户账号:<br/>
     <!-- 
    <div  style=" margin-top:10px; font-size:20px; margin-left:112px; "> 用户账号:<br/>
     -->
      <input type="text" name="zhanghao" id="zhanghao" style=" width:300px; height:30px; "/></div>  
     
      
      <div style="  margin-top:15px; font-size:20px;margin-left:112px;"> 密码：<br />
      <input type="password" name="password" id="password" style="width:300px; height:30px;"/> </div> 
       <div style="  margin-top:15px; font-size:20px;margin-left:112px;"> 确认密码：<br />
      <input type="password" name="password2" id="password2" style="width:300px; height:30px;"/> </div> 
        
       <div style="  margin-top:15px; font-size:20px;margin-left:112px;"> 姓名:<br />
      <input  type="text" name="username" id="username" style="width:300px; height:30px;"/> </div>  
      <div style="  margin-top:15px; font-size:20px;margin-left:112px;"> 联系电话:<br />
      <input type="text" name="phonenumber" id="phonenumber" style="width:300px; height:30px;"/> </div> 
 <!--     <div style="  margin-top:15px; font-size:20px;margin-left:112px;"> 地址:<br />
      <input type="text" name="adress" id="adress" style="width:300px; height:30px;"/> </div> 
   -->
    <div>
    <!-- 
    <input style=" margin-top:30px; width:100px; margin-left:5px;" type="submit" value="注册" />
    -->
    <button type="submit" value="注册" style=" margin-top:30px; width:100px; margin-left:200px;"> 注册</button>  
   </div>
 
</div>
</form>
</div>

</body>
<style>
.cc_01 input:hover{
	background:#ddf1fc;
	}
</style>
</html>
