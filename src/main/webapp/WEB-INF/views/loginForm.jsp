<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<div id="rightDiv">
	<form action="<spring:url value='/doLogin' />" method="post">
		Email: <input name="username" type="text" /><br />
		Password:
		<input name="password" type="password" /><br />
		<input type="submit" value="Login" />
	</form>
</div>