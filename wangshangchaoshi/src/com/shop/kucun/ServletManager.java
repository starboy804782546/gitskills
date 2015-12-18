package com.shop.kucun;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.crypto.Data;

import com.shop.shangpinguanli.ListManager;
import com.shop.shangpinguanli.SousuoBean;

/**
 * Servlet implementation class ServletManager
 */
@WebServlet(name = "KucunServlet", urlPatterns = { "/KucunServlet" })
public class ServletManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletManager() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);return;
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getServletPath();
		path = path.substring(1, path.length() - 6);
	
		switch (path) {
		case "kucunsousuo":
			kucunSouSuo(request,response);
			
			break;
		case "addshuliang":
			addShuLiang(request,response);
		}
		return ;
	}

	private void addShuLiang(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		int number = Integer.parseInt(request.getParameter("number"));
		double jinjia = Double.parseDouble(request.getParameter("jinjia"));
		double zongjine= Double.parseDouble(request.getParameter("zongjine"));
		
		String date = request.getParameter("riqi");
		System.out.println(date);
		System.out.println(id);
		//new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse("2013-07-29 10:52:00");
		
	}

	private void kucunSouSuo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fenlei = request.getParameter("fenlei");
		String gongyingshang = request.getParameter("gongyingshang");
		String sousuo = request.getParameter("sousuo");
		if (fenlei.equals("全部")) {
			fenlei = null;
		}
		if (gongyingshang.equals("全部")) {
			gongyingshang = null;
		}
		if (sousuo.equals("") || sousuo.length() == 0) {
			sousuo = null;
		}
		SousuoBean sousuobean = new SousuoBean();
		sousuobean.setFenlei(fenlei);
		sousuobean.setGongyingshang(gongyingshang);
		sousuobean.setSousuo(sousuo);
		ListManager manager = new ListManager();
		ArrayList list = manager.sousuoGet(sousuobean.getFenlei(), sousuobean.getGongyingshang(),
				sousuobean.getSousuo());
		request.setAttribute("jieguo", list);
		request.getRequestDispatcher("jsp/h_AddProductList.jsp").forward(request, response);
	
		
	}

}
