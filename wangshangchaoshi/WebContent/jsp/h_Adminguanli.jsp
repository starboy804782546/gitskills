<%@page import="com.shop.systemadmin.SaveUser"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.shop.systemadmin.UserGuanli"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网上超市销售系统</title>
<%@ include file="/jsp/h_link.jsp"%>
<style type="text/css">
#Del {
	color: #FFF;
	border:0px;
	background-color: #38A3D5;
}
#Del:hover {
	background-color: #207197;
}
</style>
</head>

<body>

<jsp:include page="/jsp/h_head.jsp"/>
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

<%@ include file="/jsp/h_LeftMenu.jsp" %>
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
     
     <div class="body ">
	 <a href="<%=request.getContextPath() %>/jsp/h_AdminAddUser.jsp">添加用户</a>
	 <% UserGuanli user =new UserGuanli();
     ArrayList list =user.getAll();%><form id="form4" name="form4" method="post" action="">

<table width="1000" border="0" align="center" class="table table-bordered table-hover table-striped">
  <tr>
    <td width="456" height="25">编号</td>
    <td width="396">用户名</td>
    <td width="134">操作</td>
  </tr>
  <% for(int i =0;i<list.size();i++){
    
  %>
  <tr  height="25">
    <td><%=((SaveUser)list.get(i)).getAno()%></td>
    <td><%=((SaveUser)list.get(i)).getAname()%></td>
    <td>
    <a href="<%=request.getContextPath() %>/alterUser?name=del&id=<%=((SaveUser)list.get(i)).getAno()%>" onclick=" return sc();">删除</a>
     <!-- <input type="button" name="Del" id="Del" value="删除" /> --> 
    </td>
  </tr><%} %>
</table></form>
</div>
     
     <!--body_end-->
    </div>
    
<!-- 底部 -->
<%@ include file="/jsp/h_footer.jsp" %>
    
    

 <script>
!function(){
laydate.skin('molv');
laydate({elem: '#Calendar'});
laydate.skin('molv');
laydate({elem: '#Calendar2'});
}();
 
function sc(){
	return confirm('是否删除');
}

</script>



 
</body>
</html>
