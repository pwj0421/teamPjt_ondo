package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import command.member.CountryList;
import command.member.InterestList;
import command.member.MatchInfoInterestUpdate;
import command.member.MatchInfoUpdate;
import command.member.MatchInfoView;
import command.member.MemberChangePassword;
import command.member.MemberDeleteAccount;
import command.member.MemberInfo;
import command.member.MemberLogin;
import command.member.MemberLogout;
import command.member.MemberNickCheck;
import command.member.MemberSave;
import command.member.MemberUpdate;
import command.member.PurposeList;
import common.CommonExecute;
import common.CommonUtil;
import dao.MyInfoUpdateDao;

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
		String sessionId = CommonUtil.getSessionInfo(request, "id");
		String gubun = request.getParameter("t_gubun");
		if(gubun == null && sessionId == null) gubun="login";
		if(gubun == null && sessionId != null) gubun="myInfo";
		String viewPage = "";
		
		
		
		
		if(gubun.equals("login")) {
			viewPage = "member/member_login.jsp";
		//가입목적, 관심사, 국가 리스트	
		}else if(gubun.equals("join")) {
			CommonExecute purpose = new PurposeList();
			CommonExecute interest = new InterestList();
			CommonExecute country = new CountryList();
			purpose.execute(request);
			interest.execute(request);
			country.execute(request);
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
			
		}else if(gubun.equals("myInfo")) {
			if(CommonUtil.getSessionInfo(request, "id") == null) {
				request.setAttribute("t_msg", "세션 정보가 만료되었습니다. 다시 로그인 해주세요.");
				request.setAttribute("t_url", "Member");
				viewPage="common_alert.jsp";
			} else {
				CommonExecute member = new MemberInfo();
				member.execute(request);
				CommonExecute country = new CountryList();
				country.execute(request);
				CommonExecute purpose = new PurposeList();
				purpose.execute(request);
				
				viewPage ="member/member_myInfo.jsp";
			}
			
		}else if(gubun.equals("memberUpdate")) {
			CommonExecute member = new MemberUpdate();
			member.execute(request);
			viewPage = "member/common_alert_view.jsp";
			
		} else if(gubun.equals("memberDelete")) {
			CommonExecute member = new MemberDeleteAccount();
			member.execute(request);
			viewPage = "common_alert.jsp";
			
		}else if(gubun.equals("matchInfo")) {
			 CommonExecute match = new MatchInfoView();
	         match.execute(request);
	         
	         // 관심사 목록
			 CommonExecute interestList = new command.member.InterestList();
			 interestList.execute(request);
				
			 // 나의 관심사
			 CommonExecute myInterest = new command.match.InterestList();
			 myInterest.execute(request);
			 
	         viewPage ="member/member_matchInfo.jsp";
	     
		}else if(gubun.equals("matchInfoUpdate")) {
			 CommonExecute match = new MatchInfoUpdate();
	         match.execute(request);
	         viewPage ="common_alert_view.jsp";
	         
		}else if(gubun.equals("checkNick")) {
		    CommonExecute member = new MemberNickCheck(); // 새 커맨드 생성
		    member.execute(request);
		    response.setContentType("application/json;charset=UTF-8");
		    response.getWriter().print(request.getAttribute("json"));
		    return; // forward 안 함
		    
		} else if(gubun.equals("interestUpdate")) {
			CommonExecute match = new MatchInfoInterestUpdate();
	        match.execute(request);
	         
	        viewPage ="common_alert_view.jsp"; 	
	        
		} else if(gubun.equals("newPassword")) {
			
			viewPage ="member/member_newPassword.jsp";
		} else if(gubun.equals("changePassword")) {
			CommonExecute member = new MemberChangePassword();
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
