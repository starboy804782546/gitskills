package com.shop.repertory;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.h_supplier.SupplierManager;

/**
 * Servlet implementation class rukulistdel
 */
@WebServlet("/rukulistdel")
public class rukulistdel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public rukulistdel() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String value = request.getParameter("id");
		if (new RepertoryManager().deleteOne(value)) {
			response.sendRedirect("jsp/h_rukulist.jsp");
		}
	}

}
