package com.laptrinhjavaweb.repository.custom.impl;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.laptrinhjavaweb.builder.BuildingSearchBuilder;
import com.laptrinhjavaweb.entity.BuildingEntity;
import com.laptrinhjavaweb.repository.custom.BuildingRepositoryCustom;

@Repository
public class BuildingRepositoryImpl implements BuildingRepositoryCustom {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public List<BuildingEntity> findAll(BuildingSearchBuilder builder) {
		try {
			StringBuilder sb = new StringBuilder("select * from building b where 1 = 1");
			StringBuilder joinTable = new StringBuilder("");
			sb = buildQueryCommon(builder, sb);
			sb = buildQuerySpecial(builder, sb);
			Query query = entityManager.createNativeQuery(sb.toString(), BuildingEntity.class);
			return query.getResultList();
		} catch (Exception e) {
			return new ArrayList<>();
		}
	}

	private StringBuilder buildQuerySpecial(BuildingSearchBuilder builder, StringBuilder sb) {
		if (builder.getAreaRentFrom() != null || builder.getAreaRentTo() != null) {
			sb.append(" and exists (select * from rentarea as ra where ra.buildingid = b.id");
			if (builder.getAreaRentFrom() != null) {
				sb.append(" and " + builder.getAreaRentFrom() + " <= ra.value");
			}
			if (builder.getAreaRentTo() != null) {
				sb.append(" and ra.value <= " + builder.getAreaRentTo() + "");
			}
			sb.append(")");
		}
		/*if (builder.getCostRentFrom() != null || builder.getCostRentTo() != null) {
			if (builder.getCostRentFrom() != null) {
				sb.append(" and " + builder.getCostRentFrom() + " <= b.value");
			}
			if (builder.getAreaRentTo() != null) {
				sb.append(" and b.value <= " + builder.getAreaRentTo() + "");
			}
			sb.append(")");
		}*/
		if (builder.getBuildingTypes() != null && builder.getBuildingTypes().length > 0) {
			sb.append(" and (");
			String queryType = Arrays.stream(builder.getBuildingTypes()).map(item -> "b.type like '%" + item + "%'").collect(Collectors.joining(" OR "));
			sb.append(queryType);
			sb.append(")");
		}
		return sb;
	}

	private StringBuilder buildQueryCommon(BuildingSearchBuilder builder, StringBuilder sb) {
		Field[] fields = BuildingSearchBuilder.class.getDeclaredFields();
		try {
			for (Field field : fields) {
				field.setAccessible(true);
				if (!field.getName().equals("buildingTypes") && !field.getName().startsWith("costRent")
						&& !field.getName().startsWith("areaRent") && !field.getName().equals("staffId")) {
					if (field.get(builder) != null && field.get(builder) != "") {
						if (field.getType().getName().equals("java.lang.String")) {
							sb.append(" and b." + field.getName() + " like '%" + field.get(builder) + "%'");
						} else if (field.getType().getName().equals("java.lang.Integer")) {
							sb.append(" and b." + field.getName() + " = " + field.get(builder) + "");
						}
					}
				}
			}
			return sb;
		} catch (Exception e) {
			return null;
		}
	}
}
