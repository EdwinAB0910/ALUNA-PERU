<%-- 
    Document   : Consultas
    Created on : 6 may. 2026, 09:55:59
    Author     : EDWIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>ALUNA PERÚ - CONSULTAS</title>
        <link rel="icon" href="img/LogoAluna.png" sizes="256x256" type="image/png" />

        <link rel="stylesheet" href="css/consultas.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

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

                <label for="modoOscuroToggle">🌙 / ☀️</label>
            </header>

            <main>
                <h2 style="text-align: center; margin-top: 40px; color: #2f5d3a;">Centro de Ayuda</h2>
                <p style="text-align: center; color: #666; max-width: 600px; margin: 0 auto 40px auto;">
                    ¿Tienes algún problema con tu pedido o alguna sugerencia? Estamos aquí para escucharte.
                </p>

                <section
                    style="display: flex; flex-wrap: wrap; justify-content: center; gap: 20px; max-width: 1000px; margin: 0 auto;">

                    <div
                        style="background: white; padding: 30px; border-radius: 10px; text-align: center; flex: 1; min-width: 400px; box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1); border-bottom: 4px solid #48cf79;">

                        <div style="display: flex; justify-content: center; gap: 15px; margin-bottom: 15px;">
                            <i class="fab fa-whatsapp" style="font-size: 2.5rem; color: #25D366;"></i>
                            <i class="fas fa-phone-alt" style="font-size: 2.3rem; color: #48cf79;"></i>
                        </div>

                        <h3 style="margin: 10px 0; color: black;">Comunícate con nosotros</h3>
                        <p style="color: black;">967203776</p>
                        <small style="color: #888;">Lunes a Domingo: 8:00 a.m. - 7:30 p.m.</small>
                    </div>

                    <div
                        style="background: white; padding: 30px; border-radius: 10px; text-align: center; flex: 1; min-width: 400px; box-shadow: 0 5px 15px rgba(0,0,0,0.1); border-bottom: 4px solid #48cf79;">
                        <i class="fas fa-envelope-open-text"
                           style="font-size: 2.5rem; color: #8bc96f; margin-bottom: 15px;"></i>
                        <h3 style="margin: 10px 0; color: black;">Escríbenos</h3>
                        <p style="color: black;">alunaperueirl@gmail.com</p>
                        <small style="color: #888;">Respondemos en menos de 2 hrs</small>
                    </div>

                </section>
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


