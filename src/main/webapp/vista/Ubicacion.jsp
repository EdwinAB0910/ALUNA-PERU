<%-- 
    Document   : Ubicacion
    Created on : 6 may. 2026, 09:56:11
    Author     : EDWIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>ALUNA PERÚ - UBICACIÓN</title>
        <link rel="icon" href="img/LogoAluna.png" sizes="256x256" type="image/png" />

        <link rel="stylesheet" href="css/ubicacion.css">
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

            <main style="max-width: 1000px; margin: 40px auto; padding: 0 20px;">

                <h2 style="text-align: center; text-transform: uppercase;">Encuéntranos</h2>

                <div class="info-ubicacion">
                    <p style="font-style: italic; margin-bottom: 20px; color: #9ea899;">"En el corazón de la Selva Central,
                        donde la
                        tradición se
                        encuentra
                        con la naturaleza."</p>
                    <div class="info-item"><i class="fas fa-map-marker-alt" style="color: #8bc96f;"></i><span
                            style="color: #7e847b;">Calle 9 de Octubre, La Merced 12856, Chanchamayo - Referencia: al costado de bodega "GOYITO"</span></div>
                </div>

                <div class="mapa-container">
                    <iframe
                        src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d357.19954161638077!2d-75.32288121736877!3d-11.045381488658416!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1ses!2spe!4v1773699590956!5m2!1ses!2spe"
                        width="550px" height="100%" style="border:0;" allowfullscreen="" loading="lazy">
                    </iframe>
                </div>

            </main>
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

    </body>

