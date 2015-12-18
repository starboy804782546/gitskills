package com.shop.h_supplier;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.shop.database.Database;
import com.shop.shangpinguanli.FenleiBean;

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
	
	public  ArrayList findOneUser(String name){
		ResultSet res = null;
		ArrayList list = new ArrayList();
		Database data = new Database();
		//	String sql = "select * from supplier where SUname LIKE  '%"+name+"%'";
		
		//System.out.println(name);
		if(name.equals("")){
			name="%%";
		}else{
			name="%"+name+"%";
		}
			String sql = "select * from supplier where SUname LIKE  '"+name+"'";
			System.out.println(sql);
		res = data.selectSql(sql);
		try{
			while(res.next()){	
				SupplierBean type=new SupplierBean();
				type.setId(res.getInt("SUno"));
				type.setSuname(res.getString("SUname"));
				type.setSuaddress(res.getString("SUaddress"));
				type.setSutelephone(res.getString("SUtelephone"));
				type.setSuperson(res.getString("SUperson"));
				list.add(type);
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}	
		return list;
	}
	
	public ArrayList getOne(int id){
		String sql = "select * from supplier where SUno="+id+"";
		ArrayList list = new ArrayList();
		res = data.selectSql(sql);
		try {
			res.next();
			SupplierBean type=new SupplierBean();
			type.setId(res.getInt("SUno"));
			type.setSuname(res.getString("SUname"));
			type.setSuaddress(res.getString("SUaddress"));
			type.setSutelephone(res.getString("SUtelephone"));
			type.setSuperson(res.getString("SUperson"));
			list.add(type);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
		
	}
	public boolean editType(int id ,String name,String adress,String tel,String person){
		String sql = "UPDATE supplier SET SUname='"+name+"',SUaddress='"+adress+"',SUtelephone='"+tel+"',SUPerson='"+person+"' WHERE SUno="+id+";";
	//	String sql = "UPDATE supplier SET SUname='"+name+"',SUaddress="+adress+",SUtelephone="+tel+",SUPerson="+person+" WHERE SUno="+id+"";
		data.updataSql(sql);
		return true;
	}
}