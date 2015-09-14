package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Locale;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.StringPool;
import com.liferay.portal.service.UserLocalServiceUtil;
import com.liferay.util.bridges.mvc.MVCPortlet;


public class Usuarios extends MVCPortlet{
	
	public void addCliente(ActionRequest actionRequest, ActionResponse actionResponse){
		
		String nombre = ParamUtil.getString(actionRequest, "nombre");
		String apellido = ParamUtil.getString(actionRequest, "apellido");
		String email = ParamUtil.getString(actionRequest, "txtemail");
		String contrasena = ParamUtil.getString(actionRequest, "contrasena");
		String empresa = ParamUtil.getString(actionRequest, "empresa");
		String cedJuridica = ParamUtil.getString(actionRequest, "cedJuridica");
		String sitioWeb = ParamUtil.getString(actionRequest, "web");
		String analytics = ParamUtil.getString(actionRequest, "analytics");
		String servicios = ParamUtil.getString(actionRequest, "servicios");
		String facebook = ParamUtil.getString(actionRequest, "facebook");
		String twitter = ParamUtil.getString(actionRequest, "twitter");
		String linkedIn = ParamUtil.getString(actionRequest, "linkedin");
		String googlePlus = ParamUtil.getString(actionRequest, "googlePlus");
		String telefono = ParamUtil.getString(actionRequest, "telefono");
		String direccion = ParamUtil.getString(actionRequest, "direccion");
		
		
		Connection miConexion;
        miConexion=ConexionBD.GetConnection();
        String query = " insert into cliente values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        if(miConexion!=null)
        {
        	try {
				PreparedStatement st= miConexion.prepareStatement(query);
				st.setString(1, nombre);
				st.setString(2, apellido);
				st.setString(3, email);
				st.setString(4, contrasena);
				st.setString(5, empresa);
				st.setString(6, cedJuridica);
				st.setString(7, sitioWeb);
				st.setString(8, analytics);
				st.setString(9, servicios);
				st.setString(10, facebook);
				st.setString(11, twitter);
				st.setString(12, linkedIn);
				st.setString(13, googlePlus);
				st.setString(14, telefono);
				st.setString(15, direccion);
				st.execute();
				miConexion.close();
			} catch (SQLException e) {
				System.out.println("no se genero el statement: " + e.getMessage());
				e.printStackTrace();
			}
        	
        	System.out.println("Conexión Realizada Correctamente");
        	//usuarioliferay(contrasena,nombre,apellido,email);
        }
		
	}
	public void addEmpleado(ActionRequest actionRequest, ActionResponse actionResponse){
		String nombre = ParamUtil.getString(actionRequest, "nombre");
		String apellido = ParamUtil.getString(actionRequest, "apelido");
		String cedula = ParamUtil.getString(actionRequest, "cedula");
		String email = ParamUtil.getString(actionRequest, "txtemail");
		String departamento = ParamUtil.getString(actionRequest, "departamento");
		String contrasena = ParamUtil.getString(actionRequest, "contrasena");
		
		Connection miConexion;
        miConexion=ConexionBD.GetConnection();
        String query = "insert into departamento values (?, ?, ?, ?, ?, ?)";
        if(miConexion!=null){
        	
			try {
				PreparedStatement st = miConexion.prepareStatement(query);
				st.setString(1, nombre);
				st.setString(2, apellido);
				st.setString(3, email);
				st.setString(4, departamento);
				st.setString(5, contrasena);
				st.setString(4, cedula);
				st.execute();
				miConexion.close();
			} catch (SQLException e) {

				System.out.println("no se genero el statement: " + e.getMessage());
			}      	

        	System.out.println("Conexión Realizada Correctamente");
        	usuarioliferay(contrasena,nombre,apellido,email);
        }
		
		
		
	}
	
	public void usuarioliferay(String contrasena, String nombre, String apellido, String email){
		try {
			UserLocalServiceUtil.addUser(10637, 10157, false, contrasena, contrasena, false, nombre+apellido, email, 0L, StringPool.BLANK, new Locale("fr"), nombre, "", apellido, 0, 0, true, 1, 1, 1970, StringPool.BLANK, new long[] { }, new long[] { }, new long[] { }, new long[] { }, false, null);
		} catch (PortalException e) {
			e.printStackTrace();
		} catch (SystemException e) {
			e.printStackTrace();
		}
	
	}
	
}
