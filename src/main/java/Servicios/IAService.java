package Servicios;

import dao.PlantaDAO;
import modelo.Planta;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

public class IAService {

    private PlantaDAO plantaDAO = new PlantaDAO();

    public String preguntar(String pregunta, List<String> historial) {

        try {

            String texto = limpiarPregunta(pregunta);

            // ===========================
            // RESPUESTAS RÁPIDAS
            // ===========================
            if (texto.contains("horario")) {
                return "🌿 Nuestro horario de atención es de lunes a sábado de 9:00 a.m. a 7:00 p.m.";
            }

            if (texto.contains("ubicacion")
                    || texto.contains("dirección")
                    || texto.contains("donde estan")) {

                return "📍 ALUNA PERÚ se encuentra en Lima, Perú. También puedes revisar la sección 'Ubicación' de nuestra página.";
            }

            if (texto.contains("whatsapp")) {

                return "📱 Puedes comunicarte con nosotros al WhatsApp 967203776.";
            }

            if (texto.contains("envio")
                    || texto.contains("delivery")) {

                return "🚚 Realizamos envíos. Durante la compra podrás registrar la dirección donde deseas recibir tu pedido.";
            }

            if (texto.contains("pago")
                    || texto.contains("tarjeta")
                    || texto.contains("yape")
                    || texto.contains("plin")) {

                return "💳 Los métodos de pago disponibles aparecen durante el proceso de compra.";
            }

            // ===========================
            // BUSCAR PRODUCTOS
            // ===========================
            List<Planta> plantas = plantaDAO.buscarPorTexto(texto);

            StringBuilder contexto = new StringBuilder();

            if (!plantas.isEmpty()) {

                contexto.append("PRODUCTOS DISPONIBLES EN ALUNA:\n\n");

                for (Planta p : plantas) {

                    contexto.append("Nombre: ")
                            .append(p.getNombre())
                            .append("\n");

                    contexto.append("Precio: S/")
                            .append(p.getPrecio())
                            .append("\n");

                    contexto.append("Stock: ")
                            .append(p.getStock())
                            .append("\n");

                    contexto.append("Descripción: ")
                            .append(p.getDescripcion())
                            .append("\n\n");

                }

            } else {

                contexto.append("No se encontraron productos relacionados con la consulta.\n\n");

            }

            StringBuilder conversacion = new StringBuilder();

            if (historial != null && !historial.isEmpty()) {

                conversacion.append("CONVERSACIÓN ANTERIOR:\n\n");

                for (String linea : historial) {

                    conversacion.append(linea).append("\n");

                }

                conversacion.append("\n");
            }

            // ===========================
            // PROMPT
            // ===========================
            String prompt
                    = "Eres ALUNABOT, el asistente virtual oficial de ALUNA PERÚ.\n\n"
                    + conversacion
                    + "PERSONALIDAD:\n"
                    + "- Amable.\n"
                    + "- Profesional.\n"
                    + "- Responde de forma clara.\n"
                    + "- No escribas respuestas demasiado largas.\n\n"
                    + "CONTEXTO:\n"
                    + contexto
                    + "REGLAS:\n"
                    + "- Nunca inventes productos.\n"
                    + "- Usa únicamente la información del contexto cuando existan productos.\n"
                    + "- Si el stock es mayor que 0 indica que está disponible.\n"
                    + "- Si el stock es 0 indica que está agotado.\n"
                    + "- Si preguntan por cuidados puedes responder usando conocimientos de jardinería.\n"
                    + "- Si preguntan por un producto inexistente indica que actualmente no está registrado en ALUNA.\n"
                    + "- Si preguntan temas ajenos a ALUNA responde amablemente que solo puedes ayudar con plantas y servicios de ALUNA.\n\n"
                    + "Pregunta actual:\n"
                    + pregunta;

            JSONObject body = new JSONObject();

            body.put("model", "llama3.2:3b");
            body.put("prompt", prompt);
            body.put("stream", false);

            URL url = new URL("http://localhost:11434/api/generate");

            HttpURLConnection con
                    = (HttpURLConnection) url.openConnection();

            con.setRequestMethod("POST");
            con.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
            con.setDoOutput(true);

            try (OutputStream os = con.getOutputStream()) {

                os.write(body.toString().getBytes("UTF-8"));

            }

            int codigo = con.getResponseCode();

            BufferedReader br;

            if (codigo == 200) {

                br = new BufferedReader(
                        new InputStreamReader(con.getInputStream(), "UTF-8"));

            } else {

                br = new BufferedReader(
                        new InputStreamReader(con.getErrorStream(), "UTF-8"));

            }

            StringBuilder respuesta = new StringBuilder();

            String linea;

            while ((linea = br.readLine()) != null) {

                respuesta.append(linea);

            }

            br.close();

            if (codigo != 200) {

                return "No fue posible conectar con ALUNABOT.";

            }

            JSONObject json = new JSONObject(respuesta.toString());

            return json.getString("response").trim();

        } catch (Exception e) {

            e.printStackTrace();

            return "Lo siento, ocurrió un error al consultar ALUNABOT.";

        }

    }

    private String limpiarPregunta(String texto) {

        texto = texto.toLowerCase();

        texto = texto.replace("hay", "");
        texto = texto.replace("tienen", "");
        texto = texto.replace("tienes", "");
        texto = texto.replace("vende", "");
        texto = texto.replace("venden", "");
        texto = texto.replace("busco", "");
        texto = texto.replace("quiero", "");
        texto = texto.replace("necesito", "");
        texto = texto.replace("mostrar", "");
        texto = texto.replace("muéstrame", "");
        texto = texto.replace("me muestras", "");
        texto = texto.replace("disponible", "");
        texto = texto.replace("disponibles", "");
        texto = texto.replace("una", "");
        texto = texto.replace("un", "");
        texto = texto.replace("la", "");
        texto = texto.replace("el", "");
        texto = texto.replace("los", "");
        texto = texto.replace("las", "");
        texto = texto.replace("?", "");
        texto = texto.replace("¿", "");
        texto = texto.replace(".", "");
        texto = texto.replace(",", "");

        return texto.trim();

    }

}
