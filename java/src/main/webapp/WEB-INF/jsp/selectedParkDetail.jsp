<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>


<c:import url="/WEB-INF/jsp/common/header.jsp" />    

<c:url var="parkImage" value="/img/parks/${fn:toLowerCase(park.parkCode)}.jpg"/>
<a><img src="${parkImage}"/></a>

<div>

<p>${park.parkName}<br/>
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

<input class="formSubmitButton" type="submit" value="See Forecast"/>
</form>

