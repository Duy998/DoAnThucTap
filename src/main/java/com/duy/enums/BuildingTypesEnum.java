package com.duy.enums;

public enum BuildingTypesEnum {
	
	FURNITURE("Nội thất"),
    GROUND_FLOOR("Tầng trệt"),
    APARTMENT("Nguyên căn");
	
    private final String buildingTypeValue;

    BuildingTypesEnum(String buildingTypeValue) {
        this.buildingTypeValue = buildingTypeValue;
    }

	public String getBuildingTypeValue() {
		return buildingTypeValue;
	}
	
	
}
