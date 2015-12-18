package com.shop.gonggaoguanli;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.database.Database;

/**
 * Servlet implementation class GonggaoAdd
 */
@WebServlet("/GonggaoAdd")
public class GonggaoAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GonggaoAdd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		Database db = new Database();
		String neirong = request.getParameter("neirong");
		String shijian = request.getParameter("shijian");
		String biaoti=request.getParameter("biaoti");

		String sql =" INSERT INTO chaoshi.gonggao(Gnr,Gdate,Gbt)values('"+neirong+"','"+shijian+"','"+biaoti+"')";
		db.updataSql(sql);
		request.getRequestDispatcher("/jsp/h_gonggao.jsp").forward(request, response);
		doGet(request, response);
	}

}
