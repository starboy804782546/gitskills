<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" pageEncoding="utf-8"
import="java.util.List"%>
<%@page import="com.shop.kehuziliao.KehuBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.shop.kehuziliao.KehuManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人中心—我的钱包</title>
<%@ include file="link.jsp"%>
</head>
<SCRIPT LANGUAGE="JavaScript">  
        function createCode(len)  
        {  
            var seed = new Array(  
                    'abcdefghijklmnopqrstuvwxyz',  
                    'ABCDEFGHIJKLMNOPQRSTUVWXYZ',  
                    '0123456789'  
            );               //创建需要的数据数组  
            var idx,i;  
            var result = '';   //返回的结果变量  
            for (i=0; i<len; i++) //根据指定的长度  
            {  
                idx = Math.floor(Math.random()*3); //获得随机数据的整数部分-获取一个随机整数  
                result += seed[idx].substr(Math.floor(Math.random()*(seed[idx].length)), 1);//根据随机数获取数据中一个值  
            }  
            return result; //返回随机结果  
        }  
  
        function test() {  
            var inputRandom=document.getElementById("inputRandom").value;  
            var autoRandom=document.getElementById("autoRandom").innerHTML;  
            if(inputRandom==autoRandom) {  
                alert("通过验证");  
            } else {  
                alert("没有通过验证");  
            }  
  
        }  
    </SCRIPT>  
<body>
<!-- 头部开始-->
	<%@ include file="head.jsp"%>

<!-- 头部结束-->

<div style=" width:1200px; margin:auto;">
 
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
<div style="height:500px;  ">


<div style="height:500px; background-color:#FFF ">
<!--  
<center  ><table style="margin-top:20px;">  
    <tr>  
        <th>验证码：</th>  
        <td><input type="text" id="inputRandom">(注意区分大小写！)</td>  </tr>
        
       <tr> <td colspan="2"><center><label id="autoRandom" value=""></label><INPUT TYPE="button" VALUE="获取验证码" ONCLICK="autoRandom.innerHTML=createCode(4)"><input type="button" value="验&nbsp;&nbsp;&nbsp;证" onclick="test()" style="margin-left:20px;"></center></td>  
         
    </tr>  
  
</table> </center> 
<script type="text/javascript">  
    window.onload()=autoRandom.innerHTML=createCode(sel.value);  
</script>  -->
					<%
						String user = "张三";  //得在上面加<%String User= (String)session.getAttribute("User"); 
						KehuManager manager = new KehuManager();
						ArrayList money = manager.usermoney(user);  
					%>

<center><table border="1" style="margin-top:20px;"><tr><th style="width:300px; height:50px;">我的余额:<%=((KehuBean) money.get(0)).getMoney()%>元</th>
<td style=" height:50px;"></td>
</tr> </table></center> 

</div>
</div>
</div>


<p align="right" ><a href="#top" name="bottom" style="margin-right:80px;">返回顶部 ↑</a></p>
<!-- 底部开始-->
	<%@ include file="footer.jsp"%>
<!-- 底部结束-->
</body>
</html>
