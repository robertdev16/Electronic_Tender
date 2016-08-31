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