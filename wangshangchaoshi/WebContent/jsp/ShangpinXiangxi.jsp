<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" pageEncoding="utf-8"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="head.jsp"%>
	<!-- body start -->
	
	<%ArrayList<ShangpinBean> list = (ArrayList)request.getAttribute("list"); %>

<div style="padding: 10px 50px 20px 50px;">
  <div style="width:1200px; background-color:#FFF; padding-bottom:50px; margin:auto;">
    <div style="float:left;"><div style="float:left; width:500px;height:400px"><img src="<%=list.get(0).getTupian()%>"width="400px" height="400px"/></div></div>
    <p style="font-size:36px; height:70px; line-height:70px;"><%=list.get(0).getName() %></p>
    <div style="background-color:#FFf;">
      <p style="color:#F00; font-size:36px; height:80px; line-height:80px; margin-left:520px; margin-top:20px;">￥14.9</p>
    </div>
    <p>编号： <%=list.get(0).getId() %></p>
    <p>分类：<%=list.get(0).getLeibie() %> &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;  产地： <%=list.get(0).getGuanjianci() %> </p>
    <p>库存：  <%=list.get(0).getNumber() %> <%=list.get(0).getDanwei() %></p>
    <p>数量：</p>
    <div style="width:165px; float:left; margin-top:10px;">
   
       <center>
          <input type="text" class="spinnerExample" name="shuliang"/>
      </center>
      <script type="text/javascript">
$('.spinnerExample').spinner({});
</script>
    </div>
    <div style="height:20px;"></div>
    <div style="margin:20px 20px 0 485px; margin-left:485px; height:80px; border-top-style:solid;  border-bottom-style:solid; border-width:1px;">
      <button class="button" style="margin-top:15px; margin-left:25px; ">加入购物车</button>
      <button class="button1" style="margin-top:15px; margin-left:45px; ">立即购买</button>
    </div>
  </div>
</div>
<div style="background-color:#FFC margin-bottom: 12px; ">
  <div style=" width:1200px; margin:auto; background-color:#FFF;">
    <div style="float:left; width:10px; height:35px; background-color:#06F;"></div>
    <div style="height:35px; background-color:#F90; color:#FFF; font-size:26px; line-height:35px; padding-left:30px;">商品详情：</div>
    <pre style="margin-top:0px; line-height:25px;">

	<%=list.get(0).getMiaoshu() %>
  
</pre>
  </div>
</div>

	
	<!-- body end -->
	<%@ include file="footer.jsp"%>
</body>
</html>