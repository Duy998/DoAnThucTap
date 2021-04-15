package com.duy.repository.custom.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.duy.dto.CustomerDTO;
import com.duy.entity.CustomerEntity;
import com.duy.repository.custom.CustomerRepositoryCustom;
import com.duy.utils.StringUtils;

@Repository
public class CustomerRepositoryImpl implements CustomerRepositoryCustom{

	@PersistenceContext
	EntityManager entitymanager;
	
	@Override
	public List<CustomerEntity> findAll(CustomerDTO customer) {
		try {
			StringBuilder sql = new StringBuilder("select * from customer c");
			if(customer.getUser() != null) {
				sql.append(" left join assignmentcustomer au  on c.id = au.customerid");
			}
			sql.append(" where 1 = 1");
			if(!StringUtils.isNullOrEmpty(customer.getFullName())) {
				sql.append(" and c.fullname like '%"+customer.getFullName()+"%' ");
			}
			if(!StringUtils.isNullOrEmpty(customer.getPhone())) {
				sql.append(" and phone like '%"+customer.getPhone()+"%'");
			}
			if(!StringUtils.isNullOrEmpty(customer.getEmail())) {
				sql.append(" and email like '%"+customer.getEmail()+"%'");
			}
			if(customer.getUser() != null) {
				sql.append(" and au.staffid = '"+customer.getUser()+"'");
			}

			Query query = entitymanager.createNativeQuery(sql.toString(),CustomerEntity.class);
			return query.getResultList();
		} catch (Exception e) {
			return new ArrayList<>();
		}
		
	}

}
