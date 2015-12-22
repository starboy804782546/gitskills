<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="com.shop.shangpinguanli.GongyingshangBean" %>
<%@ page import="com.shop.shangpinguanli.GongyingshangManager" %>
<%@ page import="com.shop.shangpinguanli.FenleiManager" %>
<%@ page import="com.shop.shangpinguanli.FenleiBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.shop.shangpinguanli.ListManager" %>
<%@ page import="com.shop.shangpinguanli.ListBean" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.shop.kucun.GetSystemUserID" %>

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
  <a href="#">首页</a> <span class="divider">/</span>库存管理<a href="#"></a></ul>
   
   <div class="title_right"><strong>添加商品数量</strong></div>  
   </div>
     <!-- body_stat -->
     <%FenleiManager fenleimanager=new FenleiManager();
     	ArrayList<FenleiBean> fenlei= fenleimanager.getAll();
     	GongyingshangManager gongyingshangmanager= new GongyingshangManager();
     	ArrayList<GongyingshangBean> gongyingshang = gongyingshangmanager.getAll();
     	int id = Integer.parseInt(request.getParameter("id")==null?"-1":request.getParameter("id"));
     	ListManager listmanager= new ListManager();
     	ArrayList<ListBean> shangpinList = listmanager.getOne(id);
     	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
     	
%>
     <div class="body">
     <form action="<%=request.getContextPath()%>/addshuliang.kucun " method="post" ><table width="1118px"  border="0" class="table table-bordered" >
     <tr>
     <th>商品编号</th>
     <td><input type="text" name="id" value="<%=request.getParameter("id") %>"  readonly="true" /></td>
     </tr>
  <tr  >
    <th width="20%" align="right" nowrap="nowrap" bgcolor="#f1f1f1"  >商品名称：</th>
    <td><p><%=((ListBean)shangpinList.get(0)).getName()%><input type="text" name="shangpinId" value="<%=((ListBean)shangpinList.get(0)).getId()%>"  style="display:none;"/></p></td>
  </tr>
  <tr>
    <th  align="right" nowrap="nowrap" bgcolor="#f1f1f1" >类别：</th>
    <td><p><%=((ListBean)shangpinList.get(0)).getType()%></p><input type="text" name="leibieid" value="<%=((ListBean)shangpinList.get(0)).getLeibieId()%>"  style="display:none;"/></td>
  </tr>
  <tr>
    <th align="right" nowrap="nowrap" bgcolor="#f1f1f1">单位：</th>
    <td><p><%=((ListBean)shangpinList.get(0)).getDanwei()%></p><input type="text" name="danweiid" value="<%=((ListBean)shangpinList.get(0)).getDanweiId()%>"  style="display:none;"/></td>
  </tr>
 
    <th  align="right" nowrap="nowrap" bgcolor="#f1f1f1">入库数量：</th>
    <td><input type="text" style=" margin-left: 20px;" name="number"/>
    <i><b> <%=((ListBean)shangpinList.get(0)).getDanwei()%></b></i></td></td>
  </tr>
    <th  align="right" nowrap="nowrap" bgcolor="#f1f1f1">进价：</th>
    <td><input type="text" style=" margin-left: 20px;" name="jinjia"/>
    <i><b> 元</b></i></td>
  <tr>
    <th align="right" nowrap="nowrap" bgcolor="#f1f1f1">总金额：</th>
    <td><input type="text" width="170px" style=" margin-left: 20px;" name="zongjine" /><i><b> 元</b></i></td></td>
  </tr>
     <th align="right" nowrap="nowrap" bgcolor="#f1f1f1">供应商： </th>
    <td><p><%=((ListBean)shangpinList.get(0)).getGongyingshang()%></p><input type="text" name="gongyingshangid" value="<%=((ListBean)shangpinList.get(0)).getGongyingshangId()%>"  style="display:none;"/></td>
  <tr>
  <th  align="right" nowrap="nowrap" bgcolor="#f1f1f1">日期
    </td>
  ：<td><input type="text" style=" margin-left: 20px;"value="<%=df.format(new Date()) %>" name="riqi" /> 格式如：2015-1-1</td>
  </tr>
  <tr>
 
  </tr>
  <tr>
   
    </td>
  </tr>
  <tr>
    <th height="180" align="right" nowrap="nowrap" bgcolor="#f1f1f1">备注：</th>
    <td><textarea name="beizhu"  style="height:175px;width:600px;margin-left:20px;"value="
    "></textarea></td>
  </tr>
  <tr>
   <th  align="right" nowrap="nowrap" bgcolor="#f1f1f1"> 操作员账号：</th>
    <td><p><%= (String)session.getAttribute("systemUser")%></p>
    <input type="text" name="caozuoyuan" value="<%=new GetSystemUserID().getSystemUserId((String)session.getAttribute("systemUser"))%>"  style="display:none;"/></td>
  </tr>
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
</script>



 
</body>
</html>
