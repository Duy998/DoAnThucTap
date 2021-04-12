package com.laptrinhjavaweb.controller.admin;

import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.service.IBuildingService;
import com.laptrinhjavaweb.service.IUserService;
import org.apache.commons.lang.ArrayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller(value = "buildingControllerOfAdmin")
public class BuildingController {

	@Autowired
	private IBuildingService buildingService;

	@Autowired
	private IUserService userService;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		// Date - dd/MM/yyyy
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	}

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
			lstBuilding = buildingService.findByCondition(params, buildingTypes);
		}
		mav.addObject("buildings", lstBuilding);
		mav.addObject("mapStaffs", userService.getStaffMaps());
		mav.addObject("mapTypes", buildingService.getBuildingTypes());
		mav.addObject("mapDistricts", buildingService.getDistrict());
		return mav;
	}

	@RequestMapping(value = "/admin/building-new", method = RequestMethod.GET)
	public ModelAndView showNewBuildingPage() {
		ModelAndView mav = new ModelAndView("admin/building/add");
		mav.addObject("building", new BuildingDTO());
		mav.addObject("mapTypes", buildingService.getBuildingTypes());
		mav.addObject("mapDistricts", buildingService.getDistrict());
		return mav;
	}

	@RequestMapping(value = "/admin/building-edit-{id}", method = RequestMethod.GET)
	public ModelAndView showEditBuildingPage(@PathVariable(name = "id") Long buildingId) {
		ModelAndView mav = new ModelAndView("admin/building/edit");
		BuildingDTO building = buildingService.findOne(buildingId);
		mav.addObject("building", building);
		mav.addObject("mapTypes", buildingService.getBuildingTypes());
		mav.addObject("mapDistricts", buildingService.getDistrict());
		return mav;
	}

//	@RequestMapping(value = "/admin/building/save", method = RequestMethod.POST)
//	public String saveBuilding(@ModelAttribute("building") BuildingDTO building) {
//
//		if (building.getId() != null) {
//			buildingService.save(building);
//		} else {
//			buildingService.save(ValidateFieldSave.ValidateUtils(building, new BuildingDTO()));
//		}
//		return "redirect:/admin/building-list";
//	}
}
