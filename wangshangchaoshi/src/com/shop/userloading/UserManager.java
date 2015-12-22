package com.shop.userloading;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.database.Database;
import com.shop.shangpinguanli.FenleiManager;


public class UserManager extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");

		Database db = new Database();
		String no = request.getParameter("zhanghao");
		String pw = request.getParameter("password");
		String name=request.getParameter("username");
		String tel= request.getParameter("phonenumber");
		String sql =" INSERT INTO chaoshi.customer(Cno,Cpassword,cname,Ctelephone)values('"+no+"','"+pw+"','"+name+"','"+tel+"')";
		//String sql = "insert into shop.test(Szh,Sname,Spassword,STel) value('"+no+"','"+name+"','"+pw+"','"+tel+"')";
		String xinxi;
		if(db.updataSql(sql)){
			
			xinxi="注册成功";
			request.setAttribute("xinxi",xinxi);
		request.getRequestDispatcher("/jsp/userloading.jsp").forward(request, response);		
		}
		else{
			xinxi="该账号已经被注册";
			request.setAttribute("xinxi",xinxi);
		//	System.out.println("此账号已被注册");
		//	request.setAttribute("1", "Cno");
		request.getRequestDispatcher("/jsp/register.jsp").forward(request, response);		

		}
		
	}

}
