<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
<title>Edit Member Form</title>
<style type="text/css">@import url("<c:url value="/css/main.css"/>");</style>
</head>
<body>
<spring:url var = "editMember" value="/editMember" />



<spring:url var = "member_update" value="/member/update" />


<div id="global">
<form:form commandName="member" action= "${member_update}" >
    <fieldset>        
        <legend>Edit a member</legend>
        <form:hidden path="id"/>
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
            <label for="email">Email: </label>
            <form:input path="user.email"/>
        </p>
        <p>
            <label for="organizationName">Organization Name: </label>
            <form:input path="organizationName"/>
        </p>
         <p>
            Address:
            <label for="address.streetName">Street : </label>
            <form:input path="user.address.streetName" />
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
