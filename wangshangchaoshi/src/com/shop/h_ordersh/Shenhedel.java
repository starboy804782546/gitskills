package com.shop.h_ordersh;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.shangpinguanli.FenleiManager;

/**
 * Servlet implementation class Dingdandel
 */
@WebServlet("/Shenhedel")
public class Shenhedel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Shenhedel() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
    	int value = Integer.parseInt(request.getParameter("id"));
		
		if (new ShenheManager().deleteOne(value)) {  
			response.sendRedirect("jsp/h_ordersh.jsp");
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

		if (new ShenheManager().delete(values)) {
			response.sendRedirect("jsp/h_ordersh.jsp");
		}
		return;
	}
}
