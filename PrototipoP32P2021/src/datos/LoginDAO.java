/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datos;

import dominio.Login;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author leone
 */
public class LoginDAO {
    private static final String SQL_QUERY = "SELECT id_usuario, nombre_usuario, contraseña_usuario, tipo_usuario, estado_usuario FROM tbl_seguridad WHERE nombre_usuario = ?";
    private static final String SQL_QUERY2 = "SELECT id_usuario, nombre_usuario, contraseña_usuario, tipo_usuario, estado_usuario FROM tbl_seguridad WHERE id_usuario = ?";
    private static final String SQL_INSERT = "insert into tbl_seguridad values(?,?,?,?,?)";
    private static final String SQL_UPDATE = "UPDATE tbl_seguridad SET nombre_usuario=?, contraseña_usuario=?, tipo_usuario=?, estado_usuario=? WHERE id_usuario=?";
    private static final String SQL_SELECT = "SELECT id_usuario, nombre_usuario, contraseña_usuario, tipo_usuario,estado_usuario FROM tbl_seguridad";
    private static final String SQL_DELETE = "delete from tbl_seguridad where id_usuario = ?";  
    
    public int insert(Login login) {
        Connection conn = null;
        PreparedStatement stmt = null;
        int rows = 0;
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(SQL_INSERT);
            stmt.setString(1, login.getId());
            stmt.setString(2, login.getUsuario());
            stmt.setString(3, login.getContraseña());
            stmt.setString(4, login.getTipo());
            stmt.setString(5, login.getEstado());
           

            //System.out.println("ejecutando query:" + SQL_INSERT);
            rows = stmt.executeUpdate();
            //System.out.println("Registros afectados:" + rows);
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }

        return rows;
    }
    public int update(Login login){
        Connection conn = null;
        PreparedStatement stmt = null;
        int rows = 0;
        
        try {
            conn = Conexion.getConnection();
//          System.out.println("ejecutando query: " + SQL_UPDATE);
            stmt = conn.prepareStatement(SQL_UPDATE);
            stmt.setString(1, login.getUsuario());
            stmt.setString(2, login.getContraseña());
            stmt.setString(3, login.getTipo());
            stmt.setString(4, login.getEstado());
            stmt.setString(5, login.getId());
            
            rows = stmt.executeUpdate();
            
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        }
        finally{
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        
        return rows;
    }
    public Login query(Login login) {    
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        int rows = 0;

        try {
            conn = Conexion.getConnection();
            //System.out.println("Ejecutando query:" + SQL_QUERY);
            stmt = conn.prepareStatement(SQL_QUERY);
            stmt.setString(1, login.getUsuario());
            rs = stmt.executeQuery();
            while (rs.next()) {
                String id = rs.getString("id_usuario");
                String usuario = rs.getString("nombre_usuario");
                String contraseña = rs.getString("contraseña_usuario");
                String tipo = rs.getString("tipo_usuario");
                String estado = rs.getString("estado_usuario");

                login = new Login();
                login.setId(id);
                login.setUsuario(usuario);
                login.setContraseña(contraseña);
                login.setTipo(tipo);
                login.setEstado(estado);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return login;
    }
    public Login query2(Login login) {    
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        int rows = 0;

        try {
            conn = Conexion.getConnection();
            //System.out.println("Ejecutando query:" + SQL_QUERY);
            stmt = conn.prepareStatement(SQL_QUERY2);
            stmt.setString(1, login.getId());
            rs = stmt.executeQuery();
            while (rs.next()) {
                String id = rs.getString("id_usuario");
                String usuario = rs.getString("nombre_usuario");
                String contraseña = rs.getString("contraseña_usuario");
                String tipo = rs.getString("tipo_usuario");
                String estado = rs.getString("estado_usuario");

                login = new Login();
                login.setId(id);
                login.setUsuario(usuario);
                login.setContraseña(contraseña);
                login.setTipo(tipo);
                login.setEstado(estado);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return login;
    }
    public List<Login> select(){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Login login = null;
        List<Login> metodo = new ArrayList<Login>();
        
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(SQL_SELECT);
            rs = stmt.executeQuery();
            while(rs.next()){
                String id = rs.getString("id_usuario");
                String nombre = rs.getString("nombre_usuario");
                String contra = rs.getString("contraseña_usuario");
                String tipo = rs.getString("tipo_usuario");
                String estado = rs.getString("estado_usuario");
                
                login = new Login();
                login.setId(id);
                login.setUsuario(nombre);
                login.setContraseña(contra);
                login.setTipo(tipo);
                login.setEstado(estado);
                
                
                metodo.add(login);
            }
            
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        }
        finally{
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        
        return metodo;
    }
    public int delete(Login login){
        Connection conn = null;
        PreparedStatement stmt = null;
        int rows = 0;
        try {
            conn = Conexion.getConnection();
            //System.out.println("Ejecutando query:" + SQL_DELETE);
            stmt = conn.prepareStatement(SQL_DELETE);
            stmt.setString(1, login.getId());
            rows = stmt.executeUpdate();
            //System.out.println("Registros eliminados:" + rows);
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }

        return rows;
    } 
}
