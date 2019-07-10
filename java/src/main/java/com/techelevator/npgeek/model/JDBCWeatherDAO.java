package com.techelevator.npgeek.model;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;

public class JDBCWeatherDAO implements WeatherDAO {
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCWeatherDAO(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

	private Weather mapRowToWeather (SqlRowSet results) {
		Weather weather = new Weather();
		
		weather.setParkCode(results.getString("parkcode"));
		weather.setFiveDayForecastValue(results.getInt("fivedayforecastvalue"));
		weather.setLow(results.getInt("low"));
		weather.setHigh(results.getInt("high"));
		weather.setForecast(results.getString("forecast"));
	
		return weather;
	}
	
}
