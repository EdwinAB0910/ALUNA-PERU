<%-- 
    Document   : historial
    Created on : 2 jul 2026, 22:16:11
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>

<%
    List<Map<String, Object>> pedidos
            = (List<Map<String, Object>>) request.getAttribute("pedidos");
%>

<!DOCTYPE html>
<html>
    <head>

        <meta charset="UTF-8">

        <title>Historial de Compras | ALUNA</title>

        <script src="https://cdn.tailwindcss.com"></script>

        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

        <style>

            body{

                font-family:'Poppins',sans-serif;

                background-image:url("https://i.pinimg.com/736x/4f/c9/a2/4fc9a21f9d9acb3523532f88e5161391.jpg");

                background-size:cover;

                background-position:center;

                background-attachment:fixed;

            }

            .fondo{

                background:rgba(255,255,255,.78);

                backdrop-filter:blur(12px);

            }

            .card{

                transition:.35s;

            }

            .card:hover{

                transform:translateY(-6px) scale(1.01);

                box-shadow:0 25px 50px rgba(0,0,0,.18);

            }

        </style>

    </head>

    <body>

        <div class="min-h-screen bg-black/30">

            <div class="max-w-6xl mx-auto py-12 px-5">

                <div class="fondo rounded-3xl shadow-2xl p-10">

                    <h1 class="text-5xl font-bold text-center text-green-700">

                        🌿 Historial de Compras

                    </h1>

                    <p class="text-center text-gray-600 mt-3 mb-10">

                        Consulta todos los pedidos realizados en ALUNA PERÚ

                    </p>

                    <%
                        if (pedidos == null || pedidos.isEmpty()) {

                    %>

                    <div class="bg-white rounded-3xl shadow-xl p-12 text-center">

                        <div class="text-7xl mb-5">

                            🛒

                        </div>

                        <h2 class="text-3xl font-bold text-gray-700">

                            Aún no tienes compras

                        </h2>

                        <p class="text-gray-500 mt-4">

                            Cuando realices tu primera compra aparecerá aquí.

                        </p>

                        <a href="catalogo"

                           class="inline-block mt-8 bg-green-600 hover:bg-green-700 text-white px-8 py-4 rounded-xl text-lg">

                            Ir al catálogo

                        </a>

                    </div>

                    <%} else {

                    %>

                    <div class="space-y-8">

                        <%    for (Map<String, Object> p : pedidos) {

                                String estado = String.valueOf(p.get("estado"));

                        %>

                        <div class="card bg-white rounded-3xl shadow-xl overflow-hidden">

                            <div class="bg-gradient-to-r from-green-700 to-emerald-500 text-white p-6">

                                <div class="flex justify-between">

                                    <div>

                                        <h2 class="text-2xl font-bold">

                                            Pedido #<%=p.get("idPedido")%>

                                        </h2>

                                        <p class="opacity-90 mt-2">

                                            Fecha:

                                            <%=p.get("fecha")%>

                                        </p>

                                    </div>

                                    <div class="text-right">

                                        <p class="text-3xl font-bold">

                                            S/. <%=p.get("total")%>

                                        </p>

                                        <%

                                            if ("PENDIENTE".equals(estado)) {

                                        %>

                                        <span class="inline-block mt-3 bg-yellow-300 text-yellow-900 px-4 py-2 rounded-full font-semibold">

                                            ⏳ Pendiente

                                        </span>

                                        <%} else if ("ENTREGADO".equals(estado)) {

                                        %>

                                        <span class="inline-block mt-3 bg-green-200 text-green-800 px-4 py-2 rounded-full font-semibold">

                                            ✅ Entregado

                                        </span>

                                        <%} else {

                                        %>

                                        <span class="inline-block mt-3 bg-blue-200 text-blue-800 px-4 py-2 rounded-full font-semibold">

                                            <%=estado%>

                                        </span>

                                        <%

                                            }

                                        %>

                                    </div>

                                </div>

                            </div>

                            <div class="p-7">

                                <div class="grid md:grid-cols-2 gap-6">

                                    <div>

                                        <h3 class="font-bold text-green-700 mb-3">

                                            📍 Información de entrega

                                        </h3>

                                        <p class="mb-2">

                                            <b>Dirección:</b>

                                            <%=p.get("direccion")%>

                                        </p>

                                        <p class="mb-2">

                                            <b>Teléfono:</b>

                                            <%=p.get("telefono")%>

                                        </p>

                                        <p>

                                            <b>Método de pago:</b>

                                            <%=p.get("metodoPago")%>

                                        </p>

                                    </div>

                                    <div>

                                        <h3 class="font-bold text-green-700 mb-3">

                                            🚚 Estado del pedido

                                        </h3>

                                        <div class="w-full bg-gray-200 rounded-full h-4">

                                            <%

                                                if ("PENDIENTE".equals(estado)) {

                                            %>

                                            <div class="bg-yellow-500 h-4 rounded-full w-1/2"></div>

                                            <%} else if ("ENTREGADO".equals(estado)) {

                                            %>

                                            <div class="bg-green-600 h-4 rounded-full w-full"></div>

                                            <%} else {

                                            %>

                                            <div class="bg-blue-600 h-4 rounded-full w-3/4"></div>

                                            <%    }

                                            %>

                                        </div>

                                        <p class="mt-3 text-gray-600">

                                            Tu pedido se encuentra en estado

                                            <b><%=estado%></b>

                                        </p>

                                    </div>

                                </div>

                            </div>

                        </div>

                        <%

                            }

                        %>

                    </div>

                    <%    }

                    %>

                    <div class="text-center mt-12">

                        <a href="catalogo"

                           class="bg-green-700 hover:bg-green-800 text-white px-10 py-4 rounded-xl shadow-xl text-lg">

                            🌱 Volver al catálogo

                        </a>

                    </div>

                </div>

            </div>

        </div>

    </body>

</html>