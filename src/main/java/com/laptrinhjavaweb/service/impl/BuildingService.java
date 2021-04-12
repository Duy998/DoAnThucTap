package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.builder.BuildingSearchBuilder;
import com.laptrinhjavaweb.converter.BuildingConverter;
import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.entity.BuildingEntity;
import com.laptrinhjavaweb.entity.RentAreaEntity;
import com.laptrinhjavaweb.enums.BuildingTypesEnum;
import com.laptrinhjavaweb.enums.DistrictsEnum;
import com.laptrinhjavaweb.repository.BuildingRepository;
import com.laptrinhjavaweb.repository.RentAreaRepository;
import com.laptrinhjavaweb.service.IBuildingService;
import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Service
public class BuildingService implements IBuildingService {

    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private RentAreaRepository rentAreaRepository;

    @Autowired
    private BuildingConverter buildingConverter;

    @Override
    public List<BuildingDTO> findAll() {
        List<BuildingEntity> entities = buildingRepository.findAll();
        List<BuildingDTO> results = entities.stream().map(item -> buildingConverter.convertToDto(item)).collect(Collectors.toList());
        return results;
    }

    @Override
    public BuildingDTO findOne(Long id) {
        BuildingEntity entity = buildingRepository.findOne(id);
        return buildingConverter.convertToDtoUpdate(entity);
    }

    @Override
    @Transactional
    public BuildingDTO save(BuildingDTO building) {

        if (Objects.nonNull(building)) {
            BuildingEntity buildingEntity = buildingConverter.convertToEntity(building);

            if (building.getId() != null) {
                rentAreaRepository.deleteByBuilding_Id(building.getId());
            }
            if (StringUtils.isNotBlank(building.getAreaRent())) {
                List<String> lstArea = Arrays.asList(building.getAreaRent().split(","));

                List<RentAreaEntity> rentAreas = lstArea.stream().map((String area) -> {

                    RentAreaEntity rentAreaEntity = new RentAreaEntity();
                    rentAreaEntity.setValue(Integer.parseInt(area));
                    rentAreaEntity.setBuilding(buildingEntity);

                    return rentAreaEntity;
                }).collect(Collectors.toList());

                buildingEntity.setAreas(rentAreas);
            }

            return buildingConverter.convertToDto(buildingRepository.save(buildingEntity));
        }
        return null;
    }

    @Override
    @Transactional
    public void delete(List<Long> buildingIds) {
        buildingRepository.findAll(buildingIds).forEach(item -> buildingRepository.delete(item));
    }

    @Override
    public List<BuildingDTO> findByCondition(Map<String, String> params, String[] buildingTypes) {
        BuildingSearchBuilder.Builder paramsValidated = new BuildingSearchBuilder.Builder();

        if (StringUtils.isNotBlank(params.get("name"))) {
            paramsValidated.setName(params.get("name"));
        }
        if (StringUtils.isNotBlank(params.get("numberOfBasement"))) {
            paramsValidated.setNumberOfBasement(Integer.parseInt(params.get("numberOfBasement")));
        }
        if (StringUtils.isNotBlank(params.get("district"))) {
            paramsValidated.setDistrict(params.get("district"));
        }
        if (StringUtils.isNotBlank(params.get("street"))) {
            paramsValidated.setStreet(params.get("street"));
        }
        if (StringUtils.isNotBlank(params.get("ward"))) {
            paramsValidated.setWard(params.get("ward"));
        }
        if (StringUtils.isNotBlank(params.get("direction"))) {
            paramsValidated.setDirection(params.get("direction"));
        }
        if (StringUtils.isNotBlank(params.get("floorArea"))) {
            paramsValidated.setFloorArea(Integer.parseInt(params.get("floorArea")));
        }
        if (!ArrayUtils.isEmpty(buildingTypes)) {
            paramsValidated.setBuildingTypes(buildingTypes);
        }
        if (StringUtils.isNotBlank(params.get("areaRentFrom"))) {
            paramsValidated.setAreaRentFrom(Integer.parseInt(params.get("areaRentFrom")));
        }
        if (StringUtils.isNotBlank(params.get("areaRentTo"))) {
            paramsValidated.setAreaRentTo(Integer.parseInt(params.get("areaRentTo")));
        }
        if (StringUtils.isNotBlank(params.get("costRentFrom"))) {
            paramsValidated.setCostRentFrom(Integer.parseInt(params.get("costRentFrom")));
        }
        if (StringUtils.isNotBlank(params.get("costRentTo"))) {
            paramsValidated.setCostRentTo(Integer.parseInt(params.get("costRentTo")));
        }
        if (StringUtils.isNotBlank(params.get("staffId"))) {
            paramsValidated.setStaffId(Integer.parseInt(params.get("staffId")));
        }

        List<BuildingEntity> buildingEntities = buildingRepository.findByCondition(paramsValidated.build());

        List<BuildingDTO> results = buildingEntities.stream().map(item -> buildingConverter.convertToDto(item)).collect(Collectors.toList());
        return results;
    }

    @Override
    public Map<String, String> getBuildingTypes() {
        Map<String, String> result = new HashMap<>();
        Stream.of(BuildingTypesEnum.values()).forEach(type -> {result.put(type.name(), type.getBuildingTypeValue());});
        return result;
    }

    @Override
    public Map<String, String> getDistrict() {
        Map<String, String> result = new HashMap<>();
        Stream.of(DistrictsEnum.values()).forEach(district -> {result.put(district.name(), district.getDistrictValue());});
        return result;
    }
}
