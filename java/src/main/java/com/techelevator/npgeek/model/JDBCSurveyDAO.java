package com.techelevator.npgeek.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCSurveyDAO implements SurveyDAO {

	private JdbcTemplate jdbcTemplate;

	//connect JdbcTemplate
	@Autowired
	public JDBCSurveyDAO(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	//method to insert survey results into SQL database
	@Override
	public void saveSurveyResults(String parkCode, String emailAddress, String state, String activityLevel) {
		String sqlInsertSurveyResults = "INSERT INTO survey_result (parkcode, emailaddress, state, activitylevel) "
				+ "values (?, ?, ?, ?)";
		jdbcTemplate.update(sqlInsertSurveyResults, parkCode, emailAddress, state, activityLevel);
	}

	//method to do display all in survey_result table
	@Override
	public List<SurveyResult> getResults() {
		List<SurveyResult> theSurvey = new ArrayList<>();
		SurveyResult survey;
		String sqlSelectSurveyResults = "select * from survey_result";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectSurveyResults);
		while (results.next()) {
			survey = mapRowToSurveyResult(results);
			theSurvey.add(survey);
		}
		return theSurvey;
	}

	//method to display the favorite parks
	@Override
	public List<FavoriteParks> favoriteParks() {
		List<FavoriteParks> favoriteParks = new ArrayList<>();
		//create a new table survey_count; asc to keep it in alphabetical order and desc to print highest vote counts
		String sqlSelectSurveyResults = "select count(*) as survey_count, parkcode from survey_result "
				+ "group by parkcode " + "order by survey_count desc, parkcode asc";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectSurveyResults);
		while (results.next()) {
			String parkcode = results.getString("parkcode");
			int surveyCount = results.getInt("survey_count");
			//favoriteParks list has both the parks and the survey counts
			favoriteParks.add(new FavoriteParks(parkcode, surveyCount));
		}
		return favoriteParks;
	}

	//access to survey results 
	private SurveyResult mapRowToSurveyResult(SqlRowSet results) {
		SurveyResult survey = new SurveyResult();

		survey.setSurveyId(results.getInt("surveyId"));
		survey.setEmailAddress(results.getString("emailaddress"));
		survey.setParkCode(results.getString("parkcode"));
		survey.setState(results.getString("state"));
		survey.setActivityLevel(results.getString("activitylevel"));

		return survey;
	}

}
