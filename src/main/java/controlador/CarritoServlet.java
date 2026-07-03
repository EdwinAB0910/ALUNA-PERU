package controlador;

import Servicios.CarritoService;
import util.Conexion;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/CarritoServlet")
public class CarritoServlet extends HttpServlet {

    private CarritoService service;

    @Override
    public void init() throws ServletException {
        try {
            Connection con = Conexion.getConexion();

            if (con == null) {
                throw new RuntimeException("No se pudo establecer conexión con la base de datos");
            }

            service = new CarritoService(con);

        } catch (Exception e) {
            throw new ServletException("Error al inicializar CarritoServlet", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {

            HttpSession session = req.getSession(false);

            if (session == null || session.getAttribute("idUsuario") == null) {
                resp.sendRedirect("inicio");
                return;
            }

            int idUsuario = (Integer) session.getAttribute("idUsuario");

            req.setAttribute("carrito", service.verCarrito(idUsuario));
            req.setAttribute("total", service.total(idUsuario));

            req.getRequestDispatcher("catalogo").forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();

            resp.setContentType("text/html;charset=UTF-8");
            resp.getWriter().println("ERROR: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        try {

            String accion = req.getParameter("accion");

            HttpSession session = req.getSession(false);

            if (session == null || session.getAttribute("idUsuario") == null) {

                resp.setContentType("text/html;charset=UTF-8");
                resp.getWriter().println(
                        "<script>"
                        + "alert('Debes iniciar sesión o crear una cuenta');"
                        + "window.location='catalogo';"
                        + "</script>"
                );
                return;
            }

            int idUsuario = (Integer) session.getAttribute("idUsuario");

            // =========================
            // AGREGAR PRODUCTO
            // =========================
            if ("agregar".equals(accion)) {

                int idProducto = Integer.parseInt(req.getParameter("idProducto"));
                double precio = Double.parseDouble(req.getParameter("precio"));
                int cantidad = Integer.parseInt(req.getParameter("cantidad"));

                service.agregar(idUsuario, idProducto, cantidad, precio);
            }

            // =========================
            // ELIMINAR PRODUCTO
            // =========================
            if ("eliminar".equals(accion)) {

                int idProducto = Integer.parseInt(req.getParameter("idProducto"));

                service.eliminar(idUsuario, idProducto);
            }

            // =========================
            // FINALIZAR COMPRA
            // =========================
            if ("finalizarCompra".equals(accion)) {

                String direccion = req.getParameter("direccion");
                String referencia = req.getParameter("referencia");
                String telefono = req.getParameter("telefono");
                String observaciones = req.getParameter("observaciones");
                String metodoPago = req.getParameter("metodoPago");
                String departamento = req.getParameter("departamento");
                String provincia = req.getParameter("provincia");
                String distrito = req.getParameter("distrito");

                service.checkout(
                        idUsuario,
                        direccion,
                        referencia,
                        telefono,
                        observaciones,
                        metodoPago,
                        departamento,
                        provincia,
                        distrito
                );

                // ✔ FORWARD (CORRECTO EN TU PROYECTO MVC)
                req.getRequestDispatcher("/vista/estadoPedido.jsp")
                   .forward(req, resp);
                return;
            }

            // =========================
            // DEFAULT
            // =========================
            resp.sendRedirect("catalogo");

        } catch (Exception e) {
            e.printStackTrace();

            resp.setContentType("text/html;charset=UTF-8");
            resp.getWriter().println("ERROR: " + e.getMessage());
        }
    }
}