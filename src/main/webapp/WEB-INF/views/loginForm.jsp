<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<div id="rightDiv">
	<c:if test="${loginError eq true}">
		<h3>Invalid username or password, please try again!</h3>
	</c:if>

	<form action="<spring:url value='/doLogin' />" method="post">
		<p>Email:</p>
		<p>
			<input name="username" type="text" />
		</p>
		<p>Password:</p>
		<p>
			<input name="password" type="password" />
		</p>
		<p>
			<input type="submit" value="Login" />
		</p>
	</form>
</div>