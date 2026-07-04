<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

    <head>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>ALUNA PERÚ - Cuidados</title>

        <link rel="icon"
              href="${pageContext.request.contextPath}/img/LogoAluna.png"
              type="image/png">

        <script src="https://cdn.tailwindcss.com"></script>

        <script>
            tailwind.config = {
                darkMode: 'class'
            };
        </script>

        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

        <style>

            .glass{
                backdrop-filter: blur(14px);
                background: rgba(255,255,255,.12);
            }

            .respuesta{
                max-height:0;
                overflow:hidden;
                transition:max-height .4s ease;
            }

            .pregunta.activa .respuesta{
                max-height:250px;
            }

            .icono{
                transition:.3s;
            }

            .pregunta.activa .icono{
                transform:rotate(180deg);
            }

        </style>

    </head>

    <body class="bg-gray-200 dark:bg-gray-900 dark:text-white font-serif min-h-screen flex flex-col transition duration-300">

        <header class="bg-green-900 border-b-4 border-green-300 px-8 py-4 flex flex-col md:flex-row items-center justify-between gap-4">

            <div class="flex items-center gap-3">

                <img src="${pageContext.request.contextPath}/img/LogoAluna.png"
                     class="w-16">

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

                <a href="${pageContext.request.contextPath}/cuidados"
                   class="bg-gradient-to-r from-cyan-200 to-white bg-clip-text text-transparent hover:scale-105 transition">
                    Cuidados
                </a>

                <a href="${pageContext.request.contextPath}/consultas"
                   class="bg-gradient-to-r from-cyan-200 to-white bg-clip-text text-transparent hover:scale-105 transition">
                    Consultas
                </a>

                <a href="${pageContext.request.contextPath}/ubicacion"
                   class="bg-gradient-to-r from-cyan-200 to-white bg-clip-text text-transparent hover:scale-105 transition">
                    Ubicación
                </a>

                <a href="${pageContext.request.contextPath}/historial"
                   class="bg-gradient-to-r from-yellow-200 to-white bg-clip-text text-transparent hover:scale-105 transition">
                    Mis compras
                </a>

                <%
                    modelo.Usuario u = (modelo.Usuario) session.getAttribute("usuario");
                %>

                <div class="flex gap-3 ml-6 items-center">

                    <% if (u == null) { %>

                    <button onclick="openLogin()"
                            class="px-4 py-2 rounded-full border border-white text-white hover:bg-white hover:text-black transition">
                        Login
                    </button>

                    <button onclick="openRegister()"
                            class="px-4 py-2 rounded-full bg-green-500 text-white hover:bg-green-600 transition">
                        Sign In
                    </button>

                    <% } else {%>

                    <span class="text-white font-semibold">
                        Hola, <%=u.getNombres()%>
                    </span>

                    <% if (u.getIdRol() == 1) { %>

                    <a href="${pageContext.request.contextPath}/admin"
                       class="px-4 py-2 rounded-full bg-cyan-500 text-white hover:bg-cyan-600 transition">
                        Admin
                    </a>

                    <% } %>

                    <a href="${pageContext.request.contextPath}/LogoutServlet"
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

        <main class="flex-1">

            <section class="bg-gradient-to-br from-green-100 via-emerald-50 to-cyan-100 dark:from-gray-900 dark:via-gray-800 dark:to-gray-900 px-6 py-16">

                <div class="max-w-5xl mx-auto text-center">

                    <div class="inline-flex items-center justify-center w-20 h-20 rounded-full bg-green-800 text-white text-4xl shadow-xl mb-6">

                        <i class="fas fa-seedling"></i>

                    </div>

                    <h2 class="text-5xl font-bold text-green-900 dark:text-green-300 mb-5">
                        Guía de cuidados
                    </h2>

                    <p class="text-lg max-w-3xl mx-auto leading-8 text-gray-700 dark:text-gray-300">

                        Aprende a mantener tus plantas saludables mediante recomendaciones sencillas sobre riego, iluminación, humedad, sustrato y mantenimiento.

                    </p>

                </div>

            </section>

            <section class="max-w-6xl mx-auto px-6 py-16">

                <div class="text-center mb-10">

                    <h3 class="text-4xl font-bold text-green-900 dark:text-green-300">

                        Cuidados principales

                    </h3>

                    <p class="mt-2 text-gray-600 dark:text-gray-300">

                        Aspectos fundamentales para que tus plantas crezcan sanas.

                    </p>

                </div>

                <div class="grid md:grid-cols-2 lg:grid-cols-4 gap-7">

                    <!-- RIEGO -->

                    <div class="bg-gradient-to-br from-green-100 via-white to-cyan-100 p-8 rounded-2xl shadow-xl text-center hover:-translate-y-2 transition">

                        <i class="fas fa-droplet text-5xl text-cyan-600 mb-5"></i>

                        <h4 class="text-xl font-bold mb-3">

                            Riego

                        </h4>

                        <p>

                            Riega únicamente cuando el sustrato se encuentre ligeramente seco.

                        </p>

                    </div>

                    <!-- ILUMINACION -->

                    <div class="bg-gradient-to-br from-yellow-100 via-white to-green-100 p-8 rounded-2xl shadow-xl text-center hover:-translate-y-2 transition">

                        <i class="fas fa-sun text-5xl text-yellow-500 mb-5"></i>

                        <h4 class="text-xl font-bold mb-3">

                            Iluminación

                        </h4>

                        <p>

                            Ubica la planta donde reciba luz adecuada según su especie.

                        </p>

                    </div>

                    <!-- HUMEDAD -->

                    <div class="bg-gradient-to-br from-cyan-100 via-white to-green-100 p-8 rounded-2xl shadow-xl text-center hover:-translate-y-2 transition">

                        <i class="fas fa-cloud-rain text-5xl text-sky-500 mb-5"></i>

                        <h4 class="text-xl font-bold mb-3">

                            Humedad

                        </h4>

                        <p>

                            Evita ambientes extremadamente secos o con cambios bruscos.

                        </p>

                    </div>

                    <!-- SUSTRATO -->

                    <div class="bg-gradient-to-br from-amber-100 via-white to-green-100 p-8 rounded-2xl shadow-xl text-center hover:-translate-y-2 transition">

                        <i class="fas fa-mound text-5xl text-amber-700 mb-5"></i>

                        <h4 class="text-xl font-bold mb-3">

                            Sustrato

                        </h4>

                        <p>

                            Utiliza mezclas con buen drenaje para proteger las raíces.

                        </p>

                    </div>

                </div>

            </section>

            <!-- RUTINA RECOMENDADA -->
            <section class="bg-green-900 text-white px-6 py-16">

                <div class="max-w-6xl mx-auto grid lg:grid-cols-2 gap-10 items-center">

                    <div>

                        <p class="text-green-200 font-semibold mb-2">
                            Rutina recomendada
                        </p>

                        <h3 class="text-4xl font-bold mb-5">
                            Observa tu planta cada semana
                        </h3>

                        <p class="text-green-50 leading-8 text-lg">
                            Revisar periódicamente tus plantas permite detectar hojas
                            dañadas, falta de agua, exceso de humedad, plagas o cualquier
                            cambio que pueda afectar su desarrollo.
                        </p>

                    </div>

                    <div class="grid sm:grid-cols-2 gap-5">

                        <div class="bg-white/10 backdrop-blur rounded-2xl p-6 border border-white/20">

                            <i class="fas fa-calendar-day text-3xl text-green-300 mb-3"></i>

                            <h4 class="font-bold text-xl mb-2">
                                Cada semana
                            </h4>

                            <p>
                                Revisa humedad, hojas e iluminación.
                            </p>

                        </div>

                        <div class="bg-white/10 backdrop-blur rounded-2xl p-6 border border-white/20">

                            <i class="fas fa-scissors text-3xl text-green-300 mb-3"></i>

                            <h4 class="font-bold text-xl mb-2">
                                Cuando sea necesario
                            </h4>

                            <p>
                                Retira hojas secas y limpia el follaje.
                            </p>

                        </div>

                        <div class="bg-white/10 backdrop-blur rounded-2xl p-6 border border-white/20">

                            <i class="fas fa-flask text-3xl text-green-300 mb-3"></i>

                            <h4 class="font-bold text-xl mb-2">
                                Fertilización
                            </h4>

                            <p>
                                Aplica fertilizante durante la etapa de crecimiento.
                            </p>

                        </div>

                        <div class="bg-white/10 backdrop-blur rounded-2xl p-6 border border-white/20">

                            <i class="fas fa-arrows-rotate text-3xl text-green-300 mb-3"></i>

                            <h4 class="font-bold text-xl mb-2">
                                Girar la maceta
                            </h4>

                            <p>
                                Favorece un crecimiento uniforme.
                            </p>

                        </div>

                    </div>

                </div>

            </section>

            <!-- SEÑALES -->
            <section class="max-w-6xl mx-auto px-6 py-16">

                <div class="text-center mb-10">

                    <h3 class="text-4xl font-bold text-green-900 dark:text-green-300">
                        Señales que debes observar
                    </h3>

                    <p class="mt-2 text-gray-600 dark:text-gray-300">
                        Detecta rápidamente problemas comunes.
                    </p>

                </div>

                <div class="grid md:grid-cols-3 gap-6">

                    <div class="bg-white dark:bg-gray-800 rounded-2xl shadow-lg p-8 border-t-4 border-yellow-400">

                        <i class="fas fa-triangle-exclamation text-4xl text-yellow-500 mb-4"></i>

                        <h4 class="text-2xl font-bold mb-3">
                            Hojas amarillas
                        </h4>

                        <p class="leading-7">
                            Generalmente aparecen por exceso de agua, mal drenaje o falta
                            de nutrientes.
                        </p>

                    </div>

                    <div class="bg-white dark:bg-gray-800 rounded-2xl shadow-lg p-8 border-t-4 border-amber-600">

                        <i class="fas fa-leaf text-4xl text-amber-600 mb-4"></i>

                        <h4 class="text-2xl font-bold mb-3">
                            Puntas secas
                        </h4>

                        <p class="leading-7">
                            Puede deberse a poca humedad, riego irregular o calor excesivo.
                        </p>

                    </div>

                    <div class="bg-white dark:bg-gray-800 rounded-2xl shadow-lg p-8 border-t-4 border-red-500">

                        <i class="fas fa-bug text-4xl text-red-500 mb-4"></i>

                        <h4 class="text-2xl font-bold mb-3">
                            Presencia de plagas
                        </h4>

                        <p class="leading-7">
                            Revisa hojas, tallos y sustrato para actuar oportunamente.
                        </p>

                    </div>

                </div>

            </section>

            <!-- PREGUNTAS FRECUENTES -->
            <section class="bg-gradient-to-br from-green-100 via-white to-cyan-100 dark:from-gray-900 dark:via-gray-800 dark:to-gray-900 px-6 py-16">

                <div class="max-w-5xl mx-auto text-center mb-12">

                    <div class="w-20 h-20 mx-auto bg-green-800 text-white rounded-full flex items-center justify-center text-4xl shadow-xl mb-6">
                        <i class="fas fa-circle-question"></i>
                    </div>

                    <h2 class="text-4xl font-bold text-green-900 dark:text-green-300">
                        Preguntas Frecuentes
                    </h2>

                    <p class="mt-4 text-lg text-gray-700 dark:text-gray-300">
                        Resolvemos las dudas más comunes de nuestros clientes.
                    </p>

                </div>

                <div class="max-w-5xl mx-auto space-y-5">

                    <article class="pregunta bg-white dark:bg-gray-800 rounded-2xl shadow-lg overflow-hidden">

                        <button onclick="alternarPregunta(this)"
                                class="w-full flex justify-between items-center px-7 py-6">

                            <span class="font-bold text-lg">
                                ¿Cómo puedo realizar una compra?
                            </span>

                            <i class="fas fa-chevron-down icono"></i>

                        </button>

                        <div class="respuesta">
                            <p class="px-7 pb-6">
                                Ingresa al catálogo, selecciona una planta, agrégala al carrito y completa el proceso de compra.
                            </p>
                        </div>

                    </article>

                    <article class="pregunta bg-white dark:bg-gray-800 rounded-2xl shadow-lg overflow-hidden">

                        <button onclick="alternarPregunta(this)"
                                class="w-full flex justify-between items-center px-7 py-6">

                            <span class="font-bold text-lg">
                                ¿Necesito una cuenta para comprar?
                            </span>

                            <i class="fas fa-chevron-down icono"></i>

                        </button>

                        <div class="respuesta">
                            <p class="px-7 pb-6">
                                Sí, una cuenta permite registrar correctamente tus pedidos y compras.
                            </p>
                        </div>

                    </article>

                    <article class="pregunta bg-white dark:bg-gray-800 rounded-2xl shadow-lg overflow-hidden">

                        <button onclick="alternarPregunta(this)"
                                class="w-full flex justify-between items-center px-7 py-6">

                            <span class="font-bold text-lg">
                                ¿Realizan entregas a domicilio?
                            </span>

                            <i class="fas fa-chevron-down icono"></i>

                        </button>

                        <div class="respuesta">
                            <p class="px-7 pb-6">
                                Sí, realizamos entregas según la dirección registrada durante la compra.
                            </p>
                        </div>

                    </article>

                    <article class="pregunta bg-white dark:bg-gray-800 rounded-2xl shadow-lg overflow-hidden">

                        <button onclick="alternarPregunta(this)"
                                class="w-full flex justify-between items-center px-7 py-6">

                            <span class="font-bold text-lg">
                                ¿Qué métodos de pago aceptan?
                            </span>

                            <i class="fas fa-chevron-down icono"></i>

                        </button>

                        <div class="respuesta">
                            <p class="px-7 pb-6">
                                Los métodos disponibles aparecen durante el proceso de compra.
                            </p>
                        </div>

                    </article>

                    <article class="pregunta bg-white dark:bg-gray-800 rounded-2xl shadow-lg overflow-hidden">

                        <button onclick="alternarPregunta(this)"
                                class="w-full flex justify-between items-center px-7 py-6">

                            <span class="font-bold text-lg">
                                ¿Dónde encuentro recomendaciones de cuidado?
                            </span>

                            <i class="fas fa-chevron-down icono"></i>

                        </button>

                        <div class="respuesta">
                            <p class="px-7 pb-6">
                                En esta misma sección encontrarás toda la información necesaria.
                            </p>
                        </div>

                    </article>

                </div>

            </section>

            <!-- Preguntas -->
            <section class="px-6 pb-16">

                <div class="max-w-5xl mx-auto bg-gradient-to-r from-green-700 to-green-900 rounded-3xl shadow-2xl p-10 text-center text-white">

                    <i class="fas fa-headset text-5xl text-green-200 mb-5"></i>

                    <h3 class="text-3xl font-bold mb-4">
                        ¿Todavía tienes dudas?
                    </h3>

                    <p class="text-lg text-green-50 mb-8">
                        Nuestro equipo está listo para ayudarte con cualquier consulta sobre nuestras plantas, pedidos o recomendaciones.
                    </p>

                    <a href="${pageContext.request.contextPath}/consultas"
                       class="inline-block bg-white text-green-900 font-bold px-8 py-3 rounded-full hover:bg-green-100 hover:scale-105 transition">

                        Ir a Consultas

                    </a>

                </div>

            </section>

        </main>

        <!-- FOOTER -->

        <footer class="bg-gradient-to-r from-green-800 to-green-950 border-t-4 border-green-300 text-white py-8">

            <div class="flex flex-col items-center">

                <p class="opacity-70">
                    ALUNA © 2026
                </p>

                <div class="flex gap-4 mt-4">

                    <a href="https://www.facebook.com/share/1GKdJh27SV/_"
                       target="_blank">

                        <img src="https://www.svgrepo.com/show/475647/facebook-color.svg"
                             class="w-6 hover:scale-110 transition">

                    </a>

                    <a href="https://instagram.com/alunaperu_"
                       target="_blank">

                        <img src="https://www.svgrepo.com/show/452229/instagram-1.svg"
                             class="w-6 hover:scale-110 transition">

                    </a>

                    <a href="https://tiktok.com/@alunaperu_"
                       target="_blank">

                        <img src="https://www.svgrepo.com/show/303260/tiktok-logo-logo.svg"
                             class="w-6 hover:scale-110 transition">

                    </a>

                </div>

            </div>

        </footer>

        <!-- WHATSAPP -->

        <div class="fixed bottom-8 right-5 flex flex-col gap-4 z-50">

            <a href="https://wa.me/51967203776"
               target="_blank"
               class="bg-green-500 p-3 rounded-full shadow-xl hover:scale-110 transition">

                <img src="https://cdn-icons-png.flaticon.com/512/733/733585.png"
                     class="w-10 h-10">
            </a>

        </div>

        <!-- MODALES -->

        <div id="modalBg"
             class="hidden fixed inset-0 bg-black/60 flex items-center justify-center z-50">

            <!-- LOGIN -->

            <div id="loginModal"
                 class="hidden glass p-10 rounded-3xl w-[420px] text-white shadow-2xl relative">

                <button onclick="closeModal()"
                        class="absolute top-4 right-5 text-2xl">

                    ✕

                </button>

                <h2 class="text-4xl font-bold text-center mb-8">
                    Bienvenido
                </h2>

                <form action="${pageContext.request.contextPath}/LoginServlet"
                      method="post"
                      class="space-y-5">

                    <input
                        type="email"
                        name="email"
                        placeholder="Correo"
                        required
                        class="w-full px-5 py-4 rounded-2xl bg-white/20 placeholder-white/70">

                    <input
                        type="password"
                        name="clave"
                        placeholder="Contraseña"
                        required
                        class="w-full px-5 py-4 rounded-2xl bg-white/20 placeholder-white/70">

                    <button
                        class="w-full bg-green-500 py-4 rounded-2xl font-bold hover:bg-green-600 transition">

                        Iniciar Sesión

                    </button>

                </form>

            </div>

            <!-- REGISTRO -->

            <div id="registerModal"
                 class="hidden glass p-10 rounded-3xl w-[420px] text-white shadow-2xl relative">

                <button onclick="closeModal()"
                        class="absolute top-4 right-5 text-2xl">

                    ✕

                </button>

                <h2 class="text-4xl font-bold text-center mb-8">
                    Crear Cuenta
                </h2>

                <form action="${pageContext.request.contextPath}/RegistroServlet"
                      method="post"
                      class="space-y-4">

                    <input
                        type="text"
                        name="nombres"
                        placeholder="Nombres"
                        required
                        class="w-full px-5 py-4 rounded-2xl bg-white/20">

                    <input
                        type="text"
                        name="apellidos"
                        placeholder="Apellidos"
                        required
                        class="w-full px-5 py-4 rounded-2xl bg-white/20">

                    <input
                        type="email"
                        name="email"
                        placeholder="Correo"
                        required
                        class="w-full px-5 py-4 rounded-2xl bg-white/20">

                    <input
                        type="password"
                        name="clave"
                        placeholder="Contraseña"
                        required
                        class="w-full px-5 py-4 rounded-2xl bg-white/20">

                    <button
                        class="w-full bg-cyan-500 py-4 rounded-2xl font-bold hover:bg-cyan-600 transition">

                        Registrarme

                    </button>

                </form>

            </div>

        </div>

        <script>

            function alternarPregunta(boton) {

                const pregunta = boton.parentElement;

                document.querySelectorAll(".pregunta").forEach(function (item) {

                    if (item !== pregunta) {

                        item.classList.remove("activa");

                    }

                });

                pregunta.classList.toggle("activa");

            }

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

                document.getElementById("loginModal").classList.add("hidden");

                document.getElementById("registerModal").classList.add("hidden");

            }

        </script>

    </body>
</html>