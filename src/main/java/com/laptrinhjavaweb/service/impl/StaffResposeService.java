package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.dto.response.StaffResponseDTO;
import com.laptrinhjavaweb.entity.BuildingEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.repository.UserRepository;
import com.laptrinhjavaweb.service.IStaffResposeService;

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
