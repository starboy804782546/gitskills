<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage="" pageEncoding="utf-8"%>
<%@page import="com.shop.gonggaoguanli.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.shop.gonggaoguanli.UserGonggaoguanli"%>
<%@page import="com.shop.shangpinguanli.FenleiBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.shop.shangpinguanli.*"%>
<%@page import="com.shop.sousuo.SousuoManager"%>

<%
	String User = (String) session.getAttribute("User");
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>前台首页</title>
<script type="text/javascript" src="<%=path%>/js/lrtk.js"></script>
<link href="<%=path%>/style/index.css" rel="stylesheet" type="text/css" />
<style type="text/css">
body, td, th {
	font-family: "微软雅黑";
}
</style>
<link href="<%=path%>/style/csslunbo.css" rel="stylesheet"
	type="text/css" />
</head>

<body>
	<div class="head_top_outboard">
		<div class="head_board">
			<div class="denglu">
				<%
					if (User == "" || User == null) {
				%>
				<span>欢迎来到XXX网上超市！ </span>
				<%
					} else {
				%>
				<span>欢迎<%=User%>来到XXX网上超市！
				</span>
				<%
					}
				%>
				<p>
					<a href="#" class="a">登录 </a>/<a href="#" class="a"> 注册</a>
				</p>
			</div>
			<div class="dingdan">
				<a href="<%=path%>/jsp/kehuziliao.jsp">个人中心</a>
			</div>
		</div>
		<div class="logo_board">
			<div class="logoDiv">
				<a href="#"><img src="<%=path%>/img/logo3.png" width="240"
					height="130" /></a>
			</div>
			<div class="sousuoDiv">
				<div class="sousuo">
					<form id="formSousuo" name="formSousuo" method="post"
						action="<%=path%>/sousuo.sousuo">
						<input type="text" name="sousuo" id="sousuo" />
					</form>
				</div>
				<div class="sousuobuttonDiv">
					<a href="#"
						onclick="document.getElementById('formSousuo').submit();">查找</a>
				</div>
			</div>
			<div class="gouwucheDiv" id="goTop">
				<a href="#" class="gouwucheButton">购物车(0)</a>
			</div>
		</div>

	</div>
	<div class="menu_board_out">
		<div class="menu_board">
			<div class="suoyoufenlei">
				<a href="#" class="sousuofenlei_a">所有分类<span class="span1">≡</span></a>
			</div>
			<a href="<%=request.getContextPath() %>/jsp/index.jsp" class="daohang">首页</a>
		</div>
	</div>
	<div class="body_body">
		<div class="lunbo_menu_gonggao">
			<div class="lb_menu">
				<%
					FenleiManager manager = new FenleiManager();
					ArrayList<FenleiBean> fenlei = manager.getAll();
				%>
				<%
					for (int i = 0; i < fenlei.size(); i++) {
				%>
				<a href="<%=path %>/fenlei.sousuo?id=<%=fenlei.get(i).getId()%>"><%=((FenleiBean) fenlei.get(i)).getType()%></a>
				<%
					}
				%>
			</div>
			<!--lb_menu_end-->


			<!----------------焦点图--------------->
			<div style="float: left; height: 398px;">
				<div id="playBox">
					<div class="pre"></div>
					<div class="next"></div>
					<div class="smalltitle">
						<ul>
							<li class="thistitle"></li>
							<li></li>
							<li></li>
							<li></li>
							<li></li>
							<li></li>
						</ul>
					</div>
					<ul class="oUlplay">
						<li><a href="" target="_blank"><img
								src="<%=path%>/img/1.jpg" /></a></li>
						<li><a href="" target="_blank"><img
								src="<%=path%>/img/2.jpg" /></a></li>
						<li><a href="" target="_blank"><img
								src="<%=path%>/img/3.jpg" /></a></li>
						<li><a href="" target="_blank"><img
								src="<%=path%>/img/4.jpg" /></a></li>
						<li><a href="" target="_blank"><img
								src="<%=path%>/img/5.jpg" /></a></li>
						<li><a href="" target="_blank"><img
								src="<%=path%>/img/6.jpg" /></a></li>
					</ul>
				</div>
			</div>
			<!----------------焦点图--------------->

			<%
				UserGonggaoguanli guanli = new UserGonggaoguanli();
				ArrayList<User> list = guanli.tengonggao();
			%>
			<div class="gonggao">
				<div class="gonggao_head">公告</div>
				<%
					for (int i = 0; i < list.size(); i++) {
				%>
				<li><a href="#"><%=((User) list.get(i)).getNeirong()%></a></li>

				<%
					}
					int count = 1;
				%>
			</div>
		</div>
		<%
			for (int i = 0; i < fenlei.size(); i++) {
		%>
		<div class="list_out">
			<div class="list_head">

				<h3><%=count++%>F
					<%=((FenleiBean) fenlei.get(i)).getType()%></h3>
			</div>
			<div class="list_body">
				<!--list_body_satrt-->
				<%
					SousuoManager sousuomanager = new SousuoManager();
						ArrayList<ShangpinBean> shangpinlist = sousuomanager.getTen(((FenleiBean) fenlei.get(i)).getId());
				%>
				<%
					for (ShangpinBean bean : shangpinlist) {
				%>
				<div class="list_nr_bodar">
					<div class="nr_tu"> <a href="<%=path %>/xiangxi.sousuo?id=<%=bean.getId()%>"><img src="<%=bean.getTupian()%>" width="174" height="167" /></a>
						<div class="nr_nr">
						  <span class="nr_spam"><a href="<%=path %>/xiangxi.sousuo?id=<%=bean.getId()%>"><%=bean.getName()%><span
									class="nr_jiage"><%=bean.getShoujia()%>元</span></a></span>
						</div>
					</div>
				</div>
				<%
					}
				%>
				<!--list_body_end-->
			</div>




			<!--list_body_end-->
		</div>
	</div>
	<%
		}
	%>
	</div>
	<p align="right">
		<a href="#goTop" name="bottom" style="margin-right: 80px;">返回顶部↑</a>
	</p>
	<%@ include file="footer.jsp"%>
</body>
</html>