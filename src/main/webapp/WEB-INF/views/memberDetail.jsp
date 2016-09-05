<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>


<div id="centerDiv">
	<div>
		<div class="blueInfo">Account Email (username): ${member.user.username}</div>
		<sec:authorize access="hasAnyRole('ROLE_ORGANIZATION', 'ROLE_MEMBER')">
			<spring:url value="/member/selfedit" var="editUrl" />
			<div class="buttonLikeDiv"
				onclick="window.location.href='${editUrl}'">
				Edit Account Profile or Upload License...
			</div>
		</sec:authorize>
		<hr />

		<div class="inlineList">
			First Name: ${member.user.firstName}
		</div>
		<div class="inlineList">
			Last Name: ${member.user.lastName}
		</div>
		<div class="inlineList">
			Phone: (${member.user.phone.area})
			${member.user.phone.prefix}-${member.user.phone.number}
		</div>

		<h4>Address Info:</h4>

		<blockquote>
			<div class="padding5pxDiv">Street:
				${member.user.address.streetName}
				${member.user.address.apartmentNumber}</div>
			<div class="padding5pxDiv">City: ${member.user.address.city}</div>
			<div class="padding5pxDiv">State: ${member.user.address.state}
			</div>
			<div class="padding5pxDiv">Zip Code:
				${member.user.address.zipCode}</div>
			<div class="padding5pxDiv">Country:
				${member.user.address.country}</div>
		</blockquote>

		<h4>Categories you have subscribed:</h4>

		<c:forEach items="${member.selectedCategories}" var="category">
			<div class="inlineList">
				<input type="checkbox" checked="checked" onclick="return false;">${category.name}
			</div>
		</c:forEach>

		<c:if test="${not empty member.licenseFileName}">
			<h4>Submitted License File:</h4>
			<div class="padding5pxDiv">
				License File:
				<a href="<spring:url value='${licensePath}${member.licenseFileName}'/>">
					${member.licenseFileName}
				</a>
			</div>
			<div class="padding5pxDiv">Organization Name: ${member.organizationName}</div>

			<sec:authorize access="hasAnyRole('ROLE_ORGANIZATION', 'ROLE_MEMBER')">
			<c:choose>
				<c:when test="${hasCertified eq true}">
					<div class="blueInfo">Your license file passed verification, you can post new tender now!</div>
				</c:when>
				<c:otherwise>
					<div class="blueInfo">You have submitted your license file, please wait for verification...</div>
				</c:otherwise>
			</c:choose>
			</sec:authorize>
			
			<sec:authorize access="hasRole('ROLE_ADMIN')">
			<c:choose>
				<c:when test="${hasCertified eq true}">
					<div class="blueInfo">This Member has been Granted ROLE_ORGANIZATION!</div>
				</c:when>
				<c:otherwise>
					<spring:url value="/member/grant/{memberId}" var="grantUrl" >
   						<spring:param name="memberId" value="${member.id}" />
 					</spring:url>
 					<form action="${grantUrl}" method="post">
 					<div class="padding5pxDiv">
 						<input type="submit" value="Grant ROLE_ORGANIZATION to This Member..." />
 					</div>
 					</form>
				</c:otherwise>
			</c:choose>
			</sec:authorize>
		</c:if>
		
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<form action="<spring:url value='/member/all' />" method="get">
 					<div class="padding5pxDiv">
 						<input type="submit" value="Back to Member List" />
 					</div>
 			</form>
 		</sec:authorize>
	</div>
</div>