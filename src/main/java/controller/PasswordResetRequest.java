package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.MailSender;
import dao.MemberDao;

/**
 * Servlet implementation class PasswordResetRequest
 */
@WebServlet("/PasswordResetRequest")
public class PasswordResetRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PasswordResetRequest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain; charset=UTF-8");

		String id = request.getParameter("m_id");
		String email = request.getParameter("m_email");

		PrintWriter out = response.getWriter();
		MemberDao dao = new MemberDao();

		try {
			// ① 아이디 + 이메일 검증
			boolean exist = dao.checkMemberByIdEmail(id, email);
			if (!exist) {
				out.print("입력하신 아이디와 이메일이 일치하지 않습니다.");
				return;
			}

			// ② 인증번호 생성
			String authCode = String.valueOf((int)(Math.random() * 900000) + 100000);

			// ③ 세션에 저장
			request.getSession().setAttribute("authCode", authCode);
			request.getSession().setAttribute("authEmail", email);
			request.getSession().setMaxInactiveInterval(300); // 5분 유효

			// ④ 이메일 발송
			String subject = "[ONDO] 비밀번호 재설정 인증번호 안내";
			String content = "안녕하세요, ONDO입니다.<br><br>"
					+ "비밀번호 재설정을 위한 인증번호는 아래와 같습니다.<br>"
					+ "<h2>" + authCode + "</h2>"
					+ "<br>5분 이내에 입력해주세요.<br><br>감사합니다.";

			MailSender mailSender = new MailSender();
			mailSender.sendMail(email, subject, content);

			System.out.println("✅ 비밀번호 재설정 인증메일 발송 완료 → " + email);
			out.print("EXIST");

		} catch (Exception e) {
			e.printStackTrace();
			out.print("서버 오류가 발생했습니다.");
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
