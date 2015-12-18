package com.shop.shangpinguanli;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.shop.database.Database;

public class FenleiManager {
	Database data;
	ResultSet res;
	public FenleiManager() {
		 data= new Database();
	}
	public ArrayList getAll() {
		ArrayList list = new ArrayList();
		String sql = "select * from protype";
		res = data.selectSql(sql);
		
		try {
			
			while (res.next()) {
				FenleiBean type = new FenleiBean();
				type.setId(res.getString("PTon"));
				type.setType(res.getString("PTname"));
				type.setDengji(res.getInt("PTdengji"));
				type.setIsview(res.getInt("PTisview"));
				list.add(type);
			}

		} catch (SQLException e) {

			System.out.println("Manager.java:22");
			e.printStackTrace();
		}
		return list;
	}
	public ArrayList getOne(int id){
		String sql = "select * from protype where PTon="+id+"";
		ArrayList list = new ArrayList();
		res = data.selectSql(sql);
		try {
			res.next();
			FenleiBean type = new FenleiBean();
			type.setId(res.getString("PTon"));
			type.setType(res.getString("PTname"));
			type.setDengji(res.getInt("PTdengji"));
			type.setIsview(res.getInt("PTisview"));
			list.add(type);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
		
	}
	public boolean deleteOne(String value){
		String sql="delete from protype where PTon='"+value+"'";
		return data.updataSql(sql);
	}
	public boolean delete(String[] values){
		for(int i=0;i<values.length;i++){
			String sql="delete from protype where PTon='"+values[i]+"'";
			if(data.updataSql(sql)==false){
				return false;
			}
		}
		return true;
	}
	public boolean addType(String name,int dengji,int isview){
	
		String sql = "insert into protype(PTname,PTdengji,PTisview) values('"+name+"',"+dengji+","+isview+")";
		String select = "select * from protype where PTname='"+name+"'";
		res = data.selectSql(select);
		try {
			if(res.next()){
				return false;
			}
			else{
				data.updataSql(sql);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return true;
	}
	public boolean editType(int id ,String name,int dengji,int isview){
		String select = "select * from protype where PTname = '"+name+"'";
		String sql = "UPDATE protype SET PTname='"+name+"',PTdengji="+dengji+",PTisview="+isview+" WHERE PTon="+id+"";
		res = data.selectSql(select);
		try {
			if(res.next()){
				return false;
			}
			else{
				data.updataSql(sql);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return true;
	}
}
