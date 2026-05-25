package controlador;

import dao.UsuarioDAO;
import modelo.Usuario;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String clave = request.getParameter("clave");

        UsuarioDAO dao = new UsuarioDAO();

        Usuario u = dao.login(email, clave);

        if (u != null) {

            HttpSession session = request.getSession();
            session.setAttribute("usuario", u);

            response.sendRedirect("catalogo");

        } else {

            response.sendRedirect("login.jsp?error=1");
        }
    }
}
