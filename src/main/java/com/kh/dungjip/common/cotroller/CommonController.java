package com.kh.dungjip.common.cotroller;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class CommonController {
	
	@GetMapping("subscribe.sb")
	public String subscribePage() {
		
		return "subscribe/subscribeView";
	}
	
	/** 메일 HOST **/
	private static final String HOST = "smtp.naver.com";
	/** 메일 PORT **/
	private static final String PORT = "587";
	/** 메일 ID **/
	private static final String MAIL_ID = "esk147@naver.com";
	/** 메일 PW **/
	private static final String MAIL_PW = "Cafelattee@1";
	
	@RequestMapping("sendEmail.do")
	public String sendEmail(String email, String body, HttpSession session) throws AddressException, MessagingException {
			try {
				InternetAddress[] receiverList = new InternetAddress[2];
				receiverList[0] = new InternetAddress("cogus0052@naver.com");
				receiverList[1] = new InternetAddress("esk114477@gmail.com");
				
				// SMTP 발송 Properties 설정
				Properties props = new Properties();
				props.put("mail.transport.protocol", "smtp");
				props.put("mail.smtp.host", HOST);
				props.put("mail.smtp.port", PORT);
				props.put("mail.smtp.starttls.enable", "true");
				props.put("mail.smtp.ssl.trust", HOST);
				props.put("mail.smtp.auth", "true");
				
				// SMTP Session 생성
				Session mailSession = Session.getDefaultInstance(props, new javax.mail.Authenticator(){
					protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
						return new javax.mail.PasswordAuthentication(MAIL_ID, MAIL_PW);
					}
				});
				
				String str = "문의 연락 이메일 : " + email + "<br><br><br>" + body;
				
				System.out.println(str);
				
				// Mail 조립
				Message mimeMessage = new MimeMessage(mailSession);
				mimeMessage.setFrom(new InternetAddress(MAIL_ID));
				mimeMessage.setRecipients(Message.RecipientType.TO, receiverList);
	            		// 메일 제목
				mimeMessage.setSubject("둥집에서 보내드린 메일입니다.");
	            		// 메일 본문 (.setText를 사용하면 단순 텍스트 전달 가능)
				mimeMessage.setContent(str, "text/html; charset=UTF-8");
				
				// Mail 발송
				Transport.send(mimeMessage);
				
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			session.setAttribute("alertMsg", "메일이 정상적으로 발송되었습니다. 빠른 시일 내 검토 후 연락드리겠습니다.");
			
			return "main";
		
	}
	
}
