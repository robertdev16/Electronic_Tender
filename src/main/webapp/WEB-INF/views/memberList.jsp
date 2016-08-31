 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Member List</title>
  	<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
	<script type="text/javascript" src="<spring:url value="/resource/js/ajax.js"/>"></script>
    <style type="text/css">@import url("<spring:url value="/css/main.css"/>");</style>
  	
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
        <spring:url value="/member_edit/{id}"  var="edit" >
   				<spring:param name="id" value="${member.id}" />
 		</spring:url>
         
        <td><a href="${edit}">Edit</a></td>
    </tr>
</c:forEach>
</table>
 
  <!--  <input type="button" value="Add Category" onclick="make_visible('formInput');return false;">-->

</div>
 
 		<!-- Success - or Validation errors 
    	<div id="result" style="display:none" >   	
    	    <p id="success" > 
    
    		</p> 
    		<p id="errors" > 
    
    		</p>
    	</div>
 
   	<div id="formInput" style="display:none" > 

	<h3 align="center">Category</h3>

	
	<form id="categoryForm" method="post">

			<input type="hidden" name="id" value="0">
          
          <p>
            <label for="name"> Name    : </label>
             <input type="text" name="name" id="name" value="" />
        </p>
 
         <p>
            <label for="description"> Description: </label>
            <input id="description" name="description" type="text"/>
        </p>
 
             <input type="button" value="Add Category" onclick="categorySubmit() ">
    
    </form>
  <h4 align="center"> 
     <a href="#" onclick="make_hidden('formInput'); make_hidden('result');resetForm('categoryForm');"> <b>EXIT</b> </a> 
  </h4>

</div>-->
 
</body>
</html>
