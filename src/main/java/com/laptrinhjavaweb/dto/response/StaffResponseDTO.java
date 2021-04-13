package com.laptrinhjavaweb.dto.response;

public class StaffResponseDTO {
    private String fullName;
    private Long staffId;
    private String checked;
    private Long[] staffs;
    private Long buildingId;
    
    
    public Long getBuildingId() {
		return buildingId;
	}

	public void setBuildingId(Long buildingId) {
		this.buildingId = buildingId;
	}

	public Long[] getStaffs() {
		return staffs;
	}

	public void setStaffs(Long[] staffs) {
		this.staffs = staffs;
	}

	public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public Long getStaffId() {
        return staffId;
    }

    public void setStaffId(Long staffId) {
        this.staffId = staffId;
    }

    public String getChecked() {
        return checked;
    }

    public void setChecked(String checked) {
        this.checked = checked;
    }
}
