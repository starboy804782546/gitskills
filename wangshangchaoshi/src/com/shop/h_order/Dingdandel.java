package com.shop.h_order;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class Dingdandel
 */
@WebServlet("/Dingdandel")
public class Dingdandel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Dingdandel() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String value = request.getParameter("id");
		System.out.println(value);
		if (new DingdanManager().deleteOne(value)) {
			response.sendRedirect("jsp/h_order.jsp");
		}
		return;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(request.getParameterValues("checkbox")==null){
			return;
		}
		String values[] = request.getParameterValues("checkbox");

		if (new DingdanManager().delete(values)) {
			response.sendRedirect("jsp/h_order.jsp");
		}
		return;
	}
}
