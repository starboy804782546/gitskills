<%@page import="com.shop.usermanager.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.shop.usermanager.UserManager"%>
<%@ page contentType="text/html; charset=utf-8" language="java" 
	import="java.sql.*" errorPage=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网上超市销售系统</title>
<%@ include file="h_link.jsp"%>
<style type="text/css">
.body {
	margin: auto;
	font-size: 14px;
	width: 1118px;
}

body .button {
	text-decoration: none;
	color: #FFF;
	display: block;
	height: 30px;
	width: 60px;
	line-height: 30px;
	text-align: center;
	background-color: #38A3DA;
	margin-right: 10px;
	border-top-left-radius: 6px;
	border-top-right-radius: 6px;
	font-size: 16px;
	font-weight: bold;
	float: left;
	border: 0px;
}

.body .content {
	float: left;
	width: 1118px;
}

.button:hover {
	color: #FFF;
	background-color: #16577A;
}

.body table tr td {
	text-align: center;
}

.body .button1 {
	margin-right: 5px;
	margin-left: 5px;
	text-decoration: none;
}

#mainFrame .body .li {
	float: left;
	text-align: left;
	width: 1118px;
}
</style>
<script
	src="<%=request.getContextPath()%>jsp/SpryAssets/SpryTabbedPanels.js"
	type="text/javascript"></script>

</head>

<body>

	<jsp:include page="/jsp/h_head.jsp" />
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

			<%@ include file="/jsp/h_LeftMenu.jsp"%>
			<!-- 引用左侧菜单 -->

		</div>

	</div>
	<div class="Switch"></div>
	<script type="text/javascript">
		$(document).ready(function(e) {
			$(".Switch").click(function() {
				$(".left").toggle();
			});
		});
	</script>

	<div class="right" id="mainFrame">

		<div class="right_cont">
			<ul class="breadcrumb">
				当前位置：
				<a href="#">首页</a>
				<span class="divider">/</span>充值
				<a href="#"></a>
				<span class="divider">/</span> 客户充值
			</ul>

		</div>
		<!-- body_stat -->
<script language="javascript">
function onJudge(){

	var zh=document.form3.usr.value;
	var zh2=document.form3.usr2.value;
	if(zh!=zh2){
		alert("两次输入的账号不相同");
		return false;
	}else
	return true;
	
}

function isnull(){
	var usr = document.getElementById('usr').value;
	if (usr == ""||usr==null) {
		alert("账号不能为空");
		return false;
	}
	return true;
}

function money1(){
	
	var money = document.getElementById("money").value;
		  if(money<=0) {
			  alert("充值金额只能大于0");
			  return false;
		  }
		  return true;
}

</script>
	<center style="color: red; display:block; height:30px;width:900px;"  >${xinxi }</center>
				
					<table width="800" align="center"
						class="table table-bordered table-hover table-striped">
					
						
						
			<form id="form3" name="form3" method="post"
						action="<%=request.getContextPath()%>/chongzhimoney" onsubmit="return isnull()&&onJudge();">
						&nbsp;&nbsp;<span>请输入充值账号:</span>
						<input name="usr" type="text" id="usr" style="width: 200px; height: 20px;" /> &nbsp; 
						<br>
						&nbsp;&nbsp;<span>请确认充值账号:</span>
						<input name="usr2" type="text" id="usr2" style="width: 200px; height: 20px;" /> &nbsp; 
						<br>
						&nbsp;&nbsp;<span>请输入充值金额:</span>
						<input name="money" type="text" id="money" style="width: 125px; height: 20px;" />
						<span>元</span> &nbsp;
						<input type="submit" value="充值" onclick="return money1();" />
						
				
					</form>
	

		<!--div1_end-->
		
	</div>
	<!--body_end-->
	</div>

	<!-- 底部 -->
	<%@ include file="/jsp/h_footer.jsp"%>




</body>
</html>
