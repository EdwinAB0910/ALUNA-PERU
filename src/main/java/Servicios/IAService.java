package Servicios;

import dao.PlantaDAO;
import modelo.Planta;
import java.util.List;

public class IAService {

    private PlantaDAO plantaDAO = new PlantaDAO();

    public String preguntar(String pregunta, List<String> historial) {
        try {
            String texto = limpiarPregunta(pregunta);

            // ==========================================
            // 1. RESPUESTAS RÁPIDAS (Flujo original)
            // ==========================================
            if (texto.contains("horario") || texto.contains("hora")) {
                return "🌿 Nuestro horario de atención es de lunes a sábado de 9:00 a.m. a 7:00 p.m.";
            }

            if (texto.contains("ubicacion") || texto.contains("dirección") || texto.contains("donde estan")) {
                return "📍 ALUNA PERÚ se encuentra en Lima, Perú. También puedes revisar la sección 'Ubicación' de nuestra página.";
            }

            if (texto.contains("whatsapp") || texto.contains("celular") || texto.contains("teléfono")) {
                return "📱 Puedes comunicarte con nosotros al WhatsApp 967203776.";
            }

            if (texto.contains("envio") || texto.contains("delivery") || texto.contains("enviar")) {
                return "🚚 Realizamos envíos a domicilio. Durante el proceso de compra podrás registrar tu dirección exacta.";
            }

            if (texto.contains("pago") || texto.contains("tarjeta") || texto.contains("yape") || texto.contains("plin")) {
                return "💳 Los métodos de pago disponibles (Yape, Plin, Tarjetas) aparecen durante el proceso de compra.";
            }
            
            if (texto.contains("hola") || texto.contains("buenos dias") || texto.contains("buenas tardes")) {
                return "👋 ¡Hola! Soy ALUNABOT, tu asistente virtual. ¿En qué planta o servicio de ALUNA PERÚ te gustaría que te ayude hoy?";
            }

            // ==========================================
            // 2. BÚSQUEDA DIRECTA EN BASE DE DATOS (Simula la IA)
            // ==========================================
            if (texto.length() > 2) { 
                List<Planta> plantas = plantaDAO.buscarPorTexto(texto);

                if (!plantas.isEmpty()) {
                    Planta p = plantas.get(0); // Tomamos la coincidencia más exacta
                    
                    String estadoStock = (p.getStock() > 0) 
                        ? "🟢 ¡Sí tenemos disponibles! Contamos con " + p.getStock() + " unidades en stock." 
                        : "🔴 Actualmente se encuentra agotado.";

                    return "🌿 **¡Hola! He buscado en nuestro catálogo:**\n\n"
                            + "📋 **Nombre:** " + p.getNombre() + "\n"
                            + "💰 **Precio:** S/ " + p.getPrecio() + "\n"
                            + "📦 **Disponibilidad:** " + estadoStock + "\n"
                            + "📝 **Descripción:** " + p.getDescripcion() + "\n\n"
                            + "✨ ¿Te gustaría que te ayude a iniciar el proceso de compra de esta planta?";
                }
            }

            // ==========================================
            // 3. RESPUESTA POR DEFECTO
            // ==========================================
            return "🤖 Actualmente no encontré plantas registradas con ese nombre en ALUNA, o la pregunta está fuera de mis servicios.\n\n"
                 + "Prueba consultándome por plantas específicas (ej: *Orquídea, Suculenta, Helecho*) o por nuestros *horarios* o *whatsapp*.";

        } catch (Exception e) {
            e.printStackTrace();
            return "Lo siento, ocurrió un inconveniente temporal para conectar con ALUNABOT.";
        }
    }

    private String limpiarPregunta(String texto) {
        if (texto == null) return "";
        texto = texto.toLowerCase();
        texto = texto.replace("?", "").replace("¿", "").replace(".", "").replace(",", "");
        return texto.trim();
    }
}
