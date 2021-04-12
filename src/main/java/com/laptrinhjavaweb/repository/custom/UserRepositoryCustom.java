package com.laptrinhjavaweb.repository.custom;

import com.laptrinhjavaweb.entity.UserEntity;

import java.util.List;

public interface UserRepositoryCustom {
	List<UserEntity> findAllByBuilding();
	List<UserEntity> findAllByCustomer(Long customerId);
	void deleteAllByCustomer(Long customerId);
}
