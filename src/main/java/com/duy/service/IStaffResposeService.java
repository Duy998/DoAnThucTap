package com.duy.service;

import java.util.List;

import com.duy.dto.response.StaffResponseDTO;

public interface IStaffResposeService {
	List<StaffResponseDTO> findAll(Long id);
	
	     
}
