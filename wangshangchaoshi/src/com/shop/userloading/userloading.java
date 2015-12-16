package com.shop.userloading;

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

public class userloading extends HttpServlet{
	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("judgeUser",true);
		String cno=req.getParameter("quser");
		String password=req.getParameter("qpassword");
		String sql="select Cno,Cpassword from customer";
		Database data = new Database();
		ResultSet res =	data.selectSql(sql);
		resp.setContentType("text/html;charset=utf-8");
		HttpSession session = req.getSession();
		try{
			boolean isnext=res.next();
			while(isnext){
				if(res.getString(1).equals(cno)&&res.getString(2).equals(password)){
					session.setAttribute("User", res.getString(1));
					req.getRequestDispatcher("/jsp/index.jsp").forward(req, resp);
					
					return ;
				//	out.println("<h1>success</h1>");//resp.sendRedirect("index.html");跳转页面
				}else
				isnext=res.next();
				if(isnext==false)
				{
					req.getRequestDispatcher("/jsp/userloading.jsp").forward(req, resp);
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
}
