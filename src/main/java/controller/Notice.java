package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.notice.NoticeDelete;
import command.notice.NoticeList;
import command.notice.NoticeSave;
import command.notice.NoticeUpdate;
import command.notice.NoticeUpdateView;
import command.notice.NoticeView;
import common.CommonExecute;

/**
 * Servlet implementation class Notice
 */
@WebServlet("/Notice")
public class Notice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Notice() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String gubun = request.getParameter("t_gubun");
		
		if(gubun == null) gubun = "list";
		String viewPage ="";
		
		//목록
		if(gubun.equals("list")) {
			CommonExecute noti = new NoticeList();
			noti.execute(request);
			viewPage = "Notice/notice_list.jsp";
			
		//글쓰기
		} else if(gubun.equals("writeForm")) {
		
			viewPage="Notice/notice_write.jsp";

		//저장
		} else if(gubun.equals("save")) {
			CommonExecute noti = new NoticeSave();
			noti.execute(request);
			viewPage = "common_alert.jsp";
	
		//상세보기	
		} else if(gubun.equals("view")) {
			CommonExecute noti = new NoticeView();
			noti.execute(request);
			viewPage = "Notice/notice_view.jsp";
		
		//수정
		} else if(gubun.equals("updateForm")) {
			CommonExecute noti = new NoticeUpdateView();
			noti.execute(request);
			viewPage = "Notice/notice_update.jsp";
			
		//수정저장
		} else if(gubun.equals("update")) {
			CommonExecute noti = new NoticeUpdate();
			noti.execute(request);
			viewPage = "common_alert_view.jsp";
			
		//삭제
		} else if(gubun.equals("delete")) {
			CommonExecute noti = new NoticeDelete();
			noti.execute(request);
			viewPage = "common_alert.jsp";
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
