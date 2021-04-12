package com.laptrinhjavaweb.builder;

import java.io.Serializable;

public class BuildingAddBuilder implements Serializable {

	private String name;
	private String district;
	private Integer floorArea;
	private String street;
	private String ward;
	private String level;
	private String direction;
	private Integer numberOfBasement;
	private String[] buildingTypes = new String[] {};
	private Integer costRent;
	private String costDescription;
	private String serviceCost;
	private String carCost;
	private String motorbikeCost;
	private String overtimeCost;
	private String areaRent;
	private String areaRentDescription;
	private String electricityCost;
	private String deposit;
	private String payment;
	private String timeRent;
	private String timeDecorator;
	private String brokerageFee;

	public String getName() {
		return name;
	}

	public String getDistrict() {
		return district;
	}

	public Integer getFloorArea() {
		return floorArea;
	}

	public Integer getNumberOfBasement() {
		return numberOfBasement;
	}

	public String getStreet() {
		return street;
	}

	public String getWard() {
		return ward;
	}

	public String[] getBuildingTypes() {
		return buildingTypes;
	}

	public String getLevel() {
		return level;
	}

	public String getDirection() {
		return direction;
	}

	public Integer getCostRent() {
		return costRent;
	}

	public String getCostDescription() {
		return costDescription;
	}

	public String getServiceCost() {
		return serviceCost;
	}

	public String getCarCost() {
		return carCost;
	}

	public String getMotorbikeCost() {
		return motorbikeCost;
	}

	public String getOvertimeCost() {
		return overtimeCost;
	}

	public String getAreaRent() {
		return areaRent;
	}

	public String getAreaRentDescription() {
		return areaRentDescription;
	}

	public String getElectricityCost() {
		return electricityCost;
	}

	public String getDeposit() {
		return deposit;
	}

	public String getPayment() {
		return payment;
	}

	public String getTimeRent() {
		return timeRent;
	}

	public String getTimeDecorator() {
		return timeDecorator;
	}

	public String getBrokerageFee() {
		return brokerageFee;
	}

	public BuildingAddBuilder(Builder builder) {
		this.name = builder.name;
		this.district = builder.district;
		this.floorArea = builder.floorArea;
		this.numberOfBasement = builder.numberOfBasement;
		this.street = builder.street;
		this.ward = builder.ward;
		this.level = builder.level;
		this.direction = builder.direction;
		this.buildingTypes = builder.buildingTypes;
		this.costRent = builder.costRent;
		this.costDescription = builder.costDescription;
		this.serviceCost = builder.serviceCost;
		this.carCost = builder.carCost;
		this.motorbikeCost = builder.motorbikeCost;
		this.overtimeCost = builder.overtimeCost;
		this.areaRent = builder.areaRent;
		this.areaRentDescription = builder.areaRentDescription;
		this.electricityCost = builder.electricityCost;
		this.deposit = builder.deposit;
		this.payment = builder.payment;
		this.timeRent = builder.timeRent;
		this.timeDecorator = builder.timeDecorator;
		this.brokerageFee = builder.brokerageFee;
	}
	
	public static class Builder {

		private String name;
		private String district;
		private Integer floorArea;
		private String street;
		private String ward;
		private String level;
		private String direction;
		private Integer numberOfBasement;
		private String[] buildingTypes = new String[] {};
		private Integer costRent;
		private String costDescription;
		private String serviceCost;
		private String carCost;
		private String motorbikeCost;
		private String overtimeCost;
		private String areaRent;
		private String areaRentDescription;
		private String electricityCost;
		private String deposit;
		private String payment;
		private String timeRent;
		private String timeDecorator;
		private String brokerageFee;
		
		public Builder setName(String name) {
			this.name = name;
			return this;
		}
		
		public Builder setDistrict(String district) {
			this.district = district;
			return this;
		}

		public Builder setNumberOfBasement(Integer numberOfBasement) {
			this.numberOfBasement = numberOfBasement;
			return this;
		}

		public Builder setFloorArea(Integer floorArea) {
			this.floorArea = floorArea;
			return this;
		}
		
		public Builder setStreet(String street) {
			this.street = street;
			return this;
		}

		public Builder setWard(String ward) {
			this.ward = ward;
			return this;
		}
		
		public Builder setBuildingTypes(String[] buildingTypes) {
			this.buildingTypes = buildingTypes;
			return this;
		}

		public Builder setLevel(String level) {
			this.level = level;
			return this;
		}

		public Builder setDirection(String direction) {
			this.direction = direction;
			return this;
		}

		public Builder setCostRent(Integer costRent) {
			this.costRent = costRent;
			return this;
		}

		public Builder setCostDescription(String costDescription) {
			this.costDescription = costDescription;
			return this;
		}

		public Builder setServiceCost(String serviceCost) {
			this.serviceCost = serviceCost;
			return this;
		}

		public Builder setCarCost(String carCost) {
			this.carCost = carCost;
			return this;
		}

		public Builder setMotorbikeCost(String motorbikeCost) {
			this.motorbikeCost = motorbikeCost;
			return this;
		}

		public Builder setOvertimeCost(String overtimeCost) {
			this.overtimeCost = overtimeCost;
			return this;
		}

		public Builder setAreaRent(String areaRent) {
			this.areaRent = areaRent;
			return this;
		}

		public Builder setAreaRentDescription(String areaRentDescription) {
			this.areaRentDescription = areaRentDescription;
			return this;
		}

		public Builder setElectricityCost(String electricityCost) {
			this.electricityCost = electricityCost;
			return this;
		}

		public Builder setDeposit(String deposit) {
			this.deposit = deposit;
			return this;
		}

		public Builder setPayment(String payment) {
			this.payment = payment;
			return this;
		}

		public Builder setTimeRent(String timeRent) {
			this.timeRent = timeRent;
			return this;
		}

		public Builder setTimeDecorator(String timeDecorator) {
			this.timeDecorator = timeDecorator;
			return this;
		}

		public Builder setBrokerageFee(String brokerageFee) {
			this.brokerageFee = brokerageFee;
			return this;
		}

		public BuildingAddBuilder build() {
			return new BuildingAddBuilder(this);
		}
	}
}
