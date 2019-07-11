package com.techelevator.npgeek.model;

public class Weather {
	
	private String parkCode;
	private int fiveDayForecastValue;
	private int low;
	private int high;
	private String forecast;

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
	 * @return the fiveDayForecastValue
	 */
	public int getFiveDayForecastValue() {
		return fiveDayForecastValue;
	}
	/**
	 * @param fiveDayForecastValue the fiveDayForecastValue to set
	 */
	public void setFiveDayForecastValue(int fiveDayForecastValue) {
		this.fiveDayForecastValue = fiveDayForecastValue;
	}
	/**
	 * @return the low
	 */
	public int getLow() {
		return low;
	}
	/**
	 * @param low the low to set
	 */
	public void setLow(int low) {
		this.low = low;
	}
	/**
	 * @return the high
	 */
	public int getHigh() {
		return high;
	}
	/**
	 * @param high the high to set
	 */
	public void setHigh(int high) {
		this.high = high;
	}
	/**
	 * @return the forecast
	 */
	public String getForecast() {
		return forecast;
	}
	/**
	 * @param forecast the forecast to set
	 */
	public void setForecast(String forecast) {
		this.forecast = forecast;
	}
	
}
