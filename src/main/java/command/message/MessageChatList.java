package command.message;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import common.CommonExecute;
import dao.MessageChatDao;
import dto.MessageChatDto;

public class MessageChatList implements CommonExecute {

    @Override
    public void execute(HttpServletRequest request) {
        String myId = (String)request.getSession().getAttribute("sessionId"); // 로그인 세션
        MessageChatDao dao = new MessageChatDao();
        List<MessageChatDto> list = dao.getChatRoomList(myId);
        request.setAttribute("r_dto", list);
    }
}
