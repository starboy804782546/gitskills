<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="com.shop.shangpinguanli.GongyingshangBean" %>
<%@ page import="com.shop.shangpinguanli.GongyingshangManager" %>
<%@ page import="com.shop.shangpinguanli.FenleiManager" %>
<%@ page import="com.shop.shangpinguanli.FenleiBean" %>
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
	height: 250px;
	width: 200px;
	background-color: #CCC;
	}
	.body {
	font-size: 14px;
	width: 1118px;
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
     <%FenleiManager fenleimanager=new FenleiManager();
     	ArrayList<FenleiBean> fenlei= fenleimanager.getAll();
     	GongyingshangManager gongyingshangmanager= new GongyingshangManager();
     	ArrayList<GongyingshangBean> gongyingshang = gongyingshangmanager.getAll();
     
     
     %>
     <div class="body">
<table width="1118px"  border="0" class="table table-bordered" >
  <tr  >
    <th width="20%"  >名称</th>
    <td><input type="text" style=" margin-left: 20px;" value="" width="500px" height="25px" /></td>
  </tr>
  <tr>
    <th >类别</th>
    <td>    <select name="gongying" id="gongying" style="margin-left:20px;"  >
   <%for(FenleiBean fen :fenlei){ %>
        <option value="<%=fen.getType() %>"><%=fen.getType() %></option>
        <%} %>
      </select></td>
  </tr>
  <tr>
    <th height="180">图片</th>
    <td> <div class="cs"  style="margin-top:75px;"><input type="file"  style="margin-left:20px;" id="file"  /></div> 
     <div class="tu" ><center></center>
      <img src="document.getElementById("file").value"  height="250" border="0"/> </div></td>
  </tr>
 
    <th >售价</th>
    <td><input  width="150px" height="25px" style=" margin-left: 20px;" /><i><b>元</b></i></td></td>
  </tr>
  <tr>
    <th height="50">促销价</th>
    <td><input  width="150px" style=" margin-left: 20px;" /><i><b>元</b></i></td></td>
  </tr>
  <tr>
    <th >供应商</th>
    <td>
      <select name="gongying" id="gongying" style="margin-left:20px;"  >
       <%for(GongyingshangBean gong :gongyingshang) {%>
        <option value="<%=gong.getName() %>"><%=gong.getName() %></option>
      
        <%}%>
      </select>
    </td>
  </tr>
  <tr>
    <th height="180">描述</th>
    <td><textarea width="400" height="150" style="margin-left:20px;"></textarea></td>
  </tr>
  <tr>
   <th>关键词</th>
    <td><input type="text" style=" margin-left: 20px;" value="" width="500px" height="25px" /></td>
  </tr>
</table>


     
     <!--body_end-->
    </div>
    
<!-- 底部 -->
<%@ include file="../jsp/h_footer.jsp" %>
    
    

 <script>
!function(){
laydate.skin('molv');
laydate({elem: '#Calendar'});
laydate.skin('molv');
laydate({elem: '#Calendar2'});
}();
 function img(){
	 var file = document.getElementById("file");
	 return file.value;
 }
</script>



 
</body>
</html>
