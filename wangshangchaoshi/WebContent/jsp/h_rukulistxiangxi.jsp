<%@page import="com.shop.repertory.RepertoryBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.shop.repertory.RepertoryManager"%>
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
				<span class="divider">/</span>仓库管理
				<a href="#"></a>
				<span class="divider">/</span> 入库单
			</ul>

			<div class="title_right">
				<strong>入库单</strong>
			</div>
		</div>
		<!-- body_stat -->
					

        </select>
     <form id="form2" name="form2" method="post"
			action="<%=request.getContextPath()%>/jsp/h_rukulistxiangxi.jsp">
	<span style="padding-left:10px;padding-right:10px;">搜索框</span>
          <input name="sousuo" type="text" id="sousuo" style="width:200px; height:20px;"/>
          <input type="submit" value="搜索" />
        

		</form>

		<div class="body">
			<form id="form1" name="form1" method="post">
				
	


				<div class="content">

					<table width="1118" align="center"
						class="table table-bordered table-hover table-striped">
						<tr></tr>
 
						<%
							
								String no = request.getParameter("id");
						if(no==null)
							response.sendRedirect("h_rukulist.jsp");
								RepertoryManager manager = new RepertoryManager();
								ArrayList Onelist = manager.findOne(no);
						%>

						<%
							for (int i = 0; i < Onelist.size(); i++) {
								
						%>
						<tr>
							
							
							<tr >
								<td ><strong>入库编号</strong></td>
								<td><%=((RepertoryBean) Onelist.get(i)).getRukuno()%></td>
							</tr>
							<tr >
								<td ><strong>商品名</strong></td>
								<td><%=((RepertoryBean) Onelist.get(i)).getPname()%></td>
							</tr>
							
							<tr >
							<td ><strong>类别名</strong></td>
							<td><%=((RepertoryBean) Onelist.get(i)).getPTname()%></td>
							</tr>
							<tr >
							<td><strong>单位</strong></td>
							<td><%=((RepertoryBean) Onelist.get(i)).getDWname()%></td>
							</tr>
							<tr >
							<td><strong>入库数量</strong></td>
							<td><%=((RepertoryBean) Onelist.get(i)).getNumber()%></td>
							</tr>
							<tr >
							<td><strong>进价</strong></td>
							<td><%=((RepertoryBean) Onelist.get(i)).getJinjia()%></td>
							</tr>
							<tr >
							<td><strong>总价</strong></td>
							<td><%=((RepertoryBean) Onelist.get(i)).getZongjia()%></td>
							</tr>
							<tr >
							<td><strong>供应商名</strong></td>
							<td><%=((RepertoryBean) Onelist.get(i)).getSUname()%></td>
							</tr>
							<tr >
							<td><strong>入库备注</strong></td>
							<td><%=((RepertoryBean) Onelist.get(i)).getBeizhu()%></td>
							</tr>
							<tr >
							<td><strong>入库日期</strong></td>
							<td><%=((RepertoryBean) Onelist.get(i)).getRdate()%></td>
							</tr>
							<tr >
							<td><strong>管理员名</strong></td>
							<td><%=((RepertoryBean) Onelist.get(i)).getAname()%></td>
							</tr>
							
							
						</tr>
						
					
					
						<%
							}
						%>
						<tr>
							<td colspan="11">第一页 1 2 3 4</td>
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
