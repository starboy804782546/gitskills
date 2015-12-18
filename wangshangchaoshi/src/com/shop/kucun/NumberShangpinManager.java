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
		System.out.println("numbershangpingmanager"+id);
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
}
