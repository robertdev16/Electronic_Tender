<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<div id="headerCellLeft">
	<span id="headerCellSpan01"><spring:message code="header.welcome" text="Welcome to Electronic Tender" /> &nbsp;&nbsp;&nbsp;&nbsp;</span>
	<span id="headerCellSpan02"><spring:message code="header.slogan" text="Don't hold information back!" /></span>
</div>

<div id="headerCellRight">
		<span id="viewProfileSpan">
		<sec:authorize access="hasAnyRole('ROLE_MEMBER', 'ROLE_ORGANIZATION')">
			<sec:authentication property="principal" var="authentication" />
			<spring:message code="header.view" text="View your profile" />: 
			<a href="<spring:url value='/member/detail' />">
				${authentication.username}
			</a>
		</sec:authorize>
		<sec:authorize access="hasAnyRole('ROLE_EMPLOYEE', 'ROLE_ADMIN')">
			<sec:authentication property="principal" var="authentication" />
			<spring:message code="header.account" text="Username" />: ${authentication.username}
		</sec:authorize>		
		</span>
</div>