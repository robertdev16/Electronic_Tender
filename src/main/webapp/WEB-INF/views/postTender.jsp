<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<form:form modelAttribute="newTender" enctype="multipart/form-data">
		<fieldset>
			<legend>Add new tender</legend>

			<form:errors path="*" cssClass="formErrorInfo" />


			<div class="form-group">
				<label for="title"><spring:message
						code="addTender.form.title.label" text="Title" /></label>
				<form:input id="title" path="title" type="text"
					class="form:input-large" />
				<form:errors path="title" cssClass="text-danger" />
			</div>

			<div class="form-group">
				<label for="description"><spring:message
						code="addTender.form.description.label" text="Description" /></label>
				<form:textarea path="description" rows="25" cols="100" />
				<form:errors path="description" cssClass="text-danger" />
			</div>

			<div class="form-group">
				<label for="contactEmail"><spring:message
						code="addTender.form.contactEmail.label" text="Contact Email" /></label>
					<form:input path="contactEmail" type="text" />
					<form:errors path="contactEmail" cssClass="text-danger" />
			</div>

			<div class="form-group">
				<label for="contactPerson"><spring:message
						code="addTender.form.contactPerson.label" text="Contact Person" /></label>
				<form:input path="contactPerson" type="text" />
				<form:errors path="contactPerson" cssClass="text-danger" />
			</div>

			<div class="form-group">
				<label for="phone"><spring:message code="page.phone" text="Phone" />: </label>
					(<form:input path="phone.area" size="3" maxlength="3" />)
					<form:input path="phone.prefix" size="3" maxlength="3" /> -
					<form:input path="phone.number" size="4" maxlength="4" /><br />
					<spring:message code="register.page.phoneFormat" 
					text="(area) prefix-number e.g. (641) 472-1188" />
					<br />
					<form:errors path="phone.area" cssClass="text-danger" /><br />
					<form:errors path="phone.prefix" cssClass="text-danger" /><br />
					<form:errors path="phone.number" cssClass="text-danger" /><br />
			</div>

			<div class="form-group">
				<label for="address"><spring:message
						code="addTender.form.address.label" text="Address" /></label> 
				<label for="address.streetName"><br /><spring:message
						code="addTender.form.address.strretNmae.label" text="SteetName" /></label>
				<form:input path="address.streetName" type="text"/>
				<form:errors path="address.streetName" cssClass="text-danger" />
			</div>

			<div class="form-group">
				<label for="address.apartmentNumber"><spring:message
						code="addTender.form.address.apartmentNumber.label"
						text="Apartment Number" /></label>
				<form:input path="address.apartmentNumber" type="text"/>
				<form:errors path="address.apartmentNumber" cssClass="text-danger" />
			</div>
			
			<div class="form-group">
				<label for="address.city"><spring:message
						code="addTender.form.address.city.label"
						text="City" /></label>
				<form:input path="address.city" type="text"/>
				<form:errors path="address.city" cssClass="text-danger" />
			</div>
			
			<div class="form-group">
				<label for="address.state"><spring:message
						code="addTender.form.address.state.label"
						text="State" /></label>
				<form:input path="address.state" type="text"/>
				<form:errors path="address.state" cssClass="text-danger" />
			</div>
			
			<div class="form-group">
				<label for="address.zipCode"><spring:message
						code="addTender.form.address.zipCode.label"
						text="Zip Code" /></label>
				<form:input path="address.zipCode" type="text"/>
				<form:errors path="address.zipCode" cssClass="text-danger" />
			</div>	

			<div class="form-group">
				<label for="deadline"><spring:message
						code="addTender.form.deadline.label" text="Deadline" /></label>
				<form:input path="deadline" type="text" />
				<form:errors path="deadline" cssClass="text-danger" />
			</div>

			<div class="form-group">
				<label for="agency"><spring:message
						code="addTender.form.agency.label" text="Agency" /></label>
				<form:input path="agency" type="text"/>
				<form:errors path="agency" cssClass="text-danger" />
			</div>

			<div class="form-group">
				<label for="condition"><spring:message
						code="addProduct.form.condition.label" text="Select Category" /></label>
				<div id="checkboxesDiv">
					<form:checkboxes items="${categoryMap}" path="checkedCategoryIDs" />
				</div>
			</div>

			<div class="form-group">
				<label for="tenderMultipart"><spring:message
						code="addTender.form.tenderMultipart.label"
						text="Upload Attachment" /></label>
				<form:input path="tenderMultipart" type="file" />
			</div>

			<div class="form-group">
				<input type="submit" value='<spring:message code="postTenderPage.postButton" text="Post Tender" />' />
			</div>
		</fieldset>
	</form:form>
</body>
</html>
