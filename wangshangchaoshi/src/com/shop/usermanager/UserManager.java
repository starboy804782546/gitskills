package com.shop.usermanager;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.shop.database.Database;
import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

public class UserManager {

	public  ArrayList<User> AllUsers() {
		String sql = "select * from customer";

		Database data = new Database();
		ResultSet res = data.selectSql(sql);
		ArrayList<User> list = new ArrayList<>();
		try {
			while (res.next()) {
				User user = new User();
				user.setZhanghao(res.getString("Cno"));
				user.setMima(res.getString("Cpassword"));
				user.setXingming(res.getString("Cname"));
				user.setDianhua(res.getString("Ctelephone"));
				user.setDizhi(res.getString("Caddress"));
				user.setBeizhu(res.getString("Cremark"));
				list.add(user);
				//System.out.println(res.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	

	public boolean deleteOne(String value){
		Database data = new Database();
		String sql="delete from customer where Cno='"+value+"'";
		return data.updataSql(sql);
	}
	
	public boolean delete(String[] values){
		Database data = new Database();
		for(int i=0;i<values.length;i++){
			String sql="delete from customer where Cno='"+values[i]+"'";
			if(data.updataSql(sql)==false){
				return false;
			}
		}
		return true;
	}
	
	public  ArrayList<User> findOneUser(String zhanghao){
		ResultSet res = null;
		ArrayList<User> list = new ArrayList<User>();
		Database data = new Database();
		if(zhanghao.equals(""))
		{
			zhanghao="%%";
		}else
			zhanghao="%"+zhanghao+"%";
		String sql = "select * from customer where Cno like '"+zhanghao+"'";
		res = data.selectSql(sql);
		try{
			while(res.next()){	
				User user = new User();
				user.setZhanghao(res.getString("Cno"));
				user.setMima(res.getString("Cpassword"));
				user.setXingming(res.getString("Cname"));
				user.setDianhua(res.getString("Ctelephone"));
				user.setDizhi(res.getString("Caddress"));
				user.setDizhi1(res.getString("Caddress2"));
				user.setDizhi2(res.getString("Caddress3"));
				user.setBeizhu(res.getString("Cremark"));
				list.add(user);
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}	
		return list;
	}
	
	public  ArrayList<User> findinformation(String User){
		ResultSet res = null;
		ArrayList<User> list = new ArrayList<User>();
		Database data = new Database();
		String sql = "select * from customer where Cname = '"+User+"'";
		res = data.selectSql(sql);
		try{
			while(res.next()){	
				User user = new User();
				user.setZhanghao(res.getString("Cno"));
				//user.setMima(res.getString("Cpassword"));
				user.setXingming(res.getString("Cname"));
				user.setDianhua(res.getString("Ctelephone"));
				user.setDizhi(res.getString("Caddress"));
				user.setDizhi1(res.getString("Caddress2"));
				user.setDizhi2(res.getString("Caddress3"));
				user.setBeizhu(res.getString("Cremark"));
				list.add(user);
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}	
		return list;
	}
	
	
	
	public boolean editinformation(String name,String tel,String adress,String adress2,String adress3,String remark){
		Database data = new Database();
		String sql = "UPDATE customer SET Cname = '"+name+"',Ctelephone='"+tel+"',Caddress='"+adress+"',Caddress2='"+adress2+"',Caddress3='"+adress3+"',Cremark='"+remark+"' WHERE Cname='"+name+"';";
	//	String sql = "UPDATE supplier SET SUname='"+name+"',SUaddress="+adress+",SUtelephone="+tel+",SUPerson="+person+" WHERE SUno="+id+"";
		data.updataSql(sql);
		return true;
	}


	public boolean chongzhimoney(String id ,Double money){
		String sql2 = "select * from customer where cno='"+id+"'";
		Database data = new Database();
		ResultSet res = null;
		boolean i = true;
		res=data.selectSql(sql2);
		try {
			if(res.next()){
				String sql = "UPDATE customer SET Cmoney = Cmoney+"+money+" WHERE Cno = '"+id+"';";

			i=data.updataSql(sql);
				
				return i;
			}
			else return false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	
	
}
