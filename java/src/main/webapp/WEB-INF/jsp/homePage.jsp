<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<link rel="stylesheet" href="css/nationalPark.css"></link>
<c:import url="/WEB-INF/jsp/common/header.jsp" />
<div class="column" id="ourcolumn">   
<c:forEach var="park" items="${allParks}">

		<c:url var="parkImage" value="/img/parks/${fn:toLowerCase(park.parkCode)}.jpg"/>
		<c:url var="parkDetailPath" value="/parkDetail">
		<c:param name="parkCode" value="${park.parkCode}"/></c:url>
		<a href="${parkDetailPath}"><img src="${parkImage}"/></a> 

			<p>${park.parkName}</p>
			<p>${park.state}</p>
			<p>${park.parkDescription}</p>
		</div>
			
</c:forEach>

