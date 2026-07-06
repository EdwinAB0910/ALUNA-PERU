
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

        // Forzamos la búsqueda usando LOWER() para evitar problemas de mayúsculas en la nube
        String sql = "SELECT * FROM usuario WHERE LOWER(email) = LOWER(?) AND clave = ?";

        try (Connection con = Conexion.getConexion()) {

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, email.trim()); // .trim() elimina espacios vacíos accidentales
            ps.setString(2, clave);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                u = new Usuario();

                u.setIdUsuario(rs.getInt("idUsuario"));
                u.setNombres(rs.getString("nombres"));
                u.setApellidos(rs.getString("apellidos"));
                u.setEmail(rs.getString("email")); // Si tu columna es 'correo', cambia esto a "correo"
                u.setIdRol(rs.getInt("idRol"));
            }

            rs.close();
            ps.close();

        } catch (Exception e) {
            System.out.println("Error login en la nube: " + e.getMessage());
            e.printStackTrace();
        }

        return u;
    }
}
