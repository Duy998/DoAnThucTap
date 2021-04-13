package com.laptrinhjavaweb.dto.response;

import java.util.ArrayList;
import java.util.List;

public class ResposeDTO {
	
	private List<StaffResponseDTO> data = new ArrayList<StaffResponseDTO>();
	private String message = "thanh cong";
	public List<StaffResponseDTO> getData() {
		return data;
	}

	public void setData(List<StaffResponseDTO> data) {
		this.data = data;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	
	
	
	
	
}
