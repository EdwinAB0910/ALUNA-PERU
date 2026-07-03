/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controlador;

import dao.PedidoDAO;
import modelo.Usuario;
import util.Conexion;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/adminPedidos")
public class AdminPedidosServlet extends HttpServlet {

    private PedidoDAO dao;

    @Override
    public void init() throws ServletException {

        dao = new PedidoDAO(Conexion.getConexion());

    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            response.setContentType("text/html;charset=UTF-8");

            HttpSession session = request.getSession(false);

            if (session == null || session.getAttribute("usuario") == null) {

                response.sendRedirect(request.getContextPath() + "/inicio");
                return;

            }

            Usuario usuario = (Usuario) session.getAttribute("usuario");

            // Solo administrador
            if (usuario.getIdRol() != 1) {

                response.sendRedirect(request.getContextPath() + "/inicio");
                return;

            }

            request.setAttribute(
                    "pedidos",
                    dao.listarTodosPedidos()
            );

            request.getRequestDispatcher("/vista/adminPedidos.jsp")
                    .forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("ERROR: " + e.getMessage());

        }

    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        try {

            HttpSession session = request.getSession(false);

            if (session == null || session.getAttribute("usuario") == null) {

                response.sendRedirect(request.getContextPath() + "/inicio");
                return;

            }

            Usuario usuario = (Usuario) session.getAttribute("usuario");

            // Solo administrador
            if (usuario.getIdRol() != 1) {

                response.sendRedirect(request.getContextPath() + "/inicio");
                return;

            }

            int idPedido = Integer.parseInt(
                    request.getParameter("idPedido")
            );

            String estado = request.getParameter("estado");

            dao.cambiarEstado(idPedido, estado);

            response.sendRedirect(
                    request.getContextPath() + "/adminPedidos"
            );

        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("ERROR: " + e.getMessage());

        }

    }

}
