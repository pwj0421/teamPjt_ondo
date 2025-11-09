package controller;

import java.io.BufferedReader;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import org.json.JSONObject;

import command.message.*;
import common.CommonExecute;

@WebServlet("/Chat")
public class Chat extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Chat() { super(); }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String gubun = request.getParameter("t_gubun");
        if (gubun == null) gubun = "chatReceived";
        
        request.setAttribute("response", response);

        String viewPage = "";
        String menuTap = "chatReceived";

        switch(gubun) {
        case "chatReceived":  //내가 받은 요청 리스트
            CommonExecute msgRequest = new MessageReceiveList();
            msgRequest.execute(request);
            menuTap = "chatReceived";
            viewPage = "Message/message_received.jsp";
            break;

        case "myRequest": //내가 보낸 요청 리스트
            CommonExecute myReq = new MessageMyRequest();
            myReq.execute(request);
            menuTap = "myRequest";
            viewPage = "Message/message_sent.jsp";
            break;

        case "MessageList": //대화방 목록
            CommonExecute msgRoom = new MessageChatList();
            msgRoom.execute(request);

            Object rObj = request.getAttribute("r_dto");
            if (rObj != null) {
                @SuppressWarnings("unchecked")
                java.util.List<?> rList = (java.util.List<?>) rObj;
                if (!rList.isEmpty()) {
                    String firstRoomId = ((dto.MessageChatDto) rList.get(0)).getRoomId();
                    request.setAttribute("roomId", firstRoomId);

                    CommonExecute chatContent = new MessageChatContentExecute();
                    chatContent.execute(request);
                }
            }
            
            menuTap = "MessageList";
            viewPage = "Message/message_chat.jsp";
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
            
        case "messageChatAjax":
            CommonExecute ajax = new MessageChatAjaxExecute();
            ajax.execute(request);
            return; // AJAX 응답만 주고 JSP로 forward 안 함
        case "sendMessageAjax":
            CommonExecute sendMsg = new MessageSendAjaxExecute();
            sendMsg.execute(request);
            return;
        }

        request.setAttribute("menuTap", menuTap);  
        RequestDispatcher rd = request.getRequestDispatcher(viewPage);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
