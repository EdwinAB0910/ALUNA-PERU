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
            session.setAttribute("idUsuario", u.getIdUsuario());
            session.setAttribute("rol", u.getIdRol());

            session.removeAttribute("errorLogin");

            // =======================================================
            // REDIRECCIÓN SEGÚN EL ROL REAL DE LA BASE DE DATOS
            // =======================================================
            if (u.getIdRol() == 1) {
                // Si es Admin (idRol 1), lo mandamos a su panel de gestión
                // Nota: Asegúrate de que la ruta coincida con tu carpeta/servlet de administración (ej: "admin/dashboard.jsp" o "admin")
                response.sendRedirect("admin/dashboard.jsp"); 
            } else {
                // Si es Cliente (idRol 2) o cualquier otro, va al inicio de la tienda
                response.sendRedirect("inicio");
            }

        } else {
            HttpSession session = request.getSession();
            session.setAttribute("errorLogin", "Usuario o contraseña incorrectos");
            
            // Si falla, regresa a la página donde está tu formulario de login
            response.sendRedirect("inicio"); 
        }
    }
}
