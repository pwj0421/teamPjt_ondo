package command.message;

import java.io.BufferedReader;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.CommonExecute;
import dao.MessageChatDao;
import dao.MessageDao;

public class MessageSendAjaxExecute implements CommonExecute {

    @Override
    public void execute(HttpServletRequest request) {
        HttpServletResponse response = (HttpServletResponse) request.getAttribute("response");
        response.setContentType("application/json;charset=UTF-8");

        try {
            // 요청 JSON 읽기
            BufferedReader reader = request.getReader();
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) sb.append(line);

            JSONObject json = new JSONObject(sb.toString());
            String roomId = json.getString("roomId");
            String senderId = json.getString("senderId");
            String content = json.getString("content");

            // DB 처리
            MessageChatDao dao = new MessageChatDao();
            MessageDao mdao = new MessageDao();
            String no = Integer.toString(mdao.getNo("message_Id", "ondo_message"));
            int result = dao.insertMessage(no, roomId, senderId, content);

            // 응답 JSON 생성
            JSONObject res = new JSONObject();
            res.put("success", result > 0);

            response.getWriter().print(res.toString());

        } catch (Exception e) {
            e.printStackTrace();
            try {
                response.getWriter().print("{\"success\":false}");
            } catch (Exception ignore) {}
        }
    }
}
