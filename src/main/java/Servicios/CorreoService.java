package Servicios;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import java.util.Properties;

public class CorreoService {

    private final String remitente = "alunaperueirl@gmail.com";
    private final String password = "TU_CONTRASEÑA_DE_APLICACION";

    public void enviar(String destinatario,
                       String asunto,
                       String mensaje) throws Exception {

        Properties props = new Properties();

        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
                new Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(remitente, password);
                    }
                });

        Message message = new MimeMessage(session);

        message.setFrom(new InternetAddress(remitente));
        message.setRecipients(
                Message.RecipientType.TO,
                InternetAddress.parse(destinatario)
        );

        message.setSubject(asunto);
        message.setText(mensaje);

        Transport.send(message);

        System.out.println("Correo enviado correctamente.");
    }
}