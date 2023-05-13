package controller.member;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class GoogleAuthentication extends Authenticator{
	PasswordAuthentication passAuth;

	public GoogleAuthentication() { 
		passAuth = new PasswordAuthentication("메일주소","2단계 인증 비밀번호");
		//gmail 아이디(메일주소), 앱 비밀번호(2단계 인증) 발급받은 16자리
	}

	public PasswordAuthentication getPasswordAuthentication() {
		return passAuth;
	}
}
