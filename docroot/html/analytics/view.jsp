<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>



<portlet:defineObjects />
<portlet:renderURL  var="addAnalytics" windowState="normal">
	<portlet:param name="mvcPath" value="/html/analytics/addAnalytics.jsp"/>
</portlet:renderURL>

<h1>Analytics</h1>
<a href="<%=addAnalytics.toString()%>">Enviar Analytics</a><br/>