<%@page import="com.shop.systemadmin.SaveUser"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.shop.systemadmin.UserGuanli"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网上超市销售系统</title>
<%@ include file="/jsp/h_link.jsp"%>
<style type="text/css">
#Del {
	color: #FFF;
	border:0px;
	background-color: #38A3D5;
}
#Del:hover {
	background-color: #207197;
}
</style>
</head>

<body>

<jsp:include page="/jsp/h_head.jsp"/>
<!-- 顶部 -->     
            
<div id="middle">
     <div class="left">
     
     <script type="text/javascript">
var myMenu;
window.onload = function() {
	myMenu = new SDMenu("my_menu");
	myMenu.init();
};
</script>

<%@ include file="/jsp/h_LeftMenu.jsp" %>
<!-- 引用左侧菜单 -->
    
</div>

     </div>
     <div class="Switch"></div>
     <script type="text/javascript">
	$(document).ready(function(e) {
    	$(".Switch").click(function(){
		$(".left").toggle();
		});
	});
</script>
<div class="right"  id="mainFrame">
     
     <div class="right_cont">
<ul class="breadcrumb">
  当前位置：
  <a href="#">首页</a> <span class="divider">/</span>数据统计<a href="#"></a> <span class="divider">/</span>
  商品数据分析
 
</ul>
   
   <div class="title_right"><strong>商品数据分析</strong>
 
   </div>  
   </div>
     <!-- body_stat -->
     
     <div class="body ">
        <table width="200" border="0"class="table table-bordered table-hover table-striped">
     <form id="form1" name="form1" method="post" onsubmit="return onJudge();" action="<%=request.getContextPath() %>/AdminAddUser">
       <tr>
         <td>用户名：</td>
       </tr>
       <tr>
         <td>
           <label for="Aname"></label>
           <input type="text" name="Aname" id="Aname" size="40"  height="25"/>
         </td>
       </tr>
       <tr>
         <td>密码：</td>
       </tr>
       <tr>
         <td>
           <label for="Apasswd"></label>
           <input type="text" name="Apasswd" id="Apasswd"  size="40" height="25"/>
       </td>
       </tr>
       <tr>
         <td>确认密码：</td>
       </tr>
       <tr>
         <td>
           <label for="Aqueren"></label>
           <input type="text" name="Aqueren" id="Aqueren"  size="40"  height="25"/>
         </td>
       </tr>
       <tr>
         <td>
           <input type="submit" name="zhuce" id="zhuce" value="注册"  />
         </td>
       </tr></form>
     </table> 
     </div>
     <script language="javascript">
function onJudge(){
	var Apasswd=document.form1.Apasswd.value;
	var Aqueren=document.form1.Aqueren.value;
	var user=document.form1.Aname.value;
	if(user.length==0){
		alert("账号不能为空");
		return false;
	}
	
	if(Apasswd.length==0){
		alert("密码不能为空");
		return false;
	}
	if(Apasswd!=Aqueren){
		alert("两次新密码输入不一致");
		return false;
	}else
	return true;
	
}

</script>
     <!--body_end-->
    </div>
    
<!-- 底部 -->
<%@ include file="/jsp/h_footer.jsp" %>
    
    

 <script>
!function(){
laydate.skin('molv');
laydate({elem: '#Calendar'});
laydate.skin('molv');
laydate({elem: '#Calendar2'});
}();
 
</script>



 
</body>
</html>
