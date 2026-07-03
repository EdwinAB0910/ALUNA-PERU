/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controlador;

import dao.PedidoDAO;
import util.Conexion;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/historial")
public class HistorialServlet extends HttpServlet {

    private PedidoDAO dao;

    @Override
    public void init() throws ServletException {
        dao = new PedidoDAO(Conexion.getConexion());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {

            resp.setContentType("text/html;charset=UTF-8");
            req.setCharacterEncoding("UTF-8");

            HttpSession session = req.getSession(false);

            if (session == null || session.getAttribute("idUsuario") == null) {
                resp.sendRedirect(req.getContextPath() + "/inicio");
                return;
            }

            int idUsuario = (Integer) session.getAttribute("idUsuario");

            req.setAttribute("pedidos",
                    dao.listarPedidosPorUsuario(idUsuario));

            req.getRequestDispatcher("/vista/historial.jsp")
                    .forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();

            resp.setContentType("text/html;charset=UTF-8");
            resp.getWriter().println("ERROR: " + e.getMessage());
        }
    }
}