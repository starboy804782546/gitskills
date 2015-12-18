<%@page import="com.shop.shangpinguanli.FenleiBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.shop.shangpinguanli.FenleiManager"%>
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
	border-top-left-radius: 6px;border-top-right-radius: 6px;
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
				alert("请选择要删除的商品分类");
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
			FenleiManager manager = new FenleiManager();
			ArrayList list = manager.getAll();
		%>
		<div class="body"><div class="huixian"><%= request.getAttribute("xinxi")==null?"":request.getAttribute("xinxi")%></div>
					<form id="form1" name="form1" method="post"
						onsubmit="return zeroCheck();"
						action="<%=request.getContextPath()%>/typeDelete.shangpin">
						<div class="li">
							<input type="submit" class="button" style="border: 0px;"
								value="删除">
								<a href="<%=request.getContextPath()%>/jsp/h_fenleiadd.jsp" class="button">添加</a>
						</div>
						<div class="content">

							<table width="1119" align="center"
								class="table table-bordered table-hover table-striped">
								<tr></tr>

								<tr>
									<td width="25" height="30"><strong> <input
											type="checkbox" id="quanxuan" onclick="onquanxuan()" />
									</strong></td>
									<td width="500"><strong>分类名称</strong></td>
                                    <td><strong>排序等级</strong></td>
                                    <td><strong>是否导航</strong></td>
									<td width="250"><strong>操作</strong></td>
                                   
								</tr>
								<%
									for (int i = 0; i < list.size(); i++) {
								%>
								<tr>
									<td><input type="checkbox" name="checkbox"
										value="<%=((FenleiBean) list.get(i)).getId()%>" /></td>
									<td height="25"><%=((FenleiBean) list.get(i)).getType()%></td>
                                    <td><%=((FenleiBean) list.get(i)).getDengji()%></td>
                                    <%
                                    String bool;
                                    	if(((FenleiBean) list.get(i)).getIsview()==1)
                                    		bool="是";
                                    	else bool="否";
                                    %>
                                    <td><%=bool%></td>
                                    
									<td><a href="<%=request.getContextPath()%>/jsp/h_fenleiedit.jsp?id=<%=((FenleiBean) list.get(i)).getId()%>" class="button1">修改 </a><span></span><a
										href="<%=request.getContextPath()%>/typeDeleteOne.shangpin?id=<%=((FenleiBean) list.get(i)).getId()%>"
										class="button1">删除</a></td>
								</tr>
								<%
									}
								%>
								<tr>
									<td colspan="5">第一页 1 2 3 4</td>
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
