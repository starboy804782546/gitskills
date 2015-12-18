<%@page import="com.shop.gonggaoguanli.UserGonggaoguanli"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.shop.gonggaoguanli.User"%>
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
				<a href="#">首页</a>
				<span class="divider">/</span>公告管理
				<a href="#"></a>
				<span class="divider">/</span> 公告列表
			</ul>

			<div class="title_right">
				<strong>公告列表</strong>
			</div>
		</div>

		<%
			
		%>
		<!-- body_stat -->
		<form id="form4" name="form4" method="post"
			action="<%=request.getContextPath()%>/Gonggaoupdate">
			<%
				int id = Integer.parseInt(request.getParameter("id")==null?"-1":request.getParameter("id"));
				UserGonggaoguanli guanli = new UserGonggaoguanli();
				ArrayList list = guanli.getOne(id);
			%>
			<table width="550" border="1">
				<tr>
					<td><input type="hidden" name="bianhao"
						value="<%=((User) list.get(0)).getBianhao()%>" /></td>
				</tr>
				<tr>
					<td align="center" valign="middle"><label></label> <label
						for="web"></label> <input
						value="<%=((User) list.get(0)).getBiaoti()%>" name="biaoti"
						type="text" id="web" onfocus="MM_setTextOfTextfield('web','','')" />

					</td>
				</tr>
				<tr>
					<td align="center" valign="middle">
						<p>
							<label for="nb"></label>
							<textarea name="neirong" id="nb" cols="100" rows="20"
								value="<%=((User) list.get(0)).getNeirong()%>"><%=((User) list.get(0)).getNeirong()%></textarea>
						</p>
						<p>&nbsp;</p>
					</td>
				</tr>
				<tr>
					<td align="right">
						<p>
							<label></label>
						</p>
						<p>
							时间 <label for="tnb"></label> <input name="shijian" type="text"
								id="tnb" onfocus="MM_setTextOfTextfield('tnb','','')"
								value="<%=((User) list.get(0)).getShijian()%>" />
						</p>
					</td>
				</tr>
				<tr>
					<td align="center">
						<p>
							<input type="submit" name="lnb" id="lnb" value="提交" />
						</p>

					</td>
				</tr>
			</table>
		</form>

		<!--body_end-->
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
