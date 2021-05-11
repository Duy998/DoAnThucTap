package com.duy.api.admin;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.duy.dto.BuildingDTO;
import com.duy.dto.response.ResposeDTO;
import com.duy.dto.response.StaffResponseDTO;
import com.duy.service.IStaffResposeService;
import com.duy.service.impl.BuildingService;

@RestController(value = "buildingAPIOfAdmin")
public class BuildingAPI {

	@Autowired
	private BuildingService buildingService;

	@Autowired
	private IStaffResposeService istaffservice;

	@PostMapping("/api/building")
	public void createBuilding(@Valid BuildingDTO newBuilding) {
		buildingService.save(newBuilding);
		
	}

	@GetMapping("/api/building/{buildingid}/staffs")
	public ResposeDTO LoadStaffs(@PathVariable("buildingid") Long buildingid) {
		ResposeDTO result = new ResposeDTO();
		result.setData(istaffservice.findAll(buildingid));
		return result;
	}

	@PutMapping("/api/building/staffs")
	public BuildingDTO UpdateBuilding(@RequestBody StaffResponseDTO staffs) {
		return buildingService.updatebystaffid(staffs);

	}
	
	@PutMapping("api/building")
    public void editBuilding(@Valid BuildingDTO building) {
        if (building.getId() != null) {
            buildingService.save(building);
        }
    }
	
	
	@DeleteMapping("/api/building")
	public void deletebuilding(@RequestBody Long[] ids) {
		buildingService.delete(ids);
	}

}
