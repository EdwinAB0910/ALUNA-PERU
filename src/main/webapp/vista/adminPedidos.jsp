<%-- 
    Document   : adminPedidos
    Created on : 2 jul 2026, 23:40:49
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>

<%
    modelo.Usuario usuario =
            (modelo.Usuario) session.getAttribute("usuario");

    if (usuario == null) {
        response.sendRedirect(request.getContextPath() + "/inicio");
        return;
    }

    if (usuario.getIdRol() != 1) {
        response.sendRedirect(request.getContextPath() + "/inicio");
        return;
    }

    List<Map<String,Object>> pedidos =
            (List<Map<String,Object>>) request.getAttribute("pedidos");
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Administrar Pedidos - ALUNA</title>

    <script src="https://cdn.tailwindcss.com"></script>

</head>

<body class="bg-gradient-to-br from-green-100 via-white to-cyan-100 min-h-screen">

<!-- HEADER -->

<header class="bg-gradient-to-r from-green-900 to-green-700 text-white px-10 py-5 shadow-xl flex justify-between">

    <div>

        <h1 class="text-3xl font-bold">
            📦 Gestión de Pedidos
        </h1>

        <p class="text-green-200">
            ALUNA PERÚ - Panel Administrativo
        </p>

    </div>

    <div class="text-right">

        <p class="font-bold">
            Administrador
        </p>

        <p>
            <%= usuario.getNombres() %>
        </p>

    </div>

</header>

<!-- CONTENIDO -->

<div class="max-w-7xl mx-auto mt-10">

    <div class="bg-white rounded-3xl shadow-2xl p-8">

        <div class="flex justify-between mb-8">

            <h2 class="text-3xl font-bold text-green-700">

                Todos los pedidos

            </h2>

            <a href="<%=request.getContextPath()%>/admin"
               class="bg-green-600 hover:bg-green-700 text-white px-6 py-3 rounded-xl">

                ← Volver

            </a>

        </div>

        <div class="overflow-x-auto">

            <table class="w-full border-collapse">

                <thead>

                <tr class="bg-green-700 text-white">

                    <th class="p-4">Pedido</th>

                    <th class="p-4">Cliente</th>

                    <th class="p-4">Fecha</th>

                    <th class="p-4">Total</th>

                    <th class="p-4">Estado</th>

                    <th class="p-4">Acción</th>

                </tr>

                </thead>

                <tbody>

                <%

                    if(pedidos != null){

                        for(Map<String,Object> p : pedidos){

                %>

                <tr class="border-b hover:bg-green-50 text-center">

                    <td class="p-4">

                        #<%= p.get("idPedido") %>

                    </td>

                    <td class="p-4">

                        <%= p.get("nombre") %>

                    </td>

                    <td class="p-4">

                        <%= p.get("fecha") %>

                    </td>

                    <td class="p-4 font-bold text-green-700">

                        S/ <%= p.get("total") %>

                    </td>

                    <td class="p-4">

                        <%

                            String estado = p.get("estado").toString();

                            if(estado.equals("PENDIENTE")){
                        %>

                        <span class="bg-yellow-200 text-yellow-800 px-4 py-1 rounded-full">

                            PENDIENTE

                        </span>

                        <%
                            }else{
                        %>

                        <span class="bg-green-200 text-green-800 px-4 py-1 rounded-full">

                            ENTREGADO

                        </span>

                        <%
                            }
                        %>

                    </td>

                    <td class="p-4">

                        <%

                            if(estado.equals("PENDIENTE")){

                        %>

                        <form action="<%=request.getContextPath()%>/adminPedidos"
                              method="post">

                            <input type="hidden"
                                   name="idPedido"
                                   value="<%= p.get("idPedido") %>">

                            <input type="hidden"
                                   name="estado"
                                   value="ENTREGADO">

                            <button
                                class="bg-green-600 hover:bg-green-700 text-white px-5 py-2 rounded-xl">

                                ✔ Entregar

                            </button>

                        </form>

                        <%

                            }else{

                        %>

                        <span class="text-green-700 font-bold">

                            ✔ Completado

                        </span>

                        <%

                            }

                        %>

                    </td>

                </tr>

                <%

                        }

                    }

                %>

                </tbody>

            </table>

        </div>

    </div>

</div>

<footer class="mt-12 bg-green-900 text-white text-center py-4">

    ALUNA PERÚ © 2026

</footer>

</body>

</html>