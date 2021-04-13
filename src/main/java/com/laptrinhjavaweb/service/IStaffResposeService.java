package com.laptrinhjavaweb.service;

import java.util.List;

import com.laptrinhjavaweb.dto.response.StaffResponseDTO;

public interface IStaffResposeService {
	List<StaffResponseDTO> findAll(Long id);
	
	     
}
