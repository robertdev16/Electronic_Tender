<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
<title>Edit Category</title>
<style type="text/css">@import url("<c:url value="/css/main.css"/>");</style>
</head>
<body>

<spring:url var = "category_update" value="/category/update" />


<div id="global">
<form:form commandName="category" action= "${category_update}" >
    <fieldset>
        <legend>Edit a category</legend>
        <form:hidden path="id"/>
        
        <p>
            <label for="name">Name : </label>
            <form:input id="name" path="name"/>
        </p>
        <p>
            <label for="description">Description: </label>
            <form:input id="description" path="description"/>
        </p>
        
        <p id="buttons">
            <input id="reset" type="reset" tabindex="4">
            <input id="submit" type="submit" tabindex="5" 
                value="Update Category">
        </p>
    </fieldset>
</form:form>
</div>
</body>
</html>
