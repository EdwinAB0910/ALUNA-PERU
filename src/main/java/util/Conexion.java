package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {

    public static Connection getConexion() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://bifbghhr6yfmfoafwe4u-mysql.services.clever-cloud.com:3306/bifbghhr6yfmfoafwe4u?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
            String user = "ur7jfcdbb4ubswpd"; 
            String pass = "01sknrMNSVIOcHc3RqVF"; 

            con = DriverManager.getConnection(url, user, pass);
        } catch (Exception e) {
            System.out.println("Error conexión: " + e.getMessage());
        }
        return con;
    }
}
