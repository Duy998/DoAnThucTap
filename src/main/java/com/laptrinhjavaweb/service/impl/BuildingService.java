package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.laptrinhjavaweb.builder.BuildingSearchBuilder;
import com.laptrinhjavaweb.converter.BuildingConverter;
import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.dto.response.StaffResponseDTO;
import com.laptrinhjavaweb.entity.BuildingEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.enums.BuildingTypesEnum;
import com.laptrinhjavaweb.enums.DistrictsEnum;
import com.laptrinhjavaweb.repository.BuildingRepository;
import com.laptrinhjavaweb.repository.UserRepository;
import com.laptrinhjavaweb.service.IBuildingService;
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
        BuildingSearchBuilder builder = new BuildingSearchBuilder.Builder()
                .setName(params.get("name"))
                .setNumberOfBasement(Integer.parseInt(params.get("numberOfBasement")))
                .setDistrict(params.get("district"))
                .setStreet(params.get("street"))
                .setWard(params.get("ward"))
                .setBuildingTypes(buildingTypes)
                /*.setAreaRentFrom(Integer.parseInt(params.get("areaRentFrom")))
                .setAreaRentTo(Integer.parseInt(params.get("areaRentTo")))
                .setFloorArea(Integer.parseInt(params.get("floorArea")))
                .setCostRentFrom(Integer.parseInt(params.get("costRentFrom")))
                .setCostRentTo(Integer.parseInt(params.get("costRentTo")))
                .setStaffId(Integer.parseInt(params.get("staffId")))*/
                .build();

        List<BuildingEntity> buildingEntities = buildingRepository.findAll(builder);

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
}
