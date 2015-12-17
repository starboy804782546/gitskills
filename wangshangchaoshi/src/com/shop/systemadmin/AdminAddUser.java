package com.shop.systemadmin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.database.Database;

/**
 * Servlet implementation class AdminAddUuser
 */
@WebServlet("/AdminAddUuser")
public class AdminAddUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminAddUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Aname= request.getParameter("Aname");//request  接受请求
		String Apassword= request.getParameter("Apasswd");
		String sql="SELECT Aname FROM administrator where Aname='"+Aname+"'";
	    Database data =new Database();
	    ResultSet res=data.selectSql(sql);
	    try {
			if(!res.next()){
				String sql2="INSERT into administrator (Aname,Apassword) VALUES ('"+Aname+"','"+Apassword+"')";
				data.updataSql(sql2);
				response.sendRedirect("jsp/h_Adminguanli.jsp"); 

			}
			else{
				 PrintWriter out = response.getWriter();
				 out.println("<p>Action！ 用户名已被注册！</p>");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}

}
