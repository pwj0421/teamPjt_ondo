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
		String email = request.getParameter("m_email");
		System.out.println("📧 수신 이메일: " + email);
		
		String authCode = String.valueOf(new Random().nextInt(900000) + 100000);
		
		HttpSession session = request.getSession();
		session.setAttribute("authCode", authCode);
		session.setAttribute("authEmail", email);
		
		try {
			MailSender mailSender = new MailSender();
			mailSender.sendMail(email, "ONDO 아이디 찾기 인증번호", 
					"인증번호는 " + authCode + " 입니다. \n5분 안에 입력해주세요."); 
			
			response.setContentType("text/plain; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("SUCCESS");
			out.close();
			
		} catch(Exception e) {
			e.printStackTrace();
			response.setContentType("text/plain; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("FAIL");
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
