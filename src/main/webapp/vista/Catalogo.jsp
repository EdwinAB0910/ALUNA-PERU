<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Planta"%>
<%@page import="java.util.List"%>

<%
    List<Planta> lista = (List<Planta>) request.getAttribute("plantas");
%>

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
                background:
                    linear-gradient(rgba(0,0,0,.55), rgba(0,0,0,.55)),
                    url('img/banner.jpg');

                background-size: cover;
                background-position: center;
                height: 500px;
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
        <header class="flex flex-col md:flex-row items-center justify-between border-b-4 border-green-300 px-8 py-4 bg-green-900 sticky top-0 z-50">

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

        <!-- HERO -->
        <section class="hero flex items-center justify-center text-center px-6" style="background-image: url('img/Helecho cola de zorro.jpeg');">>

            <div class="glass rounded-[35px] px-10 py-14 text-white max-w-4xl shadow-2xl">

                <h1 class="text-5xl md:text-7xl font-bold mb-6">
                    ALUNA PERÚ
                </h1>

                <p class="text-xl md:text-2xl leading-relaxed font-light">
                    Plantas tropicales, exóticas y ornamentales
                    para transformar cada espacio en algo único.
                </p>

            </div>

        </section>

        <!-- MAIN -->
        <main class="max-w-7xl mx-auto px-6 py-16 flex-grow w-full">

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

                <div class="grid md:grid-cols-3 gap-5">

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

                <div
                    id="contenedorPlantas"
                    class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-8">

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
                                class="w-full h-72 object-cover">

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

                            <button
                                class="w-full bg-gradient-to-r from-green-700 to-emerald-500 hover:scale-105 text-white py-3 rounded-2xl font-semibold transition duration-300 shadow-lg">

                                <a href="${pageContext.request.contextPath}/consultas">Consultar</a>  

                            </button>

                        </div>

                    </div>

                    <% }%>

                </div>

            </section>

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

        <!-- WHATSAPP -->
        <div class="fixed bottom-8 right-5 z-50">

            <a href="https://wa.me/51967203776"
               target="_blank"
               class="fixed bottom-8 right-5 bg-green-400 p-4 rounded-full shadow-xl hover:scale-110 transition">

                <img src="https://cdn-icons-png.flaticon.com/512/733/733585.png"
                     alt="WhatsApp"
                     class="w-8 h-8">

            </a>

        </div>

        <!-- SCRIPT -->
        <script>

            const buscador = document.getElementById("buscador");
            const filtroPrecio = document.getElementById("filtroPrecio");
            const filtroCategoria = document.getElementById("filtroCategoria");

            const plantas = document.querySelectorAll(".planta-item");

            function filtrarPlantas() {

                const texto = buscador.value.toLowerCase();
                const precioFiltro = filtroPrecio.value;
                const categoriaFiltro = filtroCategoria.value;

                plantas.forEach(planta => {

                    const nombre = planta.dataset.nombre;
                    const precio = parseFloat(planta.dataset.precio);
                    const categoria = planta.dataset.categoria;

                    let coincideTexto = nombre.includes(texto);
                    let coincidePrecio = true;
                    let coincideCategoria = true;

                    // FILTRO PRECIO
                    if (precioFiltro === "bajo") {
                        coincidePrecio = precio < 50;
                    }

                    if (precioFiltro === "medio") {
                        coincidePrecio = precio >= 50 && precio <= 100;
                    }

                    // FILTRO CATEGORIA
                    if (categoriaFiltro !== "todos") {
                        coincideCategoria = categoria === categoriaFiltro;
                    }

                    planta.style.display =
                            coincideTexto &&
                            coincidePrecio &&
                            coincideCategoria
                            ? "block"
                            : "none";

                });

            }

            buscador.addEventListener("keyup", filtrarPlantas);
            filtroPrecio.addEventListener("change", filtrarPlantas);
            filtroCategoria.addEventListener("change", filtrarPlantas);

        </script>

    </body>

</html>