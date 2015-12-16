package com.shop.h_supplier;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.shop.database.Database;

public class SupplierManager {

	Database data;
	ResultSet res;
	public SupplierManager() {
		 data= new Database();
	}
	public ArrayList getAll() {
		ArrayList list = new ArrayList();
		String sql = "select * from supplier";
		res = data.selectSql(sql);
		
		try {
			
			while (res.next()) {
				SupplierBean type=new SupplierBean();
				type.setId(res.getInt("SUno"));
				type.setSuname(res.getString("SUname"));
				type.setSuaddress(res.getString("SUaddress"));
				type.setSutelephone(res.getString("SUtelephone"));
				type.setSuperson(res.getString("SUperson"));
				list.add(type);
			}

		} catch (SQLException e) {

			System.out.println("SupplierManager.java:22");
			e.printStackTrace();
		}
		return list;
	}
	public boolean deleteOne(String value){
		String sql="delete from supplier where SUno='"+value+"'";
		return data.updataSql(sql);
	}
	public boolean delete(String[] values){
		for(int i=0;i<values.length;i++){
			String sql="delete from supplier where SUno='"+values[i]+"'";
			if(data.updataSql(sql)==false){
				return false;
			}
		}
		return true;
	}

}
