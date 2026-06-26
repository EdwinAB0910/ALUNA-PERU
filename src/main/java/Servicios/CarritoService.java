package Servicios;

import dao.PlantaDAO;
import dao.DetallePedidoDAO;
import dao.PedidoDAO;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class CarritoService {

    private PedidoDAO pedidoDAO;
    private DetallePedidoDAO detalleDAO;
    private PlantaDAO plantaDAO;
    private CorreoService correoService;

    public CarritoService(Connection con) {
        this.pedidoDAO = new PedidoDAO(con);
        this.detalleDAO = new DetallePedidoDAO(con);
        this.plantaDAO = new PlantaDAO();
        this.correoService = new CorreoService();
    }

    // Obtener carrito
    public int obtenerCarrito(int idUsuario) throws Exception {

        return pedidoDAO.obtenerCarritoId(idUsuario);
    }

    // Agregar producto
    public void agregar(
            int idUsuario,
            int idProducto,
            int cantidad,
            double precio) throws Exception {

        int idPedido = pedidoDAO.obtenerCarritoId(idUsuario);

        if (idPedido == -1) {
            idPedido = pedidoDAO.crearCarrito(idUsuario);
        }

        detalleDAO.agregarProducto(
                idPedido,
                idProducto,
                cantidad,
                precio
        );
    }

    // Ver carrito
    public List<Map<String, Object>> verCarrito(int idUsuario) throws Exception {

        int idPedido = pedidoDAO.obtenerCarritoId(idUsuario);

        if (idPedido == -1) {
            return new ArrayList<>();
        }

        return detalleDAO.listarCarrito(idPedido);
    }

    // Total
    public double total(int idUsuario) throws Exception {

        int idPedido = pedidoDAO.obtenerCarritoId(idUsuario);

        if (idPedido == -1) {
            return 0;
        }

        return detalleDAO.obtenerTotal(idPedido);
    }

    public void checkout(
            int idUsuario,
            String direccion,
            String referencia,
            String telefono,
            String observaciones,
            String metodoPago,
            String departamento,
            String provincia,
            String distrito)
            throws Exception {

        int idPedido = obtenerCarrito(idUsuario);

        double total = detalleDAO.obtenerTotal(idPedido);

        pedidoDAO.confirmarPedido(
                idPedido,
                total,
                direccion,
                referencia,
                telefono,
                observaciones,
                metodoPago,
                departamento,
                provincia,
                distrito
        );

        List<Map<String, Object>> carrito = detalleDAO.listarCarrito(idPedido);

        for (Map<String, Object> item : carrito) {

            int idProducto = (Integer) item.get("idProducto");
            int cantidad = (Integer) item.get("cantidad");

            // Descontar stock
            plantaDAO.actualizarStock(idProducto, cantidad);

            // Consultar el stock restante
            int stock = plantaDAO.obtenerStock(idProducto);

            // Si queda 1 o menos, enviar correo
            if (stock <= 1) {

                String nombre = item.get("nombre").toString();

                correoService.enviar(
                        "propietaria@gmail.com",
                        "⚠ Alerta de stock bajo",
                        "La planta \"" + nombre + "\" tiene un stock restante de "
                        + stock + " unidad(es).\n\n"
                        + "Se recomienda reabastecer el inventario."
                );
            }
        }

        // Finalmente vaciar el carrito
        detalleDAO.vaciarCarrito(idPedido);
    }

    // Eliminar producto
    public void eliminar(
            int idUsuario,
            int idProducto) throws Exception {

        int idPedido = obtenerCarrito(idUsuario);

        detalleDAO.eliminarProducto(
                idPedido,
                idProducto
        );
    }

    // Vaciar carrito
    public void vaciarCarrito(int idUsuario)
            throws Exception {

        int idPedido = obtenerCarrito(idUsuario);

        detalleDAO.vaciarCarrito(idPedido);
    }
}
