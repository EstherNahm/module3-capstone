package com.techelevator.npgeek;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.npgeek.model.Park;
import com.techelevator.npgeek.model.ParkDAO;
import com.techelevator.npgeek.model.Weather;
import com.techelevator.npgeek.model.WeatherDAO;

@Controller
public class parkController {
	@Autowired
	private ParkDAO parkDAO;
	@Autowired
	private WeatherDAO weatherDAO;

	@RequestMapping(path="/", method=RequestMethod.GET)
	public String showHomePage(ModelMap model) {
		model.addAttribute("allParks", parkDAO.getParks());
		return "homePage";
		}
	

	@RequestMapping(path="/parkDetail", method=RequestMethod.GET)
	public String showParkDetail(ModelMap model, @RequestParam String parkCode) {
		Park park = parkDAO.getParkByCode(parkCode);
		model.put("park", park);
		return "selectedParkDetail";
	}
	
	@RequestMapping(path="/weatherDetail", method=RequestMethod.POST)
	public String weatherDetailByCode(ModelMap model, @RequestParam String parkCode, HttpSession session) {
		List<Weather> weather = weatherDAO.getWeatherByCode(parkCode);
		session.setAttribute("weather", weather);
		return "redirect:/weatherDetail";
	}
	



	@RequestMapping(path="/weatherDetail", method=RequestMethod.GET)
	public String showWeatherForecast(ModelMap model, @RequestParam String parkCode) {
		List<Weather> weather = weatherDAO.getWeatherByCode(parkCode);
		model.put("weather", weather);
		return "weatherDetail";
	}
	
	
}