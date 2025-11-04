package command.message;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.MessageDao;

public class RequestStateUpdate implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		MessageDao dao = new MessageDao();
		
		String requestId = request.getParameter("requestId");
		String state = request.getParameter("state");
		String locate = request.getParameter("locate");
		
		String coment="";
		if(state.equals("accepted")) coment="요청이 수락되었습니다! 대화를 나눠보세요!";
		else if(state.equals("rejected")) coment="요청이 거절되었습니다.";
		
		int result = dao.updateRequestState(requestId, state);
		
		String msg = result == 1 ? coment : "updateRequestState 실패";
		
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_gubun", locate);
		request.setAttribute("t_url", "Message");
	}

}
