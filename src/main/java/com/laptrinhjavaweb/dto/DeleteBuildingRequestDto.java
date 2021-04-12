package com.laptrinhjavaweb.dto;

import java.util.List;

public class DeleteBuildingRequestDto {

    private List<Long> lstBuildingId;

    public List<Long> getLstBuildingId() {
        return lstBuildingId;
    }

    public void setLstBuildingId(List<Long> lstBuildingId) {
        this.lstBuildingId = lstBuildingId;
    }
}
