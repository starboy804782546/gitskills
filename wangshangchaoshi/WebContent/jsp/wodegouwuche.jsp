<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" pageEncoding="utf-8"
import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人中心——我的购物车</title>
<%@ include file="link.jsp"%>
</head>

<body>
<!-- 头部开始-->
<%@ include file="head.jsp"%>

<!-- 头部结束-->

<div style=" width:1200px; margin:auto;">
 
 
<div style="height:500px;">
 <div   style="height:500px; width:200px; background-color:#CCC; float:left; "  >
    <table width="200" border="1" cellpadding="5px"  cellspacing="1px;">
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
        <tr>
          <th width="10%"><center><input type="checkbox" name="select1" id="select1" />全选</center></th>
          <th width="25%" >图片</th>
          <th width="20%">名称</th>
          <th  width="15%">数量</th>
          <th  width="15%">价格</th>
          <th  width="15%">订单状态</th>
        </tr>
        <tr>
          <td><center><input type="checkbox" name="select1" id="select1" /></center></td>
          <td height="200px"></td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr >
          <td colspan="6" height="50px"><button style="margin-left:400px;" >清空购物车</button>
          <button style="margin-left:40px;">去&nbsp;&nbsp;结&nbsp;&nbsp;算</button></td>
         
        </tr>
      </table>
      </center> 
      </div>

</div>
</div>


<p align="right" ><a href="#top" name="bottom" style="margin-right:80px;">返回顶部 ↑</a></p>
<!-- 底部开始-->
<%@ include file="footer.jsp"%>
<!-- 底部结束-->
</body>
</html>
