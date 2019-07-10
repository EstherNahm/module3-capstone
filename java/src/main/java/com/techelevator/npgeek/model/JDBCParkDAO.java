package com.techelevator.npgeek.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCParkDAO implements ParkDAO {
	
	private JdbcTemplate jdbcTemplate;

	@Autowired 
	//link JDBC dataSource for SQL 
	public void JdbcParkDao(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	//method to get all parks
	public List<Park> getParks() {
		//initialize a new List to hold the parks
		List<Park> theParks = new ArrayList<>();
		//create park object
		Park selectedPark;
		//SQL command to get all parks
		String sqlSelectParks = "SELECT * FROM park";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectParks);
		//loop through to add each SQL row to list
		while (results.next()) {
			selectedPark = mapRowToPark(results);
			theParks.add(selectedPark);
		}
		return theParks;
	}

	@Override
	public Park getParkByCode(String parkCode) {
		Park park = null;
		String sqlSelectParkByCode = "SELECT * FROM park WHERE parkcode = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectParkByCode, parkCode);
		if (results.next()) {
			park = mapRowToPark(results);
		}
		return park;
	}
	
	
		//allows access to SQL rows
		private Park mapRowToPark(SqlRowSet results) {
			
			Park park = new Park();
			
			park.setParkCode(results.getString("parkcode"));
			park.setParkName(results.getString("parkname"));
			park.setState(results.getString("state"));
			park.setAcreage(results.getInt("acreage"));
			park.setElevationInFeet(results.getInt("elevationinfeet"));
			park.setMilesOfTrail(results.getDouble("milesoftrail"));
			park.setNumberOfCampsites(results.getInt("numberofcampsites"));
			park.setClimate(results.getString("climate"));
			park.setYearFounded(results.getInt("yearfounded"));
			park.setAnnualVisitorCount(results.getInt("annualvisitorcount"));
			park.setInspirationalQuote(results.getString("inspirationalquote"));
			park.setInspirationalQuoteSource(results.getString("inspirationalquotesource"));
			park.setParkDescription(results.getString("parkdescription"));
			park.setEntryFee(results.getInt("entryfee"));
			park.setNumberOfAnimalSpecies(results.getInt("numberofanimalspecies"));

			return park;
		}

		
}
