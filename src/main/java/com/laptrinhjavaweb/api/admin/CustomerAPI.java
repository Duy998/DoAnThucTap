package com.laptrinhjavaweb.api.admin;

import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.dto.CustomerDTO;
import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.dto.request.AssignCustomerRequestDto;
import com.laptrinhjavaweb.dto.request.BuildingIdSelectedRequestDto;
import com.laptrinhjavaweb.service.ICustomerService;
import com.laptrinhjavaweb.service.impl.BuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Objects;

@RestController(value="customerAPIOfAdmin")
public class CustomerAPI {

    @Autowired
    private ICustomerService customerService;

    @PostMapping("/api/customer")
    public CustomerDTO saveCustomer(@RequestBody CustomerDTO customerDTO) {
        customerService.save(customerDTO);
        return customerDTO;
    }



//    @DeleteMapping("/api/building")
//    public void deleteBuilding(@RequestBody List<Long> customerIds) {
//        if (!CollectionUtils.isEmpty(customerIds)) {
//            customerService.delete(customerIds);
//        }
//    }

//    @PutMapping("api/building")
//    public void editBuilding(@RequestBody BuildingDTO building) {
//        if (building.getId() != null) {
//            buildingService.save(building);
//        }
//    }
}
