package com.laptrinhjavaweb.dto;

public class BuildingDTO extends AbstractDTO<BuildingDTO> {
	
	private String name;
	private Integer numberOfBasement;
	private Integer floorArea;
	private String street;
	private String ward;
	private String district;
	private String structure;
	private String direction;
	private String level;
	private Integer costRent;
	private String costDescription;
	private String serviceCost;
	private String carCost;
	private String motorbikeCost;
	private String overtimeCost;
	private String[] buildingTypes = new String[] {};
	private String costRentFrom;
	private String costRentTo;
	private String areaRentFrom;
	private String areaRentTo;
	private String staffId;
	private String electricityCost;
	private String deposit;
	private String payment;
	private String timeRent;
	private String timeDecorator;
	private String managerName;
	private String managerPhone;
	private String areaRent;
	private String areaRentDescription;
	private String brokerageFee;
	private String address;
	private String buildingTypesConverted;
	private String staffsNameAndPhoneConverted;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getWard() {
		return ward;
	}
	public void setWard(String ward) {
		this.ward = ward;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getStructure() {
		return structure;
	}
	public void setStructure(String structure) {
		this.structure = structure;
	}
	public Integer getCostRent() {
		return costRent;
	}
	public void setCostRent(Integer costRent) {
		this.costRent = costRent;
	}
	public String getCostDescription() {
		return costDescription;
	}
	public void setCostDescription(String costDescription) {
		this.costDescription = costDescription;
	}
	public String getServiceCost() {
		return serviceCost;
	}
	public void setServiceCost(String serviceCost) {
		this.serviceCost = serviceCost;
	}
	public String getCarCost() {
		return carCost;
	}
	public void setCarCost(String carCost) {
		this.carCost = carCost;
	}
	public String getMotorbikeCost() {
		return motorbikeCost;
	}
	public void setMotorbikeCost(String motorbikeCost) {
		this.motorbikeCost = motorbikeCost;
	}
	public String getOvertimeCost() {
		return overtimeCost;
	}
	public void setOvertimeCost(String overtimeCost) {
		this.overtimeCost = overtimeCost;
	}
	public Integer getNumberOfBasement() {
		return numberOfBasement;
	}
	public void setNumberOfBasement(Integer numberOfBasement) {
		this.numberOfBasement = numberOfBasement;
	}
	public Integer getFloorArea() {
		return floorArea;
	}
	public void setFloorArea(Integer buildingArea) {
		this.floorArea = buildingArea;
	}
	public String[] getBuildingTypes() {
		return buildingTypes;
	}
	public void setBuildingTypes(String[] buildingTypes) {
		this.buildingTypes = buildingTypes;
	}
	public String getCostRentFrom() {
		return costRentFrom;
	}
	public void setCostRentFrom(String costRentFrom) {
		this.costRentFrom = costRentFrom;
	}
	public String getCostRentTo() {
		return costRentTo;
	}
	public void setCostRentTo(String costRentTo) {
		this.costRentTo = costRentTo;
	}
	public String getAreaRentFrom() {
		return areaRentFrom;
	}
	public void setAreaRentFrom(String areaRentFrom) {
		this.areaRentFrom = areaRentFrom;
	}
	public String getAreaRentTo() {
		return areaRentTo;
	}
	public void setAreaRentTo(String areaRentTo) {
		this.areaRentTo = areaRentTo;
	}
	public String getStaffId() {
		return staffId;
	}
	public void setStaffId(String staffId) {
		this.staffId = staffId;
	}
	public String getElectricityCost() {
		return electricityCost;
	}
	public void setElectricityCost(String electricityCost) {
		this.electricityCost = electricityCost;
	}
	public String getDeposit() {
		return deposit;
	}
	public void setDeposit(String deposit) {
		this.deposit = deposit;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getTimeRent() {
		return timeRent;
	}
	public void setTimeRent(String timeRent) {
		this.timeRent = timeRent;
	}
	public String getTimeDecorator() {
		return timeDecorator;
	}
	public void setTimeDecorator(String timeDecorator) {
		this.timeDecorator = timeDecorator;
	}
	public String getManagerName() {
		return managerName;
	}
	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}
	public String getManagerPhone() {
		return managerPhone;
	}
	public void setManagerPhone(String managerPhone) {
		this.managerPhone = managerPhone;
	}
	public String getAreaRent() {
		return areaRent;
	}
	public void setAreaRent(String areaRent) {
		this.areaRent = areaRent;
	}

	public String getDirection() {
		return direction;
	}

	public void setDirection(String direction) {
		this.direction = direction;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getBrokerageFee() {
		return brokerageFee;
	}

	public void setBrokerageFee(String brokerageFee) {
		this.brokerageFee = brokerageFee;
	}

	public String getAreaRentDescription() {
		return areaRentDescription;
	}

	public void setAreaRentDescription(String areaRentDescription) {
		this.areaRentDescription = areaRentDescription;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setBuildingTypesConverted(String buildingTypesConverted) {
		this.buildingTypesConverted = buildingTypesConverted;
	}

	public String getBuildingTypesConverted() {
		return buildingTypesConverted;
	}

	public String getStaffsNameAndPhoneConverted() {
		return staffsNameAndPhoneConverted;
	}

	public void setStaffsNameAndPhoneConverted(String staffsNameAndPhoneConverted) {
		this.staffsNameAndPhoneConverted = staffsNameAndPhoneConverted;
	}
}
