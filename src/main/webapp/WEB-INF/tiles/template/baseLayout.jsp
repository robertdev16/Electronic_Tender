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

<link href="<spring:url value='/resources/css/main.css' />" type="text/css" rel="stylesheet" />

</head>

<body>
	<div id="main">
		<div id="topBanner">
			<div id="logoImg">
				<h1>Electronic Tender</h1>
			</div>
			<div id="navi">
				<ul>
					<tiles:insertAttribute name="navigation" />
				</ul>
			</div>
		</div>

		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>

		<div id="leftDiv">
			<tiles:insertAttribute name="left" />
		</div>

		<div id="centerDiv">
			<tiles:insertAttribute name="center" />
		</div>

		<div id="rightDiv">
			<tiles:insertAttribute name="right" />
		</div>

		<div id="footer">
			<tiles:insertAttribute name="footer" />
		</div>

	</div>
</body>
</html>
