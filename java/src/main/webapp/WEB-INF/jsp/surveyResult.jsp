<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:forEach var="park" items="${parks}">

<c:url var="parkImage" value="/img/parks/${fn:toLowerCase(park.parkCode)}.jpg"/>
		<a><img src="${parkImage}"/></a>

<p>${park.parkName}</p>
<p>${park.state}</p>
<p>${park.parkDescription}</p>

</c:forEach>


</body>
</html>