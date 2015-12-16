<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%String systemUser= (String)session.getAttribute("systemUser"); %>

 <div class="header">
	 <div class="logo"><img  src="<%=request.getContextPath()%>/img/h_logo.png" /></div>
     
				<div class="header-right">
               <!-- <i class="icon-question-sign icon-white"></i>  --> <a href="#">前台首页</a> <i class="icon-user icon-white"></i> <a href="#">　欢迎您：<%=systemUser %></a>  <i class="icon-off icon-white"></i><a id="modal-973558" href="#modal-container-973558" role="button" data-toggle="modal">　退出系统</a>  <!-- <i class="icon-envelope icon-white"></i> <a href="#">发送短信</a> -->
                <div id="modal-container-973558" class="modal hide fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="width:300px; margin-left:-150px; top:30%">
				<div class="modal-header">
					 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h3 id="myModalLabel">
						退出系统
					</h3>
				</div>
				<div class="modal-body">
					<p>
						您确定要退出系统吗？
					</p>
				</div>
				<div class="modal-footer">
					 <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button> <a class="btn btn-primary" style="line-height:20px;" onclick="" href="<%=request.getContextPath()%>/jsp/h_exit.jsp" >确定退出</a>
				</div>
			</div>
				</div>
</div>
