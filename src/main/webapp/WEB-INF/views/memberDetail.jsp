<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<div id="centerDiv">
	<div>
		<h2>Account Email (username): ${member.user.username}</h2>
		<hr />

		<div class="padding5pxDiv">
			First Name: ${member.user.firstName}
		</div>

		<div class="padding5pxDiv">
			Last Name: ${member.user.lastName}
		</div>
		
		<div class="padding5pxDiv">
			Phone: (${member.user.phone.area}) ${member.user.phone.prefix}-${member.user.phone.number}
		</div>
		
		<h4>Address Info:</h4>
		
		<blockquote>
			<div class="padding5pxDiv">
				Street: ${member.user.address.streetName} ${member.user.address.apartmentNumber}
			</div>
			<div class="padding5pxDiv">
				City: ${member.user.address.city}
			</div>
			<div class="padding5pxDiv">
				State: ${member.user.address.state}
			</div>
			<div class="padding5pxDiv">
				Zip Code: ${member.user.address.zipCode}
			</div>
			<div class="padding5pxDiv">
				Country: ${member.user.address.country}
			</div>
		</blockquote>
		
		<h4>Categories you have subscribed:</h4>
		
		<c:forEach items="${member.selectedCategories}" var="category">
			<div class="padding5pxDiv">
				<input type="checkbox" checked="checked" onclick="return false;">${category.name}
			</div>
		</c:forEach>

	</div>
</div>