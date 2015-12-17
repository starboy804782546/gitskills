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
import javax.servlet.http.HttpSession;

import com.shop.database.Database;

/**
 * Servlet implementation class AlterSystemUserPassword
 */
@WebServlet("/AlterSystemUserPassword")
public class AlterSystemUserPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AlterSystemUserPassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name =request.getParameter("name");
		String id =request.getParameter("id");
		if(name.equals("del")){
			if(del(id)){
				response.sendRedirect("jsp/h_Adminguanli.jsp");
			}
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	public boolean del(String id){
		UserGuanli user=new UserGuanli();
		
		return user.delOne(id);
	} 

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	//request 接收   response 发送
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String oldpassword= request.getParameter("yuanmima");//request  接受请求
		String newpassword= request.getParameter("xinmima");
		HttpSession session = request.getSession();
		String user =(String)session.getAttribute("systemUser");//获取当前登录用户信息
		String sql="SELECT Apassword FROM administrator WHERE Aname='"+user+"'";
        Database database =new Database();
        database.selectSql(sql);
        PrintWriter out = response.getWriter();
        ResultSet res =database.selectSql(sql);
        response.setContentType("text/html;charset=utf-8");
        try {
        	res.next();
       
        		String password=res.getString(1);
    			if(password.equals(oldpassword)){//判断passwrod与oldpassword值是否相同
    				String sql2="update administrator set Apassword='"+newpassword+"' where Aname='"+user+"'";
    				database.updataSql(sql2);
    				out.println("<p>修改成功</p>");
    			}
    			else{
    				out.println("<p>修改失败</p>");
    				
    			}
    		
        
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
			
		}//取出res中  第一列的返回值。
		finally {
			database.closeDatabase();	//关闭数据库	
			
		}
}
}