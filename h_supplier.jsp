<%@page import="com.shop.h_supplier.SupplierBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.shop.h_supplier.SupplierManager"%>
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
				alert("请选择要删除的供应商名称");
				return false;
			}
			return true;

		}
	</script>


	<div class="right" id="mainFrame">

		<div class="right_cont">
			<ul class="breadcrumb">
				当前位置：
				<a href="#">首页</a>
				<span class="divider">/</span>供应商列表
				<a href="#"></a>
				<span class="divider">/</span> 供应商管理
			</ul>

			<div class="title_right">
				<strong>供应商管理</strong>
			</div>
		</div>
		<!-- body_stat -->

		<div class="body">
			<form id="form1" name="form1" method="post"
				onsubmit="return zeroCheck();"
				action="<%=request.getContextPath()%>/typeDelete1">
				<div class="li">
					<input type="submit" class="button" style="border: 0px;" value="删除">
				</div>


				<div class="content">

					<table width="1118" align="center"
						class="table table-bordered table-hover table-striped">
						<tr></tr>

						<tr>
							<td width="25" height="30"><strong> <input
									type="checkbox" id="quanxuan" onclick="onquanxuan()" />
							</strong></td>
							<td width="300"><strong>供应商名称</strong></td>
							<td width="300"><strong>供应商地址</strong></td>
							<td><strong>供应商电话</strong></td>
							<td><strong>老板名</strong></td>
							<td width="250"><strong>操作</strong></td>

						</tr>
						<%
							SupplierManager manager = new SupplierManager();
							ArrayList list = manager.getAll();
						%>
						<%
							for (int i = 0; i < list.size(); i++) {
						%>
						<tr>
							<td><input type="checkbox" name="checkbox"
								value="<%=((SupplierBean) list.get(i)).getId()%>" /></td>
							<td height="25"><%=((SupplierBean) list.get(i)).getSuname()%></td>
							<td><%=((SupplierBean) list.get(i)).getSuaddress()%></td>
							<td><%=((SupplierBean) list.get(i)).getSutelephone()%></td>
							<td><%=((SupplierBean) list.get(i)).getSuperson()%></td>


							<td><a href="#" class="button1">修改 </a><span></span><a
								href="<%=request.getContextPath()%>/typeDelete1?SUno=<%=((SupplierBean) list.get(i)).getId()%>"
								class="button1">删除</a></td>
						</tr>
						<%
							}
						%>
						<tr>
							<td colspan="6">第一页 1 2 3 4</td>
						</tr>
					</table>
				</div>
				<!--content_end-->
			</form>

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
