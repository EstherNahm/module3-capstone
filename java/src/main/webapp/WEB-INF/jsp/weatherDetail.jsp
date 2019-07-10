<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<c:forEach var="weather" items="${weatherForecast}">

	<c:url var="weatherImage" value="/img/weather/${weather.forecast}.jpg"/>
	<c:param name="parkCode" value="${weather.parkCode}"/>
	
	<p>${weather.low}</p>
	<p>${weather.high}</p>
	<p>${weather.forecast}</p>
	
</c:forEach>