<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<body>

<c:import url="/WEB-INF/jsp/common/header.jsp" />    

<h1 id="parkname">${park.parkName}</h1>

<div class ="parkfacts">
	<c:url var="parkImage" value="/img/parks/${fn:toLowerCase(park.parkCode)}.jpg"/>
	<a><img src="${parkImage}"/></a>
	<p id = "parkfacts">
	<strong>ABOUT:</strong><br/>
		Size: ${park.acreage} acres<br/>
		State: ${park.state}<br/>
		Elevation: ${park.elevationInFeet} feet<br/>
		Trails: ${park.milesOfTrail} miles<br/>
		Campsites: ${park.numberOfCampsites}<br/>
		Climate: ${park.climate}<br/>
		Year founded: ${park.yearFounded}<br/>
		Annual visitors: ${park.annualVisitorCount}<br/>
		Entrance fee: $${park.entryFee}<br/>
		Animal species: ${park.numberOfAnimalSpecies}<br/>
</div>

<div class=parkdescription>
	<br/>
	<h3 id="parkquote">${park.inspirationalQuote} -${park.inspirationalQuoteSource}</h3>
	<br/>
	<p id="parkdescription">${park.parkDescription}<br/><br/>
</div>

<div class = "tempbuttons">
	<c:url var="formAction" value="/weatherDetail">
		<c:param name="parkCode" value="${park.parkCode}"/>
	</c:url>
	
		<form method="POST" action="${formAction}">
	<div class="formInput">
		<input type="hidden" name="parkCode" id="parkCode"/>
	</div>
<div class="forecast">
	<h2>5 DAY WEATHER FORECAST FOR ${fn:toUpperCase(park.parkName)}</h2>	
		<p>Please select Fahrenheit or Celsius:</p>
</div>
		<input class="button" type="submit" value="F" name="tempUnit" id="F">
		<input class="button" type="submit" value="C" name="tempUnit" id="C">
	</form>
</div>

<div class="weatherforecast">
<c:forEach var="weather" items="${weather}">
	
		<div id="weatherforecast">
			<ul>
			   <li><strong>DAY:</strong> ${weather.fiveDayForecastValue}</li>
			   <li><strong>EXPECTED:</strong> ${weather.forecast}</li>
			
		
		<c:if test="${tempUnit == 'F'}">
				 <li><strong>HIGH:</strong> ${weather.high}°F<br/>
				 <li><strong>LOW:</strong> ${weather.low}°F<br/><br/>
		</c:if>
		
		<c:if test="${tempUnit == 'C'}">
				 <li><strong>HIGH:</strong> <fmt:formatNumber type="number" maxFractionDigits="0" value="${(weather.high - 32) * .5556}"/>°C<br/>
				 <li><strong>LOW:</strong> <fmt:formatNumber type="number" maxFractionDigits="0" value="${(weather.low - 32) * .5556}"/>°C<br/><br/>
			
		</c:if>
		</ul>
<c:choose>
	<c:when test ="${weather.forecast == 'partly cloudy'}">
		<c:url var = "weatherImage" value = "/img/weather/partlyCloudy.png"/>
		<a><img id="weatherimage" src = "${weatherImage}"/></a><br/>
	</c:when>
	
	<c:otherwise>
		<c:url var="weatherImage" value="/img/weather/${weather.forecast}.png"/>	
			<a><img id="weatherimage" src="${weatherImage}"/></a><br/>
	</c:otherwise>
</c:choose>

	<div class = "bold">
	<c:choose>
		<c:when test="${weather.forecast == 'snow'}">Pack snowshoes.<br/></c:when>
		<c:when test="${weather.forecast == 'rain'}">Bring rain gear and waterproof shoes.<br/></c:when>
		<c:when test="${weather.forecast == 'thunderstorms'}">Seek shelter and avoid hiking on exposed ridges.<br/></c:when>
		<c:when test="${weather.forecast == 'sunny'}">Pack sunblock.<br/></c:when>
	</c:choose> 

	<c:if test="${tempUnit == 'F'}">
		<c:choose>
			<c:when test="${weather.high > 75}">Bring an extra gallon of water!</c:when>
			<c:when test="${weather.low < 20}">Beware of the dangers of exposure to frigid temperatures!</c:when>
			<c:when test="${weather.high - weather.low > 20}">Wear breathable layers!</c:when>
		</c:choose> 
	</c:if>
		
	<c:if test="${tempUnit == 'C'}">
		<c:choose>
			<c:when test="${weather.high > 23.8889}">Bring an extra gallon of water!</c:when>
			<c:when test="${weather.low < -6.66667}">Beware of the dangers of exposure to frigid temperatures!</c:when>
			<c:when test="${weather.high - weather.low > -6.66667}">Wear breathable layers!</c:when>
		</c:choose>	
	</c:if>
	</div>
</div>
</c:forEach>
</div>
</body>

<c:import url="/WEB-INF/jsp/common/footer.jsp"/>