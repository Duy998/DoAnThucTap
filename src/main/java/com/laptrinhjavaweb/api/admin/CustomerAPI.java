package com.laptrinhjavaweb.api.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhjavaweb.dto.CustomerDTO;
import com.laptrinhjavaweb.service.ICustomerService;

@RestController(value = "customerAPIOfAdmin")
public class CustomerAPI {

	@Autowired
	private ICustomerService icustomerservice;

	@PostMapping("/api/customer")
	public CustomerDTO createCustomer(@RequestBody CustomerDTO newCustomer) {
		return icustomerservice.InsertCustomer(newCustomer);	
	}
	
	@PutMapping("/api/customer")
	public CustomerDTO updateCustomer(@RequestBody CustomerDTO newCustomer) {
		return icustomerservice.InsertCustomer(newCustomer);	
	}
	
	@DeleteMapping("/api/customer")
	public void deleeteCustomer(@RequestBody Long[] ids) {
		icustomerservice.deleteCustomer(ids);
	}
	
}
