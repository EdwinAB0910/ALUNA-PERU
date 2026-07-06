package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {

    public static Connection getConexion() {
        Connection con = null;

        // 1. Intentamos leer las variables de entorno de Render
        String url = System.getenv("DB_URL");
        String user = System.getenv("DB_USER");
        String password = System.getenv("DB_PASSWORD");

        // 2. Si no existen (porque estás en tu PC local), usamos tus credenciales de localhost
        if (url == null || url.isEmpty()) {
            url = "jdbc:mysql://localhost:3306/aluna";
            user = "root";
            password = "";
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(url, user, password);
            System.out.println("CONECTADO A LA BASE DE DATOS CORRECTAMENTE");

        } catch (Exception e) {
            System.out.println("ERROR EN LA CONEXIÓN: " + e.getMessage());
            e.printStackTrace();
        }

        return con;
    }
}
