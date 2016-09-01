<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


        <div class="page-header">
            <h1>Register Member</h1>

            <p class="lead">Please fill in your information below:</p>
        </div>

        <form:form modelAttribute="newMember">

        <h3>Basic Info:</h3>

        <div class="form-group">
            <label for="name">Name *</label>
            <form:errors path="customerName" cssStyle="color: #ff0000" />
            <form:input path="customerName" id="name" class="form-Control" />
        </div>

        <div class="form-group">
            <label for="email">Email *</label>
            <span style="color: #ff0000">${emailMsg}</span>
            <form:errors path="customerEmail" cssStyle="color: #ff0000" />
            <form:input path="customerEmail" id="email" class="form-Control" />
        </div>

        <div class="form-group">
            <label for="phone">Phone</label>
            <form:input path="customerPhone" id="phone" class="form-Control" />
        </div>

        <div class="form-group">
            <label for="username">User name *</label>
            <span style="color: #ff0000">${usernameMsg}</span>
            <form:errors path="username" cssStyle="color: #ff0000" />
            <form:input path="username" id="username" class="form-Control" />
        </div>

        <div class="form-group">
            <label for="password">Password *</label>
            <form:errors path="password" cssStyle="color: #ff0000" />
            <form:password path="password" id="password" class="form-Control" />
        </div>

        <br/>

        <h3>Address:</h3>

        <div class="form-group">
            <label for="Street">Street Name *</label>
            <form:errors path="Address.streetName" cssStyle="color: #ff0000" />
            <form:input path="Address.streetName" id="Street" class="form-Control" />
        </div>
        <div class="form-group">
            <label for="City">City *</label>
            <form:errors path="Address.city" cssStyle="color: #ff0000" />
            <form:input path="Address.city" id="City" class="form-Control" />
        </div>

        <div class="form-group">
            <label for="State">State *</label>
            <form:errors path="Address.state" cssStyle="color: #ff0000" />
            <form:input path="Address.state" id="State" class="form-Control" />
        </div>

        <div class="form-group">
            <label for="Country">Country *</label>
            <form:errors path="Address.country" cssStyle="color: #ff0000" />
            <form:input path="Address.country" id="Country" class="form-Control" />
        </div>

        <div class="form-group">
            <label for="Zip">Zip code *</label>
            <form:errors path="Address.zipCode" cssStyle="color: #ff0000" />
            <form:input path="Address.zipCode" id="Zip" class="form-Control" />
        </div>


        <input type="submit" value="submit" >
        <a href="<c:url value="/" />" >Cancel</a>

        </form:form>
