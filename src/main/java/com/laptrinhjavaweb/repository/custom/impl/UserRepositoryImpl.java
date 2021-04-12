package com.laptrinhjavaweb.repository.custom.impl;

import com.laptrinhjavaweb.entity.BuildingEntity;
import com.laptrinhjavaweb.entity.RentAreaEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.repository.custom.RentAreaRepositoryCustom;
import com.laptrinhjavaweb.repository.custom.UserRepositoryCustom;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Repository
public class UserRepositoryImpl implements UserRepositoryCustom {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public List<UserEntity> findAllByBuilding() {
		try {
			StringBuilder sb = new StringBuilder("");
			sb.append("select * from users u " +
					"left join assignmentbuilding ab on ab.staffid = u.id " +
					"join user_role ur on ur.user_id = u.id " +
					"join role r on r.id = ur.role_id and r.id = 2");
			Query query = entityManager.createNativeQuery(sb.toString(), UserEntity.class);
			return query.getResultList();
		} catch (Exception e) {
			return new ArrayList<>();
		}
	}

	@Override
	public List<UserEntity> findAllByCustomer(Long customerId) {
		try {
			StringBuilder sb = new StringBuilder("");
			sb.append("select * from users u " +
					"left join assignmentcustomer ac on ac.staffid = u.id and ac.customerid = " + customerId +
					" join user_role ur on ur.user_id = u.id " +
					"join role r on r.id = ur.role_id and r.id = 2");
			Query query = entityManager.createNativeQuery(sb.toString(), UserEntity.class);
			return query.getResultList();
		} catch (Exception e) {
			return new ArrayList<>();
		}
	}

	@Override
	public void deleteAllByCustomer(Long customerId) {
		try {
			StringBuilder sb = new StringBuilder("");
			sb.append("delete from assignmentcustomer where customerid = " + customerId);
			Query query = entityManager.createNativeQuery(sb.toString());
			query.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
