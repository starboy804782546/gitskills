<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ page import="com.shop.shangpinguanli.*" %>
<%@ page import="java.util.ArrayList" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网上超市销售系统</title>
<%@ include file="h_link.jsp"%>
<style type="text/css">
.cs {
	
	float: left;
	height: 100px;
	width: 300px;
}

.tu{
	float: left;
	height: auto;
	width: auto;
	}
	.body {
	font-size: 14px;
	width: 1118px;
	margin: auto;
}
.body .text {
	width: 400px;
}
</style>
</head>

<body>

<jsp:include page="../jsp/h_head.jsp"/>
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

<%@ include file="../jsp/h_LeftMenu.jsp" %>
<!-- 引用左侧菜单 -->
    
</div>

     </div>
     <div class="Switch"></div>
     <script type="text/javascript">
	$(document).ready(function(e) {
    	$(".Switch").click(function(){
		$(".left").toggle();
		});
	});
</script>
<div class="right"  id="mainFrame">
     
     <div class="right_cont">
<ul class="breadcrumb">
  当前位置：
  <a href="#">首页</a> <span class="divider">/</span>数据统计<a href="#"></a> <span class="divider">/</span>
  商品数据分析
</ul>
   
   <div class="title_right"><strong>商品数据分析</strong></div>  
   </div>
     <!-- body_stat -->
     <%
     String id = request.getParameter("id")==null?"0":request.getParameter("id");
     
     AddshangpinManager shangpinmanager = new AddshangpinManager();
     ArrayList<ShangpinBean> list =shangpinmanager.getOne(id);
     if(list.size()!=0)
     {
%>
     <div class="body">
     <form action="<%=request.getContextPath()%>/addshangpinServlet" method="post" enctype="multipart/form-data" >
<table width="1118px"  border="0" class="table table-bordered" >
  <tr  >
    <th width="20%" align="right" nowrap="nowrap" bgcolor="#f1f1f1"  >名称：</th>
    <td>&nbsp;<%=list.get(0).getName() %></td>
  </tr>
  <tr>
    <th align="right" nowrap="nowrap" bgcolor="#f1f1f1" >类别：</th>
    <td>&nbsp;<%=list.get(0).getLeibie() %></td>
  </tr>
  <tr>
    <th height="180"align="right" nowrap="nowrap" bgcolor="#f1f1f1">图片：</th>
    <td><div class="tu" >
      <img src="<%=list.get(0).getTupian() %>"  height="250px" width="300px"  border="0" id="img"/></div></td>
  </tr>
 
    <th align="right" nowrap="nowrap" bgcolor="#f1f1f1">售价：</th>
    <td><i><%=list.get(0).getShoujia() %><b> 元</b></i></td></td>
  </tr>
  <tr>
  <th height="50"align="right" nowrap="nowrap" bgcolor="#f1f1f1">单位：</th>
  <td>&nbsp;<%=list.get(0).getDanwei() %></td>
  </tr>
  <tr>
  <th align="right" nowrap="nowrap" bgcolor="#f1f1f1">生产日期</td>
  ：<td> <%=list.get(0).getShengchanriqi() %></td>
  </tr>
  <tr>
  <th align="right"  nowrap="nowrap" bgcolor="#f1f1f1">保质期</td>
  ：<td> <%=list.get(0).getBaozhiqi() %> 天</td>
  </tr>
  <tr>
    <th align="right"  nowrap="nowrap" bgcolor="#f1f1f1" name="gongyingshang">供应商：</th>
    <td>&nbsp;<%=list.get(0).getGongyingshang() %></td>
  </tr>
  <tr>
    <th height="180" align="right" nowrap="nowrap" bgcolor="#f1f1f1">描述：</th>
    <td>&nbsp;<%=list.get(0).getMiaoshu() %></td>
  </tr>
  <tr>
   <th align="right" nowrap="nowrap" bgcolor="#f1f1f1"> 规格：</th>
    <td> <%=list.get(0).getGuanjianci()%></td>
  </tr>
    <th align="right" nowrap="nowrap" bgcolor="#f1f1f1"> 商品时间预警：</th>
    <td><p style="margin-left:20px">保质期剩余&nbsp;&nbsp;&nbsp;&nbsp;<%=list.get(0).getTimeyujing() %>    &nbsp; 天（时间） 时预警</p></td>
  </tr>
     <th align="right" nowrap="nowrap" bgcolor="#f1f1f1"> 商品数量预警：</th>
    <td><p style="margin-left:20px">商品数量剩余&nbsp;<%=list.get(0).getNumberyujing() %>
      件（单位） 时预警</p></td>
  <tr>
  <td colspan="2" align="center"><a href="#" class="btn btn-info">修改 </a></td>
  </tr>
</table>
<%} %>
</form>
     
     <!--body_end-->
    </div>
    
<!-- 底部 --><script>
!function(){
laydate.skin('molv');
laydate({elem: '#Calendar'});
laydate.skin('molv');
laydate({elem: '#Calendar2'});
}();
 function xianshitu(){
	 var file = document.getElementById('tupian');
	 var img = document.getElementById('img');
	 img.src=file.value;
 }
 
</script>



 
</body>
</html>
