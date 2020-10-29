package com.web.activity.model;

public class TripTypeBean implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	
	private String tripTypeNo;
	private String tripTypeName;
	
	
	public String getTripTypeNo() {
		return tripTypeNo;
	}
	public void setTripTypeNo(String tripTypeNo) {
		this.tripTypeNo = tripTypeNo;
	}
	public String getTripTypeName() {
		return tripTypeName;
	}
	public void setTripTypeName(String tripTypeName) {
		this.tripTypeName = tripTypeName;
	}
	
	
}
