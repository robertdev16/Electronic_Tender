<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>


<div id="centerDiv">
	<h2 class="h2Info">Edit Member Profile, Select Category, or Upload License File</h2>

	<fieldset>
		<legend>Account Email: ${editMember.user.username}</legend>

	<sec:authorize access="hasAnyRole('ROLE_ORGANIZATION', 'ROLE_MEMBER')">
		<spring:url value="/member/new" var="postUrl" />
	</sec:authorize>
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<spring:url value="/member/update" var="postUrl" />
	</sec:authorize>
	
	<form:form modelAttribute="editMember" action="${postUrl}" enctype="multipart/form-data">
		<form:hidden path="id" />
		<form:hidden path="licenseFileName" />
		<form:hidden path="user.id" />
		<form:hidden path="user.phone.id" />
		<form:hidden path="user.address.id" />
		<form:hidden path="user.username" />
		<form:hidden path="user.password" />
		<form:hidden path="user.confirmPassword" />
		<form:hidden path="user.roleSet" />
		<form:hidden path="user.email" />

		<div class="form-group">
			<form:errors path="*" cssClass="formErrorInfo" />
		</div>

		<div class="form-group">
			<label for="user.firstName"><spring:message code="register.page.firstName" text="First Name" />: </label>
			<form:input path="user.firstName" />
			<form:errors path="user.firstName" cssClass="formErrorInfo" />
		</div>
		
		<div class="form-group">
			<label for="user.lastName"><spring:message code="register.page.lastName" text="Last Name" />: </label>
			<form:input path="user.lastName" />
			<form:errors path="user.lastName" cssClass="formErrorInfo" />
		</div>
		
		<div class="form-group">
			<label for="user.phone.area"><spring:message code="register.page.phone" text="Phone" />: </label>
			(<form:input path="user.phone.area" size="3" maxlength="3" />)
			<form:input path="user.phone.prefix" size="3" maxlength="3" /> -
			<form:input path="user.phone.number" size="4" maxlength="4" /><br />
			<spring:message code="register.page.phoneFormat" 
				text="Please use format (area) prefix-number like this: (641) 472-1188" />
					<br />
			<form:errors path="user.phone.area" cssStyle="color: red;" /><br />
			<form:errors path="user.phone.prefix" cssStyle="color: red;" /><br />
			<form:errors path="user.phone.number" cssStyle="color: red;" />
		</div>
		
		<h3><spring:message code="register.page.address" text="Address Info" />:</h3>
		<div class="form-group">
			<label for="user.address.streetName"><spring:message code="register.page.street" text="Street" />: </label>
			<form:input path="user.address.streetName" />
			<form:errors path="user.address.streetName" cssClass="formErrorInfo" />
		</div>
		
		<div class="form-group">
			<label for="user.address.apartmentNumber"><spring:message code="register.page.unit" text="Unit" />: </label>
			<form:input path="user.address.apartmentNumber" />
			<form:errors path="user.address.apartmentNumber" cssClass="formErrorInfo" />
		</div>
		
		<div class="form-group">
			<label for="user.address.city"><spring:message code="register.page.city" text="City" />: </label>
			<form:input path="user.address.city" />
			<form:errors path="user.address.city" cssClass="formErrorInfo" />
		</div>
		
		<div class="form-group">
			<label for="user.address.state"><spring:message code="register.page.state" text="State" />: </label>
			<form:input path="user.address.state" />
			<form:errors path="user.address.state" cssClass="formErrorInfo" />
		</div>
		
		<div class="form-group">
			<label for="user.address.zipCode"><spring:message code="register.page.zipCode" text="Zip Code" />: </label>
			<form:input path="user.address.zipCode" />
			<form:errors path="user.address.zipCode" cssClass="formErrorInfo" />
		</div>

		<div class="form-group">
			<label for="user.address.country"><spring:message code="register.page.country" text="Country" />: </label>
			<form:input path="user.address.country" />
			<form:errors path="user.address.country" cssClass="formErrorInfo" />
		</div>

		<h3>Selected Categories:</h3>
		<div class="form-group">
				<div id="checkboxesDiv">
					<form:checkboxes items="${categoryMap}" path="checkedCategoryIDs" />
				</div>
		</div>
		
		<div class="form-group">
			<label for="organizationName">Organization Name: </label>
			<form:input path="organizationName" />
			<form:errors path="organizationName" cssClass="formErrorInfo" />
		</div>
		
		<sec:authorize access="hasAnyRole('ROLE_ORGANIZATION', 'ROLE_MEMBER')">
		<div class="form-group">
			<label for="licenseMultipart">Upload License File (Max File Size is 5MB): </label>
			<form:input path="licenseMultipart" type="file" />
			<form:errors path="licenseMultipart" cssClass="formErrorInfo" />
		</div>
		</sec:authorize>
		
		<div class="form-group">
			<input type="submit" value="Update" />
		</div>
	</form:form>
	</fieldset>
</div>