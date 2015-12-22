<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" pageEncoding="utf-8"
%>
<%@ page import= "com.shop.shangpinguanli.*" %>
<%@page import="java.util.ArrayList"%>
<%String User= (String)session.getAttribute("User"); 
	String path = request.getContextPath();
%>

<%@ include file="link.jsp"%>
<script> 
function ddd(obj, sType) { 
var oDiv = document.getElementById(obj); 
if (sType == 'show') { oDiv.style.display = 'block';} 
if (sType == 'hide') { oDiv.style.display = 'none';} 

} 
</script>
<div class="head_top_outboard">
  <div class="head_board">
    <div class="denglu"><span>欢迎来到XXX网上超市！</span><p><a href="#" class="a">登录 </a>/<a href="#" class="a"> 注册</a></p></div>
    <div class="dingdan"><a href="<%=path %>/kehuziliao.jsp">个人中心</a></div>
  </div>
  <div class="logo_board">
    <div class="logoDiv"><a href="#"><img src="<%=path %>/img/logo3.png" width="240" height="130" /></a></div>
    <div class="sousuoDiv">
      <div class="sousuo">
        <form id="formSousuo" name= "formSousuo" method="post" action="<%=path %>/sousuo.sousuo">
          <input type="text" name="sousuo" id="sousuo" placeholder="搜索" />
        
      </div>
      <div class="sousuobuttonDiv">
        <a href="#" onclick="document.getElementById('formSousuo').submit();">搜索</a>
      </div></form>
    </div>
    <div class="gouwucheDiv" id="goTop"><a href="#" class="gouwucheButton">购物车(0)</a></div>
  </div>
  
</div>
<div class="menu_board_out">
  <div class="menu_board">
    <div class="suoyoufenlei"><a href="#" class="sousuofenlei_a"  onmouseover="ddd('aa', 'show');" onmouseout="ddd('aa', 'hide');">所有分类<span class="span1">≡</span></a></div>
  <a href="<%=path %>" class="daohang">首页</a></div>
</div>
<div class="body_list_menu">
  <div class="pf_menu" style="display:none;" id="aa" onmouseover="ddd('aa', 'show');" onmouseout="ddd('aa', 'hide');" >

<%
					FenleiManager fenleimanager = new FenleiManager();
					ArrayList<FenleiBean> fenlei = fenleimanager.getAll();
				%>
				<%
					for (int i = 0; i < fenlei.size(); i++) {
				%>
				<a href="<%=path %>/fenlei.sousuo?id=<%=fenlei.get(i).getId()%>"><%=((FenleiBean) fenlei.get(i)).getType()%></a>
				<%
					}
				%>
  </div>
  </div>

