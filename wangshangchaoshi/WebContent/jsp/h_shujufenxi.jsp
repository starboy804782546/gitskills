
<%@page import="com.shop.xiaoshoutongji.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.shop.xiaoshoutongji.Xiaoshoutongji"%>
<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网上超市销售系统</title>
<%@ include file="h_link.jsp"%>
</head>

<body>

	<jsp:include page="../jsp/h_head.jsp" />
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

			<%@ include file="../jsp/h_LeftMenu.jsp"%>
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
				<a href="<%=request.getContextPath()%>/index?id=h_sy">首页</a>
				<span class="divider">/</span>数据统计
				<a href="#"></a>
				<span class="divider">/</span> 商品数据分析
			</ul>

			<div class="title_right">
				<strong>商品数据分析</strong>
			</div>



			<div style="width: 900px; margin: auto">
				<form id="form2" name="form2" method="post"
					action="<%=request.getContextPath()%>/jsp/h_shujufenxi.jsp">
					<span style="padding-left: 10px; padding-right: 10px;">选择商品名称：</span>
					<input name="chaxun" type="text" id="chaxun"
						style="width: 200px; height: 20px;" /> <input type="submit"
						value="查询" />

					<table class="table table-bordered table-hover table-striped">
						<tbody>
							<%
							
								if (request.getParameter("chaxun") == null || request.getParameter("chaxun").equals("")) {
									Xiaoshoutongji tongji = new Xiaoshoutongji();
									ArrayList<User> list = tongji.Allxiaoshou();
							%>
							<tr align="center">
								<td><strong>No</strong></td>
								<td><strong>商品名称</strong></td>
								<td><strong>总进货量</strong></td>
								<td><strong>总销售量</strong></td>
								<td><strong>销售额</strong></td>
								<td><strong> </strong></td>
							</tr>
							<%
								for (int i = 0; i < list.size(); i++) {
							%>
							<tr align="center">
								<td><%=i + 1%></td>
								<td><%=list.get(i).getPname()%></td>
								<td><%=list.get(i).getSPnumber()%></td>
								<td><%=list.get(i).getOquantity()%></td>
								<td><%=list.get(i).getOsum()%></td>
								
							</tr>
							<%
								}
								} else {
									String pname = request.getParameter("chaxun");
									Xiaoshoutongji tongji = new Xiaoshoutongji();
									ArrayList<User> Onelist = tongji.findOnexiaoshou(pname);

							%>
							<tr align="center">
								<td><strong>No</strong></td>
								<td><strong>商品名称</strong></td>
								<td><strong>总进货量</strong></td>
								<td><strong>总销售量</strong></td>
								<td><strong>销售额</strong></td>
								<td><strong> </strong></td>
							</tr>
							<%
							
								for (int i = 0; i < Onelist.size(); i++) {
									
									
							%>
							<tr align="center">
								<td><%=i + 1%></td>
								<td><%=Onelist.get(i).getPname()%></td>
								<td><%=Onelist.get(i).getSPnumber()%></td>
								<td><%=Onelist.get(i).getOquantity()%></td>
								<td><%=Onelist.get(i).getOsum()%></td>
								
							</tr>
							<%
								}
								}
							%>
						</tbody>
					</table>
				</form>
				
			</div>
		</div>
	</div>
	<!-- body -->
	</div>

	<!-- 底部 -->
	<%@ include file="../jsp/h_footer.jsp"%>



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
	</script>




</body>
</html>

