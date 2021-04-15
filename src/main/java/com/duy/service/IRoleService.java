package com.duy.service;

import java.util.List;
import java.util.Map;

import com.duy.dto.RoleDTO;

public interface IRoleService {
	List<RoleDTO> findAll();
	Map<String,String> getRoles();
}
