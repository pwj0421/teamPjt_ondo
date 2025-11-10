package common;

import java.io.UnsupportedEncodingException;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class MailSender {
	
	public void sendMail(String toEmail, String subject, String content) throws MessagingException {
		final String fromEmail = "qkrtkdcjfgcp@gmail.com";  // 본인 Gmail
		final String password = "tchkszkcffvekuej"; // Gmail 계정의 앱 비밀번호

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.ssl.protocols", "TLSv1.2");


		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(fromEmail, password);
			}
		});
		try {
			Message message = new MimeMessage(session);
			
			// 1. 보내는 사람 설정
			try {
			    message.setFrom(new InternetAddress(fromEmail, "ONDO 관리자", "UTF-8"));
			} catch (UnsupportedEncodingException e) {
			    e.printStackTrace();
			    message.setFrom(new InternetAddress(fromEmail));
			}
			
			// 2. 받는 사람 / 제목 / 내용 — 반드시 send() 전에 설정
	        if (toEmail == null || toEmail.trim().isEmpty()) {
	            throw new MessagingException("수신자 이메일 주소가 비어 있습니다.");
	        }
	        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
            message.setSubject(subject);
            message.setContent(content, "text/html; charset=UTF-8");
            
	        // 3. 메일 발송
	        Transport.send(message);
			System.out.println("📨 메일 발송 완료 → " + toEmail);
			
		} catch (MessagingException e) {
		    e.printStackTrace();
		    System.out.println("❌ 메일 발송 실패");
		}
		

	}
}
