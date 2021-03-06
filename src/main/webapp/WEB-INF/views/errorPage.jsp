<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	response.setStatus(403);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
 "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>403 error</title>
</head>
<body>

	<center>

		<img
			src="<spring:url value="/resources/images/error_page.jpg"  htmlEscape="true" />"
			alt="Error page!" />

		<H2>${requestScope['javax.servlet.error.message']}</H2>
		<h3>Exception from: ${url}</h3>
		<h3>${exception.message}</h3>
		
		<c:if test="${maxSizeException eq true}">
			<h3>Your file size is ${requestSize} bytes!</h3>
		</c:if>
		

		<p>
			<button type=button onclick="window.location.href='<spring:url value="/" />'">Home</button>
		</p>

	</center>
</body>
</html>