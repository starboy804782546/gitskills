package com.shop.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
public class Database {
	Connection con= null;
	Statement sta=null;
	ResultSet res=null;
	PreparedStatement ps=null;
	public Database() {//创建数据库连接
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			System.out.println("驱动错");
		}
		try{
			String url="jdbc:mysql://127.0.0.1:3306/chaoshi";
			String uname="root";
			String passwd="root";
			con=DriverManager.getConnection(url,uname,passwd);
			sta=con.createStatement();	
		}catch(Exception e){
			System.out.println("连接错误");
		}
		
	}
	public void closeDatabase(){
		if(con!=null){
			try {
				res.close();sta.close();con.close();
			} catch (SQLException e) {
				System.out.println("close()异常");
				
				e.printStackTrace();
			}
		}
	}
	public ResultSet selectSql(String sql){//通过sql查询
		
		try {
			
			res=sta.executeQuery(sql);
		} catch (SQLException e) {
			System.out.println("chaxunSql 错误");
		}
		return res;
	}
	public boolean updataSql(String sql){
		try {
			ps=con.prepareStatement(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("sql错误");
			e.printStackTrace();
		}
		try {
			ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("数据库更新错误：Database.java:63");
			e.printStackTrace();
			return false;
		}
		return true;
	}
}//res=sta.executeQuery(sql);