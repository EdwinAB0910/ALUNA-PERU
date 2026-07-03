<%-- 
    Document   : estadoPedido
    Created on : 2 jul 2026, 20:11:23
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Estado del Pedido - ALUNA</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100 flex justify-center items-center min-h-screen">

<div class="bg-white shadow-2xl rounded-3xl p-10 w-[700px]">

    <h1 class="text-4xl font-bold text-center text-green-700 mb-6">
        🌿 Pedido confirmado
    </h1>

    <p class="text-center text-gray-500 mb-10">
        Tu pedido está siendo procesado en ALUNA PERÚ
    </p>

    <!-- PROGRESO -->
    <div class="relative mb-10">

        <!-- línea base -->
        <div class="absolute top-5 left-8 right-8 h-1 bg-gray-300"></div>

        <!-- línea progreso -->
        <div id="barra"
             class="absolute top-5 left-8 h-1 bg-green-600 transition-all duration-1000"
             style="width:0%">
        </div>

        <div class="flex justify-between relative">

            <div class="text-center">
                <div id="c1" class="w-10 h-10 rounded-full bg-yellow-500 mx-auto"></div>
                <p class="mt-2 font-bold">Preparación</p>
            </div>

            <div class="text-center">
                <div id="c2" class="w-10 h-10 rounded-full bg-gray-300 mx-auto"></div>
                <p class="mt-2">En camino</p>
            </div>

            <div class="text-center">
                <div id="c3" class="w-10 h-10 rounded-full bg-gray-300 mx-auto"></div>
                <p class="mt-2">Entregado</p>
            </div>

        </div>
    </div>

    <!-- MENSAJE -->
    <h2 id="mensaje"
        class="text-center text-2xl font-bold text-green-700">
        Preparando tu pedido...
    </h2>

    <!-- BOTÓN -->
    <div class="text-center mt-10">
        <a href="catalogo"
           class="bg-green-600 text-white px-8 py-3 rounded-xl hover:bg-green-700">
            Volver al catálogo
        </a>
    </div>

</div>

<!-- SIMULACIÓN DE ESTADOS -->
<script>

    setTimeout(() => {

        document.getElementById("barra").style.width = "50%";
        document.getElementById("c2").classList.remove("bg-gray-300");
        document.getElementById("c2").classList.add("bg-blue-500");

        document.getElementById("mensaje").innerText =
            "Tu pedido está en camino 🚚";

    }, 4000);

    setTimeout(() => {

        document.getElementById("barra").style.width = "100%";
        document.getElementById("c3").classList.remove("bg-gray-300");
        document.getElementById("c3").classList.add("bg-green-600");

        document.getElementById("mensaje").innerText =
            "Pedido entregado ✅";

    }, 8000);

</script>

</body>
</html>