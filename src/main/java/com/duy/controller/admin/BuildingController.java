package com.duy.controller.admin;

import org.apache.commons.lang.ArrayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.duy.dto.BuildingDTO;
import com.duy.service.IUserService;
import com.duy.service.impl.BuildingService;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller(value = "buildingControllerOfAdmin")
public class BuildingController {

	@Autowired
	private BuildingService buildingService;

	@Autowired
	private IUserService userService;

	@RequestMapping(value = "/admin/building-list", method = RequestMethod.GET)
	public ModelAndView buildingList(@ModelAttribute("modelSearch") BuildingDTO buildingDTO,
									 @RequestParam(required = false) String[] buildingTypes,
									 @RequestParam(required = false) Map<String, String> params) {
		ModelAndView mav = new ModelAndView("admin/building/list");
		mav.addObject("modelSearch", buildingDTO);

		List<BuildingDTO> lstBuilding = new ArrayList<>();

		if (ArrayUtils.isEmpty(buildingTypes) && CollectionUtils.isEmpty(params)) {
			// get all buildings when initial the first time
			lstBuilding = buildingService.findAll();
		} else {
			// get buildings that satisfy the searching condition
			lstBuilding = buildingService.findAll(params, buildingTypes);
		}
		mav.addObject("buildings", lstBuilding);
		mav.addObject("mapStaffs", userService.getStaffMaps());
		mav.addObject("mapTypes", buildingService.getBuildingTypes());
		mav.addObject("mapDistricts", buildingService.getDistrict());
		return mav;
	}

	@RequestMapping(value = "/admin/building-edit-{id}", method = RequestMethod.GET)
	public ModelAndView showEditBuildingPage(@PathVariable(name = "id",required = false) Long buildingId) {
		ModelAndView mav = new ModelAndView("admin/building/edit");
		BuildingDTO building = buildingService.findOne(buildingId);
		mav.addObject("building", building);
		mav.addObject("mapTypes", buildingService.getBuildingTypes());
		mav.addObject("mapDistricts", buildingService.getDistrict());
		return mav;
	}
}
