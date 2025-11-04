package command.message;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import common.CommonUtil;
import dao.MessageDao;
import dto.MessageDto;

public class MessageMyRequest implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		MessageDao dao = new MessageDao();
		
		String myId = CommonUtil.getSessionInfo(request, "id");
		
		ArrayList<MessageDto> dtos = dao.myRequestMessageList(myId);
		
		request.setAttribute("r_dto", dtos);

	}

}
