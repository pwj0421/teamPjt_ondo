package command.message;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import common.CommonExecute;
import dao.MessageChatDao;
import dto.MessageChatDto;

public class MessageChatContentExecute implements CommonExecute {
    @Override
    public void execute(HttpServletRequest request) {
        String roomId = null;
        List<?> roomList = (List<?>)request.getAttribute("r_dto");
        if(roomList != null && !roomList.isEmpty()) {
            roomId = ((dto.MessageChatDto)roomList.get(0)).getRoomId();
        }
        if(roomId != null) {
            MessageChatDao dao = new MessageChatDao();
            List<MessageChatDto> msg_dto = dao.getMessageListByRoomId(roomId);
            request.setAttribute("msg_dto", msg_dto);
        }
    }
}
