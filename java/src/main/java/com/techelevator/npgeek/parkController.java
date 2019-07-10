package com.techelevator.npgeek;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.techelevator.npgeek.model.ParkDAO;

@Controller
public class parkController {
	@Autowired
	private ParkDAO parkDAO;

	
	@RequestMapping("/")
	public String goHome() {
		return "homePage";
	}
	
//	@RequestMapping(path="/", method=RequestMethod.GET)
//	public String showHomePage(ModelMap model) {
//		model.addAttribute("parks", parkDAO.getParks());
//		return "homePage";
//		}
//	
	
}
