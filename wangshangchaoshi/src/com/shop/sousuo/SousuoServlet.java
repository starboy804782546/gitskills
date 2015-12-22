package com.shop.sousuo;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.shangpinguanli.ShangpinBean;

/**
 * Servlet implementation class SousuoServlet
 */
@WebServlet("*.sousuo")
public class SousuoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SousuoServlet() {
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
		doPost(request, response);
		return;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getServletPath();
		path = path.substring(1, path.length() - 7);

		switch (path) {
		case "sousuo":
			souSuo(request, response);
			break;
		case "xiangxi":
			xiangXi(request,response);break;
		case "fenlei":
			FenLeiChanKan(request,response);break;
		}
		return;
	}

	private void FenLeiChanKan(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String id = request.getParameter("id");
		SousuoManager manager = new SousuoManager();
		SousuoTiaojian tiaojian = new SousuoTiaojian();
		tiaojian.setDaohang(id);
		tiaojian.setSousuo(null);
		ArrayList<ShangpinBean> list = manager.getList(tiaojian.getSousuo(), tiaojian.getDaohang());
		request.setAttribute("list", list);
		request.getRequestDispatcher("jsp/list.jsp").forward(request, response);
	}

	private void xiangXi(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		SousuoManager manager = new SousuoManager();
		ArrayList<ShangpinBean> list = manager.getOne(id);
		request.setAttribute("list", list);
		request.getRequestDispatcher("jsp/ShangpinXiangxi.jsp").forward(request, response);
		
	}

	private void souSuo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sousuo = request.getParameter("sousuo");
		SousuoManager manager = new SousuoManager();
		SousuoTiaojian tiaojian = new SousuoTiaojian();
		tiaojian.setDaohang(null);
		tiaojian.setSousuo(sousuo);
		ArrayList<ShangpinBean> list = manager.getList(tiaojian.getSousuo(),tiaojian.getDaohang());
		if(sousuo.equals("")){
			request.setAttribute("weizhi", "&nbsp搜索 /全部");
		}else
		request.setAttribute("weizhi","&nbsp搜索 / "+ sousuo);
		request.setAttribute("list", list);
		request.getRequestDispatcher("jsp/list.jsp").forward(request, response);
	}

}
