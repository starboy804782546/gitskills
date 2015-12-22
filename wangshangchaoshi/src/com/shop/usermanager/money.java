package com.shop.usermanager;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class money
 */
@WebServlet("/money")
public class money extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public money() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String usr = request.getParameter("usr");

	//	String cno = request.getParameter("sousuo");
		String cmoney = request.getParameter("money");
		
	//	System.out.println(cno);

		
		double czmoney = Double.parseDouble(cmoney);
		
		if(new UserManager().chongzhimoney(usr,czmoney)){
			request.setAttribute("xinxi", "充值成功！");
			request.getRequestDispatcher("jsp/h_chongzhi2.jsp").forward(request, response);
		}else
		{
			request.setAttribute("xinxi", "客户帐号不存在！");
			request.getRequestDispatcher("jsp/h_chongzhi2.jsp").forward(request, response);
		}
		return;
	}

}
