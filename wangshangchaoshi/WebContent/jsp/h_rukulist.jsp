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
				alert("请选择要删除的入库单");
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
				<span class="divider">/</span> 入库统计
			</ul>

			<div class="title_right">
				<strong>入库统计</strong>
			</div>
		</div>
		<!-- body_stat -->
					

        </select>
     <form id="form2" name="form2" method="post"
			action="<%=request.getContextPath()%>/jsp/h_rukulist.jsp">
	<span style="padding-left:10px;padding-right:10px;">按日期进行搜索</span>
          <input name="sousuo" type="text" id="sousuo" value="格式：2015-01-01" style="width:100px; height:20px;"/>——
          <input name="sousuo2" type="text" id="sousuo2" style="width:100px; height:20px;"/>
          <input type="submit" value="搜索" />
        

		</form>

		<div class="body">
			<form id="form1" name="form1" method="post"
				onsubmit="return zeroCheck();"
				action="<%=request.getContextPath()%>/deleteall">
				
				<div class="li">
					<input type="submit" class="button" style="border: 0px;" value="删除">
				</div>


				<div class="content">

					<table width="1118" align="center"
						class="table table-bordered table-hover table-striped">
						<tr></tr>

						<%
						
							if(request.getParameter("sousuo")== null||
							    request.getParameter("sousuo").equals("")||
							    request.getParameter("sousuo2")== null||
									    request.getParameter("sousuo2").equals("")){
								RepertoryManager manager = new RepertoryManager();
								ArrayList list = manager.getAll();
						%>


						<tr>
							<td width="25" height="30"><strong> <input
									type="checkbox" id="quanxuan" onclick="onquanxuan()" />
							</strong></td>
							<td ><strong>入库编号</strong></td>
							<td ><strong>商品名</strong></td>
							<td ><strong>类别名</strong></td>
							<!-- 
							
							<td><strong>单位编号</strong></td>
							<td><strong>入库数量</strong></td>
							<td><strong>进价</strong></td>
							<td><strong>总价</strong></td>
							 -->
							<td><strong>供应商名</strong></td>
							<!-- 
							<td><strong>入库备注</strong></td>
							
							 -->
							<td><strong>入库日期</strong></td>
							<td><strong>管理员名</strong></td>
							
							<td><strong>操作</strong></td>
							
						</tr>
						
						<%
							for (int i = 0; i < list.size(); i++) {
						%>
						<tr>
							<td><input type="checkbox" name="checkbox"
						
							value="<%=((RepertoryBean) list.get(i)).getRukuno()%>" /></td>
							<td><%=((RepertoryBean) list.get(i)).getRukuno()%></td>
							<td><%=((RepertoryBean) list.get(i)).getPname()%></td>
							
							<td><%=((RepertoryBean) list.get(i)).getPTname()%></td>
							
							<td><%=((RepertoryBean) list.get(i)).getSUname()%></td>
							<td><%=((RepertoryBean) list.get(i)).getRdate()%></td>
							
							<td><%=((RepertoryBean) list.get(i)).getAname()%></td>
							
							
							<td><a
								href="<%=request.getContextPath()%>/jsp/h_rukulistxiangxi.jsp?id=<%=((RepertoryBean) list.get(i)).getRukuno()%>"
								class="button1">查看详细</a><span></span><a
								href="<%=request.getContextPath()%>/rukulistdel?id=<%=((RepertoryBean) list.get(i)).getRukuno()%>"
								class="button1">删除</a>
								
								
								</td>
						</tr>
						<%
							}
						%>
						<tr>
							<td colspan="8">第一页 1 2 3 4</td>
						</tr>
					</table>
					
					<%
						}
						else{
							String date1 = request.getParameter("sousuo");
							String date2 = request.getParameter("sousuo2");
							RepertoryManager manager = new RepertoryManager();
							ArrayList list2 = manager.datefind(date1,date2) ;
					%> 
					<tr>
							<td width="25" height="30"><strong> <input
									type="checkbox" id="quanxuan" onclick="onquanxuan()" />
							</strong></td>
							<td ><strong>入库编号</strong></td>
							<td ><strong>商品名</strong></td>
							<td ><strong>类别名</strong></td>
							<!-- 
							
							<td><strong>单位编号</strong></td>
							<td><strong>入库数量</strong></td>
							<td><strong>进价</strong></td>
							<td><strong>总价</strong></td>
							 -->
							<td><strong>供应商名</strong></td>
							<!-- 
							<td><strong>入库备注</strong></td>
							
							 -->
							<td><strong>入库日期</strong></td>
							<td><strong>管理员名</strong></td>
							
							<td><strong>操作</strong></td>
							
						</tr>
						
						<%
							for (int i = 0; i < list2.size(); i++) {
						%>
						<tr>
							<td><input type="checkbox" name="checkbox"
						
							value="<%=((RepertoryBean) list2.get(i)).getRukuno()%>" /></td>
							<td><%=((RepertoryBean) list2.get(i)).getRukuno()%></td>
							<td><%=((RepertoryBean) list2.get(i)).getPname()%></td>
							
							<td><%=((RepertoryBean) list2.get(i)).getPTname()%></td>
							
							<td><%=((RepertoryBean) list2.get(i)).getSUname()%></td>
							<td><%=((RepertoryBean) list2.get(i)).getRdate()%></td>
							
							<td><%=((RepertoryBean) list2.get(i)).getAname()%></td>
							
							
							<td><a
								href="<%=request.getContextPath()%>/jsp/h_rukulistxiangxi.jsp?id=<%=((RepertoryBean) list2.get(i)).getRukuno()%>"
								class="button1">查看详细</a><span></span><a
								href="<%=request.getContextPath()%>/rukulistdel?id=<%=((RepertoryBean) list2.get(i)).getRukuno()%>"
								class="button1">删除</a>
								
								
								</td>
						</tr>
						<%
							}
						}
						%>
						<tr>
							<td colspan="8">第一页 1 2 3 4</td>
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
