package com.duy.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duy.dto.response.StaffResponseDTO;
import com.duy.entity.BuildingEntity;
import com.duy.entity.UserEntity;
import com.duy.repository.UserRepository;
import com.duy.service.IStaffResposeService;

@Service
public class StaffResposeService implements IStaffResposeService{

	@Autowired
	private UserRepository userrepository;
	
	@Override
	public List<StaffResponseDTO> findAll(Long id) {
		List<StaffResponseDTO> result = new ArrayList<StaffResponseDTO>();
		List<UserEntity> entity = userrepository.findAll();
		for (UserEntity userEntity : entity) {
			StaffResponseDTO staffdto = new StaffResponseDTO();
			staffdto.setFullName(userEntity.getFullName());
			staffdto.setStaffId(userEntity.getId());
			for (BuildingEntity e : userEntity.getBuildings()) {
				if(e.getId() == id){
					staffdto.setChecked("checked");
				}
			}
			result.add(staffdto);
		}
		return result;
	}
	
}
