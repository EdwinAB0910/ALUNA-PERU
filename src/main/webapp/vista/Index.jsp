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

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    </head>

    <body>
        <input type="checkbox" id="modoOscuroToggle">

        <div class="pagina">

            <header class="encabezado">
                <div class="logotipo">
                    <img src="img/LogoAluna.png" alt="Logotipo" width="80" />
                    <h1>ALUNA</h1>
                </div>

                <nav class="nav">
                    <a href="${pageContext.request.contextPath}/inicio">Inicio</a>
                    <a href="${pageContext.request.contextPath}/catalogo">Catálogo</a>
                    <a href="${pageContext.request.contextPath}/consultas">Consultas</a>
                    <a href="${pageContext.request.contextPath}/ubicacion">Ubicación</a>
                </nav>

                <label for="modoOscuroToggle" class="modooscuro">🌙 / ☀️</label>
            </header>

            <section class="hero">

                <div class="hero-overlay"></div>

                <div class="hero-contenido">
                    <h1>Conecta tu vida con la naturaleza 🌿</h1>
                    <p>Descubre plantas únicas que transforman tu hogar en un espacio lleno de vida y bienestar</p>

                    <div class="hero-botones">
                        <a href="${pageContext.request.contextPath}/catalogo" class="btn-principal">
                            Ver catálogo
                        </a>
                    </div>
                </div>

            </section>

            <section class="nosotros">

                <!-- TÍTULO -->
                <div class="nosotros-header">
                    <h2>Sobre Nosotros 🌿</h2>
                    <p>Conectamos tu hogar con la naturaleza</p>
                </div>

                <!-- CONTENIDO PRINCIPAL -->
                <div class="nosotros-contenido">

                    <div class="nosotros-info">

                        <div class="nosotros-texto">
                            <h3>¿Quiénes somos?</h3>
                            <p>
                                <strong>ALUNA</strong> es un espacio donde la naturaleza se selecciona con intención.
                                Trabajamos con plantas de interior y exterior elegidas por su forma, presencia y carácter,
                                priorizando calidad antes que cantidad. Cada planta es cuidada y adaptada para integrarse de
                                manera natural en tu entorno, aportando
                                estética, calma y vida.
                            </p>
                        </div>

                        <div class="nosotros-extra">
                            <div>🌱 Amor por la naturaleza</div>
                            <div>🌿 Calidad en cada planta</div>
                            <div>🍃 Bienestar para tu hogar</div>
                        </div>
                    </div>

                    <div class="nosotros-img">
                        <img src="img/Helecho monedita.jpeg" alt="Naturaleza">
                    </div>

                </div>

                <!-- MISION VISION VALORES -->
                <div class="mvv">

                    <div class="card-mvv">
                        <i class="fas fa-seedling"></i>
                        <h3>Misión</h3>
                        <p>Ofrecer plantas cuidadosamente seleccionadas que transformen espacios en ambientes vivos,
                            estéticos y armoniosos, promoviendo una conexión auténtica con la naturaleza.</p>
                    </div>

                    <div class="card-mvv">
                        <i class="fas fa-leaf"></i>
                        <h3>Visión</h3>
                        <p>Convertirnos en una marca referente en el diseño y comercialización de plantas, destacando por
                            una propuesta estética, natural y de alta calidad, con proyección a un vivero especializado.</p>
                    </div>

                    <div class="card-mvv">
                        <i class="fas fa-tree"></i>
                        <h3>Valores</h3>
                        <p>Seleccionamos plantas con calidad, estética natural y autenticidad, cuidando cada detalle en su
                            cultivo y adaptación para lograr una belleza orgánica en equilibrio con el entorno, mientras
                            buscamos generar una conexión real con cada cliente y asumimos un compromiso total en todo el
                            proceso, desde el origen hasta su llegada.
                        </p>
                    </div>

                </div>

            </section>

            <footer class="footer">

                <div class="footer-contenedor">

                    <div class="footer-info">
                        <p class="copyright">ALUNA © 2026</p>
                    </div>

                    <div class="footer-redes">

                        <div class="redes">
                            <a href="https://www.facebook.com/share/1GKdJh27SV/" target="_blank">
                                <img src="https://www.svgrepo.com/show/475647/facebook-color.svg" alt="Facebook">
                            </a>

                            <a href="https://instagram.com/alunaperu_" target="_blank">
                                <img src="https://www.svgrepo.com/show/452229/instagram-1.svg" alt="Instagram">
                            </a>

                            <a href="https://tiktok.com/@alunaperu_" target="_blank">
                                <img src="https://www.svgrepo.com/show/303260/tiktok-logo-logo.svg" alt="TikTok">
                            </a>
                        </div>

                    </div>

                </div>

            </footer>

            <div class="whatsapp-carrusel" style="margin-bottom: -35px; position: fixed;
                 bottom: 60px;
                 right: 20px;
                 z-index: 9999;">
                <div class="whatsapp-track " style="text-align: center;">
                    <a href="https://wa.me/51967203776" target="_blank">
                        <img src="https://cdn-icons-png.flaticon.com/512/733/733585.png" alt="WhatsApp">
                    </a>
                </div>
            </div>
        </div>
    </body>
