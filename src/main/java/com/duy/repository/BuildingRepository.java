package com.duy.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.duy.entity.BuildingEntity;
import com.duy.repository.custom.BuildingRepositoryCustom;

public interface BuildingRepository extends JpaRepository<BuildingEntity, Long>, BuildingRepositoryCustom {

}
