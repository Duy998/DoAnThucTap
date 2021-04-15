package com.duy.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.duy.entity.CustomerEntity;
import com.duy.repository.custom.CustomerRepositoryCustom;

public interface CustomerRepository extends JpaRepository<CustomerEntity, Long>,CustomerRepositoryCustom{

}
