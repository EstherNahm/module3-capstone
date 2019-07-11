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
	

	
	//pass in HTTP session 
	//PDAO.getparkCode 
	//
	@RequestMapping(path="/parkDetail", method=RequestMethod.GET)
	public String showParkDetail(ModelMap model, @RequestParam String parkCode, HttpSession session) {
		Park park = parkDAO.getParkByCode(parkCode);
		model.put("park", park);
		
		parkCode = parkCode.endsWith(",") ? parkCode.substring(0, parkCode.length()-1) : parkCode;
		List<Weather> weather = weatherDAO.getWeatherByCode(parkCode);
		model.put("weather", weather);
		
		String tempUnit = (String)session.getAttribute("tempUnit");
		if(tempUnit==null){
			tempUnit="F";
			session.setAttribute("tempUnit", tempUnit);
		}
				model.put("tempUnit", tempUnit);
		
		//anything that comes out of session is an object; so cast it 
		return "selectedParkDetail";
	}
	
	
	
	@RequestMapping(path="/weatherDetail", method=RequestMethod.POST)
	public String showSelectedPark(ModelMap model, @RequestParam String parkCode, @RequestParam String tempUnit, HttpSession session) {
		parkCode = parkCode.endsWith(",") ? parkCode.substring(0, parkCode.length()-1) : parkCode;
//		List<Weather> weather = weatherDAO.getWeatherByCode(parkCode);
//		model.put("weather", weather);
		
//		String tempUnit = (String)session.getAttribute("tempUnit");
//		if(tempUnit==null){
//			tempUnit="F";
//			session.setAttribute("tempUnit", tempUnit);
//		}
//		
//		model.put("tempUnit", tempUnit);
		
		session.setAttribute("tempUnit", tempUnit);
		
		return "redirect:/parkDetail?parkCode="+parkCode;
	}	
	
	
}