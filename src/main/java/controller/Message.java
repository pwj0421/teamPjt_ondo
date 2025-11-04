package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import command.message.MessageMyRequest;
import command.message.MessageReceiveList;
import command.message.MessageRequest;
import command.message.RequestStateUpdate;
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

		// 내가 받은 메세지 요청목록
		if(gubun.equals("requestlist")) {
			CommonExecute msgRequest = new MessageReceiveList();
			msgRequest.execute(request);
			
			viewPage = "Message/request_list.jsp";
		
		// 메세지 요청
		} else if(gubun.equals("messageRequest")) {
			 CommonExecute msgRequest = new MessageRequest();
			 msgRequest.execute(request);

		    String result_msg = (String)request.getAttribute("t_msg"); // "전송성공" 또는 "전송실패"
		    response.setContentType("text/plain; charset=UTF-8");
		    response.getWriter().write(result_msg.equals("전송성공") ? "SUCCESS" : "FAIL");
		    return; 
		    
		// 내가 보낸 요청 목록
 		} else if(gubun.equals("myRequest")) {
 			CommonExecute msgRequest = new MessageMyRequest();
			msgRequest.execute(request);
			 
 			viewPage = "Message/my_request.jsp";
	 			
	 			
		// 메세지 목록 > 쪽지함
		} else if(gubun.equals("Messagelist")) {
			viewPage = "Message/message_list.jsp";
			
			
		// 내가 보낸 요청 목록
 		} else if(gubun.equals("stateUpdate")) {
 			CommonExecute state = new RequestStateUpdate();
 			state.execute(request);
			 
 			viewPage = "Message/my_request.jsp";
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
