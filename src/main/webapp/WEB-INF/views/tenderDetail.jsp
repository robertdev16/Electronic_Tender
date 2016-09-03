<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>



						<div id="centerDiv">
							<c:if test="${successNew eq true}">
								<h2 class="h2Info">Great! You have posted a new tender:</h2>
								<hr />
							</c:if>
							
							<h3>REF-ID: ${tender.refId}</h3>
							<p>Title: ${tender.title}</p>
							
							<p>Category: <c:forEach items="${tender.categoryList}" var="category">
							             ${category.name};
							             </c:forEach>
							</p>							
							<p>Posted: ${tender.postDate}</p>
							<p>DeadLine: ${tender.deadline}</p>	
							
							
							
							<p>Description: ${tender.description}</p>
							Address:<br />
							<blockquote>
							<p>Street:${tender.address.streetName}</p>
							<p>Apartment No:${tender.address.apartmentNumber}</p>
							<p>City:${tender.address.city}</p>
							<p>State:${tender.address.state}</p>
							<p>Country:${tender.address.country}</p>
							</blockquote>
							<p>Phone: (${tender.phone.area}) ${tender.phone.prefix}-${tender.phone.number}</p>
							
							<p>Agency: ${tender.agency}</p>
							<p>Contact Person: ${tender.contactPerson}</p>
							<p>Contact Email: ${tender.contactEmail}</p>
							
							<c:if test="${not empty tender.attachmentFileName}">
								<p>Attachment: 
								<a href="<spring:url value='/resources/images/attached/${tender.attachmentFileName}'/>">
								${tender.attachmentFileName}
								</a>
								</p>
							</c:if>
						</div>
