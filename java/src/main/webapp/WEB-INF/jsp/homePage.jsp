<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />


<h1 id="welcome">WELCOME TO THE NATIONAL PARKS!</h1>
<div id="card-page">
<div id="grid">
	<c:forEach var="park" items="${allParks}">
  		<div class="tile">
			<c:url var="parkImage" value="/img/parks/${fn:toLowerCase(park.parkCode)}.jpg"/>
			<c:url var="parkDetailPath" value="/parkDetail">
				<c:param name="parkCode" value="${park.parkCode}"/>
			</c:url>
			
		<a class="parkimage" href="${parkDetailPath}">
			<img src="${parkImage}" alt="NationalParks"/>
		</a>
		<div class="details">
			<p class="name">${park.parkName} is located in ${park.state}.</p>
			<p>${park.parkDescription}</p>
			</div>
		</div>
	</c:forEach>
</div>
</div>

<c:import url="/WEB-INF/jsp/common/footer.jsp"/>
