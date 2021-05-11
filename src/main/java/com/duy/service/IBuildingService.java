package com.duy.service;

import java.util.List;
import java.util.Map;

import com.duy.dto.BuildingDTO;
import com.duy.dto.response.StaffResponseDTO;

public interface IBuildingService {
    List<BuildingDTO> findAll();
    void save(BuildingDTO buildingDTO);
    List<BuildingDTO> findAll(Map<String, String> params, String[] buildingTypes);
    Map<String, String> getBuildingTypes();
    Map<String, String> getDistrict();
    BuildingDTO updatebystaffid(StaffResponseDTO staffs);
    BuildingDTO findOne(Long buildingid);
    void delete(Long[] ids);
}
