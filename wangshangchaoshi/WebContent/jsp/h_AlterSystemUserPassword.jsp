<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网上超市销售系统</title>
<%@ include file="h_link.jsp" %>
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
     <%@ include file="h_AlterSystemUserPasswordBody.jsp" %>
     
     
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
