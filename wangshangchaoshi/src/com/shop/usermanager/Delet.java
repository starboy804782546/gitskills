package com.shop.usermanager;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.shangpinguanli.FenleiManager;

/**
 * Servlet implementation class Delet
 */
@WebServlet("/Delet")
public class Delet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Delet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String value = request.getParameter("id");
		if (new UserManager().deleteOne(value)) {
			response.sendRedirect("jsp/h_kehuguanli.jsp");
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

		if (new UserManager().delete(values)) {
			response.sendRedirect("jsp/h_kehuguanli.jsp");
		}
		return;
	}
}
