<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<body>

<spring:url var = "category_update" value="/category/update" />


<div id="centerDiv">
<form:form modelAttribute="category" action= "${category_update}" >
    <fieldset>
        <legend>Edit a category</legend>
        <form:hidden path="id"/>
        
        <div class="form-group">
			<form:errors path="*" cssClass="formErrorInfo" />
		</div>
        
        <div class="form-group">
            <label for="name">Name : </label>
            <form:input path="name"/>
            <form:errors path="name" cssClass="formErrorInfo" />
        </div>
        
        <div class="form-group">
            <label for="description">Description: </label>
            <form:input path="description"/>
            <form:errors path="description" cssClass="formErrorInfo" />
        </div>
        
        <div class="form-group">
            <input type="reset">
            <input type="submit" value="Update Category">
        </div>
    </fieldset>
</form:form>
</div>
</body>
</html>
