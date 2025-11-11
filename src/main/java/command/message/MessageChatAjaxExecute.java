package command.message;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import common.CommonExecute;
import dao.MessageChatDao;
import dto.MessageChatDto;

public class MessageChatAjaxExecute implements CommonExecute {
    @Override
    public void execute(HttpServletRequest request) {
        String roomId = request.getParameter("roomId");
        System.out.println("📩 [AJAX] roomId = " + roomId);

        HttpServletResponse response = (HttpServletResponse) request.getAttribute("response"); // ✅ 이렇게 가져오기
        if (response == null) {
            System.out.println("⚠ response 객체 없음 (Dispatcher에서 전달 필요)");
            return;
        }

        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=UTF-8");

        try {
            MessageChatDao dao = new MessageChatDao();
            ArrayList<MessageChatDto> list = dao.getMessageListByRoomId(roomId);

            Gson gson = new Gson();
            String json = gson.toJson(list);

            response.getWriter().print(json);
            System.out.println("✅ 메시지 JSON 전송 완료 (" + list.size() + "건)");

        } catch (IOException e) {
            e.printStackTrace();
            try {
                response.getWriter().print("{\"error\":\"데이터 전송 실패\"}");
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
    }
}
