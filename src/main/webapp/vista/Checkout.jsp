<%-- 
    Document   : Checkout
    Created on : 2 jun. 2026, 16:26:41
    Author     : EDWIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    modelo.Usuario u = (modelo.Usuario) session.getAttribute("usuario");

    if (u == null) {
        response.sendRedirect("inicio");
        return;
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Checkout</title>
    </head>
    <body>

        <h2>Finalizar compra</h2>

        <form action="${pageContext.request.contextPath}/CarritoServlet" method="post">

            <input type="hidden" name="accion" value="finalizarCompra">

            <label>Dirección:</label><br>
            <input type="text" name="direccion" required><br><br>

            <label>Referencia:</label><br>
            <input type="text" name="referencia"><br><br>

            <label>Método de pago:</label><br>
            <select name="metodoPago" required>
                <option value="efectivo">Efectivo</option>
                <option value="yape">Yape</option>
                <option value="plin">Plin</option>
                <option value="tarjeta">Tarjeta</option>
            </select><br><br>

            <button type="submit">Confirmar pedido</button>

        </form>

    </body>
</html>