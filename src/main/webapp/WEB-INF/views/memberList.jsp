 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Member List</title>
  	<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
  	
</head>
<body>

<div id="centerDiv">
<h1>Member List</h1>
 
<table>
<tr style="width: 100%;">
    <th style="width: 13%;">First Name</th>
    <th style="width: 12%;">Last Name</th>
    <th style="width: 15%;">Account Detail</th>
    <th style="width: 15%;">Phone</th>
    <th style="width: 20%;">Address</th>
    <th style="width: 10%;">Role</th>
    <th style="width: 5%;">Edit</th>
</tr>
<c:forEach items="${members}" var="member">
    <tr>
        <td>${member.user.firstName}</td>
        <td>${member.user.lastName}</td>
        <spring:url value="/member/detailId/{memberId}" var="detailUrl" >
   			<spring:param name="memberId" value="${member.id}" />
 		</spring:url>
        <td><a href="${detailUrl}">${member.user.email}</a></td>
        <td>${member.user.phone.prefix}-${member.user.phone.area}-${member.user.phone.number}</td>
       
        <td>${member.user.address.streetName}, ${member.user.address.apartmentNumber}, 
        	${member.user.address.city}, ${member.user.address.state}, ${member.user.address.zipCode}</td>
        
        <td>${member.user.roleSet}</td>
        <spring:url value="/member/edit/{id}"  var="edit" >
   				<spring:param name="id" value="${member.id}" />
 		</spring:url>
        <td><a href="${edit}">Edit</a></td>
    </tr>
</c:forEach>
</table>
<hr />

<h2 class="blueInfo">License Verification Request Members: ${requestMembers.size()}</h2>
<ol>
<c:forEach items="${requestMembers}" var="member">
	<li class="padding5pxDiv">
		<spring:url value="/member/detailId/{memberId}" var="detailUrl" >
   			<spring:param name="memberId" value="${member.id}" />
 		</spring:url>
		[<a href="${detailUrl}">View Detail Information to Verify</a>]
		Account Email: ${member.user.username}
	</li>
</c:forEach>
</ol>

</div>
 
</body>
</html>
