package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.dto.request.AssignCustomerRequestDto;

import java.util.List;
import java.util.Map;

public interface IUserService {
    UserDTO findOneByUserNameAndStatus(String name, int status);
    Map<Long, String> getStaffMaps();
    List<UserDTO> findAllByBuilding(Long buildingId);
    List<UserDTO> findAllByCustomer(Long customerId);
    void assginCustomer(AssignCustomerRequestDto request);
}
