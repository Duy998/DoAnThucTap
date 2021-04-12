package com.laptrinhjavaweb.enums;

import java.util.Arrays;
import java.util.Optional;

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

    public static String getBuildingTypesName(String code) {

        Optional<BuildingTypesEnum> convertedCode = Arrays.stream(BuildingTypesEnum.values()).filter(e -> e.name().equals(code)).findFirst();

        return convertedCode.isPresent() ? convertedCode.get().getBuildingTypeValue() : null;
    }
}
