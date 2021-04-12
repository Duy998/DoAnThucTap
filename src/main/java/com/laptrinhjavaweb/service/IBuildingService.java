package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.builder.BuildingAddBuilder;
import com.laptrinhjavaweb.builder.BuildingSearchBuilder;
import com.laptrinhjavaweb.dto.BuildingDTO;

import java.util.List;
import java.util.Map;

public interface IBuildingService {
    List<BuildingDTO> findAll();
    BuildingDTO findOne(Long id);
    BuildingDTO save(BuildingDTO building);
    void delete(List<Long> buildingIds);
    List<BuildingDTO> findByCondition(Map<String, String> params, String[] buildingTypes);
    Map<String, String> getBuildingTypes();
    Map<String, String> getDistrict();
}
