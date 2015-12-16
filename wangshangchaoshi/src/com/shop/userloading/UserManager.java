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


public class UserManager extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");

		Database db = new Database();
		String no = request.getParameter("zhanghao");
		String pw = request.getParameter("password");
		String name=request.getParameter("username");
		String tel= request.getParameter("phonenumber");
		String sql =" INSERT INTO chaoshi.customer(Cno,Cpassword,cname,Ctelephone)values('"+no+"','"+pw+"','"+name+"','"+tel+"')";
		//String sql = "insert into shop.test(Szh,Sname,Spassword,STel) value('"+no+"','"+name+"','"+pw+"','"+tel+"')";
		db.updataSql(sql);
		request.getRequestDispatcher("/jsp/userloading.jsp").forward(request, response);
//		try {
//       
//    			if(){
//    				
//    			}
//    			else{
//    			
//    			}
//    		
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}//取出res中  第一列的返回值。
//		finally {
//			db.closeDatabase();	//关闭数据库	
//		}
		//	ResultSet res =	db.selectSql(sql);
//		try{
//			Database con = new Database();
//			conn = con.getCon();
//			String sql = "insert into shop.test(Sno,Sname,Spassword,STel) value('"+no+"','"+name+"','"+pw+"','"+tel+"')";
//			ResultSet res =	data.selectSql(sql);
//			Statement stmt = conn.createStatement();
//			stmt.executeupdatesql()(sql);
//		}catch(Exception e){
//			e.printStackTrace();
//			System.err.println("错误1");
//		}finally {
//			data.closeDatabase();
//		}
	}

}
