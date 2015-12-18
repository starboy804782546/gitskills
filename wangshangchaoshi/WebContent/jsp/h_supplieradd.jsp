<%@page import="com.shop.h_supplier.SupplierBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.shop.h_supplier.SupplierManager"%>
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
	


	<div class="right" id="mainFrame">

		<div class="right_cont">
			<ul class="breadcrumb">
				当前位置：
				<a href="#">首页</a>
				<span class="divider">/</span>供应商管理
				<a href="#"></a>
				<span class="divider">/</span> 添加供应商
			</ul>

			<div class="title_right">
				<strong>添加供应商</strong>
			</div>
		</div>
		<!-- body_stat -->
		

        </select>
   
		 <div class="body"><form action = "<%=request.getContextPath() %>/SUadd.supplier" method="post" >
     <table width="1118" align="center" class="table table-bordered table-hover table-striped">
  <tr>
    <td width="46%"  align="right">供应商名称：</td>
    <td width="54%">
      <input type="text" name="SUname" id="SUname" style="width:400px;" value=""/></td>
  </tr>
  
   <tr>
    <td width="46%"  align="right">供应商地址：</td>
    <td width="54%">
      <input type="text" name="SUadress" id="SUadress" style="width:400px;" value=""/></td>
  </tr>
  <tr>
    <td width="46%"  align="right">供应商手机号：</td>
    <td width="54%">
      <input type="text" name="SUtel" id="SUtel" style="width:400px;" value=""/></td>
  </tr>
  <tr>
    <td width="46%"  align="right">联系人：</td>
    <td width="54%">
      <input type="text" name="SUperson" id="SUperson" style="width:400px;" value=""/></td>
  </tr>
  
</table>
<div style="text-align:center; padding-top:20px" ><input type="submit"  class="button" value="添加" style="width:90px"/></div>
</form>
</div>
		<!--div1_end-->
		
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
