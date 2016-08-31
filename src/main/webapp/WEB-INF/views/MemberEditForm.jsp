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
<spring:url var = "editBook" value="/editBook" />

<!--  <div id="rightList"> 
	<form:form modelAttribute="bookSearch"  action= "${editBook}"   method="post">
  <p>
            	<label for="bookList"><spring:message code="book.book" /> </label>
             	<form:select id="booklist" path="id" 
                	items="${books}" itemLabel="title" itemValue="id"/>
  
             <input id="submit" type="submit" value="Edit Book">
</p>
    </form:form >
</div>-->

<spring:url var = "member_update" value="/member_update" />


<div id="global">
<form:form commandName="member" action= "${member_update}" >
    <fieldset>        
        <legend>Edit a member</legend>
        <form:hidden path="id"/>
        <p>
            <label for="roleSet">Role : </label>
             <form:select id="roleSet" path="roleSet.id" items="${roles}"
                itemLabel="name" itemValue="id"/>
        </p>
        <p>
            <label for="firstName">First Name: </label>
            <form:input id="firstName" path="firstName" />
        </p>
        <p>
            <label for="email">Email: </label>
            <form:input id="author" path="author"/>
        </p>
        <p>
            <label for="organizationName">Organization Name: </label>
            <form:input id="organizationName" path="organizationName"/>
        </p>
         <p>
            Address:
            <label for="address.streetName">Street : </label>
            <form:input path="address.streetName" id="address.streetName" />
         </p>
         
         <p>
            <label for="publishDate">Publish Date: </label>
            <form:input path="publishDate" id="publishDate" />
         </p>
         
         <p>
            <label for="publishDate">Publish Date: </label>
            <form:input path="publishDate" id="publishDate" />
         </p>
         
         <p>
            <label for="publishDate">Publish Date: </label>
            <form:input path="publishDate" id="publishDate" />
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
