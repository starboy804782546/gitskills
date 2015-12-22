package com.shop.kucun;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.shop.database.Database;

public class NumberShangpinManager {
	Database data = null;
	ResultSet res = null;

	public NumberShangpinManager() {
		data = new Database();
	}

	public ArrayList getOne(int id) {
	
		String sql = "SELECT spnumber.SPno ,produc.Pname,spnumber.Pno,spnumber.SPnumber  FROM spnumber,produc where spnumber.Pno=produc.Pno and produc.pno="
				+ id + "";
		res = data.selectSql(sql);
		ArrayList<NumberShangpinBean> list = new ArrayList();
		try {
			while (res.next()) {
				NumberShangpinBean bean = new NumberShangpinBean();
				bean.setId(res.getInt("SPno"));
				bean.setNumber(res.getInt("SPnumber"));
				bean.setShangpinname(res.getString("Pname"));
				list.add(bean);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			data.closeDatabase();
		}
		return list;
	}

	public boolean addNumber(String id, String leibie, String danwei, int number, double jinjia, double zongjine,
			String gongyingshang, String riqi, String beizhu, String caozuoyuan) {

		String sql3 = "select * from spnumber where pno=" + id + "";
		res = data.selectSql(sql3);
		try {
			if (res.next()) {
				String sql2 = "UPDATE spnumber SET SPnumber=SPnumber+"+number+" WHERE Pno="+id+"";
				data.updataSql(sql2);
				String sql = "INSERT INTO rukulist(Pno,ptno,dwno,rnumber,rjinjia,rzongjine,suno,Rdate,rbeizhu,ano) "
						+ " VALUES(" + id + "," + leibie + "," + danwei + "," + number + "," + jinjia + "," + zongjine
						+ "," + gongyingshang + ",'" + riqi + "','" + beizhu + "'," + caozuoyuan + ")";
				data.updataSql(sql);
				
				
			} else {
				String sql2= "INSERT into spnumber(pno,spnumber) values("+id+","+number+")";
				data.updataSql(sql2);
				String sql = "INSERT INTO rukulist(Pno,ptno,dwno,rnumber,rjinjia,rzongjine,suno,Rdate,rbeizhu,ano) "
						+ " VALUES(" + id + "," + leibie + "," + danwei + "," + number + "," + jinjia + "," + zongjine
						+ "," + gongyingshang + ",'" + riqi + "','" + beizhu + "'," + caozuoyuan + ")";
				data.updataSql(sql);
		
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return true;
	}
}
