package com.shop.repertory;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.h_supplier.SupplierManager;

/**
 * Servlet implementation class rukulistdelall
 */
@WebServlet("/rukulistdelall")
public class rukulistdelall extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public rukulistdelall() {
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
		if(request.getParameterValues("checkbox")==null){
			return;
		}
		String values[] = request.getParameterValues("checkbox");

		if (new RepertoryManager().delete(values)) {
			response.sendRedirect("jsp/h_rukulist.jsp");
		}
		return;
	}

}
