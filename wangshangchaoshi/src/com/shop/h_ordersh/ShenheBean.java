package com.shop.h_ordersh;

public class ShenheBean {
	private int Rno;
	private String Rreason;
	private String Cno;
	private int CPno;
	
	private int Ono;
	private int Ostate;
	private String Ocname;
	private String Oaddress;
	private String Odate;
	private String Oreason;
	public String getOdate() {
		return Odate;
	}
	public void setOdate(String odate) {
		Odate = odate;
	}
	public int getOno() {
		return Ono;
	}
	public void setOno(int ono) {
		Ono = ono;
	}
	public String getOreason() {
		return Oreason;
	}
	public void setOreason(String oreason) {
		Oreason = oreason;
	}
	
	public int getOstate() {
		return Ostate;
	}
	public void setOstate(int ostate) {
		Ostate = ostate;
	}
	public String getOcname() {
		return Ocname;
	}
	public void setOcname(String ocname) {
		Ocname = ocname;
	}
	public String getOaddress() {
		return Oaddress;
	}
	public void setOaddress(String oaddress) {
		Oaddress = oaddress;
	}
	

	
	
	public int getCPno() {
		return CPno;
	}
	public void setCPno(int cPno) {
		CPno = cPno;
	}
	private String type;
	public String getCno() {
		return Cno;
	}
	public void setCno(String cno) {
		Cno = cno;
	}
	
	

	
	public int getRno() {
		return Rno;
	}
	public void setRno(int rno) {
		Rno = rno;
	}
	public String getRreason() {
		return Rreason;
	}
	public void setRreason(String rreason) {
		Rreason = rreason;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public ShenheBean() {
		
	}
}
