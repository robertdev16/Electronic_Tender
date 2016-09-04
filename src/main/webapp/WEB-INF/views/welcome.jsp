<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

	<div id="centerDiv">
		<div>
			<h2><spring:message code="welcomePage.businessArea" text="Business Area" /></h2>
			<hr>

			<c:forEach items="${categories}" var="category">
				<div class="welCategory">
					<a href="<spring:url value='/tender/byCategory/${category.id}' />">
						${category.name} </a>
				</div>
			</c:forEach>

			<h2><spring:message code="welcomePage.latestTenders" text="Latest Tenders" /></h2>
			<hr>
			<ul>
				<c:forEach items="${latest5Tenders}" var="tender">
					<li class="welTenderLi">
						<a href="<spring:url value='/tender/detail/${tender.id}' />">
							${tender.title} </a><br />
						Posted: ${tender.postDate}<br />
						Deadline: ${tender.deadline}
					</li>
				</c:forEach>
			</ul>
			<div class="buttonLikeDiv"
				onclick="window.location.href='<spring:url value="/tender/all" />'">
				<spring:message code="welcomePage.moreTenders" text="More tenders..." />
			</div>
		</div>
	</div>
</body>
</html>
