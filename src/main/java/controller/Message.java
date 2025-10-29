package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.notice.NoticeList;
import command.notice.NoticeSave;
import common.CommonExecute;

/**
 * Servlet implementation class Message
 */
@WebServlet("/Message")
public class Message extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Message() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String gubun = request.getParameter("t_gubun");
		
		if(gubun == null) gubun = "requestlist";
		String viewPage = "";
		
		// 메세지 요청목록
		if(gubun.equals("requestlist")) {
	
			viewPage = "Message/request_list.jsp";
		
		// 메세지 요청
		} else if(gubun.equals("messageRequest")) {
			
			
			viewPage = "common_alert.jsp";
		
		// 메세지 목록
		} else if(gubun.equals("Messagelist")) {
			
		} else if(gubun.equals("Messagelist")) {
			viewPage = "Message/message_list.jsp";
			
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
