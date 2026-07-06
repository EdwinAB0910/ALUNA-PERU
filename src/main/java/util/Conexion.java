package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {

    public static Connection getConexion() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Datos exactos de tu panel de Clever Cloud:
            String url = "jdbc:mysql://bifbghhr6yfmfoafwe4u-mysql.services.clever-cloud.com:3306/bifbghhr6yfmfoafwe4u?useSSL=false&serverTimezone=UTC";
            String user = "ur7jfcdbb4ubswpd"; 
            String pass = "TU_CONTRASEÑA_DE_CLEVER_CLOUD"; // Dale clic al candado naranja en tu panel para verla y copiarla

            con = DriverManager.getConnection(url, user, pass);
        } catch (Exception e) {
            System.out.println("Error en la conexión BD: " + e.getMessage());
        }
        return con;
    }
}
