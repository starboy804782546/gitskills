package com.shop.systemadmin;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.shop.database.Database;

public class UserGuanli {
Database data;
ResultSet res;
	public UserGuanli(){
		data =new Database();
	}
	public ArrayList getAll(){
		ArrayList list=new ArrayList();
		String sql= "SELECT*FROM administrator";
		res= data.selectSql(sql);
		try {
			while(res.next()){
				SaveUser user=new SaveUser();
				
				user.setAno(res.getString("Ano"));
				user.setAname(res.getString("Aname"));
				list.add(user);
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	return list;
	}
	public boolean delOne(String id){
		String sql="DELETE FROM administrator WHERE Ano='"+id+"'";
		data.updataSql(sql);
		return true;
	}
	
}
