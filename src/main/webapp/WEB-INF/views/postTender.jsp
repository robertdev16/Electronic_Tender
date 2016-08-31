<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Tenders</title>
</head>
<body>
	<section>
		<div class="jumbotron">
  			<div class="pull-right" style="padding-right:50px">
				<a href="?language=en" >English</a>|<a href="?language=nl_NL" >China</a>					
			</div>
			
		</div>
	</section>
	<section class="container">
		<form:form  modelAttribute="newTender" class="form-horizontal" enctype="multipart/form-data">
			<fieldset>
				<legend>Add new tender</legend>

				<form:errors path="*" cssClass="alert alert-danger" element="div"/>
				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for="refId"><spring:message code="addTender.form.refId.label"/></label>
					<div class="col-lg-10">
						<form:input id="refId" path="refId" type="text" class="form:input-large"/>
						<form:errors path="refId" cssClass="text-danger"/>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2" for="title"><spring:message code="addTender.form.title.label"/></label>
					<div class="col-lg-10">
						<form:input id="title" path="title" type="text" class="form:input-large"/>
						<form:errors path="title" cssClass="text-danger"/>
					</div>
				</div>

				

				<div class="form-group">
					<label class="control-label col-lg-2" for="description"><spring:message code="addTender.form.description.label"/></label>
					<div class="col-lg-10">
						<form:textarea id="description" path="description" rows = "2"/>
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-lg-2" for="contactEmail"><spring:message code="addTender.form.contactEmail.label"/></label>
					<div class="col-lg-10">
						<div class="form:input-prepend">
							<form:input id="contactEmail" path="contactEmail" type="text" class="form:input-large"/>
							<form:errors path="contactEmail" cssClass="text-danger"/>
						</div>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2" for="contactPerson"><spring:message code="addTender.form.contactPerson.label"/></label>
					<div class="col-lg-10">
						<form:input id="contactPerson" path="contactPerson" type="text" class="form:input-large"/>
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-lg-2" for="phone.area"><spring:message code="addTender.form.phone.area.label"/></label>
					<form:input path="phone.area" cssStyle='width:3em'  />
					<form:errors path="phone.area" cssStyle="color : red;" />
					<label class="control-label col-lg-2" for="phone.prefix"><spring:message code="addTender.form.phone.prefix.label"/></label>
					<form:input path="phone.prefix" cssStyle='width:3em'  />
					<form:errors path="phone.prefix" cssStyle="color : red;" />
					<label class="control-label col-lg-2" for="phone.number"><spring:message code="addTender.form.phone.number.label"/></label>
					<form:input path="phone.number" cssStyle='width:4em'  />
					<form:errors path="phone.number" cssStyle="color : red;" />
                </div>

				<div class="form-group">
					<label class="control-label col-lg-2" for="address"><spring:message code="addTender.form.address.label"/></label>
					<label class="control-label col-lg-2" for="address.streetName"><spring:message code="addTender.form.address.strretNmae.label"/></label>
					<div class="col-lg-10">
						<form:input id="address.streetName" path="address.streetName" type="text" class="form:input-large"/>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2" for="address.apartmentNumber"><spring:message code="addTender.form.address.apartmentNumber.label"/></label>
					<div class="col-lg-10">
						<form:input id="address.apartmentNumber" path="address.apartmentNumber" type="text" class="form:input-large"/>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2" for="postDate"><spring:message code="addTender.form.postDate.label"/></label>
					<div class="col-lg-10">
						<form:input id="postDate" path="postDate" type="text" class="form:input-large"/>
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-lg-2" for="deadline"><spring:message code="addTender.form.deadline.label"/></label>
					<div class="col-lg-10">
						<form:input id="deadline" path="deadline" type="text" class="form:input-large"/>
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-lg-2" for="agency"><spring:message code="addTender.form.agency.label"/></label>
					<div class="col-lg-10">
						<form:input id="postDate" path="agency" type="text" class="form:input-large"/>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2" for="condition"><spring:message code="addProduct.form.condition.label"/></label>
					<div class="col-lg-10">
						<form:checkboxes items="${categories}" path="favFramework" />
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-lg-2" for="tenderMultipart"><spring:message code="addTender.form.tenderMultipart.label"/></label>
					<div class="col-lg-10">
						<form:input id="tenderMultipart" path="tenderMultipart" type="file"
							class="form:input-large" />
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-lg-2" for="attachmentFileName"><spring:message code="addTender.form.attachmentFileName.label"/></label>
					<div class="col-lg-10">
						<form:input id="attachmentFileName" path="attachmentFileName" type="text" class="form:input-large"/>
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
