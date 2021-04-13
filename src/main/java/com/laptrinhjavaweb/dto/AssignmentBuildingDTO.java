package com.laptrinhjavaweb.dto;

public class AssignmentBuildingDTO extends AbstractDTO<AssignmentBuildingDTO>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Long staffid;
	private Long buildingid;
	public Long getStaffid() {
		return staffid;
	}
	public void setStaffid(Long staffid) {
		this.staffid = staffid;
	}
	public Long getBuildingid() {
		return buildingid;
	}
	public void setBuildingid(Long buildingid) {
		this.buildingid = buildingid;
	}
	
	
}
