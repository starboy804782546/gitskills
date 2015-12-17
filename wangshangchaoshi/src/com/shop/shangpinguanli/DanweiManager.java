package com.shop.shangpinguanli;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.shop.database.Database;

public class DanweiManager {
	Database data;
	ResultSet res;

	public DanweiManager() {
		data = new Database();
	}
	public ArrayList getAll(){
		String sql="select * from danwei";
		ArrayList list = new ArrayList();
		res=data.selectSql(sql);
		try {
			while(res.next()){
				DanweiBean danwei = new DanweiBean();
				danwei.setNo(res.getInt("DWno"));
				danwei.setName(res.getString("DWname"));
				list.add(danwei);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	public boolean deleteOne(String value){
		String sql= "delete from danwei where DWno="+value+"";
		return data.updataSql(sql);
	}
	public boolean delete(String values[]){
		for(int i=0;i<values.length;i++){
			String sql="delete from danwei where DWno='"+values[i]+"'";
			if(data.updataSql(sql)==false){
				return false;
			}
		}
		return true;
	}
	public boolean addDanwei(String value){
		String sql ="insert into danwei (DWname) values('"+value+"')";
		String select="select * from danwei where DWname='"+value+"'";
		res=data.selectSql(select);
		try {
			if(res.next())
			return false;
			else
				data.updataSql(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return true;
	}
}
