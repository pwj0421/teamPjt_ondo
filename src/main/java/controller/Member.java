package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.member.MemberLogin;
import command.member.MemberLogout;
import command.member.MemberSave;
import command.member.PurposeList;
import common.CommonExecute;

/**
 * Servlet implementation class Member
 */
@WebServlet("/Member")
public class Member extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Member() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String gubun = request.getParameter("t_gubun");
		if(gubun == null) gubun="login";
		String viewPage = "";
		
		
		
		
		if(gubun.equals("login")) {
			viewPage = "member/member_login.jsp";
		//가입목적 리스트	
		}else if(gubun.equals("join")) {
			CommonExecute purpose = new PurposeList();
			purpose.execute(request);
			viewPage = "member/member_join.jsp";
		//회원가입
		}else if(gubun.equals("save")) {
			CommonExecute member = new MemberSave();
			member.execute(request);
			viewPage = "common_alert.jsp";
		}else if(gubun.equals("memberLogin")) {
			CommonExecute member = new MemberLogin();
			member.execute(request);
			viewPage = "common_alert.jsp";
			
		}else if(gubun.equals("logout")) {
			CommonExecute member = new MemberLogout();
			member.execute(request);
			viewPage ="common_alert.jsp";
		}
		
		
		RequestDispatcher rd = request.getRequestDispatcher(viewPage);
		rd.forward(request, response);
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
