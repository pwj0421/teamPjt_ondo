package command.message;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.MessageDao;

public class MessageRequest implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		MessageDao dao = new MessageDao();

        String senderId = request.getParameter("sender_id");
        String receiverId = request.getParameter("receiver_id");
        String msg = request.getParameter("greeting_message");

        // DB에 메시지 저장
        int no = dao.getNo("request_id","ondo_message_request");
        int result = dao.saveMessage(Integer.toString(no), senderId, receiverId, msg);
        
        String result_msg = result == 1? "전송성공" : "전송실패";
		
		request.setAttribute("t_msg", result_msg);
		request.setAttribute("t_url", "Match");
		request.setAttribute("t_gubun", "main");
	}

}
