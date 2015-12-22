package com.shop.h_order;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.shangpinguanli.FenleiManager;

/**
 * Servlet implementation class 
 */
@WebServlet("/Supplieredit")
public class Dingdanupd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Dingdanupd() {
        super();
        // TODO Auto-generated constructor stub
    }
    
 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	doPost(request,response);
	}
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		int id = Integer.parseInt(request.getParameter("id"));
	//	int state = Integer.parseInt(request.getParameter("state"));
	//	System.out.println(id);
	//	System.out.println(state);
		new DingdanManager().editType(id);
		response.sendRedirect("jsp/h_orderfh.jsp");
	}

}
