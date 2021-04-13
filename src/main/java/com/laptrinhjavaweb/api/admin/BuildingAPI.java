package com.laptrinhjavaweb.api.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.dto.response.ResposeDTO;
import com.laptrinhjavaweb.dto.response.StaffResponseDTO;
import com.laptrinhjavaweb.service.IStaffResposeService;
import com.laptrinhjavaweb.service.impl.BuildingService;

@RestController(value="buildingAPIOfAdmin")

public class BuildingAPI {

    @Autowired
    private BuildingService buildingService;
    
    @Autowired
    private IStaffResposeService istaffservice;

    @PostMapping("/api/building")
    public BuildingDTO createBuilding(@RequestBody BuildingDTO newBuilding) {
        buildingService.save(newBuilding);
        return newBuilding;
    }
    
	@GetMapping("/api/building/{buildingid}/staffs")
	 public ResposeDTO LoadStaffs(@PathVariable("buildingid") Long buildingid) {	
		ResposeDTO result = new ResposeDTO();
		result.setData(istaffservice.findAll( buildingid));
       return result;
	}
	
	@PutMapping("/api/building/staffs")
	 public BuildingDTO UpdateBuilding(@RequestBody StaffResponseDTO staffs) {
		return buildingService.updatebystaffid(staffs);	
		
	}
	
}
