package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.converter.CustomerConverter;
import com.laptrinhjavaweb.dto.CustomerDTO;
import com.laptrinhjavaweb.dto.request.AssignCustomerRequestDto;
import com.laptrinhjavaweb.entity.BuildingEntity;
import com.laptrinhjavaweb.entity.CustomerEntity;
import com.laptrinhjavaweb.entity.RentAreaEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.repository.BuildingRepository;
import com.laptrinhjavaweb.repository.CustomerRepository;
import com.laptrinhjavaweb.repository.UserRepository;
import com.laptrinhjavaweb.service.ICustomerService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@Service
public class CustomerService implements ICustomerService {
    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private CustomerConverter customerConverter;

    @Override
    public List<CustomerDTO> findAll() {
        List<CustomerEntity> customersFound = customerRepository.findAll();
        return customersFound.stream().map(customerConverter::convertToDto).collect(Collectors.toList());
    }

    @Override
    public CustomerDTO save(CustomerDTO customerDTO) {
        if (Objects.nonNull(customerDTO)) {
            CustomerEntity customerEntity = customerConverter.convertToEntity(customerDTO);

            if (Objects.isNull(customerDTO.getId())) {
                customerEntity.setStatus(0);
            }
            return customerConverter.convertToDto(customerRepository.save(customerEntity));
        }
        return null;
    }
}
