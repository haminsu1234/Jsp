package kr.farmstory1.dto;

public class OrderDTO {
	
	private int orderno;
	private int orderproduct;
	private String ordereceiver;
	public String getOrdereceiver() {
		return ordereceiver;
	}
	public void setOrdereceiver(String ordereceiver) {
		this.ordereceiver = ordereceiver;
	}
	private int ordercount;
	private int orderdelivery;
	private int orderprice;
	private int ordertotal;
	private String orderuser;
	private String orderdate;
	private String orderetc;
	private String orderhp;
	private String orderzip;
	private String orderaddr1;
	private String orderaddr2;
	
	
	
	
	
	public String getOrderhp() {
		return orderhp;
	}
	public void setOrderhp(String orderhp) {
		this.orderhp = orderhp;
	}
	public String getOrderzip() {
		return orderzip;
	}
	public void setOrderzip(String orderzip) {
		this.orderzip = orderzip;
	}
	public String getOrderaddr1() {
		return orderaddr1;
	}
	public void setOrderaddr1(String orderaddr1) {
		this.orderaddr1 = orderaddr1;
	}
	public String getOrderaddr2() {
		return orderaddr2;
	}
	public void setOrderaddr2(String orderaddr2) {
		this.orderaddr2 = orderaddr2;
	}
	public int getOrderno() {
		return orderno;
	}
	public void setOrderno(int orderno) {
		this.orderno = orderno;
	}
	
	public void setOrderno(String orderno) {
		this.orderno = Integer.parseInt(orderno);
	}
	
	
	
	//	public void setPno(String pno) {
	//this.pno = Integer.parseInt(pno);	
	//}
	public int getOrderproduct() {
		return orderproduct;
	}
	public void setOrderproduct(int orderproduct) {
		this.orderproduct = orderproduct;
	}
	public void setOrderproduct(String orderproduct) {
		this.orderproduct = Integer.parseInt(orderproduct);
	}
	public int getOrdercount() {
		return ordercount;
	}
	public void setOrdercount(int ordercount) {
		this.ordercount = ordercount;
	}
	public void setOrdercount(String ordercount) {
		this.ordercount = Integer.parseInt(ordercount);
	}
	public int getOrderdelivery() {
		return orderdelivery;
	}
	public void setOrderdelivery(int orderdelivery) {
		this.orderdelivery = orderdelivery;
	}
	public void setOrderdelivery(String orderdelivery) {
		this.orderdelivery = Integer.parseInt(orderdelivery);
	}
	public int getOrderprice() {
		return orderprice;
	}
	public void setOrderprice(int orderprice) {
		this.orderprice = orderprice;
	}
	public void setOrderprice(String orderprice) {
		this.orderprice = Integer.parseInt(orderprice);
	}
	public int getOrdertotal() {
		return ordertotal;
	}
	public void setOrdertotal(int ordertotal) {
		this.ordertotal = ordertotal;
	}
	public void setOrdertotal(String ordertotal) {
		this.ordertotal = Integer.parseInt(ordertotal);
	}
	public String getOrderuser() {
		return orderuser;
	}
	public void setOrderuser(String orderuser) {
		this.orderuser = orderuser;
	}
	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
	public String getOrderetc() {
		return orderetc;
	}
	public void setOrderetc(String orderetc) {
		this.orderetc = orderetc;
	}
	

}
