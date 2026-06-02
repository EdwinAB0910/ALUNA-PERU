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

            // 🔥 IMPORTANTE: volver al catálogo, no a carrito.jsp
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

            if ("agregar".equals(accion)) {

                System.out.println("AGREGANDO PRODUCTO");

                int idProducto
                        = Integer.parseInt(req.getParameter("idProducto"));

                double precio
                        = Double.parseDouble(req.getParameter("precio"));

                int cantidad = Integer.parseInt(req.getParameter("cantidad"));

                service.agregar(
                        idUsuario,
                        idProducto,
                        cantidad,
                        precio
                );
            }

            if ("eliminar".equals(accion)) {

                int idProducto = Integer.parseInt(
                        req.getParameter("idProducto")
                );

                service.eliminar(idUsuario, idProducto);
            }

            if ("irCheckout".equals(accion)) {

                resp.sendRedirect(req.getContextPath() + "/vista/Checkout.jsp");
                return;
            }

            // 🔥 SIEMPRE REGRESA AL CATÁLOGO
            resp.sendRedirect("catalogo");

        } catch (Exception e) {
            e.printStackTrace();

            resp.setContentType("text/html;charset=UTF-8");
            resp.getWriter().println("ERROR: " + e.getMessage());
        }
    }
}
