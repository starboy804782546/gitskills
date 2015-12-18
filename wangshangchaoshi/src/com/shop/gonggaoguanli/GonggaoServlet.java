package com.shop.gonggaoguanli;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.database.Database;
import com.shop.gonggaoguanli.UserGonggaoguanli;

@WebServlet("/GonggaoServlet")
public class GonggaoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public GonggaoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bianhao = request.getParameter("bianhao");
		if (new UserGonggaoguanli().deleteOne(bianhao)) {
			response.sendRedirect("jsp/h_gonggao.jsp");
		}
		return;
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameterValues("checkbox")==null){
			return;
		}
		String values[] = request.getParameterValues("checkbox");

		if (new UserGonggaoguanli().delete(values)) {
			response.sendRedirect("jsp/h_gonggao.jsp");
		}
		return;
	}
	

}
