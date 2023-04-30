package controller.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/mailSend")
public class MailSend extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public MailSend() {
        super();
       
    }

		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");;
		
		String num = request.getParameter("num");
		String receiver = request.getParameter("email");
		System.out.println(num);
		System.out.println(receiver);
	
		String subject = "인증번호 확인하세요";
		String content = "인증번호 :"+num;
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		try {
			Properties p = System.getProperties(); //서버 정보를 p객체에 저장
			
			p.put("mail.smtp.starttls.enable","true");
			p.put("mail.smtp.host","smtp.gmail.com"); //gmail.com
			p.put("mail.smtp.auth", "true");
			p.put("mail.smtp.port", "587"); //gmail 포트번호
			
			Authenticator auth = new GoogleAuthentication(); //인증정보 생성
			Session s = Session.getInstance(p, auth); //메일 전송 역할하는 객체 생성
			Message m = new MimeMessage(s); //s객체를 사용하여 전송할 m객체 생성
			
			Address receiver_address = new InternetAddress(receiver); //받는 사람

			//메일 전송에 필요한 설정 부분
			m.setHeader("content-type", "text/html;charset=utf-8");
			m.addRecipient(Message.RecipientType.TO, receiver_address);
			m.setSubject(subject);
			m.setContent(content, "text/html;charset=utf-8");
			m.setSentDate(new Date());
			
			Transport.send(m); //메세지를 메일로 전송
			
			out.print("메일 전송");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
