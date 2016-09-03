<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<div id="rightDiv">
	<c:if test="${loginError eq true}">
		<h2 class="h2Error"><spring:message code="loginPage.errorInfo" text="Invalid username or password, please try again!" /></h2>
	</c:if>
	
	<h3><spring:message code="loginPage.already" text="Already have an account?" /></h3>
	<h3><spring:message code="loginPage.please" text="Please login" /></h3>

	<form action="<spring:url value='/doLogin' />" method="post">
		<p><spring:message code="loginPage.email" text="Email" />:</p>
		<p>
			<input name="username" type="text" placeholder="Account Email" />
		</p>
		<p><spring:message code="loginPage.password" text="Password" />:</p>
		<p>
			<input name="password" type="password" placeholder="Password" />
		</p>
		<p>
			<input type="submit" value="Login" />
		</p>
	</form>
	
	<h3><a href="<spring:url value='/member/register' />"><spring:message code="loginPage.create" text="Create your account now!" /></a></h3>
</div>