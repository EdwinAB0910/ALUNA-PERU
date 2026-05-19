<%-- 
    Document   : Consultas
    Created on : 6 may. 2026, 09:55:59
    Author     : EDWIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>ALUNA PERÚ - CONSULTAS</title>
        <link rel="icon" href="img/LogoAluna.png" type="image/png">

        <script src="https://cdn.tailwindcss.com"></script>

        <script>
            tailwind.config = {
                darkMode: 'class'
            }
        </script>

        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">


    </script>
</head>

<body class="bg-gray-100 dark:bg-gray-900 dark:text-white font-serif min-h-screen flex flex-col">

    <!-- HEADER -->
    <header class="flex flex-col md:flex-row items-center justify-between border-b-4 border-green-300 px-8 py-4 bg-green-900">

        <div class="flex items-center gap-3">
            <img src="img/LogoAluna.png" alt="Logo" class="w-20">
            <h1
                class="text-2xl font-semibold bg-gradient-to-r from-green-200 to-gray-300 bg-clip-text text-transparent">
                ALUNA
            </h1>
        </div>

        <nav class="flex flex-wrap justify-center gap-6 mt-4 md:mt-0">
            <a href="${pageContext.request.contextPath}/inicio"
               class="bg-gradient-to-r from-cyan-200 to-white bg-clip-text text-transparent hover:scale-105 transition">
                Inicio
            </a>

            <a href="${pageContext.request.contextPath}/catalogo"
               class="bg-gradient-to-r from-cyan-200 to-white bg-clip-text text-transparent hover:scale-105 transition">
                Catálogo
            </a>

            <a href="${pageContext.request.contextPath}/consultas"
               class="bg-gradient-to-r from-cyan-200 to-white bg-clip-text text-transparent hover:scale-105 transition">
                Consultas
            </a>

            <a href="${pageContext.request.contextPath}/ubicacion"
               class="bg-gradient-to-r from-cyan-200 to-white bg-clip-text text-transparent hover:scale-105 transition">
                Ubicación
            </a>
        </nav>

        <button onclick="document.documentElement.classList.toggle('dark')"
                class="text-white text-lg hover:scale-110 transition">
            🌙 / ☀️
        </button>

    </header>

    <!-- MAIN -->
    <main class="flex-1 max-w-6xl mx-auto px-6 py-12">

        <h2 class="text-center text-4xl font-bold text-green-900 mb-4">
            Centro de Ayuda
        </h2>

        <p class="text-center text-gray-600 max-w-2xl mx-auto mb-12">
            ¿Tienes algún problema con tu pedido o alguna sugerencia?
            Estamos aquí para escucharte.
        </p>

        <section class="grid md:grid-cols-2 gap-8">

            <!-- CARD CONTACTO -->
            <div
                class="bg-gradient-to-br from-green-100 via-slate-100 to-cyan-100 dark:from-gray-800 dark:via-gray-700 dark:to-gray-900 p-8 rounded-2xl shadow-xl text-center hover:-translate-y-2 transition duration-300 border border-white/40">

                <div class="flex justify-center gap-4 mb-5">
                    <i class="fab fa-whatsapp text-5xl text-green-500"></i>
                    <i class="fas fa-phone-alt text-4xl text-green-700"></i>
                </div>

                <h3 class="text-2xl font-bold text-gray-800 mb-3">
                    Comunícate con nosotros
                </h3>

                <p class="text-lg text-gray-900">967203776</p>

                <small class="text-gray-500">
                    Lunes a Domingo: 8:00 a.m. - 7:30 p.m.
                </small>
            </div>

            <!-- CARD EMAIL -->
            <div
                class="bg-gradient-to-br from-green-100 via-slate-100 to-cyan-100 dark:from-gray-800 dark:via-gray-700 dark:to-gray-900 p-8 rounded-2xl shadow-xl text-center hover:-translate-y-2 transition duration-300 border border-white/40">

                <i class="fas fa-envelope-open-text text-5xl text-green-700 mb-5"></i>

                <h3 class="text-2xl font-bold text-gray-800 mb-3">
                    Escríbenos
                </h3>

                <p class="text-lg text-gray-900">
                    alunaperueirl@gmail.com
                </p>

                <small class="text-gray-500">
                    Respondemos en menos de 2 hrs
                </small>
            </div>

        </section>
    </main>

    <!-- FOOTER -->
    <footer class="bg-gradient-to-br from-green-800 to-green-950 text-white py-8 border-t-4 border-green-300">

        <div class="flex flex-col items-center text-center">

            <p class="text-sm opacity-80">ALUNA © 2026</p>

            <div class="flex justify-center gap-4 mt-4">

                <a href="https://www.facebook.com/share/1GKdJh27SV/" target="_blank" rel="noopener noreferrer">
                    <img src="https://www.svgrepo.com/show/475647/facebook-color.svg"
                         class="w-6 hover:scale-125 transition duration-300">
                </a>

                <a href="https://instagram.com/alunaperu_" target="_blank" rel="noopener noreferrer">
                    <img src="https://www.svgrepo.com/show/452229/instagram-1.svg"
                         class="w-6 hover:scale-125 transition duration-300">
                </a>

                <a href="https://www.tiktok.com/@alunaperu_" target="_blank" rel="noopener noreferrer">
                    <img src="https://www.svgrepo.com/show/303260/tiktok-logo-logo.svg"
                         class="w-6 hover:scale-125 transition duration-300">
                </a>

            </div>
        </div>
    </footer>

    <!-- BOTÓN WHATSAPP -->
    <div class="fixed bottom-8 right-5 z-50">
        <a href="https://wa.me/51967203776" target="_blank"
           class="fixed bottom-8 right-5 bg-green-400 p-4 rounded-full shadow-xl hover:scale-110 transition">
            <img src="https://cdn-icons-png.flaticon.com/512/733/733585.png"
                 alt="WhatsApp" class="w-8 h-8">
        </a>
    </div>

</body>
</html>


