package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonExecute;
import command.message.*;

@WebServlet("/Message")
public class Message extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Message() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String gubun = request.getParameter("t_gubun");
        if(gubun == null) gubun = "requestlist";

        String viewPage = "";

        switch(gubun) {
            case "requestlist":
                CommonExecute msgRequest = new MessageReceiveList();
                msgRequest.execute(request);
                viewPage = "Message/request_list.jsp";
                break;

            case "messageRequest":
                CommonExecute msgReq = new MessageRequest();
                msgReq.execute(request);
                String result_msg = (String)request.getAttribute("t_msg"); 
                response.setContentType("text/plain; charset=UTF-8");
                response.getWriter().write(result_msg.equals("전송성공") ? "SUCCESS" : "FAIL");
                return;

            case "myRequest":
                CommonExecute myReq = new MessageMyRequest();
                myReq.execute(request);
                viewPage = "Message/my_request.jsp";
                break;

            case "stateUpdate":
                CommonExecute state = new RequestStateUpdate();
                state.execute(request);
                viewPage = "common_alert_view.jsp";
                break;

            case "requestCancel":
                CommonExecute cancel = new RequestStateCancel();
                cancel.execute(request);
                viewPage = "common_alert_view.jsp";
                break;

            case "Messagelist":
               // CommonExecute msgRoom = new MessageRoomList();
               // msgRoom.execute(request);
                viewPage = "Message/message_list.jsp";
                break;

        }

        RequestDispatcher rd = request.getRequestDispatcher(viewPage);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
