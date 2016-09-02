<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<div id="leftDiv">


	<h2 class="h2Info">Business Area</h2>

	<c:forEach items="${categories}" var="category">
	<div>
		<a href="<spring:url value='/tender/byCategory/${category.id}' />">
			${category.name}
		</a>
	</div>
	</c:forEach>
	
	
	<h2 class="h2Info">Search Title</h2>

</div>
