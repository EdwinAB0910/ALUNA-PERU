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
        
        HttpSession session = request.getSession();

        if (u != null) {
            // Guardamos los datos en la sesión
            session.setAttribute("usuario", u);
            session.setAttribute("idUsuario", u.getIdUsuario());
            session.setAttribute("rol", u.getIdRol()); // Guardará 1 para Admin, 2 para Cliente

            session.removeAttribute("errorLogin");
            
            // Regresa a la página principal ya logueado
            response.sendRedirect("inicio");

        } else {
            session.setAttribute("errorLogin", "Usuario o contraseña incorrectos");
            response.sendRedirect("inicio");
        }
    }
}
