<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Planta"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>

<%
    List<Planta> lista = (List<Planta>) request.getAttribute("plantas");
%>
----hola que tal---
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>ALUNA PERÚ - CATÁLOGO</title>

        <link rel="icon" href="img/LogoAluna.png" type="image/png">

        <script src="https://cdn.tailwindcss.com"></script>

        <script>
            tailwind.config = {
                darkMode: 'class'
            }
        </script>

        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

        <style>

            body{
                font-family: 'Poppins', sans-serif;
                background: #f3f4f6;
            }

            /* HERO */
            .hero{
                background-size: cover;
                background-position: center center;
                background-repeat: no-repeat;

                display: flex;
                align-items: center;
                justify-content: center;

                width: 100%;
            }

            /* CARRUSEL */
            .slider{
                overflow: hidden;
                position: relative;
                width: 100%;
                border-radius: 30px;
            }

            .slide-track{
                display: flex;
                width: calc(280px * 16);
                animation: scroll 35s linear infinite;
            }

            .slide{
                width: 280px;
                padding: 10px;
            }

            .slide img{
                width: 100%;
                height: 240px;
                object-fit: cover;
                border-radius: 24px;
                box-shadow: 0 10px 25px rgba(0,0,0,.20);
                transition: .4s;
            }

            .slide img:hover{
                transform: scale(1.05);
            }

            @keyframes scroll {

                0% {
                    transform: translateX(0);
                }

                100% {
                    transform: translateX(-2240px);
                }

            }

            /* TARJETAS */
            .card-planta{
                border-radius: 28px;
                overflow: hidden;
                transition: .4s;
                position: relative;
            }

            .card-planta:hover{
                transform: translateY(-10px);
            }

            .card-planta img{
                transition: .5s;
            }

            .card-planta:hover img{
                transform: scale(1.08);
            }

            .glass{
                backdrop-filter: blur(14px);
                background: rgba(255,255,255,.12);
            }

        </style>

    </head>

    <body class="dark:bg-gray-900 dark:text-white min-h-screen flex flex-col">

        <!-- HEADER -->
        <header class="font-serif flex flex-col md:flex-row items-center justify-between border-b-4 border-green-300 px-8 py-4 bg-green-900 sticky top-0 z-50">

            <div class="flex items-center gap-3">
                <img src="img/LogoAluna.png" alt="Logo" class="w-20">

                <h1
                    class="text-2xl font-semibold bg-gradient-to-r from-green-200 to-gray-300 bg-clip-text text-transparent">
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

                    <a href="${pageContext.request.contextPath}/admin"
                       class="px-4 py-2 rounded-full bg-cyan-500 text-white hover:bg-cyan-600 transition">

                        Admin

                    </a>

                    <% } %>

                    <a href="LogoutServlet"
                       class="px-4 py-2 rounded-full bg-red-500 text-white hover:bg-red-600 transition">

                        Salir

                    </a>

                    <% } %>

                </div>

            </nav>

            <div class="flex items-center gap-4 pt-2">

                <button onclick="toggleCarrito()"
                        class="text-white text-3xl hover:scale-125 transition duration-300">
                    🛒
                </button>

                <button onclick="document.documentElement.classList.toggle('dark')"
                        class="text-white text-2xl hover:scale-125 transition duration-300">
                    🌙 / ☀️
                </button>

            </div>

        </header>

        <!-- HERO -->
        <section
            class="hero min-h-[350px] md:min-h-[500px] px-4"
            style="
            background:
            linear-gradient(rgba(0,0,0,.55), rgba(0,0,0,.55)),
            url('img/Helecho cola de zorro.jpeg');
            background-size: cover;
            background-position: center center;">

            <div class="glass
                 rounded-[35px]
                 px-6 md:px-10
                 py-8 md:py-14
                 text-white
                 text-center
                 max-w-4xl
                 mx-auto
                 shadow-2xl">

                <h1 class="font-bold text-4xl sm:text-5xl md:text-6xl lg:text-7xl mb-6">
                    ALUNA PERÚ
                </h1>

                <p class="text-base sm:text-lg md:text-xl lg:text-2xl">
                    Plantas tropicales, exóticas y ornamentales
                    para transformar cada espacio en algo único.
                </p>

            </div>

        </section>

        <!-- MAIN -->
        <main class="
              px-4 md:px-6
              py-10
              overflow-x-hidden">

            <!-- TITULO -->
            <div class="text-center mb-14">

                <h2 class="text-5xl font-bold text-green-800 dark:text-green-300 mb-5">
                    Nuestro Catálogo
                </h2>

                <p class="text-gray-600 dark:text-gray-300 max-w-3xl mx-auto text-lg">
                    Descubre nuestra colección exclusiva de plantas tropicales,
                    decorativas y exóticas cuidadosamente seleccionadas.
                </p>

            </div>

            <!-- BUSCADOR -->
            <div class="bg-white dark:bg-gray-800 p-8 rounded-[35px] shadow-2xl mb-16 border border-green-100">

                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-5">

                    <!-- BUSCADOR -->
                    <div class="relative md:col-span-1">

                        <i class="fa-solid fa-magnifying-glass absolute left-5 top-5 text-green-700"></i>

                        <input
                            type="text"
                            id="buscador"
                            placeholder="Buscar planta..."
                            class="w-full pl-14 pr-5 py-4 rounded-2xl border-2 border-green-200 bg-green-50 dark:bg-gray-700 outline-none focus:border-green-600 transition">

                    </div>

                    <!-- FILTRO PRECIO -->
                    <select
                        id="filtroPrecio"
                        class="w-full py-4 px-5 rounded-2xl border-2 border-cyan-200 bg-cyan-50 dark:bg-gray-700 outline-none focus:border-cyan-500 transition">

                        <option value="todos">Todos los precios</option>
                        <option value="bajo">Menores a S/.50</option>
                        <option value="medio">S/.50 - S/.100</option>

                    </select>

                    <!-- FILTRO CATEGORIA -->
                    <select
                        id="filtroCategoria"
                        class="w-full py-4 px-5 rounded-2xl border-2 border-pink-200 bg-pink-50 dark:bg-gray-700 outline-none focus:border-pink-500 transition">

                        <option value="todos">Todas las categorías</option>
                        <option value="1">Monstera</option>
                        <option value="2">Syngonium</option>
                        <option value="3">Caladium</option>
                        <option value="4">Begonia</option>
                        <option value="5">Calathea</option>
                        <option value="6">Aglaonema</option>
                        <option value="7">Helechos</option>
                        <option value="8">Philodendron</option>
                        <option value="9">Croton</option>
                        <option value="10">Anthurium</option>
                        <option value="11">Colocasia</option>
                        <option value="12">Alocasia</option>
                        <option value="13">Epipremnum</option>
                        <option value="14">Peperomia</option>
                        <option value="15">Episcia</option>
                        <option value="16">Otros</option>

                    </select>

                </div>

            </div>

            <!-- CARRUSEL -->
            <section class="mb-20">

                <div class="slider shadow-2xl">

                    <div class="slide-track">

                        <div class="slide">
                            <img src="img/Begonia cobriza.jpeg">
                        </div>

                        <div class="slide">
                            <img src="img/Alocasia frydek.jpeg">
                        </div>

                        <div class="slide">
                            <img src="img/Syngonium milk confetti.jpeg">
                        </div>

                        <div class="slide">
                            <img src="img/Monstera preatermisa.jpeg">
                        </div>

                        <div class="slide">
                            <img src="img/Colocasia Magic Black.jpeg">
                        </div>

                        <div class="slide">
                            <img src="img/Helecho cinta.jpeg">
                        </div>

                        <!-- DUPLICADOS -->
                        <div class="slide">
                            <img src="img/Begonia cobriza.jpeg">
                        </div>

                        <div class="slide">
                            <img src="img/Alocasia frydek.jpeg">
                        </div>

                    </div>

                </div>

            </section>

            <!-- GRID -->
            <section>

                <div id="contenedorPlantas"
                     class="
                     grid
                     grid-cols-1
                     md:grid-cols-2
                     xl:grid-cols-4
                     gap-6">

                    <% for (Planta p : lista) {%>

                    <div
                        class="card-planta planta-item bg-gradient-to-br from-green-100 via-white to-cyan-100 dark:from-gray-800 dark:to-gray-700 shadow-xl"
                        data-nombre="<%= p.getNombre().toLowerCase()%>"
                        data-precio="<%= p.getPrecio()%>"
                        data-categoria="<%= p.getIdCategoria()%>">

                        <!-- IMAGEN -->
                        <div class="overflow-hidden">

                            <img
                                src="<%= p.getImagen()%>"
                                alt="<%= p.getNombre()%>"
                                class="w-full h-60 object-cover">

                        </div>

                        <!-- CONTENIDO -->
                        <div class="p-6">

                            <h3 class="text-2xl font-bold text-green-900 dark:text-green-300 mb-3">
                                <%= p.getNombre()%>
                            </h3>

                            <p class="text-gray-700 dark:text-gray-300 text-sm leading-relaxed mb-5">
                                <%= p.getDescripcion()%>
                            </p>

                            <div class="flex items-center justify-between mb-5">

                                <span class="text-green-700 dark:text-green-300 font-bold text-2xl">
                                    S/. <%= p.getPrecio()%>
                                </span>

                                <span class="bg-green-200 text-green-900 px-4 py-1 rounded-full text-sm font-semibold">
                                    Stock: <%= p.getStock()%>
                                </span>

                            </div>

                            <% if (session.getAttribute("idUsuario") == null) { %>

                            <button onclick="alert('Debes iniciar sesión o crear una cuenta')"
                                    class="w-full bg-gray-400 text-white py-3 rounded-2xl">
                                Agregar al carrito
                            </button>

                            <% } else {%>

                            <form action="CarritoServlet" method="post">

                                <input type="hidden" name="accion" value="agregar">
                                <input type="hidden" name="idProducto" value="<%= p.getId()%>">
                                <input type="hidden" name="precio" value="<%= p.getPrecio()%>">

                                <!-- CONTADOR -->
                                <div class="flex items-center justify-center gap-3 mb-4">

                                    <button type="button"
                                            onclick="decrementar(this)"
                                            class="w-10 h-10 bg-red-500 text-white rounded-full font-bold">
                                        -
                                    </button>

                                    <input type="number"
                                           name="cantidad"
                                           value="1"
                                           min="1"
                                           max="<%= p.getStock()%>"
                                           required
                                           class="w-16 text-center border rounded-lg py-2">

                                    <button type="button"
                                            onclick="incrementar(this)"
                                            class="w-10 h-10 bg-green-500 text-white rounded-full font-bold">
                                        +
                                    </button>

                                </div>

                                <button
                                    class="w-full bg-green-600 text-white py-3 rounded-2xl hover:bg-green-700 transition">
                                    Agregar al carrito
                                </button>

                            </form>

                            <% } %>

                        </div> 

                    </div> 

                    <% } %>

                </div> 

            </section>

            <!-- CARRITO LATERAL -->
            <aside id="panelCarrito"
                   class="
                   fixed top-0 left-0
                   w-80 h-screen
                   bg-white dark:bg-gray-800
                   shadow-2xl z-50
                   overflow-y-auto
                   transform -translate-x-full
                   transition-transform duration-300">


                <!-- BOTON CERRAR SOLO EN MOVIL -->
                <button
                    onclick="toggleCarrito()"
                    class=" absolute top-4 right-4 text-2xl font-bold">

                    ✕

                </button>

                <div class="p-6 border-b">
                    <h2 class="text-2xl font-bold text-green-700">🛒 Mi Carrito</h2>
                </div>

                <div class="p-4 space-y-4">

                    <%
                        List<Map<String, Object>> carrito
                                = (List<Map<String, Object>>) request.getAttribute("carrito");

                        double total = request.getAttribute("total") != null
                                ? (double) request.getAttribute("total") : 0;
                    %>

                    <% if (carrito != null && !carrito.isEmpty()) { %>

                    <% for (Map<String, Object> item : carrito) {%>

                    <div class="p-3 rounded-xl bg-green-50 dark:bg-gray-700 shadow flex justify-between items-center">

                        <div>
                            <p class="font-semibold"><%= item.get("nombre")%></p>

                            <p class="text-sm">
                                <%= item.get("cantidad")%> x S/. <%= item.get("precio")%>
                            </p>

                            <p class="text-green-700 font-bold">
                                S/. <%= item.get("subtotal")%>
                            </p>
                        </div>

                        <form method="post" action="${pageContext.request.contextPath}/CarritoServlet">

                            <input type="hidden" name="accion" value="eliminar">
                            <input type="hidden" name="idProducto" value="<%= item.get("idProducto")%>">

                            <button type="submit"
                                    class="text-red-600 hover:text-red-800 text-2xl font-bold px-3">
                                ✕
                            </button>

                        </form>

                    </div>

                    <% } %>

                    <% } else { %>

                    <p class="text-center text-gray-500">
                        Carrito vacío
                    </p>

                    <% }%>

                </div>

                <div class="p-6 border-t mt-auto">

                    <h3 class="text-xl font-bold text-green-700">
                        Total: S/. <%= total%>
                    </h3>

                    <button onclick="openCheckout()"
                            class="w-full mt-4 bg-green-600 text-white py-3 rounded-xl hover:bg-green-700">
                        Comprar
                    </button>

                </div>

            </aside>

        </main>

        <!-- FOOTER -->
        <footer class="bg-gradient-to-br from-green-800 to-green-950 text-white py-8 border-t-4 border-green-300">

            <div class="flex flex-col items-center text-center">

                <p class="text-sm opacity-80">ALUNA © 2026</p>

                <div class="flex justify-center gap-4 mt-4">

                    <a href="https://www.facebook.com/share/1GKdJh27SV/" target="_blank">
                        <img src="https://www.svgrepo.com/show/475647/facebook-color.svg"
                             class="w-6 hover:scale-125 transition duration-300">
                    </a>

                    <a href="https://instagram.com/alunaperu_" target="_blank">
                        <img src="https://www.svgrepo.com/show/452229/instagram-1.svg"
                             class="w-6 hover:scale-125 transition duration-300">
                    </a>

                    <a href="https://www.tiktok.com/@alunaperu_" target="_blank">
                        <img src="https://www.svgrepo.com/show/303260/tiktok-logo-logo.svg"
                             class="w-6 hover:scale-125 transition duration-300">
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
                           maxlength="100"
                           required
                           class="w-full px-5 py-4 rounded-2xl bg-white/20 text-white placeholder-white/70 focus:outline-none focus:ring-2 focus:ring-green-400">

                    <input type="password"
                           name="clave"
                           placeholder="Contraseña"
                           minlength="6"
                           maxlength="30"
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
                           pattern="[A-Za-zÁÉÍÓÚáéíóúÑñ ]{2,50}"
                           maxlength="50"
                           placeholder="Nombres"
                           required
                           class="w-full px-5 py-4 rounded-2xl bg-white/20 text-white placeholder-white/70 focus:outline-none focus:ring-2 focus:ring-green-400">

                    <input type="text"
                           name="apellidos"
                           pattern="[A-Za-zÁÉÍÓÚáéíóúÑñ ]{2,50}"
                           maxlength="50"
                           placeholder="Apellidos"
                           required
                           class="w-full px-5 py-4 rounded-2xl bg-white/20 text-white placeholder-white/70 focus:outline-none focus:ring-2 focus:ring-green-400">

                    <input type="email"
                           name="email"
                           maxlength="100"
                           placeholder="Correo"
                           required
                           class="w-full px-5 py-4 rounded-2xl bg-white/20 text-white placeholder-white/70 focus:outline-none focus:ring-2 focus:ring-green-400">

                    <input type="password"
                           name="clave"
                           minlength="6"
                           maxlength="30"
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

        <div id="checkoutModalBg"
             class="hidden fixed inset-0 bg-black/60 z-50 flex items-center justify-center p-4">

            <div class="bg-white dark:bg-gray-800 rounded-3xl p-8 w-[500px] max-h-[90vh] overflow-y-auto shadow-2xl relative">

                <button onclick="closeCheckout()"
                        class="absolute top-4 right-5 text-2xl font-bold">
                    ✕
                </button>

                <h2 class="text-3xl font-bold text-green-700 mb-6 text-center">
                    Finalizar Compra
                </h2>

                <form action="${pageContext.request.contextPath}/CarritoServlet"
                      method="post">

                    <input type="hidden"
                           name="accion"
                           value="finalizarCompra">

                    <div class="space-y-4">

                        <div>
                            <label class="font-semibold">
                                Departamento
                            </label>

                            <select
                                name="departamento"
                                required
                                class="w-full border rounded-xl p-3 mt-1">

                                <option value="">Seleccione un departamento</option>

                                <option value="Amazonas">Amazonas</option>
                                <option value="Áncash">Áncash</option>
                                <option value="Apurímac">Apurímac</option>
                                <option value="Arequipa">Arequipa</option>
                                <option value="Ayacucho">Ayacucho</option>
                                <option value="Cajamarca">Cajamarca</option>
                                <option value="Callao">Callao</option>
                                <option value="Cusco">Cusco</option>
                                <option value="Huancavelica">Huancavelica</option>
                                <option value="Huánuco">Huánuco</option>
                                <option value="Ica">Ica</option>
                                <option value="Junín">Junín</option>
                                <option value="La Libertad">La Libertad</option>
                                <option value="Lambayeque">Lambayeque</option>
                                <option value="Lima">Lima</option>
                                <option value="Loreto">Loreto</option>
                                <option value="Madre de Dios">Madre de Dios</option>
                                <option value="Moquegua">Moquegua</option>
                                <option value="Pasco">Pasco</option>
                                <option value="Piura">Piura</option>
                                <option value="Puno">Puno</option>
                                <option value="San Martín">San Martín</option>
                                <option value="Tacna">Tacna</option>
                                <option value="Tumbes">Tumbes</option>
                                <option value="Ucayali">Ucayali</option>

                            </select>
                        </div>

                        <div>
                            <label class="font-semibold">
                                Provincia
                            </label>

                            <input type="text"
                                   name="provincia"
                                   maxlength="100"
                                   required
                                   class="w-full border rounded-xl p-3 mt-1">
                        </div>

                        <div>
                            <label class="font-semibold">
                                Distrito
                            </label>

                            <input type="text"
                                   name="distrito"
                                   maxlength="100"
                                   required
                                   class="w-full border rounded-xl p-3 mt-1">
                        </div>

                        <div>
                            <label class="font-semibold">
                                Dirección
                            </label>

                            <input type="text"
                                   name="direccion"
                                   minlength="10"
                                   maxlength="150"
                                   placeholder="Ej: Avenida Progreso 156"
                                   required
                                   class="w-full border rounded-xl p-3 mt-1">
                        </div>

                        <div>
                            <label class="font-semibold">
                                Referencia
                            </label>

                            <input type="text"
                                   name="referencia"
                                   maxlength="150"
                                   placeholder="Ej: A 2 cuadras de la Plaza de Armas"
                                   class="w-full border rounded-xl p-3 mt-1">
                        </div>

                        <div>
                            <label class="font-semibold">
                                Teléfono
                            </label>

                            <input type="tel"
                                   name="telefono"
                                   pattern="[0-9]{9}"
                                   maxlength="9"
                                   minlength="9"
                                   required
                                   class="w-full border rounded-xl p-3 mt-1">
                        </div>

                        <div>
                            <label class="font-semibold">
                                Observaciones
                            </label>

                            <textarea
                                name="observaciones"
                                maxlength="300"
                                rows="3"
                                class="w-full border rounded-xl p-3 mt-1"
                                placeholder="Ej: Entregar después de las 5pm"></textarea>
                        </div>

                        <div>
                            <label class="font-semibold">
                                Método de Pago
                            </label>

                            <select id="metodoPago"
                                    name="metodoPago"
                                    onchange="mostrarQR()"
                                    required
                                    class="w-full border rounded-xl p-3 mt-1">

                                <option value="efectivo">Efectivo</option>
                                <option value="yape">Yape</option>
                                <option value="plin">Plin</option>
                                <option value="tarjeta">Tarjeta</option>

                            </select>

                            <div id="qrPago" class="hidden mt-4 text-center">

                                <img src="img/qr-yape.png"
                                     alt="QR Pago"
                                     class="mx-auto w-32 h-32 object-contain">

                                <p class="mt-2 text-sm text-gray-600">
                                    Escanea el QR y luego confirma tu pedido.
                                </p>

                            </div>

                        </div>

                        <div class="bg-green-50 p-4 rounded-xl">

                            <p class="text-xl font-bold text-green-700">
                                Total: S/. <%= total%>
                            </p>

                        </div>

                        <button type="submit"
                                class="w-full bg-green-600 text-white py-4 rounded-xl hover:bg-green-700">

                            Confirmar Pedido

                        </button>

                    </div>

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
            function openCheckout() {
                document.getElementById("checkoutModalBg")
                        .classList.remove("hidden");
            }

            function closeCheckout() {
                document.getElementById("checkoutModalBg")
                        .classList.add("hidden");
            }
        </script>

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
            function incrementar(btn) {
                let input = btn.parentElement.querySelector("input[name='cantidad']");
                input.value = parseInt(input.value) + 1;
            }

            function decrementar(btn) {
                let input = btn.parentElement.querySelector("input[name='cantidad']");
                let valor = parseInt(input.value);

                if (valor > 1) {
                    input.value = valor - 1;
                }
            }
        </script>

        <script>
            document.querySelectorAll("form").forEach(form => {

                form.addEventListener("submit", function (e) {

                    if (!this.checkValidity()) {

                        e.preventDefault();

                        alert("Por favor complete correctamente todos los campos.");

                    }

                });

            });
        </script>

        <script>
            document.addEventListener("DOMContentLoaded", function () {

                const buscador = document.getElementById("buscador");
                const filtroPrecio = document.getElementById("filtroPrecio");
                const filtroCategoria = document.getElementById("filtroCategoria");

                const plantas = document.querySelectorAll(".planta-item");

                function filtrar() {

                    const texto = buscador.value.toLowerCase();
                    const precio = filtroPrecio.value;
                    const categoria = filtroCategoria.value;

                    plantas.forEach(p => {

                        const nombre = p.dataset.nombre;
                        const precioPlanta = parseFloat(p.dataset.precio);
                        const categoriaPlanta = p.dataset.categoria;

                        let mostrar = true;

                        if (!nombre.includes(texto)) {
                            mostrar = false;
                        }

                        if (precio === "bajo" && precioPlanta >= 50) {
                            mostrar = false;
                        }

                        if (precio === "medio" && (precioPlanta < 50 || precioPlanta > 100)) {
                            mostrar = false;
                        }

                        if (categoria !== "todos" && categoriaPlanta !== categoria) {
                            mostrar = false;
                        }

                        p.style.display = mostrar ? "block" : "none";
                    });
                }

                buscador.addEventListener("input", filtrar);
                filtroPrecio.addEventListener("change", filtrar);
                filtroCategoria.addEventListener("change", filtrar);

            });
        </script>

        <script>
            function mostrarQR() {

                const metodo = document.getElementById("metodoPago").value;
                const qr = document.getElementById("qrPago");

                if (metodo === "yape" || metodo === "plin") {
                    qr.classList.remove("hidden");
                } else {
                    qr.classList.add("hidden");
                }
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

        <script>
            function toggleCarrito() {
                document
                        .getElementById("panelCarrito")
                        .classList.toggle("-translate-x-full");
            }
        </script>

    </body>

</html>