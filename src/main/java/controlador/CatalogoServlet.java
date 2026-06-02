package controlador;

import dao.PlantaDAO;
import modelo.Planta;
import Servicios.CarritoService;
import util.Conexion;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet("/catalogo")
public class CatalogoServlet extends HttpServlet {

    private CarritoService service;

    @Override
    public void init() {
        Connection con = Conexion.getConexion();
        service = new CarritoService(con);
    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        PlantaDAO dao = new PlantaDAO();
        List<Planta> lista = dao.listar();

        request.setAttribute("plantas", lista);

        HttpSession session = request.getSession(false);

        if (session != null && session.getAttribute("idUsuario") != null) {

            int idUsuario = (Integer) session.getAttribute("idUsuario");

            try {
                request.setAttribute("carrito", service.verCarrito(idUsuario));
                request.setAttribute("total", service.total(idUsuario));

            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("carrito", java.util.Collections.emptyList());
                request.setAttribute("total", 0.0);
            }

        } else {
            request.setAttribute("carrito", java.util.Collections.emptyList());
            request.setAttribute("total", 0.0);
        }

        request.getRequestDispatcher("vista/Catalogo.jsp")
                .forward(request, response);
    }

}
