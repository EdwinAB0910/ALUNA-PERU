<%-- 
    Document   : adminPlantas
    Created on : 15 jun. 2026, 9:46:09 p. m.
    Author     : vladimir
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.List"%>
<%@page import="modelo.Planta"%>

<%

    modelo.Usuario usuario
            = (modelo.Usuario) session.getAttribute("usuario");

    if (usuario == null || usuario.getIdRol() != 1) {

        response.sendRedirect(
                request.getContextPath() + "/inicio"
        );

        return;

    }

    List<Planta> plantas
            = (List<Planta>) request.getAttribute("plantas");

%>



<!DOCTYPE html>

<html>

    <head>

        <meta charset="UTF-8">

        <title>Admin Plantas ALUNA</title>


        <script src="https://cdn.tailwindcss.com"></script>


    </head>



    <body class="bg-gradient-to-br from-green-100 to-cyan-100 min-h-screen p-10">



        <div class="max-w-7xl mx-auto bg-white rounded-3xl shadow-2xl p-8">



            <div class="flex justify-between items-center mb-8">


                <h1 class="text-4xl font-bold text-green-800">

                    🌿 Gestión de Plantas

                </h1>



                <div class="flex gap-3">


                    <button onclick="abrirAgregar()"
                            class="bg-green-600 text-white px-5 py-3 rounded-xl hover:bg-green-700">

                        ➕ Nueva Planta

                    </button>



                    <a href="${pageContext.request.contextPath}/inicio"
                       class="bg-gray-700 text-white px-5 py-3 rounded-xl">

                        🏠 Inicio

                    </a>


                </div>


            </div>





            <table class="w-full overflow-hidden rounded-2xl">


                <thead class="bg-green-700 text-white">


                    <tr>

                        <th class="p-4">Imagen</th>
                        <th>Nombre</th>
                        <th>Descripción</th>
                        <th>Precio</th>
                        <th>Stock</th>
                        <th>Acciones</th>

                    </tr>


                </thead>



                <tbody>



                    <%    if (plantas != null && !plantas.isEmpty()) {

                            for (Planta p : plantas) {

                    %>



                    <tr class="border-b hover:bg-green-50">


                        <td class="p-3">


                            <img src="<%=p.getImagen()%>"
                                 class="w-24 h-24 rounded-xl object-cover">


                        </td>



                        <td class="font-bold">

                            <%=p.getNombre()%>

                        </td>



                        <td>

                            <%=p.getDescripcion().replace("'","")%>

                        </td>



                        <td class="text-green-700 font-bold">

                            S/. <%=p.getPrecio()%>

                        </td>



                        <td>

                            <%=p.getStock()%>

                        </td>




                        <td class="space-x-2">



                            <button

                                onclick="editar(
                '<%=p.getId()%>',
                '<%=p.getNombre()%>',
                '<%=p.getDescripcion()%>',
                '<%=p.getPrecio()%>',
                '<%=p.getStock()%>',
                '<%=p.getImagen()%>'
                )"

                                class="bg-blue-600 text-white px-3 py-2 rounded-xl">

                                ✏ Editar

                            </button>




                            <a

                                href="${pageContext.request.contextPath}/AdminPlantaServlet?accion=eliminar&id=<%=p.getId()%>"

                                onclick="return confirm('Eliminar planta?')"

                                class="bg-red-600 text-white px-3 py-2 rounded-xl">

                                🗑

                            </a>



                        </td>



                    </tr>



                    <%

                        }

                    } else {


                    %>


                    <tr>

                        <td colspan="6"
                            class="text-center p-10">

                            No hay plantas registradas 🌱


                        </td>

                    </tr>


                    <%    }

                    %>



                </tbody>


            </table>



        </div>





        <!-- MODAL -->

        <div id="modal"

             class="hidden fixed inset-0 bg-black/50 flex items-center justify-center">



            <div class="bg-white p-8 rounded-3xl w-96">



                <h2 id="titulo"
                    class="text-2xl font-bold mb-5">

                    Agregar Planta

                </h2>



                <form action="${pageContext.request.contextPath}/AdminPlantaServlet"
                      method="post"
                      class="space-y-3">



                    <input type="hidden"
                           name="accion"
                           id="accion">



                    <input type="hidden"
                           name="id"
                           id="id">



                    <input name="nombre"
                           id="nombre"
                           placeholder="Nombre"
                           class="w-full p-3 border rounded-xl"
                           required>



                    <textarea
                        name="descripcion"
                        id="descripcion"
                        placeholder="Descripción"
                        class="w-full p-3 border rounded-xl"></textarea>



                    <input
                        name="precio"
                        id="precio"
                        placeholder="Precio"
                        class="w-full p-3 border rounded-xl"
                        required>



                    <input
                        name="stock"
                        id="stock"
                        placeholder="Stock"
                        class="w-full p-3 border rounded-xl"
                        required>



                    <input
                        name="imagen"
                        id="imagen"
                        placeholder="Imagen URL"
                        class="w-full p-3 border rounded-xl"
                        required>



                    <button

                        class="w-full bg-green-600 text-white p-3 rounded-xl">

                        Guardar

                    </button>



                </form>



                <button onclick="cerrar()"
                        class="mt-3 w-full bg-gray-400 text-white p-3 rounded-xl">

                    Cancelar

                </button>



            </div>


        </div>





        <script>


            function abrirAgregar() {


                modal.classList.remove("hidden");


                accion.value = "agregar";


                titulo.innerHTML = "➕ Nueva Planta";


                document.querySelector("form").reset();


            }




            function editar(id, nombre, desc, precio, stock, img) {


                modal.classList.remove("hidden");


                accion.value = "editar";


                titulo.innerHTML = "✏ Editar Planta";


                document.getElementById("id").value = id;

                document.getElementById("nombre").value = nombre;

                document.getElementById("descripcion").value = desc;

                document.getElementById("precio").value = precio;

                document.getElementById("stock").value = stock;

                document.getElementById("imagen").value = img;


            }



            function cerrar() {


                modal.classList.add("hidden");


            }



        </script>



    </body>

</html>