<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ include file="/WEB-INF/views/template/header.jsp" %>
<%@ taglib prefix="imgtag" uri="/WEB-INF/tlds/img_tag" %> --%>


<table>
	<tr>
		<th>Business Area</th>
	</tr>

	<c:forEach items="${catagories}" var="catagory">
		<tr>
			<td><a
				href="<spring:ur value="/tender/viewCatagories/${catagory.id}" />">
			</a></td>
		</tr>
	</c:forEach>
</table>
<%-- 
<%@ include file="/WEB-INF/views/template/footer.jsp" %> --%>