package com.techelevator.npgeek;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.npgeek.model.Park;
import com.techelevator.npgeek.model.ParkDAO;

@Controller
public class parkController {
	@Autowired
	private ParkDAO parkDAO;

	@RequestMapping(path="/", method=RequestMethod.GET)
	public String showHomePage(ModelMap model) {
		model.addAttribute("parks", parkDAO.getParks());
		return "homePage";
		}

	@RequestMapping(path="/parkDetail", method=RequestMethod.GET)
	public String showParkDetail(ModelMap model, @RequestParam String parkCode) {
		Park park = parkDAO.getParkByCode(parkCode);
		model.put("park", park);
		return "selectedParkDetail";
	
}
}