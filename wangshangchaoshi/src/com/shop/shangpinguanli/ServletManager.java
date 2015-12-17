package com.shop.shangpinguanli;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Delete
 */
@WebServlet("/Delete")
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

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
		path = path.substring(1, path.length() - 9);
		switch (path) {
		case "deldanwei":
			delDanwei(request, response);
			break;
		case "adddanwei":
			adddanwei(request, response);
			break;
		case "typeDelete":
			delFenlei(request, response);
			break;
		case "typeDeleteOne":
			delFenleiOne(request, response);
			break;
		case "liebiaosousuo":
			liebiaosousuo(request, response);
			break;
		case "deleteshangpin":
			deleteshangpin(request, response);
			break;
		case "addfenlei":
			addfenlei(request, response);
		case "editfenlei":
			editfenlei(request, response);
		default:
			break;
		}
		return;
	}

	private void editfenlei(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(request.getParameter("id")==null)
			return;
		int id = Integer.parseInt(request.getParameter("id"));
		
		String name = request.getParameter("name");
		int dengji = Integer.parseInt(request.getParameter("dengji"));
		int isview = Integer.parseInt(request.getParameter("isview"));
		if(	new FenleiManager().editType(id, name, dengji, isview)){
			request.setAttribute("xinxi", "修改成功");
			request.getRequestDispatcher("jsp/h_fenlei.jsp").forward(request, response);
		}
		else{
			request.setAttribute("xinxi", "该类别已经存在");
			request.getRequestDispatcher("jsp/h_fenleiedit.jsp").forward(request, response);
		}
	
		

	}

	private void addfenlei(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		int dengji = Integer.parseInt(request.getParameter("dengji"));
		int isview = Integer.parseInt(request.getParameter("isview"));
		String xinxi;
		if(new FenleiManager().addType(name, dengji, isview)){
			 xinxi="添加成功";
			request.setAttribute("xinxi",xinxi);
		}else{
			xinxi="该类别已经存在";
			request.setAttribute("xinxi",xinxi);
		}
		
		request.getRequestDispatcher("jsp/h_fenleiadd.jsp").forward(request, response);

	}

	private void deleteshangpin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ListManager manager = new ListManager();
		if (request.getParameter("id") == null) {

			if (request.getParameterValues("checkbox") == null)
				return;
			String values[] = request.getParameterValues("checkbox");
			if (manager.delete(values)) {
				try {
					response.sendRedirect("jsp/h_shangpin.jsp");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		} else {
			String id = request.getParameter("id");
			if (manager.deleteOne(id)) {
				try {
					response.sendRedirect("jsp/h_shangpin.jsp");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

	}

	private void liebiaosousuo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
		request.getRequestDispatcher("jsp/h_shangpin.jsp").forward(request, response);
	}

	private void delFenleiOne(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String value = request.getParameter("id");
		if (new FenleiManager().deleteOne(value)) {
			request.getRequestDispatcher("jsp/h_fenlei.jsp").forward(request, response);
		}
	}

	private void delFenlei(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String values[] = request.getParameterValues("checkbox");
		if (new FenleiManager().delete(values)) {
			
			request.getRequestDispatcher("jsp/h_fenlei.jsp").forward(request, response);
		}

	}

	private void delDanwei(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String xinxi;
		String value = request.getParameter("id");
		if (new DanweiManager().deleteOne(value)) {
			xinxi = "删除成功";
			request.setAttribute("xinxi", xinxi);
			request.getRequestDispatcher("jsp/h_danwei.jsp").forward(request, response);
		}

	}

	private void adddanwei(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String value = request.getParameter("tianjia");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String xinxi;
		if (value.equals("")) {
			xinxi = "请输入单位名称";
			request.setAttribute("xinxi", xinxi);
			request.getRequestDispatcher("jsp/h_danwei.jsp").forward(request, response);
			return;
		}
		if (new DanweiManager().addDanwei(value)) {
			xinxi = "添加成功";
			request.setAttribute("xinxi", xinxi);
			request.getRequestDispatcher("jsp/h_danwei.jsp").forward(request, response);
			return;
		} else {
			xinxi = "该单位已经存在";
			request.setAttribute("xinxi", xinxi);
			request.getRequestDispatcher("jsp/h_danwei.jsp").forward(request, response);
			return;
		}

	}

	private void delalldanwei(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameterValues("checkbox") == null) {
			return;
		}

		String values[] = request.getParameterValues("checkbox");
		String xinxi;

		if (new FenleiManager().delete(values)) {
			xinxi = "删除成功";
			request.setAttribute("xinxi", xinxi);
			request.getRequestDispatcher("jsp/h_fenlei.jsp").forward(request, response);
		}
		return;
	}

}
