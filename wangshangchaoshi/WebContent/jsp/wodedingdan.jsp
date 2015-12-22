<%@page import="com.shop.kehuziliao.KehuBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.shop.kehuziliao.KehuManager"%>
<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@page import="com.shop.shangpinguanli.ShangpinBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人中心——我的订单</title>
<%@ include file="link.jsp"%>
</head>

<body>
<!-- 头部开始-->

<%@ include file="head.jsp"%>
<!-- 头部结束-->

<div style=" width:1200px; margin:auto;">
 
 
<div style="height:500px; margin:auto;">
 <div   style="height:500px; width:200px; background-color:#CCC; float:left; "  >
    <table width="200" border="1" cellpadding="5px"  cellspacing="1px;" >
      <tr>
        <th><a name="wodegerenziliao" href="kehuziliao.jsp"><center><u>我的个人资料</u></center></a></th>
      </tr>
      <tr>
        <th><a name="wodedingdan" href="wodedingdan.jsp"  ><center><u>我的订单</u></center></a></th>
      </tr>
      <tr>
         <th><a name="wodegouwuche" href="wodegouwuche.jsp"><center><u>我的购物车</u></center></a></th>
       <tr>
         <th><a name="xiugaixinxi"  href="xiugaixinxi.jsp"><center><u>修改信息</u></center></a></th>
               <tr>
         <th><a name="wodeqianbao" href="wodeqianbao.jsp"><center><u>我的钱包</u></center></a></th>
    </table>
   
   
</div>
<div>
<center><table width="1000px"  border="1px" cellspacing="0px" cellpadding="0px">
						
						
						<%
						String user="user";
						KehuManager manager = new KehuManager();
						ArrayList AllOno = manager.getAllOno(user);  
						
						for (int i = 0; i < AllOno.size(); i++) {
							
							ArrayList Allorder = manager.getAllorder(((KehuBean) AllOno.get(i)).getOno());  
							for (int j = 0; j < Allorder.size();j++) {
								if(j==0){
						%>
						
						<tr>
							<th width="10%"><center>订单号</center></th>
							<th width="25%">商品名</th>
							<th width="7%">商品数量</th>
							<th width="7%">商品单价</th>
							<th width="10%">收货人</th>
							<th width="15%">收货地址</th>
							<th width="10%">订单日期</th>
							<th width="8%">订单总金额</th>
							<th width="8%">订单状态</th>
						</tr>
						<tr>
							<td><center><%=((KehuBean) Allorder.get(j)).getOno() %></center></td>
							<td height="150px"><div
									style="width: 250px; height: 115px;"><img src="<%=((KehuBean) Allorder.get(j)).getTupian() %> " width="240"
					height="130" /></div>
							<div style="height: 35px; width: 250px;"><center><%=((KehuBean) Allorder.get(j)).getPname() %></center></div></td>
							<td><center><%=((KehuBean) Allorder.get(j)).getPnumber()%></center></td>
							<td><center><%=((KehuBean) Allorder.get(j)).getPjiage()%></center></td>
							<td><center><%=((KehuBean) Allorder.get(j)).getCname()%></center></td>
							<td><center><%=((KehuBean) Allorder.get(j)).getOaddress()%></center></td>
							<td><center><%=((KehuBean) Allorder.get(j)).getOdate()%></center></td>
							<td><center><%=((KehuBean) Allorder.get(j)).getOzongjine()%></center></td>
							<%int zhuangtai1 = ((KehuBean) Allorder.get(j)).getOstate();
                                    String zhuangtai;
                                    if(zhuangtai1==1)
                                    zhuangtai="已发货";
                                    else if(zhuangtai1==2)
                                    	zhuangtai="退货";
                                    else if(zhuangtai1==3)
                                    	zhuangtai="审核";
                                    else 
                                    	zhuangtai="未发货";
                                    %>
                                    <td><%=zhuangtai%></td>
						</tr>
						<%
								}else{
						
						%>
						<tr>
							<td></td>
							<td height="150px"><div
									style="width: 250px; height: 115px;"><img src="<%=((KehuBean) Allorder.get(j)).getTupian() %> " width="240"
					height="130" /></div>
								<div style="height: 35px; width: 250px;"><center><%=((KehuBean) Allorder.get(j)).getPname() %></center></div></td>
							<td><center><%=((KehuBean) Allorder.get(j)).getPnumber() %></center></td>
							<td><center><%=((KehuBean) Allorder.get(j)).getPjiage()%></center></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						
					
					    <%
								}
							}
						}
						%>
					</table>
      </center> 
      </div>

</div>
</div>



<!-- 底部开始-->
<%@ include file="footer.jsp"%>
<!-- 底部结束-->
</body>
</html>
