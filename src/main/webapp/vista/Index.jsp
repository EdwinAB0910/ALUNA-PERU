<%-- 
    Document   : index
    Created on : 6 may. 2026, 08:22:39
    Author     : EDWIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>ALUNA PERÚ - INICIO</title>
        <link rel="icon" href="img/LogoAluna.png" sizes="256x256" type="image/png" />
        <script src="https://cdn.tailwindcss.com"></script>
        <script>
            tailwind.config = {
                darkMode: 'class'
            }
        </script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

        <style>

            .glass{
                backdrop-filter: blur(14px);
                background: rgba(255,255,255,.12);
            }

        </style>
    </head>

    <body class="font-serif bg-gray-200 dark:bg-gray-900 dark:text-white overflow-x-hidden transition duration-300">

        <div class="min-h-screen">

            <!-- HEADER -->
            <header class="flex flex-col md:flex-row items-center justify-between border-b-4 border-green-300 px-8 py-4 bg-green-900 gap-4">

                <div class="flex items-center gap-3">
                    <img src="img/LogoAluna.png" alt="Logotipo" class="w-20">
                    <h1 class="text-2xl font-semibold bg-gradient-to-r from-lime-200 to-gray-300 bg-clip-text text-transparent">
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
                        class="text-white text-xl hover:scale-110 transition">
                    🌙 / ☀️
                </button>
            </header>

            <!-- HERO -->
            <section class="relative h-[90vh] bg-cover bg-center flex items-center justify-center text-center"
                     style="background-image: url('img/imagencentralinicio.jpeg');">

                <div class="absolute inset-0 bg-black/50"></div>

                <div class="relative z-10 text-white max-w-3xl px-5">
                    <h1 class="text-3xl md:text-5xl font-bold mb-5">
                        Conecta tu vida con la naturaleza 🌿
                    </h1>
                    <p class="text-sm md:text-lg mb-8">
                        Descubre plantas únicas que transforman tu hogar en un espacio lleno de vida y bienestar
                    </p>

                    <a href="${pageContext.request.contextPath}/catalogo"
                       class="bg-emerald-900 hover:bg-green-500 transition px-6 py-3 rounded-full font-bold">
                        Ver catálogo
                    </a>
                </div>
            </section>

            <!-- NOSOTROS -->
            <section class="px-[5%] md:px-[10%] py-16 bg-gradient-to-br from-green-100 to-green-200 dark:from-gray-900 dark:to-gray-800 transition duration-300">

                <div class="text-center mb-12">
                    <h2 class="text-4xl font-bold text-green-900">Sobre Nosotros 🌿</h2>
                    <p class="text-gray-700 mt-2">Conectamos tu hogar con la naturaleza</p>
                </div>

                <div class="flex flex-col md:flex-row items-center gap-10 max-w-6xl mx-auto">

                    <!-- CUADRO IZQUIERDA -->
                    <div class="flex-1 bg-gradient-to-br from-white via-green-50 to-emerald-100 dark:from-gray-800 dark:via-gray-700 dark:to-gray-900 rounded-3xl shadow-2xl p-8 md:p-12 border border-green-100 dark:border-gray-700">

                        <div class="text-center">
                            <h3 class="text-3xl font-semibold text-green-900 mb-4">
                                ¿Quiénes somos?
                            </h3>

                            <p class="text-gray-700 dark:text-gray-200 leading-8 text-lg">
                                <strong>ALUNA</strong> es un espacio donde la naturaleza se selecciona con intención.
                                Trabajamos con plantas de interior y exterior elegidas por su forma, presencia y carácter.
                            </p>

                            <div class="mt-6 flex flex-col gap-3 text-green-800 font-medium text-lg">
                                <div>🌱 Amor por la naturaleza</div>
                                <div>🌿 Calidad en cada planta</div>
                                <div>🍃 Bienestar para tu hogar</div>
                            </div>
                        </div>

                    </div>

                    <!-- IMAGEN DERECHA -->
                    <div class="flex-1">
                        <img src="img/Helecho monedita.jpeg"
                             class="w-full max-w-md mx-auto rounded-2xl shadow-xl hover:scale-105 transition duration-500">
                    </div>

                </div>



                <!-- CARDS -->
                <div class="grid md:grid-cols-3 gap-6 mt-16">

                    <div class="bg-gradient-to-br from-green-100 via-slate-100 to-cyan-100 dark:from-gray-800 dark:via-gray-700 dark:to-gray-900
                         backdrop-blur-md p-8 rounded-2xl shadow-xl text-center
                         hover:-translate-y-2 hover:shadow-2xl transition duration-300 border border-white/40">
                        <i class="fas fa-seedling text-4xl text-green-800 mb-4"></i>
                        <h3 class="text-xl font-bold mb-3 text-slate-800 dark:text-white">Misión</h3>
                        <p class="text-sm text-gray-700 dark:text-gray-300">
                            Ofrecer plantas cuidadosamente seleccionadas.
                        </p>
                    </div>

                    <div class="bg-gradient-to-br from-green-100 via-slate-100 to-cyan-100 dark:from-gray-800 dark:via-gray-700 dark:to-gray-900
                         backdrop-blur-md p-8 rounded-2xl shadow-xl text-center
                         hover:-translate-y-2 hover:shadow-2xl transition duration-300 border border-white/40">
                        <i class="fas fa-leaf text-4xl text-green-800 mb-4"></i>
                        <h3 class="text-xl font-bold mb-3 text-slate-800 dark:text-white">Visión</h3>
                        <p class="text-sm text-gray-700 dark:text-gray-300">
                            Ser referente en diseño y comercialización de plantas.
                        </p>
                    </div>

                    <div class="bg-gradient-to-br from-green-100 via-slate-100 to-cyan-100 dark:from-gray-800 dark:via-gray-700 dark:to-gray-900
                         backdrop-blur-md p-8 rounded-2xl shadow-xl text-center
                         hover:-translate-y-2 hover:shadow-2xl transition duration-300 border border-white/40">
                        <i class="fas fa-tree text-4xl text-green-800 mb-4"></i>
                        <h3 class="text-xl font-bold mb-3 text-slate-800 dark:text-white">Valores</h3>
                        <p class="text-sm text-gray-700 dark:text-gray-300">
                            Calidad, estética natural y compromiso.
                        </p>
                    </div>

                </div>
            </section>

            <!-- FOOTER -->
            <footer class="bg-gradient-to-br from-green-700 to-green-900 border-t-4 border-green-300 text-white text-center py-8">
                <p class="text-sm opacity-80">ALUNA © 2026</p>

                <div class="flex justify-center gap-4 mt-4">

                    <a href="https://www.facebook.com/share/1GKdJh27SV/_" target="_blank" rel="noopener noreferrer">
                        <img src="https://www.svgrepo.com/show/475647/facebook-color.svg"
                             class="w-6 hover:scale-125 transition duration-300">
                    </a>

                    <a href="https://instagram.com/alunaperu_" target="_blank" rel="noopener noreferrer">
                        <img src="https://www.svgrepo.com/show/452229/instagram-1.svg"
                             class="w-6 hover:scale-125 transition duration-300">
                    </a>

                    <a href="https://tiktok.com/@alunaperu_" target="_blank" rel="noopener noreferrer">
                        <img src="https://www.svgrepo.com/show/303260/tiktok-logo-logo.svg"
                             class="w-6 hover:scale-125 transition duration-300">
                    </a>

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
                    document.getElementById("loginModal").classList.remove("hidden");
                    document.getElementById("registerModal").classList.add("hidden");
                }

                function openRegister() {
                    document.getElementById("modalBg").classList.remove("hidden");
                    document.getElementById("registerModal").classList.remove("hidden");
                    document.getElementById("loginModal").classList.add("hidden");
                }

                function closeModal() {
                    document.getElementById("modalBg").classList.add("hidden");
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

