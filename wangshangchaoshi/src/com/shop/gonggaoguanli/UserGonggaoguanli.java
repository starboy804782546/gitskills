package com.shop.gonggaoguanli;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.shop.database.Database;
import com.shop.h_supplier.SupplierBean;
import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

public class UserGonggaoguanli {

	public  ArrayList<User> AllUsers() {
		String sql = "select * from gonggao";

		Database data = new Database();
		ResultSet res = data.selectSql(sql);
		ArrayList<User> list = new ArrayList<>();
		try {
			while (res.next()) {
				User user = new User();
				user.setBianhao(res.getString("Gno"));
				user.setNeirong(res.getString("Gnr"));
				user.setShijian(res.getString("Gdate"));
				user.setBiaoti(res.getString("Gbt"));
				list.add(user);
				//System.out.println(res.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	

	public boolean deleteOne(String value){
		int values=Integer.parseInt(value);
		Database data = new Database();
		String sql="delete from gonggao where Gno='"+values+"'";
		return data.updataSql(sql);
	}
	
	public boolean delete(String[] values){
		Database data = new Database();
		for(int i=0;i<values.length;i++){
			String sql="delete from gonggao where Gno='"+values[i]+"'";
			if(data.updataSql(sql)==false){
				return false;
			}
		}
		return true;
	}
	
	public ArrayList getOne(int id){
		Database data = new Database();
		String sql = "select * from gonggao where Gno='"+id+"'";
		ArrayList list = new ArrayList();
		ResultSet res = data.selectSql(sql);
		try {
			res.next();
			User user = new User();
			user.setBianhao(res.getString("Gno"));
			user.setBiaoti(res.getString("Gbt"));
			user.setNeirong(res.getString("Gnr"));
			user.setShijian(res.getString("Gdate"));
			
			list.add(user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
		
	}
	public boolean editType(int id,String biaoti,String neirong,String shijian){
		Database data = new Database();

		String sql = "update gonggao set Gbt='"+biaoti+"',Gnr='"+neirong+"',Gdate='"+shijian+"' where Gno="+id+";";
		data.updataSql(sql);
		return true;
	}
}
