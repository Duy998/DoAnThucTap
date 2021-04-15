package com.duy.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.duy.constant.SystemConstant;
import com.duy.dto.CustomerDTO;
import com.duy.dto.UserDTO;
import com.duy.service.ICustomerService;
import com.duy.service.IUserService;

@Controller(value = "customerControllerOfAdmin")
public class CustomerController {

	@Autowired
	private ICustomerService icustomerservice;
	
	@Autowired
	private IUserService iuserservice;

	@RequestMapping(value = "/admin/customer-list", method = RequestMethod.GET)
	public ModelAndView customerList(@ModelAttribute("modelSearch") CustomerDTO customerDTO
			,@RequestParam(required = false) String message) {
		ModelAndView mav = new ModelAndView("admin/customer/list");
		CustomerDTO result = new CustomerDTO();
		result.setListResult(icustomerservice.findAll(customerDTO));
		UserDTO users = new UserDTO();
		users.setUsers(iuserservice.findAll());
		mav.addObject("users",users);
		mav.addObject("message", message);
		mav.addObject("customers", result);
		return mav;
	}

	@RequestMapping(value = "/admin/customer-edit-{id}", method = RequestMethod.GET)
	public ModelAndView customeredit(@PathVariable(name = "id", required = false) Long CustomerId,
			@RequestParam(required = false) String message) {
		ModelAndView mav = new ModelAndView("admin/customer/edit");
		CustomerDTO result = new CustomerDTO();
		if (CustomerId != null) {
			result = icustomerservice.findOne(CustomerId);
		}
		mav.addObject("message", message);
		mav.addObject(SystemConstant.MODEL, result);
		return mav;
	}

}
