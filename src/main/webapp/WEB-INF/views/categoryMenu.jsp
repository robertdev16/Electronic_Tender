<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<div id="leftDiv">

	<h2 class="h2Info">Business Area</h2>

	<c:forEach items="${categories}" var="category">
		<c:choose>
			<c:when test="${category.id eq selectedCategoryId}">
				<div class="categoryDivSelected"
					onclick="window.location.href='<spring:url value="/tender/byCategory/${category.id}" />'">
					${category.name}</div>
			</c:when>
			<c:otherwise>
				<div class="categoryDiv"
					onclick="window.location.href='<spring:url value="/tender/byCategory/${category.id}" />'">
					${category.name}</div>
			</c:otherwise>
		</c:choose>
	</c:forEach>

	<h2 class="h2Info">Search Title</h2>
	<div id="searchArea">
	<form action="<spring:url value='/tender/search' />" method="post">
		<div class="padding5pxDiv">
			<input id="searchInput" type="search" name="keyword" placeholder="Input keyword..." 
				value="${lastSearchKeyword}" />
		</div>
		<div class="padding5pxDiv"><input type="submit" value="Search" /></div>
	</form>
	</div>
</div>
