<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="com.shop.shangpinguanli.GongyingshangBean" %>
<%@ page import="com.shop.shangpinguanli.GongyingshangManager" %>
<%@ page import="com.shop.shangpinguanli.FenleiManager" %>
<%@ page import="com.shop.shangpinguanli.FenleiBean" %>
<%@ page import="com.shop.shangpinguanli.DanweiManager" %>
<%@ page import="com.shop.shangpinguanli.DanweiBean" %>
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

<jsp:include page="<%=request.getContextPath() %>/jsp/h_head.jsp"/>
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
     	DanweiManager danweimanager = new DanweiManager();
     	ArrayList<DanweiBean> danwei = danweimanager.getAll();
%>
     <div class="body">
     <form action="<%=request.getContextPath()%>/addshangpinServlet" method="post" enctype="multipart/form-data" >
<table width="1118px"  border="0" class="table table-bordered" >
  <tr  >
    <th width="20%" align="right" nowrap="nowrap" bgcolor="#f1f1f1"  >名称：</th>
    <td><input type="text" style=" margin-left: 20px;" value="" class="text" name = "name"/></td>
  </tr>
  <tr>
    <th align="right" nowrap="nowrap" bgcolor="#f1f1f1" >类别：</th>
    <td>    <select name="leibie" id="leibie" style="margin-left:20px;"  >
   <%for(FenleiBean fen :fenlei){ %>
        <option value="<%=fen.getId() %>"><%=fen.getType() %></option>
        <%} %>
      </select></td>
  </tr>
  <tr>
    <th height="180"align="right" nowrap="nowrap" bgcolor="#f1f1f1">图片：</th>
    <td> <div class="cs"  style="margin-top:75px;"><input type="file"  style="margin-left:20px;" id="tupian" name="file" /></div> 
     <div class="tu" >
      <img src=""  height="250" border="0" id="img"/><input type="button" value="显示图" onclick="xianshitu();" /> </div></td>
  </tr>
 
    <th align="right" nowrap="nowrap" bgcolor="#f1f1f1">售价：</th>
    <td><input  style=" margin-left: 20px;" name="shoujia" /><i><b> 元</b></i></td></td>
  </tr>
  <tr>
    <th height="50"align="right" nowrap="nowrap" bgcolor="#f1f1f1">促销价：</th>
    <td><input  width="150px" style=" margin-left: 20px;" name="cuxiaojia"/><i><b> 元</b></i></td></td>
  </tr>
  <tr>
  <th height="50"align="right" nowrap="nowrap" bgcolor="#f1f1f1">单位：</th>
  <td><select name="danwei" id="danwei" style="margin-left:20px;"  >
   <%for(DanweiBean danweis :danwei){ %>
        <option value="<%=danweis.getNo() %>"><%=danweis.getName() %></option>
        <%} %>
      </select></td>
  </tr>
  <tr>
  <th align="right" nowrap="nowrap" bgcolor="#f1f1f1">生产日期</td>
  ：<td><input type="text" style=" margin-left: 20px;"value="" name="shengchanriqi" name="shengchanriqi"/> 格式如：2015-1-1</td>
  </tr>
  <tr>
  <th align="right"  nowrap="nowrap" bgcolor="#f1f1f1">保质期</td>
  ：<td><input type="text" style=" margin-left: 20px;"value="" name="baozhiqi" name="baozhiqi" /> 天</td>
  </tr>
  
   <th align="right"  nowrap="nowrap" bgcolor="#f1f1f1">入库数量</td>
  ：<td><input type="text" style=" margin-left: 20px;"value="0" name="rukushuliangi" id="shuliang"/> </td>
  </tr>
  
   <th align="right"  nowrap="nowrap" bgcolor="#f1f1f1">进价</td>
  ：<td><input type="text" style=" margin-left: 20px;"value="" name="jinjia" id="jinjia" onchange="onZongJinge();" />单价 </td>
  </tr>
  
   <th align="right"  nowrap="nowrap" bgcolor="#f1f1f1">总金额</td>
  ：<td><input type="text" style=" margin-left: 20px;" value="" name="zongjine" id="zongjine"   /> 元</td>
  </tr>
  
  
  <tr>
    <th align="right"  nowrap="nowrap" bgcolor="#f1f1f1" name="gongyingshang">供应商：</th>
    <td>
      <select name="gongyingshang" id="gongyingshang" style="margin-left:20px;"  >
       <%for(GongyingshangBean gong :gongyingshang) {%>
        <option value="<%=gong.getId() %>"><%=gong.getName() %></option>
      
        <%}%>
      </select>
    </td>
  </tr>
  <tr>
    <th height="180" align="right" nowrap="nowrap" bgcolor="#f1f1f1">描述：</th>
    <td><textarea name="miaoshu"  style="height:175px;width:600px;margin-left:20px;"value="
    "></textarea></td>
  </tr>
  <tr>
   <th align="right" nowrap="nowrap" bgcolor="#f1f1f1"> 规格：</th>
    <td><input type="text" style=" margin-left: 20px;" value="" class="text" name="guanjianci"/> </td>
  </tr>
    <th align="right" nowrap="nowrap" bgcolor="#f1f1f1"> 商品时间预警：</th>
    <td><p style="margin-left:20px">保质期剩余&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style=" margin-left: 0px; width:35px;" value="" class="text" name="timeyujing"/>
      天（时间） 时预警</p></td>
  </tr>
     <th align="right" nowrap="nowrap" bgcolor="#f1f1f1"> 商品数量预警：</th>
    <td><p style="margin-left:20px">商品数量剩余&nbsp;
<input type="text" style=" margin-left: 0px; width:35px;" value="" class="text" name="numberyujing"/>
      件（单位） 时预警</p></td>
  <tr>
  <td colspan="2" align="center"><input type="submit" value="提交" style="margin-right:20px;" class="btn btn-info "/><input type="reset" value="重置" class="btn btn-info " /></td>
  </tr>
</table>

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
 function onZongJinge(){
	 var jinjia = document.getElementById('jinjia').value;

	 var shuliang  = document.getElementById('shuliang').value; 
	 var result = jinjia*shuliang

	 var zongjine = document.getElementById('zongjine');
	 zongjine.value=result;
 }
 
</script>



 
</body>
</html>
