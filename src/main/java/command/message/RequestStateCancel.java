package command.message;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.MessageDao;

public class RequestStateCancel implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		MessageDao dao = new MessageDao();
		
		String requestId = request.getParameter("requestId");
		int result = dao.RequestStateCancel(requestId);

		String msg = result == 1 ? "요청이 취소되었습니다." : "RequestStateCancel 실패";
		
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_gubun", "myRequest");
		request.setAttribute("t_url", "Chat");

	}

}
