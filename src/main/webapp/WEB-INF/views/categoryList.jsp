<<<<<<< HEAD
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Category List</title>
  	<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
	<script type="text/javascript" src="<spring:url value="/resource/js/ajax.js"/>"></script>

<style type="text/css">@import url("<spring:url value="/css/main.css"/>");</style>
</head>
<body>

<div id="global">
<h1>Category List</h1>
 
<table>
<tr style="width: 100%;">
    <th style="width: 19%;">Name</th>
    <th style="width: 21%;">Description</th>
    <th style="width: 21%;">No. Tenders</th>    
    <th style="width: 15%;"></th>
</tr>
<c:forEach items="${categories}" var="category">
    <tr>
        <td>${category.name}</td>
        <td>${category.description}</td>
         <td>${category.tenderList.size()}</td>        
        
        <!-- Spring:url for handling Spring template/@PathVariable -->
        <spring:url value="/category_edit/{id}"  var="edit" >
   				<spring:param name="id" value="${category.id}" />
 		</spring:url>
         
        <td><a href="${edit}">Edit</a></td>
    </tr>
</c:forEach>
</table>
 
  <input type="button" value="Add Category" onclick="make_visible('formInput');return false;">

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
     <a href="#" onclick="make_hidden('formInput'); make_hidden('result');resetForm('categoryForm');"> <b>EXIT</b> </a> 
  </h4>

</div>
 
</body>
</html>
=======
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ include file="/WEB-INF/views/template/header.jsp" %>
<%@ taglib prefix="imgtag" uri="/WEB-INF/tlds/img_tag" %> --%>


<table>
	<tr>
		<th>Business Area</th>
	</tr>

	<c:forEach items="${categories}" var="category">
		<tr>
			<td><a
				href="<spring:ur value="/tender/viewCategories/${category.id}" />">
			</a></td>
		</tr>
	</c:forEach>
</table>
<%-- 
<%@ include file="/WEB-INF/views/template/footer.jsp" %> --%>
>>>>>>> branch 'master' of https://github.com/robertdev16/Electronic_Tender.git
