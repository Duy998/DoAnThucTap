package com.duy.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.duy.builder.BuildingSearchBuilder;
import com.duy.converter.BuildingConverter;
import com.duy.dto.BuildingDTO;
import com.duy.dto.response.StaffResponseDTO;
import com.duy.entity.BuildingEntity;
import com.duy.entity.UserEntity;
import com.duy.enums.BuildingTypesEnum;
import com.duy.enums.DistrictsEnum;
import com.duy.repository.BuildingRepository;
import com.duy.repository.UserRepository;
import com.duy.service.IBuildingService;

import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;

@Service
public class BuildingService implements IBuildingService {

    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private BuildingConverter buildingConverter;

    @Autowired
    private UserRepository userrepository;
    
    
    @Override
    public List<BuildingDTO> findAll() {
        List<BuildingEntity> entities = buildingRepository.findAll();
        List<BuildingDTO> results = entities.stream().map(item -> buildingConverter.convertToDto(item)).collect(Collectors.toList());
        return results;
    }

    @Override
    @Transactional
    public void save(BuildingDTO buildingDTO) {
        BuildingEntity buildingEntity = buildingConverter.convertToEntity(buildingDTO);
        buildingRepository.save(buildingEntity);
    }

    @Override
    public List<BuildingDTO> findAll(Map<String, String> params, String[] buildingTypes) {
    	  BuildingSearchBuilder.Builder paramsValidated = new BuildingSearchBuilder.Builder();

          if (StringUtils.isNotBlank(params.get("name"))) {
              paramsValidated.setName(params.get("name"));
          }
          if (StringUtils.isNotBlank(params.get("numberOfBasement"))) {
              paramsValidated.setNumberOfBasement(Integer.parseInt(params.get("numberOfBasement")));
          }
          if (StringUtils.isNotBlank(params.get("district"))) {
              paramsValidated.setDistrict(params.get("district"));
          }
          if (StringUtils.isNotBlank(params.get("street"))) {
              paramsValidated.setStreet(params.get("street"));
          }
          if (StringUtils.isNotBlank(params.get("ward"))) {
              paramsValidated.setWard(params.get("ward"));
          }
          if (StringUtils.isNotBlank(params.get("direction"))) {
              paramsValidated.setDirection(params.get("direction"));
          }
          if (StringUtils.isNotBlank(params.get("floorArea"))) {
              paramsValidated.setFloorArea(Integer.parseInt(params.get("floorArea")));
          }
          if (!ArrayUtils.isEmpty(buildingTypes)) {
              paramsValidated.setBuildingTypes(buildingTypes);
          }
          if (StringUtils.isNotBlank(params.get("areaRentFrom"))) {
              paramsValidated.setAreaRentFrom(Integer.parseInt(params.get("areaRentFrom")));
          }
          if (StringUtils.isNotBlank(params.get("areaRentTo"))) {
              paramsValidated.setAreaRentTo(Integer.parseInt(params.get("areaRentTo")));
          }
          if (StringUtils.isNotBlank(params.get("costRentFrom"))) {
              paramsValidated.setCostRentFrom(Integer.parseInt(params.get("costRentFrom")));
          }
          if (StringUtils.isNotBlank(params.get("costRentTo"))) {
              paramsValidated.setCostRentTo(Integer.parseInt(params.get("costRentTo")));
          }
          if (StringUtils.isNotBlank(params.get("staffId"))) {
              paramsValidated.setStaffId(Integer.parseInt(params.get("staffId")));
          }

          List<BuildingEntity> buildingEntities = buildingRepository.findByCondition(paramsValidated.build());

          List<BuildingDTO> results = buildingEntities.stream().map(item -> buildingConverter.convertToDto(item)).collect(Collectors.toList());
          return results;
    }

    @Override
    public Map<String, String> getBuildingTypes() {
        Map<String, String> result = new HashMap<>();
        Stream.of(BuildingTypesEnum.values()).forEach(type -> {result.put(type.name(), type.getBuildingTypeValue());});
        return result;
    }

    @Override
    public Map<String, String> getDistrict() {
        Map<String, String> result = new HashMap<>();
        Stream.of(DistrictsEnum.values()).forEach(district -> {result.put(district.name(), district.getDistrictValue());});
        return result;
    }
	/* jdbc=============================== */
    
   /* ResourceBundle resourceBundle = ResourceBundle.getBundle("application");
	public Connection getConnection() {
		try {
			Class.forName(resourceBundle.getString("driverName"));
			String url = resourceBundle.getString("url");
			String user = resourceBundle.getString("username");
			String password = resourceBundle.getString("password");
			return DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException | SQLException e) {
			return null;
		}
	}
	*/

	@Override
	public BuildingDTO updatebystaffid(StaffResponseDTO staffs) {
		BuildingEntity entity = buildingRepository.findOne(staffs.getBuildingId());	
		List<UserEntity> listuserentity = new ArrayList<UserEntity>();
		for (Long userEntity :  staffs.getStaffs()) {
			UserEntity userentity = userrepository.findOne(userEntity);
			listuserentity.add(userentity);
		}
		entity.setStaffs(listuserentity);

		return buildingConverter.convertToDto(buildingRepository.save(entity)); 
		
		/*String sql = "SELECT * FROM assignmentbuilding WHERE buildingid = '"+staffs.getBuildingId()+"'";
		List<AssignmentBuildingDTO> results = new ArrayList<>();
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		
		connection = getConnection();
		statement = connection.prepareStatement(sql);
		statement.setLong(1, );
		setParameter(statement, parameters);
		resultSet = statement.executeQuery();
		
		*/
		
		
		
		
		/* return null; */
	}
	
	

	/*/jdbc============================ */
	@Override
	public BuildingDTO findOne(Long buildingid) {
		return buildingConverter.convertToDto(buildingRepository.findOne(buildingid));
	}

	@Override
	public void delete(Long[] ids) {
		for (Long long1 : ids) {
			buildingRepository.delete(long1);
		}
		
	}
}
