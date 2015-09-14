<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>



<portlet:defineObjects />
	<portlet:actionURL var="addEmpleadoActionURL" windowState="normal" name="addEmpleado">
</portlet:actionURL>



<form action="<%=addEmpleadoActionURL%>" name="empleadoForm"  method="POST">
		<div class="form-group">
			<label for="nombre"> Nombre: </label> 
			<input type="text" class="form-control" id="<portlet:namespace/>nombre" name="<portlet:namespace/>nombre" required> 
		</div>
		
		<div class="form-group" >
			<label for="cedula">Cedula</label> 
			<input type="text" class="form-control" id="<portlet:namespace/>cedula" name="<portlet:namespace/>cedula" required>
		</div>
		<div class="form-group" >
			<label for="txtemail">Email</label> 
			<input type="email" class="form-control" id="<portlet:namespace/>txtemail" name="<portlet:namespace/>txtemail" required>
		</div>
		<div class="form-group">
			<label for="contrasena">Contraseña</label> 
			<input type="password" class="form-control" id="<portlet:namespace/>contrasena" name="<portlet:namespace/>contrasena" required> 
		</div>
		<div class="form-group">
			<label for="departamento">Departamento</label> 
			<select class="form-control" id="<portlet:namespace/>departamento" name="<portlet:namespace/>departamento">
			  <option value="Mercadeo">Mercadeo</option>
			  <option value="TI">TI</option>
			  <option value="RH">Recursos Humanos</option>
			</select> 
		</div>
		<div class="form-group">
			<label for="tipo" >Tipo de Usuario</label> 
			<select class="form-control" id="<portlet:namespace/>tipo" name="<portlet:namespace/>tipo">
			  <option value="Administrador">Administrador</option>
			  <option value="Empleado">Empleado</option>
			</select> 
		</div>
		<br>
		<!--<input type="submit" name="addCliente" id="addCliente" value="Agregar"/>-->
		<button type="submit" class="btn btn-info">Agregar</button>
		
	</form>