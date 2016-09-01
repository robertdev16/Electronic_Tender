<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<div id="headerCellLeft">
	<span id="headerCellSpan01"><spring:message code="header.welcome" text="Welcome to Electronic Tender" /> &nbsp;&nbsp;&nbsp;&nbsp;</span>
	<sapn id="headerCellSpan02"><spring:message code="header.slogan" text="Don't hold information back!" /></sapn>
</div>

<div id="headerCellRight">
	<sec:authorize access="hasAnyRole('ROLE_MEMBER', 'ROLE_ORGANIZATION')">
		<sec:authentication property="principal" var="authentication" />
		<spring:url value='/member/detail/{accountName}' var="memberUrl" >
   			<spring:param name="accountName" value="${authentication.username}" />
 		</spring:url>
		<span id="viewProfileSpan">
			<spring:message code="header.view" text="View your profile" />: 
			<a href="${memberUrl}">
				${authentication.username}
			</a>
		</span>
	</sec:authorize>
</div>