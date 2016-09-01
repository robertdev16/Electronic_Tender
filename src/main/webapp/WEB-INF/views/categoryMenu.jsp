<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<div id="leftDiv">
<table>
	<tr>
		<th>Business Area</th>
	</tr>

	<c:forEach items="${categories}" var="category">
		<tr>
			<td><a href="<spring:url value='/tender/byCategory/${category.id}' />">
			${category.name}
			</a></td>
		</tr>
	</c:forEach>
</table>
</div>
