package com.techelevator.npgeek.model;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;

public class JDBCSurveyDAO implements SurveyDAO {

	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCSurveyDAO(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	//**make void method to save the survey and INSERT into SQL
	//***make method to get all the results of survey
	
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
