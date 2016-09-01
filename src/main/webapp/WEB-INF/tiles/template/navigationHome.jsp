<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<ul>
	<li><a href="<spring:url value='/home'/>"><spring:message code="navi.home" text="Home" /></a></li>
	<li><a href="<spring:url value='/tender/all'/>"><spring:message code="navi.tenders" text="Tenders" /></a></li>
	
	<sec:authorize access="isAnonymous()">
		<li><a href="<spring:url value='/subscribe'/>"><spring:message code="navi.subscribe" text="Subscribe" /></a></li>
	</sec:authorize>
	
	<sec:authorize access="hasAnyRole('ROLE_ORGANIZATION', 'ROLE_EMPLOYEE', 'ROLE_ADMIN')">
		<li><a href="<spring:url value='/tender/new'/>"><spring:message code="navi.newTender" text="New Tender" /></a></li>
	</sec:authorize>

	<sec:authorize access="hasAnyRole('ROLE_ANONYMOUS', 'ROLE_ORGANIZATION', 'ROLE_MEMBER')">
		<li><a href="<spring:url value='/contact'/>"><spring:message code="navi.contactUs" text="Contact Us" /></a></li>
	</sec:authorize>
	
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<li><a href="<spring:url value='/member/all'/>"><spring:message code="navi.manageMember" text="Manage Member" /></a></li>
		<li><a href="<spring:url value='/category/all'/>"><spring:message code="navi.manageCategory" text="Manage Category" /></a></li>
	</sec:authorize>

	<sec:authorize access="isAuthenticated()">
		<li id="naviLogin">
			<a href="<spring:url value='/doLogout'/>">Logout</a>
		</li>
	</sec:authorize>

</ul>

