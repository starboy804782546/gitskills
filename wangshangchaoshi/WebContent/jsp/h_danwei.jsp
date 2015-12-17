<%@page import="com.shop.shangpinguanli.DanweiBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.shop.shangpinguanli.DanweiManager"%>
<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
	border-radius: 6px;
	font-size: 16px;
	font-weight: bold;
	float: left;
	border: 0px;
}

.body .content {
	float: left;
	width: 1118px;
	margin: auto;
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
#mainFrame .body .sousuo {
	height: 50px;
	width: 1118px;
	background-color: #DDD;
	line-height: 50px;
}
#mainFrame .body .sousuo2 {
	float: left;
	width: auto;
}
#mainFrame .body .deleteButton {
	float: left;
	height: 38px;
	width: 60px;
	padding-top: 12px;
	border-right-width: 1px;
	border-right-style: solid;
	border-right-color: #333;
	padding-left: 5px;
}
.huixian{
line-height: 30px;
	width:1118px;
	color: #F00;
	text-align: center;
}
</style>


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
	</script><!-- <script type="text/javascript">
		function onquanxuan() {
			var id = document.getElementById('quanxuan');
			if (id.checked == true)
				checkAll();
			else
				checkNo();

		}
		function checkAll() {
			var names = document.getElementsByName("checkbox");
			var len = names.length;
			if (len > 0) {
				var i = 0;
				for (i = 0; i < len; i++) {
					names[i].checked = true;

				}
			}
		}
		function checkNo() {
			var names = document.getElementsByName("checkbox");
			var len = names.length;
			if (len > 0) {
				var i = 0;
				for (i = 0; i < len; i++) {
					names[i].checked = false;
				}
			}
		}
		function zeroCheck() {
			var names = document.getElementsByName("checkbox");
			var i;
			var bool = false;
			for (i = 0; i < names.length; i++) {
				if (names[i].checked == true) {

					bool = true;

					break;
				} else {

					bool = false;
				}

			}
			if (bool == false) {
				alert("请选择要删除的商品分类");
				return false;
			}
			return true;

		} -->
	
	</script>
	<div class="right" id="mainFrame">

		<div class="right_cont">
			<ul class="breadcrumb">
				当前位置：
				<a href="#">首页</a>
				<span class="divider">/</span>商品管理
				<a href="#"></a>
				<span class="divider">/</span> 分类管理
			</ul>

			<div class="title_right">
				<strong>分类管理</strong>
			</div>
		</div>
		<!-- body_stat -->
		<%
			DanweiManager manager = new DanweiManager();
			ArrayList list = manager.getAll();
		%>
		<div class="body">
        
        <form id="form1" name="form1" method="post"
						onsubmit="return zeroCheck();"
						action="<%=request.getContextPath()%>/adddanwei.shangpin">
        <div class="sousuo"> 
        
       
       <!-- <div class="deleteButton">  <input type="submit" class="btn btn-info margin-right-20" style="border: 0px;font-size:14px;"
								value="删除"> </div> --> 
        <div class="sousuo2"><span style="padding-left:10px;padding-right:10px;">添加单位</span>
          <input name="tianjia" type="text" id="tianjia" style="width:200px; height:20px;" size="8" onclick="clean();"/>
          <a href="#" onclick="document.getElementById('form1').submit();" class="btn btn-info margin-right-20">添加</a></div></div>
         <div class="huixian" id="huixian"><%=request.getAttribute("xinxi")==null?"":request.getAttribute("xinxi") %></div>
	<div class="content">

					  <table width="1118" align="center"
								class="table table-bordered table-hover table-striped">
								<tr></tr>
							
								<tr>
									<!-- <td width="25" height="30"><strong> <input
											type="checkbox" id="quanxuan" onclick="onquanxuan()" />
									</strong></td> -->
									<td width="650"><strong>单位名称</strong></td>
                                    
									<td width="250"><strong>操作</strong></td>
                                   </tr><%for(int i=0;i<list.size();i++){ %>
							  <tr><!--  <td><input type="checkbox" name="checkbox"
										value="%>" /></td> -->
                                   
                                    <td><%=((DanweiBean)list.get(i)).getName() %></td>
								  <td><a href="<%=request.getContextPath()%>/deldanwei.shangpin?id=<%=((DanweiBean)list.get(i)).getNo()%> " class="button1">删除</a></td>
								</tr><%} %>
								<tr>
									<td colspan="5">第一页 1 2 3 4</td>
								</tr>
							</table>
						</div>
						<!--content_end-->
					</form>

			</div>
			<!--div1_end-->
			
		</div>
		<!--body_end-->
	</div>

	<!-- 底部 -->
	<%@ include file="/jsp/h_footer.jsp"%>


	<script>
		!function() {
			laydate.skin('molv');
			laydate({
				elem : '#Calendar'
			});
			laydate.skin('molv');
			laydate({
				elem : '#Calendar2'
			});
		}();
		function clean(){
			document.getElementById("huixian").innerHTML="";
		}
	</script>




</body>
</html>
