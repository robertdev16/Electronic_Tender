<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Tenders</title>
</head>
<body>
 	<section class="container">  
                       
		<div class="row">
			<c:forEach items="${tenders}" var="tender">
						<div class="caption">
							<h3>${tender.refId}</h3>
							<a href=" <spring:url value="/tenders/tender?id=${tender.id}"/>">${tender.title}</a>
							
							<p>Category: <c:forEach items="${catagories}" var="catagory">
							             $(catagory.name);
							             </c:forEach>
							</p>							
							<p>Posted: ${tender.postDate}</p>
							<p>DeadLine: ${tender.deadline}</p>	
							
							
							
							<p>${tender.description}</p>
							Address:
							
							<p>Street:${tender.address.streetName}</p>
							<p>No:${tender.address.apartmentNumber}</p>
							<p>City:${tender.address.city}</p>
							<p>State:${tender.address.state}</p>
							<p>Country:${tender.address.country}</p>
								
							
							<p>Agency: ${tender.agency}</p>	
							<p>File: ${attachmentFileName.agency}</p>	
							<!--<input type="button" value="Details" onclick="tenderDetail(${tender.id})">-->			
							
						</div>
			</c:forEach>
		</div>
	</section>
</body>
</html>
