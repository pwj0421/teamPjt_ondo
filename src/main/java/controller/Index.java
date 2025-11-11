package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse;

import common.CommonExecute;
import command.member.IndexMyProfile;
import command.notice.NoticeIndex;
import command.search.ComuHitList;
import command.search.ComuIndexList;
import command.search.SearchList;

/**
 * Servlet implementation class Index
 */
@WebServlet("/Index")
public class Index extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Index() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//인덱스 공지사항
		CommonExecute execute = new NoticeIndex();
        execute.execute(request); // 공지사항 데이터 가져오기

        //인덱스 자유게시판 인기글
        CommonExecute comuHot = new ComuHitList();
        comuHot.execute(request);
        
        //인덱스 자유게시판 최신글
        CommonExecute comuList = new ComuIndexList();
        comuList.execute(request);
        
        //인덱스 최근 검색어
        CommonExecute serachList = new SearchList();
        serachList.execute(request);
		
        //인덱스 마이프로필
        CommonExecute myProfile = new IndexMyProfile();
        myProfile.execute(request);
        
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
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
