package com.shop.kucun;	

import java.sql.ResultSet;
import java.sql.SQLException;

import com.shop.database.Database;

public class GetSystemUserID {

	public int getSystemUserId(String user){
		Database data  = new Database();
		ResultSet res = null;
		String sql = "select Ano from administrator where Aname='"+user+"'";

		res=data.selectSql(sql);
		int id=1;
		try {
			if(res.next())
		 id = res.getInt("Ano");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return id;
	}
}
