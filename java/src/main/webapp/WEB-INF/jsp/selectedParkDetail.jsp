<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>


<c:import url="/WEB-INF/jsp/common/header.jsp" />    

<c:url var="parkImage" value="/img/parks/${fn:toLowerCase(park.parkCode)}.jpg"/>
<a><img src="${parkImage}"/></a>

<div>

<p>
${park.parkName}<br/>
${park.parkCode}<br/>
${park.parkName}<br/>
${park.state}<br/>
${park.acreage}<br/>
${park.elevationInFeet}<br/>
${park.milesOfTrail}<br/>
${park.numberOfCampsites}<br/>
${park.climate}<br/>
${park.yearFounded}<br/>
${park.annualVisitorCount}<br/>
${park.inspirationalQuote}<br/>
${park.inspirationalQuoteSource}<br/>
${park.parkDescription}<br/>
${park.entryFee}<br/>
${park.numberOfAnimalSpecies}<br/>
</div>


<c:url var="formAction" value="/weatherDetail">
	<c:param name="parkCode" value="${park.parkCode}"/>
</c:url>
<form method="POST" action="${formAction}">
<div class="formInput">
<input type="hidden" name="parkCode" id="parkCode"/>
</div>
<input type="Radio" value="F" name="tempUnit" id="F">F
<input type="Radio" value="C" name="tempUnit" id="C">C
<input class="formSubmitButton" type="submit" value="Submit"/>
</form>


<c:forEach var="weather" items="${weather}">


<table>
	<tr>
		<th>Day</th>
		<th>Description</th>
		<th>High</th>
		<th>Low</th>
	</tr>
	
	<tr>
		<td>${weather.fiveDayForecastValue}</td>
		<td>${weather.forecast}</td>
		<td>${weather.high}</td>
		<td>${weather.low}</td>
	</tr>

<tr>
<c:choose>
	
	<c:when test = "${weather.forecast == 'partly cloudy'}">
		<c:url var = "weatherImage" value = "/img/weather/partlyCloudy.png"/>
		<td><img src = "${weatherImage}" /> </td>
	</c:when>
	
<c:otherwise>

	<c:url var="weatherImage" value="/img/weather/${weather.forecast}.png"/>	
		<td><img src="${weatherImage}"/> </td>
	
</c:otherwise>
</c:choose>
</tr>

<tr>
	<c:choose>
		<c:when test="${weather.forecast == 'snow'}"><td>Pack snowshoes!</td></c:when>
		<c:when test="${weather.forecast == 'rain'}"><td>Bring rain gear and waterproof shoes!</td></c:when>
		<c:when test="${weather.forecast == 'thunderstorms'}"><td>Seek shelter and avoid hiking on exposed ridges!</td></c:when>
		<c:when test="${weather.forecast == 'sunny'}"><td>Pack sunblock!</td></c:when>
		<c:otherwise></c:otherwise>
	</c:choose> 
</tr>	

<tr>
	
	<c:choose>
		<c:when test="${weather.high > 75}"><td>Bring an extra gallon of water!</td></c:when>
		<c:when test="${weather.low < 20}"><td>Beware of the dangers of exposure to frigid temperatures!</td></c:when>
		<c:when test="${weather.high - weather.low > 20}"><td>Wear breathable layers!</td></c:when>
		<c:otherwise></c:otherwise>
	</c:choose> 
</tr>


</table>
</c:forEach>

