<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<div id="centerDiv">
	<h1><spring:message code="register.page.h1" text="Register a Member" /></h1>

	<fieldset>
		<legend><spring:message code="register.page.legend" text="Please Fill Out Registration Form" /></legend>

	<form:form modelAttribute="newMember">

		<div class="form-group">
			<form:errors path="*" cssClass="formErrorInfo" />
		</div>

		<div class="form-group">
			<label for="user.username"><spring:message code="register.page.username" text="Account Email (Username)" />: </label>
			<form:input path="user.username" />
			<form:errors path="user.username" cssClass="formErrorInfo" />
		</div>
		
		<div class="form-group">
			<label for="user.password"><spring:message code="register.page.password" text="Password" />: </label>
			<form:password path="user.password" />
			<form:errors path="user.password" cssClass="formErrorInfo" />
		</div>
		
		<div class="form-group">
			<label for="user.confirmPassword"><spring:message code="register.page.confirmPassword" text="Confirm Password" />: </label>
			<form:password path="user.confirmPassword" />
			<form:errors path="user.confirmPassword" cssClass="formErrorInfo" />
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
		
		<h3><spring:message code="register.page.address" text="Your Address Info" />:</h3>
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

		<h3><spring:message code="register.page.subscribe" text="Subscribe to your favorite category" />:</h3>
		<div class="form-group">
				<div id="checkboxesDiv">
					<form:checkboxes items="${categoryMap}" path="checkedCategoryIDs" />
				</div>
		</div>
		
		<div class="form-group">
			<input type="submit" value='<spring:message code="register.page.button" text="Register" />' />
		</div>
	</form:form>
	</fieldset>
</div>