<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Please take this survey:</title>
</head>
<body>

<c:url var="formAction" value="/surveyResult" /> <%--URL for when form is submitted --%>
	<form method="POST" action="${formAction}">

<label for="emailAddress">E-mail:</label>
	<input type="text" name="emailAddress" id="emailAddress"/>
	
	<label for="state">State of Residence:</label>
	<input type="text" name="state" id="state"/>

	<p>Activity Level:</p>
	<input type="Radio" value="inactive" name="activityLevel" id="inactive">Inactive
	<input type="Radio" value="sedentary" name="activityLevel" id="sedentary">Sedentary
	<input type="Radio" value="active" name="activityLevel" id="active">Active
	<input type="Radio" value="extremelyActive" name="activityLevel" id="extremelyActive">Extremely Active
	
	<input class="formSubmitButton" type="submit" value="Submit >>>" />
	
</form>
</body>
</html>