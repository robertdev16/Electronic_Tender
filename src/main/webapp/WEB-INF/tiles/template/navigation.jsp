<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<ul>
	<li><a href="<spring:url value='/home'/>">Home</a></li>
	<li><a href="<spring:url value='/tenders'/>">Tenders</a></li>
	<li><a href="<spring:url value='/subscribe'/>">Subscribe</a></li>
	<li><a href="<spring:url value='/contact'/>">Contact Us</a></li>
	<li id="naviLogin">
		<sec:authorize access="isAnonymous()">
			<a href="<spring:url value='/loginPage'/>">Login</a>
		</sec:authorize>
		<sec:authorize access="isAuthenticated()">
			<a href="<spring:url value='/logoutRequest'/>">Logout</a>
		</sec:authorize>
	</li>
</ul>

