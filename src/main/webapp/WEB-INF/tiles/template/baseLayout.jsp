<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title><tiles:insertAttribute name="title" /></title>

<link href="<spring:url value='/resources/css/main.css' />"
	type="text/css" rel="stylesheet" />

</head>

<body>
	<div id="mainDiv">
		<div id="topBanner">
			<div id="logoImg">
				<img src="<spring:url value='/resources/images/mainlogo.png' />" width="210" alt="Main Logo Image"/>
			</div>
			<div id="naviDiv">
				<tiles:insertAttribute name="navigation" />
			</div>
		</div>

		<div id="headerDiv">
			<tiles:insertAttribute name="header" />
		</div>

		<div id="contentDiv">
			<tiles:insertAttribute name="left" />
			
			<tiles:insertAttribute name="center" />

			<tiles:insertAttribute name="right" />
		</div>

		<div id="footerDiv">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
</body>
</html>
