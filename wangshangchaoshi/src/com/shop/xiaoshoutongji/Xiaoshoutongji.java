package com.shop.xiaoshoutongji;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.shop.database.Database;
import com.shop.xiaoshoutongji.User;
import com.sun.org.apache.xerces.internal.util.SynchronizedSymbolTable;

public class Xiaoshoutongji {

	public ArrayList<User> Allxiaoshou() {
		String sql = "select produc.Pname,rukulist.Rnumber,Rnumber-Spnumber as xiaoshouliang,produc.Pprice*(Rnumber-Spnumber) as xiaoshoue from produc,rukulist,spnumber where produc.Pno=rukulist.Pno and spnumber.Pno=rukulist.Pno";
		Database data = new Database();
		ResultSet res = data.selectSql(sql);
		ArrayList<User> list = new ArrayList<>();
		try {
			while (res.next()) {
				User user = new User();
				user.setPname(res.getString("Pname"));
				user.setSPnumber(res.getString("Rnumber"));
				user.setOquantity(res.getString("xiaoshouliang"));
				user.setOsum(res.getString("xiaoshoue"));
				list.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public  ArrayList<User> findOnexiaoshou(String pname){
		ResultSet res = null;
		ArrayList<User> list = new ArrayList<User>();
		Database data = new Database();
		if(pname.equals(""))
		{
			pname="%%";
		}else
			pname="%"+pname+"%";
		String sql = "select produc.Pname,rukulist.Rnumber,Rnumber-Spnumber as xiaoshouliang,produc.Pprice*(Rnumber-Spnumber) as xiaoshoue from produc,rukulist,spnumber where produc.Pno=rukulist.Pno and spnumber.Pno=rukulist.Pno and Pname like'"+pname+"'";
		res = data.selectSql(sql);
		try{
			while(res.next()){	
				User user = new User();
				user.setPname(res.getString("Pname"));
				user.setSPnumber(res.getString("Rnumber"));
				user.setOquantity(res.getString("xiaoshouliang"));
				user.setOsum(res.getString("xiaoshoue"));
				list.add(user);
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}	
		return list;
	}
}
