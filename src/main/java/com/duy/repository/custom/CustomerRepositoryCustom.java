package com.duy.repository.custom;

import java.util.List;

import com.duy.dto.CustomerDTO;
import com.duy.entity.CustomerEntity;

public interface CustomerRepositoryCustom {

	List<CustomerEntity> findAll(CustomerDTO customer);
}
