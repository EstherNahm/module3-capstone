<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="surveyresults">
		<h1 id="resultstitle">YOUR FAVORITE PARKS:</h1>
		
		<div class="favoritepark">
		
		
			<c:forEach var="favoritepark" items="${favoriteParks}" varStatus="s">
					
					
					
		
					
						<div class="grid2">
						<c:url var="parkImage" 
							value="/img/parks/${fn:toLowerCase(favoritepark.park.parkCode)}.jpg" />
							
							<c:url var="parkDetailPath" value="/parkDetail">
				<c:param name="parkCode" value="${favoritepark.park.parkCode}"/>
			</c:url>
							
						<a href="${parkDetailPath}"><img src="${parkImage}" class ="parkrank" /></a>
			
						
						<div class="flex">
						<h1 class="parkrank">#<c:out value="${s.count}"/>
						${favoritepark.park.parkName}</h1><br/>
						<p class ="parkrank">
				
						<strong>TOTAL VOTES: ${favoritepark.surveyCount}</strong><br/>
						<br/> <br/>${favoritepark.park.parkDescription}</p>
				</div>
				</div>		
						
				
			</c:forEach>
		</div>
		</div>
	
</body>
</html>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />