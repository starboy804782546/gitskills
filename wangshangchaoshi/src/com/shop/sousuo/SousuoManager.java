package com.shop.sousuo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.shop.database.Database;
import com.shop.shangpinguanli.ShangpinBean;

public class SousuoManager {
	Database data = null;
	ResultSet res = null;
	public SousuoManager() {
		data = new Database();
	}
	public ArrayList getList(String sousuo,String daohang){
		String sql = "SELECT * from produc,supplier,protype,danwei where  Pname LIKE '"+sousuo+"'  and produc.PTon LIKE '"+daohang+"' and produc.PTon=protype.PTon and supplier.SUno=produc.Suno and produc.DWno=danwei.DWno;";
		ArrayList list = new ArrayList();
		res = data.selectSql(sql);
		try {
			while(res.next()){
				ShangpinBean bean= new ShangpinBean();
				bean.setName(res.getString("pname"));
				bean.setId(res.getInt("Pno"));
				bean.setLeibie(res.getString("PTname"));
				bean.setShoujia(res.getDouble("pprice"));
				bean.setTupian(res.getString("Ptupian"));
				list.add(bean);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
		
	}
	public ArrayList getOne(String id){
		String sql = "select produc.pno,pname,protype.PTname,pguanjianci,danwei.DWname,pprice,PromotionalPrice,Pdescribe,supplier.SUname,SPnumber,Ptupian FROM produc,protype,supplier,danwei,spnumber"+
" WHERE produc.PTon= protype.PTon and supplier.SUno=produc.Suno and danwei.DWno = produc.DWno and spnumber.Pno=produc.Pno and produc.pno="+id+"";
		ArrayList list = new ArrayList();
		res = data.selectSql(sql);
		try {
			while(res.next()){
				ShangpinBean bean = new ShangpinBean();
				bean.setNumber(res.getInt("SPNumber"));
				bean.setId(res.getInt("pno"));
				bean.setLeibie(res.getString("PTname"));
				bean.setName(res.getString("Pname"));
				bean.setDanwei(res.getString("dwname"));
				bean.setMiaoshu(res.getString("pdescribe"));
				bean.setShoujia(res.getDouble("Pprice"));
				bean.setCuxiaojia(res.getDouble("promotionalprice"));
				bean.setGongyingshang(res.getString("suname"));
				bean.setGuanjianci(res.getString("pguanjianci"));
				bean.setDanwei(res.getString("dwname"));
				bean.setTupian(res.getString("ptupian"));
				list.add(bean);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	public ArrayList getTen(String type){
		String sql  = "select * from produc where produc.PTon="+type+" order by Pno desc limit 10 ";
		
		ArrayList<ShangpinBean> list = new ArrayList<>();
		res=data.selectSql(sql);
		try {
			while(res.next()){
				ShangpinBean bean= new ShangpinBean();
				bean.setName(res.getString("pname"));
				bean.setId(res.getInt("Pno"));
				bean.setShoujia(res.getDouble("pprice"));
				bean.setTupian(res.getString("Ptupian"));
				list.add(bean);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
}
