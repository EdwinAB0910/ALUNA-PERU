
package dao;

import util.Conexion;
import modelo.Usuario;
import java.sql.*;

public class UsuarioDAO {
    public boolean registrar(Usuario u) {

        boolean estado = false;

        try (Connection con = Conexion.getConexion()) {

            String sql = "INSERT INTO usuario (nombres, apellidos, email, clave, idRol) VALUES (?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, u.getNombres());
            ps.setString(2, u.getApellidos());
            ps.setString(3, u.getEmail());
            ps.setString(4, u.getClave());
            ps.setInt(5, u.getIdRol());

            estado = ps.executeUpdate() > 0;

        } catch (Exception e) {
            System.out.println("Error registro: " + e.getMessage());
        }

        return estado;
    }
    
    public Usuario login(String email, String clave) {

        Usuario u = null;

        try (Connection con = Conexion.getConexion()) {

            String sql = "SELECT * FROM usuario WHERE email=? AND clave=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, clave);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                u = new Usuario();

                u.setIdUsuario(rs.getInt("idUsuario"));
                u.setNombres(rs.getString("nombres"));
                u.setApellidos(rs.getString("apellidos"));
                u.setEmail(rs.getString("email"));
                u.setIdRol(rs.getInt("idRol"));
            }

        } catch (Exception e) {
            System.out.println("Error login: " + e.getMessage());
        }

        return u;
    }
}
