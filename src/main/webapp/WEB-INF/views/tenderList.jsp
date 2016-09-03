<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


	<div id="centerDiv">
		<div id="tenderListDiv">
			<c:if test="${empty tenders}">
				<h3>There is no tender in this category</h3>
				<h3>Or no tender found with current searching key word</h3>
				<h4>(Notice: EXPIRED tenders are not shown when you list ALL tenders!)</h4>
			</c:if>
			
			<c:forEach items="${tenders}" var="tender">
						<div class="caption">
							<h3>${tender.refId}</h3>
							<div class="padding5pxDiv">
								<a href=" <spring:url value="/tender/detail/${tender.id}"/>">${tender.title}</a>
							</div>
							
							
							<div class="padding5pxDiv">
							Category: 
								<c:forEach items="${tender.categoryList}" var="category">
									${category.name};
								</c:forEach>
							</div>							
							<div class="padding5pxDiv deadlineDiv">DeadLine: ${tender.deadline}</div>
							<div class="textAlignRightDiv"><div>Posted: ${tender.postDate}</div></div>	
						</div>
						<hr>
			</c:forEach>
		</div>
	</div>
