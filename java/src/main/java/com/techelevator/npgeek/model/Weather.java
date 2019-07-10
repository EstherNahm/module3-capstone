package com.techelevator.npgeek.model;

public class Weather {
	
	private String parkCode;
	private int fiveDayForecastValue;
	private int low;
	private int high;
	private String forecast;
	
	
	public String weatherAdvice() {
		if (forecast.equalsIgnoreCase("snow")) {
			return "Bring snowshoes!";
		} if (forecast.equalsIgnoreCase("rain")) {
			return "Bring rain gear and waterproof shoes!";
		} if (forecast.equalsIgnoreCase("thunderstorms")) {
			return "Seek shelter and avoid hiking on exposed ridges!";
		} if (forecast.equalsIgnoreCase("sun")) {
			return "Pack sunblock!";
		} if (high > 75) {
			return "Bring an extra gallon of water!";
		} if (high - low > 20) {
			return "Wear breathable layers!"; 
		} if (low < 20) {
			return "Be aware of the dangers of exposure to frigid temperatures!";
		} return "";
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
