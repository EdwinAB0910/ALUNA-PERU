package dao;

import java.sql.*;

public class PedidoDAO {

    private Connection con;

    public PedidoDAO(Connection con) {
        this.con = con;
    }

    // Buscar carrito activo
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

    // Crear carrito
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

    // Confirmar compra
    public void confirmarPedido(int idPedido, double total) throws SQLException {
        String sql = "UPDATE pedido SET total=?, estado='PENDIENTE' WHERE idPedido=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setDouble(1, total);
        ps.setInt(2, idPedido);

        ps.executeUpdate();
    }

}
