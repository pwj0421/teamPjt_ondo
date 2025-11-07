package command.message;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import common.CommonUtil;
import dao.MessageDao;

public class RequestStateUpdate implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		MessageDao dao = new MessageDao();
		
		String requestId = request.getParameter("requestId");
		String state = request.getParameter("state");
		String locate = request.getParameter("locate");
		String partnerId = request.getParameter("partnerId");
		String greetingMsg = request.getParameter("greetingMsg");
		String myId = CommonUtil.getSessionInfo(request, "id");
		
		String coment="";
		if(state.equals("accepted")) coment="요청이 수락되었습니다! 대화를 나눠보세요!";
		else if(state.equals("rejected")) coment="요청이 거절되었습니다.";
		
		int result_1 = dao.updateRequestState(requestId, state);
		
		int result_3 = 0;
		
		//요청 수락이 정상적으로 이루어진 경우
		if (result_1 == 1 && state.equals("accepted")) {
			//룸 번호 생성
			int no = dao.getNo("room_id","ondo_message_room");
	
			//룸 생성
			int result_2 = dao.createRoom(no, requestId, partnerId, myId);
			//룸 생성 성공 시에 메세지 등록
			if(result_2 == 1) {
				int MsgNo = dao.getNo("message_id","ondo_message");
				result_3 =  dao.insertGreetingMessage(MsgNo, requestId, greetingMsg);
			}	
        }
		
		//전부 실행이 되면 완료
		String msg = result_3 == 1 ? coment : "updateRequestState 실패";
		
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_gubun", locate);
		request.setAttribute("t_url", "Message");
	}

}
