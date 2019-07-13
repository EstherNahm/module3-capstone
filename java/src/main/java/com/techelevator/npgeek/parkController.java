package com.techelevator.npgeek;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.npgeek.model.FavoriteParks;
import com.techelevator.npgeek.model.Park;
import com.techelevator.npgeek.model.ParkDAO;
import com.techelevator.npgeek.model.SurveyResult;
import com.techelevator.npgeek.model.SurveyDAO;
import com.techelevator.npgeek.model.Weather;
import com.techelevator.npgeek.model.WeatherDAO;

@Controller
public class parkController {
	@Autowired
	private ParkDAO parkDAO;
	@Autowired
	private WeatherDAO weatherDAO;
	@Autowired
	private SurveyDAO surveyDAO;

	@RequestMapping(path= {"/", "home"}, method=RequestMethod.GET)
	public String showHomePage(ModelMap model) {
		model.addAttribute("allParks", parkDAO.getParks());
		return "homePage";
		}
	
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
		
		
		return "selectedParkDetail";
	}
	
	
	
	@RequestMapping(path="/weatherDetail", method=RequestMethod.POST)
	public String showSelectedPark(ModelMap model, @RequestParam String parkCode, @RequestParam String tempUnit, HttpSession session) {
		parkCode = parkCode.endsWith(",") ? parkCode.substring(0, parkCode.length()-1) : parkCode;

		session.setAttribute("tempUnit", tempUnit);

		return "redirect:/parkDetail?parkCode=" + parkCode;
	}	
	
	@RequestMapping(path="/userInput", method=RequestMethod.GET)
	public String userSurveyInput(ModelMap model) {
		model.addAttribute("allParks", parkDAO.getParks());
		return "userInput";
	}
	
	@RequestMapping(path="/userInput", method=RequestMethod.POST)
	public String processUserSurveyInput(HttpSession session, @RequestParam String emailAddress, @RequestParam String state, @RequestParam String activityLevel, @RequestParam String parkCode) {
		 surveyDAO.saveSurveyResults(parkCode, emailAddress, state, activityLevel); 
		 return "redirect:/surveyResult";
	}
	
	
	@RequestMapping(path="/surveyResult", method=RequestMethod.GET)
	public String showSurveyResult(ModelMap model) {
		List<FavoriteParks> favoriteparks = surveyDAO.favoriteParks();
		for (FavoriteParks fp: favoriteparks) {
			Park park = parkDAO.getParkByCode(fp.getParkCode());
			fp.setPark(park);
		}
		model.addAttribute("favoriteParks", favoriteparks);
		
		return "surveyResult";
		}
	
	
	
}