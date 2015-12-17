package com.shop.shangpinguanli;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.shop.database.Database;

public class GongyingshangManager {
Database data  = null;
ResultSet res = null;
public GongyingshangManager() {
	data = new Database();
}
public ArrayList getAll() {
	ArrayList list = new ArrayList();
	String sql = "select * from supplier";
	res= data.selectSql(sql);
	try {
		while(res.next()){
			GongyingshangBean bean = new GongyingshangBean();
			bean.setId(res.getInt("SUno"));
			bean.setName(res.getString("SUname"));
			bean.setAddress(res.getString("SUaddress"));
			bean.setPhone(res.getString("SUtelephone"));
			bean.setPerson(res.getString("SUperson"));
			list.add(bean);
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return list;
}
}
