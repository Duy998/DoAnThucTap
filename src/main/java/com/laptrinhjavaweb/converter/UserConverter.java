package com.laptrinhjavaweb.converter;

import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.entity.UserEntity;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@Component
public class UserConverter {

    @Autowired
    private ModelMapper modelMapper;

    public UserDTO convertToDto (UserEntity entity){
        UserDTO result = modelMapper.map(entity, UserDTO.class);
        if (!CollectionUtils.isEmpty(entity.getBuildings())) {
            List<Long> buildingIds = entity.getBuildings().stream().map(building -> building.getId()).collect(Collectors.toList());
            result.setBuildingIds(buildingIds);
        }
        if (!CollectionUtils.isEmpty(entity.getCustomers())) {
            List<Long> customerIds = entity.getCustomers().stream().map(customer -> customer.getId()).collect(Collectors.toList());
            result.setCustomerIds(customerIds);
        }

        return result;
    }

    public UserEntity convertToEntity (UserDTO dto){
        UserEntity result = modelMapper.map(dto, UserEntity.class);
        return result;
    }
}
