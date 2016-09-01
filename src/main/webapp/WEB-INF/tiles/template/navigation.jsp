<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<ul>

	<li><a href="<spring:url value='/home'/>">Home</a></li>
	<li><a href="<spring:url value='/tender/all'/>">Tenders</a></li>
	
	<sec:authorize access="isAnonymous()">
		<li><a href="<spring:url value='/subscribe'/>">Subscribe</a></li>
	</sec:authorize>
	
	<sec:authorize access="hasAnyRole('ROLE_ORGANIZATION', 'ROLE_EMPLOYEE', 'ROLE_ADMIN')">
		<li><a href="<spring:url value='/tender/new'/>">New Tender</a></li>
	</sec:authorize>

	<sec:authorize access="hasAnyRole('ROLE_ANONYMOUS', 'ROLE_ORGANIZATION', 'ROLE_MEMBER')">
		<li><a href="<spring:url value='/contact'/>">Contact Us</a></li>
	</sec:authorize>
	
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<li><a href="<spring:url value='/member/all'/>">Manage Member</a></li>
		<li><a href="<spring:url value='/category/all'/>">Manage Category</a></li>
	</sec:authorize>

	<li id="naviLogin">
		<sec:authorize access="isAnonymous()">
			<a href="<spring:url value='/loginPage'/>">Login</a>
		</sec:authorize>
		<sec:authorize access="isAuthenticated()">
			<a href="<spring:url value='/doLogout'/>">Logout</a>
		</sec:authorize>
	</li>
</ul>

