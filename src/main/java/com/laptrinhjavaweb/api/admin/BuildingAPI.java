package com.laptrinhjavaweb.api.admin;

import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.dto.request.DeleteBuildingRequestDto;
import com.laptrinhjavaweb.service.impl.BuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import java.util.List;

@RestController(value="buildingAPIOfAdmin")
public class BuildingAPI {

    @Autowired
    private BuildingService buildingService;

    @PostMapping("/api/building")
    public BuildingDTO saveBuilding(@RequestBody BuildingDTO building) {
        buildingService.save(building);
        return building;
    }

    @DeleteMapping("/api/building")
    public void deleteBuilding(@RequestBody List<Long> buildingIds) {
        if (!CollectionUtils.isEmpty(buildingIds)) {
            buildingService.delete(buildingIds);
        }
    }

    @PutMapping("api/building")
    public void editBuilding(@RequestBody BuildingDTO building) {
        if (building.getId() != null) {
            buildingService.save(building);
        }
    }
}
