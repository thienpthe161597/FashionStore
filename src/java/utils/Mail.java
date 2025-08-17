package utils;


import java.util.Properties;
import java.util.Random;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Mail {
    private static final String from = "apexautos1110@gmail.com";
    private static final String pass = "kakwgvyrygrsujzk";

    public static String generateOTP() {
        Random random = new Random();
        int otp = 100 + random.nextInt(900); // Tạo OTP ngẫu nhiên 4 chữ số
        return String.valueOf(otp);
    }

    public String sendEmail(String recipient) {

        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.user", from);
        properties.put("mail.smtp.password", pass);
        Session session = Session.getInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, pass);
            }
        });
        String otp = generateOTP();
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipient));
            message.setSubject("Your OTP Code");
            message.setText("Your OTP code is: " + otp);

            Transport.send(message);
            System.out.println("OTP sent successfully!");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return otp;
    }
}
