package controlador;

import Servicios.IAService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/chat")
public class ChatbotServlet extends HttpServlet {

    private IAService ia = new IAService();

    @Override
    protected void doPost(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String mensaje = req.getParameter("mensaje");

        HttpSession session = req.getSession();

        List<String> historial =
                (List<String>) session.getAttribute("historial");

        if (historial == null) {
            historial = new ArrayList<>();
        }

        // Guardar mensaje del usuario
        historial.add("Usuario: " + mensaje);

        // Mantener solo los últimos 10 mensajes
        if (historial.size() > 10) {
            historial.remove(0);
        }

        String respuesta = ia.preguntar(mensaje, historial);

        // Guardar respuesta del bot
        historial.add("ALUNABOT: " + respuesta);

        if (historial.size() > 10) {
            historial.remove(0);
        }

        session.setAttribute("historial", historial);

        resp.setContentType("text/plain;charset=UTF-8");
        resp.getWriter().print(respuesta);
    }
}