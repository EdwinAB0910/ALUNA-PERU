package dao;

import java.sql.*;
import java.util.*;

public class DetallePedidoDAO {

    private Connection con;

    public DetallePedidoDAO(Connection con) {
        this.con = con;
    }

    // Agregar producto
    public void agregarProducto(int idPedido, int idProducto, int cantidad, double precio) throws SQLException {

        // verificar si existe
        String check = "SELECT * FROM detalle_pedido WHERE idPedido=? AND idProducto=?";
        PreparedStatement ps = con.prepareStatement(check);
        ps.setInt(1, idPedido);
        ps.setInt(2, idProducto);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            // actualizar cantidad
            String update = "UPDATE detalle_pedido SET cantidad=cantidad+? WHERE idPedido=? AND idProducto=?";
            PreparedStatement ps2 = con.prepareStatement(update);
            ps2.setInt(1, cantidad);
            ps2.setInt(2, idPedido);
            ps2.setInt(3, idProducto);
            ps2.executeUpdate();
        } else {
            String insert = "INSERT INTO detalle_pedido(idPedido,idProducto,cantidad,precio) VALUES (?,?,?,?)";
            PreparedStatement ps2 = con.prepareStatement(insert);
            ps2.setInt(1, idPedido);
            ps2.setInt(2, idProducto);
            ps2.setInt(3, cantidad);
            ps2.setDouble(4, precio);
            ps2.executeUpdate();
        }
    }

    // Listar carrito
    public List<Map<String, Object>> listarCarrito(int idPedido) throws SQLException {

        String sql
                = "SELECT dp.idDetalle, dp.idPedido, dp.idProducto, "
                + "dp.cantidad, dp.precio, p.nombre "
                + "FROM detalle_pedido dp "
                + "INNER JOIN producto p ON p.idProducto = dp.idProducto "
                + "WHERE dp.idPedido = ?";

        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, idPedido);

        ResultSet rs = ps.executeQuery();

        List<Map<String, Object>> lista = new ArrayList<>();

        while (rs.next()) {

            Map<String, Object> item = new HashMap<>();

            item.put("idProducto", rs.getInt("idProducto"));
            item.put("nombre", rs.getString("nombre"));
            item.put("cantidad", rs.getInt("cantidad"));
            item.put("precio", rs.getDouble("precio"));
            item.put(
                    "subtotal",
                    rs.getInt("cantidad") * rs.getDouble("precio")
            );

            lista.add(item);
        }

        return lista;
    }

    // Total carrito
    public double obtenerTotal(int idPedido) throws SQLException {
        String sql = "SELECT SUM(cantidad * precio) AS total FROM detalle_pedido WHERE idPedido=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, idPedido);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            return rs.getDouble("total");
        }
        return 0;
    }

    // Eliminar producto
    public void eliminarProducto(int idPedido, int idProducto) throws SQLException {
        String sql = "DELETE FROM detalle_pedido WHERE idPedido=? AND idProducto=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, idPedido);
        ps.setInt(2, idProducto);
        ps.executeUpdate();
    }

    // Vaciar carrito
    public void vaciarCarrito(int idPedido) throws SQLException {
        String sql = "DELETE FROM detalle_pedido WHERE idPedido=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, idPedido);
        ps.executeUpdate();
    }
}
