package com.laptrinhjavaweb.enums;

import java.util.Arrays;
import java.util.Optional;
import java.util.stream.Stream;

public enum DistrictsEnum {
	
	D1("Quận 1"),
    D3("Quận 3"),
    D4("Quận 4"),
    D5("Quận 5"),
    D6("Quận 6"),
    D7("Quận 7"),
    D8("Quận 8"),
    D10("Quận 10"),
    D11("Quận 11"),
    D12("Quận 12"),
    TP_TD("Thành phố Thủ Đức"),
    D_BT("Quận Bình Thạnh"),
    D_GV("Quận Gò Vấp");


    private final String districtValue;

    DistrictsEnum(String districtValue) {
        this.districtValue = districtValue;
    }

	public String getDistrictValue() {
		return districtValue;
	}

    public static String getDistrictName(String code) {

        Optional<DistrictsEnum> convertedCode = Arrays.stream(DistrictsEnum.values()).filter(e -> e.name().equals(code)).findFirst();

        return convertedCode.isPresent() ? convertedCode.get().getDistrictValue() : null;
    }
}
