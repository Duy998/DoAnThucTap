package com.duy.repository.custom;

import java.util.List;

import com.duy.builder.BuildingSearchBuilder;
import com.duy.entity.BuildingEntity;

public interface BuildingRepositoryCustom {
	List<BuildingEntity> findByCondition(BuildingSearchBuilder builder);
}
