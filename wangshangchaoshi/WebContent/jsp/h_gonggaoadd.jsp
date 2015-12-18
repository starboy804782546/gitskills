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
				<strong> 公告列表</strong>
			</div>
		</div>
		<!-- body_stat -->
		<form id="form4" name="form4" method="post"
			action="<%=request.getContextPath()%>/GonggaoAdd">
			<table width="1000px" border="1">
				<tr>
					<td align="center" valign="middle"><input value="请输入标题"
						name="biaoti" type="text" id="web" style="width: 1000px;"/></td>
				</tr>
				<tr>
					<td align="center" valign="middle">
						<p>
							<textarea name="neirong" id="nb" cols="100" rows="20"
								style="width: 1000px;"></textarea>
						</p>

					</td>
				</tr>
				<tr>
					<td align="right">

						<p>
							时间 <label for="tnb"></label> <input name="shijian" type="text"
								id="tnb" value="请输入时间" />
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
