package kr.co.farmstory2.dto;

import java.io.File;
import java.text.DecimalFormat;
import java.util.UUID;

public class ProductDTO {
	private int pno;
	private int type;
	private String pName;
	private int price;
	private int delivery;
	private int stock;
	private int sold;
	private String thumb1;
	private String thumb2;
	private String thumb3;
	private String seller;
	private String etc;
	private String rdate;
	private String path;
	
	public ProductDTO(String path) {
		this.path=path;
	}
	
	public ProductDTO() {
		
	}
	
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public void setPno(String pno) {
		this.pno = Integer.parseInt(pno);
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
	public void setType(String type) {
		this.type = Integer.parseInt(type);
	}
	
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public int getPrice() {
		return price;
	}
	
	public String getPriceWithComma() {
		
		DecimalFormat df = new DecimalFormat("###,###");
		return df.format(price);
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public void setPrice(String price) {
		this.price = Integer.parseInt(price);
	}
	
	public int getDelivery() {
		return delivery;
	}
	public void setDelivery(int delivery) {
		this.delivery = delivery;
	}
	
	public String getDeliveryWithComma() {
		
		DecimalFormat df = new DecimalFormat("###,###");
		return df.format(delivery);
	}
	
	public void setDelivery(String delivery) {
		this.delivery = Integer.parseInt(delivery);
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	
	public void setStock(String stock) {
		this.stock =Integer.parseInt(stock);
	}
	public int getSold() {
		return sold;
	}

	public void setSold(int sold) {
		this.sold = sold;
	}
	public String getThumb1() {
		return thumb1;
	}
	public void setThumb1(String thumb1) {
		this.thumb1 = thumb1;
	}
	
	public void setThumb1ForRename(String thumb1) {
		this.thumb1 = fileRename(thumb1);
	}
	public String getThumb2() {
		return thumb2;
	}
	public void setThumb2(String thumb2) {
		this.thumb2 = thumb2;
	}
	public void setThumb2ForRename(String thumb2) {
		this.thumb2 = fileRename(thumb2);
	}
	public String getThumb3() {
		return thumb3;
	}
	public void setThumb3(String thumb3) {
		this.thumb3 = thumb3;
	}
	
	public void setThumb3ForRename(String thumb3) {
		this.thumb3 = fileRename(thumb3);
	}
	public String getSeller() {
		return seller;
	}
	public void setSeller(String seller) {
		this.seller = seller;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	
	public String fileRename(String thumb) {
		int i=thumb.lastIndexOf(".");//확장자가 표시되는시점
		String ext = thumb.substring(i);//확장자구하기

		String uuid =UUID.randomUUID().toString();//저장되는 파일명(이름만 확장자 제외)
		String sName =uuid+ext;//(저장소에 저장되는 파일명)

		
		File f1 =new File(path+"/"+thumb);//원래파일명
		File f2 =new File(path+"/"+sName);//uuid로 생성된 파일명

		f1.renameTo(f2);

		return sName;
	}
	
}
