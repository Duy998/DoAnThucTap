package com.laptrinhjavaweb.builder;

import java.io.Serializable;

public class BuildingSearchBuilder implements Serializable {
	
	private String name;
	private String district;
	private Integer floorArea;
	private String street;
	private String ward;
	private String level;
	private String direction;
	private Integer numberOfBasement;
	private String[] buildingTypes = new String[] {};
	private Integer costRentFrom;
	private Integer costRentTo;
	private Integer areaRentFrom;
	private Integer areaRentTo;
	private Integer staffId;
	private String managerName;
	private String managerPhone;

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
	
	public Integer getCostRentFrom() {
		return costRentFrom;
	}

	public Integer getCostRentTo() {
		return costRentTo;
	}

	public Integer getAreaRentFrom() {
		return areaRentFrom;
	}

	public Integer getAreaRentTo() {
		return areaRentTo;
	}
	
	public Integer getStaffId() {
		return staffId;
	}

	public String getManagerName() {
		return managerName;
	}

	public String getManagerPhone() {
		return managerPhone;
	}

	public String getLevel() {
		return level;
	}

	public String getDirection() {
		return direction;
	}

	public BuildingSearchBuilder(Builder builder) {
		this.name = builder.name;
		this.district = builder.district;
		this.floorArea = builder.floorArea;
		this.numberOfBasement = builder.numberOfBasement;
		this.street = builder.street;
		this.ward = builder.ward;
		this.level = builder.level;
		this.direction = builder.direction;
		this.buildingTypes = builder.buildingTypes;
		this.costRentFrom = builder.costRentFrom;
		this.costRentTo = builder.costRentTo;
		this.areaRentFrom = builder.areaRentFrom;
		this.areaRentTo = builder.areaRentTo;
		this.staffId = builder.staffId;
		this.managerName = builder.managerName;
		this.managerPhone = builder.managerPhone;
	}
	
	public static class Builder {

		private String name;
		private String district;
		private String street;
		private String ward;
		private Integer floorArea;
		private String level;
		private String direction;
		private Integer numberOfBasement;
		private String[] buildingTypes = new String[] {};
		private Integer costRentFrom;
		private Integer costRentTo;
		private Integer areaRentFrom;
		private Integer areaRentTo;
		private Integer staffId;
		private String managerName;
		private String managerPhone;
		
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

		public Builder setCostRentFrom(Integer costRentFrom) {
			this.costRentFrom = costRentFrom;
			return this;
		}

		public Builder setCostRentTo(Integer costRentTo) {
			this.costRentTo = costRentTo;
			return this;
		}

		public Builder setAreaRentFrom(Integer areaRentFrom) {
			this.areaRentFrom = areaRentFrom;
			return this;
		}

		public Builder setAreaRentTo(Integer areaRentTo) {
			this.areaRentTo = areaRentTo;
			return this;
		}
		
		public Builder setStaffId(Integer staffId) {
			this.staffId = staffId;
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

		public Builder setManagerName(String managerName) {
			this.managerName = managerName;
			return this;
		}

		public Builder setManagerPhone(String managerPhone) {
			this.managerPhone = managerPhone;
			return this;
		}

		public BuildingSearchBuilder build() {
			return new BuildingSearchBuilder(this);
		}
	}
}
