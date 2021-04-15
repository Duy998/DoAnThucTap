package com.duy.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.duy.entity.RoleEntity;

public interface RoleRepository extends JpaRepository<RoleEntity, Long> {
	RoleEntity findOneByCode(String code);
}
