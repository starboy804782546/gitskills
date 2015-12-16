package com.shop.h_loading;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.authenticator.SingleSignOnSessionKey;

import com.shop.database.Database;
//后台登录业务实现
public class loading extends HttpServlet{
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("judgeUser",true);
		String user=req.getParameter("user");
		String password=req.getParameter("password");
		String sql="select Aname,Apassword from Administrator";
		Database data = new Database();
		ResultSet res =	data.selectSql(sql);
		resp.setContentType("text/html;charset=utf-8");
		HttpSession session = req.getSession();
		try{
			boolean isnext=res.next();
			while(isnext){
				if(res.getString(1).equals(user)&&res.getString(2).equals(password)){
					session.setAttribute("systemUser", res.getString(1));
					req.getRequestDispatcher("/jsp/h_index.jsp").forward(req, resp);
					
					return ;
				//	out.println("<h1>success</h1>");//resp.sendRedirect("index.html");跳转页面
				}else
				isnext=res.next();
				if(isnext==false)
				{
					req.getRequestDispatcher("/jsp/admin.jsp").forward(req, resp);
					return ;
				}
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
			System.err.println("houtaiLanding doPost 错误");
		}finally {
			data.closeDatabase();
		}
		//super.doPost(req, resp);
	}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}
