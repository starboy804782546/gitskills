package com.shop.usermanager;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.h_supplier.SupplierManager;

/**
 * Servlet implementation class editcustomer
 */
@WebServlet("/editcustomer")
public class editcustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editcustomer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String cname = request.getParameter("cname");
		String ctel = request.getParameter("ctel");
		String cadress = request.getParameter("cadress");
		String cadress2 = request.getParameter("cadress2");
		String cadress3 = request.getParameter("cadress3");
		String cremark = request.getParameter("cremark");
		
		new UserManager().editinformation(cname,ctel,cadress,cadress2,cadress3,cremark);
		response.sendRedirect("jsp/kehuziliao.jsp");
	}

}
