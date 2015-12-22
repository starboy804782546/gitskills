package com.shop.shangpinguanli;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.shop.database.Database;

public class ListManager {
	Database data = null;
	ResultSet res = null;

	public ListManager() {
		data = new Database();
	}

	public ArrayList sousuoGet(String fenlei, String gongyingshang, String sousuo) {
		String sql = "SELECT produc.Pno,produc.Pname,protype.PTname,supplier.SUname from produc,protype,supplier where produc.PTon=protype.PTon and produc.Suno=supplier.SUno and Pname like '"
				+ sousuo + "' and PTname like '" + fenlei + "' and SUname like '" + gongyingshang + "'";
		res = data.selectSql(sql);
		ArrayList list = new ArrayList();
		try {
			while (res.next()) {
				ListBean listbean = new ListBean();
				listbean.setId(res.getInt("Pno"));
				listbean.setGongyingshang(res.getString("SUname"));
				listbean.setName(res.getString("Pname"));
				listbean.settype(res.getString("PTname"));
				list.add(listbean);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			data.closeDatabase();
		}
		return list;
	}

	public boolean delete(String[] values) {
		for (int i = 0; i < values.length; i++) {
			String sql = "delete from produc where Pno=" + values[i] + "";
			if (data.updataSql(sql) == false) {
				return false;
			}
		}
		return true;
	}

	public boolean deleteOne(String value) {
		String sql = "delete from produc where Pno=" + value + "";
		return data.updataSql(sql);
	}

	public ArrayList getAll() {
		String sql = "SELECT produc.Pno,produc.Pname,protype.PTname,danwei.DWname,supplier.SUname from produc,protype,supplier,danwei WHERE danwei.DWno=produc.DWno and produc.PTon=protype.PTon and produc.Suno=supplier.SUno;";
		res = data.selectSql(sql);
		ArrayList<ListBean> list  = new ArrayList<ListBean>();
		try {
			while (res.next()) {
				ListBean bean = new ListBean();
				bean.setName(res.getString("Pname"));
				bean.setId(res.getInt("Pno"));
				bean.settype(res.getString("PTname"));
				bean.setDanwei(res.getString("DWname"));
				bean.setGongyingshang(res.getString("SUname"));
				list.add(bean);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			data.closeDatabase();
		}
		return list;
	}
	public ArrayList getOne(int id){
		String sql = "SELECT produc.Pno,produc.Pname,protype.PTname,danwei.DWname,supplier.SUname ,protype.PTon,supplier.SUno, danwei.DWno  from produc,protype,supplier,danwei"
	+" WHERE danwei.DWno=produc.DWno and produc.PTon=protype.PTon and produc.Suno=supplier.SUno and Pno="+id+"";
		res = data.selectSql(sql);
		ArrayList<ListBean> list  = new ArrayList<ListBean>();
		try {
			while (res.next()) {
				ListBean bean = new ListBean();
				bean.setName(res.getString("Pname"));
				bean.setId(res.getInt("Pno"));
				bean.settype(res.getString("PTname"));
				bean.setDanwei(res.getString("DWname"));
				bean.setGongyingshang(res.getString("SUname"));
				bean.setDanweiId(res.getInt("DWno"));
				bean.setLeibieId(res.getInt("PTon"));
				bean.setGongyingshangId(res.getInt("suno"));
				list.add(bean);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			data.closeDatabase();
		}
		return list;
	}
}
