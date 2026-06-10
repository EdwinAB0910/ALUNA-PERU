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

        <style>
            .glass{
                backdrop-filter: blur(14px);
                background: rgba(255,255,255,.12);
            }
        </style>
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

            <nav class="flex flex-wrap justify-center gap-6 mt-4 md:mt-0 items-center">

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

                <%
                    modelo.Usuario u
                            = (modelo.Usuario) session.getAttribute("usuario");
                %>

                <div class="flex gap-3 ml-6 items-center">

                    <% if (u == null) { %>

                    <!-- SI NO HAY SESION -->

                    <button onclick="openLogin()"
                            class="px-4 py-2 rounded-full border border-white text-white hover:bg-white hover:text-black transition">

                        Login

                    </button>

                    <button onclick="openRegister()"
                            class="px-4 py-2 rounded-full bg-green-500 text-white hover:bg-green-600 transition">

                        Sign In

                    </button>

                    <% } else {%>

                    <!-- SI EL USUARIO INICIO SESION -->

                    <span class="text-white font-semibold">
                        Hola, <%= u.getNombres()%>
                    </span>

                    <% if (u.getIdRol() == 1) { %>

                    <a href="admin.jsp"
                       class="px-4 py-2 rounded-full bg-cyan-500 text-white hover:bg-cyan-600 transition">

                        Admin

                    </a>

                    <% } %>

                    <a href="LogoutServlet"
                       class="px-4 py-2 rounded-full bg-red-500 text-white hover:bg-red-600 transition">

                        Salir

                    </a>

                    <% }%>

                </div>

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

        <!-- CONTENEDOR -->
        <div class="fixed bottom-8 right-5 flex flex-col gap-4 z-50">

            <!-- CHATBOT -->
            <button onclick="abrirChat()"
                    class="bg-gradient-to-br from-green-400 via-cyan-300 to-gray-300
                    p-3 rounded-full shadow-xl hover:scale-110 transition">

                <img src="img/Chatbot.jpg"
                     alt="Chat ALUNA"
                     class="w-10 h-10 rounded-full">
            </button>

            <!-- WHATSAPP -->
            <a href="https://wa.me/51967203776"
               target="_blank"
               class="bg-green-500 p-3 rounded-full shadow-xl hover:scale-110 transition">

                <img src="https://cdn-icons-png.flaticon.com/512/733/733585.png"
                     class="w-10 h-10">
            </a>

        </div>
        <div id="modalBg"
             class="hidden fixed inset-0 bg-black/60 z-50 flex items-center justify-center">

            <!-- LOGIN -->
            <div id="loginModal"
                 class="hidden glass p-10 rounded-3xl w-[420px] text-white shadow-2xl relative border border-white/20">

                <button onclick="closeModal()"
                        class="absolute top-4 right-5 text-white text-2xl">
                    ✕
                </button>

                <h2 class="text-4xl font-bold text-center mb-8">
                    Bienvenido
                </h2>

                <%
                    String errorLogin = (String) session.getAttribute("errorLogin");
                %>

                <% if (errorLogin != null) {%>

                <div class="bg-red-500/20 border border-red-400 text-red-100 px-4 py-3 rounded-2xl text-sm mb-4 text-center">
                    <%= errorLogin%>
                </div>

                <script>
                    window.onload = function () {
                        openLogin();
                    }
                </script>

                <%
                    session.removeAttribute("errorLogin");
                %>

                <% }%>

                <form action="LoginServlet" method="post" class="space-y-5">

                    <input type="email"
                           name="email"
                           placeholder="Correo"
                           required
                           class="w-full px-5 py-4 rounded-2xl bg-white/20 text-white placeholder-white/70 focus:outline-none focus:ring-2 focus:ring-green-400">

                    <input type="password"
                           name="clave"
                           placeholder="Contraseña"
                           required
                           class="w-full px-5 py-4 rounded-2xl bg-white/20 text-white placeholder-white/70 focus:outline-none focus:ring-2 focus:ring-green-400">

                    <button type="submit"
                            class="w-full bg-green-500 py-4 rounded-2xl font-bold hover:bg-green-600 transition">
                        Iniciar Sesión
                    </button>

                </form>

            </div>

            <!-- REGISTER -->
            <div id="registerModal"
                 class="hidden glass p-10 rounded-3xl w-[420px] text-white shadow-2xl relative border border-white/20">

                <button onclick="closeModal()"
                        class="absolute top-4 right-5 text-white text-2xl">
                    ✕
                </button>

                <h2 class="text-4xl font-bold text-center mb-8">
                    Crear Cuenta
                </h2>

                <form action="RegistroServlet" method="post" class="space-y-4">

                    <input type="text"
                           name="nombres"
                           placeholder="Nombres"
                           required
                           class="w-full px-5 py-4 rounded-2xl bg-white/20 text-white placeholder-white/70 focus:outline-none focus:ring-2 focus:ring-green-400">

                    <input type="text"
                           name="apellidos"
                           placeholder="Apellidos"
                           required
                           class="w-full px-5 py-4 rounded-2xl bg-white/20 text-white placeholder-white/70 focus:outline-none focus:ring-2 focus:ring-green-400">

                    <input type="email"
                           name="email"
                           placeholder="Correo"
                           required
                           class="w-full px-5 py-4 rounded-2xl bg-white/20 text-white placeholder-white/70 focus:outline-none focus:ring-2 focus:ring-green-400">

                    <input type="password"
                           name="clave"
                           placeholder="Contraseña"
                           required
                           class="w-full px-5 py-4 rounded-2xl bg-white/20 text-white placeholder-white/70 focus:outline-none focus:ring-2 focus:ring-green-400">

                    <button type="submit"
                            class="w-full bg-cyan-500 py-4 rounded-2xl font-bold hover:bg-cyan-600 transition">
                        Registrarme
                    </button>

                </form>

            </div>

        </div>

        <!-- CHAT FLOTANTE -->
        <div id="chatBot"
             class="hidden fixed bottom-24 right-5 w-[400px] h-[600px] bg-white rounded-3xl shadow-2xl overflow-hidden z-50">

            <div class="bg-blue-500 text-white p-4 flex justify-between items-center">

                <span class="font-bold">
                    Asistente ALUNA
                </span>

                <button onclick="cerrarChat()"
                        class="text-xl">
                    ✕
                </button>

            </div>

            <iframe
                src="https://poe.com/Chatbot-ALUNA?invite_code=cc1564e9-6349-4c00-892d-62796b2dd5ef"
                class="w-full h-[calc(100%-60px)] border-0">
            </iframe>

        </div>

        <script>

            function openLogin() {

                document.getElementById("modalBg").classList.remove("hidden");
                document.getElementById("modalBg").classList.add("flex");

                document.getElementById("loginModal").classList.remove("hidden");
                document.getElementById("registerModal").classList.add("hidden");
            }

            function openRegister() {

                document.getElementById("modalBg").classList.remove("hidden");
                document.getElementById("modalBg").classList.add("flex");

                document.getElementById("registerModal").classList.remove("hidden");
                document.getElementById("loginModal").classList.add("hidden");
            }

            function closeModal() {

                document.getElementById("modalBg").classList.add("hidden");
                document.getElementById("modalBg").classList.remove("flex");
            }

        </script>

        <script>
            function abrirChat() {
                document.getElementById("chatBot")
                        .classList.remove("hidden");
            }

            function cerrarChat() {
                document.getElementById("chatBot")
                        .classList.add("hidden");
            }
        </script>

    </body>
</html>