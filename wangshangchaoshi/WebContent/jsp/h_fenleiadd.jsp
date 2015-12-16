<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网上超市销售系统</title>
<%@ include file="h_link.jsp"%>
<style type="text/css">

.button {
	text-decoration: none;
	color: #FFF;
	height: 25px;
	line-height: 25px;
	background-color: #38A3DA;
	border-radius: 4px;
	font-size: 14px;
	border: 0px;

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
  <a href="#">首页</a> <span class="divider">/</span>商品管理<a href="#"></a> <span class="divider">/</span>分类管理
</ul>
   
   <div class="title_right"><strong>分类管理</strong></div>  
  </div>
     <!-- body_stat -->
     <div class="body"><form action = "" method="post">
     <table width="1119" align="center" class="table table-bordered table-hover table-striped">
  <tr>
    <td width="46%"  align="right">分类名称：</td>
    <td width="54%">
      <input type="text" name="typename" id="typename" style="width:400px;"/></td>
  </tr>
  <tr>
    <td align="right" height="140">排序等级：</td>
    <td>
      <select name="dengji" id="dengji" style="width:100px">
        <option value="0">0</option>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
        <option value="6">6</option>
        <option value="7">7</option>
        <option value="8">8</option>
        <option value="9">9</option>
        <option value="10" selected="selected">10</option>
      </select>      
      </td>
  </tr>
  <tr>
    <td align="right" >是否导航：</td>
    <td><span style="padding-left:5px;">是</span><input name="isview" type="radio"  value="1" checked="checked" /><span style="padding-left:5px;">否</span><input name="isview" type="radio"  value="0"  /></td>
  </tr>

</table>
<div style="text-align:center; padding-top:20px" ><input type="submit" class="button" value="提交" style="width:90px"/></div>
</form>
</div>
     
     
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
 
</script>



 
</body>
</html>
