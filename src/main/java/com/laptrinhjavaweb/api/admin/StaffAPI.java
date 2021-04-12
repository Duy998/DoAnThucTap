package com.laptrinhjavaweb.api.admin;

import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.dto.request.BuildingIdSelectedRequestDto;
import com.laptrinhjavaweb.service.impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController(value="staffAPIOfAdmin")

public class StaffAPI {
    @Autowired
    private UserService userService;

    @PostMapping("/api/staffs")
    public List<UserDTO> loadStaff(@RequestBody BuildingIdSelectedRequestDto buildingId) {
        List<UserDTO> result = userService.findAllByBuilding(buildingId.getBuildingId());
        return result;
    }
}
