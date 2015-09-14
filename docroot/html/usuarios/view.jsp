<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>



<portlet:defineObjects />
<portlet:renderURL  var="addEmpleado" windowState="normal">
	<portlet:param name="mvcPath" value="/html/usuarios/addEmpleado.jsp"/>
</portlet:renderURL>
<portlet:renderURL  var="addCliente" windowState="normal">
	<portlet:param name="mvcPath" value="/html/usuarios/addCliente.jsp"/>
</portlet:renderURL>

<h3>Agregar Usuario</h3>
<a href="<%=addEmpleado.toString()%>">Agregar Empleado</a><br/>
<a href="<%=addCliente.toString()%>">Agregar Cliente</a><br/>