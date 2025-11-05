package command.message;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonExecute;
import dao.MessageDao;
import dto.MessageDto;

public class MessageGetRoomMessages implements CommonExecute {

    @Override
    public void execute(HttpServletRequest request) {
        HttpServletResponse response = (HttpServletResponse) request.getAttribute("response");
        if(response == null) return;

        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = null;

        try {
            out = response.getWriter();
            String roomId = request.getParameter("roomId");
            String loginId = (String) request.getSession().getAttribute("sessionId");

            MessageDao dao = new MessageDao();
            List<MessageDto> messages = dao.getMessagesByRoomId(roomId);

            StringBuilder json = new StringBuilder("[");
            for(int i=0; i<messages.size(); i++) {
                MessageDto dto = messages.get(i);
                json.append("{")
                    .append("\"senderId\":\"").append(dto.getSender_id()).append("\",")
                    .append("\"content\":\"").append(dto.getLastMsg().replace("\"","\\\"")).append("\",")
                    .append("\"time\":\"").append(dto.getLastTime()).append("\"")
                    .append("}");
                if(i < messages.size() - 1) json.append(",");
            }
            json.append("]");

            out.print(json.toString());

        } catch(IOException e) {
            e.printStackTrace();
        } finally {
            if(out != null) out.close();
        }
    }
}
