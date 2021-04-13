package com.laptrinhjavaweb.converter;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.laptrinhjavaweb.dto.CustomerDTO;
import com.laptrinhjavaweb.entity.CustomerEntity;

@Component
public class CustomerConverter {

	@Autowired
    private ModelMapper modelMapper;

    public CustomerDTO convertToDto (CustomerEntity entity){
    	CustomerDTO result = modelMapper.map(entity, CustomerDTO.class);
        return result;
    }

    public CustomerEntity convertToEntity (CustomerDTO dto){
    	CustomerEntity result = modelMapper.map(dto, CustomerEntity.class);
        return result;
    }
}
