package com.shop.h_supplier;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.database.Database;


/**
 * Servlet implementation class AllServlet
 */
@WebServlet("/AllServlet")
public class AllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AllServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
		return;
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getServletPath();
		path = path.substring(1, path.length() - 9);
		System.out.println(path);
		switch (path) {
		case "Delete":
			sudelete(request, response);
			break;
		case "DeleteOne":
			sudeleteone(request, response);
			break;
			
		case "SUadd":
			suadd(request, response);
			break;
		case "SUedit":
			suedit(request, response);
			break;
		default:
			break;
		}
		return;
	}
	private void sudelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(request.getParameterValues("checkbox")==null){
			return;
		}
		String values[] = request.getParameterValues("checkbox");

		if (new SupplierManager().delete(values)) {
			response.sendRedirect("jsp/h_supplier.jsp");
		}
		return;
	}



	private void sudeleteone(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String value = request.getParameter("id");
		if (new SupplierManager().deleteOne(value)) {
			response.sendRedirect("jsp/h_supplier.jsp");
		}
		return;

	}
	
	private void suadd(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		Database db = new Database();
		String name = request.getParameter("SUname");
		String adress = request.getParameter("SUadress");
		String tel=request.getParameter("SUtel");
		String person= request.getParameter("SUperson");
		String sql =" INSERT INTO chaoshi.supplier(SUname,SUaddress,SUtelephone,SUPerson)values('"+name+"','"+adress+"','"+tel+"','"+person+"')";
		//String sql = "insert into shop.test(Szh,Sname,Spassword,STel) value('"+no+"','"+name+"','"+pw+"','"+tel+"')";
		db.updataSql(sql);
		request.getRequestDispatcher("/jsp/h_supplier.jsp").forward(request, response);
	}
	private void suedit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String adress = request.getParameter("adress");
		String tel = request.getParameter("tel");
		String person = request.getParameter("person");
		new SupplierManager().editType(id,name,adress,tel,person);
		response.sendRedirect("jsp/h_supplier.jsp");
	}
	
}
