package com.se.fit.TravelProject.service;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service
public class SendMailService {
	@Autowired
	private JavaMailSender javaMailSender;

	private void sendEmail(String toEmail, String subject, String message) {
		MimeMessage mimeMessage = javaMailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(mimeMessage);

		try {
			helper.setTo(toEmail);
			helper.setSubject(subject);
			helper.setText(message);

			javaMailSender.send(mimeMessage);

			System.out.println("Email sent successfully!");
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	public void sendBookingConfirmationEmail(String toEmail, String name) {
		String subject = " Xác Nhận Đặt Tour Thành Công";
		String message = "\r\n" + "Chào "+ name +",\r\n" + "\r\n"
				+ "Chúc mừng! Chúng tôi xác nhận rằng bạn đã đặt tour thành công với chúng tôi.\r\n"
				+ "Chúng tôi rất mong đợi sự tham gia của bạn và chắc chắn rằng bạn sẽ có một trải nghiệm tuyệt vời cùng chúng tôi.\r\n"
				+ "\r\n"
				+ "Chi tiết hóa đơn và thông tin thanh toán sẽ được gửi đến bạn trong thời gian sớm nhất. Hãy kiểm tra hộp thư đến của bạn để cập nhật thông tin.\r\n"
				+ "\r\n"
				+ "Nếu bạn có bất kỳ câu hỏi hoặc cần hỗ trợ thêm, đừng ngần ngại liên hệ với chúng tôi tại Travelor@support.co.vn hoặc số điện thoại 0990-999-999.\r\n"
				+ "\r\n" + "Cảm ơn bạn đã chọn chúng tôi để trải nghiệm hành trình đặc biệt này!\r\n" + "\r\n"
				+ "Trân trọng,\r\n" + "TRAVELOR.CO";

		sendEmail(toEmail, subject, message);
	}
	public void sendRegisterSuccess(String toEmail, String name, String user, String pass) {
		String subject = "Xác Nhận Đăng Ký Tài Khoản Thành Công";
		String message = "Chào "+name+",\r\n"
				+ "\r\n"
				+ "Chúc mừng! Chúng tôi rất vui mừng thông báo rằng bạn đã đăng ký thành công tài khoản trên Travel.Lo.\r\n"
				+ "\r\n"
				+ "Dưới đây là một số thông tin về tài khoản của bạn:\r\n"
				+ "\r\n"
				+ "Tài khoản: " + user + " \r\n"
				+ "Mật khẩu: " + pass + " \r\n"
				+ "Ngày Đăng Ký:  " + LocalDate.now() + "\r\n"
				+ "\r\n"
				+ "Hãy giữ lại thông tin này cho mọi công việc liên quan đến tài khoản của bạn.\r\n"
				+ "\r\n"
				+ "Nếu bạn có bất kỳ câu hỏi hoặc cần hỗ trợ, đừng ngần ngại liên hệ với chúng tôi tại Travelor@support.co.vn hoặc số điện thoại 0999-999-999.\r\n"
				+ "\r\n"
				+ "Cảm ơn bạn đã tham gia cùng chúng tôi! Chúc bạn có những trải nghiệm tuyệt vời trên Travelor.co .\r\n"
				+ "\r\n"
				+ "Trân trọng,\r\n"
				+ "TRAVELOR.CO";
		
		sendEmail(toEmail, subject, message);
	}
	
	public void sendPassNew(String toEmail, String name, String pass) {
		String subject = "Thông báo: Mật khẩu mới cho tài khoản của bạn";
		String message = "Chào bạn "+name+",\r\n"
				+ "\r\n"
				+ "Chúng tôi đã nhận được yêu cầu đặt lại mật khẩu cho tài khoản của bạn. Dưới đây là mật khẩu mới của bạn:\r\n"
				+ "\r\n"
				+ "Mật khẩu mới: "+pass+"\r\n"
				+ "\r\n"
				+ "Vui lòng đảm bảo rằng bạn giữ mật khẩu này an toàn và không chia sẻ với người khác. Nếu bạn không thực hiện yêu cầu này, vui lòng liên hệ với chúng tôi ngay lập tức.\r\n"
				+ "\r\n"
				+ "Trân trọng,\r\n"
				+ "TRAVELOR.CO";
		sendEmail(toEmail, subject, message);
	}
}
