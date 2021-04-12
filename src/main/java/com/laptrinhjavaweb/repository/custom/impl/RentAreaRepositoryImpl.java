package com.laptrinhjavaweb.repository.custom.impl;

import com.laptrinhjavaweb.entity.RentAreaEntity;
import com.laptrinhjavaweb.repository.custom.RentAreaRepositoryCustom;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Repository
public class RentAreaRepositoryImpl implements RentAreaRepositoryCustom {

	@PersistenceContext
	private EntityManager entityManager;


	@Override
	public void deleteAreaValueForUpdate(Long id) {
		try {
			StringBuilder sb = new StringBuilder("");
			sb.append("delete from rentarea where buildingid = " + id + "");
			Query query = entityManager.createNativeQuery(sb.toString(), RentAreaEntity.class);
			query.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
