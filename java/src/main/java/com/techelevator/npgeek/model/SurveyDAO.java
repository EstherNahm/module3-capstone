package com.techelevator.npgeek.model;

import java.util.List;

public interface SurveyDAO {
	public List<SurveyResult> getResults();
	public void saveSurveyResults(String parkCode, String emailAddress, String state, String activityLevel);
	public List<FavoriteParks> favoriteParks();
}
