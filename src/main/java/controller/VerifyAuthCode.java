package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;

/**
 * Servlet implementation class VerifyAuthCode
 */
@WebServlet("/VerifyAuthCode")
public class VerifyAuthCode extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VerifyAuthCode() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String inputCode = request.getParameter("auth_code");
		String email = request.getParameter("m_email");
		String sessionCode = (String) session.getAttribute("authCode");
		
		PrintWriter out = response.getWriter();
		
		// 세션에 인증번호 없거나 만료된 경우
        if (sessionCode == null) {
            out.print("⏰ 인증번호가 만료되었습니다. 다시 전송해주세요.");
            return;
        }

        // 인증번호가 일치하지 않음
        if (!sessionCode.equals(inputCode)) {
            out.print("❌ 인증번호가 올바르지 않습니다.");
            return;
        }
        
     // 인증번호 일치 시 이메일로 아이디 조회
        MemberDao dao = new MemberDao();
        String userId = dao.getIdByEmail(email);

        if (userId != null) {
            out.print("✅ 인증 완료!<br>회원님의 아이디는 <b>" + userId + "</b> 입니다.");
            session.removeAttribute("authCode"); // 인증번호 일회성 사용
        } else {
            out.print("❗ 해당 이메일로 등록된 회원 정보를 찾을 수 없습니다.");
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
