package com.shop.h_supplier;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.database.Database;

/**
 * Servlet implementation class SupplierAdd
 */
@WebServlet("/SupplierAdd")
public class SupplierAdd extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");

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

}
