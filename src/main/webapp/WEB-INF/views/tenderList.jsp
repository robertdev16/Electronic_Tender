<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


		<div id="centerDiv">
			<c:forEach items="${tenders}" var="tender">
						<div class="caption">
							<h3>${tender.refId}</h3>
							<a href=" <spring:url value="/tender/detail/${tender.id}"/>">${tender.title}</a>
							
							<p>Category: <c:forEach items="${tender.categoryList}" var="category">
							             $(category.name);
							             </c:forEach>
							</p>							
							<p>Posted: ${tender.postDate}</p>
							<p>DeadLine: ${tender.deadline}</p>	
						</div>
						<hr>
			</c:forEach>
		</div>
