<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.jspsmart.upload.*" errorPage=""%>

<%
	SmartUpload su = new SmartUpload();
	su.initialize(pageContext);
	su.setAllowedFilesList("png,jpg,gif,jpeg");
	su.upload();
	int count = su.save("/upload",su.SAVE_VIRTUAL);
	System.out.println("cont"+count);
	String name = su.getRequest().getParameter("name");
	String gongyingshang = su.getRequest().getParameter("gongyingshang");
	String shoujia = su.getRequest().getParameter("shoujia");
	String cuxiaojia = su.getRequest().getParameter("cuxiaojia");
	String shengchanriqi = su.getRequest().getParameter("shengchanriqi");
	String baozhiqi = su.getRequest().getParameter("baozhiqi");
	String leibie = su.getRequest().getParameter("leibie");
	String miaoshu = su.getRequest().getParameter("miaoshu");
	String guanjianci = su.getRequest().getParameter("guanjianci");
	String timeyujing = su.getRequest().getParameter("timeyujing");
	String numberyujing = su.getRequest().getParameter("numberyujing");
	System.out.println(name);
%>