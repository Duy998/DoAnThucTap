package com.duy.dto;

import java.util.ArrayList;
import java.util.List;

public class CustomerDTO extends AbstractDTO<CustomerDTO>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	private String fullName;
	private String phone;
	private String email;
	private String demand;
	private Integer status;
	private List<UserDTO> users = new ArrayList<>();
	private Long user ;
	
	
	
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDemand() {
		return demand;
	}
	public void setDemand(String demand) {
		this.demand = demand;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public List<UserDTO> getUsers() {
		return users;
	}
	public void setUsers(List<UserDTO> users) {
		this.users = users;
	}
	public Long getUser() {
		return user;
	}
	public void setUser(Long user) {
		this.user = user;
	}
	
	
}
