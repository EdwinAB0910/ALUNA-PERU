<%-- 
    Document   : Ubicacion
    Created on : 6 may. 2026, 09:56:11
    Author     : EDWIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>ALUNA PERÚ - UBICACIÓN</title>

        <link rel="icon" href="img/LogoAluna.png" type="image/png">
        <script src="https://cdn.tailwindcss.com"></script>

        <script>
            tailwind.config = {
                darkMode: 'class'
            }
        </script>

        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    </head>

    <body class="bg-gray-200 dark:bg-gray-900 dark:text-white font-serif min-h-screen flex flex-col">

        <!-- HEADER -->
        <header class="bg-green-900 border-b-4 border-green-300 px-8 py-4 flex flex-col md:flex-row items-center justify-between gap-4">

            <div class="flex items-center gap-3">
                <img src="img/LogoAluna.png" alt="Logo" class="w-16">
                <h1
                    class="text-2xl font-semibold bg-gradient-to-r from-lime-200 to-gray-300 bg-clip-text text-transparent">
                    ALUNA
                </h1>
            </div>

            <nav class="flex gap-6 flex-wrap justify-center">
                <a href="${pageContext.request.contextPath}/inicio"
                   class="bg-gradient-to-r from-teal-200 to-white bg-clip-text text-transparent hover:scale-105 transition">
                    Inicio
                </a>
                <a href="${pageContext.request.contextPath}/catalogo"
                   class="bg-gradient-to-r from-teal-200 to-white bg-clip-text text-transparent hover:scale-105 transition">
                    Catálogo
                </a>
                <a href="${pageContext.request.contextPath}/consultas"
                   class="bg-gradient-to-r from-teal-200 to-white bg-clip-text text-transparent hover:scale-105 transition">
                    Consultas
                </a>
                <a href="${pageContext.request.contextPath}/ubicacion"
                   class="bg-gradient-to-r from-teal-200 to-white bg-clip-text text-transparent hover:scale-105 transition">
                    Ubicación
                </a>
            </nav>

            <button onclick="document.documentElement.classList.toggle('dark')"
                    class="text-white text-lg hover:scale-110 transition">
                🌙 / ☀️
            </button>
        </header>

        <!-- MAIN -->
        <main class="flex-1 max-w-5xl mx-auto px-5 py-10">

            <h2 class="text-center text-3xl md:text-4xl font-bold text-green-900 dark:text-green-300 uppercase mb-8">
                Encuéntranos
            </h2>

            <div
                class="rounded-3xl shadow-2xl p-8 md:p-10">

                <p class="text-center italic text-gray-600 dark:text-gray-300 mb-8">
                    "En el corazón de la Selva Central, donde la tradición se encuentra con la naturaleza."
                </p>

                <div class="flex items-start gap-3 mb-8">
                    <i class="fas fa-map-marker-alt text-green-600 text-xl mt-1"></i>
                    <span class="text-gray-700 dark:text-gray-200 leading-7">
                        Calle 9 de Octubre, La Merced 12856, Chanchamayo -
                        Referencia: al costado de bodega "GOYITO"
                    </span>
                </div>

                <!-- MAPA -->
                <div class="bg-white dark:bg-gray-800 rounded-3xl shadow-2xl p-4 md:p-6 mt-8">
                    <div class="rounded-2xl overflow-hidden h-[400px] md:h-[450px]">
                        <iframe
                            src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d357.19954161638077!2d-75.32288121736877!3d-11.045381488658416!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1ses!2spe!4v1773699590956!5m2!1ses!2spe"
                            class="w-full h-full border-0"
                            allowfullscreen=""
                            loading="lazy">
                        </iframe>
                    </div>
                </div>

            </div>
        </main>

        <!-- FOOTER -->
        <footer
            class="bg-gradient-to-r from-green-800 to-green-950 border-t-4 border-green-300 text-white py-8">

            <div class="flex flex-col items-center justify-center text-center">
                <p class="text-sm opacity-70">ALUNA © 2026</p>

                <div class="flex justify-center gap-4 mt-4">
                    <a href="https://www.facebook.com/share/1GKdJh27SV/" target="_blank"
                       class="hover:scale-110 hover:-translate-y-1 transition duration-300">
                        <img src="https://www.svgrepo.com/show/475647/facebook-color.svg" class="w-6">
                    </a>

                    <a href="https://instagram.com/alunaperu_" target="_blank"
                       class="hover:scale-110 hover:-translate-y-1 transition duration-300">
                        <img src="https://www.svgrepo.com/show/452229/instagram-1.svg" class="w-6">
                    </a>

                    <a href="https://tiktok.com/@alunaperu_" target="_blank"
                       class="hover:scale-110 hover:-translate-y-1 transition duration-300">
                        <img src="https://www.svgrepo.com/show/303260/tiktok-logo-logo.svg" class="w-6">
                    </a>
                </div>
            </div>
        </footer>

        <!-- WHATSAPP -->
        <div class="fixed bottom-8 right-5 z-50">
            <a href="https://wa.me/51967203776" target="_blank"
               class="fixed bottom-8 right-5 bg-green-400 p-4 rounded-full shadow-xl hover:scale-110 transition">
                <img src="https://cdn-icons-png.flaticon.com/512/733/733585.png" class="w-7">
            </a>
        </div>

    </body>
</html>