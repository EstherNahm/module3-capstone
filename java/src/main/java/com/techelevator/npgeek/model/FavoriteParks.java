package com.techelevator.npgeek.model;

public class FavoriteParks {
	private String parkCode;
	private int surveyCount;
	
	public FavoriteParks(String parkCode, int surveyCount) {
		this.parkCode = parkCode;
		this.surveyCount = surveyCount;
	}
	/**
	 * @return the parkCode
	 */
	public String getParkCode() {
		return parkCode;
	}
	/**
	 * @param parkCode the parkCode to set
	 */
	public void setParkCode(String parkCode) {
		this.parkCode = parkCode;
	}
	/**
	 * @return the surveyCount
	 */
	public int getSurveyCount() {
		return surveyCount;
	}
	/**
	 * @param surveyCount the surveyCount to set
	 */
	public void setSurveyCount(int surveyCount) {
		this.surveyCount = surveyCount;
	}
	
	

}
