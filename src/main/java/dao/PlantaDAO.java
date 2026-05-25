
package dao;

import modelo.Planta;
import util.Conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.util.List;

public class PlantaDAO {

    public List<Planta> listar() {

        List<Planta> lista = new ArrayList<>();

        String sql = "SELECT * FROM producto";

        try {

            Connection con = Conexion.getConexion();

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Planta p = new Planta();

                p.setId(rs.getInt("idProducto"));
                p.setNombre(rs.getString("nombre"));
                p.setPrecio(rs.getDouble("precio"));
                p.setStock(rs.getInt("stock"));
                p.setIdCategoria(rs.getInt("idCategoria"));
                p.setDescripcion(rs.getString("descripcion"));
                p.setImagen(rs.getString("imagen"));

                lista.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return lista;
    }
}
