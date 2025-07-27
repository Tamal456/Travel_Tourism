package master.dto;

public class TourDto {
	 private String tid;
	 private String tname;
	 private String tplace1;
	 private String tplace2;
	 private String tplace3;
	 private String stdt;
	 private double price;
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getTplace1() {
		return tplace1;
	}
	public void setTplace1(String tplace1) {
		this.tplace1 = tplace1;
	}
	public String getTplace2() {
		return tplace2;
	}
	public void setTplace2(String tplace2) {
		this.tplace2 = tplace2;
	}
	public String getTplace3() {
		return tplace3;
	}
	public void setTplace3(String tplace3) {
		this.tplace3 = tplace3;
	}
	public String getStdt() {
		return stdt;
	}
	public void setStdt(String stdt) {
		this.stdt = stdt;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
}
