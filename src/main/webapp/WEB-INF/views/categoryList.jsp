 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE HTML>
<html>
<head>
  	<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
	<script type="text/javascript" src="<spring:url value="/resources/js/ajax.js"/>"></script>
</head>
<body>

<div id="centerDiv">
<h1>Category List</h1>
<input type="button" value="Add Category" onclick="make_visible('formInput');return false;">
<br /><br />
<table>
<tr style="width: 100%;">
    <th style="width: 30%;">Name</th>
    <th style="width: 50%;">Description</th>
    <th style="width: 10%;">No. Tenders</th>    
    <th style="width: 10%;">Edit</th>
</tr>
<c:forEach items="${categories}" var="category">
    <tr>
        <td>${category.name}</td>
        <td>${category.description}</td>
        <td>${category.tenderList.size()}</td>        
        
        <!-- Spring:url for handling Spring template/@PathVariable -->
        <spring:url value="/category/edit/{id}"  var="edit" >
   				<spring:param name="id" value="${category.id}" />
 		</spring:url>
         
        <td><a href="${edit}">Edit</a></td>
    </tr>
</c:forEach>
</table>
</div>
 
 		<!-- Success - or Validation errors -->
    	<div id="result" style="display:none" >   	
    	    <p id="success" > 
    
    		</p> 
    		<p id="errors" > 
    
    		</p>
    	</div>
 
   	<div id="formInput" style="display:none" > 

	<h3 align="center">Category</h3>

	<!-- No action method handled by AJAX-->
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
     <a href="#" onclick="make_hidden('formInput'); make_hidden('result'); resetForm('categoryForm'); window.location.reload();"> <b>EXIT</b> </a> 
  </h4>

</div>
 
</body>
</html>
