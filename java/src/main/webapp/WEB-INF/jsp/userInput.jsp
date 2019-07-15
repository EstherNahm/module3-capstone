<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/common/header.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

	<div class="userinput">

		<div class="surveyforms">
			<h3 class="surveytitle">Vote for your favorite park!</h3>

			<div class="surveypage">
				<c:url var="formAction" value="/userInput" />
				<form method="POST" action="${formAction}">

					<a id="surveyfont">Home state:</a> <select name="state"
						class="customtable">
						<option value="Alabama">Alabama</option>
						<option value="Alaska">Alaska</option>
						<option value="Arizona">Arizona</option>
						<option value="Arkansas">Arkansas</option>
						<option value="California">California</option>
						<option value="Colorado">Colorado</option>
						<option value="Connecticut">Connecticut</option>
						<option value="Delaware">Delaware</option>
						<option value="Florida">Florida</option>
						<option value="Georgia">Georgia</option>
						<option value="Hawaii">Hawaii</option>
						<option value="Idaho">Idaho</option>
						<option value="Illinois">Illinois</option>
						<option value="Indiana">Indiana</option>
						<option value="Iowa">Iowa</option>
						<option value="Kansas">Kansas</option>
						<option value="Kentucky">Kentucky</option>
						<option value="Louisiana">Louisiana</option>
						<option value="Maine">Maine</option>
						<option value="Maryland">Maryland</option>
						<option value="Massachusetts">Massachusetts</option>
						<option value="Michigan">Michigan</option>
						<option value="Minnesota">Minnesota</option>
						<option value="Mississippi">Mississippi</option>
						<option value="Missouri">Missouri</option>
						<option value="Montana">Montana</option>
						<option value="Nebraska">Nebraska</option>
						<option value="Nevada">Nevada</option>
						<option value="New Hampshire">New Hampshire</option>
						<option value="New Jersey">New Jersey</option>
						<option value="New Mexico">New Mexico</option>
						<option value="New York">New York</option>
						<option value="North Carolina">North Carolina</option>
						<option value="North Dakota">North Dakota</option>
						<option value="Ohio">Ohio</option>
						<option value="Oklahoma">Oklahoma</option>
						<option value="Oregon">Oregon</option>
						<option value="Pennsylvania">Pennsylvania</option>
						<option value="Rhode Island">Rhode Island</option>
						<option value="South Carolina">South Carolina</option>
						<option value="South Dakota">South Dakota</option>
						<option value="Tennessee">Tennessee</option>
						<option value="Texas">Texas</option>
						<option value="Utah">Utah</option>
						<option value="Vermont">Vermont</option>
						<option value="Virginia">Virginia</option>
						<option value="Washington">Washington</option>
						<option value="West Virginia">West Virginia</option>
						<option value="Wisconsin">Wisconsin</option>
						<option value="Wyoming">Wyoming</option>
					</select> <br /> <a id="surveyfont">Activity level:</a> <select
						name="activityLevel" class="customtable">
						<option value="inactive">Inactive</option>
						<option value="sedentary">Sedentary</option>
						<option value="active">Active</option>
						<option value="extremelyactive">Extremely active</option>
					</select> <br /> <a id="surveyfont">Favorite park:</a> <select
						name="parkCode" class="customtable">
						<c:forEach var="park" items="${allParks}">
							<option value="${park.parkCode}">${park.parkName}</option>
						</c:forEach>
					</select>


					<div class="emailbox">
						<label for="inp" class="inp"> <input class="email"
							type="text" id="inp" name="emailAddress"> <span
							class="label">E-mail address:</span> <span class="border"></span>
						</label>
					</div>
					<br /> <br />

					<div class="surveybutton">
						<a><input id="surveysubmit" class="button" type="submit"
							value="Submit" /></a>
					</div>
				</form>


				<div class="logo">
					<c:url var="logo" value="img/logo.png" />
					<a> <img src="${logo}" alt="logo" />
					</a>
					<div class="edwardquote">
						<h4>
							<a id="edwardquote"
								href="https://en.wikipedia.org/wiki/Edward_Abbey">And may
								your mountains rise into and above the clouds. -Edward Abbey</a>
						</h4>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>


<c:import url="/WEB-INF/jsp/common/footer.jsp" />