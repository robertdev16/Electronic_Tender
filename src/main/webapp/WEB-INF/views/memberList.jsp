 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Member List</title>
  	<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
    <style type="text/css">@import url("<spring:url value="resources/css/main.css"/>");</style>
  	
</head>
<body>

<div id="global">
<h1>Member List</h1>

<!-- Query Parameter passing 
<spring:url value="/addMember" var="addMember_url" >
</spring:url>
<a href="${addMember_url}">Add Member</a><br/> -->

 
 
<table>
<tr style="width: 100%;">
    <th style="width: 19%;">First Name</th>
    <th style="width: 21%;">Last Name</th>
    <th style="width: 21%;">Email</th>
    <th style="width: 21%;">Phone</th>
    <th style="width: 21%;">Address</th>
    <th style="width: 23%;">Role</th>
    <th style="width: 23%;">No. of publication</th>
    <th style="width: 15%;"></th>
</tr>
<c:forEach items="${members}" var="member">
    <tr>
        <td>${member.firstName}</td>
        <td>${member.lastName}</td>
         <td>${member.email}</td>
        <td>${member.phone.prefix}-${member.phone.area}-${member.phone.number}</td>
        <!-- <td><spring:eval expression="book.publishDate" /></td> -->
        <td>${member.address.street}, ${member.address.streetName},${member.address.city}, ${member.address.state}</td>
        
        <!-- Spring:url for handling Spring template/@PathVariable -->
        <spring:url value="/member/edit/{id}"  var="edit" >
   				<spring:param name="id" value="${member.id}" />
 		</spring:url>
         
        <td><a href="${edit}">Edit</a></td>
    </tr>
</c:forEach>
</table>

</div>
 
</body>
</html>
