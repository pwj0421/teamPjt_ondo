package command.message;

import java.io.PrintWriter;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import common.CommonExecute;
import dao.MessageDao;

public class MessageSend implements CommonExecute {

    @Override
    public void execute(HttpServletRequest request) {
        HttpServletResponse response = (HttpServletResponse) request.getAttribute("response");
        if(response == null) return;

        response.setContentType("text/plain; charset=UTF-8");
        PrintWriter out = null;

        try {
            out = response.getWriter();

            String roomId = request.getParameter("roomId");
            String senderId = request.getParameter("senderId");
            String content = request.getParameter("message");

            MessageDao dao = new MessageDao();
            int result = dao.insertMessage(roomId, senderId, content);

            out.print(result > 0 ? "SUCCESS" : "FAIL");

        } catch(IOException e) {
            e.printStackTrace();
        } finally {
            if(out != null) out.close();
        }
    }
}
