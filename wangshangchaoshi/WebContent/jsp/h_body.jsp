<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网上超市销售系统</title>
<%@ include file="h_link.jsp"%>

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
     
     <div>
<table width="1118px"  border="1"  >
  <tr  >
    <th width="20%" height="51" >名称</th>
    <td><input type="text" style=" margin-left: 20px;" value="" width="500px" height="25px" /></td>
  </tr>
  <tr>
    <th height="50">类别</th>
    <td>    <select name="gongying" id="gongying" style="margin-left:20px;"  >
        <option>计算机科学以技术专业</option>
        <option>数据库专业</option>
        <option>第一小组</option>
        <option>d</option>
      </select></td>
  </tr>
  <tr>
    <th height="180">图片</th>
    <td> <center><div class="cs"  style="margin-top:75px;"><input type="file"  style=" margin-left: 20px;"  /></div> </center> <div class="tu" ><center></center> 图片: </center></div></td>
  </tr>
 
    <th height="50">售价</th>
    <td><input  width="150px" height="25px" style=" margin-left: 20px;" /><i><b>元</b></i></td></td>
  </tr>
  <tr>
    <th height="50">促销价</th>
    <td><input  width="150px" height="25px" style=" margin-left: 20px;" /><i><b>元</b></i></td></td>
  </tr>
  <tr>
    <th height="50">供应商</th>
    <td>
      <select name="gongying" id="gongying" style="margin-left:20px;"  >
        <option>计算机科学以技术专业</option>
        <option>数据库专业</option>
        <option>第一小组</option>
        <option>d</option>
      </select>
    </td>
  </tr>
  <tr>
    <th height="180">描述</th>
    <td><textarea width="400" height="150"></textarea></td>
  </tr>
  <tr>
   <th height="50">关键词</th>
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
 
</script>



 
</body>
</html>
