<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<div id="headerCellLeft">
	<span id="headerCellSpan01">Welcome to Electronic Tender &nbsp;&nbsp;&nbsp;&nbsp;</span>
	<sapn id="headerCellSpan02">Don't hold information back!</sapn>
</div>

<div id="headerCellRight">
	<sec:authorize access="hasAnyRole('ROLE_MEMBER', 'ROLE_ORGANIZATION')">
		<sec:authentication property="principal" var="authentication" />
		<span id="viewProfileSpan">
			View your profile: 
			<a href="<spring:url value='/member/profile' />">
				${authentication.username}
			</a>
		</span>
	</sec:authorize>
</div>