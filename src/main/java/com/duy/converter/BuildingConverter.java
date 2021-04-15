package com.duy.converter;

import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import com.duy.dto.BuildingDTO;
import com.duy.entity.BuildingEntity;
import com.duy.entity.UserEntity;
import com.duy.enums.BuildingTypesEnum;
import com.duy.enums.DistrictsEnum;
import com.duy.repository.UserRepository;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;
@Component
public class BuildingConverter {

	@Autowired
    private ModelMapper modelMapper;

    @Autowired
    private UserRepository userRepository;

    public BuildingDTO convertToDto (BuildingEntity entity) {
        BuildingDTO result = modelMapper.map(entity, BuildingDTO.class);
        // address
        if (!StringUtils.isNotBlank(result.getAddress())) {
            StringBuilder sb = new StringBuilder("");
            if (StringUtils.isNotBlank(entity.getStreet())) {
                sb.append(entity.getStreet() + ", ");
            }
            if (StringUtils.isNotBlank(entity.getWard())) {
                sb.append(entity.getWard() + ", ");
            }
            if (StringUtils.isNotBlank(entity.getDistrict())) {
                sb.append(DistrictsEnum.getDistrictName(entity.getDistrict()));
            }
            result.setAddress(sb.toString());
        }
        // buildingTypes
        if (StringUtils.isNotBlank(entity.getBuildingTypes())) {
            String[] buildingTypesToConvert = entity.getBuildingTypes().split("\\,");
			String buildingTypesConveryed = null; /*
											 * Stream.of(buildingTypesToConvert).map(type ->
											 * BuildingTypesEnum.getBuildingTypesName(type)).collect(Collectors.
											 * joining(" - "));
											 */
            result.setBuildingTypesConverted(buildingTypesConveryed);
        }
        // staff and phone
        if (!CollectionUtils.isEmpty(entity.getStaffs())) {
            List<Long> staffIds = entity.getStaffs().stream().
                                            map(id -> id.getId()).
                                            collect(Collectors.toList());
            List<UserEntity> userFound = userRepository.findAll(staffIds);
            StringBuilder sb = new StringBuilder("");
            for (UserEntity user : userFound) {
                if (StringUtils.isNotBlank(user.getFullName())) {
                    sb.append(user.getFullName());
                }
                if (StringUtils.isNotBlank(user.getPhone())) {
                    sb.append(" - " + user.getPhone());
                }
                result.setStaffsNameAndPhoneConverted(sb.toString());
            }

        }
        // ares
        if (!CollectionUtils.isEmpty(entity.getAreas())) {
            String aresConverted = entity.getAreas().
                                        stream().
                                        map(area -> area.getValue().toString()).
                                        collect(Collectors.joining(", "));
            result.setAreaRent(aresConverted);
        }
        return result;
    }

    public BuildingEntity convertToEntity (BuildingDTO dto){

        BuildingEntity result = modelMapper.map(dto, BuildingEntity.class);

        // type of building
        if (!ArrayUtils.isEmpty(dto.getBuildingTypes())) {
            String types = Arrays.stream(dto.getBuildingTypes()).
                                collect(Collectors.joining(","));
            result.setBuildingTypes(types);
        }
        return result;
    }

    public BuildingDTO convertToDtoUpdate (BuildingEntity entity) {
        BuildingDTO result = modelMapper.map(entity, BuildingDTO.class);
        if (entity.getAreas() != null) {
            String ares = entity.getAreas().stream().
                            map(area -> area.getValue().toString()).
                            collect(Collectors.joining(","));
            result.setAreaRent(ares);
        }
        if (StringUtils.isNotBlank(entity.getBuildingTypes())) {
            result.setBuildingTypes(entity.getBuildingTypes().split("\\,"));
        }
        return result;
    }
}
