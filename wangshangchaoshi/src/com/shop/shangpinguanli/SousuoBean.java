package com.shop.shangpinguanli;

public class SousuoBean {
	String fenlei;
	String sousuo;
	String gongyingshang;
	public String getFenlei() {
		if (fenlei == null||fenlei.length()==0) {
			return "%%";
		}
		return fenlei;
	}

	public void setFenlei(String fenlei) {
		this.fenlei = fenlei;
	}

	public String getSousuo() {
		if (sousuo == null||sousuo.length()==0) {
			return "%%";
		}
		sousuo = "%" + sousuo + "%";
		return sousuo;
	}

	public void setSousuo(String sousuo) {
		this.sousuo = sousuo;
	}

	public String getGongyingshang() {
		if (gongyingshang == null||gongyingshang.length()==0) {
			return "%%";
		}
		return gongyingshang;
	}

	public void setGongyingshang(String gongyingshang) {
		this.gongyingshang = gongyingshang;
	}

	

}
