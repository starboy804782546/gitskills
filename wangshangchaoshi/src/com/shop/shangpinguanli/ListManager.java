package com.shop.shangpinguanli;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.shop.database.Database;

public class ListManager {
	Database data = null;
	ResultSet res = null;

	public ListManager() {
		data = new Database();
	}

	public ArrayList sousuoGet(String fenlei, String gongyingshang, String sousuo) {
		String sql = "SELECT produc.Pno,produc.Pname,protype.PTname,supplier.SUname from produc,protype,supplier where produc.PTon=protype.PTon and produc.Suno=supplier.SUno and Pname like '"+sousuo+"' and PTname like '"+fenlei+"' and SUname like '"+gongyingshang+"'";
		res=data.selectSql(sql);
		ArrayList list = new ArrayList();
		try {
			while(res.next()){
				ListBean listbean = new ListBean();
				listbean.setId(res.getInt("Pno"));
				listbean.setGongyingshang(res.getString("SUname"));
				listbean.setName(res.getString("Pname"));
				listbean.settype(res.getString("PTname"));
				list.add(listbean);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	public boolean delete(String[] values){
		for(int i=0;i<values.length;i++){
			String sql="delete from produc where Pno="+values[i]+"";
			if(data.updataSql(sql)==false){
				return false;
			}
		}
		return true;
	}
	public boolean deleteOne(String value){
		String sql="delete from produc where Pno="+value+"";
		return data.updataSql(sql);
	}
}
