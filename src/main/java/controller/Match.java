package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.match.MatchList;
import command.match.MatchMyInfo;
import common.CommonExecute;

/**
 * Servlet implementation class Match
 */
@WebServlet("/Match")
public class Match extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Match() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String gubun = request.getParameter("t_gubun");
		if(gubun == null) gubun = "main";
		
		String viewPage = "";
		// MATCH MAIN
		if(gubun.equals("main")) {
			// 나의 정보
			CommonExecute myInfo = new MatchMyInfo();
			myInfo.execute(request);
			
			// 관심사 목록
			CommonExecute interestList = new command.member.InterestList();
			interestList.execute(request);
			
			// 나의 관심사
			CommonExecute myInterest = new command.match.InterestList();
			myInterest.execute(request);
			
			viewPage = "match/match_main.jsp";
			
		// MATCH LIST
		} else if(gubun.equals("list")) {
			// 나의 정보
			CommonExecute myInfo = new MatchMyInfo();
			myInfo.execute(request);
			
			// 관심사 목록
			CommonExecute interestList = new command.member.InterestList();
			interestList.execute(request);
			
			// 매치 리스트
			CommonExecute match = new MatchList();
			match.execute(request);
			
			viewPage = "match/match_main.jsp";
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
