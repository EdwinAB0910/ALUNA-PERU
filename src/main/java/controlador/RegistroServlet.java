package controlador;

import dao.UsuarioDAO;
import modelo.Usuario;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/RegistroServlet")
public class RegistroServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nombres = request.getParameter("nombres");
        String apellidos = request.getParameter("apellidos");
        String email = request.getParameter("email");
        String clave = request.getParameter("clave");

        Usuario u = new Usuario();

        u.setNombres(nombres);
        u.setApellidos(apellidos);
        u.setEmail(email);
        u.setClave(clave);

        
        u.setIdRol(2);

        UsuarioDAO dao = new UsuarioDAO();

        if (dao.registrar(u)) {

            response.sendRedirect("catalogo");

        } else {

            response.sendRedirect("register.jsp?error=1");
        }
    }
}