package com.laptrinhjavaweb.converter;

import com.laptrinhjavaweb.dto.CustomerDTO;
import com.laptrinhjavaweb.entity.CustomerEntity;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Objects;

@Component
public class CustomerConverter {

    @Autowired
    private ModelMapper modelMapper;

    public CustomerDTO convertToDto (CustomerEntity customerEntity){
        CustomerDTO result = modelMapper.map(customerEntity, CustomerDTO.class);
        if (Objects.nonNull(customerEntity.getStatus())) {
            if (customerEntity.getStatus() == 1) {
                result.setStatus("Đang xử lý");
            } else {
                result.setStatus("Chưa xử lý");
            }
        }
        return result;
    }

    public CustomerEntity convertToEntity (CustomerDTO customerDTO){
        CustomerEntity result = modelMapper.map(customerDTO, CustomerEntity.class);
        return result;
    }
}
