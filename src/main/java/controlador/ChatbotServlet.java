package controlador;

import Servicios.IAService;

import java.io.IOException;
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

        System.out.println("MENSAJE RECIBIDO = " + mensaje);

        String respuesta = ia.preguntar(mensaje);

        System.out.println("RESPUESTA IA = " + respuesta);

        resp.setContentType("text/plain;charset=UTF-8");
        resp.getWriter().print(respuesta);
    }
}
