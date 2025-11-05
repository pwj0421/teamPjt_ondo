package command.message;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import common.CommonExecute;
import common.CommonUtil;
import dao.MessageDao;
import dto.MessageDto;

public class MessageRoomList implements CommonExecute {

    @Override
    public void execute(HttpServletRequest request) {
        String loginId = CommonUtil.getSessionInfo(request, "id");

        MessageDao dao = new MessageDao();
        List<MessageDto> list = dao.getMessageRoomList(loginId);

        request.setAttribute("r_dto", list);
    }
}
