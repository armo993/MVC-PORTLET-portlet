<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>

<portlet:defineObjects />

<portlet:renderURL  var="editarCliente" windowState="normal">

<portlet:param name="mvcPath" value="/html/mostrarclientes/editarCliente.jsp" /></portlet:renderURL>

<%@ page import="java.sql.*" %>

<% Class.forName("com.mysql.jdbc.Driver"); %>



<HTML>
    <HEAD>
    </HEAD>

    <BODY>
    <% 
            Connection connection = DriverManager.getConnection(
                "jdbc:mysql://localhost/DBLiferay", "root", "1234");

            Statement statement = connection.createStatement() ;
            ResultSet resultset = 
                statement.executeQuery("select * from cliente") ; 
        %>
    <div class="container">
        <H1>Clientes </H1>

        
		<div class="table-responsive">
        <TABLE class="table">
            <TR>
                <TH>Nombre</TH>
                <TH>Apellido</TH>
                <TH>Email</TH>
                <TH>Empresa</TH>
                <TH>ced. Juridica</TH>
                <TH>sitio web</TH>
                <TH>Analytics</TH>
                <TH>Servicios</TH>	
                <TH>Facebook</TH>
                <TH>Twitter</TH>
                <TH>LinkedIn</TH>
                <TH>Google Plus</TH>
                <TH>Telefono</TH>
                <TH>Direccion</TH>
                <TH>Editar</TH>
                <!--  <TH>Editar</TH>-->
            </TR>
            <% while(resultset.next()){ %>
            <TR>
                <TD> <%= resultset.getString(1) %></TD>
                <TD> <%= resultset.getString(2) %></TD>
                <TD> <%= resultset.getString(3) %></TD>
                <TD> <%= resultset.getString(5) %></TD>
                <TD> <%= resultset.getString(6) %></TD>
                <TD> <%= resultset.getString(7) %></TD>
                <TD> <%= resultset.getString(8) %></TD>
                <TD> <%= resultset.getString(9) %></TD>
                <TD> <%= resultset.getString(10) %></TD>
                <TD> <%= resultset.getString(11) %></TD>
                <TD> <%= resultset.getString(12) %></TD>
                <TD> <%= resultset.getString(13) %></TD>
                <TD> <%= resultset.getString(14) %></TD>
                <TD> <%= resultset.getString(15) %></TD>
                <!--  <TD> <button class="btn btn-warning" onclick="editarCliente">editar</button></TD>-->
                <TD> <a href="<%=editarCliente.toString()%>">editar</a> </TD>
            </TR>
            <% } %>
        </TABLE>
        </div>
    </div>
    </BODY>
</HTML>