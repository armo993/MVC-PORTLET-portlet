<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>



<portlet:defineObjects />
	<portlet:actionURL var="addClienteActionURL" windowState="normal" name="addCliente">
</portlet:actionURL>


<h3> Agregar Cliente</h3>
<form action="<%=addClienteActionURL%>" name="clienteForm"  method="POST">
		<div class="form-group">
			<label for="nombre"> Nombre: </label> 
			<input type="text" class="form-control" id="<portlet:namespace/>nombre" name="<portlet:namespace/>nombre" required> 
		</div>
		<div class="form-group">
			<label for="apellido"> Apellido: </label> 
			<input type="text" class="form-control" id="<portlet:namespace/>apellido" name="<portlet:namespace/>apellido" required> 
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
			<label for="empresa">Empresa</label> 
			<input type="text" class="form-control" id="<portlet:namespace/>empresa" name="<portlet:namespace/>empresa" required> 
		</div>
		<div class="form-group">
			<label for="cedJuridica">Ced. Juridica</label> 
			<input type="text" class="form-control" id="<portlet:namespace/>cedJuridica" name="<portlet:namespace/>cedJuridica"> 
		</div>
		<div class="form-group">
			<label for="web">Sitio Web</label> 
			<input type="text" class="form-control" id="<portlet:namespace/>web" name="<portlet:namespace/>web"> 
		</div>
		<div class="form-group">
			<label for="analytics">Analytics profileID</label> 
			<input type="text" class="form-control" id="<portlet:namespace/>analytics" name="<portlet:namespace/>analytics"> 
		</div>
		<div class="form-group">
			<label for="servicios">Servicios</label> 
			<input type="text" class="form-control" id="<portlet:namespace/>servicios" name="<portlet:namespace/>servicios"> 
		</div>
		<div class="form-group">
			<label for="cedJuridica">Facebook</label> 
			<input type="text" class="form-control" id="<portlet:namespace/>facebook" name="<portlet:namespace/>facebook"> 
		</div>
		<div class="form-group">
			<label for="twitter">Twitter</label> 
			<input type="text" class="form-control" id="<portlet:namespace/>twitter" name="<portlet:namespace/>twitter"> 
		</div>
		<div class="form-group">
			<label for="linkedin">LinkedIn</label> 
			<input type="text" class="form-control" id="<portlet:namespace/>linkedin" name="<portlet:namespace/>linkedin"> 
		</div>
		<div class="form-group">
			<label for="googlePlus">Google Plus</label> 
			<input type="text" class="form-control" id="<portlet:namespace/>googlePlus" name="<portlet:namespace/>googlePlus"> 
		</div>
		<div class="form-group">
			<label for="telefono">Telefono</label> 
			<input type="text" class="form-control" id="<portlet:namespace/>telefono" name="<portlet:namespace/>telefono"> 
		</div>
		<div class="form-group">
			<label for="direccion">Dirección</label> 
			<!--  <input type="text" class="form-control" id="<portlet:namespace/>direccion" name="<portlet:namespace/>direccion"> --> 
			<textarea rows="4" cols="50" class="form-control" id="<portlet:namespace/>direccion" name="<portlet:namespace/>direccion"  ></textarea>
		</div>
		<br>
		<!--<input type="submit" name="addCliente" id="addCliente" value="Agregar"/>-->
		<button type="submit" class="btn btn-info">Agregar</button>
		
	</form>