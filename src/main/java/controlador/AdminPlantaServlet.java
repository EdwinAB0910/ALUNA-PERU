package controlador;

import dao.PlantaDAO;
import modelo.Planta;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet({"/AdminPlantaServlet", "/admin"})
public class AdminPlantaServlet extends HttpServlet {

    PlantaDAO dao = new PlantaDAO();

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String ruta = request.getServletPath();

        if (ruta.equals("/admin")) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/AdminPlantaServlet?accion=listar"
            );

            return;
        }

        String accion = request.getParameter("accion");

        if (accion == null) {
            accion = "listar";
        }

        switch (accion) {

            case "listar":

                List<Planta> plantas = dao.listar();

                request.setAttribute(
                        "plantas",
                        plantas
                );

                request.getRequestDispatcher(
                        "/vista/adminPlantas.jsp"
                ).forward(request, response);

                break;

            case "eliminar":

                int id = Integer.parseInt(
                        request.getParameter("id")
                );

                dao.eliminar(id);

                response.sendRedirect(
                        "AdminPlantaServlet"
                );

                break;

            case "editar":

                int idEditar = Integer.parseInt(
                        request.getParameter("id")
                );

                Planta p = dao.buscar(idEditar);

                request.setAttribute(
                        "editar",
                        p
                );

                request.setAttribute(
                        "plantas",
                        dao.listar()
                );

                request.getRequestDispatcher(
                        "/vista/adminPlantas.jsp"
                ).forward(request, response);

                break;

        }

    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String accion
                = request.getParameter("accion");

        Planta p = new Planta();

        p.setNombre(
                request.getParameter("nombre")
        );

        p.setDescripcion(
                request.getParameter("descripcion")
        );

        p.setPrecio(
                Double.parseDouble(
                        request.getParameter("precio")
                )
        );

        p.setStock(
                Integer.parseInt(
                        request.getParameter("stock")
                )
        );

        p.setImagen(
                request.getParameter("imagen")
        );

        // CATEGORIA POR DEFECTO
        p.setIdCategoria(16);

        if ("agregar".equals(accion)) {

            dao.agregar(p);

        } else if ("editar".equals(accion)) {

            p.setId(
                    Integer.parseInt(
                            request.getParameter("id")
                    )
            );

            dao.actualizar(p);

        }

        response.sendRedirect(
                "AdminPlantaServlet"
        );

    }

}
