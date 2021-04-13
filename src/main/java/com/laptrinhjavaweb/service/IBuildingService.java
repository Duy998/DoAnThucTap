package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.dto.response.StaffResponseDTO;

import java.util.List;
import java.util.Map;

public interface IBuildingService {
    List<BuildingDTO> findAll();
    void save(BuildingDTO buildingDTO);
    List<BuildingDTO> findAll(Map<String, String> params, String[] buildingTypes);
    Map<String, String> getBuildingTypes();
    Map<String, String> getDistrict();
    BuildingDTO updatebystaffid(StaffResponseDTO staffs);
    BuildingDTO findOne(Long buildingid);
}
