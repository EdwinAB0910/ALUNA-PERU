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

            PreparedStatement ps
                    = con.prepareStatement(sql);

            ResultSet rs
                    = ps.executeQuery();

            while (rs.next()) {

                Planta p = new Planta();

                p.setId(
                        rs.getInt("idProducto")
                );

                p.setNombre(
                        rs.getString("nombre")
                );

                p.setPrecio(
                        rs.getDouble("precio")
                );

                p.setStock(
                        rs.getInt("stock")
                );

                p.setIdCategoria(
                        rs.getInt("idCategoria")
                );

                p.setDescripcion(
                        rs.getString("descripcion")
                );

                p.setImagen(
                        rs.getString("imagen")
                );

                lista.add(p);

            }

        } catch (Exception e) {

            e.printStackTrace();

        }

        return lista;

    }

    // ELIMINAR PRODUCTO/PLANTA
    public void eliminar(int id) {

        String sql
                = "DELETE FROM producto WHERE idProducto=?";

        try {

            Connection con
                    = Conexion.getConexion();

            PreparedStatement ps
                    = con.prepareStatement(sql);

            ps.setInt(1, id);

            ps.executeUpdate();

        } catch (Exception e) {

            e.printStackTrace();

        }

    }

    // AGREGAR PLANTA
    public void agregar(Planta p) {

        String sql
                = "INSERT INTO producto(nombre,precio,stock,idCategoria,descripcion,imagen)"
                + " VALUES(?,?,?,?,?,?)";

        try {

            Connection con
                    = Conexion.getConexion();

            PreparedStatement ps
                    = con.prepareStatement(sql);

            ps.setString(1, p.getNombre());

            ps.setDouble(2, p.getPrecio());

            ps.setInt(3, p.getStock());

            ps.setInt(4, p.getIdCategoria());

            ps.setString(5, p.getDescripcion());

            ps.setString(6, p.getImagen());

            ps.executeUpdate();

        } catch (Exception e) {

            e.printStackTrace();

        }

    }
// BUSCAR PLANTA POR ID

    public Planta buscar(int id) {

        Planta p = null;

        String sql
                = "SELECT * FROM producto WHERE idProducto=?";

        try {

            Connection con
                    = Conexion.getConexion();

            PreparedStatement ps
                    = con.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs
                    = ps.executeQuery();

            if (rs.next()) {

                p = new Planta();

                p.setId(
                        rs.getInt("idProducto")
                );

                p.setNombre(
                        rs.getString("nombre")
                );

                p.setPrecio(
                        rs.getDouble("precio")
                );

                p.setStock(
                        rs.getInt("stock")
                );

                p.setIdCategoria(
                        rs.getInt("idCategoria")
                );

                p.setDescripcion(
                        rs.getString("descripcion")
                );

                p.setImagen(
                        rs.getString("imagen")
                );

            }

        } catch (Exception e) {

            e.printStackTrace();

        }

        return p;

    }

// ACTUALIZAR PLANTA
    public void actualizar(Planta p) {

        String sql
                = "UPDATE producto SET nombre=?,descripcion=?,precio=?,stock=?,imagen=? WHERE idProducto=?";

        try {

            Connection con
                    = Conexion.getConexion();

            PreparedStatement ps
                    = con.prepareStatement(sql);

            ps.setString(1, p.getNombre());

            ps.setString(2, p.getDescripcion());

            ps.setDouble(3, p.getPrecio());

            ps.setInt(4, p.getStock());

            ps.setString(5, p.getImagen());

            ps.setInt(6, p.getId());

            ps.executeUpdate();

        } catch (Exception e) {

            e.printStackTrace();

        }

    }

    public int obtenerStock(int idProducto) throws Exception {
        // Corregido: de 'planta' a 'producto' y de 'id' a 'idProducto'
        String sql = "SELECT stock FROM producto WHERE idProducto = ?";

        Connection con = Conexion.getConexion();
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, idProducto);

        ResultSet rs = ps.executeQuery();
        int stock = 0;

        if (rs.next()) {
            stock = rs.getInt("stock");
        }

        rs.close();
        ps.close();

        return stock;
    }

    public void actualizarStock(int idProducto, int cantidad) throws Exception {
        // Corregido: de 'planta' a 'producto' y de 'id' a 'idProducto'
        String sql = "UPDATE producto SET stock = stock - ? WHERE idProducto = ?";

        Connection con = Conexion.getConexion();
        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, cantidad);
        ps.setInt(2, idProducto);

        ps.executeUpdate();
        ps.close();
    }

}
