package com.laptrinhjavaweb.service;

import java.util.List;

import com.laptrinhjavaweb.dto.CustomerDTO;

public interface ICustomerService {

	List<CustomerDTO> findAll();
	List<CustomerDTO> findAll(CustomerDTO customer);
	CustomerDTO findOne(Long CustomerId);
	CustomerDTO InsertCustomer(CustomerDTO dto);
	void deleteCustomer(Long[] ids);
}
