<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage="" pageEncoding="utf-8"%>
<%@ page import="com.shop.sousuo.SousuoManager"%>
<%@ page import="com.shop.shangpinguanli.ShangpinBean"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%@ include file="link.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="head.jsp"%>
	<%
		if (request.getAttribute("list") == null) {
			ArrayList<ShangpinBean> list = (ArrayList<ShangpinBean>) request.getAttribute("list");
	%>
	<!--body_start-->
	<div class="list_body_out">
		<div class="list_body2">
			<div class="dangqianweizhi">当前位置： ${weizhi }</div>
			<div class="paixu_boday">
				<span class="paixuwenzi"><strong>排序：</strong></span>
				<div class="xiaoliang">
					<a href="#">销量</a>
				</div>
				<div class="xiaoliang">
					<a href="#">价格</a>
				</div>
				<div class="yeshudiv">
					共<span class="fontred">0</span>个商品
				</div>
			</div>
			<%
				}
			%>
			<!-- body_start -->
			<%
				if (request.getAttribute("list") != null) {
					ArrayList<ShangpinBean> list = (ArrayList<ShangpinBean>) request.getAttribute("list");
			%>
			<!--body_start-->
			<div class="list_body_out">
				<div class="list_body2">
					<div class="dangqianweizhi">当前位置： ${weizhi }</div>
					<div class="paixu_boday">
						<span class="paixuwenzi"><strong>排序：</strong></span>
						<div class="xiaoliang">
							<a href="#">销量</a>
						</div>
						<div class="xiaoliang">
							<a href="#">价格</a>
						</div>
						<div class="yeshudiv">
							共<span class="fontred"><%=list.size()%></span>个商品
						</div>
					</div>



					<!--shangpinList-->

					<div class="shangpinListBody">
						<%
							for (ShangpinBean bean : list) {
						%>
						<div class="list_boder">
							<div class="tu">
								<a href="<%=path %>/xiangxi.sousuo?id=<%=bean.getId()%>"><img src="<%=bean.getTupian()%>"
									width="230px" height="230" /></a>
							</div>
							<div class="shangpinname"><%=bean.getName()%></div>
							<div class="jiage">
								￥<%=bean.getShoujia()%></div>
							<div class="jiarugouwuche">
								<a href="<%=path %>/xiangxi.sousuo?id=<%=bean.getId()%>" class="gouwucheButton">加入购物车</a>
							</div>

						</div>
						<%
							}
							}
						%>
					</div>
					<!--shangpinList_end-->



					<!--body_end-->
				</div>
			</div>


			<!-- body_end -->
			<%@ include file="footer.jsp"%>
</body>
</html>