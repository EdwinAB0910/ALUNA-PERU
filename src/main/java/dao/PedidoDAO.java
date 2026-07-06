package dao;

import java.sql.*;
import java.util.*;

public class PedidoDAO {

    private Connection con;

    public PedidoDAO(Connection con) {
        this.con = con;
    }

    // =========================================
    // BUSCAR CARRITO ACTIVO
    // =========================================
    public int obtenerCarritoId(int idUsuario) throws SQLException {

        String sql = "SELECT idPedido FROM pedido WHERE idUsuario=? AND estado='CARRITO'";

        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, idUsuario);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            return rs.getInt("idPedido");
        }

        return -1;
    }

    // =========================================
    // CREAR CARRITO
    // =========================================
    public int crearCarrito(int idUsuario) throws SQLException {

        String sql = "INSERT INTO pedido(idUsuario, estado) VALUES (?, 'CARRITO')";

        PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        ps.setInt(1, idUsuario);

        ps.executeUpdate();

        ResultSet rs = ps.getGeneratedKeys();

        if (rs.next()) {
            return rs.getInt(1);
        }

        return -1;
    }

    // =========================================
    // CONFIRMAR PEDIDO (CHECKOUT SIMPLE)
    // =========================================
    public void confirmarPedido(int idPedido, double total) throws SQLException {

        String sql = "UPDATE pedido SET total=?, estado='PENDIENTE', fecha=NOW() WHERE idPedido=?";

        PreparedStatement ps = con.prepareStatement(sql);
        ps.setDouble(1, total);
        ps.setInt(2, idPedido);

        ps.executeUpdate();
    }

    // =========================================
    // CONFIRMAR PEDIDO CON DATOS DE ENVÍO
    // =========================================
    public void confirmarPedido(
            int idPedido,
            double total,
            String direccion,
            String referencia,
            String telefono,
            String observaciones,
            String metodoPago,
            String departamento,
            String provincia,
            String distrito
    ) throws SQLException {

        String sql
                = "UPDATE pedido SET "
                + "total=?, "
                + "estado='PENDIENTE', "
                + "fecha=NOW(), "
                + "direccion=?, "
                + "referencia=?, "
                + "telefono=?, "
                + "observaciones=?, "
                + "metodoPago=?, "
                + "departamento=?, "
                + "provincia=?, "
                + "distrito=? "
                + "WHERE idPedido=?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setDouble(1, total);
        ps.setString(2, direccion);
        ps.setString(3, referencia);
        ps.setString(4, telefono);
        ps.setString(5, observaciones);
        ps.setString(6, metodoPago);
        ps.setString(7, departamento);
        ps.setString(8, provincia);
        ps.setString(9, distrito);
        ps.setInt(10, idPedido);

        ps.executeUpdate();
    }

    // =========================================
    // HISTORIAL DE PEDIDOS POR USUARIO
    // =========================================
    public List<Map<String, Object>> listarPedidosPorUsuario(int idUsuario) throws SQLException {

        String sql
                = "SELECT idPedido, idUsuario, fecha, total, estado, "
                + "direccion, telefono, metodoPago "
                + "FROM pedido "
                + "WHERE idUsuario=? AND estado <> 'CARRITO' "
                + "ORDER BY idPedido DESC";

        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, idUsuario);

        ResultSet rs = ps.executeQuery();

        List<Map<String, Object>> lista = new ArrayList<>();

        while (rs.next()) {

            Map<String, Object> item = new HashMap<>();

            item.put("idPedido", rs.getInt("idPedido"));
            item.put("fecha", rs.getString("fecha"));
            item.put("total", rs.getDouble("total"));
            item.put("estado", rs.getString("estado"));
            item.put("direccion", rs.getString("direccion"));

            item.put("telefono", rs.getString("telefono"));
            item.put("metodoPago", rs.getString("metodoPago"));

            lista.add(item);
        }

        return lista;
    }
    // LISTAR TODOS LOS PEDIDOS (ADMIN)

    public List<Map<String, Object>> listarTodosPedidos() throws SQLException {

        String sql = "SELECT p.idPedido, p.idUsuario, u.nombres, p.fecha, p.total, p.estado "
                + "FROM pedido p "
                + "INNER JOIN usuario u ON u.idUsuario = p.idUsuario "
                + "WHERE p.estado != 'CARRITO' "
                + "ORDER BY p.idPedido DESC";

        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        List<Map<String, Object>> lista = new ArrayList<>();

        while (rs.next()) {
            Map<String, Object> item = new HashMap<>();

            item.put("idPedido", rs.getInt("idPedido"));
            item.put("idUsuario", rs.getInt("idUsuario"));
            item.put("nombre", rs.getString("nombres"));
            item.put("fecha", rs.getString("fecha"));
            item.put("total", rs.getDouble("total"));
            item.put("estado", rs.getString("estado"));

            lista.add(item);
        }

        return lista;
    }
    // =========================================
// CAMBIAR ESTADO DEL PEDIDO (ADMIN)
// =========================================

    public void cambiarEstado(int idPedido, String estado) throws SQLException {

        String sql = "UPDATE pedido SET estado=? WHERE idPedido=?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, estado);
        ps.setInt(2, idPedido);

        ps.executeUpdate();
    }
}
