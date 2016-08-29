package cs545.proj.domain;

import java.util.List;

public class Catagory {
	private long catagoryId;
    private String catagoryName;
	private String catagoryDescription;
	private List<Tender> tenderList;
	
	public long getCatagoryId() {
		return catagoryId;
	}
	public void setCatagoryId(long catagoryId) {
		this.catagoryId = catagoryId;
	}
	public String getCatagoryName() {
		return catagoryName;
	}
	public void setCatagoryName(String catagoryName) {
		this.catagoryName = catagoryName;
	}
	public List<Tender> getTenderList() {
		return tenderList;
	}
	public void setTenderList(List<Tender> tenderList) {
		this.tenderList = tenderList;
	}
	
	
	
}
