<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<section class="container">
		<form:form  modelAttribute="newTender" class="form-horizontal" enctype="multipart/form-data">
			<fieldset>
				<legend>Add new tender</legend>

				<form:errors path="*" cssClass="alert alert-danger" element="div"/>


				<div class="form-group">
					<label class="control-label col-lg-2" for="title"><spring:message code="addTender.form.title.label" text="Title"/></label>
					<div class="col-lg-10">
						<form:input id="title" path="title" type="text" class="form:input-large"/>
						<form:errors path="title" cssClass="text-danger"/>
					</div>
				</div>

				

				<div class="form-group">
					<label class="control-label col-lg-2" for="description"><spring:message code="addTender.form.description.label" text="Description"/></label>
					<div class="col-lg-10">
						<form:textarea id="description" path="description" rows="25" cols="100"/>
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-lg-2" for="contactEmail"><spring:message code="addTender.form.contactEmail.label" text="Contact Email"/></label>
					<div class="col-lg-10">
						<div class="form:input-prepend">
							<form:input id="contactEmail" path="contactEmail" type="text" class="form:input-large"/>
							<form:errors path="contactEmail" cssClass="text-danger"/>
						</div>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2" for="contactPerson"><spring:message code="addTender.form.contactPerson.label" text="Contact Person"/></label>
					<div class="col-lg-10">
						<form:input id="contactPerson" path="contactPerson" type="text" class="form:input-large"/>
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-lg-2" for="phone.area"><spring:message code="addTender.form.phone.area.label" text="Area"/></label>
					<form:input path="phone.area" cssStyle='width:3em'  />
					<form:errors path="phone.area" cssStyle="color : red;" />
					<label class="control-label col-lg-2" for="phone.prefix"><spring:message code="addTender.form.phone.prefix.label" text="Prefix"/></label>
					<form:input path="phone.prefix" cssStyle='width:3em'  />
					<form:errors path="phone.prefix" cssStyle="color : red;" />
					<label class="control-label col-lg-2" for="phone.number"><spring:message code="addTender.form.phone.number.label" text="Number"/></label>
					<form:input path="phone.number" cssStyle='width:4em'  />
					<form:errors path="phone.number" cssStyle="color : red;" />
                </div>

				<div class="form-group">
					<label class="control-label col-lg-2" for="address"><spring:message code="addTender.form.address.label" text="Address"/></label>
					<label class="control-label col-lg-2" for="address.streetName"><spring:message code="addTender.form.address.strretNmae.label" text="StrretNmae"/></label>
					<div class="col-lg-10">
						<form:input id="address.streetName" path="address.streetName" type="text" class="form:input-large"/>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2" for="address.apartmentNumber"><spring:message code="addTender.form.address.apartmentNumber.label" text="ApartmentNumber"/></label>
					<div class="col-lg-10">
						<form:input id="address.apartmentNumber" path="address.apartmentNumber" type="text" class="form:input-large"/>
					</div>
				</div>

				
				<div class="form-group">
					<label class="control-label col-lg-2" for="deadline"><spring:message code="addTender.form.deadline.label" text="Deadline"/></label>
					<div class="col-lg-10">
						<form:input id="deadline" path="deadline" type="text" class="form:input-large"/>
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-lg-2" for="agency"><spring:message code="addTender.form.agency.label" text="Agency"/></label>
					<div class="col-lg-10">
						<form:input path="agency" type="text" class="form:input-large"/>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2" for="condition"><spring:message code="addProduct.form.condition.label" text="Select Category"/></label>
					<div id="checkboxesDiv">
						<form:checkboxes items="${categoryMap}" path="checkedCategoryIDs" />
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-lg-2" for="tenderMultipart"><spring:message code="addTender.form.tenderMultipart.label" text="Upload Attachment"/></label>
					<div class="col-lg-10">
						<form:input id="tenderMultipart" path="tenderMultipart" type="file"
							class="form:input-large" />
					</div>
				</div>

				<div class="form-group">
					<div class="col-lg-offset-2 col-lg-10">
						<input type="submit" id="btnAdd" class="btn btn-primary" value ="Add"/>
					</div>
				</div>
				
			</fieldset>
		</form:form>
	</section>
</body>
</html>
