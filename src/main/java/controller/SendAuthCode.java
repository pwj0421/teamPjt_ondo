package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.MailSender;
import dao.MemberDao;

/**
 * Servlet implementation class SendAuthCode
 */
@WebServlet("/SendAuthCode")
public class SendAuthCode extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendAuthCode() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain; charset=UTF-8");
		
		String name = request.getParameter("m_name");
		String email = request.getParameter("m_email");
		String id = request.getParameter("m_id"); // 비밀번호 찾기 시 사용
		String mode = request.getParameter("mode"); // "id" or "password"
		if (mode == null) mode = "id"; // 기본값 추가
		System.out.println("📧 수신 이메일: " + email + " | mode: " + mode);
		PrintWriter out = response.getWriter();
		MemberDao dao = new MemberDao();
		
		try {
			// ✅ 1️⃣ 회원 검증 단계
			if ("password".equals(mode)) {
				// 비밀번호 찾기용 → 아이디와 이메일 둘 다 확인
				boolean exist = dao.checkMemberByIdEmail(id, email);
				if (!exist) {
					out.print("입력하신 아이디와 이메일이 일치하지 않습니다.");
					return;
				}
			} else {
				// 아이디 찾기용 → 이메일만 등록 확인
				boolean emailExist = dao.checkMemberByNameEmail(name, email);
				if (!emailExist) {
					out.print("등록되지 않은 이메일입니다.");
					return;
				}
			}
		
		String authCode = String.valueOf(new Random().nextInt(900000) + 100000);
		
		HttpSession session = request.getSession();
		session.setAttribute("authCode", authCode);
		session.setAttribute("authEmail", email);
		session.setAttribute("authMode", mode);
		session.setMaxInactiveInterval(300); // 5분 유효
		
		// ✅ 4️⃣ 메일 내용
		String title = "[ONDO] 인증번호 안내";
		String purpose = "password".equals(mode) ? "비밀번호 재설정" : "아이디 찾기";

		String content = "안녕하세요, ONDO입니다.<br><br>"
					+ purpose + "을 위한 인증번호는 아래와 같습니다.<br>"
					+ "<h2>" + authCode + "</h2><br>"
					+ "5분 이내에 입력해주세요.<br><br>"
					+ "감사합니다.";
		
		// ✅ 5️⃣ 메일 발송
		MailSender mailSender = new MailSender();
		mailSender.sendMail(email, title, content);

		System.out.println("✅ 인증메일 발송 완료 → " + email + " (" + mode + ")");
		out.print("SUCCESS");
			
		} catch (Exception e) {
			e.printStackTrace();
			out.print("FAIL");
		} finally {
			out.close();
		}
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
