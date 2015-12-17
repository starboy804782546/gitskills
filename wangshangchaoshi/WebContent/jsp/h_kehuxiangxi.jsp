<%@page import="com.shop.usermanager.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.shop.usermanager.UserManager"%>
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
	<script type="text/javascript">
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
				alert("请选择要删除的客户资料");
				return false;
			}
			return true;

		}
	</script>
	<div class="right" id="mainFrame">

		<div class="right_cont">
			<ul class="breadcrumb">
				当前位置：
				<a href="h_index.jsp">首页</a>
				<span class="divider">/</span>客户管理
				<a href="#"></a>
				<span class="divider">/</span> 详细信息
			</ul>
			<form action="">
				<table width="1118" align="center"
					class="table table-bordered table-hover table-striped">

					<%
						String zhanghao = request.getParameter("id");
						UserManager manager = new UserManager();
						ArrayList<User> Onelist = manager.findOneUser(zhanghao);
					%>
					<%
						for (int i = 0; i < Onelist.size(); i++) {
					%>
		
					<tr >
						<td width = "20%"><strong>帐号:</strong></td>
						<td height="25"><%=Onelist.get(i).getZhanghao()%></td>
					</tr>
					<tr>
						<td><strong>密码:</strong></td>
						<td><%=Onelist.get(i).getMima()%></td>
					</tr>
					<tr>
						<td><strong>姓名:</strong></td>
						<td><%=Onelist.get(i).getXingming()%></td>
					</tr>
					<tr>
						<td><strong>电话:</strong></td>
						<td><%=Onelist.get(i).getDianhua()%></td>
					</tr>
					<tr>
						<td><strong>地址1:</strong></td>
						<td><%=Onelist.get(i).getDizhi()%></td>
					</tr>
					<tr>
						<td><strong>地址2:</strong></td>
						<td><%=Onelist.get(i).getDizhi1()%></td>
					</tr>
					<tr>
						<td><strong>地址3:</strong></td>
						<td><%=Onelist.get(i).getDizhi2()%></td>
					</tr>
					<tr>
						<td><strong>备注:</strong></td>
						<td><%=Onelist.get(i).getBeizhu()%></td>
					</tr>
					<%
						}
					%>
				</table>
			</form>
		</div>
		<!-- body_stat -->

	</div>
	<!--div1_end-->
	<script>
		function onType() {
			var odiv1 = document.getElementById('div1');
			var obutton = document.getElementsByName('input');
			var odiv = document.getElementsByName('div2');
			for (var i = 0; i < obutton.length; i++) {
				obutton[i].index = i;
				obutton[i].onclick = function() {
					for (var j = 0; j < obutton.length; j++) {
						obutton[j].className = 'button';
						odiv[j].style.display = 'none';
					}
					this.className = 'button_active';
					odiv[this.index].style.display = 'block';
				}
			}
		}
	</script>
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
		var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
	</script>
</body>
</html>
