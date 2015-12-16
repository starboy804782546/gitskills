package com.shop.h_link;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class h_link
 */
@WebServlet("/h_link")
public class h_link extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public h_link() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String id = request.getParameter("id");
		switch (id) {
		case "spsjfx":
			//request.getRequestDispatcher("jsp/h_shujufenxi.jsp").forward(request, response);
			response.sendRedirect("jsp/h_shujufenxi.jsp");
			break;
		case "h_sy":
			response.sendRedirect("jsp/h_index.jsp");
			//request.getRequestDispatcher("jsp/h_index.jsp").forward(request, response);
			break;
		case "spfl":
			//request.getRequestDispatcher("jsp/h_fenlei.jsp").forward(request, response);
			response.sendRedirect("jsp/h_fenlei.jsp");
			break;
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
