package com.shop.shangpinguanli;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.shop.database.Database;

public class AddshangpinManager {
	Database data = null;
	ResultSet res = null;

	public AddshangpinManager() {
		data = new Database();
	}

	public boolean addShangPin(String name, String gongyingshang, String shoujia, String cuxiaojia,
			String shengchanriqi, String baozhiqi, String leibie, String miaoshu, String guanjianci, String timeyujing,
			String numberyujing, String danwei, String tupian) {
		String sql = "INSERT INTO produc(pname,pton,pdescribe,pprice,promotionalprice,suno,pshengchanriqi,pbaozhiqi,pguanjianci,ptimeyujing,pnumberyujing,dwno,ptupian)"
				+ "VALUES('" + name + "'," + leibie + ",'" + miaoshu + "'," + shoujia + "," + cuxiaojia + ","
				+ gongyingshang + ",'" + shengchanriqi + "'," + baozhiqi + ",'" + guanjianci + "'," + timeyujing + ","
				+ numberyujing + "," + danwei + ",'" + tupian + "') ";
		data.updataSql(sql);

		return true;
	}

	public ArrayList getOne(String id) {
		String sql = "SELECT pno,Pname,protype.PTname,Pdescribe,Pprice,PromotionalPrice,supplier.SUname,Pshengchanriqi,Pguanjianci,Ptimeyujing,Pnumberyujing,DWname,Ptupian "
				+ "from produc,protype,supplier,danwei"
				+ "WHERE produc.PTon=protype.pton and produc.DWno=danwei.DWno and supplier.SUno=produc.Suno and pno="+id+"";
		res= data.selectSql(sql);
		ArrayList list = new ArrayList();
		try {
			while(res.next()){
				ShangpinBean bean = new ShangpinBean();
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
}
