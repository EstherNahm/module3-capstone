package com.techelevator.npgeek.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCWeatherDAO implements WeatherDAO {

	private JdbcTemplate jdbcTemplate;

	//link JDBC template
	@Autowired
	public JDBCWeatherDAO(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	//method to get the forecasts by park
	@Override
	public List<Weather> getWeatherByCode(String parkCode) {
		List<Weather> theWeather = new ArrayList<>();
		Weather weather;
		String sqlWeatherForecast = "SELECT * FROM weather WHERE parkcode = ? ORDER BY fivedayforecastvalue";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlWeatherForecast, parkCode);
		while (results.next()) {
			weather = mapRowToWeather(results);
			theWeather.add(weather);
		}
		return theWeather;
	}
	
	//access to weather table in sql
	private Weather mapRowToWeather(SqlRowSet results) {
		Weather weather = new Weather();

		weather.setParkCode(results.getString("parkcode"));
		weather.setFiveDayForecastValue(results.getInt("fivedayforecastvalue"));
		weather.setLow(results.getInt("low"));
		weather.setHigh(results.getInt("high"));
		weather.setForecast(results.getString("forecast"));

		return weather;
	}

}
