package com.laptrinhjavaweb.utils;

import com.laptrinhjavaweb.dto.BuildingDTO;
import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;

import java.util.Objects;

public class ValidateFieldSave {
    public static BuildingDTO ValidateUtils (BuildingDTO building, BuildingDTO buildingValidated) {
        if (StringUtils.isNotBlank(building.getName())) {
            buildingValidated.setName(building.getName());
        }

        if (Objects.nonNull(building.getNumberOfBasement())) {
            if (building.getNumberOfBasement() > 0) {
                buildingValidated.setNumberOfBasement(building.getNumberOfBasement());
            }
        }

        if (StringUtils.isNotBlank(building.getDistrict())) {
            buildingValidated.setDistrict(building.getDistrict());
        }

        if (StringUtils.isNotBlank(building.getStreet())) {
            buildingValidated.setStreet(building.getStreet());
        }

        if (StringUtils.isNotBlank(building.getStructure())) {
            buildingValidated.setStreet(building.getStructure());
        }

        if (StringUtils.isNotBlank(building.getLevel())) {
            buildingValidated.setWard(building.getLevel());
        }

        if (StringUtils.isNotBlank(building.getDirection())) {
            buildingValidated.setWard(building.getDirection());
        }

        if (StringUtils.isNotBlank(building.getWard())) {
            buildingValidated.setWard(building.getWard());
        }

        if (Objects.nonNull(building.getFloorArea())) {
            if (building.getFloorArea() > 0) {
                buildingValidated.setFloorArea(building.getFloorArea());
            }
        }

        if (!ArrayUtils.isEmpty(building.getBuildingTypes())) {
            buildingValidated.setBuildingTypes(building.getBuildingTypes());
        }

        if (StringUtils.isNotBlank(building.getAreaRent())) {
            buildingValidated.setAreaRent(building.getAreaRent());
        }

        if (StringUtils.isNotBlank(building.getAreaRentDescription())) {
            buildingValidated.setAreaRentDescription(building.getAreaRentDescription());
        }

        if (Objects.nonNull(building.getCostRent())) {
            if (building.getCostRent() > 0) {
                buildingValidated.setCostRent(building.getCostRent());
            }
        }

        if (StringUtils.isNotBlank(building.getCostDescription())) {
            buildingValidated.setCostDescription(building.getCostDescription());
        }

        if (StringUtils.isNotBlank(building.getDeposit())) {
            buildingValidated.setDeposit(building.getDeposit());
        }

        if (StringUtils.isNotBlank(building.getPayment())) {
            buildingValidated.setDeposit(building.getPayment());
        }

        if (StringUtils.isNotBlank(building.getCarCost())) {
            buildingValidated.setDeposit(building.getCarCost());
        }

        if (StringUtils.isNotBlank(building.getMotorbikeCost())) {
            buildingValidated.setDeposit(building.getMotorbikeCost());
        }

        if (StringUtils.isNotBlank(building.getServiceCost())) {
            buildingValidated.setDeposit(building.getServiceCost());
        }

        if (StringUtils.isNotBlank(building.getOvertimeCost())) {
            buildingValidated.setDeposit(building.getOvertimeCost());
        }

        if (StringUtils.isNotBlank(building.getTimeRent())) {
            buildingValidated.setDeposit(building.getTimeRent());
        }

        if (StringUtils.isNotBlank(building.getTimeDecorator())) {
            buildingValidated.setDeposit(building.getTimeDecorator());
        }

        if (StringUtils.isNotBlank(building.getBrokerageFee())) {
            buildingValidated.setDeposit(building.getBrokerageFee());
        }

        return buildingValidated;
    }
}
