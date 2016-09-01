<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
<title>Edit Member Form</title>

</head>
<body>




<spring:url var = "member_update" value="/member/update" />


<div id="global">
<form:form commandName="newMember" action= "${member_update}" >
    <fieldset>        
        <legend>Edit a member</legend>
        <form:hidden path="id"/>
        <form:hidden path="user.username"/>
        <form:hidden path="user.password"/>
        
        <form:errors path="*" cssStyle="color: #ff0000" />
        <p>
            <label for="roleSet">Role : </label>
             <form:select path="user.roleSet" items="${user.roleSet}"
                itemLabel="name" itemValue="id"/>
        </p>
        <p>
            <label for="firstName">First Name: </label>
            <form:input path="user.firstName" />
        </p>
        <p>
            <label for="lastName">Last Name: </label>
            <form:input path="user.lastName" />
        </p>
        <p>
            <label for="email">Email: </label>
            <form:input path="user.email"/>
        </p>
        
        <div class="form-group">
					<label class="control-label col-lg-2" for="phone.area"><spring:message code="addTender.form.phone.area.label" text="Area"/></label>
					<form:input path="user.phone.area" cssStyle='width:3em'  />
					<form:errors path="user.phone.area" cssStyle="color : red;" />
					<label class="control-label col-lg-2" for="phone.prefix"><spring:message code="addTender.form.phone.prefix.label" text="Prefix"/></label>
					<form:input path="user.phone.prefix" cssStyle='width:3em'  />
					<form:errors path="user.phone.prefix" cssStyle="color : red;" />
					<label class="control-label col-lg-2" for="phone.number"><spring:message code="addTender.form.phone.number.label" text="Number"/></label>
					<form:input path="user.phone.number" cssStyle='width:4em'  />
					<form:errors path="user.phone.number" cssStyle="color : red;" />
        </div>
        <p>
            <label for="organizationName">Organization Name: </label>
            <form:input path="organizationName"/>
        </p>
        <p>
            Address: <br><br>
            <label for="address.streetName">Street : </label>
            <form:input path="user.address.streetName" />
         </p>         
         
         <p>           
            <label for="address.apartmentNumber">Apartment Number : </label>
            <form:input path="user.address.apartmentNumber" />
         </p>
         
         <p>           
            <label for="address.city">City : </label>
            <form:input path="user.address.city" />
         </p>
         
         <p>           
            <label for="address.state">State : </label>
            <form:input path="user.address.state" />
         </p>
         
          <p>           
            <label for="address.zipCode">Zipcode : </label>
            <form:input path="user.address.zipCode" />
         </p>
         
         <p>           
            <label for="address.country">Country : </label>
            <form:input path="user.address.country" />
         </p>
        
        <p id="buttons">
            <input id="reset" type="reset" tabindex="4">
            <input id="submit" type="submit" tabindex="5" 
                value="Update Member">
        </p>
    </fieldset>
</form:form>
</div>
</body>
</html>
