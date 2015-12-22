<%@ page contentType="text/html; charset=utf-8" %>
<div id="my_menu" class="sdmenu">
<div class="collapsed">
		<span>公告管理</span>
		 <a href="<%=request.getContextPath() %>/jsp/h_gonggao.jsp">公告列表</a>
	</div>
	<div >
		<span>商品管理</span>
		<a href="<%=request.getContextPath() %>/index?id=splb">商品列表</a>
		<a href="<%=request.getContextPath() %>/jsp/h_shangpinadd.jsp">添加新商品</a>
		<a href="<%=request.getContextPath() %>/index?id=spfl">分类管理</a>
		<a href="<%=request.getContextPath() %>/index?id=dwgl"">单位管理</a>

	</div>
	<div>
	<span>供应商管理</span>
	<a href="<%=request.getContextPath() %>/index?id=gyslb">供应商列表</a>
	<a href="<%=request.getContextPath() %>/index?id=addgys">添加供应商</a>
	</div>
	
	<div class="collapsed">
		<span>库存管理</span>
		<a href="<%=request.getContextPath() %>/jsp/h_AddProductList.jsp">商品入库</a>
		<a href="<%=request.getContextPath() %>/">预警管理</a>
	</div>
	<div class="collapsed">
		<span>订单管理</span>
		<a href="<%=request.getContextPath() %>/jsp/h_order.jsp">订单浏览</a>
		<a href="<%=request.getContextPath() %>/jsp/h_orderfh.jsp">订单发货</a>
		<a href="<%=request.getContextPath() %>/jsp/h_ordersh.jsp">取消审核</a>
	</div>
	<div class="collapsed">
		<span>数据统计</span>
		 <a href="<%=request.getContextPath() %>/jsp/h_rukulist.jsp">入库统计</a>
		 <a href="#">销售情况统计</a>
		 <a href="<%=request.getContextPath() %>/index?id=spsjfx">商品数据分析</a>
	</div>
    
 	<div class="collapsed">
		<span>客户管理</span>
		 <a href="<%=request.getContextPath() %>/index?id=jbzlgl">基本资料管理</a>
	</div>
<div class="collapsed">
		<span>充值</span>
		 <a href="<%=request.getContextPath() %>/jsp/h_chongzhi2.jsp">客户充值</a>
	</div>
 	<div class="collapsed">
		<span>系统管理</span>
		   <a href="<%=request.getContextPath() %>/index?id=ggmm">更改密码</a>
		   <a href="<%=request.getContextPath() %>/index?id=yhgl">用户管理</a>

		   
	</div>
 	