package com.shop.sousuo;

public class SousuoTiaojian {
 String sousuo;
 public String getSousuo() {
	 if(sousuo==null)
		 return "%%";
	return "%"+sousuo+"%";
}
public void setSousuo(String sousuo) {
	this.sousuo = sousuo;
}
public String getDaohang() {
	if(daohang==null)
		 return "%%";
	return "%"+daohang+"%";
}
public void setDaohang(String daohang) {
	this.daohang = daohang;
}
String daohang;
}
