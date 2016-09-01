<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>



						<div id="centerDiv">
							<h3>REF-ID: ${tender.refId}</h3>
							<p>Title: ${tender.title}</p>
							
							<p>Category: <c:forEach items="${tender.categoryList}" var="category">
							             $(category.name);
							             </c:forEach>
							</p>							
							<p>Posted: ${tender.postDate}</p>
							<p>DeadLine: ${tender.deadline}</p>	
							
							
							
							<p>Description: ${tender.description}</p>
							Address:<br />
							
							<p>Street:${tender.address.streetName}</p>
							<p>No:${tender.address.apartmentNumber}</p>
							<p>City:${tender.address.city}</p>
							<p>State:${tender.address.state}</p>
							<p>Country:${tender.address.country}</p>
							<p>Phone: (${tender.phone.area}) ${tender.phone.prefix}-${tender.phone.number}</p>
							
							<p>Agency: ${tender.agency}</p>
							<p>Contact Person: ${tender.contactPerson}</p>
							<p>Contact Email: ${tender.contactEmail}</p>
							
							<p>Attachment: 
							<a href="<spring:url value='/resources/images/attached/${tender.attachmentFileName}'/>">
								${tender.attachmentFileName}
							</a>
							</p>	
							
						</div>
