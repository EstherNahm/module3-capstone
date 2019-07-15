package com.techelevator.npgeek.model;

//class to hold objects that involve the survey results

public class FavoriteParks {
	private String parkCode;
	private int surveyCount;
	private Park park;

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

	public Park getPark() {
		return park;
	}

	public void setPark(Park park) {
		this.park = park;
	}

}
