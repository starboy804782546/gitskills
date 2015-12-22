package com.shop.kehuziliao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.shop.database.Database;
import com.shop.h_order.DingdanBean;
import com.shop.usermanager.User;

public class KehuManager {
	Database data;
	ResultSet res;

	public KehuManager() {
		data = new Database();
	}
	public ArrayList getAllOno(String Cno) {
		ArrayList list = new ArrayList();
		String sql = "SELECT orders.Ono from orders where Ono in(select Ono from orders where Cno='"+Cno+"')";
		res = data.selectSql(sql);

		try {

			while (res.next()) {
				KehuBean type = new KehuBean();
				type.setOno(res.getInt("Ono"));
				list.add(type);
			}

		} catch (SQLException e) {

			System.out.println("Manager.java:22");
			e.printStackTrace();
		}
		return list;
	}
	public ArrayList getAllorder(int Ono) {
		ArrayList list = new ArrayList();
		String sql = "SELECT orders.Ono,produc.Ptupian,o"+Ono+".Pname,o"+Ono+".Pnumber,o"+Ono+".Pjiage,customer.Cname,orders.Oaddress,orders.Odate,orders.Ozongjine,orders.Ostate FROM orders,customer,produc,o"+Ono+"  WHERE orders.Cno=customer.Cno AND orders.Ono='"+Ono+"' AND produc.Pno=o"+Ono+".Pno" ;

		//String sql = "SELECT orders.Ono,protuc.Ptupian,o"+Ono+".Pname,o"+Ono+".Pnumber,o"+Ono+".Pjiage,customer.Cname,orders.Oaddress,orders.Odate,orders.Ozongjine,orders.Ostate FROM orders,customer,o"+Ono+" ,produc WHERE orders.Cno=customer.Cno AND produc.pno=o"+Ono+".Pno AND orders.Ono='"+Ono+"'" ;
		res = data.selectSql(sql);

		try {

			while (res.next()) {
				KehuBean type = new KehuBean();
				type.setOno(res.getInt("Ono"));
				type.setTupian(res.getString("Ptupian"));
				type.setPname(res.getString("Pname"));
				type.setPnumber(res.getInt("Pnumber"));
				type.setPjiage(res.getDouble("Pjiage"));
				type.setCname(res.getString("Cname"));
				type.setOaddress(res.getString("Oaddress"));
				type.setOdate(res.getString("Odate"));
				type.setOzongjine(res.getDouble("Ozongjine"));
				type.setOstate(res.getInt("Ostate"));
				list.add(type);
			}

		} catch (SQLException e) {

			System.out.println("Manager.java");
			e.printStackTrace();
		}
		return list;
	}
	public ArrayList usermoney(String User){
		ResultSet res = null;
		ArrayList list = new ArrayList();
		Database data = new Database();
		String sql = "select Cmoney from customer where Cname = '"+User+"'";
		res = data.selectSql(sql);
		try{
			while(res.next()){	
				KehuBean type = new KehuBean();
				type.setMoney(res.getDouble("Cmoney"));
				list.add(type);
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}	
		return list;
	}
}
