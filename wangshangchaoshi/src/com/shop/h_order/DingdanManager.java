package com.shop.h_order;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.shop.database.Database;
import com.shop.h_order.DingdanBean;

public class DingdanManager {
	Database data;
	ResultSet res;

	public DingdanManager() {
		data = new Database();
	}

	public ArrayList getAll() {
		ArrayList list = new ArrayList();
		String sql = "SELECT orders.Ono,customer.Cname,orders.Oaddress,orders.Odate,orders.Ostate,orders.Oreason FROM orders,customer WHERE orders.Cno=customer.Cno";
		res = data.selectSql(sql);

		try {

			while (res.next()) {
				DingdanBean type = new DingdanBean();
				type.setId(res.getInt("Ono"));
				
				type.setOcname(res.getString("Cname"));
				type.setOaddress(res.getString("Oaddress"));
			//	type.setOcno(res.getString("Con"));
			//	type.setPno(res.getInt("Pno"));
			//	type.setOano(res.getString("Asno"));
				type.setOdate(res.getString("Odate"));
			//	type.setOquantity(res.getInt("Oquantity"));
			//	type.setOsum(res.getDouble("Osum"));
				type.setOstate(res.getInt("Ostate"));
				type.setOreason(res.getString("Oreason"));
				list.add(type);
			}

		} catch (SQLException e) {

			System.out.println("Manager.java:22");
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList orderfh() {
		ArrayList list = new ArrayList();
		String sql = "	SELECT orders.Ono,customer.Cname,orders.Oaddress,orders.Odate,orders.Ostate,orders.Oreason FROM orders,customer WHERE orders.Cno=customer.Cno AND( orders.Ostate='0' OR orders.Ostate='3' )";
		res = data.selectSql(sql);

		try {

			while (res.next()) {
				DingdanBean type = new DingdanBean();
				type.setId(res.getInt("Ono"));
				
				type.setOcname(res.getString("Cname"));
				type.setOaddress(res.getString("Oaddress"));
			//	type.setOcno(res.getString("Con"));
			//	type.setPno(res.getInt("Pno"));
			//	type.setOano(res.getString("Asno"));
				type.setOdate(res.getString("Odate"));
			//	type.setOquantity(res.getInt("Oquantity"));
			//	type.setOsum(res.getDouble("Osum"));
				type.setOstate(res.getInt("Ostate"));
				type.setOreason(res.getString("Oreason"));
				list.add(type);
			}

		} catch (SQLException e) {

			System.out.println("Manager.java:22");
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean deleteOne(String value) {
		String sql = "delete from orders where Ono='" + value + "'";
		return data.updataSql(sql);
	}

	public boolean delete(String[] values) {
		for (int i = 0; i < values.length; i++) {
			String sql = "delete from orders where Ono='" + values[i] + "'";
			if (data.updataSql(sql) == false) {
				return false;
			}
		}
		return true;
	}

	
	
	public ArrayList findOneUser(String name) {
		ResultSet res = null;
		ArrayList list = new ArrayList();
		Database data = new Database();
		String sql = "SELECT orders.Ono,customer.Cname,orders.Oaddress,orders.Odate,orders.Ostate,orders.Oreason FROM orders,customer WHERE orders.Cno=customer.Cno and Ono = '" + name + "'";
		res = data.selectSql(sql);
		try {
			while (res.next()) {
				DingdanBean type = new DingdanBean();
				type.setId(res.getInt("Ono"));

				type.setOcname(res.getString("Cname"));
				type.setOaddress(res.getString("Oaddress"));
				// type.setOcno(res.getString("Con"));
				// type.setPno(res.getInt("Pno"));
				// type.setOano(res.getString("Asno"));
				type.setOdate(res.getString("Odate"));
				// type.setOquantity(res.getInt("Oquantity"));
				// type.setOsum(res.getDouble("Osum"));
				type.setOstate(res.getInt("Ostate"));
				type.setOreason(res.getString("Oreason"));

				list.add(type);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList dingdanxiangxi(String Ono) {
		ResultSet res = null;
		ArrayList list = new ArrayList();
		Database data = new Database();
	//	System.out.println(Ono);
		String sql = "SELECT orders.Ono,customer.Cname,orders.Oaddress,orders.Odate,o"+Ono+".Pname,o"+Ono+".Pnumber,o"+Ono+".Pjiage,orders.Ozongjine,orders.Ostate,orders.Oreason FROM orders,customer,o"+Ono+" WHERE orders.Cno=customer.Cno AND orders.Ono='"+Ono+"'";
		
	//	String sql = "SELECT orders.Ono,customer.Cname,orders.Oaddress,orders.Odate,oOno.Pname,oOno.Pnumber,oOno.Pjiage,orders.Ozongjine,orders.Ostate,orders.Oreason FROM orders,oOno,customer WHERE orders.Cno=customer.Cno AND orders.Ono='Ono'";
		System.out.println(sql);
		res = data.selectSql(sql);
		try {
			while (res.next()) {
				DingdanBean type = new DingdanBean();
				type.setId(res.getInt("Ono"));
				type.setOcname(res.getString("Cname"));
				type.setOaddress(res.getString("Oaddress"));
				type.setOdate(res.getString("Odate"));
				type.setPname(res.getString("Pname"));
				type.setPnumber(res.getInt("Pnumber"));
				type.setPjiage(res.getDouble("Pjiage"));
				type.setOzongjine(res.getDouble("Ozongjine"));
				type.setOstate(res.getInt("Ostate"));
				type.setOreason(res.getString("Oreason"));
				list.add(type);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	

	public ArrayList getOne(int id){
		String sql = "select * from orders where Ono="+id+"";
		ArrayList list = new ArrayList();
		res = data.selectSql(sql);
		try {
			res.next();
			DingdanBean type = new DingdanBean();
			type.setId(res.getInt("Ono"));

			type.setOcname(res.getString("Cname"));
			type.setOaddress(res.getString("Oaddress"));
			// type.setOcno(res.getString("Con"));
			// type.setPno(res.getInt("Pno"));
			// type.setOano(res.getString("Asno"));
			type.setOdate(res.getString("Odate"));
			// type.setOquantity(res.getInt("Oquantity"));
			// type.setOsum(res.getDouble("Osum"));
			type.setOstate(res.getInt("Ostate"));
			type.setOreason(res.getString("Oreason"));
			
			list.add(type);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
		
	}
	
	
//	public boolean addType(int id, String Ocno, int Pno, String Oano, String Odate, int Oquantity, double Osum,
//			int Ostate, int Rno) {
//		String sql = "insert into orders(Ono,Con,Pno,Asno,Odate,Oquantity,Osum,Ostate) values(" + id + "," + Ocno + ","
//				+ Pno + "," + Oano + "," + Odate + "," + Oquantity + "," + Osum + "," + Oquantity + "," + Rno + ")";
//		data.updataSql(sql);
//		return true;
//	}

	public boolean editType(int id) {
		String sql = "UPDATE orders SET Ostate='1' WHERE Ono='"+id+"';";
	//	System.out.println(sql);
		// String sql = "UPDATE supplier SET
		// SUname='"+name+"',SUaddress="+adress+",SUtelephone="+tel+",SUPerson="+person+"
		// WHERE SUno="+id+"";
		data.updataSql(sql);
		return true;
	}

}
