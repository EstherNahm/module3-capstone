<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />
    
<c:forEach var="park" items="${park.getParks()}">
	<tr>
	
		<c:url var="parkImage" value="/img/parks/${park.parkCode}.jpg"/>
		<c:url var="parkDetailPath" value="/parkDetail">
		<c:param name="parkId" value="${park.parkCode}"/></c:url>
		<td><a href="${parkDetailPath}"><img src="${parkImage}"/></a><td>

			<td>${park.parkName}</td>
			<td>${park.state}</td>
			<td>${park.parkDescription}</td>
			
	</tr>		
</c:forEach>


<<%-- section id="nationalParks" class="parks">
	<h1>The Parks</h1> 
	<section class="parks">
		<h2>Cuyahoga Valley National Park</h2>
		<c:url var="cvnpImgSrc" value="/img/parks/cvnp.jpg" /> 
		<c:url var = "parkDetailPath" value="/parkDetail" >
		<c:param name="parkCode" value="${park.parkCode }"/>
		</c:url>
		<a href="${parkDetailPath}"> <img src="${cvnpImgSrc }" alt="Cuyahoga Valley National Park"/></a>
		<p>Located in Ohio!</p>
		<p>Though a short distance from the urban areas of Cleveland and Akron, Cuyahoga Valley National Park seems worlds away. The park is a refuge for native plants and wildlife, and provides routes of discovery for visitors. The winding Cuyahoga River gives way to deep forests, rolling hills, and open farmlands. Walk or ride the Towpath Trail to follow the historic route of the Ohio & Erie Canal</p>
	</section>
		
	<section class="parks">
		<h2>Everglades National Park</h2>
		<c:url var="enpImgSrc" value="/img/parks/enp.jpg" />
		<c:url var = "parkDetailPath" value="/parkDetail" >
		<c:param name="parkCode" value="${park.parkCode }"></c:param>
		</c:url>
		<a href="${parkDetailPath}"> <img src="${enpImgSrc }" alt="Everglades National Park"></a>
		 
		<p>Located in Florida!</p>
		<p>The Florida Everglades, located in southern Florida, is one of the largest wetlands in the world. Several hundred years ago, this wetlands was a major part of a 5,184,000 acre watershed that covered almost a third of the entire state of Florida. The Everglades consist of a shallow sheet of fresh water that rolls slowly over the lowlands and through billions of blades of sawgrass. As water moves through the Everglades, it causes the sawgrass to ripple like green waves; this is why the Everglades received the nickname "River of Grass."</p>
	</section>
	
	<section class="parks">
		<h2>Grand Canyon National Park</h2>
		<c:url var="gcnpImgSrc" value="/img/parks/gcnp.jpg" />
		<c:url var = "parkDetailPath" value="/parkDetail" >
		<c:param name="parkCode" value="${park.parkCode }"></c:param>
		</c:url>
		<a href="${parkDetailPath}"> <img src="${gcnpImgSrc }" alt="Grand Canyon National Park"></a>
		<p>Located in Arizona!</p>
		<p>If there is any place on Earth that puts into perspective the grandiosity of Mother Nature, it is the Grand Canyon. The natural wonder, located in northern Arizona, is a window into the regio's geological and Native American past. As one of the country's first national parks, the Grand Canyon has long been considered a U.S. treasure, and continues to inspire scientific study and puzzlement.</p>
	</section>
	
	<section class="parks">
		<h2>Glacier National Park</h2>
		<c:url var="gnpImgSrc" value="/img/parks/gnp.jpg" />
		<c:url var = "parkDetailPath" value="/parkDetail" >
		<c:param name="parkCode" value="${park.parkCode }"></c:param>
		</c:url>
		<a href="${parkDetailPath}"> <img src="${gnpImgSrc }" alt="Glacier National Park"></a>
		<p>Located in Montana!</p>
		<p>Glacier might very well be the most beautiful of America's national parks. John Muir called it "the best care-killing scenery on the continent." The mountains are steep, snowcapped, and punctuated by stunning mountain lakes and creeks. Much of the land remains wild and pristine, a result of its remote location and the lack of visitation in the 19th century.  </p>
	</section>
	
	
	<section class="parks">
		<h2>Great Smoky Mountains National Park</h2>
		<c:url var="gsmnpImgSrc" value="/img/parks/gsmnp.jpg" />
		<c:url var = "parkDetailPath" value="/parkDetail" >
		<c:param name="parkCode" value="${park.parkCode }"></c:param>
		</c:url>
		<a href="${parkDetailPath}"> <img src="${gsmnpImgSrc }" alt="Great Smoky Mountains National Park"></a>
		<p>Located in Tennessee!</p>
		<p>The Great Smoky Mountains are a mountain range rising along the Tennessee–North Carolina border in the southeastern United States. They are a subrange of the Appalachian Mountains, and form part of the Blue Ridge Physiographic Province. The range is sometimes called the Smoky Mountains and the name is commonly shortened to the Smokies. The Great Smokies are best known as the home of the Great Smoky Mountains National Park, which protects most of the range. The park was established in 1934, and, with over 9 million visits per year, it is the most-visited national park in the United States</p>
	</section>
	
	
	<section class="parks">
		<h2>Grand Teton National Park</h2>
		<c:url var="gtnpImgSrc" value="/img/parks/gtnp.jpg" />
		<c:url var = "parkDetailPath" value="/parkDetail" >
		<c:param name="parkCode" value="${park.parkCode }"></c:param>
		</c:url>
		<a href="${parkDetailPath}"> <img src="${gtnpImgSrc }" alt="Grand Teton National Park"></a>
		<p>Located in Wyoming!</p>
		<p>The peaks of the Teton Range, regal and imposing as they stand nearly 7,000 feet above the valley floor, make one of the boldest geologic statements in the Rockies. Unencumbered by foothills, they rise through steep coniferous forest into alpine meadows strewn with wildflowers, past blue and white glaciers to naked granite pinnacles. The Grand, Middle, and South Tetons form the heart of the range. But their neighbors, especially Mount Owen, Teewinot Mountain, and Mount Moran, are no less spectacular.</p>
	</section>
	
	
	<section class="parks">
		<h2>Mount Rainier National Park</h2>
		<c:url var="mrnpImgSrc" value="/img/parks/mrnp.jpg" />
		<c:url var = "parkDetailPath" value="/parkDetail" >
		<c:param name="parkCode" value="${park.parkCode }"></c:param>
		</c:url>
		<a href="${parkDetailPath}"> <img src="${mrnpImgSrc }" alt="Mount Rainier National Park"></a>
		<p>Located in Washington!</p>
		<p>Mt. Rainier National Park is one of three national parks in the state of Washington and is one of America's oldest parks, being one of only five founded in the 19th century. The park was created to preserve one of America's most spectacular scenic wonders, the snow-capped volcano known as Tahcoma to Indians in ages past and as Mt. Rainier now. While the mountain is unquestionably the centerpiece of the park, its 235,612 acres (378 square miles) also contain mountain ranges, elaborate glaciers, rivers, deep forests, lush meadows covered with wildflowers during the summer, and over 300 miles of trails. 96% of the park is classified as wilderness.</p>
	</section>
	
	<section class="parks">
		<h2>Rocky Mountain National Park</h2>
		<c:url var="rmnpImgSrc" value="/img/parks/gnp.jpg" />
		<c:url var = "parkDetailPath" value="/parkDetail" >
		<c:param name="parkCode" value="${park.parkCode }"></c:param>
		</c:url>
		<a href="${parkDetailPath}"> <img src="${rmnpImgSrc }" alt="Rocky Mountain National Park"></a>
		<p>Located in Colorado!</p>
		<p>Rocky Mountain National Park is one of the highest national parks in the nation, with elevations from 7,860 feet to 14,259 feet. Sixty mountain peaks over 12,000 feet high result in world-renowned scenery. The Continental Divide runs north - south through the park, and marks a climatic division. Ancient glaciers carved the topography into an amazing range of ecological zones. What you see within short distances at Rocky is similar to the wider landscape changes seen on a drive from Denver to northern Alaska.</p>
	</section>
	
	<section class="parks">
		<h2>Yellowstone National Park</h2>
		<c:url var="ynpImgSrc" value="/img/parks/ynp.jpg" />
		<c:url var = "parkDetailPath" value="/parkDetail" >
		<c:param name="parkCode" value="${park.parkCode }"></c:param>
		</c:url>
		<a href="${parkDetailPath}"> <img src="${ynpImgSrc }" alt="Yellowstone National Park"></a>
		<p>Located in Wyoming!</p>
		<p>Yellowstone National Park is a protected area showcasing significant geological phenomena and processes. It is also a unique manifestation of geothermal forces, natural beauty, and wild ecosystems where rare and endangered species thrive. As the site of one of the few remaining intact large ecosystems in the northern temperate zone of earth, Yellowstone’s ecological communities provide unparalleled opportunities for conservation, study, and enjoyment of large-scale wildland ecosystem processes.</p>
	</section>
	
	<section class="parks">
		<h2>Yosemite National Park</h2>
		<c:url var="ynp2ImgSrc" value="/img/parks/ynp2.jpg" />
		<c:url var = "parkDetailPath" value="/parkDetail" >
		<c:param name="parkCode" value="${park.parkCode }"></c:param>
		</c:url>
		<a href="${parkDetailPath}"> <img src="${ynp2ImgSrc }" alt="Yosemite National Park"></a>
		<p>Located in California!</p>
		<p>Yosemite National Park vividly illustrates the effects of glacial erosion of granitic bedrock, creating geologic features that are unique in the world. Repeated glaciations over millions of years have resulted in a concentration of distinctive landscape features, including soaring cliffs, domes, and free-falling waterfalls. There is exceptional glaciated topography, including the spectacular Yosemite Valley, a 914-meter (1/2 mile) deep, glacier-carved cleft with massive sheer granite walls. These geologic features provide a scenic backdrop for mountain meadows and giant sequoia groves, resulting in a diverse landscape of exceptional natural and scenic beauty.</p>
	</section>
	 --%>
	
	
</section>






