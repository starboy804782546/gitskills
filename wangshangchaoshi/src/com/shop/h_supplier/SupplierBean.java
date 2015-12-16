package com.shop.h_supplier;

public class SupplierBean {

	private int id;
	private String type;
	private String suname;
	private String suaddress;
	private String sutelephone;
	private String superson;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	
	public String getSuname() {
		return suname;
	}

	public void setSuname(String suname) {
		this.suname = suname;
	}

	public String getSuaddress() {
		return suaddress;
	}

	public void setSuaddress(String suaddress) {
		this.suaddress = suaddress;
	}

	public String getSutelephone() {
		return sutelephone;
	}

	public void setSutelephone(String sutelephone) {
		this.sutelephone = sutelephone;
	}

	public String getSuperson() {
		return superson;
	}

	public void setSuperson(String superson) {
		this.superson = superson;
	}
	
	public SupplierBean() {

	}

public String getType() {
	return type;
}

public void setType(String type) {
	this.type = type;
}

}
