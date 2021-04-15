package com.duy.service.impl;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duy.converter.CustomerConverter;
import com.duy.dto.CustomerDTO;
import com.duy.entity.CustomerEntity;
import com.duy.repository.CustomerRepository;
import com.duy.service.ICustomerService;


@Service
public class CustomerService implements ICustomerService{

	@Autowired
	private CustomerRepository customerrepository;
	
	@Autowired
	private CustomerConverter customerconverter;
	
	
	@Override
	public List<CustomerDTO> findAll() {
		List<CustomerEntity> entitys = customerrepository.findAll();
		List<CustomerDTO> result = entitys.stream().map(item -> customerconverter.convertToDto(item)).collect(Collectors.toList());
		return result;
	}


	@Override
	public CustomerDTO findOne(Long CustomerId) {	
		return customerconverter.convertToDto(customerrepository.findOne(CustomerId));
	}


	@Override
	public CustomerDTO InsertCustomer(CustomerDTO dto) {
		CustomerEntity result = new CustomerEntity();
		if(dto.getId() != null) {
			CustomerEntity entity = customerrepository.findOne(dto.getId());
			entity.setFullName(dto.getFullName());
			entity.setPhone(dto.getPhone());
			entity.setEmail(dto.getEmail());
			entity.setStatus(dto.getStatus());
			result = entity;
		}else {
			result = customerconverter.convertToEntity(dto);	
		}
		
		return customerconverter.convertToDto(customerrepository.save(result));
	}


	@Override
	public void deleteCustomer(Long[] ids) {
		for (Long long1 : ids) {
			customerrepository.delete(long1);
		}
		
	}


	@Override
	public List<CustomerDTO> findAll(CustomerDTO customer) {
		List<CustomerEntity> entitys = customerrepository.findAll(customer);
		List<CustomerDTO> result = entitys.stream().map(item -> customerconverter.convertToDto(item)).collect(Collectors.toList());
		return result;
	}
	

}
