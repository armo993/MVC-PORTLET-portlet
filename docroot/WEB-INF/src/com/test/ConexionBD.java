package com.test;

import java.sql.DriverManager;
import java.sql.SQLException;

//import javax.swing.JOptionPane;

import com.mysql.jdbc.Connection;

public class ConexionBD {
	@SuppressWarnings("finally")
	public static Connection GetConnection()
    {
        Connection conexion=null;
      
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            String servidor = "jdbc:mysql://localhost/DBLiferay";
            String usuarioDB="root";
            String passwordDB="1234";
            conexion= (Connection) DriverManager.getConnection(servidor,usuarioDB,passwordDB);
        }
        catch(ClassNotFoundException ex)
        {
            //JOptionPane.showMessageDialog(null, ex, "Error1 en la Conexión con la BD "+ex.getMessage(), JOptionPane.ERROR_MESSAGE);
            System.out.println("Error1 en la Conexión con la BD "+ex.getMessage());
        	conexion=null;
        }
        catch(SQLException ex)
        {
            //JOptionPane.showMessageDialog(null, ex, "Error2 en la Conexión con la BD "+ex.getMessage(), JOptionPane.ERROR_MESSAGE);
            System.out.println("Error2 en la Conexión con la BD "+ex.getMessage());
            conexion=null;
        }
        catch(Exception ex)
        {
            //JOptionPane.showMessageDialog(null, ex, "Error3 en la Conexión con la BD "+ex.getMessage(), JOptionPane.ERROR_MESSAGE);
        	System.out.println("Error3 en la Conexión con la BD "+ex.getMessage());
        	conexion=null;
        }
        finally
        {
            return conexion;
        }
    }
}
