<%@ page contentType="text/html; charset=utf-8" %>
<div id="my_menu" class="sdmenu">
	<div >
		<span>商品管理</span>
		<a href="<%=request.getContextPath() %>/index?id=splb">商品列表</a>
		<a href="#">添加商品</a>
		<a href="<%=request.getContextPath() %>/index?id=spfl">分类管理</a>
		<a href="#">规格管理</a>

	</div>
	<div>
	<span>供应商管理</span>
	<a href="#">供应商列表</a>
	<a href="#">添加供应商</a>
	</div>
	
	<div class="collapsed">
		<span>仓库管理</span>
		<a href="#">商品入库</a>
		<a href="#">库存盘点</a>
		<a href="#">预警管理</a>
	</div>
	<div class="collapsed">
		<span>订单管理</span>
		<a href="#">订单浏览</a>
		<a href="#">订单发货</a>
		<a href="#">取消审核</a>
	</div>
	<div class="collapsed">
		<span>数据统计</span>
		 <a href="#">每日汇总</a>
		 <a href="#">入库统计</a>
		 <a href="#">销售情况统计</a>
		 <a href="<%=request.getContextPath() %>/index?id=spsjfx">商品数据分析</a>
	</div>
    
 	<div class="collapsed">
		<span>客户管理</span>
		 <a href="#">基本资料管理</a>
	</div>

 	<div class="collapsed">
		<span>系统管理</span>
		   <a href="#">更改密码</a>
		   <a href="#">用户管理</a>
		   <a href="#">系统日志</a>
		   
	</div>
 	