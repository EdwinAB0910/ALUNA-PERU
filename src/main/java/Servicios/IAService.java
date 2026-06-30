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

    public String preguntar(String pregunta) {

        try {

            // Limpiar pregunta
            String texto = limpiarPregunta(pregunta);

            int categoria = detectarCategoria(texto);

            List<Planta> plantas;

            if (categoria != 0) {
                plantas = plantaDAO.buscarPorCategoria(categoria);
            } else {
                plantas = plantaDAO.buscarSimilares(texto);
            }

            String contexto = "";

            if (!plantas.isEmpty()) {

                contexto = "PRODUCTOS ENCONTRADOS EN ALUNA:\n\n";

                for (Planta p : plantas) {

                    contexto
                            += "Nombre: " + p.getNombre() + "\n"
                            + "Precio: S/" + p.getPrecio() + "\n"
                            + "Stock: " + p.getStock() + "\n"
                            + "Descripción: " + p.getDescripcion() + "\n\n";

                }

            } else {

                contexto
                        = "No se encontró ningún producto con ese nombre en ALUNA.\n\n";

            }

            String prompt
                    = "Eres ALUNABOT, asistente virtual de ALUNA PERÚ.\n\n"
                    + contexto
                    + "REGLAS IMPORTANTES:\n"
                    + "- Si aparecen productos encontrados, responde usando únicamente esos productos.\n"
                    + "- Nunca inventes productos.\n"
                    + "- Si un producto tiene stock mayor que 0 indica que está disponible.\n"
                    + "- Si el stock es 0 indica que está agotado.\n"
                    + "- Si preguntan por precios usa únicamente los precios mostrados.\n"
                    + "- Si preguntan cómo cuidar una planta responde usando tus conocimientos de jardinería.\n"
                    + "- Si preguntan por una planta que no existe en ALUNA indícalo amablemente.\n"
                    + "- Si preguntan algo fuera del negocio responde que solo ayudas con plantas y productos de ALUNA.\n\n"
                    + "Pregunta del cliente:\n"
                    + pregunta;

            JSONObject body = new JSONObject();

            body.put("model", "llama3.2:3b");
            body.put("prompt", prompt);
            body.put("stream", false);

            URL url = new URL("http://localhost:11434/api/generate");

            HttpURLConnection con
                    = (HttpURLConnection) url.openConnection();

            con.setRequestMethod("POST");
            con.setRequestProperty(
                    "Content-Type",
                    "application/json; charset=UTF-8");

            con.setDoOutput(true);

            try (OutputStream os = con.getOutputStream()) {

                os.write(body.toString().getBytes("UTF-8"));

            }

            int codigo = con.getResponseCode();

            BufferedReader br;

            if (codigo == 200) {

                br = new BufferedReader(
                        new InputStreamReader(
                                con.getInputStream(),
                                "UTF-8"));

            } else {

                br = new BufferedReader(
                        new InputStreamReader(
                                con.getErrorStream(),
                                "UTF-8"));

            }

            StringBuilder respuesta = new StringBuilder();

            String linea;

            while ((linea = br.readLine()) != null) {

                respuesta.append(linea);

            }

            br.close();

            if (codigo != 200) {

                return "Error al conectar con Ollama (" + codigo + ")";

            }

            JSONObject json
                    = new JSONObject(respuesta.toString());

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
        texto = texto.replace("me muestras", "");
        texto = texto.replace("mostrar", "");
        texto = texto.replace("muéstrame", "");
        texto = texto.replace("tendrán", "");
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
        texto = texto.replace(",", "");
        texto = texto.replace(".", "");

        texto = texto.trim();

        return texto;

    }

    private int detectarCategoria(String texto) {

        texto = texto.toLowerCase();

        if (texto.contains("monstera")) {
            return 1;
        }
        if (texto.contains("syngonium")) {
            return 2;
        }
        if (texto.contains("caladium")) {
            return 3;
        }
        if (texto.contains("begonia")) {
            return 4;
        }
        if (texto.contains("calathea")) {
            return 5;
        }
        if (texto.contains("aglaonema")) {
            return 6;
        }
        if (texto.contains("helecho")) {
            return 7;
        }
        if (texto.contains("philodendron")) {
            return 8;
        }
        if (texto.contains("croton")) {
            return 9;
        }
        if (texto.contains("anthurium")) {
            return 10;
        }
        if (texto.contains("colocasia")) {
            return 11;
        }
        if (texto.contains("alocasia")) {
            return 12;
        }
        if (texto.contains("epipremnum")) {
            return 13;
        }
        if (texto.contains("peperomia")) {
            return 14;
        }
        if (texto.contains("episcia")) {
            return 15;
        }

        return 0;
    }

}
