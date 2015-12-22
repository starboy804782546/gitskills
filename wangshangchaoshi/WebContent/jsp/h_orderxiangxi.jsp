<%@page import="com.shop.h_order.DingdanBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.shop.h_order.DingdanManager"%>
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
	
	<div class="right" id="mainFrame">

		<div class="right_cont">
			<ul class="breadcrumb">
				当前位置：
				<a href="#">首页</a>
				<span class="divider">/</span>订单管理
				<a href="#"></a>
				<span class="divider">/</span> 订单浏览
			</ul>

			<div class="title_right">
				<strong>订单详细</strong>
			</div>
		</div>
		<!-- body_stat -->
	
		
	<div class="sousuo">
	
		
		<div class="body">
		<form action="">
		<table width="1119" align="center"
								class="table table-bordered table-hover table-striped">
								<tr></tr>
								
							
								
								<tr>
							<td width="200"><strong>订单号</strong></td>
							
							<td><strong>商品名</strong></td>
							<td><strong>商品数量</strong></td>
							<td><strong>商品单价</strong></td>
							<td><strong>订单总金额</strong></td>
							<td><strong>客户名</strong></td>
							<td><strong>收货地址</strong></td>
							<td width="250"><strong>订单日期</strong></td>
							<td><strong>订单状态</strong></td>			
							<td><strong>订单原因</strong></td>
								</tr>
								<%
						String Ono = request.getParameter("id"); 
						DingdanManager manager = new DingdanManager();
						ArrayList Onelist = manager.dingdanxiangxi(Ono);  
					%>
					<%
						for (int i = 0; i < Onelist.size(); i++) {
							
							if(i==0){
					%>
		
					<tr>
					<!-- 	<td width = "20%"><strong>订单号:</strong></td> -->
						<td height="25"><%=((DingdanBean) Onelist.get(i)).getId()%></td> 
					
				
					<!-- 	<td><strong>商品名:</strong></td>-->
						<td><%=((DingdanBean) Onelist.get(i)).getPname() %></td>
					
					<!-- 	<td><strong>商品数量:</strong></td>-->
						<td><%=((DingdanBean) Onelist.get(i)).getPnumber()%></td>
					
					<!-- 	<td><strong>商品单价:</strong></td>-->
						<td><%=((DingdanBean) Onelist.get(i)).getPjiage()%></td>
					
					<!-- 	<td><strong>订单总金额:</strong></td>-->
						<td><%=((DingdanBean) Onelist.get(i)).getOzongjine()%></td>
						
							
					<!-- 	<td><strong>客户名:</strong></td>-->
						<td><%=((DingdanBean) Onelist.get(i)).getOcname()%></td>
					
					
					<!-- 	<td><strong>收货地址:</strong></td>-->
						<td><%=((DingdanBean) Onelist.get(i)).getOaddress()%></td>
					
					
					<!-- 	<td><strong>订单日期:</strong></td>-->
						<td><%=((DingdanBean) Onelist.get(i)).getOdate()%></td>
					  <%int zhuangtai1 = ((DingdanBean) Onelist.get(i)).getOstate();
                                    String zhuangtai;
                                    if(zhuangtai1==1)
                                    zhuangtai="发货";
                                    else if(zhuangtai1==2)
                                    	zhuangtai="退货";
                                    else if(zhuangtai1==3)
                                    	zhuangtai="审核";
                                    else 
                                    	zhuangtai="未发货";
                                    %>
                                    <td><%=zhuangtai%></td>
					
					<!-- 	<td><strong>订单原因：</strong></td>-->
						<td><%=((DingdanBean) Onelist.get(i)).getOreason()%></td>
					</tr>
					<%
						}else{
							
						
					%>
		<tr>
					<!-- 	<td width = "20%"><strong>订单号:</strong></td> -->
						<td height="25"></td> 
					
					
					
				
					<!-- 	<td><strong>商品名:</strong></td>-->
						<td><%=((DingdanBean) Onelist.get(i)).getPname() %></td>
					
					<!-- 	<td><strong>商品数量:</strong></td>-->
						<td><%=((DingdanBean) Onelist.get(i)).getPnumber()%></td>
					
					<!-- 	<td><strong>商品单价:</strong></td>-->
						<td><%=((DingdanBean) Onelist.get(i)).getPjiage()%></td>
					
					<!-- 	<td><strong>订单总金额:</strong></td>-->
						<td></td>
						
					<!-- 	<td><strong>客户名:</strong></td>-->
						<td></td>
					
					
					<!-- 	<td><strong>收货地址:</strong></td>-->
						<td></td>
					
					
					<!-- 	<td><strong>订单日期:</strong></td>-->
						<td></td>
					
					<!-- 	<td><strong>订单状态：</strong></td>-->
						<td></td>
					
					<!-- 	<td><strong>订单原因：</strong></td>-->
						<td></td>
					</tr>
		
		
				<% }
						}%>
		
		
				
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


</body>
</html>
