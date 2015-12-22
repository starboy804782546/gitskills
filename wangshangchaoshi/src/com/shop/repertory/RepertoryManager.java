package com.shop.repertory;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.shop.database.Database;


public class RepertoryManager {

	Database data;
	ResultSet res;
	public RepertoryManager() {
		 data= new Database();
	}

	public ArrayList getAll() {
		ArrayList list = new ArrayList();
	//	String sql = "select * from rukulist,produc,protype,danwei,supplier,administrator where rukulist.Pno=produc.Pno AND rukulist.PTno=protype.PTon AND rukulist.DWno=danwei.DWno AND rukulist.Suno=supplier.SUno AND rukulist.Ano=administrator.Ano;";
		String sql = "SELECT rukulist.RukuNo,produc.pname,protype.PTname,supplier.SUname,rukulist.Rdate,administrator.Aname FROM rukulist,produc,protype,supplier,administrator where rukulist.Pno=produc.Pno and rukulist.PTno =protype.PTon and rukulist.Suno=supplier.SUno and administrator.Ano=rukulist.Ano;";
	//	String sql = "select * from rukulist";

		res = data.selectSql(sql);
		try {

			while (res.next()) {
				RepertoryBean type = new RepertoryBean();
				type.setRukuno(res.getInt("rukuno"));
				//System.out.println(res.getInt("rukuno"));
				type.setPname(res.getString("Pname"));
				type.setPTname(res.getString("PTname"));
				type.setSUname(res.getString("SUname"));
				type.setAname(res.getString("Aname"));
				type.setRdate(res.getString("Rdate"));
				//System.out.println(res.getInt("rukuno"));
				//type.setPtno(res.getInt("ptno"));
				//type.setDwno(res.getInt("dwno"));
				//type.setNumber(res.getInt("RNumber"));
				//type.setJinjia(res.getInt("Rjinjia"));
				//type.setZongjia(res.getInt("Rzongjia"));
				//type.setSuno(res.getInt("suno"));
				//type.setBeizhu(res.getString("Rbeizhu"));
				//type.setAno(res.getInt("ano"));
				list.add(type);
			}

		} catch (SQLException e) {

			System.out.println("RepertoryManager.java");
			e.printStackTrace();
		}
		return list;
	}
	
	public  ArrayList findOne(String no){
		ResultSet res = null;
		ArrayList list = new ArrayList();
		Database data = new Database();
		String sql = "SELECT rukulist.RukuNo,produc.pname,protype.PTname,danwei.DWname,rukulist.Rnumber,rukulist.Rjinjia,rukulist.Rzongjine,supplier.SUname,rukulist.Rbeizhu,rukulist.Rdate,administrator.Aname FROM rukulist,produc,protype,supplier,danwei,administrator where rukulist.Pno=produc.Pno and rukulist.PTno =protype.PTon and rukulist.DWno=danwei.DWno and rukulist.Suno=supplier.SUno and administrator.Ano=rukulist.Ano and RuKuNo = "+no+"";

		//String sql = "select * from rukulist where RuKuNo = '"+no+"'";
		res = data.selectSql(sql);
		try{
			while(res.next()){	
				RepertoryBean type = new RepertoryBean();
				type.setRukuno(res.getInt("rukuno"));
				
				type.setPname(res.getString("Pname"));
				type.setPTname(res.getString("PTname"));
				type.setDWname(res.getString("DWname"));
				type.setNumber(res.getInt("RNumber"));
				type.setJinjia(res.getInt("Rjinjia"));
				type.setZongjia(res.getInt("Rzongjine"));
				type.setSUname(res.getString("SUname"));
				type.setBeizhu(res.getString("Rbeizhu"));
				type.setAname(res.getString("Aname"));
				type.setRdate(res.getString("Rdate"));
				
				//type.setSuno(res.getInt("suno"));
				
				//type.setAno(res.getInt("ano"));
				list.add(type);
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}	
		return list;
	}
	
	public boolean deleteOne(String value){
		String sql="delete from rukulist where RuKuNo='"+value+"'";
		return data.updataSql(sql);
	}
	public boolean delete(String[] values){
		for(int i=0;i<values.length;i++){
			String sql="delete from rukulist where RuKuNo='"+values[i]+"'";
			if(data.updataSql(sql)==false){
				return false;
			}
		}
		return true;
	}
	public  ArrayList datefind(String date1,String date2){
		ArrayList list2 = new ArrayList();
		//	String sql = "select * from rukulist,produc,protype,danwei,supplier,administrator where rukulist.Pno=produc.Pno AND rukulist.PTno=protype.PTon AND rukulist.DWno=danwei.DWno AND rukulist.Suno=supplier.SUno AND rukulist.Ano=administrator.Ano;";
			String sql = "SELECT rukulist.RukuNo,produc.pname,protype.PTname,supplier.SUname,rukulist.Rdate,administrator.Aname FROM rukulist,produc,protype,supplier,administrator where rukulist.Pno=produc.Pno and rukulist.PTno =protype.PTon and rukulist.Suno=supplier.SUno and administrator.Ano=rukulist.Ano AND Rdate BETWEEN '"+date1+"' AND '"+date2+"'";
		//	String sql = "select * from rukulist";

			res = data.selectSql(sql);
			try {

				while (res.next()) {
					RepertoryBean type = new RepertoryBean();
					type.setRukuno(res.getInt("rukuno"));
					//System.out.println(res.getInt("rukuno"));
					type.setPname(res.getString("Pname"));
					type.setPTname(res.getString("PTname"));
					type.setSUname(res.getString("SUname"));
					type.setAname(res.getString("Aname"));
					type.setRdate(res.getString("Rdate"));
					//System.out.println(res.getInt("rukuno"));
					//type.setPtno(res.getInt("ptno"));
					//type.setDwno(res.getInt("dwno"));
					//type.setNumber(res.getInt("RNumber"));
					//type.setJinjia(res.getInt("Rjinjia"));
					//type.setZongjia(res.getInt("Rzongjia"));
					//type.setSuno(res.getInt("suno"));
					//type.setBeizhu(res.getString("Rbeizhu"));
					//type.setAno(res.getInt("ano"));
					list2.add(type);
				}

			} catch (SQLException e) {

				System.out.println("RepertoryManager.java");
				e.printStackTrace();
			}
		return list2;
	}
	
	
	
}
