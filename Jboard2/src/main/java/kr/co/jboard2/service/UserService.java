package kr.co.jboard2.service;

import java.util.List;
import java.util.Properties;
import java.util.concurrent.ThreadLocalRandom;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.jboard2.dao.UserDAO;
import kr.co.jboard2.db.SQL;
import kr.co.jboard2.dto.UserDTO;

public enum UserService {

	INSTATNCE;
	
	private UserDAO dao = UserDAO.getInstance();
	
	private static String generatedCode;
	
	private Logger logger =LoggerFactory.getLogger(this.getClass());
	
	public void insertUser(UserDTO dto) {
		dao.insertUser(dto);
	}
	
	public UserDTO selectUser(String uid, String pass) {
		return dao.selectUser(uid, pass);
	}
	
	public UserDTO selectUserByNameAndEmail(String name, String email) {
		return dao.selectUserByNameAndEmail(name, email);
	}
	
	public UserDTO selectUserByUidAndEmail(String uid, String email) {
		return dao.selectUserByUidAndEmail(uid, email);
	}
	
	public int updateUserForWithraw(String uid) {
		return dao.updateUserForWithraw(uid);
	}
	
	public List<UserDTO> selectUsers() {
		return null;
	}
	public void upadteUser(UserDTO dto) {
		dao.upadteUser(dto);
	}
	
	public int updatePass(String uid,String pass) {
		return dao.upadtePass(uid,pass);
	}
	
	public void deleteUser(UserDTO dto) {
		
	}
	
	public int selectCountUid(String uid) {
		return dao.selectCountUid(uid);
	}
	
	public int selectCountNick(String nick) {
		return dao.selectCountNick(nick);
	}
	
	public int selectCountHp(String hp) {
		return dao.selectCountHp(hp);
	}
	
	public int selectCountEmail(String email) {
		return dao.selectCountEmail(email);
	}
	public int selectCountNameAndEmail(String email, String name) {
		return dao.selectCountNameAndEmail(email,name);
	}
	
	public int selectCountUidAndEmail(String email, String uid) {
		return dao.selectCountUidAndEmail(email,uid);
	}
	
	
	public int sendCodeByEmail(String email) {
		
		//인증코드생성
		int code=ThreadLocalRandom.current().nextInt(100000,1000000);
		generatedCode =""+code;
		
		
		//기본정보
		String sender="ainu90@gmail.com";
		String password="knoylclbyjyiwvks";
		String title="Jboard2 인증코드 입니다";
		String content="<h1> 인증코드는 "+code+"</h1>";
		
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.starttls.trust", "smtp.gmail.com");
		
		// Gmail STMP 세션 생성
		int status =0;
		Session gmailSession = Session.getInstance(props, new Authenticator(){
			
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(sender, password);
			}
		});
		
		// 메일 발송
		Message message = new MimeMessage(gmailSession);
		
		try{
			message.setFrom(new InternetAddress(sender, "Jboard2", "UTF-8"));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
			message.setSubject(title);
			message.setContent(content, "text/html;charset=UTF-8");
			Transport.send(message);
			
			status=1;
			
		}catch(Exception e){
			status=0;
		}
		
		// 다시 폼 이동
		return status;
		
	}
	
	
	public int confirmCodeByEmail(String code) {
		logger.info("code : "+code);
		logger.info("generatedCode: "+generatedCode);
		if(code.equals(generatedCode)) {

			return 1;
		}else {
			return 0;
		}
		
		
	}


	
	
}
