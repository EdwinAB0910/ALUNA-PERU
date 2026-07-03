<%-- 
    Document   : admin
    Created on : 15 jun. 2026, 9:45:18 p. m.
    Author     : vladimir
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%

    modelo.Usuario usuario
            = (modelo.Usuario) session.getAttribute("usuario");

    if (usuario == null) {

        response.sendRedirect(
                request.getContextPath() + "/inicio"
        );

        return;
    }

    if (usuario.getIdRol() != 1) {

        response.sendRedirect(
                request.getContextPath() + "/inicio"
        );

        return;
    }

%>



<!DOCTYPE html>
<html>

    <head>

        <meta charset="UTF-8">

        <title>Panel Administrador - ALUNA</title>


        <script src="https://cdn.tailwindcss.com"></script>


        <script>

            tailwind.config = {
                darkMode: 'class'
            }

        </script>


    </head>



    <body class="min-h-screen bg-gradient-to-br from-green-100 via-white to-cyan-100">


        <!-- HEADER -->

        <header class="
                bg-gradient-to-r
                from-green-900
                to-green-700
                text-white
                px-8
                py-5
                shadow-xl
                flex
                justify-between
                items-center
                ">


            <div>

                <h1 class="text-3xl font-bold">

                    🌿 ALUNA ADMIN

                </h1>


                <p class="text-green-200">

                    Panel de administración

                </p>

            </div>



            <div class="text-right">


                <p class="font-semibold">

                    Administrador:

                    <%= usuario.getNombres()%>

                </p>


            </div>


        </header>





        <!-- CONTENIDO -->


        <main class="
              p-10
              grid
              grid-cols-1
              md:grid-cols-2
              gap-8
              ">





            <!-- CARD PLANTAS -->


            <div class="
                 bg-white
                 rounded-3xl
                 shadow-2xl
                 p-8
                 hover:-translate-y-2
                 transition
                 border
                 border-green-200
                 ">


                <div class="text-6xl mb-5">

                    🌱

                </div>



                <h2 class="
                    text-3xl
                    font-bold
                    text-green-800
                    mb-3
                    ">

                    Gestionar Plantas

                </h2>



                <p class="
                   text-gray-600
                   mb-6
                   ">

                    Crear, modificar, eliminar y controlar
                    el catálogo de plantas ALUNA.

                </p>

                <a href="${pageContext.request.contextPath}/AdminPlantaServlet?accion=listar"
                   class="
                   block
                   text-center
                   bg-green-600
                   hover:bg-green-700
                   text-white
                   py-4
                   rounded-2xl
                   font-bold
                   shadow-lg
                   transition">

                    🌿 Administrar catálogo

                </a>




            </div>







            <!-- CARD INICIO -->


            <div class="
                 bg-white
                 rounded-3xl
                 shadow-2xl
                 p-8
                 hover:-translate-y-2
                 transition
                 border
                 border-cyan-200
                 ">


                <div class="text-6xl mb-5">

                    🏠

                </div>



                <h2 class="
                    text-3xl
                    font-bold
                    text-cyan-800
                    mb-3
                    ">

                    Página principal

                </h2>



                <p class="
                   text-gray-600
                   mb-6
                   ">

                    Regresar al inicio de ALUNA Perú.

                </p>



                <a href="${pageContext.request.contextPath}/inicio"

                   class="
                   block
                   text-center
                   bg-cyan-600
                   hover:bg-cyan-700
                   text-white
                   py-4
                   rounded-2xl
                   font-bold
                   shadow-lg
                   transition
                   ">


                    🏠 Volver Inicio


                </a>


            </div>
            <!-- CARD PEDIDOS -->

            <div class="
                 bg-white
                 rounded-3xl
                 shadow-2xl
                 p-8
                 hover:-translate-y-2
                 transition
                 border
                 border-yellow-200
                 ">

                <div class="text-6xl mb-5">
                    📦
                </div>

                <h2 class="
                    text-3xl
                    font-bold
                    text-yellow-700
                    mb-3
                    ">
                    Gestionar Pedidos
                </h2>

                <p class="
                   text-gray-600
                   mb-6
                   ">
                    Ver todos los pedidos realizados por los clientes y actualizar su estado.
                </p>

                <a href="${pageContext.request.contextPath}/adminPedidos"
                   class="
                   block
                   text-center
                   bg-yellow-500
                   hover:bg-yellow-600
                   text-white
                   py-4
                   rounded-2xl
                   font-bold
                   shadow-lg
                   transition">

                    📦 Ver pedidos

                </a>

            </div>





        </main>






        <footer class="
                fixed
                bottom-0
                w-full
                bg-green-900
                text-white
                text-center
                py-3
                ">


            ALUNA PERÚ © 2026


        </footer>




    </body>

</html>