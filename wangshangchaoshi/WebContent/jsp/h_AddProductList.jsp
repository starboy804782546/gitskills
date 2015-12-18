<%@page import="com.shop.shangpinguanli.FenleiBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.shop.shangpinguanli.FenleiManager"%>
<%@page import="com.shop.shangpinguanli.GongyingshangManager"%>
<%@page import="com.shop.shangpinguanli.GongyingshangBean"%>
<%@page import="com.shop.shangpinguanli.ListManager"%>
<%@page import="com.shop.shangpinguanli.ListBean"%>
<%@page import="com.shop.shangpinguanli.SousuoBean"%>
<%@page import="com.shop.kucun.NumberShangpinManager"%>
<%@page import="com.shop.kucun.NumberShangpinBean"%>
<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="h_link.jsp"%>
<title>网上超市销售系统</title>

<style type="text/css">
.body {
	margin: auto;
	font-size: 14px;
	width: 1118px;
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

.body .button2 {
	text-decoration: none;
	color: #FFF;
	height: 30px;
	width: 60px;
	line-height: 30px;
	text-align: center;
	background-color: #38A3DA;
	font-size: 16px;
	font-weight: bold;
	display: inline;
	padding-right: 10px;
	padding-left: 10px;
	padding-top: 5px;
	padding-bottom: 5px;
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
	margin-bottom: 20px;
	background-color: #DDD;
	line-height: 50px;
}

#mainFrame .body .sousuo2 {
	float: left;
	width: auto;
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
				<span class="divider">/</span>库存管理
				<a href="#"></a>
				<span class="divider">/</span> 商品入库
			</ul>

			<div class="title_right">
				<strong>商品列表</strong>
			</div>
		</div>
		<!-- body_stat -->
		<%
			FenleiManager fenleimanager = new FenleiManager();
			GongyingshangManager gongyingshangmanager = new GongyingshangManager();
			ArrayList fenlei = fenleimanager.getAll();
			ArrayList gongyingshang = gongyingshangmanager.getAll();
			ArrayList shangpinlist=null;
			if (request.getAttribute("jieguo") != null) {
				shangpinlist = (ArrayList) request.getAttribute("jieguo");
			} else {

				SousuoBean sousuobean = new SousuoBean();
				shangpinlist = new ListManager().sousuoGet("%%", "%%", "%%");
			}
		%>
		<div class="body">
			<form id="sousuoform" name="sousuoform" method="post"
				action="<%=request.getContextPath()%>/kucunsousuo.kucun">
				<div class="sousuo">
					<div class="sousuo2">
						<span style="padding-left: 10px; padding-right: 10px;">按分类查看</span>
						<select id="fenlei" name="fenlei" size="0"
							style="width: 150px; height: 30px;">
							<option value="全部">全部</option>
							<%
								for (int i = 0; i < fenlei.size(); i++) {
							%>
							<option value="<%=((FenleiBean) fenlei.get(i)).getType()%>">
								<%=((FenleiBean) fenlei.get(i)).getType()%></option>
							<%
								}
							%>
						</select>
					</div>
					<div class="sousuo2">
						<span style="padding-left: 10px; padding-right: 10px;">按供应商查看</span>
						<select name="gongyingshang" size="0"
							style="width: 150px; height: 30px;" id="gongyingshang"
							name="gongyingshang">
							<option value="全部"
								onclick="document.getElementById('sousuoform').submit();">全部</option>
							<%
								for (int i = 0; i < gongyingshang.size(); i++) {
							%>
							<option
								value="<%=((GongyingshangBean) gongyingshang.get(i)).getName()%>">
								<%=((GongyingshangBean) gongyingshang.get(i)).getName()%></option>
							<%
								}
							%>
						</select>

					</div>
					<div class="sousuo2">
						<span style="padding-left: 10px; padding-right: 10px;">按名称查找</span>
						<input name="sousuo" type="text" id="sousuo"
							style="width: 200px; height: 20px;" /> <a href="#"
							onclick="document.getElementById('sousuoform').submit();"
							class="btn btn-info    margin-right-20">查找</a>
					</div>
				</div>
			</form>
			<form id="form1" name="form1" method="post"
				onsubmit="return zeroCheck();"
				action="<%=request.getContextPath()%>/deleteshangpin.shangpin">
				<div class="li"></div>
				<div class="content">

					<table width="1118" align="center"
						class="table table-bordered table-hover table-striped">
						<tr>
							<td height="30"><strong>商品名称</strong></td>
							<td width="10%"><strong>数量</strong></td>
							<td width="15%"><strong>商品类别</strong></td>
							<td width="15%"><strong>供应商</strong></td>
							<td width="15%"><strong>操作</strong></td>

						</tr>
						<%
							for (int i = 0; i < shangpinlist.size(); i++) {
						%>
						<tr>
							<td><%=((ListBean) shangpinlist.get(i)).getName()%></td>
							<td>
<%ArrayList<NumberShangpinBean> shuliang = new NumberShangpinManager().getOne(((ListBean) shangpinlist.get(i)).getId());
if(shuliang.size()==0){
	out.print("0");
}else{
%>
							<%=((NumberShangpinBean) shuliang.get(0)).getNumber()%><%} %>
							</td>
							<td><%=((ListBean) shangpinlist.get(i)).gettype()%></td>
							<td><%=((ListBean) shangpinlist.get(i)).getGongyingshang()%></td>


							<td><a
								href="<%=request.getContextPath()%>/jsp/h_AddProductNumber.jsp?id=<%=((ListBean) shangpinlist.get(i)).getId()%>">增加数量</a></td>
						</tr>
						<%
							}
						%>
						<tr>
							<td colspan="4">第一页 1 2 3 4</td>
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
		function onSelect() {
			var fenlei = document.getElementById('fenlei');
			var gongyingshang = document.getElementById('gongyingshang');
		}
	</script>




</body>
</html>
