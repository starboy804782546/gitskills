<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" pageEncoding="utf-8"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网上超市销售系统</title>
<%@ include file="h_link.jsp" %>

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
  <a href="<%=request.getContextPath() %>/index?id=h_sy">首页</a>
</ul>
 
</div>

     <!-- body_stat -->
     
<div class ="sy_body">
 <!--table stat-->
<div class="sy_table ">
  <div class="table_head sy_table_padding boder_all"><STRONG>今日统计概况</STRONG></div>
  
  <div class="table2 sy_table_padding boder_l_r"><div class="table_left">销售总额：</div><div class="table_right">￥ 0.00 元</div></div>
  
    <div class="table2 sy_table_padding bg-color_F1F1F1 boder_all">
      <div class="table_left bg">订单数量：</div>
      <div class="table_right">0个</div>
      </div>
      
        <div class="table2 sy_table_padding boder_l_r">
          <div class="table_left">今日新增会员：</div>
          <div class="table_right">0人</div>
          </div>
          
    <div class="table2 sy_table_padding bg-color_F1F1F1 boder_all">
      <div class="table_left bg">今日新增商品评论：</div>
      <div class="table_right">0条</div>
      </div>     
        </div>  
        <!--table end-->
         <!--table stat-->
<div class="sy_table ">
  <div class="table_head sy_table_padding bg-color_F1F1F1 boder_all"><STRONG>订单处理情况</STRONG></div>
  
  <div class="table2 sy_table_padding boder_l_r"><div class="table_left">未处理订单总数：</div><div class="table_right">0件</div></div>
  
    <div class="table2 sy_table_padding bg-color_F1F1F1 boder_all">
      <div class="table_left bg">待发货订单总数：</div>
      <div class="table_right">0件</div>
      </div>
      
        <div class="table2 sy_table_padding boder_l_r">
          <div class="table_left">已完成订单总数：</div>
          <div class="table_right">0件</div>
          </div>
          
    <div class="table2 sy_table_padding bg-color_F1F1F1 boder_all">
      <div class="table_left bg"></div>
      <div class="table_right"></div>
      </div>     
        </div>  
        <!--table end-->
         <!--table stat-->
<div class="sy_table ">
  <div class="table_head sy_table_padding bg-color_F1F1F1 boder_all"><STRONG>商品信息统计</STRONG></div>
  
  <div class="table2 sy_table_padding boder_l_r"><div class="table_left">仓库商品统计：</div><div class="table_right">0件</div></div>
  
    <div class="table2 sy_table_padding bg-color_F1F1F1 boder_all">
      <div class="table_left bg">商品库存警告：</div>
      <div class="table_right">0件</div>
      </div>
      
        <div class="table2 sy_table_padding boder_l_r">
          <div class="table_left"></div>
          <div class="table_right"></div>
          </div>
          
    <div class="table2 sy_table_padding bg-color_F1F1F1 boder_all">
      <div class="table_left bg"></div>
      <div class="table_right"></div>
      </div>     
        </div>  
        <!--table end-->
         <!--table stat-->
<div class="sy_table ">
  <div class="table_head sy_table_padding bg-color_F1F1F1 boder_all"><STRONG>系统信息</STRONG></div>
  
  <div class="table2 sy_table_padding boder_l_r"><div class="table_left">当前程序版本：</div><div class="table_right">v1.0(UTF-8)</div></div>
  
    <div class="table2 sy_table_padding bg-color_F1F1F1 boder_all">
      <div class="table_left bg">服务器MySQL版本：</div>
      <div class="table_right">5.5.23</div>
      </div>
      
        <div class="table2 sy_table_padding boder_l_r">
          <div class="table_left">当前数据库尺寸：</div>
          <div class="table_right">0MB</div>
          </div>
          
    <div class="table2 sy_table_padding bg-color_F1F1F1 boder_all">
      <div class="table_left bg"></div>
      <div class="table_right"></div>
      </div>     
        </div>  
        <!--table end-->
</div>
     
   <!--body_end-->
  
  </div>    </div>
<!-- 底部 -->
<%@ include file="/jsp/h_footer.jsp" %>
    

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
