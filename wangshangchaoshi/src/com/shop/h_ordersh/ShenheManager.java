package com.shop.h_ordersh;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.shop.database.Database;
import com.shop.h_ordersh.ShenheBean;

public class ShenheManager {
	Database data;
	ResultSet res;
	public ShenheManager() {
		 data= new Database();
	}
	public ArrayList getAll() {
		ArrayList list = new ArrayList();
		String sql = "SELECT orders.Ono,customer.Cname,orders.Oaddress,orders.Odate,orders.Ostate,orders.Oreason FROM orders,customer WHERE orders.Cno=customer.Cno AND orders.Ostate='3'";
		res = data.selectSql(sql);

		try {

			while (res.next()) {
				ShenheBean type = new ShenheBean();
				type.setOno(res.getInt("Ono"));
				
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
	public boolean deleteOne(int value){
		String sql="delete from orders where Ono='"+value+"'";
		return data.updataSql(sql);
	}
	public boolean delete(String[] values){
		for(int i=0;i<values.length;i++){
			String sql="delete from reason where Rno='"+values[i]+"'";
			if(data.updataSql(sql)==false){
				return false;
			}
		}
		return true;
	}
	public boolean shenhetuikuan(int id) {
		String sql = "UPDATE orders SET Ostate='4' WHERE Ono='"+id+"';";
	//	System.out.println(sql);
		// String sql = "UPDATE supplier SET
		// SUname='"+name+"',SUaddress="+adress+",SUtelephone="+tel+",SUPerson="+person+"
		// WHERE SUno="+id+"";
		data.updataSql(sql);
		return true;
	}
}
