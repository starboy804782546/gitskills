<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%String path=request.getContextPath(); %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">

<HTML><HEAD><TITLE>404错误页面</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<SCRIPT>window.wpo={start:new Date*1,pid:109,page:'qing'}</SCRIPT>
<STYLE type=text/css>
.mod-notfound {
	BORDER-RIGHT: #e1e1e1 1px solid;
	BORDER-TOP: #e1e1e1 1px solid;
	MARGIN-TOP: 10px;
	BORDER-LEFT: #e1e1e1 1px solid;
	BORDER-BOTTOM: #e1e1e1 1px solid;
	HEIGHT: 585px;
	TEXT-ALIGN: center;
	border-radius: 10px;
}
a {
	color: #0BB0B5;
}
</STYLE>

<META content="MSHTML 6.00.6000.17117" name=GENERATOR></HEAD>
<BODY><SECTION class=mod-page-body>
<DIV class="mod-page-main wordwrap clearfix">
<DIV class=x-page-container>
<DIV class="mod-notfound grid-98"><IMG class=img-notfound height=320 
src="<%=path%>/img/notfound.gif" width=520>
<P style="FONT-SIZE: 24px; LINE-HEIGHT: 70px">啊~哦~ 您要查看的页面不存在或已删除！</P>
<P style="MARGIN-BOTTOM: 30px">请检查您输入的网址是否正确，或者点击链接继续浏览空间</P>
<P style="FONT-SIZE: 14px; LINE-HEIGHT: 20px">您可以回到 <A 
href="<%=path%>/">网站首页</A>  </DIV></DIV></DIV></SECTION><FOOTER 
class="mod-footer mod-cs-footer">
<DIV class="clearfix hidden-box"></DIV>
<DIV class=footer-box></DIV></FOOTER>

</BODY></HTML>
